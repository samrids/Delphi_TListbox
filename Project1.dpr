program Project1;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form2},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Emerald');
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
