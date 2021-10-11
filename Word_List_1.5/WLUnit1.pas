unit WLUnit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, StrHlder, Menus, ComCtrls, ExtCtrls, ImgList, registry, XPMan, Placemnt;

type
  TForm1 = class(TForm)
    SH: TStrHolder;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    WordWrap1: TMenuItem;
    Save1: TMenuItem;
    close1: TMenuItem;
    Open1: TMenuItem;
    StatusBar1: TStatusBar;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Timer: TTimer;
    N1: TMenuItem;
    ImageList1: TImageList;
    New1: TMenuItem;
    N2: TMenuItem;
    Font1: TMenuItem;
    FontDialog1: TFontDialog;
    Font2: TMenuItem;
    FontDialog2: TFontDialog;
    List1: TMenuItem;
    predtext: TMenuItem;
    params: TMenuItem;
    FileSaveAs: TMenuItem;
    FormPlacement1: TFormPlacement;
    memo1: TRichEdit;
    XPManifest1: TXPManifest;
    N3: TMenuItem;
    Memo2: TMemo;
    N4: TMenuItem;
    Panel1: TPanel;
    procedure fillwords(text:string);
    procedure showlist(str:string);
    procedure Memo1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure SetFileName(const FileName: String);
    procedure TimerTimer(Sender: TObject);
    procedure close1Click(Sender: TObject);
    procedure CheckFileSave;
    procedure WordWrap1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure Font2Click(Sender: TObject);
    procedure predtextClick(Sender: TObject);
    procedure paramsClick(Sender: TObject);
    procedure FileSaveAsClick(Sender: TObject);
    procedure SetModified(Value: Boolean);
    procedure memo1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetRU;
    procedure loadsettings;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure memo1SelectionChange(Sender: TObject);
    procedure memo1KeyPress(Sender: TObject; var Key: Char);
    procedure memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure WLBEnter(Sender: TObject);
    procedure memo1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  wrd: string;
  FFileName: string;
  updownkey,stopflag: boolean;
  oldxin,oldyin,oldxout,oldyout: integer;
  drag: boolean;

const
  sUntitled: string = 'Безымянный';


implementation

uses WLUnit2, WLUnit3, WLUnit4, WLUnit5;

{$R *.DFM}

procedure TForm1.loadsettings;
var regini:TReginiFile;
begin
  regini:=TreginiFile.create;
  regini.rootkey:=HKEY_CURRENT_USER;
  regini.openkey('Software\TopSoft',true);

  form3.time2showTB.position:=regini.readinteger('wordlist','timer',500);
  timer.interval:=form3.time2showTB.position;

  form3.length2showTB.position:=regini.readinteger('wordlist','length2show',3);
  form3.length2addTB.position:=regini.readinteger('wordlist','length2add',4);

  form2.predtextEdit.Text:=regini.readstring('wordlist','predtext','');

  FontDialog1.Font.Name:=regini.readstring('wordlist','font1name','Tahoma');
  FontDialog2.Font.Name:=regini.readstring('wordlist','font2name','Tahoma');
  FontDialog1.Font.size:=regini.readinteger('wordlist','font1size',10);
  FontDialog2.Font.size:=regini.readinteger('wordlist','font2size',10);
  FontDialog1.Font.Color:=regini.readinteger('wordlist','font1color',clBlack);
  FontDialog2.Font.Color:=regini.readinteger('wordlist','font2color',clBlack);
  memo1.font:=FontDialog1.font;
  WLBForm.WLB.font:=FontDialog2.font;
  form3.RussCB.Checked:=regini.Readbool('wordlist','autoruss',true);
  form3.CheckCB.Checked:=regini.Readbool('wordlist','checkexit',true);
  memo1.WordWrap:=regini.Readbool('wordlist','wordwrap',true);
  form3.Rlist.Text:=regini.readstring('wordlist','Rlist','.,":()');
  WLBForm.Width:=regini.readinteger('wordlist','WLBwidth',200);
  WLBForm.height:=regini.readinteger('wordlist','WLBheight',70);
  form3.SpinEdit1.Value:=regini.readinteger('wordlist','MainWinColor',clWhite);
  form3.SpinEdit2.Value:=regini.readinteger('wordlist','WLBColor',clWhite);

  regini.free;

  if memo1.WordWrap then WordWrap1.Checked:=true;
  if form3.RussCB.Checked then setRu;
  fillwords(form2.predtextEdit.text);
  memo1.Modified:=false;
  SetModified(false);
  StatusBar1.Panels[0].Text := Format('Строка: %3d     Столбец: %3d', [memo1.CaretPos.y+1,memo1.CaretPos.x+1]);
  memo1.color:=form3.SpinEdit1.Value;
  WLBform.WLB.color:=form3.SpinEdit2.Value;
  WLBform.color:=form3.SpinEdit2.Value;
  form3.SpinEdit2.Color:=form3.SpinEdit2.Value;
  form3.SpinEdit1.Color:=form3.SpinEdit1.Value;
end;

procedure savesettings;
var regini:TReginiFile;
begin
  regini:=TreginiFile.create;
  regini.rootkey:=HKEY_CURRENT_USER;
  regini.openkey('Software\TopSoft',true);

  regini.writeinteger('wordlist','timer',form3.time2showTB.position);
  regini.writeinteger('wordlist','length2show',form3.length2showTB.position);
  regini.writeinteger('wordlist','length2add',form3.length2addTB.position);
  regini.writestring('wordlist','predtext',form2.predtextEdit.Text);
  regini.writestring('wordlist','font1name',form1.FontDialog1.Font.Name);
  regini.writestring('wordlist','font2name',form1.FontDialog2.Font.Name);
  regini.writeinteger('wordlist','font1size',form1.FontDialog1.Font.size);
  regini.writeinteger('wordlist','font2size',form1.FontDialog2.Font.size);
  regini.writeinteger('wordlist','font1color',form1.FontDialog1.Font.color);
  regini.writeinteger('wordlist','font2color',form1.FontDialog2.Font.color);
  regini.writeBool('wordlist','autoruss',form3.RussCB.Checked);
  regini.writeBool('wordlist','checkexit',form3.CheckCB.Checked);
  regini.writeBool('wordlist','wordwrap',form1.memo1.WordWrap);
  regini.writestring('wordlist','Rlist',form3.Rlist.Text);
  regini.writeinteger('wordlist','WLBwidth',WLBForm.Width);
  regini.writeinteger('wordlist','WLBheight',WLBForm.height);
  regini.writeinteger('wordlist','MainWinColor',form3.SpinEdit1.Value);
  regini.writeinteger('wordlist','WLBColor',form3.SpinEdit2.Value);

  regini.free;
end;

procedure TForm1.SetRU;
var
Layout: array[0.. KL_NAMELENGTH] of char;
begin
LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
end;

function repchar(text:string;c:char;ins:string):string;
var
  i:integer;
  a,b:string;
  flag:boolean;

begin
  repeat
    flag:=false;
    for i:=1 to length(text)do if text[i]=c then begin
      a:=copy(text,1,i-1);
      b:=copy(text,i+1,length(text)-i+2);
      text:=a+ins+b;
      flag:=true;
      break;
    end;
  until not flag;
  result:=text;
end;

procedure TForm1.fillwords(text:string);
var
  i,st,en:integer;
  inword:boolean;
  tmp:string;
begin
  st:=0;
  text:=repchar(text, #13, ' ');
  for i:=1 to length(form3.Rlist.Text) do text:=repchar(text, form3.Rlist.Text[i], ' ');
  text:=repchar(text, #10, '');
  text:=' '+text+' ';
  inword:=false;
  for i:=1 to length(text) do if(text[i]=' ') then
    if not inword then begin
      st:=i+1;
      inword:=true;
    end else begin
      en:=i;
      tmp:=copy(text,st,en-st);
      if (tmp<>'')and(length(tmp)>=form3.length2addTB.Position) then SH.strings.Add(tmp);
      inword:=true;
      st:=i+1;
    end;
end;

function getword(M:TRichEdit):string;
var
  i:integer;
  str:string;
begin
  str:=' '+m.Lines.Strings[m.CaretPos.y];
  for i:=m.CaretPos.x downto 1 do begin
   if str[i]=' ' then begin
     result:=copy(m.Lines.Strings[m.CaretPos.y],i,m.CaretPos.x-i+1);
     break;
   end;
  end;
end;

procedure TForm1.showlist(str:string);
var
  i,x,y:integer;
  pos:DWord;
begin
  WLBForm.WLB.Clear;
  for i:=0 to SH.Strings.Count-1 do begin
    if(copy(SH.Strings.Strings[i],1,length(str))=str)and(length(SH.Strings.Strings[i])>length(str)) then WLBForm.WLB.Items.add(SH.Strings.Strings[i]);
  end;

  if WLBForm.WLB.items.Count>0 then begin

    pos:=Memo1.Perform( EM_POSFROMCHAR,WPARAM(memo1.SelStart),0);
    x:=LoWord(pos)+10;
    y:=HiWord(pos)+form1.height-panel1.height;

    if form1.Left+x+WLBForm.WLB.Width+10>screen.Width then x:=screen.width-WLBForm.WLB.Width-Form1.left-10;
    if form1.top+y+WLBForm.WLB.height+120>screen.height then y:=y-WLBForm.WLB.height-30;{ 95 }

    WLBForm.left:=x+form1.left;
    WLBForm.top:=y+form1.top;
    WLBForm.WLB.ItemIndex:=0;

  end else WLBform.top:=9999;

end;

procedure TForm1.memo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  timer.Enabled:=false;
  stopflag := true;
  if(key=vk_down)or(key=vk_up)then updownkey:=true else updownkey:=false;

  if(key=vk_up)and(WLBform.top<9999)then begin
    if WLBform.WLB.ItemIndex>0 then WLBform.WLB.ItemIndex:=WLBform.WLB.ItemIndex-1;
    key:=0;
  end;
  if(key=vk_down)and(WLBform.top<9999)then begin
    WLBform.WLB.ItemIndex:=WLBform.WLB.ItemIndex+1;
    key:=0;
  end;
  if key=vk_F1 then begin
    SH.Clear;
    fillwords(Memo1.text);
    fillwords(form2.predtextEdit.Text);
  end;

end;

procedure TForm1.memo1KeyPress(Sender: TObject; var Key: Char);
var
  ins,buf:string;
  pos:integer;

begin
  if(key=#13)and(WLBform.top<9999)then begin
    pos:=memo1.SelStart;
    buf:=memo1.lines.Strings[memo1.CaretPos.y];
    ins:=copy(WLBform.WLB.Items.Strings[WLBform.WLB.itemindex],length(wrd)+1,99999);
    memo1.lines.Strings[memo1.CaretPos.y]:=copy(buf,1,memo1.CaretPos.x)+ins+copy(buf,memo1.CaretPos.x+1,99999);
    memo1.SelStart:=pos+length(ins);
    key:=#0;
  end;
  stopflag:=not( (key in ['!'..'~'])or(key in ['ё'..'я']) );
end;

procedure TForm1.Memo1KeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin

  if(key=32)or(key=13)then begin
    SH.Clear;
    fillwords(Memo1.text);
    fillwords(form2.predtextEdit.Text);
  end else if memo1.Lines.Strings[memo1.CaretPos.y]<>'' then wrd:=getword(memo1) else begin WLBform.top:=9999; exit; end;

  if updownkey and (WLBform.top<9999) then exit;
  if memo1.SelLength>0 then begin WLBform.top:=9999; exit; end;
  if stopflag then begin stopflag:=false; WLBform.top:=9999; exit; end;
  if memo1.Text='' then exit;

  IF((memo1.Lines.Strings[memo1.CaretPos.y][memo1.CaretPos.x+1]='')or((memo1.Lines.Strings[memo1.CaretPos.y][memo1.CaretPos.x+1]=' ')))and
    (key<>32)and(LENGTH(wrd)>=form3.length2showTB.Position)then if form3.time2showTB.Position>2 then timer.enabled:=true else showlist(wrd);
end;

procedure TForm1.TimerTimer(Sender: TObject);
begin
  timer.Enabled:=false;
  showlist(wrd);
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
  if form3.CheckCB.Checked then CheckFileSave;
  if OpenDialog1.Execute then begin
    memo1.Lines.LoadFromFile(OpenDialog1.filename);
    SetFileName(OpenDialog1.filename);
    SH.Clear;
    fillwords(form2.predtextEdit.Text);
    fillwords(memo1.text);
    memo1.Modified:=false;
    SetModified(false);
  end;
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
  if FFileName = sUntitled then
    FileSaveAsClick(Sender)
  else
  begin
    memo1.WordWrap:=false;
    memo2.Lines:=memo1.Lines;
    memo2.Lines.SaveToFile(FFileName);
    memo1.Modified := False;
    memo1.WordWrap:=WordWrap1.Checked;    
    SetModified(False);
  end;
end;

procedure TForm1.close1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.WordWrap1Click(Sender: TObject);
begin
  if WordWrap1.Checked then memo1.WordWrap:=false else memo1.WordWrap:=true;
  WordWrap1.Checked:=not WordWrap1.Checked;
end;

procedure TForm1.New1Click(Sender: TObject);
begin
  if form3.CheckCB.Checked then CheckFileSave;
  SetFileName(sUntitled);
  Memo1.Clear;
  memo1.Modified:=false;
  SetModified(false);
end;

procedure TForm1.Font1Click(Sender: TObject);
begin
  if FontDialog1.Execute then memo1.Font:=FontDialog1.Font;
end;

procedure TForm1.Font2Click(Sender: TObject);
begin
  if FontDialog2.Execute then WLBform.WLB.font:=FontDialog2.Font;
end;

procedure TForm1.predtextClick(Sender: TObject);
begin
  form2.showmodal;
end;

procedure TForm1.paramsClick(Sender: TObject);
begin
  form3.showmodal;
end;

procedure TForm1.FileSaveAsClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName) then
      if MessageDlg(Format('OK для перезаписи %s', [SaveDialog1.FileName]),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    memo1.WordWrap:=false;
    memo2.Lines:=memo1.Lines;
    memo2.Lines.SaveToFile(SaveDialog1.FileName);
    SetFileName(SaveDialog1.FileName);
    memo1.Modified := False;
    memo1.WordWrap:=WordWrap1.Checked;
    SetModified(False);
  end;
end;

procedure TForm1.SetModified(Value: Boolean);
begin
  if Value then StatusBar1.Panels[1].Text := 'Изменён'
  else StatusBar1.Panels[1].Text := '';
end;

procedure TForm1.memo1Change(Sender: TObject);
begin
  SetModified(memo1.Modified);
end;

procedure TForm1.SetFileName(const FileName: String);
begin
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SetFileName(sUntitled);
end;

procedure TForm1.CheckFileSave;
var
  SaveResp: Integer;
begin
  if not memo1.Modified then Exit;
  SaveResp := MessageDlg(Format('Сохранить изменения %s?', [FFileName]),
    mtConfirmation, mbYesNoCancel, 0);
  case SaveResp of
    idYes: Save1Click(Self);
    idNo: {Nothing};
    idCancel: Abort;
  end;
end;


procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  try
    if form3.CheckCB.Checked then CheckFileSave;
    savesettings;
  except
    CanClose := False;
  end;
end;

procedure TForm1.memo1SelectionChange(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := Format('Строка: %3d     Столбец: %3d', [memo1.CaretPos.y+1, memo1.CaretPos.x+1]);
end;

procedure TForm1.WLBEnter(Sender: TObject);
begin
  memo1.SetFocus;
end;

procedure TForm1.memo1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  WLBform.top:=9999;
end;

procedure TForm1.FormShow(Sender: TObject);
var str:string;
    i:integer;
begin
  loadsettings;
  str:='';
  for i:=1 to paramcount do str:=str+paramstr(i)+' ';
  if(paramcount>0)and(fileexists(str)) then begin
    memo1.Lines.LoadFromFile(str);
    SetFileName(str);
    SH.Clear;
    fillwords(form2.predtextEdit.Text);
    fillwords(memo1.text);
    memo1.Modified:=false;
    SetModified(false);
  end;
end;

procedure TForm1.N4Click(Sender: TObject);
var i:integer;
begin
  shform.SHListBox.clear;
  for i:=0 to sh.Strings.Count-1 do shform.SHListBox.Items.add(sh.Strings.Strings[i]);
  shform.showmodal;
end;

end.
