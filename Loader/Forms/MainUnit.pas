unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RxPluginMng,RxPlugin, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  RxPlugIn: IRxPlugin;
  isloaded : Boolean;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  RxPluginManager : TRxPluginManager;
begin
  RxPluginManager := TRxPluginManager.Create(nil);
  isloaded := RxPluginManager.Load('SamplePlugIn.RxPlg', IRxPlugIn, RxPlugIn);

  if isloaded = True then
  begin
    ListBox1.Items.Add( RxPlugIn.GetAuthor );
    ListBox1.Items.Add( RxPlugIn.GetName );
    ListBox1.Items.Add( RxPlugIn.GetDescription );
    ListBox1.Items.Add( RxPlugIn.GetVersion );
    ListBox1.Items.Add( InttoHex( DWORD(@RxPlugIn.Execute) ,8) );
    RxPlugIn.Execute;
  end;
end;

end.
