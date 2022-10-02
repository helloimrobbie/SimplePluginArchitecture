unit RxPlugin;

interface

  uses System.Classes;

  type TRxPluginClass = class(TComponent);
  type TRxPluginProc = function(AOwner: TComponent):TRxPluginClass; stdcall;
  type IRxPlugin = interface
  ['{45FFCD70-4F83-4E6A-8649-24F197919FD1}']
   procedure Execute;
   function GetAuthor: String;
   function GetName: String;
   function GetDescription: String;
   function GetVersion: String;
  end;

implementation

end.
