unit lform_class;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Types, LMessages, LCLType;


const
  EVT_Null                  = 0;
  EVT_FormActivate          = 1;
  EVT_FormChangeBounds      = 2;
  EVT_FormClick             = 3;
  EVT_FormClose             = 4;
  EVT_FormCloseQuery        = 5;
  EVT_FormContextPopup      = 6;
  EVT_FormDblClick          = 7;
  EVT_FormDeactivate        = 8;
  EVT_FormDockDrop          = 10;
  EVT_FormDockOver          = 11;
  EVT_FormDragDrop          = 12;
  EVT_FormDragOver          = 13;
  EVT_FormDropFiles         = 14;
  EVT_FormEndDock           = 15;
  EVT_FormGetSiteInfo       = 16;
  EVT_FormHelp              = 17;
  EVT_FormHide              = 18;
  EVT_FormKeyDown           = 19;
  EVT_FormKeyPress          = 20;
  EVT_FormKeyUp             = 21;
  EVT_FormMouseDown         = 22;
  EVT_FormMouseEnter        = 23;
  EVT_FormMouseLeave        = 24;
  EVT_FormMouseMove         = 25;
  EVT_FormMouseUp           = 26;
  EVT_FormMouseWheel        = 27;
  EVT_FormMouseWheelDown    = 28;
  EVT_FormMouseWheelUp      = 29;
  EVT_FormResize            = 30;
  EVT_FormShortCut          = 31;
  EVT_FormShow              = 32;
  EVT_FormShowHint          = 33;
  EVT_FormStartDock         = 34;
  EVT_FormUnDock            = 35;
  EVT_FormUTF8KeyPress      = 36;
  EVT_FormWindowStateChange = 37;
  EVT_FormPaint             = 38;


type

  { TEvent }

  TEvent = class(TObject)
    private
     Evt: byte;
     Args: TList;
    public
     constructor Create(EvType:byte);
     destructor Destroy; override;
     procedure PushArg(v:variant);
     function GetArg(indx:byte):variant;
     function ArgCount:byte;
     function GetEvType:byte;
  end;

  { TEventQueue }

  TEventQueue = class(TThreadList)
    public
      constructor Create;
      destructor Destroy; override;
      procedure PushEvent(Ev:TEvent);
      function GetEvent:TEvent;
      function CountEvents:cardinal;
  end;

  { TLForm }

  TLForm = class(TForm)
    procedure FormActivate(Sender: TObject);
    procedure FormChangeBounds(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure FormEndDock(Sender, Target: TObject; X, Y: Integer);
    procedure FormGetSiteInfo(Sender: TObject; DockClient: TControl;
      var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
    function FormHelp(Command: Word; Data: PtrInt; var CallHelp: Boolean
      ): Boolean;
    procedure FormHide(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseEnter(Sender: TObject);
    procedure FormMouseLeave(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShortCut(var Msg: TLMKey; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormShowHint(Sender: TObject; HintInfo: PHintInfo);
    procedure FormStartDock(Sender: TObject; var DragObject: TDragDockObject);
    procedure FormUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure FormUTF8KeyPress(Sender: TObject; var UTF8Key: TUTF8Char);
    procedure FormWindowStateChange(Sender: TObject);
  private
    { private declarations }
  public
    CanCloseForm:boolean;
    EventQueue:TEventQueue;
    LastEvent:TEvent;
  end;

var
  LForm: TLForm;

{$R *.lfm}

implementation

{ TEvent }

constructor TEvent.Create(EvType:byte);
begin
  Self.Evt := EvType;
  Self.Args := TList.Create;
  inherited Create;
end;

destructor TEvent.Destroy;
begin
  while Self.Args.Count > 0 do
   begin
     Dispose(PVariant(Self.Args[0]));
     Self.Args.Delete(0);
   end;
  FreeAndNil(Self.Args);
  inherited;
end;

procedure TEvent.PushArg(v:variant);
var
  pv:PVariant;
begin
  new(pv);
  pv^ := v;
  Self.Args.Add(pv);
end;

function TEvent.GetArg(indx:byte):variant;
begin
  Result := PVariant(Self.Args[indx])^;
end;

function TEvent.ArgCount:byte;
begin
  Result := Self.Args.Count;
end;

function TEvent.GetEvType:byte;
begin
  Result := Self.Evt;
end;

{ TEventQueue }

constructor TEventQueue.Create;
begin
  inherited;
end;

destructor TEventQueue.Destroy;
var
  TempEv: TEvent;
begin
  with Self.LockList do
   try
     while Count > 0 do
      begin
        TempEv := TEvent(Items[0]);
        FreeAndNil(TempEv);
        Delete(0);
      end;
   finally
     Self.UnlockList;
   end;
  inherited;
end;

procedure TEventQueue.PushEvent(Ev:TEvent);
begin
  with Self.LockList do
   try
     Add(Ev);
   finally
     Self.UnlockList;
   end;
end;

function TEventQueue.GetEvent:TEvent;
begin
  with Self.LockList do
   try
     Result := TEvent(Items[0]);
     Delete(0);
   finally
     Self.UnlockList;
   end;
end;

function TEventQueue.CountEvents:cardinal;
begin
  with Self.LockList do
   try
     Result := Count;
   finally
     Self.UnlockList;
   end;
end;

{ TLForm }

procedure TLForm.FormActivate(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(1);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormChangeBounds(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(2);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormClick(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(3);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(4);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(5);
  CanClose := CanCloseForm;
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(6);
  Ev.PushArg(MousePos.x);
  Ev.PushArg(MousePos.y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormCreate(Sender: TObject);
begin
  CanCloseForm := True;
  EventQueue := TEventQueue.Create;
  LastEvent := nil;
end;

procedure TLForm.FormDblClick(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(7);
  Ev.PushArg(Mouse.CursorPos.x);
  Ev.PushArg(Mouse.CursorPos.y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormDeactivate(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(8);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(EventQueue);
end;

procedure TLForm.FormDockDrop(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(10);
  Ev.PushArg(x);
  Ev.PushArg(y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormDockOver(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(11);
  Ev.PushArg(x);
  Ev.PushArg(y);
  Ev.PushArg(State);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(12);
  Ev.PushArg(x);
  Ev.PushArg(y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(13);
  Ev.PushArg(x);
  Ev.PushArg(y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormDropFiles(Sender: TObject;
  const FileNames: array of String);
var
  Ev:TEvent;
  i:integer;
begin
  Ev := TEvent.Create(14);
  for i := 0 to length(FileNames)-1 do
   Ev.PushArg(FileNames[i]);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormEndDock(Sender, Target: TObject; X, Y: Integer);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(15);
  Ev.PushArg(x);
  Ev.PushArg(y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormGetSiteInfo(Sender: TObject; DockClient: TControl;
  var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(16);
  Ev.PushArg(MousePos.x);
  Ev.PushArg(MousePos.y);
  EventQueue.PushEvent(Ev);
end;

function TLForm.FormHelp(Command: Word; Data: PtrInt; var CallHelp: Boolean): Boolean;
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(17);
  Result := true;
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormHide(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(18);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(19);
  Ev.PushArg(Key);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormKeyPress(Sender: TObject; var Key: char);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(20);
  Ev.PushArg(Key);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(21);
  Ev.PushArg(Key);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(22);
  Ev.PushArg(Button);
  Ev.PushArg(x);
  Ev.PushArg(y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormMouseEnter(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(23);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormMouseLeave(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(24);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(25);
  Ev.PushArg(x);
  Ev.PushArg(y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(26);
  Ev.PushArg(Button);
  Ev.PushArg(x);
  Ev.PushArg(y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(27);
  Ev.PushArg(WheelDelta);
  Ev.PushArg(MousePos.x);
  Ev.PushArg(MousePos.y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(28);
  Ev.PushArg(MousePos.x);
  Ev.PushArg(MousePos.y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(29);
  Ev.PushArg(MousePos.x);
  Ev.PushArg(MousePos.y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormResize(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(30);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormShortCut(var Msg: TLMKey; var Handled: Boolean);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(31);
  Ev.PushArg(Msg.CharCode);
  Ev.PushArg(Msg.Msg);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormShow(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(32);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormShowHint(Sender: TObject; HintInfo: PHintInfo);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(33);
  Ev.PushArg(HintInfo^.HintStr);
  Ev.PushArg(HintInfo^.HintPos.x);
  Ev.PushArg(HintInfo^.HintPos.y);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormStartDock(Sender: TObject; var DragObject: TDragDockObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(34);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(35);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormUTF8KeyPress(Sender: TObject; var UTF8Key: TUTF8Char);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(36);
  Ev.PushArg(UTF8Key);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormWindowStateChange(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(37);
  EventQueue.PushEvent(Ev);
end;

procedure TLForm.FormPaint(Sender: TObject);
var
  Ev:TEvent;
begin
  Ev := TEvent.Create(38);
  EventQueue.PushEvent(Ev);
end;

end.

