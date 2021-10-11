unit WLUnit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Spin;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    RussCB: TCheckBox;
    Label1: TLabel;
    CheckCB: TCheckBox;
    GroupBox4: TGroupBox;
    Rlist: TEdit;
    GroupBox2: TGroupBox;
    length2showTB: TTrackBar;
    length2showLabel: TLabel;
    time2showTB: TTrackBar;
    time2showLabel: TLabel;
    GroupBox3: TGroupBox;
    length2addTB: TTrackBar;
    length2addLabel: TLabel;
    Button2: TButton;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    CD1: TColorDialog;
    CD2: TColorDialog;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure length2showTBChange(Sender: TObject);
    procedure time2showTBChange(Sender: TObject);
    procedure length2addTBChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit1DblClick(Sender: TObject);
    procedure SpinEdit2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  hnt:THintWindow;

implementation

uses WLUnit1, WLUnit5;

{$R *.DFM}

procedure TForm3.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form1.timer.interval:=length2showTB.Position;
end;

procedure TForm3.length2showTBChange(Sender: TObject);
begin
  length2showLabel.Caption:=inttostr(length2showTB.Position);
end;

procedure TForm3.time2showTBChange(Sender: TObject);
begin
  if time2showTB.Position>1 then time2showLabel.Caption:=copy(floattostr(time2showTB.Position/1000),1,5)
  else time2showLabel.Caption:='Нет';
end;

procedure TForm3.length2addTBChange(Sender: TObject);
begin
  length2addLabel.Caption:=inttostr(length2addTB.Position);
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Rlist.Text:='.,":()';
end;

procedure TForm3.SpinEdit1Change(Sender: TObject);
begin
  if SpinEdit1.Text='' then exit;
  form1.memo1.color:=SpinEdit1.Value;
  SpinEdit1.Color:=SpinEdit1.Value;
end;

procedure TForm3.SpinEdit2Change(Sender: TObject);
begin
  if SpinEdit2.Text='' then exit;
  WLBform.WLB.color:=SpinEdit2.Value;
  WLBform.color:=SpinEdit2.Value;
  SpinEdit2.Color:=SpinEdit2.Value;
end;

procedure TForm3.SpinEdit1DblClick(Sender: TObject);
begin
  CD1.Color:=SpinEdit1.Value;
  if CD1.Execute then SpinEdit1.Value:=CD1.Color;
end;

procedure TForm3.SpinEdit2DblClick(Sender: TObject);
begin
  CD2.Color:=SpinEdit2.Value;
  if CD2.Execute then SpinEdit2.Value:=CD2.Color;
end;

end.

