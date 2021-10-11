unit WLUnit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSHform = class(TForm)
    SHListBox: TListBox;
    procedure SHListBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SHform: TSHform;

implementation

{$R *.dfm}

procedure TSHform.SHListBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_Escape then close;
end;

end.
