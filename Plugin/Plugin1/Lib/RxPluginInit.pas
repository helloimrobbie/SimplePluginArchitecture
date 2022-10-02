unit RxPluginInit;

interface
  uses RxPlugin,System.Classes,Windows;

  const
    RxPlgAuthor      = 'Author Name';
    RxPlgName        = 'Simple Test PlugIn';
    RxPlgDescription = 'Simple Test, PlugIn';
    RxPlgVersion     = '1.0';

  type TRxPlugin = class(TRxPluginClass,IRxPlugin)
    public
      Constructor Create(AOwner:TComponent);
      Destructor Destroy;
      procedure Execute;
      function GetAuthor: String;
      function GetName: String;
      function GetDescription: String;
      function GetVersion: String;
  end;
implementation

{ TRxPlugin }

constructor TRxPlugin.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
end;

destructor TRxPlugin.Destroy;
begin

end;

procedure TRxPlugin.Execute;
begin
  MessageBox(0,'Test Plug','Rx PlugIn',MB_OK);
end;

function TRxPlugin.GetAuthor: String;
begin
  Result := RxPlgAuthor;
end;

function TRxPlugin.GetDescription: String;
begin
  Result := RxPlgDescription;
end;

function TRxPlugin.GetName: String;
begin
  Result := RxPlgName;
end;

function TRxPlugin.GetVersion: String;
begin
  Result := RxPlgVersion;
end;

end.
