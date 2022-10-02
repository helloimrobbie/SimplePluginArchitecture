program RxPluginLoader;

uses
  Vcl.Forms,
  MainUnit in 'Forms\MainUnit.pas' {Form1},
  RxPlugin in '..\Lib\RxPlugin.pas',
  RxPluginMng in 'Lib\RxPluginMng.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
