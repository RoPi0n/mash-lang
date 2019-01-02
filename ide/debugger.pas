unit debugger;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs, Windows, Forms, svm_mem;

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

  TGrabber = object
    tasks: array of pointer;
  end;

  PGrabber = ^TGrabber;

  TStack = object
  public
    items: array of pointer;
    procedure push(p: pointer);
    function peek: pointer;
    procedure pop;
    function popv: pointer;
    procedure swp;
  end;

  PStack = ^TStack;

  TSVM = object
    mainclasspath: string;
    mem: PMemory;
    stack: TStack;
    cbstack: TCallBackStack;
    bytes: PByteArr;
    ip, end_ip: TInstructionPointer;
    grabber: TGrabber;
    consts: PConstSection;
    extern_methods: PImportSection;
    try_blocks: TTRBlocks;
  end;

  PSVM = ^TSVM;

type
  THelpThread = class(TThread)
  public
    constructor Create;
    destructor Destroy; override;
    procedure Execute; override;
  end;

function SVM_Create: PSVM; stdcall; external 'svmlib.dll' Name '_SVM_CREATE';
procedure SVM_Free(SVM: PSVM); stdcall; external 'svmlib.dll' Name '_SVM_FREE';
procedure SVM_SetDbgCallBack(SVM: PSVM; DbgCB: Pointer); stdcall;
  external 'svmlib.dll' Name '_SVM_DEBUGCALLBACK';
procedure SVM_RegAPI(SVM: PSVM; ExtFunc: Pointer); stdcall;
  external 'svmlib.dll' Name '_SVM_REGAPI';
procedure SVM_LoadExeFromFile(SVM: PSVM; MainClassPath: PString); stdcall;
  external 'svmlib.dll' Name '_SVM_LOADEXEFROMFILE';
procedure SVM_Run(SVM: PSVM); stdcall; external 'svmlib.dll' Name '_SVM_RUN';
procedure SVM_CheckErr(SVM: PSVM; E: Exception); stdcall;
  external 'svmlib.dll' Name '_SVM_CHECKERR';
procedure SVM_Continue(SVM: PSVM); stdcall; external 'svmlib.dll' Name '_SVM_CONTINUE';

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

{** Stack **}
procedure TStack.push(p: pointer);
begin
  SetLength(Self.Items, Length(Self.Items) + 1);
  Self.Items[Length(Self.Items) - 1] := p;
end;

function TStack.peek: pointer;
begin
  Result := Self.Items[Length(Self.Items) - 1];
end;

procedure TStack.pop;
begin
  SetLength(Self.Items, Length(Self.Items) - 1);
end;

function TStack.popv: pointer;
begin
  Result := Self.Items[Length(Self.Items) - 1];
  SetLength(Self.Items, Length(Self.Items) - 1);
end;

procedure TStack.swp;
var
  p: Pointer;
begin
  p := Self.Items[Length(Self.Items) - 2];
  Self.Items[Length(Self.Items) - 2] := Self.Items[Length(Self.Items) - 1];
  Self.Items[Length(Self.Items) - 1] := p;
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

procedure BreakPointProc(vm: PSVM); cdecl;
var
  c: cardinal;
  s, bf: string;
begin
  try
    while DbgStopIt do
    begin
      Application.ProcessMessages;
      Sleep(1);
    end;

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

    codeline := TSVMMem(vm^.stack.popv).GetW;
    codefile := TSVMMem(vm^.stack.popv).GetS;

    TMainFrm(Frm).DebuggerFrame1.DbgVarsLB.Items.BeginUpdate;
    TMainFrm(Frm).DebuggerFrame1.DbgVarsLB.Items.Clear;
    TMainFrm(Frm).DebuggerFrame1.DbgVarsLB.Items.Add(
      'Full name / Num.:                  Addr:      Value:'
      );

    c := 0;
    while c < Length(vm^.mem^) do
    begin
      s := FrmStrWidth(DebugInfoVars[c], 32) + '   ';
      if cardinal(vm^.mem^[c]) <> 0 then
        s := s + '0x' + IntToHex(cardinal(vm^.mem^[c]), 8) + ' '
      else
        s := s + '<null>     ';

      try
        bf := TSVMMem(vm^.mem^[c]).GetS;
      except
        bf := '?';
      end;

      s := s + bf;

      TMainFrm(Frm).DebuggerFrame1.DbgVarsLB.Items.Add(s);
      Inc(c);
    end;

    TMainFrm(Frm).DebuggerFrame1.DbgVarsLB.Items.EndUpdate;
    TMainFrm(Frm).DebuggerFrame1.DbgVarsLB.Update;


    TMainFrm(Frm).DebuggerFrame1.DbgStackLB.Items.BeginUpdate;
    TMainFrm(Frm).DebuggerFrame1.DbgStackLB.Items.Clear;
    TMainFrm(Frm).DebuggerFrame1.DbgStackLB.Items.Add(
      'Num:  Addr:      Value:'
      );

    c := 0;
    while c < Length(vm^.stack.items) do
    begin
      s := FrmStrWidth(IntToStr(c) + '.', 6) + '0x' +
        IntToHex(cardinal(vm^.stack.items[c]), 8) + ' ';

      try
        bf := TSVMMem(vm^.stack.items[c]).GetS;
      except
        bf := '?';
      end;

      s := s + bf;

      TMainFrm(Frm).DebuggerFrame1.DbgStackLB.Items.Add(s);
      Inc(c);
    end;

    TMainFrm(Frm).DebuggerFrame1.DbgStackLB.Items.EndUpdate;
    TMainFrm(Frm).DebuggerFrame1.DbgStackLB.Update;


    with TMainFrm(Frm).DebuggerFrame1 do
    begin
      Label1.Caption := 'CIP: 0x' + IntToHex(vm^.ip, 8) + '.';
      Label2.Caption := 'CIA: 0x' + IntToHex(cardinal(vm^.bytes), 8) +
        ' + 0x' + IntToHex(vm^.ip, 8) + '.';
      Label3.Caption := 'CIV: 0x' +
        IntToHex(PByte(cardinal(vm^.bytes) + vm^.ip)^, 2) + '.';
      Label6.Caption := 'Table: ' + IntToStr(Length(vm^.mem^)) + ' bl.';
      Label4.Caption := 'Stack: ' + IntToStr(Length(vm^.stack.items)) + ' bl.';
      Label5.Caption := 'CB-Stack: ' + IntToStr(Length(vm^.cbstack.items)) +
        ' jumps.';
      Label8.Caption := 'GC-Stack: ' + IntToStr(Length(vm^.grabber.tasks)) + ' bl.';
      Label9.Caption := 'Thread ID: ' + IntToStr(GetCurrentThreadId) + '.';
    end;

    Application.ProcessMessages;

  finally
  end;
end;

procedure DebugFile(Form: TForm; svmexe, debuginfo: string);
var
  vm: PSVM;
  s: string;
  c, x: cardinal;
  fs: TFileStream;
  ExceptFlag: boolean;
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

  SetErrorMode(SEM_FAILCRITICALERRORS);

  DebuggingInProcess := True;

  try
    vm := SVM_Create;
    SVM_SetDbgCallBack(vm, @BreakPointProc);
    SVM_LoadExeFromFile(vm, @svmexe);
    HelpThread := THelpThread.Create;
    AllocConsole;
    SetConsoleTitle('Mash IDE debugger std I/O thread.');

    try
      SVM_Run(vm);
    except
      on E: Exception do
      begin
        if E.ClassName <> 'EAccessViolation' then
        case MessageBox(0, PChar('Exception catched!' + sLineBreak +
            sLineBreak + 'Exception type: ' + E.ClassName + '.' +
            sLineBreak + 'Exception message: ' + E.Message + '.' +
            sLineBreak + sLineBreak + 'Last successfully debugged:' +
            sLineBreak + '- Code file: "' + codefile + '".' +
            sLineBreak + '- Line: ' + IntToStr(codeline) + '.' +
            sLineBreak + sLineBreak + 'Handle exception and resume code execution?'),
            'Mash IDE debugger', MB_YESNO) of
          idYes: ExceptFlag := True;
          idNo: ExceptFlag := False;
        end;
        while ExceptFlag do
        begin
          try
            SVM_Continue(vm);
            ExceptFlag := False;
          except
            on E: Exception do
              if E.ClassName <> 'EAccessViolation' then
              case MessageBox(0, PChar('Exception catched!' +
                  sLineBreak + sLineBreak + 'Exception type: ' +
                  E.ClassName + '.' + sLineBreak + 'Exception message: ' +
                  E.Message + '.' + sLineBreak + sLineBreak +
                  'Last successfully debugged:' + sLineBreak +
                  '- Code file: "' + codefile + '".' + sLineBreak +
                  '- Line: ' + IntToStr(codeline) + '.' + sLineBreak +
                  sLineBreak + 'Handle exception and resume code execution?'),
                  'Mash IDE debugger', MB_YESNO) of
                idYes: ExceptFlag := True;
                idNo: ExceptFlag := False;
              end;

          end;
        end;
      end;
    end;
    FreeConsole;
    FreeAndNil(HelpThread);
    //SVM_Free(vm);
  finally
    SVM_Free(vm);
  end;

  DebuggingInProcess := False;
end;

end.
