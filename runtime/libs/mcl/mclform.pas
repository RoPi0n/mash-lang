unit mclform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Types;

type
  TMCLFormHandlerType = (
    fhClick,
    fhCloseQuery,
    fhCreate,
    fhDblClick,
    fhHide,
    fhKeyDown,
    fhKeyPress,
    fhKeyUp,
    fhMouseDown,
    fhMouseEnter,
    fhMouseLeave,
    fhMouseUp,
    fhMouseMove,
    fhMouseWheel,
    fhMouseWheelDown,
    fhMouseWheelHorz,
    fhMouseWheelLeft,
    fhMouseWheelRight,
    fhMouseWheelUp,
    fhResize,
    fhShow,
    fhWindowStateChange
  );

  TMCLFormHandlerInfo = class
    public
      Addr: Cardinal;
      Arg : Pointer;

      constructor Create(_Addr: Cardinal; _Arg: Pointer);
  end;

  TMCLFormEvent = class
    HandlerType: TMCLFormHandlerType;
    Args: TList;

    constructor Create(hType: TMCLFormHandlerType);
    destructor Destroy; override;
  end;

  { TMCLFormClass }

  TMCLFormClass = class(TForm)
    procedure FormClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
                             WheelDelta: Integer; MousePos: TPoint;
                             var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
                                 MousePos: TPoint;
                                 var Handled: Boolean);
    procedure FormMouseWheelHorz(Sender: TObject; Shift: TShiftState;
                                 WheelDelta: Integer; MousePos: TPoint;
                                 var Handled: Boolean);
    procedure FormMouseWheelLeft(Sender: TObject; Shift: TShiftState;
                                 MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelRight(Sender: TObject; Shift: TShiftState;
                                  MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
                               MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
  public
    EventHandlers: array[fhClick..fhWindowStateChange] of TMCLFormHandlerInfo;
    EventStack: TThreadList;

    procedure RegHandler(Addr: cardinal; Arg: Pointer; HandlerType: TMCLFormHandlerType);
    function PopEvent: TMCLFormEvent;
  end;

var
  MCLFormClass: TMCLFormClass;

implementation

{$R *.lfm}

{ TMCLFormClass }

{** Architecture **}

constructor TMCLFormHandlerInfo.Create(_Addr: Cardinal; _Arg: Pointer);
begin
  Addr := _Addr;
  Arg := _Arg;
end;

constructor TMCLFormEvent.Create(hType: TMCLFormHandlerType);
begin
  HandlerType := hType;
  Args := TList.Create;
end;

destructor TMCLFormEvent.Destroy;
begin
  FreeAndNil(Args);
  inherited;
end;

procedure TMCLFormClass.FormCreate(Sender: TObject);
var
  b: byte;
begin
  for b := 0 to Length(EventHandlers) - 1 do
   EventHandlers[TMCLFormHandlerType(b)] := nil;

  EventStack := TThreadList.Create;
end;

procedure TMCLFormClass.FormDestroy(Sender: TObject);
var
  b: byte;
begin
  for b := 0 to Length(EventHandlers) - 1 do
   if EventHandlers[TMCLFormHandlerType(b)] <> nil then
    FreeAndNil(EventHandlers);

  with EventStack.LockList do
   try
     while Count > 0 do
      begin
        TMCLFormEvent(Items[0]).Free;
        Delete(0)
      end;
   finally
     FreeAndNil(EventStack);
   end;
end;

procedure TMCLFormClass.RegHandler(Addr: cardinal; Arg: Pointer; HandlerType: TMCLFormHandlerType);
var
  OldHandler: TMCLFormHandlerInfo;
begin
  OldHandler := nil;
  if EventHandlers[HandlerType] <> nil then
   OldHandler := EventHandlers[HandlerType];

  EventHandlers[HandlerType] := TMCLFormHandlerInfo.Create(Addr, Arg);

  if OldHandler <> nil then
   FreeAndNil(OldHandler);
end;

function TMCLFormClass.PopEvent: TMCLFormEvent;
begin
  Result := nil;
  with EventStack.LockList do
   try
     if Count > 0 then
      begin
        Result := TMCLFormEvent(Items[0]);
        Delete(0);
      end;
   finally
     EventStack.UnlockList;
   end;
end;

{** Handlers **}

procedure TMCLFormClass.FormClick(Sender: TObject);
begin
  if EventHandlers[fhClick] <> nil then
   EventStack.Add(TMCLFormEvent.Create(fhClick));
end;

procedure TMCLFormClass.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if EventHandlers[fhCloseQuery] <> nil then
   begin
     EventStack.Add(TMCLFormEvent.Create(fhCloseQuery));
     CanClose := false;
   end;
end;

procedure TMCLFormClass.FormDblClick(Sender: TObject);
begin
  if EventHandlers[fhDblClick] <> nil then
   EventStack.Add(TMCLFormEvent.Create(fhDblClick));
end;

procedure TMCLFormClass.FormHide(Sender: TObject);
begin
  if EventHandlers[fhHide] <> nil then
   EventStack.Add(TMCLFormEvent.Create(fhHide));
end;

procedure TMCLFormClass.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Ev: TMCLFormEvent;
begin
  if EventHandlers[fhKeyDown] <> nil then
   begin
     Ev := TMCLFormEvent.Create(fhKeyDown);
     Ev.Args.Add(Pointer( LongWord(Key) ));
     EventStack.Add(Ev);
   end;
end;

procedure TMCLFormClass.FormKeyPress(Sender: TObject; var Key: char);
var
  Ev: TMCLFormEvent;
begin
  if EventHandlers[fhKeyPress] <> nil then
   begin
     Ev := TMCLFormEvent.Create(fhKeyPress);
     Ev.Args.Add(Pointer( Ord(Key) ));
     EventStack.Add(Ev);
   end;
end;

procedure TMCLFormClass.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Ev: TMCLFormEvent;
begin
  if EventHandlers[fhKeyUp] <> nil then
   begin
     Ev := TMCLFormEvent.Create(fhKeyUp);
     Ev.Args.Add(Pointer( LongWord(Key) ));
     EventStack.Add(Ev);
   end;
end;

procedure TMCLFormClass.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Ev: TMCLFormEvent;
begin
  if EventHandlers[fhMouseDown] <> nil then
   begin
     Ev := TMCLFormEvent.Create(fhMouseDown);
     Ev.Args.Add(Pointer( LongWord(X) ));
     Ev.Args.Add(Pointer( LongWord(Y) ));
     Ev.Args.Add(Pointer( LongWord(Byte(Button)) ));
     EventStack.Add(Ev);
   end;
end;

procedure TMCLFormClass.FormMouseEnter(Sender: TObject);
begin
  if EventHandlers[fhMouseEnter] <> nil then
   EventStack.Add(TMCLFormEvent.Create(fhMouseEnter));
end;

procedure TMCLFormClass.FormMouseLeave(Sender: TObject);
begin
  if EventHandlers[fhMouseLeave] <> nil then
   EventStack.Add(TMCLFormEvent.Create(fhMouseLeave));
end;

procedure TMCLFormClass.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Ev: TMCLFormEvent;
begin
  if EventHandlers[fhMouseMove] <> nil then
   begin
     Ev := TMCLFormEvent.Create(fhMouseMove);
     Ev.Args.Add(Pointer( LongWord(X) ));
     Ev.Args.Add(Pointer( LongWord(Y) ));
     EventStack.Add(Ev);
   end;
end;

procedure TMCLFormClass.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Ev: TMCLFormEvent;
begin
  if EventHandlers[fhMouseUp] <> nil then
   begin
     Ev := TMCLFormEvent.Create(fhMouseUp);
     Ev.Args.Add(Pointer( LongWord(X) ));
     Ev.Args.Add(Pointer( LongWord(Y) ));
     Ev.Args.Add(Pointer( LongWord(Byte(Button)) ));
     EventStack.Add(Ev);
   end;
end;

procedure TMCLFormClass.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TMCLFormClass.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TMCLFormClass.FormMouseWheelHorz(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TMCLFormClass.FormMouseWheelLeft(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TMCLFormClass.FormMouseWheelRight(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TMCLFormClass.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TMCLFormClass.FormResize(Sender: TObject);
begin

end;

procedure TMCLFormClass.FormShow(Sender: TObject);
begin

end;

procedure TMCLFormClass.FormWindowStateChange(Sender: TObject);
begin

end;

end.

