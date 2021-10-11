unit WLUnit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TWLBForm = class(TForm)
    WLB: TListBox;
    procedure FormShow(Sender: TObject);
    procedure WLBMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WLBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WLBForm: TWLBForm;

implementation

uses WLUnit1;

{$R *.dfm}

procedure TWLBForm.FormShow(Sender: TObject);
var NewStyle:longint;
begin
 NewStyle:=0;
 NewStyle:= NewStyle or LongInt(TObject($40000));
 NewStyle:= NewStyle or LongInt(TObject($10000000));
 SetWindowLong(self.handle, GWL_STYLE, NewStyle);
 SetWindowPos(self.handle, 0, WLBform.Left,WLBform.Top, WLBform.Width, WLBform.Height, SWP_FRAMECHANGED);
end;

procedure TWLBForm.WLBMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if form1.Enabled and form1.Visible then form1.memo1.setfocus;
end;

procedure TWLBForm.WLBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  form1.memo1.setfocus;
  Keybd_Event(key,MapVirtualKey(key,0), 0, 0);
  Keybd_Event(key,MapVirtualKey(key,0), KEYEVENTF_KEYUP, 0);
end;

end.
