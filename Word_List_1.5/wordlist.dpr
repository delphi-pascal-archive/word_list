program wordlist;

uses
  Forms,
  WLUnit1 in 'WLUnit1.pas' {Form1},
  WLUnit2 in 'WLUnit2.pas' {Form2},
  WLUnit3 in 'WLUnit3.pas' {Form3},
  WLUnit4 in 'WLUnit4.pas' {SHform},
  WLUnit5 in 'WLUnit5.pas' {WLBForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.title:='WordList v1.5 [TopSoft]';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TSHform, SHform);
  Application.CreateForm(TWLBForm, WLBForm);
  Application.Run;
end.

