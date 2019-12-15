unit svm_exceptions;

{$mode objfpc}
{$H+}

interface

uses
  Classes,
  SysUtils,
  svm_common
  {$IfDef Windows},
    Windows,
    JwaWinBase,
    JwaWinNT
  {$endif};

type
  TTRBlock = record
    CatchPoint, EndPoint: TInstructionPointer;
  end;

  EUnhandledException = class(Exception);
  EUnhandledVirtualRaisedException = class(EUnhandledException);

  TTRBlocks = object
  public
    trblocks: array of TTRBlock;
    procedure add(CP, EP: TInstructionPointer);
    function TR_Catch(E: Exception): TInstructionPointer;
    function TR_Finally: TInstructionPointer;
  end;

type
  EUnknownException = class(Exception);

{***** Windows VEH ************************************************************}
{$IfDef Windows}

var
  VEHExceptions: TThreadList;
  VEHExceptions_Count: word = 0;

  SEH_Handler: Pointer;

function WinSVMVectoredHandler(ExceptionInfo: PExceptionPointers): longint; stdcall;

procedure SVM_InitVEH;
procedure SVM_FreeVEH;

{$EndIf}

procedure RaiseSafeException;

implementation

procedure TTRBlocks.add(CP, EP: TInstructionPointer); inline;
begin
  SetLength(self.trblocks, length(self.trblocks) + 1);
  with self.trblocks[length(self.trblocks) - 1] do
  begin
    CatchPoint := CP;
    EndPoint := EP;
  end;
end;

function TTRBlocks.TR_Catch(E: Exception): TInstructionPointer; inline;
begin
  if Length(self.trblocks) > 0 then
  begin
    Result := self.trblocks[length(self.trblocks) - 1].CatchPoint;
    SetLength(self.trblocks, length(self.trblocks) - 1);
  end
  else
  begin
    {$IfDef Windows}
    writeln('Unhandled exception <', E.ClassName, '>', sLineBreak,
      '- Message: "', E.Message, '"', sLineBreak,
      '- ThreadID: ', GetCurrentThreadId);

    ExitThread(1);
    {$Else}
    raise E;
    {$EndIf}
  end;
end;

function TTRBlocks.TR_Finally: TInstructionPointer; inline;
begin
  Result := self.trblocks[length(self.trblocks) - 1].EndPoint;
  setlength(self.trblocks, length(self.trblocks) - 1);
end;

{$IfDef Windows}

// For Win 32/64 VEH exceptions.

{function GetRegistrationHead: PExceptionRegistrationRecord;
  external 'kernel32.dll' name 'GetRegistrationHead';

procedure RtlRaiseException(ExceptionRecord: PExceptionRecord);
  external 'kernel32.dll' name 'RtlRaiseException';

function NtContinue(ThreadContext:PContext; RaiseAlert: boolean): THandle;
  external 'ntdll.dll' name 'NtContinue';

function NtRaiseException(ExceptionRecord: PExceptionRecord; ThreadContext:
                          PContext; HandleException: boolean): THandle;
  external 'ntdll.dll' name 'NtRaiseException';}


function WinSVMVectoredHandler(ExceptionInfo: PExceptionPointers): longint; stdcall;
var
  pExceptReg: PExceptionRegistrationRecord;
begin
  if byte(ExceptionInfo^.ExceptionRecord^.ExceptionCode) in
    [byte(Windows.EXCEPTION_FLT_DIVIDE_BY_ZERO),
    byte(Windows.EXCEPTION_ACCESS_VIOLATION),
    byte(Windows.EXCEPTION_ARRAY_BOUNDS_EXCEEDED),
    byte(Windows.EXCEPTION_FLT_INVALID_OPERATION),
    byte(Windows.EXCEPTION_FLT_OVERFLOW), byte(Windows.EXCEPTION_FLT_UNDERFLOW),
    byte(Windows.EXCEPTION_NONCONTINUABLE_EXCEPTION)] then
    Result := EXCEPTION_EXECUTE_HANDLER
  else
  begin
    try
      Exception(ExceptionInfo^.ExceptionRecord^.ExceptionInformation[1]).Free;
      //ExceptionInfo^.ExceptionRecord^.ExceptionCode := 0;
    finally
      Result := EXCEPTION_CONTINUE_EXECUTION;
    end;

    VEHExceptions.Add(Pointer(GetCurrentThreadId));
    Inc(VEHExceptions_Count);
  end;
end;

procedure SVM_InitVEH;
begin
  VEHExceptions := TThreadList.Create;

  SEH_Handler := nil;
  SEH_Handler := AddVectoredExceptionHandler(0, @WinSVMVectoredHandler);
end;

procedure SVM_FreeVEH;
begin
  if SEH_Handler <> nil then
    RemoveVectoredExceptionHandler(SEH_Handler);

  FreeAndNil(VEHExceptions);
end;

{$EndIf}

procedure RaiseSafeException;
begin
  {$IfDef Windows}
    VEHExceptions.Add(Pointer(GetCurrentThreadId));
    Inc(VEHExceptions_Count);
  {$Else}
    raise EUnhandledVirtualRaisedException.Create('Unhandled virtual raised exception');
  {$EndIf}
end;

end.
