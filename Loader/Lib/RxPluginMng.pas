unit RxPluginMng;

interface
  uses System.classes,RxPlugin,WinAPI.Windows,SysUtils;

  type TRxPluginStruct = packed record
    RxClasses   : TRxPluginClass;
    GUID        : TGUID;
    Handle      : THandle;
    RxInterface : Pointer;
    FileName    : String;
  end;
  PRxPluginStruct = ^TRxPluginStruct;

  type TRxPluginManager = class(TComponent)
    private
      FPluginList : TList;
      FOwner : TComponent;
    public
      Constructor Create(AOwner:TComponent);
      Destructor Destroy;
      function Load(const AFileName: String; PlugInGUID : TGUID; out RxPluginIntf):Boolean;
      function UnLoad(var RxPluginIntf):Boolean;

  end;

var
PlugInStruct : PRxPluginStruct;

implementation

{ TRxPluginManager }

constructor TRxPluginManager.Create(AOwner:TComponent);
begin
  Inherited Create(AOwner);
  FOwner := AOwner;
  FPluginList := TList.Create;
end;

destructor TRxPluginManager.Destroy;
begin
  FPluginList.Free;
  inherited;
end;

function TRxPluginManager.Load(const AFileName: String; PlugInGUID: TGUID;
  out RxPluginIntf): Boolean;
var
 dll : THandle;
 RegProc : Pointer;
 PlugInProc : TRxPluginProc;
 PlugInClass : TRxPluginClass;
begin
  result := False;

  try
    dll := LoadLibrary( PWideChar( ExtractFilePath( GetModuleName ( hInstance) ) + AFileName));
    if dll <> 0 then
    begin
      RegProc := GetProcAddress(dll,'RegisterRxPlugIn');
      if RegProc <> nil then
      begin
        @PlugInProc := RegProc;

        PlugInClass := TRxPluginClass( PlugInProc(FOwner) ); // Create Instance Call;

        if Assigned(PlugInClass) then
        begin
          if PlugInclass.GetInterface(PlugInGUID, RxPluginIntf) then
          begin
            New(PlugInStruct);
            PlugInStruct^.RxClasses := PlugInClass;
            PlugInStruct^.GUID := PlugInGUID;
            PlugInStruct^.Handle := dll;
            PlugInStruct^.RxInterface := Pointer(RxPluginIntf);
            PlugInStruct^.FileName := AFileName;
            FPluginList.Add(PlugInStruct);
            result := true;
          end;

        end;

      end;
    end;
  except
    if dll <> 0 then FreeLibrary(dll);
  end;
end;

function TRxPluginManager.UnLoad(var RxPluginIntf): Boolean;
begin

end;

end.
