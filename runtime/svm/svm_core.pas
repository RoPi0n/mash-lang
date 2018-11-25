//{$Define BuildInLibrary}

{$IfDef BuildInLibrary}
  library svm_core;
{$Else}
  program svm_core;
  //{$apptype gui}
  //{$define BuildGUI}
{$EndIf}

uses
  {$IfDef UNIX}
  cthreads,
  {$EndIf}
  SysUtils,
  dynlibs,
  variants,
  Classes;

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
    bcLAND,   // [top] = [top] and [top-1]
    bcLOR,    // [top] = [top] or [top-1]
    bcLXOR,   // [top] = [top] xor [top-1]
    bcLNOT,   // [top] = not [top]

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
    bcRM,     // rem @[top]
    bcNA,     // [top] = @new array[  [top]  ] of pointer

    {** array's **}
    bcSF,     // sizeof( [top] as object )
    bcAL,     // length( [top] as array )
    bcSL,     // setlength( [top] as array, {stack} )

    bcPA,     // push ([top] as array)[top-1]
    bcSA,     // peek [top-2] -> ([top] as array)[top-1]

    {** memory grabber **}
    bcGPM,    // add pointer to TMem to grabber task-list
    bcGC,     // run grabber

    {** constant's **}
    bcPHC,    // push const

    {** external call's **}
    bcPHEXMP, // push pointer to external method
    bcINV,    // call external method
    bcINVBP,  // call external method by pointer [top]

    {** for thread's **}
    bcPHN,    // push null
    bcCTHR,   // [top] = thread(method = [top], arg = [top+1]):id
    bcSTHR,   // suspendthread(id = [top])
    bcRTHR,   // resumethread(id = [top])
    bcTTHR,   // terminatethread(id = [top])

    {** for try..catch..finally block's **}
    bcTR,     // try @block_catch = [top], @block_end = [top+1]
    bcTRS,    // success exit from try/catch block
    bcTRR,    // raise exception, message = [top]

    {** for word's **}
    bcEQ_W,     // [top] == [top-1] ? [top] = 1 : [top] = 0
    bcBG_W,     // [top] >  [top-1] ? [top] = 1 : [top] = 0
    bcBE_W,     // [top] >= [top-1] ? [top] = 1 : [top] = 0

    bcNOT_W,    // [top] = ![top]
    bcAND_W,    // [top] = [top] and [top-1]
    bcOR_W,     // [top] = [top] or  [top-1]
    bcXOR_W,    // [top] = [top] xor [top-1]
    bcSHR_W,    // [top] = [top] shr [top-1]
    bcSHL_W,    // [top] = [top] shl [top-1]

    bcINC_W,    // [top]++
    bcDEC_W,    // [top]--
    bcADD_W,    // [top] = [top] + [top-1]
    bcSUB_W,    // [top] = [top] - [top-1]
    bcMUL_W,    // [top] = [top] * [top-1]
    bcDIV_W,    // [top] = [top] / [top-1]
    bcMOD_W,    // [top] = [top] % [top-1]
    bcIDIV_W,   // [top] = [top] \ [top-1]

    bcMV_W,     // [top]^ = [top-1]^
    bcMVBP_W,   // [top]^^ = [top-1]^

    {** for integer's **}
    bcEQ_I,     // [top] == [top-1] ? [top] = 1 : [top] = 0
    bcBG_I,     // [top] >  [top-1] ? [top] = 1 : [top] = 0
    bcBE_I,     // [top] >= [top-1] ? [top] = 1 : [top] = 0

    bcNOT_I,    // [top] = ![top]
    bcAND_I,    // [top] = [top] and [top-1]
    bcOR_I,     // [top] = [top] or  [top-1]
    bcXOR_I,    // [top] = [top] xor [top-1]
    bcSHR_I,    // [top] = [top] shr [top-1]
    bcSHL_I,    // [top] = [top] shl [top-1]

    bcNEG_I,    // [top] = -[top]
    bcINC_I,    // [top]++
    bcDEC_I,    // [top]--
    bcADD_I,    // [top] = [top] + [top-1]
    bcSUB_I,    // [top] = [top] - [top-1]
    bcMUL_I,    // [top] = [top] * [top-1]
    bcDIV_I,    // [top] = [top] / [top-1]
    bcMOD_I,    // [top] = [top] % [top-1]
    bcIDIV_I,   // [top] = [top] \ [top-1]

    bcMV_I,     // [top]^ = [top-1]^
    bcMVBP_I,   // [top]^^ = [top-1]^

    {** for digit's with floating point **}
    bcEQ_D,     // [top] == [top-1] ? [top] = 1 : [top] = 0
    bcBG_D,     // [top] >  [top-1] ? [top] = 1 : [top] = 0
    bcBE_D,     // [top] >= [top-1] ? [top] = 1 : [top] = 0

    bcNEG_D,    // [top] = -[top]
    bcINC_D,    // [top]++
    bcDEC_D,    // [top]--
    bcADD_D,    // [top] = [top] + [top-1]
    bcSUB_D,    // [top] = [top] - [top-1]
    bcMUL_D,    // [top] = [top] * [top-1]
    bcDIV_D,    // [top] = [top] / [top-1]
    bcMOD_D,    // [top] = [top] % [top-1]
    bcIDIV_D,   // [top] = [top] \ [top-1]

    bcMV_D,     // [top]^ = [top-1]^
    bcMVBP_D,   // [top]^^ = [top-1]^

    {** for string's **}
    bcEQ_S,
    bcADD_S,
    bcMV_S,
    bcMVBP_S,
    bcSTRL,     // strlen
    bcSTRD,     // strdel
    bcSTCHATP,  // push str[x]
    bcSTCHATK,  // peek str[x]
    bcCHORD,
    bcORDCH,

    {** [!] directly memory operations **}
    bcALLC,  //alloc memory
    bcRALLC, //realloc memory
    bcDISP,  //dispose memory
    bcGTB,   //get byte
    bcSTB,   //set byte
    bcCBP,   //mem copy
    bcRWBP,  //read word
    bcWWBP,  //write word
    bcRIBP,  //read int
    bcWIBP,  //write int
    bcRFBP,  //read float
    bcWFBP,  //write float
    bcRSBP,  //read string
    bcWSBP,  //write string

    bcTHREXT //stop code execution
    );

{***** Global consts **********************************************************}
  //const
  // null = '';

{***** Types ******************************************************************}
type
  TInstructionPointer = cardinal;
  //PInstructionPointer = ^TInstructionPointer;
  TMem = variant;
  PMem = ^TMem;
  TMemArr = array of pointer;
  PMemArr = ^TMemArr;
  TMemory = array of pointer;
  PMemory = ^TMemory;
  PPointer = ^Pointer;
  TByteArr = array of byte;
  PByteArr = ^TByteArr;

{***** Some functions *********************************************************}
  procedure VMError(m: string);
  begin
    {$ifdef BuildGUI}
    raise Exception.Create(m);
    {$else}
    writeln(m);
    halt;
    {$endif}
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
    constants: array of variant;
    procedure SetSize(sz: cardinal);
    procedure SetConst(id: cardinal; v: variant);
  public
    procedure Parse(pb: PByteArr);
    function GetConst(id: cardinal): variant;
  end;

  PConstSection = ^TConstSection;

  procedure TConstSection.SetSize(sz: cardinal);
  begin
    setlength(self.constants, sz);
  end;

  procedure TConstSection.SetConst(id: cardinal; v: variant);
  begin
    self.constants[id] := v;
  end;

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
    consts_count := cardinal((pb^[0] shl 24) + (pb^[1] shl 16) +
      (pb^[2] shl 8) + pb^[3]);
    bpos := 4;
    self.SetSize(consts_count);
    while consts_count > 0 do
    begin
      case TConstType(pb^[bpos]) of
        ctUnsigned64:
        begin
          self.SetConst(
            cardinal(length(self.constants)) - consts_count,
            cardinal((pb^[bpos + 1] shl 24) + (pb^[bpos + 2] shl 16) +
            (pb^[bpos + 3] shl 8) + pb^[bpos + 4])
            );
          Inc(bpos, 5);
        end;

        ctInt64:
        begin
           PByte(Cardinal(@i) + 7)^ := pb^[bpos + 1];
           PByte(Cardinal(@i) + 6)^ := pb^[bpos + 2];
           PByte(Cardinal(@i) + 5)^ := pb^[bpos + 3];
           PByte(Cardinal(@i) + 4)^ := pb^[bpos + 4];
           PByte(Cardinal(@i) + 3)^ := pb^[bpos + 5];
           PByte(Cardinal(@i) + 2)^ := pb^[bpos + 6];
           PByte(Cardinal(@i) + 1)^ := pb^[bpos + 7];
           PByte(Cardinal(@i))^ := pb^[bpos + 4];
           self.SetConst(
             cardinal(length(self.constants)) - consts_count, i
           );
          Inc(bpos, 9);
        end;

        ctDouble:
        begin
          PByte(Cardinal(@d) + 7)^ := pb^[bpos + 1];
          PByte(Cardinal(@d) + 6)^ := pb^[bpos + 2];
          PByte(Cardinal(@d) + 5)^ := pb^[bpos + 3];
          PByte(Cardinal(@d) + 4)^ := pb^[bpos + 4];
          PByte(Cardinal(@d) + 3)^ := pb^[bpos + 5];
          PByte(Cardinal(@d) + 2)^ := pb^[bpos + 6];
          PByte(Cardinal(@d) + 1)^ := pb^[bpos + 7];
          PByte(Cardinal(@d))^ := pb^[bpos + 8];
          self.SetConst(
            cardinal(length(self.constants)) - consts_count, d);
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
          self.SetConst(cardinal(length(self.constants)) - consts_count, s);
        end;

        ctStream:
        begin
          stl := cardinal((pb^[bpos + 1] shl 24) +
            (pb^[bpos + 2] shl 16) + (pb^[bpos + 3] shl 8) +
            pb^[bpos + 4]);
          Inc(bpos, 5);
          st := TMemoryStream.Create;
          st.SetSize(stl);
          st.Seek(0,soFromBeginning);
          st.WriteBuffer(pb^[bpos], stl);
          st.Seek(0, soFromBeginning);
          Inc(bpos, stl);
          self.SetConst(cardinal(length(self.constants)) -
            consts_count, cardinal(Pointer(st)));
        end;
        else
          VMError('Error: resource section format not supported.');
      end;
      Dec(consts_count);
    end;
    CutLeftBytes(pb, bpos);
  end;

  function TConstSection.GetConst(id: cardinal): variant;
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
    lib_count := cardinal((pb^[0] shl 8) + pb^[1]);
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
  TExternalFunction = procedure(st: pointer); cdecl;
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
  begin
    libs.Parse(pb, mainclasspath);
    if length(libs.libs) > 0 then
    begin
      methods_count := cardinal((pb^[0] shl 24) + (pb^[1] shl 16) +
        (pb^[2] shl 8) + pb^[3]);
      bpos := 4;
      self.SetSize(methods_count);
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

{***** Memory ops *************************************************************}
  function NewMemV(v: variant): PMem;
  begin
    new(Result);
    Result^ := v;
  end;

  function NewMem: PMem;
  begin
    new(Result);
  end;

  procedure RemMem(p: PMem);
  begin
    FreeMem(p);
  end;

{***** Stack ******************************************************************}
type
  TStack = object
  public
    items: array of pointer;
    procedure push(p: pointer);
    function peek: pointer;
    procedure pop;
    function popv: pointer;
    procedure swp;
    procedure drop;
  end;

type
  PStack = ^TStack;

  procedure TStack.push(p: pointer);
  begin
    setlength(self.items, length(self.items) + 1);
    self.items[length(self.items) - 1] := p;
  end;

  function TStack.peek: pointer;
  begin
    Result := self.items[length(self.items) - 1];
  end;

  procedure TStack.pop;
  begin
    setlength(self.items, length(self.items) - 1);
  end;

  function TStack.popv: pointer;
  begin
    Result := self.items[length(self.items) - 1];
    setlength(self.items, length(self.items) - 1);
  end;

  procedure TStack.swp;
  var
    p: pointer;
  begin
    p := self.items[length(self.items) - 2];
    self.items[length(self.items) - 2] := self.items[length(self.items) - 1];
    self.items[length(self.items) - 1] := p;
  end;

  procedure TStack.drop;
  begin
    SetLength(self.items,0);
  end;

{***** New array **************************************************************}

type
  TSizeArr = array of cardinal;
  PSizeArr = ^TSizeArr;

  function NewArr_Sub(size_arr: PSizeArr; lvl: word): PMemArr;
  var
    i: cardinal;
  begin
    if lvl > 0 then
    begin
      new(Result);
      setlength(Result^, size_arr^[length(size_arr^) - lvl]);
      for i := 0 to size_arr^[length(size_arr^) - lvl] do
      begin
        Result^[i] := NewArr_Sub(size_arr, lvl - 1);
      end;
    end
    else
      Result := nil;
  end;

  function NewArr(stk: PStack; lvl: word): PMemArr;
  var
    size_arr: TSizeArr;
    i: word;
  begin
    SetLength(size_arr, lvl);
    for i := 0 to lvl - 1 do
      size_arr[i] := Cardinal(PMem(stk^.popv)^);
    Result := NewArr_Sub(@size_arr, lvl);
  end;

{***** CallBack stack *********************************************************}
type
  TCallBackStack = object
  public
    items: array of TInstructionPointer;
    procedure push(ip: TInstructionPointer);
    function peek: TInstructionPointer;
    function popv: TInstructionPointer;
    procedure pop;
  end;

  procedure TCallBackStack.push(ip: TInstructionPointer);
  begin
    setlength(self.items, length(self.items) + 1);
    self.items[length(self.items) - 1] := ip;
  end;

  function TCallBackStack.popv: TInstructionPointer;
  begin
    Result := self.items[length(items) - 1];
    setlength(self.items, length(self.items) - 1);
  end;

  function TCallBackStack.peek: TInstructionPointer;
  begin
    Result := self.items[length(self.items) - 1];
  end;

  procedure TCallBackStack.pop;
  begin
    setlength(self.items, length(self.items) - 1);
  end;

{***** Try/Catch block manager ************************************************}
type
  TTRBlock = record
    CatchPoint, EndPoint: TInstructionPointer;
  end;

  TTRBlocks = object
  public
    trblocks: array of TTRBlock;
    procedure add(CP, EP: TInstructionPointer);
    function TR_Catch(E: Exception): TInstructionPointer;
    function TR_Finally: TInstructionPointer;
  end;

  procedure TTRBlocks.add(CP, EP: TInstructionPointer);
  begin
    setlength(self.trblocks, length(self.trblocks) + 1);
    with self.trblocks[length(self.trblocks) - 1] do
    begin
      CatchPoint := CP;
      EndPoint := EP;
    end;
  end;

  function TTRBlocks.TR_Catch(E: Exception): TInstructionPointer;
  begin
    if Length(self.trblocks) > 0 then
    begin
      Result := self.trblocks[length(self.trblocks) - 1].CatchPoint;
      setlength(self.trblocks, length(self.trblocks) - 1);
    end
    else
      raise E;
  end;

  function TTRBlocks.TR_Finally: TInstructionPointer;
  begin
    Result := self.trblocks[length(self.trblocks) - 1].EndPoint;
    setlength(self.trblocks, length(self.trblocks) - 1);
  end;

{***** Grabber ****************************************************************}
type
  TGrabber = object
  private
    tasks: array of pointer;
  public
    procedure AddTask(p: Pointer);
    procedure Run;
  end;

  procedure TGrabber.AddTask(p: Pointer);
  begin
    SetLength(self.tasks, length(self.tasks) + 1);
    Self.tasks[length(self.tasks) - 1] := p
  end;

  procedure TGrabber.Run;
  var
    c,tasks_end: cardinal;
  begin
    tasks_end := length(self.tasks);
    c := 0;
    while c < tasks_end do
     begin
       FreeMem(self.tasks[c]);
       inc(c);
     end;
    SetLength(self.tasks, 0);
  end;

{***** VM *********************************************************************}
type
  TSVM = object
  public
    mainclasspath: string;
    mem: PMemory;
    stack: TStack;
    cbstack: TCallBackStack;
    bytes: PByteArr;
    ip,end_ip: TInstructionPointer;
    grabber: TGrabber;
    consts: PConstSection;
    extern_methods: PImportSection;
    try_blocks: TTRBlocks;
    procedure Run;
    procedure RunThread;
    procedure LoadByteCodeFromFile(fn: string);
    procedure LoadByteCodeFromArray(b: TByteArr);
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
  begin
    FreeOnTerminate := True;
    new(vm);
    vm^.bytes := bytes;
    vm^.end_ip := length(bytes^);
    vm^.consts := consts;
    vm^.extern_methods := extern_methods;

    //fill mem map
    new(vm^.mem);
    ml := Length(svm_memory^);
    SetLength(vm^.mem^, ml);
    c := 0;
    while c < ml do
     begin
       vm^.mem^[c] := svm_memory^[c];
       inc(c);
     end;

    vm^.stack.push(arg);
    vm^.stack.push(self);
    vm^.ip := method;
    inherited Create(True);
  end;

  procedure TSVMThread.Execute;
  begin
    vm^.RunThread;
  end;

  destructor TSVMThread.Destroy;
  begin
    vm^.grabber.run;
    SetLength(vm^.mem^, 0);
    Dispose(vm^.mem);
    vm^.stack.drop;
    Dispose(vm);
    inherited Destroy;
  end;

  procedure TSVM.RunThread;
  var
    p, p2: pointer;
    s: string;
  begin
    repeat
      {$IfNDef BuildInLibrary}
      try
      {$EndIf}
        while self.ip < self.end_ip do
          case TComand(self.bytes^[self.ip]) of
            bcPH:
            begin
              self.stack.push(self.mem^[cardinal(
                (self.bytes^[self.ip + 1] shl 24) + (self.bytes^[self.ip + 2] shl 16) +
                (self.bytes^[self.ip + 3] shl 8) +
                self.bytes^[self.ip + 4])]);
              Inc(self.ip, 5);
            end;

            bcPK:
            begin
              self.mem^[
                cardinal((self.bytes^[self.ip + 1] shl 24) +
                (self.bytes^[self.ip + 2] shl 14) + (self.bytes^[self.ip + 3] shl 8) +
                self.bytes^[self.ip + 4])
                ] := self.stack.peek;
              Inc(self.ip, 5);
            end;

            bcPP:
            begin
              self.stack.pop;
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
              self.ip := Cardinal(PMem(self.stack.popv)^);
            end;

            bcJZ:
            begin
              if Int64(PMem(self.stack.popv)^) = 0 then
                self.ip := Cardinal(PMem(self.stack.popv)^)
              else
                Inc(self.ip);
            end;

            bcJN:
            begin
              if Int64(PMem(self.stack.popv)^) <> 0 then
                self.ip := Cardinal(PMem(self.stack.popv)^)
              else
                Inc(self.ip);
            end;

            bcJC:
            begin
              self.cbstack.push(self.ip + 1);
              self.ip := Cardinal(PMem(self.stack.popv)^);
            end;

            bcJR:
            begin
              self.ip := Self.cbstack.popv;
            end;

            bcEQ:
            begin
              p := self.stack.popv;
              if PMem(p)^ = PMem(self.stack.popv)^ then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcBG:
            begin
              p := self.stack.popv;
              if PMem(p)^ > PMem(self.stack.popv)^ then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcBE:
            begin
              p := self.stack.popv;
              if PMem(p)^ >= PMem(self.stack.popv)^ then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcLAND:
            begin
              p := self.stack.popv;
              self.stack.push(NewMemV((PMem(p)^ <> 0) and (PMem(self.stack.popv)^ <> 0)));
            end;

            bcLOR:
            begin
              p := self.stack.popv;
              self.stack.push(NewMemV((PMem(p)^ <> 0) or (PMem(self.stack.popv)^ <> 0)));
            end;

            bcLXOR:
            begin
              p := self.stack.popv;
              self.stack.push(NewMemV((PMem(p)^ <> 0) xor (PMem(self.stack.popv)^ <> 0)));
            end;

            bcLNOT:
            begin
              self.stack.push(NewMemV(not (PMem(self.stack.popv)^ <> 0)));
            end;

            bcNOT:
            begin
              PMem(self.stack.peek)^ := not PMem(self.stack.peek)^;
              Inc(self.ip);
            end;

            bcAND:
            begin
              p := self.stack.popv;
              PMem(p)^ := PMem(p)^ and PMem(self.stack.popv)^;
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcOR:
            begin
              p := self.stack.popv;
              PMem(p)^ := PMem(p)^ or PMem(self.stack.popv)^;
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcXOR:
            begin
              p := self.stack.popv;
              PMem(p)^ := PMem(p)^ xor PMem(self.stack.popv)^;
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSHR:
            begin
              p := self.stack.popv;
              PMem(p)^ := PMem(p)^ shr PMem(self.stack.popv)^;
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSHL:
            begin
              p := self.stack.popv;
              PMem(p)^ := PMem(p)^ shl PMem(self.stack.popv)^;
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcNEG:
            begin
              p := self.stack.peek;
              PMem(p)^ := -PMem(p)^;
              Inc(self.ip);
            end;

            bcINC:
            begin
              p := self.stack.peek;
              PMem(p)^ := PMem(p)^ + 1;
              Inc(self.ip);
            end;

            bcDEC:
            begin
              p := self.stack.peek;
              PMem(p)^ := PMem(p)^ - 1;
              Inc(self.ip);
            end;

            bcADD:
            begin
              p := self.stack.popv;
              PMem(p)^ := PMem(p)^ + PMem(self.stack.popv)^;
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSUB:
            begin
              p := self.stack.popv;
              PMem(p)^ := PMem(p)^ - PMem(self.stack.popv)^;
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcMUL:
            begin
              p := self.stack.popv;
              PMem(p)^ := PMem(p)^ * PMem(self.stack.popv)^;
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcDIV:
            begin
              p := self.stack.popv;
              PMem(p)^ := PMem(p)^ / PMem(self.stack.popv)^;
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcMOD:
            begin
              p := self.stack.popv;
              PMem(p)^ := PMem(p)^ mod PMem(self.stack.popv)^;
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcIDIV:
            begin
              p := self.stack.popv;
              PMem(p)^ := PMem(p)^ div PMem(self.stack.popv)^;
              self.stack.push(p);
              Inc(self.ip);
            end;
			
	    bcMV:
	    begin
              p := self.stack.popv;
	      PMem(p)^ := PMem(self.stack.popv)^;
	      Inc(self.ip);
	    end;
			
	    bcMVBP:
	    begin
              p := self.stack.popv;
	      PMem(Pointer(Cardinal(PMem(p)^)))^ := PMem(self.stack.popv)^;
	      Inc(self.ip);
	    end;
			
	    bcGVBP:
	    begin
              p := self.stack.popv;
	      PMem(p)^ := PMem(Pointer(Cardinal(PMem(self.stack.popv)^)))^;
	      Inc(self.ip);
	    end;
			
	    bcMVP:
	    begin
              p := self.stack.popv;
	      PMem(p)^ := Cardinal(PMem(self.stack.popv));
	      Inc(self.ip);
	    end;

            bcMS:
            begin
              SetLength(self.mem^, PMem(self.stack.popv)^);
              Inc(self.ip);
            end;

            bcNW:
            begin
              self.stack.push(NewMem);
              Inc(self.ip);
            end;

            bcMC:
            begin
              self.stack.push(NewMemV(PMem(self.stack.peek)^));
              Inc(self.ip);
            end;

            bcMD:
            begin
              self.stack.push(self.stack.peek);
              Inc(self.ip);
            end;

            bcRM:
            begin
              RemMem(PMem(self.stack.popv));
              Inc(self.ip);
            end;

            bcNA:
            begin
              self.stack.push(NewArr(@self.stack, Cardinal(PMem(self.stack.popv)^)));
              Inc(self.ip);
            end;

            bcSF:
            begin
              self.stack.push(NewMemV(SizeOf(self.stack.popv^)));
              Inc(self.ip);
            end;

            bcAL:
            begin
              self.stack.push(NewMemV(Length(PMemArr(self.stack.popv)^)));
              Inc(self.ip);
            end;

            bcSL:
            begin
              p := self.stack.popv;
              SetLength(PMemArr(self.stack.peek)^, cardinal(PMem(p)^));
              Inc(self.ip);
            end;

            bcPA:
            begin
              p := self.stack.popv;
              self.stack.push(PMemArr(p)^[cardinal(PMem(self.stack.popv)^)]);
              Inc(self.ip);
            end;

            bcSA:
            begin
              p := self.stack.popv;
              p := @(PMemArr(p)^[cardinal(PMem(self.stack.popv)^)]);
              PPointer(p)^ := self.stack.popv;
              Inc(self.ip);
            end;

            bcGPM:
            begin
              self.grabber.AddTask(self.stack.peek);
              Inc(self.ip);
            end;

            bcGC:
            begin
              self.grabber.Run;
              Inc(self.ip);
            end;

            bcPHC:
            begin
              self.stack.push(NewMemV(self.consts^.GetConst(
                cardinal((self.bytes^[self.ip + 1] shl 24) +
                (self.bytes^[self.ip + 2] shl 16) + (self.bytes^[self.ip + 3] shl 8) +
                self.bytes^[self.ip + 4]))));
              Inc(self.ip, 5);
            end;

            bcPHEXMP:
            begin
              self.stack.push(self.extern_methods^.GetFunc(
                cardinal((self.bytes^[self.ip + 1] shl 24) +
                (self.bytes^[self.ip + 2] shl 16) + (self.bytes^[self.ip + 3] shl 8) +
                self.bytes^[self.ip + 4])));
              Inc(self.ip, 5);
            end;

            bcINV:
            begin
              TExternalFunction(self.extern_methods^.GetFunc(Cardinal(PMem(self.stack.popv)^)))(
                @self.stack);
              Inc(self.ip);
            end;

            bcINVBP:
            begin
              TExternalFunction(self.stack.popv)(@self.stack);
              Inc(self.ip);
            end;

            bcPHN:
            begin
              self.stack.push(nil);
              Inc(self.ip);
            end;

            bcCTHR:
            begin
              self.stack.push(TSVMThread.Create(self.bytes, self.consts,
                self.extern_methods, self.mem, Cardinal(PMem(self.stack.popv)^),
                self.stack.popv));
              Inc(self.ip);
            end;

            bcSTHR:
            begin
              TSVMThread(self.stack.popv).Suspend;
              Inc(self.ip);
            end;

            bcRTHR:
            begin
              TSVMThread(self.stack.popv).Resume;
              Inc(self.ip);
            end;

            bcTTHR:
            begin
              TSVMThread(self.stack.popv).Free;
              Inc(self.ip);
            end;

            bcTR:
            begin
              p := self.stack.popv;
              try_blocks.add(Cardinal(PMem(p)^), Cardinal(PMem(self.stack.popv)^));
              Inc(self.ip);
            end;

            bcTRS:
            begin
              self.ip := try_blocks.TR_Finally;
            end;

            bcTRR:
            begin
              self.ip := try_blocks.TR_Catch(Exception.Create(PMem(self.stack.peek)^));
            end;

            {** for word's **}

            bcEQ_W:
            begin
              p := self.stack.popv;
              if Cardinal(PMem(p)^) = Cardinal(PMem(self.stack.popv)^) then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcBG_W:
            begin
              p := self.stack.popv;
              if Cardinal(PMem(p)^) > Cardinal(PMem(self.stack.popv)^) then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcBE_W:
            begin
              p := self.stack.popv;
              if Cardinal(PMem(p)^) >= Cardinal(PMem(self.stack.popv)^) then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcNOT_W:
            begin
              PMem(self.stack.peek)^ := not Cardinal(PMem(self.stack.peek)^);
              Inc(self.ip);
            end;

            bcAND_W:
            begin
              p := self.stack.popv;
              PMem(p)^ := Cardinal(PMem(p)^) and Cardinal(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcOR_W:
            begin
              p := self.stack.popv;
              PMem(p)^ := Cardinal(PMem(p)^) or Cardinal(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcXOR_W:
            begin
              p := self.stack.popv;
              PMem(p)^ := Cardinal(PMem(p)^) xor Cardinal(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSHR_W:
            begin
              p := self.stack.popv;
              PMem(p)^ := Cardinal(PMem(p)^) shr Cardinal(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSHL_W:
            begin
              p := self.stack.popv;
              PMem(p)^ := Cardinal(PMem(p)^) shl Cardinal(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcINC_W:
            begin
              p := self.stack.peek;
              PMem(p)^ := Cardinal(PMem(p)^) + 1;
              Inc(self.ip);
            end;

            bcDEC_W:
            begin
              p := self.stack.peek;
              PMem(p)^ := Cardinal(PMem(p)^) - 1;
              Inc(self.ip);
            end;

            bcADD_W:
            begin
              p := self.stack.popv;
              PMem(p)^ := Cardinal(PMem(p)^) + Cardinal(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSUB_W:
            begin
              p := self.stack.popv;
              PMem(p)^ := Cardinal(PMem(p)^) - Cardinal(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcMUL_W:
            begin
              p := self.stack.popv;
              PMem(p)^ := Cardinal(PMem(p)^) * Cardinal(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcDIV_W:
            begin
              p := self.stack.popv;
              PMem(p)^ := Cardinal(PMem(p)^) / Cardinal(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcMOD_W:
            begin
              p := self.stack.popv;
              PMem(p)^ := Cardinal(PMem(p)^) mod Cardinal(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcIDIV_W:
            begin
              p := self.stack.popv;
              PMem(p)^ := Cardinal(PMem(p)^) div Cardinal(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

	    bcMV_W:
	    begin
              p := self.stack.popv;
	      PMem(p)^ := Cardinal(PMem(self.stack.popv)^);
	      Inc(self.ip);
	    end;

	    bcMVBP_W:
	    begin
              p := self.stack.popv;
	      PMem(Pointer(Cardinal(PMem(p)^)))^ := Cardinal(PMem(self.stack.popv)^);
	      Inc(self.ip);
	    end;

            {** for integer's **}

            bcEQ_I:
            begin
              p := self.stack.popv;
              if Int64(PMem(p)^) = Int64(PMem(self.stack.popv)^) then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcBG_I:
            begin
              p := self.stack.popv;
              if Int64(PMem(p)^) > Int64(PMem(self.stack.popv)^) then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcBE_I:
            begin
              p := self.stack.popv;
              if Int64(PMem(p)^) >= Int64(PMem(self.stack.popv)^) then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcNOT_I:
            begin
              PMem(self.stack.peek)^ := not Int64(PMem(self.stack.peek)^);
              Inc(self.ip);
            end;

            bcAND_I:
            begin
              p := self.stack.popv;
              PMem(p)^ := Int64(PMem(p)^) and Int64(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcOR_I:
            begin
              p := self.stack.popv;
              PMem(p)^ := Int64(PMem(p)^) or Int64(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcXOR_I:
            begin
              p := self.stack.popv;
              PMem(p)^ := Int64(PMem(p)^) xor Int64(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSHR_I:
            begin
              p := self.stack.popv;
              PMem(p)^ := Int64(PMem(p)^) shr Int64(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSHL_I:
            begin
              p := self.stack.popv;
              PMem(p)^ := Int64(PMem(p)^) shl Int64(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcNEG_I:
            begin
              p := self.stack.peek;
              PMem(p)^ := -Int64(PMem(p)^);
              Inc(self.ip);
            end;

            bcINC_I:
            begin
              p := self.stack.peek;
              PMem(p)^ := Int64(PMem(p)^) + 1;
              Inc(self.ip);
            end;

            bcDEC_I:
            begin
              p := self.stack.peek;
              PMem(p)^ := Int64(PMem(p)^) - 1;
              Inc(self.ip);
            end;

            bcADD_I:
            begin
              p := self.stack.popv;
              PMem(p)^ := Int64(PMem(p)^) + Int64(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSUB_I:
            begin
              p := self.stack.popv;
              PMem(p)^ := Int64(PMem(p)^) - Int64(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcMUL_I:
            begin
              p := self.stack.popv;
              PMem(p)^ := Int64(PMem(p)^) * Int64(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcDIV_I:
            begin
              p := self.stack.popv;
              PMem(p)^ := Int64(PMem(p)^) / Int64(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcMOD_I:
            begin
              p := self.stack.popv;
              PMem(p)^ := Int64(PMem(p)^) mod Int64(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcIDIV_I:
            begin
              p := self.stack.popv;
              PMem(p)^ := Int64(PMem(p)^) div Int64(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

	        bcMV_I:
	        begin
              p := self.stack.popv;
	          PMem(p)^ := Int64(PMem(self.stack.popv)^);
	          Inc(self.ip);
	        end;

	        bcMVBP_I:
	        begin
              p := self.stack.popv;
	          PMem(Pointer(Cardinal(PMem(p)^)))^ := Int64(PMem(self.stack.popv)^);
	          Inc(self.ip);
	        end;

            {** for float's **}

            bcEQ_D:
            begin
              p := self.stack.popv;
              if Double(PMem(p)^) = Double(PMem(self.stack.popv)^) then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcBG_D:
            begin
              p := self.stack.popv;
              if Double(PMem(p)^) > Double(PMem(self.stack.popv)^) then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcBE_D:
            begin
              p := self.stack.popv;
              if Double(PMem(p)^) >= Double(PMem(self.stack.popv)^) then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcNEG_D:
            begin
              p := self.stack.peek;
              PMem(p)^ := -Double(PMem(p)^);
              Inc(self.ip);
            end;

            bcINC_D:
            begin
              p := self.stack.peek;
              PMem(p)^ := Double(PMem(p)^) + 1;
              Inc(self.ip);
            end;

            bcDEC_D:
            begin
              p := self.stack.peek;
              PMem(p)^ := Double(PMem(p)^) - 1;
              Inc(self.ip);
            end;

            bcADD_D:
            begin
              p := self.stack.popv;
              PMem(p)^ := Double(PMem(p)^) + Double(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSUB_D:
            begin
              p := self.stack.popv;
              PMem(p)^ := Double(PMem(p)^) - Double(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcMUL_D:
            begin
              p := self.stack.popv;
              PMem(p)^ := Double(PMem(p)^) * Double(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcDIV_D:
            begin
              p := self.stack.popv;
              PMem(p)^ := Double(PMem(p)^) / Double(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcMOD_D:
            begin
              p := self.stack.popv;
              PMem(p)^ := Frac(Double(PMem(p)^) / Double(PMem(self.stack.popv)^));
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcIDIV_D:
            begin
              p := self.stack.popv;
              PMem(p)^ := Trunc(Double(PMem(p)^) / Double(PMem(self.stack.popv)^));
              self.stack.push(p);
              Inc(self.ip);
            end;

	    bcMV_D:
	    begin
              p := self.stack.popv;
	      PMem(p)^ := Double(PMem(self.stack.popv)^);
	      Inc(self.ip);
	    end;

	    bcMVBP_D:
	    begin
              p := self.stack.popv;
	      PMem(Pointer(Cardinal(PMem(p)^)))^ := Double(PMem(self.stack.popv)^);
	      Inc(self.ip);
	    end;

            {** for string's **}

            bcEQ_S:
            begin
              p := self.stack.popv;
              if String(PMem(p)^) = String(PMem(self.stack.popv)^) then
                self.stack.push(NewMemV(-1))
              else
                self.stack.push(NewMemV(0));
              Inc(self.ip);
            end;

            bcADD_S:
            begin
              p := self.stack.popv;
              PMem(p)^ := String(PMem(p)^) + String(PMem(self.stack.popv)^);
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcMV_S:
	    begin
              p := self.stack.popv;
	      PMem(p)^ := String(PMem(self.stack.popv)^);
	      Inc(self.ip);
	    end;

	    bcMVBP_S:
	    begin
              p := self.stack.popv;
	      PMem(Pointer(Cardinal(PMem(p)^)))^ := String(PMem(self.stack.popv)^);
	      Inc(self.ip);
	    end;

            bcSTRL:
            begin// strlen;
              self.stack.push(NewMemV(Length(String(PMem(self.stack.popv)^))));
	      Inc(self.ip);
            end;

            bcSTRD:
            begin// strdel;
              p := self.stack.popv;
              S := String(PMem(p)^);
              Delete(s,Cardinal(PMem(self.stack.popv)^),Cardinal(PMem(self.stack.popv)^));
              PMem(p)^ := s;
              S := '';
              Inc(self.ip);
            end;

            bcSTCHATP:// push str[x]
            begin
              p := self.stack.popv;
              self.stack.push(NewMemV(String(PMem(p)^)[Cardinal(PMem(self.stack.popv)^)]));
	      Inc(self.ip);
            end;

            bcSTCHATK:  // pop str[x]
            begin
              p := self.stack.popv;
              S := PMem(p)^;
              p2 := self.stack.popv;
              S[PMem(self.stack.popv)^] := PMem(p2)^;
              PMem(p)^ := S;
              S := '';
              Inc(self.ip);
            end;

            bcCHORD:
            begin
              PMem(self.stack.peek)^ := Ord(Char(PMem(self.stack.peek)^));
	      Inc(self.ip);
            end;

            bcORDCH:
            begin
              PMem(self.stack.peek)^ := Chr(Byte(PMem(self.stack.peek)^));
	      Inc(self.ip);
            end;

            {*** [!] directly memory operations ***}

            bcALLC:  //alloc memory
            begin
              self.stack.push(GetMem(PMem(self.stack.popv)^));
              Inc(self.ip);
            end;

            bcRALLC: //realloc memory
            begin
              p := self.stack.popv; //new sz
              self.stack.push(ReAllocMemory(self.stack.popv, PMem(p)^));
            end;

            bcDISP:  //dispose memory
            begin
              p := self.stack.popv; //sz
              FreeMem(self.stack.popv, PMem(p)^);
              Inc(self.ip);
            end;

            bcGTB: //get byte
            begin
              self.stack.push(NewMemV(PByte(self.stack.popv)^));
              Inc(self.ip);
            end;

            bcSTB:   //set byte
            begin
              p := self.stack.popv; //dest
              PByte(p)^ := PMem(self.stack.popv)^;
              Inc(self.ip);
            end;

            bcCBP:   //copy
            begin
              p := self.stack.popv; //sz
              p2 := self.stack.popv; //dest
              Move(self.stack.popv^, p2^, PMem(p)^);
              Inc(self.ip);
            end;

            bcRWBP:  //read word
            begin
              p := self.stack.popv; //stream
              new(PCardinal(p2));
              Move(p^, p2^, SizeOf(Cardinal));
              PMem(self.stack.popv)^ := PCardinal(p2)^;
              dispose(PCardinal(p2));
              Inc(self.ip);
            end;

            bcWWBP:  //write word
            begin
              p := self.stack.popv; //stream
              new(PCardinal(p2));
              PCardinal(p2)^ := Cardinal(PMem(self.stack.popv)^);
              Move(p2^, p^, SizeOf(Cardinal));
              dispose(PCardinal(p2));
              Inc(self.ip);
            end;

            bcRIBP:  //read int
            begin
              p := self.stack.popv; //stream
              new(PInt64(p2));
              Move(p^, p2^, SizeOf(Int64));
              PMem(self.stack.popv)^ := PInt64(p2)^;
              dispose(PInt64(p2));
              Inc(self.ip);
            end;

            bcWIBP:  //write int
            begin
              p := self.stack.popv; //stream
              new(PInt64(p2));
              PInt64(p2)^ := Int64(PMem(self.stack.popv)^);
              Move(p2^, p^, SizeOf(Int64));
              dispose(PInt64(p2));
              Inc(self.ip);
            end;

            bcRFBP:  //read float
            begin
              p := self.stack.popv; //stream
              new(PDouble(p2));
              Move(p^, p2^, SizeOf(Double));
              PMem(self.stack.popv)^ := PDouble(p2)^;
              dispose(PDouble(p2));
              Inc(self.ip);
            end;

            bcWFBP:  //write float
            begin
              p := self.stack.popv; //stream
              new(PDouble(p2));
              PDouble(p2)^ := Double(PMem(self.stack.popv)^);
              Move(p2^, p^, SizeOf(Double));
              dispose(PDouble(p2));
              Inc(self.ip);
            end;

            bcRSBP:  //read string
            begin
              p := self.stack.popv; //stream
              p2 := self.stack.popv; //str len
              SetLength(s, PMem(p2)^);
              Move(p^, PByte(@s[1])^, PMem(p2)^);
              Inc(self.ip);
            end;

            bcWSBP:   //write string
            begin
              p := self.stack.popv; //stream
              s := PMem(self.stack.popv)^; //str
              Move(PByte(@s[1])^, p, Length(s));
              Inc(self.ip);
            end;

            bcTHREXT:
            begin
              break;
            end

            else
              VMError('Error: not supported operation, byte 0x' + IntToHex(self.bytes^[self.ip], 2) +
                ', at #' + IntToStr(self.ip));
          end;
      {$IfNDef BuildInLibrary}
      except
        on E: Exception do
        begin
          self.stack.push(NewMemV(E.Message));
          try
            self.ip := self.try_blocks.TR_Catch(E);
          except
            on E2: Exception do
              raise E2;
          end;
        end;
      end;
      {$EndIf}
    until self.ip >= self.end_ip;
    self.grabber.run;
  end;

  procedure TSVM.Run;
  begin
    extern_methods^.Parse(self.bytes, mainclasspath);
    consts^.Parse(self.bytes);
    self.ip := 0;
    self.end_ip := length(self.bytes^);
    self.RunThread;
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

{***** Main *******************************************************************}
{$IfDef BuildInLibrary}
function SVM_Create:PSVM; stdcall;
begin
  New(Result);
  New(Result^.consts);
  New(Result^.extern_methods);
  New(Result^.mem);
end;

procedure SVM_Free(SVM:PSVM); stdcall;
begin
  Dispose(SVM^.consts);
  Dispose(SVM^.extern_methods);
  Dispose(SVM);
end;

procedure SVM_RegAPI(SVM:PSVM; ExtFunc:Pointer); stdcall;
begin
  SVM^.extern_methods^.SetSize(Length(SVM^.extern_methods^.methods)+1);
  SVM^.extern_methods^.SetFunc(Length(SVM^.extern_methods^.methods)-1, ExtFunc);
end;

procedure SVM_Run(SVM:PSVM; MainClassPath:PChar; pb:PByteArr); stdcall;
begin
  if MainClassPath <> nil then
   SVM^.mainclasspath := StrPas(MainClassPath)
  else
   SVM^.mainclasspath := ParamStr(0);
  SVM^.bytes := pb;
  SVM^.Run;
end;

procedure SVM_CheckErr(SVM:PSVM; E:Exception); stdcall;
begin
  SVM^.try_blocks.TR_Catch(E);
end;

procedure SVM_Continue(SVM:PSVM); stdcall;
begin
  SVM^.RunThread;
end;

exports SVM_Create   name '_SVM_CREATE';
exports SVM_Free     name '_SVM_FREE';
exports SVM_Run      name '_SVM_RUN';
exports SVM_RegAPI   name '_SVM_REGAPI';
exports SVM_CheckErr name '_SVM_CHECKERR';
exports SVM_Continue name '_SVM_CONTINUE';

begin
end.

{$Else}

procedure CheckHeader(pb:PByteArr);
begin
  if Length(pb^) >= 10 then
   begin
     if (chr(pb^[0]) = 'S') and (chr(pb^[1]) = 'V') and (chr(pb^[2]) = 'M') and
        (chr(pb^[3]) = 'E') and (chr(pb^[4]) = 'X') and (chr(pb^[5]) = 'E') and
        (chr(pb^[6]) = '_') and (chr(pb^[7]) = 'C') and (chr(pb^[8]) = 'N') and
        (chr(pb^[9]) = 'S') then Exit;
     if (chr(pb^[0]) = 'S') and (chr(pb^[1]) = 'V') and (chr(pb^[2]) = 'M') and
        (chr(pb^[3]) = 'E') and (chr(pb^[4]) = 'X') and (chr(pb^[5]) = 'E') and
        (chr(pb^[6]) = '_') and (chr(pb^[7]) = 'G') and (chr(pb^[8]) = 'U') and
        (chr(pb^[9]) = 'I') then Exit;
   end;
  raise Exception.Create('Error: Invalid SVMEXE-file header!');
  halt;
end;

var
  svm:TSVM;
begin
  if ParamCount<1 then
   begin
     writeln('Stack-based virtual machine.');
     writeln('Using: ',ExtractFileName(ParamStr(0)),' <svmexe file>');
   end;
  new(svm.bytes);
  new(svm.consts);
  new(svm.extern_methods);
  new(svm.mem);
  svm.LoadByteCodeFromFile(ParamStr(1));
  CheckHeader(svm.bytes);
  CutLeftBytes(svm.bytes,10);
  svm.Run;
end.
{$EndIf}
