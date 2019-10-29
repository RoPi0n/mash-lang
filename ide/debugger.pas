unit debugger;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs, Forms
  {$ifdef Windows}
  , windows,
  JwaWinBase,
  JwaWinNT
  {$endif};

type
  TInstructionPointer = cardinal;
  TMemory = array of pointer;
  PMemory = ^TMemory;
  TByteArr = array of byte;
  PByteArr = ^TByteArr;

  TConstSection = object
    constants: array of variant;
  end;

  PConstSection = ^TConstSection;

  PImportSection = pointer;

  TCallBackStack = object
    items: array of TInstructionPointer;
    size, i_pos: cardinal;
  end;

  PCallBackStack = ^TCallBackStack;

  TTRBlock = record
    CatchPoint, EndPoint: TInstructionPointer;
  end;

  PTRBlock = ^TTRBlock;

  TTRBlocks = object
    trblocks: array of TTRBlock;
  end;

  PTRBlocks = ^TTRBlocks;

  TStack = object
  public
    items: array of pointer;
    size, i_pos: cardinal;
  end;

  PStack = ^TStack;

  TGrabber = object
    tasks: TStack;
    ChkCnt: byte;
  end;

  PGrabber = ^TGrabber;


  TSVM = object
  public
    ip,end_ip: TInstructionPointer;
    mainclasspath: string;
    mem: PMemory;
    grabber: TGrabber;
    stack: TStack;
    cbstack: TCallBackStack;
    bytes: PByteArr;
    consts: PConstSection;
    extern_methods: PImportSection;
    try_blocks: TTRBlocks;
    isMainThread: boolean;
  end;

  PSVM = ^TSVM;

type
  THelpThread = class(TThread)
  public
    constructor Create;
    destructor Destroy; override;
    procedure Execute; override;
  end;

{** Imports from svm.lib **}

const
  svmapi = 'svm.lib';

procedure SVM_Init; stdcall; external svmapi name '_SVM_INIT';
procedure SVM_Free; stdcall; external svmapi name '_SVM_FREE';

function SVM_CreateVM:PSVM; stdcall; external svmapi name '_SVM_CREATE_VM';
procedure SVM_FreeVM(SVM:PSVM); stdcall; external svmapi name '_SVM_FREE_VM';

procedure SVM_RegAPI(SVM:PSVM; ExtFunc:Pointer); stdcall; external svmapi name '_SVM_REGAPI';
procedure SVM_SetDbgCallBack(SVM:PSVM; DbgCB:Pointer); stdcall; external svmapi name '_SVM_DEBUGCALLBACK';
procedure SVM_Run(SVM:PSVM); stdcall; external svmapi name '_SVM_RUN';
procedure SVM_LoadExeFromFile(SVM:PSVM; MainClassPath:PString); stdcall; external svmapi name '_SVM_LOADEXEFROMFILE';
procedure SVM_CheckErr(SVM:PSVM; E:Exception); stdcall; external svmapi name '_SVM_CHECKERR';
procedure SVM_Continue(SVM:PSVM); stdcall; external svmapi name '_SVM_CONTINUE';



procedure DebugFile(Form: TForm; svmexe, debuginfo: string);

var
  DebuggingInProcess: boolean = False;
  ExecutionBreaked: boolean = False;
  Frm: TForm;
  EnableDebugInfoUsing: boolean = False;
  DebugInfoVars: TStringList;
  DbgStopIt: boolean = False;
  HelpThread: THelpThread;
  codefile: string;
  codeline: cardinal;

implementation

uses
  MainForm;


{** Debugger **}

constructor THelpThread.Create;
begin
  FreeOnTerminate := False;
  inherited Create(False);
end;

destructor THelpThread.Destroy;
begin
  inherited Destroy;
end;

procedure THelpThread.Execute;
begin
  while not Terminated do
  begin
    Application.ProcessMessages;
    Sleep(1);
  end;
end;

function FrmStrWidth(s: string; nw: cardinal): string;
begin
  nw := nw - Length(s);
  if nw < 0 then
    s := copy(s, 1, nw - 3) + '...'
  else
    while nw > 0 do
    begin
      s := s + ' ';
      Dec(nw);
    end;
  Result := s;
end;

procedure BreakPointProc(vm: PSVM); stdcall;
var
  c: cardinal;
  s, bf: string;
begin
  try
    if not EnableDebugInfoUsing then
    begin
      DebugInfoVars.Clear;
      c := Length(vm^.mem^);
      while c > 0 do
      begin
        DebugInfoVars.Insert(0, '#' + IntToStr(c));
        Dec(c);
      end;
    end;

    with TMainFrm(Frm).DebuggerFrame1 do
    begin
      Label1.Caption := 'CIP: 0x' + IntToHex(vm^.ip, 8) + '.';
      Label3.Caption := 'CIV: 0x' +
        IntToHex(PByte(vm^.bytes + vm^.ip)^, 2) + '.';
      Label6.Caption := 'Table: ' + IntToStr(Length(vm^.mem^)) + ' bl.';
      Label4.Caption := 'Stack: ' + IntToStr(vm^.stack.i_pos) + ' rec.';
      Label5.Caption := 'CB-Stack: ' + IntToStr(vm^.cbstack.i_pos) +
        ' jumps.';
      Label8.Caption := 'GC-Stack: ' + IntToStr(vm^.grabber.tasks.i_pos) + ' rec.';
      Label9.Caption := 'Thread ID: ' + IntToStr(GetCurrentThreadId) + '.';
    end;

    Application.ProcessMessages;

  finally
  end;
end;

{$IfDef Windows}

// For Win 32/64 VEH exceptions.

type
  EUnknownException = class(Exception);

{function GetRegistrationHead: PExceptionRegistrationRecord;
  external 'kernel32.dll' name 'GetRegistrationHead';

procedure RtlRaiseException(ExceptionRecord: PExceptionRecord);
  external 'kernel32.dll' name 'RtlRaiseException';

function NtContinue(ThreadContext:PContext; RaiseAlert: boolean): THandle;
  external 'ntdll.dll' name 'NtContinue';

function NtRaiseException(ExceptionRecord: PExceptionRecord; ThreadContext:
                          PContext; HandleException: boolean): THandle;
  external 'ntdll.dll' name 'NtRaiseException';}


function WinSVMVectoredHandler(ExceptionInfo: PExceptionPointers): Longint; stdcall;
var
  pExceptReg: PExceptionRegistrationRecord;
begin
  if byte(ExceptionInfo^.ExceptionRecord^.ExceptionCode) in [
          byte(Windows.EXCEPTION_FLT_DIVIDE_BY_ZERO),
          byte(Windows.EXCEPTION_ACCESS_VIOLATION),
          byte(Windows.EXCEPTION_ARRAY_BOUNDS_EXCEEDED),
          byte(Windows.EXCEPTION_FLT_INVALID_OPERATION),
          byte(Windows.EXCEPTION_FLT_OVERFLOW),
          byte(Windows.EXCEPTION_FLT_UNDERFLOW),
          byte(Windows.EXCEPTION_NONCONTINUABLE_EXCEPTION)
     ]
  then
    Result := EXCEPTION_EXECUTE_HANDLER  //Todo
  else
   begin
     try
       Exception(ExceptionInfo^.ExceptionRecord^.ExceptionInformation[1]).Free;
       //ExceptionInfo^.ExceptionRecord^.ExceptionCode := 0;
     finally
       Result := EXCEPTION_CONTINUE_EXECUTION;
     end;

     //Todo
   end;
end;

{$EndIf}

procedure DebugFile(Form: TForm; svmexe, debuginfo: string);
var
  vm: PSVM;
  s: string;
  c, x: cardinal;
  fs: TFileStream;
  ExceptFlag: boolean;
  sehhandler: pointer;
begin
  TMainFrm(Form).DebuggerPanel.Width := 385;
  Frm := Form;

  if DebuggingInProcess then
  begin
    MessageBox(0, 'The debugger already working!', 'Mash debugger error!',
      MB_OK + MB_ICONERROR);
    Exit;
  end;

  if not FileExists(svmexe) then
  begin
    MessageBox(0, 'File for debugging does not exists!', 'Mash debugger error!',
      MB_OK + MB_ICONERROR);
    Exit;
  end;

  EnableDebugInfoUsing := False;
  if FileExists(debuginfo) then
    EnableDebugInfoUsing := True
  else
    MessageBox(0, 'File with debugging information does not exists!'#13#10'Debugger should be launched without it!',
      'Mash debugger warning!', MB_OK + MB_ICONWARNING);

  if EnableDebugInfoUsing then
  begin
    DebugInfoVars := TStringList.Create;
    fs := TFileStream.Create(debuginfo, fmOpenRead);
    fs.Read(c, sizeof(c));
    while c > 0 do
    begin
      fs.Read(x, sizeof(x));
      SetLength(s, x);
      fs.Read(s[1], x);
      DebugInfoVars.Add(s);
      Dec(c);
    end;
    FreeAndNil(fs);
  end;

  DebuggingInProcess := True;

  {$IfDef Windows}
    sehhandler := nil;
    sehhandler := AddVectoredExceptionHandler(0, @WinSVMVectoredHandler);;
  {$EndIf}

  SVM_Init;
  try
    vm := SVM_CreateVM;
    SVM_SetDbgCallBack(vm, @BreakPointProc);
    SVM_LoadExeFromFile(vm, @svmexe);
    HelpThread := THelpThread.Create;
    AllocConsole;
    SetConsoleTitle('Mash IDE debugger std I/O thread.');

    SVM_Run(vm);

    FreeConsole;
    FreeAndNil(HelpThread);
  finally
    SVM_FreeVM(vm);
    SVM_Free;
  end;

  {$IfDef Windows}
    if SEHHandler <> nil then
     RemoveVectoredExceptionHandler(SEHHandler);
  {$EndIf}

  DebuggingInProcess := False;
end;

end.
