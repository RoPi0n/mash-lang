//{$Define BuildInLibrary}

{$ifdef BuildInLibrary}
  library svm_core;
{$else}
  program svm_core;
  //{$define BuildGUI}
{$endif}
{$inline on}
{$ifdef BuildGUI}
  {$apptype gui}
{$endif}

//{$Define DebugVer}

uses
  {$ifdef UNIX}
  cthreads,
  {$endif}
  {$ifdef Windows}
  windows,
  JwaWinBase,
  JwaWinNT,
  {$endif}
  SysUtils,
  dynlibs,
  svm_mem,
  Classes,
  svm_grabber,
  svm_utils
  {$IfDef DebugVer}
   , typinfo
  {$EndIf};

{***** OP Codes ***************************************************************}
type
  TComand = (
    {** for stack **}
    bcPH,     // [top] = [var]
    bcPK,     // [var] = [top]
    bcPP,     // pop
    bcSDP,    // stkdrop
    bcSWP,    // [top] <-> [top-1]

    {** jump's **}
    bcJP,     // jump [top]
    bcJZ,     // [top] == 0 ? jp [top-1]
    bcJN,     // [top] <> 0 ? jp [top-1]
    bcJC,     // jp [top] & push callback point as ip+1
    bcJR,     // jp to last callback point & rem last callback point

    {** for untyped's **}
    bcEQ,     // [top] == [top-1] ? [top] = 1 : [top] = 0
    bcBG,     // [top] >  [top-1] ? [top] = 1 : [top] = 0
    bcBE,     // [top] >= [top-1] ? [top] = 1 : [top] = 0

    bcNOT,    // [top] = ![top]
    bcAND,    // [top] = [top] and [top-1]
    bcOR,     // [top] = [top] or  [top-1]
    bcXOR,    // [top] = [top] xor [top-1]
    bcSHR,    // [top] = [top] shr [top-1]
    bcSHL,    // [top] = [top] shl [top-1]

    bcNEG,    // [top] = -[top]
    bcINC,    // [top]++
    bcDEC,    // [top]--
    bcADD,    // [top] = [top] + [top-1]
    bcSUB,    // [top] = [top] - [top-1]
    bcMUL,    // [top] = [top] * [top-1]
    bcDIV,    // [top] = [top] / [top-1]
    bcMOD,    // [top] = [top] % [top-1]
    bcIDIV,   // [top] = [top] \ [top-1]

    bcMV,     // [top]^ = [top-1]^
    bcMVBP,   // [top]^^ = [top-1]^
    bcGVBP,   // [top]^ = [top-1]^^
    bcMVP,    // [top]^ = [top-1]

    {** memory operation's **}
    bcMS,     // memory map size = [top]
    bcNW,     // [top] = @new
    bcMC,     // copy [top]
    bcMD,     // double [top]
    bcNA,     // [top] = @new array[  [top]  ] of pointer
    bcTF,     // [top] = typeof( [top] )
    bcTMC,    // [top].type = type of class
    bcSF,     // [top] = sizeof( [top] )
    //bcRM,     // rem object
    //bcGPM,    // mark garbage
    bcGC,     // garbage collect


    {** array's **}
    bcAL,     // length( [top] as array )
    bcSL,     // setlength( [top] as array, {stack} )

    bcPA,     // push ([top] as array)[top-1]
    bcSA,     // peek [top-2] -> ([top] as array)[top-1]

    {** constant's **}
    bcPHC,    // push copy of const
    bcPHCP,   // push pointer to original const

    {** external call's **}
    bcINV,    // call external method

    {** for thread's **}
    bcPHN,    // push null
    bcCTHR,   // [top] = thread(method = [top], arg = [top+1]):id
    bcSTHR,   // suspendthread(id = [top])
    bcRTHR,   // resumethread(id = [top])
    bcTTHR,   // terminatethread(id = [top])
    bcTHSP,   // set thread priority

    bcPLC,    // push last callback
    bcPCT,    // push context
    bcLCT,    // load context
    bcJRX,    // jp to last callback point & rem last callback point twice

    {** for try..catch..finally block's **}
    bcTR,     // try @block_catch = [top], @block_end = [top+1]
    bcTRS,    // success exit from try/catch block
    bcTRR,    // raise exception, message = [top]

    {** for string's **}
    bcSTRD,     // strdel
    bcCHORD,
    bcORDCH,

    bcTHREXT,//stop code execution

    bcDBP    //debug method call

    //bcCOPST  //set handler for class-object operation
    );

{***** Types & variables ******************************************************}
type
  TByteArr = array of byte;
  PByteArr = ^TByteArr;
  TDbgCallBack = procedure(p:pointer); cdecl;
  PDbgCallBack = ^TDbgCallBack;
  TAppType = (atBin, atCns, atGUI);

var
  DbgCallBack: PDbgCallBack = nil;
  AppType:TAppType = atBin;

{***** Some functions *********************************************************}
  procedure VMError(m: string);
  begin
    case AppType of
      atCns: begin
               writeln(m);
               halt;
             end;
      else
        raise Exception.Create(m);
    end;
  end;

  procedure CutLeftBytes(pb: PByteArr; cnt: cardinal);
  var
    i: cardinal;
  begin
    i := 0;
    while i <= cardinal(length(pb^)) - cnt do
     begin
       pb^[i] := pb^[i + cnt];
       inc(i);
     end;
    setlength(pb^, cardinal(length(pb^)) - cnt);
  end;

{***** Constant section *******************************************************}
type
  TConstType = (
    ctUnsigned64,
    ctInt64,
    ctDouble,
    ctString,
    ctStream
    );

type
  TConstSection = object
  private
    constants: array of pointer;
    procedure SetSize(sz: cardinal);
    procedure SetConst(id: cardinal; v: pointer);
  public
    procedure Parse(pb: PByteArr);
    function GetConst(id: cardinal): pointer;
  end;

  PConstSection = ^TConstSection;

  procedure TConstSection.SetSize(sz: cardinal);
  begin
    setlength(self.constants, sz);
  end;

  procedure TConstSection.SetConst(id: cardinal; v: pointer);
  begin
    self.constants[id] := v;
  end;

  {$HINTS OFF}
  procedure TConstSection.Parse(pb: PByteArr);
  var
    consts_count, bpos: cardinal;
    sl: word;
    s: string;
    stl: cardinal;
    st: TMemoryStream;
    d: double;
    i: int64;
  begin
    consts_count := cardinal((pb^[3] shl 24) + (pb^[2] shl 16) +
      (pb^[1] shl 8) + pb^[0]);
    bpos := 4;
    self.SetSize(consts_count);
    while consts_count > 0 do
    begin
      case TConstType(pb^[bpos]) of
        ctUnsigned64:
        begin
          self.SetConst(
            cardinal(length(self.constants)) - consts_count,
            TSVMMem.MCreateFW(cardinal((pb^[bpos + 4] shl 24) + (pb^[bpos + 3] shl 16) +
            (pb^[bpos + 2] shl 8) + pb^[bpos + 1]))
            );

          Inc(bpos, 5);
        end;

        ctInt64:
        begin
           PByte(@i + 7)^ := pb^[bpos + 1];
           PByte(@i + 6)^ := pb^[bpos + 2];
           PByte(@i + 5)^ := pb^[bpos + 3];
           PByte(@i + 4)^ := pb^[bpos + 4];
           PByte(@i + 3)^ := pb^[bpos + 5];
           PByte(@i + 2)^ := pb^[bpos + 6];
           PByte(@i + 1)^ := pb^[bpos + 7];
           PByte(@i)^ := pb^[bpos + 4];
           self.SetConst(
             cardinal(length(self.constants)) - consts_count, TSVMMem.MCreateF(i, svmtInt)
           );
          Inc(bpos, 9);
        end;

        ctDouble:
        begin
          PByte(@d + 7)^ := pb^[bpos + 1];
          PByte(@d + 6)^ := pb^[bpos + 2];
          PByte(@d + 5)^ := pb^[bpos + 3];
          PByte(@d + 4)^ := pb^[bpos + 4];
          PByte(@d + 3)^ := pb^[bpos + 5];
          PByte(@d + 2)^ := pb^[bpos + 6];
          PByte(@d + 1)^ := pb^[bpos + 7];
          PByte(@d)^ := pb^[bpos + 8];
          self.SetConst(
            cardinal(length(self.constants)) - consts_count, TSVMMem.MCreateF(d, svmtReal));
          Inc(bpos, 9);
        end;

        ctString:
        begin
          sl := (pb^[bpos + 1] shl 8) + pb^[bpos + 2];
          Inc(bpos, sl + 3);
          s := '';
          while sl > 0 do
          begin
            s := s + chr(pb^[bpos - sl]);
            Dec(sl);
          end;
          self.SetConst(cardinal(length(self.constants)) - consts_count, TSVMMem.MCreateFS(s));
        end;

        ctStream:
        begin
          stl := cardinal((pb^[bpos + 4] shl 24) +
            (pb^[bpos + 3] shl 16) + (pb^[bpos + 2] shl 8) +
            pb^[bpos + 1]);
          Inc(bpos, 5);
          st := TMemoryStream.Create;
          st.SetSize(stl);
          st.Seek(0,soFromBeginning);
          st.WriteBuffer(pb^[bpos], stl);
          st.Seek(0, soFromBeginning);
          Inc(bpos, stl);
          self.SetConst(cardinal(length(self.constants)) - consts_count,
                        TSVMMem.MCreateFW(Cardinal(Pointer(st))));
        end;
        else
          VMError('Error: resource section format not supported.');
      end;
      Dec(consts_count);
    end;
    CutLeftBytes(pb, bpos);
  end;
  {$HINTS ON}

  function TConstSection.GetConst(id: cardinal): pointer;
  begin
    Result := self.constants[id];
  end;

{***** Library list section ***************************************************}
type
  TLibraryListSection = object
  private
    libs: array of THandle;
    procedure SetSize(sz: word);
    procedure SetLibH(id: word; h: THandle);
  public
    procedure Parse(pb: PByteArr; mainclasspath: string);
    function GetLibH(id: word): THandle;
  end;

  procedure TLibraryListSection.SetSize(sz: word);
  begin
    setlength(self.libs, sz);
  end;

  procedure TLibraryListSection.SetLibH(id: word; h: THandle);
  begin
    self.libs[id] := h;
  end;

  procedure TLibraryListSection.Parse(pb: PByteArr; mainclasspath: string);
  var
    bpos: cardinal;
    lib_count, sl: word;
    s: string;
  begin
    lib_count := (pb^[0] shl 8) + pb^[1];
    bpos := 2;
    self.SetSize(lib_count);
    while lib_count > 0 do
    begin
      sl := (pb^[bpos] shl 8) + pb^[bpos + 1];
      Inc(bpos, sl + 2);
      s := '';
      while sl > 0 do
      begin
        s := s + chr(pb^[bpos - sl]);
        Dec(sl);
      end;
      if FileExists(ExtractFilePath(mainclasspath) + s) then
        s := ExtractFilePath(mainclasspath) + s
      else if FileExists(ExtractFilePath(ParamStr(0)) + 'lib\' + s) then
        s := ExtractFilePath(ParamStr(0)) + 'lib\' + s
      else if FileExists(ExtractFilePath(ParamStr(0)) + s) then
        s := ExtractFilePath(ParamStr(0)) + s
      else
        VMError('Error: can''t find library "' + s + '".');
      self.SetLibH(cardinal(length(self.libs)) - lib_count, LoadLibrary(s));
      Dec(lib_count);
    end;
    CutLeftBytes(pb, bpos);
  end;

  function TLibraryListSection.GetLibH(id: word): THandle;
  begin
    Result := self.libs[id];
  end;

{***** Import section *********************************************************}
type
  TCallingContext = record
    pVM: pointer;
    pStack: pointer;
    pGrabber: pointer;
  end;

  PCallingContext = ^TCallingContext;

  TExternalFunction = procedure(pCallingContext: pointer); stdcall;
  PExternalFunction = ^TExternalFunction;

type
  TImportSection = object
  private
    methods: array of PExternalFunction;
    procedure SetSize(sz: cardinal);
    procedure SetFunc(id: cardinal; p: PExternalFunction);
  public
    libs: TLibraryListSection;
    procedure Parse(pb: PByteArr; mainclasspath: string);
    function GetFunc(id: cardinal): PExternalFunction;
  end;

  PImportSection = ^TImportSection;

  procedure TImportSection.SetSize(sz: cardinal);
  begin
    setlength(self.methods, sz);
  end;

  procedure TImportSection.SetFunc(id: cardinal; p: PExternalFunction);
  begin
    self.methods[id] := p;
  end;

  procedure TImportSection.Parse(pb: PByteArr; mainclasspath: string);
  var
    methods_count, bpos: cardinal;
    lb: word;
    sl: byte;
    s: string;
    ssz: cardinal;
  begin
    ssz := length(self.methods);
    libs.Parse(pb, mainclasspath);
    if length(libs.libs) > 0 then
    begin
      methods_count := cardinal((pb^[3] shl 24) + (pb^[2] shl 16) +
        (pb^[1] shl 8) + pb^[0]);
      bpos := 4;
      self.SetSize(methods_count + ssz);
      while methods_count > 0 do
      begin
        lb := (pb^[bpos] shl 8) + pb^[bpos + 1];
        sl := pb^[bpos + 2];
        Inc(bpos, sl + 3);
        s := '';
        while sl > 0 do
        begin
          s := s + chr(pb^[bpos - sl]);
          Dec(sl);
        end;
        self.SetFunc(cardinal(length(self.methods)) - methods_count,
          GetProcAddress(libs.GetLibH(lb), s));
        Dec(methods_count);
      end;
      CutLeftBytes(pb, bpos);
    end;
  end;

  function TImportSection.GetFunc(id: cardinal): PExternalFunction;
  begin
    Result := self.methods[id];
  end;

{***** New array **************************************************************}

type
  TSizeArr = array of cardinal;
  PSizeArr = ^TSizeArr;

  function NewArr_Sub(size_arr: PSizeArr; lvl: word; Grabber: TGrabber): TSVMMem; inline;
  var
    i, l: cardinal;
    r: TSVMMem;
  begin
    Result := NewSVMM_Arr(size_arr^[length(size_arr^) - lvl], Grabber);
    if lvl > 0 then
     begin
       i := 0;
       l := size_arr^[length(size_arr^) - lvl];
       while i < l do
        begin
          if lvl - 1 > 0 then
           begin
             r := NewArr_Sub(size_arr, lvl - 1, Grabber);
             r.m_refc := 1;
             Result.ArrSet(i, r);
           end
          else
           Result.ArrSet(i, nil);
          inc(i);
        end;
     end;
  end;

  function NewArr(stk: PStack; lvl: word; Grabber: TGrabber): TSVMMem; inline;
  var
    size_arr: TSizeArr;
    i: word;
    r: TSVMMem;
  begin
    SetLength(size_arr, lvl);
    i := 0;
    while i < lvl do
     begin
       r := TSVMMem(stk^.popv);
       Dec(r.m_refc);
       size_arr[i] := r.GetW;
       inc(i);
     end;
    Result := NewArr_Sub(@size_arr, lvl, Grabber);
    //Result := TSVMMem.CreateArr(TSVMMem(stk^.popv).GetW);
  end;

{***** Try/Catch block manager ************************************************}
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
       //raise E;
       writeln('Unhandled exception <', E.ClassName, '>', sLineBreak,
               '- Message: "', E.Message, '"', sLineBreak,
               '- ThreadID: ', GetCurrentThreadId);
       ExitThread(1);
     end;
  end;

  function TTRBlocks.TR_Finally: TInstructionPointer; inline;
  begin
    Result := self.trblocks[length(self.trblocks) - 1].EndPoint;
    setlength(self.trblocks, length(self.trblocks) - 1);
  end;

{***** Context ****************************************************************}
type
  TSVMThreadContext = class
    public
      CtxMemory: PMemory;
      CtxStack: TStack;
      constructor Create(mem: PMemory; stack: PStack);
      destructor Destroy; override;
  end;

constructor TSVMThreadContext.Create(mem: PMemory; stack: PStack);
var
  c, l: cardinal;
begin
  inherited Create;
  new(CtxMemory);
  l := Length(mem^);
  SetLength(self.CtxMemory^, l);

  c := 0;
  while c < l do
   begin
     self.CtxMemory^[c] := mem^[c];
     Inc(c);
   end;

  self.CtxStack.init;
  l := stack^.i_pos;
  c := 0;

  while c < l do
   begin
     self.CtxStack.push(stack^.items[c]);
     Inc(c);
   end;
end;

destructor TSVMThreadContext.Destroy;
begin
  Dispose(self.CtxMemory);
  self.CtxStack.drop;
  inherited;
end;

{***** Global features ********************************************************}
var
  GrabbersStorage: TThreadList = nil;

procedure GlobalGC;
var
  lst: TList;
  c, l: cardinal;
begin
  try
    lst := GrabbersStorage.LockList;
    c := 0;
    l := lst.count;

    while c < l do
     begin
       if TGrabber(lst[c]).Stack.i_pos = 0 then
        begin
          TGrabber(lst[c]).Free;
          lst[c] := lst[l - 1];
          lst.delete(l - 1);
          dec(l);
          dec(c);
        end
       else
        TGrabber(lst[c]).Run;

       inc(c);
     end;
  finally
    GrabbersStorage.UnlockList;
  end;
end;

procedure GlobalTerm;
var
  lst: TList;
  l: cardinal;
begin
  try
    lst := GrabbersStorage.LockList;
    l := lst.count;

    while l > 0 do
     begin
       TGrabber(lst[l - 1]).Term;
       TGrabber(lst[l - 1]).Free;
       lst.delete(l - 1);

       dec(l);
     end;
  finally
    GrabbersStorage.UnlockList;
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
   Result := EXCEPTION_EXECUTE_HANDLER
  else
   begin
     Exception(ExceptionInfo^.ExceptionRecord^.ExceptionInformation[1]).Free;
     //ExceptionInfo^.ExceptionRecord^.ExceptionCode := 0;

     Result := EXCEPTION_CONTINUE_EXECUTION;
     VEHExceptions.Add(Pointer(GetCurrentThreadId));
     Inc(VEHExceptions_Count);
   end;
end;

{$EndIf}

{***** VM *********************************************************************}
type
  TSVM = object
  public
    ip,end_ip: TInstructionPointer;
    mainclasspath: string;
    mem: PMemory;
    //pmgrabber: TPMGrabber;
    grabber: TGrabber;
    stack: TStack;
    cbstack: TCallBackStack;
    bytes: PByteArr;
    consts: PConstSection;
    extern_methods: PImportSection;
    try_blocks: TTRBlocks;
    isMainThread: boolean;
    procedure Run;
    procedure RunThread;
    procedure LoadByteCodeFromFile(fn: string);
    procedure LoadByteCodeFromArray(b: TByteArr);
    procedure LoadContext(Ctx: TSVMThreadContext);
  end;

  PSVM = ^TSVM;

  TSVMThread = class(TThread)
  public
    vm: PSVM;
    constructor Create(bytes: PByteArr; consts: PConstSection;
      extern_methods: PImportSection; svm_memory:PMemory; method: TInstructionPointer;
      arg: pointer);
    procedure Execute; override;
    destructor Destroy; override;
  end;

  constructor TSVMThread.Create(bytes: PByteArr; consts: PConstSection;
    extern_methods: PImportSection; svm_memory:PMemory; method: TInstructionPointer;
    arg: pointer);
  var
    c, ml: cardinal;
    m: TSVMMem;
  begin
    FreeOnTerminate := True;
    new(vm);
    vm^.isMainThread := false;
    vm^.bytes := bytes;
    vm^.end_ip := length(bytes^);
    vm^.consts := consts;
    vm^.extern_methods := extern_methods;
    vm^.stack.init;
    vm^.cbstack.init;

    //fill mem map
    new(vm^.mem);
    ml := Length(svm_memory^);
    SetLength(vm^.mem^, ml);
    c := 0;
    while c < ml do
     begin
       vm^.mem^[c] := svm_memory^[c];

       if svm_memory^[c] <> nil then
        if TObject(svm_memory^[c]) is TSVMMem then
         Inc(TSVMMem(svm_memory^[c]).m_refc);

       inc(c);
     end;

    vm^.stack.push(arg);
    vm^.ip := method;
    vm^.grabber := TGrabber.Create;
    m := NewSVMM_Ref(self, vm^.grabber);
    m.m_refc := 1;
    vm^.stack.push(m);

    inherited Create(True);
  end;

  procedure TSVMThread.Execute;
  begin
    vm^.RunThread;
  end;

  destructor TSVMThread.Destroy;
  var
    c, ml: cardinal;
  begin
    ml := Length(vm^.mem^);
    c := 0;
    while c < ml do
     begin
       if vm^.mem^[c] <> nil then
        if TObject(vm^.mem^[c]) is TSVMMem then
         Dec(TSVMMem(vm^.mem^[c]).m_refc);

       inc(c);
     end;

    vm^.stack.drop;

    GrabbersStorage.Add(vm^.grabber);

    SetLength(vm^.mem^, 0);
    Dispose(vm^.mem);
    Dispose(vm);

    inherited Destroy;
  end;

  procedure TSVM.RunThread;
  var
    p, p2: pointer;
    r: TSVMMem;
    s: string;
    c: cardinal;
    pcctx: PCallingContext;
    {$IfDef Windows}
    lst: TList;
    {$EndIf}
  begin
    repeat
      try
        while self.ip < self.end_ip do
         begin
          {$IfDef DebugVer}
            writeln('IP: ', self.ip,', Op: ', GetEnumName(TypeInfo(TComand), self.bytes^[self.ip]));
          {$EndIf}

          {$IfDef Windows}
          if VEHExceptions_Count > 0 then
           try
             lst := VEHExceptions.LockList;

             p := Pointer(GetCurrentThreadId);
             if lst.IndexOf(p) <> -1 then
              begin
                while lst.IndexOf(p) <> -1 do
                 lst.Delete(lst.IndexOf(p));

                VEHExceptions_Count := lst.Count;

                p2 := NewSVMM_FS('Unknown exception.', Grabber);
                TSVMMem(p2).m_refc := 1;
                self.stack.push(p2);

                p2 := NewSVMM_FS('EUnknownException', Grabber);
                TSVMMem(p2).m_refc := 1;
                self.stack.push(p2);

                p := EUnknownException.Create('Unknown exception.');
                self.ip := try_blocks.TR_Catch(Exception(p));
                FreeAndNil(p);
              end;
           finally
             VEHExceptions.UnlockList;
           end;
          {$EndIf}

          case TComand(self.bytes^[self.ip]) of
            bcPH:
            begin
              c := cardinal(
                (self.bytes^[self.ip + 4] shl 24) + (self.bytes^[self.ip + 3] shl 16) +
                (self.bytes^[self.ip + 2] shl 8) +
                self.bytes^[self.ip + 1]);

              p := self.mem^[c];

              if p <> nil then
               //if TObject(p) is TSVMMem then
                Inc(TSVMMem(p).m_refc);

              self.stack.push(p);

              Inc(self.ip, 5);
            end;

            bcPK:
            begin
              c := cardinal(
                (self.bytes^[self.ip + 4] shl 24) + (self.bytes^[self.ip + 3] shl 16) +
                (self.bytes^[self.ip + 2] shl 8) +
                self.bytes^[self.ip + 1]);

              p := self.mem^[c];

              if p <> nil then
               //if TObject(p) is TSVMMem then
                Dec(TSVMMem(p).m_refc);

              p2 := self.stack.peek;

              self.mem^[c] := p2;

              if p2 <> nil then
               if TObject(p2) is TSVMMem then
                Inc(TSVMMem(p2).m_refc);

              Inc(self.ip, 5);
            end;

            bcPP:
            begin
              p := self.stack.popv;

              if p <> nil then
               //if TObject(p) is TSVMMem then
                Dec(TSVMMem(p).m_refc);

              Inc(self.ip);
            end;

            bcSDP:
            begin
              self.stack.drop;
              Inc(self.ip);
            end;

            bcSWP:
            begin
              self.stack.swp;
              Inc(self.ip);
            end;

            bcJP:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              self.ip := TSVMMem(p).GetW;
            end;

            bcJZ:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              if TSVMMem(p).GetI = 0 then
               begin
                 p := self.stack.popv;
                 Dec(TSVMMem(p).m_refc);

                 self.ip := TSVMMem(p).GetW;
               end
              else
                Inc(self.ip);
            end;

            bcJN:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              if TSVMMem(p).GetI <> 0 then
               begin
                 p := self.stack.popv;
                 Dec(TSVMMem(p).m_refc);

                 self.ip := TSVMMem(p).GetW;
               end
              else
                Inc(self.ip);
            end;

            bcJC:
            begin
              self.cbstack.push(self.ip + 1);
              {$IfDef DebugVer}writeln(' - Point to jump: ', TSVMMem(self.stack.peek).GetW);{$EndIf}

              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              self.ip := TSVMMem(p).GetW;
            end;

            bcJR:
            begin
              self.ip := Self.cbstack.popv;
            end;

            bcEQ:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              r := NewSVMM_F(TSVMMem(p).m_val^, TSVMMem(p).m_type, Grabber);

              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);
                                 
              r.m_refc := 1;
              self.stack.push(r);
              r.OpEq(TSVMMem(p));
              Inc(self.ip);
            end;

            bcBG:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              r := NewSVMM_F(TSVMMem(p).m_val^, TSVMMem(p).m_type, Grabber);

              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);
                                 
              r.m_refc := 1;
              self.stack.push(r);
              r.OpBg(TSVMMem(p));
              Inc(self.ip);
            end;

            bcBE:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);
              r := NewSVMM_F(TSVMMem(p).m_val^, TSVMMem(p).m_type, Grabber);

              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              r.m_refc := 1;
              self.stack.push(r);
              r.OpBe(TSVMMem(p));
              Inc(self.ip);
            end;

            bcNOT:
            begin
              TSVMMem(self.stack.peek).OpNot;
              Inc(self.ip);
            end;

            bcAND:
            begin
              p := self.stack.popv;

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              self.stack.push(p);
              TSVMMem(p).OpAnd(TSVMMem(p2));
              Inc(self.ip);
            end;

            bcOR:
            begin
              p := self.stack.popv;

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              self.stack.push(p);
              TSVMMem(p).OpOr(TSVMMem(p2));
              Inc(self.ip);
            end;

            bcXOR:
            begin
              p := self.stack.popv;

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              self.stack.push(p);
              TSVMMem(p).OpXor(TSVMMem(p2));
              Inc(self.ip);
            end;

            bcSHR:
            begin
              p := self.stack.popv;

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              self.stack.push(p);
              TSVMMem(p).OpSHR(TSVMMem(p2));
              Inc(self.ip);
            end;

            bcSHL:
            begin
              p := self.stack.popv;

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              self.stack.push(p);
              TSVMMem(p).OpSHL(TSVMMem(p2));
              Inc(self.ip);
            end;

            bcNEG:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);
              r := NewSVMM_F(TSVMMem(p).m_val^, TSVMMem(p).m_type, Grabber);
              r.OpNeg;
              r.m_refc := 1;
              self.stack.push(r);
              Inc(self.ip);
            end;

            bcINC:
            begin
              TSVMMem(self.stack.peek).OpInc;
              Inc(self.ip);
            end;

            bcDEC:
            begin
              TSVMMem(self.stack.peek).OpDec;
              Inc(self.ip);
            end;

            bcADD:
            begin
              p := self.stack.popv;

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              self.stack.push(p);
              TSVMMem(p).OpAdd(TSVMMem(p2));
              Inc(self.ip);
            end;

            bcSUB:
            begin
              p := self.stack.popv;

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              self.stack.push(p);
              TSVMMem(p).OpSub(TSVMMem(p2));
              Inc(self.ip);
            end;

            bcMUL:
            begin
              p := self.stack.popv;

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              self.stack.push(p);
              TSVMMem(p).OpMul(TSVMMem(p2));
              Inc(self.ip);
            end;

            bcDIV:
            begin
              p := self.stack.popv;

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              self.stack.push(p);
              TSVMMem(p).OpDiv(TSVMMem(p2));
              Inc(self.ip);
            end;

            bcMOD:
            begin
              p := self.stack.popv;

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              self.stack.push(p);
              TSVMMem(p).OpMod(TSVMMem(p2));
              Inc(self.ip);
            end;

            bcIDIV:
            begin
              p := self.stack.popv;

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              self.stack.push(p);
              TSVMMem(p).OpIDiv(TSVMMem(p2));
              Inc(self.ip);
            end;
			
	    bcMV:
	    begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

	      TSVMMem(p).SetM(TSVMMem(p2));
	      Inc(self.ip);
	    end;
			
	    bcMVBP:
	    begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);


              {$HINTS OFF}
              TSVMMem(Pointer(TSVMMem(p).GetW)).SetM(TSVMMem(p2));
              {$HINTS ON}
              Inc(self.ip);
	    end;
			
	    bcGVBP:
	    begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              {$HINTS OFF}
              r := TSVMMem(Pointer(TSVMMem(p).GetW));
	      self.stack.push(r);

              Inc(r.m_refc);
              {$HINTS ON}
              Inc(self.ip);
	    end;
			
	    bcMVP:
	    begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              {$HINTS OFF}
              p2 := self.stack.popv;

              if p2 <> nil then
               if TObject(p2) is TSVMMem then
                Dec(TSVMMem(p2).m_refc);

              TSVMMem(p).SetW(LongWord(p2));
              {$HINTS ON}

              Inc(self.ip);
	    end;

            bcMS:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              SetLength(self.mem^, TSVMMem(p).GetW);
              {$IfDef DebugVer} writeln(' - Mem size: ', Length(self.mem^)); {$EndIf}
              Inc(self.ip);
            end;

            bcNW:
            begin
              r := NewSVMM(Grabber);
              r.m_refc := 1;
              self.stack.push(r);
              Inc(self.ip);
            end;

            bcMC:
            begin
              r := CreateSVMMemCopy(TSVMMem(self.stack.peek), Grabber);
              r.m_refc := 1;
              self.stack.push(r);
              Inc(self.ip);
            end;

            bcMD:
            begin
              p := self.stack.peek;
              if p <> nil then
               //if TObject(p) is TSVMMem then
                Inc(TSVMMem(p).m_refc);

              self.stack.push(p);
              Inc(self.ip);
            end;

            {bcRM:
            begin
              grabber.heap.Remove(self.stack.peek);
              p := self.stack.popv;
              FreeAndNil(p);
              Inc(self.ip);
            end;}

            {bcGPM:
            begin
              pmgrabber.AddTask(stack.peek);
              Inc(self.ip);
            end;}

            bcGC:
            begin
              //pmgrabber.run;
              grabber.Run;

              if isMainThread then
               GlobalGC;

              Inc(self.ip);
            end;

            bcNA:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              r := NewArr(@self.stack, Cardinal(TSVMMem(p).GetW), self.Grabber);
              r.m_refc := 1;
              self.stack.push(r);
              Inc(self.ip);
            end;

            bcTF:
            begin
              p := self.stack.popv;
              if TObject(p) is TSVMMem then
               begin
                 Dec(TSVMMem(p).m_refc);

                 r := NewSVMM_FW(byte(TSVMMem(p).m_type), Grabber);
                 r.m_refc := 1;
                 self.stack.push(r);
               end
              else
               begin
                 r := NewSVMM_FW(byte(TSVMTypeAddr), Grabber);
                 r.m_refc := 1;
                 self.stack.push(r);
               end;

              Inc(self.ip);
            end;

            bcTMC:
            begin
              TSVMMem(self.stack.peek).m_type := svmtClass;
              Inc(self.ip)
            end;

            bcSF:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              r := NewSVMM_FW(TSVMMem(p).GetSize, Grabber);
              r.m_refc := 1;
              self.stack.push(r);
              Inc(self.ip);
            end;

            bcAL:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              r := NewSVMM_FW(TSVMMem(p).ArrGetSize, Grabber);
              r.m_refc := 1;
              self.stack.push(r);
              Inc(self.ip);
            end;

            bcSL:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              TSVMMem(self.stack.peek).ArrSetSize(TSVMMem(p).GetW);
              Inc(self.ip);
            end;

            bcPA:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              p2 := TSVMMem(p).ArrGet(r.GetW, Grabber);

              if p2 <> nil then
               if TObject(p2) is TSVMMem then
                Inc(TSVMMem(p2).m_refc);

              self.stack.push(p2);
              Inc(self.ip);
            end;

            bcSA:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              TSVMMem(p).ArrSet(r.GetW, self.stack.popv);
              Inc(self.ip);
            end;

            bcPHC:
            begin
              r := CreateSVMMemCopy(TSVMMem(self.consts^.GetConst(
                    cardinal((self.bytes^[self.ip + 4] shl 24) + (self.bytes^[self.ip + 3] shl 16) +
                             (self.bytes^[self.ip + 2] shl 8) + self.bytes^[self.ip + 1]
                            ))
                    ), Grabber);
              r.m_refc := 1;

              self.stack.push(r);

              Inc(self.ip, 5);
            end;

            bcPHCP:
            begin
              self.stack.push(TSVMMem(self.consts^.GetConst(
                    cardinal((self.bytes^[self.ip + 4] shl 24) + (self.bytes^[self.ip + 3] shl 16) +
                             (self.bytes^[self.ip + 2] shl 8) + self.bytes^[self.ip + 1]
                            )
                    )));

              Inc(self.ip, 5);
            end;

            bcINV:
            begin
              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              new(pcctx);

              pcctx^.pVM := @self;
              pcctx^.pStack := @self.stack;
              pcctx^.pGrabber := grabber;

              TExternalFunction(self.extern_methods^.GetFunc(r.GetW))(pcctx);

              dispose(pcctx);

              Inc(self.ip);
            end;

            bcPHN:
            begin
              r := NewSVMM(self.grabber);
              r.m_refc := 1;

              self.stack.push(r);
              Inc(self.ip);
            end;

            bcCTHR:
            begin
              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              p := self.stack.popv; // don't touch ref cnt because new thread will have it in stack.

              p2 := NewSVMM_Ref(TSVMThread.Create(self.bytes, self.consts,
                                                  self.extern_methods,
                                                  self.mem, r.GetW, p),
                                self.grabber);
              TSVMMem(p2).m_refc := 1;

              self.stack.push(p2);
              Inc(self.ip);
            end;

            bcSTHR:
            begin
              {$WARNINGS OFF}
              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              TSVMThread(r.m_val).Suspend;
              {$WARNINGS ON}
              Inc(self.ip);
            end;

            bcRTHR:
            begin
              {$WARNINGS OFF}
              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              TSVMThread(r.m_val).Resume;
              {$WARNINGS ON}
              Inc(self.ip);
            end;

            bcTTHR:
            begin
              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              TSVMThread(r.m_val).Terminate;
              Inc(self.ip);
            end;

            bcTHSP:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              TSVMThread(TSVMMem(p).m_val).Priority := TThreadPriority(r.GetW);
              Inc(self.ip);
            end;

            bcPLC:
            begin
              r := NewSVMM_FW(self.cbstack.peek, Grabber);
              r.m_refc := 1;
              self.stack.push(r);
              Inc(self.ip);
            end;

            bcPCT:
            begin
              self.stack.push(TSVMThreadContext.Create(self.mem, @self.stack));
              Inc(self.ip);
            end;

            bcLCT:
            begin
              self.LoadContext(TSVMThreadContext(self.stack.popv));
              Inc(self.ip);
            end;

            bcJRX:
            begin
              Self.cbstack.pop;
              self.ip := Self.cbstack.popv;
            end;

            bcTR:
            begin
              p := self.stack.popv;
              Dec(TSVMMem(p).m_refc);

              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              try_blocks.add(TSVMMem(p).GetW, r.GetW);
              Inc(self.ip);
            end;

            bcTRS:
            begin
              self.ip := try_blocks.TR_Finally;
            end;

            bcTRR:
            begin
              p := EUnhandledVirtualRaisedException.Create('At point 0x' + IntToHex(self.ip, 8));
              self.ip := try_blocks.TR_Catch(Exception(p));
              FreeAndNil(p);
            end;

            {** for string's **}

            bcSTRD:
            begin// strdel;
              p := self.stack.popv;

              r := TSVMMem(p);
              Dec(r.m_refc);
              S := String(r.GetS);

              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              p2 := self.stack.popv;
              Dec(TSVMMem(p2).m_refc);

              System.Delete(s, TSVMMem(p2).GetW + 1, r.GetW);
              TSVMMem(p).SetS(s);
              S := '';
              Inc(self.ip);
            end;

            bcCHORD:
            begin
              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              p := NewSVMM_FW(Ord(r.GetS[1]), Grabber);
              TSVMMem(p).m_refc := 1;

              self.stack.push(p);
	      Inc(self.ip);
            end;

            bcORDCH:
            begin
              r := TSVMMem(self.stack.popv);
              Dec(r.m_refc);

              p := NewSVMM_FS(Chr(r.GetW), Grabber);
              TSVMMem(p).m_refc := 1;

              self.stack.push(p);
              Inc(self.ip);
            end;

            bcTHREXT:
            begin
              self.ip := self.end_ip;
              break;
            end;

            bcDBP:
            begin
              TDbgCallBack(DbgCallBack)(@self);
              //TExternalFunction(self.extern_methods^.methods[0])(@self);
              Inc(self.ip);
            end;

            else
              VMError('Error: not supported operation, byte 0x' + IntToHex(self.bytes^[self.ip], 2) +
                ', at #' + IntToStr(self.ip));
          end;
          end;
      except
        on E: Exception do
        begin
          p := NewSVMM_FS(E.Message, Grabber);
          TSVMMem(p).m_refc := 1;

          p2 := NewSVMM_FS(E.ClassName, Grabber);
          TSVMMem(p2).m_refc := 1;

          self.stack.push(p);
          self.stack.push(p2);
          self.ip := self.try_blocks.TR_Catch(E);
        end;
      end;
    until self.ip >= self.end_ip;
  end;

  procedure TSVM.Run;
  var
    c: Cardinal;
    r: TSVMMem;
    s: string;
  begin
    if GrabbersStorage = nil then
     GrabbersStorage := TThreadList.Create;

    extern_methods^.Parse(self.bytes, mainclasspath);
    consts^.Parse(self.bytes);
    self.ip := 0;
    self.end_ip := length(self.bytes^);
    {$IfDef DebugVer}
      c := 0;
      while c < Length(consts^.constants) do
       begin
         write('ConstID: ', c, ', Val: ');
         case TSVMMem(consts^.constants[c]).m_type of
           svmtInt: writeln(TSVMMem(consts^.constants[c]).GetI);
           svmtWord: writeln(TSVMMem(consts^.constants[c]).GetW);
           svmtReal: writeln(TSVMMem(consts^.constants[c]).GetD);
           svmtStr: writeln(TSVMMem(consts^.constants[c]).GetS);
           else
             writeln('<section>');
         end;
         inc(c);
       end;
    {$EndIf}

    self.grabber := TGrabber.Create({self.mem, @self.stack});
   // self.pmgrabber.Init(grabber);

    c := ParamCount;
    while c > 1 do
     begin
       r := NewSVMM_FS(ParamStr(c), Grabber);
       r.m_refc := 1;
       self.stack.push(r);
       dec(c);
     end;

    s := ParamStr(1);
    if pos(':', s) < 0 then
     s := ExtractFilePath(ParamStr(0));

    r := NewSVMM_FS(s, Grabber);
    r.m_refc := 1;

    self.stack.push(r);

    r := NewSVMM_FW(ParamCount, Grabber);
    r.m_refc := 1;
    self.stack.push(r);

    self.RunThread;
    self.grabber.Term;

    GlobalTerm;

    FreeAndNil(self.grabber);
    FreeAndNil(GrabbersStorage);
  end;

  procedure TSVM.LoadByteCodeFromFile(fn: string);
  var
    f: file of byte;
  begin
    Self.MainClassPath := fn;
    AssignFile(f, fn);
    Reset(f);
    SetLength(self.bytes^, 0);
    while not EOF(f) do
    begin
      SetLength(self.bytes^, Length(self.bytes^) + 1);
      Read(f, self.bytes^[Length(self.bytes^) - 1]);
    end;
    CloseFile(f);
  end;

  procedure TSVM.LoadByteCodeFromArray(b: TByteArr);
  var
    i: cardinal;
  begin
    Self.mainclasspath := ParamStr(1);
    setlength(self.bytes^, length(b));
    for i := 0 to length(b) - 1 do
      self.bytes^[i] := b[i];
  end;

  procedure TSVM.LoadContext(Ctx: TSVMThreadContext);
  var
    p: pointer;
    c, l: cardinal;
  begin
    p := self.mem;
    self.mem := Ctx.CtxMemory;
    Ctx.CtxMemory := p;

    self.stack.drop;
    l := Ctx.CtxStack.i_pos;
    c := 0;

    while c < l do
     begin
       self.stack.push(Ctx.CtxStack.items[c]);
       Inc(c);
     end;
  end;

{***** Main *******************************************************************}
{$ifdef BuildInLibrary}

function SVM_Create:PSVM; stdcall;
begin
  New(Result);
  new(Result^.bytes);
  New(Result^.consts);
  New(Result^.extern_methods);
  New(Result^.mem);
  Result^.isMainThread := true;
  Result^.stack.init(Result);
  Result^.cbstack.init;
  Result^.grabber.init;
end;

procedure SVM_Free(SVM:PSVM); stdcall;
begin
  Dispose(SVM^.consts);
  Dispose(SVM^.extern_methods);
  Dispose(SVM^.mem);
  Dispose(SVM^.bytes);
  Dispose(SVM);
end;

procedure SVM_RegAPI(SVM:PSVM; ExtFunc:Pointer); stdcall;
begin
  SVM^.extern_methods^.SetSize(Length(SVM^.extern_methods^.methods)+1);
  SVM^.extern_methods^.SetFunc(Length(SVM^.extern_methods^.methods)-1, ExtFunc);
end;

procedure SVM_SetDbgCallBack(SVM:PSVM; DbgCB:Pointer); stdcall;
begin
  DbgCallBack := DbgCB;
end;

procedure SVM_Run(SVM:PSVM); stdcall;
begin
  SVM^.Run;
end;

procedure SVM_LoadExeFromFile(SVM:PSVM; MainClassPath:PString); stdcall;
begin
  SVM^.mainclasspath := MainClassPath^;
  SVM^.LoadByteCodeFromFile(SVM^.mainclasspath);
end;

procedure SVM_CheckErr(SVM:PSVM; E:Exception); stdcall;
begin
  SVM^.try_blocks.TR_Catch(E);
end;

procedure SVM_Continue(SVM:PSVM); stdcall;
begin
  Inc(SVM^.ip);
  SVM^.RunThread;
end;

exports SVM_Create          name '_SVM_CREATE';
exports SVM_Free            name '_SVM_FREE';
exports SVM_LoadExeFromFile name '_SVM_LOADEXEFROMFILE';
exports SVM_Run             name '_SVM_RUN';
exports SVM_RegAPI          name '_SVM_REGAPI';
exports SVM_SetDbgCallBack  name '_SVM_DEBUGCALLBACK';
exports SVM_CheckErr        name '_SVM_CHECKERR';
exports SVM_Continue        name '_SVM_CONTINUE';

begin
end.

{$else}

procedure CheckHeader(pb:PByteArr);
begin
  if Length(pb^) >= 10 then
   begin
     if (chr(pb^[0]) = 'S') and (chr(pb^[1]) = 'V') and (chr(pb^[2]) = 'M') and
        (chr(pb^[3]) = 'E') and (chr(pb^[4]) = 'X') and (chr(pb^[5]) = 'E') and
        (chr(pb^[6]) = '_') and (chr(pb^[7]) = 'C') and (chr(pb^[8]) = 'N') and
        (chr(pb^[9]) = 'S') then
         begin
           {$ifdef Windows}
             {$ifdef BuildGUI}
               AllocConsole;
             {$endif}
           {$endif}
           AppType := atCns;
           Exit;
         end;
     if (chr(pb^[0]) = 'S') and (chr(pb^[1]) = 'V') and (chr(pb^[2]) = 'M') and
        (chr(pb^[3]) = 'E') and (chr(pb^[4]) = 'X') and (chr(pb^[5]) = 'E') and
        (chr(pb^[6]) = '_') and (chr(pb^[7]) = 'G') and (chr(pb^[8]) = 'U') and
        (chr(pb^[9]) = 'I') then
         begin
           {$ifdef Windows}
             {$ifndef BuildGUI}
               FreeConsole;
             {$endif}
           {$endif}
           AppType := atGUI;
           Exit;
         end;
   end;
  raise Exception.Create('Error: Invalid SVMEXE-file header!');
  halt;
end;

var
  svm:TSVM;
  {$IfDef Windows}
    SEH_Handler: Pointer;
  {$EndIf}
begin
  {$IfDef Windows}
    VEHExceptions := TThreadList.Create;
    //VEHExceptions.;

    SEH_Handler := nil;
    SEH_Handler := AddVectoredExceptionHandler(0, @WinSVMVectoredHandler);
  {$EndIf}

  if ParamCount<1 then
   begin
     writeln('MASH!');
     writeln('Stack-based virtual machine.');
     writeln('Version: 1.9');
	 writeln('Using: ',ExtractFileName(ParamStr(0)),' <svmexe file> [args]');
   end;

  new(svm.bytes);
  new(svm.consts);
  new(svm.extern_methods);
  new(svm.mem);

  svm.isMainThread := true;
  svm.stack.init;
  svm.cbstack.init;
  svm.LoadByteCodeFromFile(ParamStr(1));
  CheckHeader(svm.bytes);
  CutLeftBytes(svm.bytes,10);
  svm.Run;

  {$IfDef Windows}
    if SEH_Handler <> nil then
     RemoveVectoredExceptionHandler(SEH_Handler);

    FreeAndNil(VEHExceptions);
  {$EndIf}
end.
{$endif}
