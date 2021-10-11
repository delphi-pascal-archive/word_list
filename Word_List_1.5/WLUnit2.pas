unit WLUnit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    predtextEdit: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure predtextEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses WLUnit1;

{$R *.DFM}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form1.SH.Clear;
  form1.fillwords(form2.predtextEdit.text);
  form1.fillwords(form1.memo1.text);
end;

procedure TForm2.predtextEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then close;
end;

end.

