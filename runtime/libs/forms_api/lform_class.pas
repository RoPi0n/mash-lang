unit lform_class;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  Types, LMessages, LCLType, ExtCtrls,
  SyncObjs;

const
  EventsStoring = 1024 * 10;

  EVT_Null = 0;
  EVT_FormActivate = 1;
  EVT_FormChangeBounds = 2;
  EVT_FormClick = 3;
  EVT_FormClose = 4;
  EVT_FormCloseQuery = 5;
  EVT_FormContextPopup = 6;
  EVT_FormDblClick = 7;
  EVT_FormDeactivate = 8;
  EVT_FormDockDrop = 10;
  EVT_FormDockOver = 11;
  EVT_FormDragDrop = 12;
  EVT_FormDragOver = 13;
  EVT_FormDropFiles = 14;
  EVT_FormEndDock = 15;
  EVT_FormGetSiteInfo = 16;
  EVT_FormHelp = 17;
  EVT_FormHide = 18;
  EVT_FormKeyDown = 19;
  EVT_FormKeyPress = 20;
  EVT_FormKeyUp = 21;
  EVT_FormMouseDown = 22;
  EVT_FormMouseEnter = 23;
  EVT_FormMouseLeave = 24;
  EVT_FormMouseMove = 25;
  EVT_FormMouseUp = 26;
  EVT_FormMouseWheel = 27;
  EVT_FormMouseWheelDown = 28;
  EVT_FormMouseWheelUp = 29;
  EVT_FormResize = 30;
  EVT_FormShortCut = 31;
  EVT_FormShow = 32;
  EVT_FormShowHint = 33;
  EVT_FormStartDock = 34;
  EVT_FormUnDock = 35;
  EVT_FormUTF8KeyPress = 36;
  EVT_FormWindowStateChange = 37;
  EVT_FormPaint = 38;


type

  { TEvent }

  TLFEvent = class(TObject)
  private
    ID: word;
    Evt: byte;
    Args: TList;
    Wached: boolean;
  public
    constructor Create(EvType: byte; EvID: word);
    destructor Destroy; override;
    procedure PushArg(v: variant);
    function GetArg(indx: byte): variant;
    function ArgCount: byte;
    function GetEvType: byte;
  end;

  { TLForm }

  TLForm = class(TForm)
    GrabberTimer: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure FormChangeBounds(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDockDrop(Sender: TObject; Source: TDragDockObject; X, Y: integer);
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject;
      X, Y: integer; State: TDragState; var Accept: boolean);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: integer;
      State: TDragState; var Accept: boolean);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure FormEndDock(Sender, Target: TObject; X, Y: integer);
    procedure FormGetSiteInfo(Sender: TObject; DockClient: TControl;
      var InfluenceRect: TRect; MousePos: TPoint; var CanDock: boolean);
    function FormHelp(Command: word; Data: PtrInt; var CallHelp: boolean): boolean;
    procedure FormHide(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure FormMouseEnter(Sender: TObject);
    procedure FormMouseLeave(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: integer; MousePos: TPoint; var Handled: boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: boolean);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShortCut(var Msg: TLMKey; var Handled: boolean);
    procedure FormShow(Sender: TObject);
    procedure FormShowHint(Sender: TObject; HintInfo: PHintInfo);
    procedure FormStartDock(Sender: TObject; var DragObject: TDragDockObject);
    procedure FormUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: boolean);
    procedure FormUTF8KeyPress(Sender: TObject; var UTF8Key: TUTF8Char);
    procedure FormWindowStateChange(Sender: TObject);
    procedure ClearEvents;
    function GetEv: TLFEvent;
    procedure GrabberTimerTimer(Sender: TObject);
    procedure PushEvent(E: TLFEvent);
  private
    { private declarations }
  public
    EventList: TList;
    CanCloseForm: boolean;
    Ev, LastEv: TLFEvent;
    GlobalEventCounter: word;
    ReceivingEventCounter: word;
    EventListBusy: boolean;
  end;

var
  LForm: TLForm;

{$R *.lfm}

implementation

{ TLFEvent }

constructor TLFEvent.Create(EvType: byte; EvID: word);
begin
  Self.ID := EvID;
  Self.Evt := EvType;
  Self.Args := TList.Create;
  Self.Wached := False;
  inherited Create;
end;

destructor TLFEvent.Destroy;
begin
  while Self.Args.Count > 0 do
  begin
    Dispose(PVariant(Self.Args[0]));
    Self.Args.Delete(0);
  end;
  FreeAndNil(Self.Args);
  inherited;
end;

procedure TLFEvent.PushArg(v: variant);
var
  pv: PVariant;
begin
  new(pv);
  pv^ := v;
  Self.Args.Add(pv);
end;

function TLFEvent.GetArg(indx: byte): variant;
begin
  Result := PVariant(Self.Args[indx])^;
end;

function TLFEvent.ArgCount: byte;
begin
  Result := Self.Args.Count;
end;

function TLFEvent.GetEvType: byte;
begin
  Result := Self.Evt;
end;

{ TLForm }

procedure TLForm.ClearEvents;
begin
  while EventListBusy do
   Sleep(1);

  EventListBusy := True;

  while EventList.Count > EventsStoring do
  begin
    if not (EventList[0] = nil) then
    begin
      if not (LastEv = nil) then
      begin
        if LastEv.ID <> TLFEvent(EventList[0]).ID then
          TLFEvent(EventList[0]).Free;
      end
      else
        TLFEvent(EventList[0]).Free;
    end
    else
      EventList.Add(EventList[0]); // if item == lastev - move it to top
    EventList.Delete(0);
  end;

  EventListBusy := False;
end;

function TLForm.GetEv: TLFEvent;
var
  c: cardinal;
begin
  Result := nil;

  while EventListBusy do
   Sleep(1);

  EventListBusy := True;

  //Find next event in queue by counter
  c := 0;
  while c < EventList.Count do
  begin
    if TLFEvent(EventList[c]).ID = ReceivingEventCounter then
    begin
      Inc(ReceivingEventCounter);
      Result := TLFEvent(EventList[c]);
      Result.Wached := True;
      LastEv := Result;
    end;
    Inc(c);
  end;

  //If counter value deprecated...
  if (Result = nil) and (EventList.Count > 0) then
  begin
    Result := TLFEvent(EventList[0]);
    if not Result.Wached then
      ReceivingEventCounter := Result.ID + 1
    else
      Result := nil;
    LastEv := Result;
  end;

  EventListBusy := False;
end;

procedure TLForm.GrabberTimerTimer(Sender: TObject);
begin
  ClearEvents;
end;

procedure TLForm.PushEvent(E: TLFEvent);
begin
  while EventListBusy do
   Sleep(1);

  EventListBusy := True;
  EventList.Add(E);
  EventListBusy := False;
  Inc(GlobalEventCounter);
end;

procedure TLForm.FormCreate(Sender: TObject);
begin
  CanCloseForm := True;
  Ev := nil;
  LastEv := nil;
  EventList := TList.Create;
  GlobalEventCounter := 0;
  ReceivingEventCounter := 0;
  EventListBusy := false;
end;

{ Event's }

procedure TLForm.FormActivate(Sender: TObject);
begin
  Ev := TLFEvent.Create(1, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormChangeBounds(Sender: TObject);
begin
  Ev := TLFEvent.Create(2, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormClick(Sender: TObject);
begin
  Ev := TLFEvent.Create(3, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Ev := TLFEvent.Create(4, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  Ev := TLFEvent.Create(5, GlobalEventCounter);
  CanClose := CanCloseForm;
  PushEvent(Ev);
end;

procedure TLForm.FormContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: boolean);
begin
  Ev := TLFEvent.Create(6, GlobalEventCounter);
  Ev.PushArg(MousePos.x);
  Ev.PushArg(MousePos.y);
  PushEvent(Ev);
end;

procedure TLForm.FormDblClick(Sender: TObject);
begin
  Ev := TLFEvent.Create(7, GlobalEventCounter);
  Ev.PushArg(Mouse.CursorPos.x);
  Ev.PushArg(Mouse.CursorPos.y);
  PushEvent(Ev);
end;

procedure TLForm.FormDeactivate(Sender: TObject);
begin
  Ev := TLFEvent.Create(8, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormDestroy(Sender: TObject);
begin
  Ev := TLFEvent.Create(9, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormDockDrop(Sender: TObject; Source: TDragDockObject; X, Y: integer);
begin
  Ev := TLFEvent.Create(10, GlobalEventCounter);
  Ev.PushArg(x);
  Ev.PushArg(y);
  PushEvent(Ev);
end;

procedure TLForm.FormDockOver(Sender: TObject; Source: TDragDockObject;
  X, Y: integer; State: TDragState; var Accept: boolean);
begin
  Ev := TLFEvent.Create(11, GlobalEventCounter);
  Ev.PushArg(x);
  Ev.PushArg(y);
  Ev.PushArg(State);
  PushEvent(Ev);
end;

procedure TLForm.FormDragDrop(Sender, Source: TObject; X, Y: integer);
begin
  Ev := TLFEvent.Create(12, GlobalEventCounter);
  Ev.PushArg(x);
  Ev.PushArg(y);
  PushEvent(Ev);
end;

procedure TLForm.FormDragOver(Sender, Source: TObject; X, Y: integer;
  State: TDragState; var Accept: boolean);
begin
  Ev := TLFEvent.Create(13, GlobalEventCounter);
  Ev.PushArg(x);
  Ev.PushArg(y);
  PushEvent(Ev);
end;

procedure TLForm.FormDropFiles(Sender: TObject; const FileNames: array of string);
var
  i: integer;
begin
  Ev := TLFEvent.Create(14, GlobalEventCounter);
  for i := 0 to length(FileNames) - 1 do
   Ev.PushArg(FileNames[i]);
  PushEvent(Ev);
end;

procedure TLForm.FormEndDock(Sender, Target: TObject; X, Y: integer);
begin
  Ev := TLFEvent.Create(15, GlobalEventCounter);
  Ev.PushArg(x);
  Ev.PushArg(y);
  PushEvent(Ev);
end;

procedure TLForm.FormGetSiteInfo(Sender: TObject; DockClient: TControl;
  var InfluenceRect: TRect; MousePos: TPoint; var CanDock: boolean);
begin
  Ev := TLFEvent.Create(16, GlobalEventCounter);
  Ev.PushArg(MousePos.x);
  Ev.PushArg(MousePos.y);
  PushEvent(Ev);
end;

function TLForm.FormHelp(Command: word; Data: PtrInt; var CallHelp: boolean): boolean;
begin
  Ev := TLFEvent.Create(17, GlobalEventCounter);
  Result := True;
  PushEvent(Ev);
end;

procedure TLForm.FormHide(Sender: TObject);
begin
  Ev := TLFEvent.Create(18, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  Ev := TLFEvent.Create(19, GlobalEventCounter);
  Ev.PushArg(Key);
  PushEvent(Ev);
end;

procedure TLForm.FormKeyPress(Sender: TObject; var Key: char);
begin
  Ev := TLFEvent.Create(20, GlobalEventCounter);
  Ev.PushArg(Key);
  PushEvent(Ev);
end;

procedure TLForm.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  Ev := TLFEvent.Create(21, GlobalEventCounter);
  Ev.PushArg(Key);
  PushEvent(Ev);
end;

procedure TLForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  Ev := TLFEvent.Create(22, GlobalEventCounter);
  Ev.PushArg(Button);
  Ev.PushArg(x);
  Ev.PushArg(y);
  PushEvent(Ev);
end;

procedure TLForm.FormMouseEnter(Sender: TObject);
begin
  Ev := TLFEvent.Create(23, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormMouseLeave(Sender: TObject);
begin
  Ev := TLFEvent.Create(24, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  Ev := TLFEvent.Create(25, GlobalEventCounter);
  Ev.PushArg(x);
  Ev.PushArg(y);
  PushEvent(Ev);
end;

procedure TLForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  Ev := TLFEvent.Create(26, GlobalEventCounter);
  Ev.PushArg(Button);
  Ev.PushArg(x);
  Ev.PushArg(y);
  PushEvent(Ev);
end;

procedure TLForm.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: integer; MousePos: TPoint; var Handled: boolean);
begin
  Ev := TLFEvent.Create(27, GlobalEventCounter);
  Ev.PushArg(WheelDelta);
  Ev.PushArg(MousePos.x);
  Ev.PushArg(MousePos.y);
  PushEvent(Ev);
end;

procedure TLForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: boolean);
begin
  Ev := TLFEvent.Create(28, GlobalEventCounter);
  Ev.PushArg(MousePos.x);
  Ev.PushArg(MousePos.y);
  PushEvent(Ev);
end;

procedure TLForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: boolean);
begin
  Ev := TLFEvent.Create(29, GlobalEventCounter);
  Ev.PushArg(MousePos.x);
  Ev.PushArg(MousePos.y);
  PushEvent(Ev);
end;

procedure TLForm.FormResize(Sender: TObject);
begin
  Ev := TLFEvent.Create(30, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormShortCut(var Msg: TLMKey; var Handled: boolean);
begin
  Ev := TLFEvent.Create(31, GlobalEventCounter);
  Ev.PushArg(Msg.CharCode);
  Ev.PushArg(Msg.Msg);
  PushEvent(Ev);
end;

procedure TLForm.FormShow(Sender: TObject);
begin
  Ev := TLFEvent.Create(32, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormShowHint(Sender: TObject; HintInfo: PHintInfo);
begin
  Ev := TLFEvent.Create(33, GlobalEventCounter);
  Ev.PushArg(HintInfo^.HintStr);
  Ev.PushArg(HintInfo^.HintPos.x);
  Ev.PushArg(HintInfo^.HintPos.y);
  PushEvent(Ev);
end;

procedure TLForm.FormStartDock(Sender: TObject; var DragObject: TDragDockObject);
begin
  Ev := TLFEvent.Create(34, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: boolean);
begin
  Ev := TLFEvent.Create(35, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormUTF8KeyPress(Sender: TObject; var UTF8Key: TUTF8Char);
begin
  Ev := TLFEvent.Create(36, GlobalEventCounter);
  Ev.PushArg(UTF8Key);
  PushEvent(Ev);
end;

procedure TLForm.FormWindowStateChange(Sender: TObject);
begin
  Ev := TLFEvent.Create(37, GlobalEventCounter);
  PushEvent(Ev);
end;

procedure TLForm.FormPaint(Sender: TObject);
begin
  Ev := TLFEvent.Create(38, GlobalEventCounter);
  PushEvent(Ev);
end;

end.
