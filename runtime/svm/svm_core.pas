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
  {$endif}
  SysUtils,
  dynlibs,
  svm_mem,
  Classes,
  svm_grabber
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
    bcRM,     // rem @[top]
    bcNA,     // [top] = @new array[  [top]  ] of pointer
    bcTF,     // [top] = typeof( [top] )
    bcTMC,    // [top].type = type of class
    bcSF,     // [top] = sizeof( [top] )

    {** array's **}
    bcAL,     // length( [top] as array )
    bcSL,     // setlength( [top] as array, {stack} )

    bcPA,     // push ([top] as array)[top-1]
    bcSA,     // peek [top-2] -> ([top] as array)[top-1]

    {** memory grabber **}
    bcGPM,    // add pointer to TMem to grabber task-list
    bcGC,     // run grabber

    {** constant's **}
    bcPHC,    // push copy of const
    bcPHCP,   // push pointer to original const

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

    {** for string's **}
    bcSTRD,     // strdel
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

    bcTHREXT,//stop code execution

    bcDBP    //debug method call
    );

{***** Types & variables ******************************************************}
type
  TInstructionPointer = cardinal;
  //PInstructionPointer = ^TInstructionPointer;
  TMemory = array of pointer;
  PMemory = ^TMemory;
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
            TSVMMem.CreateFW(cardinal((pb^[bpos + 4] shl 24) + (pb^[bpos + 3] shl 16) +
            (pb^[bpos + 2] shl 8) + pb^[bpos + 1]))
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
             cardinal(length(self.constants)) - consts_count, TSVMMem.CreateF(i, svmtInt)
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
            cardinal(length(self.constants)) - consts_count, TSVMMem.CreateF(d, svmtReal));
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
          self.SetConst(cardinal(length(self.constants)) - consts_count, TSVMMem.CreateFS(s));
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
                        TSVMMem.CreateFW(Cardinal(Pointer(st))));
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
  TExternalFunction = procedure(PStack: pointer); cdecl;
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

{***** Stack ******************************************************************}
const
  StackBlockSize = 256;

type
  TStack = object
  public
    items: array of pointer;
    size, i_pos: cardinal;
    parent_vm: pointer;
    procedure init(vm: pointer);
    procedure push(p: pointer);
    function peek: pointer;
    procedure pop;
    function popv: pointer;
    procedure swp;
    procedure drop;
  end;

  PStack = ^TStack;

  procedure TStack.init(vm: pointer);
  begin
    SetLength(items, StackBlockSize);
    i_pos := 0;
    size := StackBlockSize;
    parent_vm := vm;
  end;

  procedure TStack.push(p: pointer); inline;
  begin
    items[i_pos] := p;
    inc(i_pos);
    if i_pos >= size then
     begin
       size := size + StackBlockSize;
       SetLength(items, size)
     end;
  end;

  function TStack.peek: pointer; inline;
  begin
    Result := items[i_pos - 1];
  end;

  procedure TStack.pop; inline;
  begin
    dec(i_pos);
    if size - i_pos > StackBlockSize then
     begin
       size := size - StackBlockSize;
       SetLength(items, size);
     end;
  end;

  function TStack.popv: pointer; inline;
  begin
    dec(i_pos);
    Result := items[i_pos];
    if size - i_pos > StackBlockSize then
     begin
       size := size - StackBlockSize;
       SetLength(items, size);
     end;
  end;

  procedure TStack.swp; inline;
  var
    p: pointer;
  begin
    p := items[i_pos - 2];
    items[i_pos - 2] := items[i_pos - 1];
    items[i_pos - 1] := p;
  end;

  procedure TStack.drop; inline;
  begin
    SetLength(items, StackBlockSize);
    size := StackBlockSize;
    i_pos := 0;
  end;

{***** New array **************************************************************}

type
  TSizeArr = array of cardinal;
  PSizeArr = ^TSizeArr;

  function NewArr_Sub(size_arr: PSizeArr; lvl: word): TSVMMem; inline;
  var
    i, l: cardinal;
  begin
    Result := TSVMMem.CreateArr(size_arr^[length(size_arr^) - lvl]);
    if lvl > 0 then
     begin
       i := 0;
       l := size_arr^[length(size_arr^) - lvl];
       while i < l do
        begin
          if lvl - 1 > 0 then
           Result.ArrSet(i, NewArr_Sub(size_arr, lvl - 1))
          else
           Result.ArrSet(i, nil);
          inc(i);
        end;
     end;
  end;

  function NewArr(stk: PStack; lvl: word): TSVMMem; inline;
  var
    size_arr: TSizeArr;
    i: word;
  begin
    SetLength(size_arr, lvl);
    i := 0;
    while i < lvl do
     begin
       size_arr[i] := TSVMMem(stk^.popv).GetW;
       inc(i);
     end;
    Result := NewArr_Sub(@size_arr, lvl);
    //Result := TSVMMem.CreateArr(TSVMMem(stk^.popv).GetW);
  end;

{***** CallBack stack *********************************************************}
const
  CallBackStackBlockSize = 1024;

type
  TCallBackStack = object
  public
    items: array of TInstructionPointer;
    i_pos, size: cardinal;
    procedure init;
    procedure push(ip: TInstructionPointer);
    function peek: TInstructionPointer;
    function popv: TInstructionPointer;
    procedure pop;
  end;

  procedure TCallBackStack.init;
  begin
    SetLength(items, CallBackStackBlockSize);
    i_pos := 0;
    size := CallBackStackBlockSize;
    Push(High(TInstructionPointer));
  end;

  procedure TCallBackStack.push(ip: TInstructionPointer); inline;
  begin
    items[i_pos] := ip;
    inc(i_pos);
    if i_pos >= size then
     begin
       size := size + CallBackStackBlockSize;
       SetLength(items, size)
     end;
  end;

  function TCallBackStack.popv: TInstructionPointer; inline;
  begin
    dec(i_pos);
    Result := items[i_pos];
  end;

  function TCallBackStack.peek: TInstructionPointer; inline;
  begin
    Result := items[i_pos - 1];
  end;

  procedure TCallBackStack.pop; inline;
  begin
    dec(i_pos);
    if size - i_pos > CallBackStackBlockSize then
     begin
       size := size - CallBackStackBlockSize;
       SetLength(items, size);
     end;
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
      raise E;
  end;

  function TTRBlocks.TR_Finally: TInstructionPointer; inline;
  begin
    Result := self.trblocks[length(self.trblocks) - 1].EndPoint;
    setlength(self.trblocks, length(self.trblocks) - 1);
  end;

{***** VM *********************************************************************}
type
  TSVM = object
  public
    ip,end_ip: TInstructionPointer;
    mainclasspath: string;
    mem: PMemory;
    stack: TStack;
    cbstack: TCallBackStack;
    bytes: PByteArr;
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
    vm^.stack.init(vm);
    vm^.cbstack.init;
    vm^.grabber.init;

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
    r: TSVMMem;
    s: string;
  begin
    repeat
      {$IfNDef BuildInLibrary}
      try
      {$EndIf}
        while self.ip < self.end_ip do
         begin
          {$IfDef DebugVer}
            writeln('IP: ', self.ip,', Op: ', GetEnumName(TypeInfo(TComand), self.bytes^[self.ip]));
          {$EndIf}
          case TComand(self.bytes^[self.ip]) of
            bcPH:
            begin
              self.stack.push(self.mem^[cardinal(
                (self.bytes^[self.ip + 4] shl 24) + (self.bytes^[self.ip + 3] shl 16) +
                (self.bytes^[self.ip + 2] shl 8) +
                self.bytes^[self.ip + 1])
                ]);
              Inc(self.ip, 5);
            end;

            bcPK:
            begin
              self.mem^[cardinal((self.bytes^[self.ip + 4] shl 24) +
                (self.bytes^[self.ip + 3] shl 14) + (self.bytes^[self.ip + 2] shl 8) +
                self.bytes^[self.ip + 1])
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
              self.ip := TSVMMem(self.stack.popv).GetW;
            end;

            bcJZ:
            begin
              if TSVMMem(self.stack.popv).GetI = 0 then
                self.ip := TSVMMem(self.stack.popv).GetW
              else
                Inc(self.ip);
            end;

            bcJN:
            begin
              if TSVMMem(self.stack.popv).GetI <> 0 then
                self.ip := TSVMMem(self.stack.popv).GetW
              else
                Inc(self.ip);
            end;

            bcJC:
            begin
              self.cbstack.push(self.ip + 1);
              {$IfDef DebugVer}writeln(' - Point to jump: ', TSVMMem(self.stack.peek).GetW);{$EndIf}
              self.ip := TSVMMem(self.stack.popv).GetW;
            end;

            bcJR:
            begin
              self.ip := Self.cbstack.popv;
            end;

            bcEQ:
            begin
              p := self.stack.popv;
              r := TSVMMem.CreateF(TSVMMem(p).m_val^, TSVMMem(p).m_type);
              r.OpEq(TSVMMem(self.stack.popv));
              self.stack.push(r);
              Inc(self.ip);
            end;

            bcBG:
            begin
              p := self.stack.popv;
              r := TSVMMem.CreateF(TSVMMem(p).m_val^, TSVMMem(p).m_type);
              r.OpBg(TSVMMem(self.stack.popv));
              self.stack.push(r);
              Inc(self.ip);
            end;

            bcBE:
            begin
              p := self.stack.popv;
              r := TSVMMem.CreateF(TSVMMem(p).m_val^, TSVMMem(p).m_type);
              r.OpBe(TSVMMem(self.stack.popv));
              self.stack.push(r);
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
              TSVMMem(p).OpAnd(TSVMMem(self.stack.popv));
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcOR:
            begin
              p := self.stack.popv;
              TSVMMem(p).OpOr(TSVMMem(self.stack.popv));
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcXOR:
            begin
              p := self.stack.popv;
              TSVMMem(p).OpXor(TSVMMem(self.stack.popv));
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSHR:
            begin
              p := self.stack.popv;
              TSVMMem(p).OpShr(TSVMMem(self.stack.popv));
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSHL:
            begin
              p := self.stack.popv;
              TSVMMem(p).OpShl(TSVMMem(self.stack.popv));
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcNEG:
            begin
              TSVMMem(self.stack.peek).OpNeg;
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
              TSVMMem(p).OpAdd(TSVMMem(self.stack.popv));
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcSUB:
            begin
              p := self.stack.popv;
              TSVMMem(p).OpSub(TSVMMem(self.stack.popv));
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcMUL:
            begin
              p := self.stack.popv;
              TSVMMem(p).OpMul(TSVMMem(self.stack.popv));
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcDIV:
            begin
              p := self.stack.popv;
              TSVMMem(p).OpDiv(TSVMMem(self.stack.popv));
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcMOD:
            begin
              p := self.stack.popv;
              TSVMMem(p).OpMod(TSVMMem(self.stack.popv));
              self.stack.push(p);
              Inc(self.ip);
            end;

            bcIDIV:
            begin
              p := self.stack.popv;
              TSVMMem(p).OpIDiv(TSVMMem(self.stack.popv));
              self.stack.push(p);
              Inc(self.ip);
            end;
			
	    bcMV:
	    begin
              p := self.stack.popv;
	      TSVMMem(p).SetM(TSVMMem(self.stack.popv));
	      Inc(self.ip);
	    end;
			
	    bcMVBP:
	    begin
              p := self.stack.popv;
              {$HINTS OFF}
              TSVMMem(Pointer(TSVMMem(p).GetW)).SetM(TSVMMem(self.stack.popv));
              {$HINTS ON}
              Inc(self.ip);
	    end;
			
	    bcGVBP:
	    begin
              {$HINTS OFF}
	      self.stack.push(TSVMMem(Pointer(TSVMMem(self.stack.popv).GetW)));
              {$HINTS ON}
              Inc(self.ip);
	    end;
			
	    bcMVP:
	    begin
              p := self.stack.popv;
              {$HINTS OFF}
              TSVMMem(p).SetW(Cardinal(self.stack.popv));
              {$HINTS ON}
	      Inc(self.ip);
	    end;

            bcMS:
            begin
              SetLength(self.mem^, TSVMMem(self.stack.popv).GetW);
              {$IfDef DebugVer} writeln(' - Mem size: ', Length(self.mem^)); {$EndIf}
              Inc(self.ip);
            end;

            bcNW:
            begin
              self.stack.push(TSVMMem.Create);
              Inc(self.ip);
            end;

            bcMC:
            begin
              self.stack.push(TSVMMem.CreateCopy(TSVMMem(self.stack.peek)));
              Inc(self.ip);
            end;

            bcMD:
            begin
              self.stack.push(self.stack.peek);
              Inc(self.ip);
            end;

            bcRM:
            begin
              TSVMMem(self.stack.popv).Free;
              Inc(self.ip);
            end;

            bcNA:
            begin
              self.stack.push(NewArr(@self.stack, Cardinal(TSVMMem(self.stack.popv).GetW)));
              Inc(self.ip);
            end;

            bcTF:
            begin
              p := self.stack.popv;
              if TObject(p) is TSVMMem then
                self.stack.push(TSVMMem.CreateFW(byte(TSVMMem(p).m_type)))
              else
                self.stack.push(TSVMMem.CreateFW(byte(TSVMTypeAddr)));
              Inc(self.ip);
            end;

            bcTMC:
            begin
              TSVMMem(self.stack.peek).m_type := svmtClass;
              Inc(self.ip)
            end;

            bcSF:
            begin
              self.stack.push(TSVMMem.CreateFW(TSVMMem(self.stack.popv).GetSize));
              Inc(self.ip);
            end;

            bcAL:
            begin
              self.stack.push(TSVMMem.CreateFW(TSVMMem(self.stack.popv).ArrGetSize));
              Inc(self.ip);
            end;

            bcSL:
            begin
              p := self.stack.popv;
              TSVMMem(self.stack.peek).ArrSetSize(TSVMMem(p).GetW);
              Inc(self.ip);
            end;

            bcPA:
            begin
              p := self.stack.popv;
              self.stack.push(TSVMMem(p).ArrGet(TSVMMem(self.stack.popv).GetW, @self.grabber));
              Inc(self.ip);
            end;

            bcSA:
            begin
              p := self.stack.popv;
              p2:= self.stack.popv;
              TSVMMem(p).ArrSet(TSVMMem(p2).GetW, self.stack.popv);
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
              self.stack.push(
                  TSVMMem.CreateCopy(TSVMMem(self.consts^.GetConst(
                    cardinal((self.bytes^[self.ip + 4] shl 24) + (self.bytes^[self.ip + 3] shl 16) +
                             (self.bytes^[self.ip + 2] shl 8) + self.bytes^[self.ip + 1]
                            ))
                    ))
                  );
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

            bcPHEXMP:
            begin
              self.stack.push(self.extern_methods^.GetFunc(
                cardinal((self.bytes^[self.ip + 4] shl 24) +
                (self.bytes^[self.ip + 3] shl 16) + (self.bytes^[self.ip + 2] shl 8) +
                self.bytes^[self.ip + 1])
                ));
              Inc(self.ip, 5);
            end;

            bcINV:
            begin
              TExternalFunction(self.extern_methods^.GetFunc(TSVMMem(self.stack.popv).GetW))(
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
                self.extern_methods, self.mem, TSVMMem(self.stack.popv).GetW,
                self.stack.popv));
              Inc(self.ip);
            end;

            bcSTHR:
            begin
              {$WARNINGS OFF}
              TSVMThread(self.stack.popv).Suspend;
              {$WARNINGS ON}
              Inc(self.ip);
            end;

            bcRTHR:
            begin
              {$WARNINGS OFF}
              TSVMThread(self.stack.popv).Resume;
              {$WARNINGS ON}
              Inc(self.ip);
            end;

            bcTTHR:
            begin
              TSVMThread(self.stack.popv).Terminate;
              Inc(self.ip);
            end;

            bcTR:
            begin
              p := self.stack.popv;
              try_blocks.add(TSVMMem(p).GetW, TSVMMem(self.stack.popv).GetW);
              Inc(self.ip);
            end;

            bcTRS:
            begin
              self.ip := try_blocks.TR_Finally;
            end;

            bcTRR:
            begin
              self.ip := try_blocks.TR_Catch(Exception.Create(TSVMMem(self.stack.popv).GetS));
            end;

            {** for string's **}

            bcSTRD:
            begin// strdel;
              p := self.stack.popv;
              S := String(TSVMMem(p).GetS);
              Delete(s,TSVMMem(self.stack.popv).GetW, TSVMMem(self.stack.popv).GetW);
              TSVMMem(p).SetS(s);
              S := '';
              Inc(self.ip);
            end;

            bcCHORD:
            begin
              self.stack.push(TSVMMem.CreateFW(Ord(TSVMMem(self.stack.popv).GetS[1])));
	      Inc(self.ip);
            end;

            bcORDCH:
            begin
              self.stack.push(TSVMMem.CreateFS(Chr(TSVMMem(self.stack.popv).GetW)));
              Inc(self.ip);
            end;

            {*** [!] directly memory operations ***}

            bcALLC:  //alloc memory
            begin
              self.stack.push(GetMem(TSVMMem(self.stack.popv).GetW));
              Inc(self.ip);
            end;

            bcRALLC: //realloc memory
            begin
              p := self.stack.popv; //new sz
              self.stack.push(ReAllocMemory(self.stack.popv, TSVMMem(p).GetW));
            end;

            bcDISP:  //dispose memory
            begin
              p := self.stack.popv; //sz
              FreeMem(self.stack.popv, TSVMMem(p).GetW);
              Inc(self.ip);
            end;

            bcGTB: //get byte
            begin
              self.stack.push(TSVMMem.CreateFW(PByte(self.stack.popv)^));
              Inc(self.ip);
            end;

            bcSTB:   //set byte
            begin
              p := self.stack.popv; //dest
              PByte(p)^ := TSVMMem(self.stack.popv).GetW;
              Inc(self.ip);
            end;

            bcCBP:   //copy
            begin
              p := self.stack.popv; //sz
              p2 := self.stack.popv; //dest
              Move(self.stack.popv^, p2^, TSVMMem(p).GetW);
              Inc(self.ip);
            end;

            bcRWBP:  //read word
            begin
              p := self.stack.popv; //stream
              new(PCardinal(p2));
              Move(p^, p2^, SizeOf(Cardinal));
              TSVMMem(self.stack.popv).SetW(PCardinal(p2)^);
              dispose(PCardinal(p2));
              Inc(self.ip);
            end;

            bcWWBP:  //write word
            begin
              p := self.stack.popv; //stream
              new(PCardinal(p2));
              PCardinal(p2)^ := TSVMMem(self.stack.popv).GetW;
              Move(p2^, p^, SizeOf(Cardinal));
              dispose(PCardinal(p2));
              Inc(self.ip);
            end;

            bcRIBP:  //read int
            begin
              p := self.stack.popv; //stream
              new(PInt64(p2));
              Move(p^, p2^, SizeOf(Int64));
              TSVMMem(self.stack.popv).SetI(PInt64(p2)^);
              dispose(PInt64(p2));
              Inc(self.ip);
            end;

            bcWIBP:  //write int
            begin
              p := self.stack.popv; //stream
              new(PInt64(p2));
              PInt64(p2)^ := TSVMMem(self.stack.popv).GetI;
              Move(p2^, p^, SizeOf(Int64));
              dispose(PInt64(p2));
              Inc(self.ip);
            end;

            bcRFBP:  //read float
            begin
              p := self.stack.popv; //stream
              new(PDouble(p2));
              Move(p^, p2^, SizeOf(Double));
              TSVMMem(self.stack.popv).SetD(PDouble(p2)^);
              dispose(PDouble(p2));
              Inc(self.ip);
            end;

            bcWFBP:  //write float
            begin
              p := self.stack.popv; //stream
              new(PDouble(p2));
              PDouble(p2)^ := TSVMMem(self.stack.popv).GetD;
              Move(p2^, p^, SizeOf(Double));
              dispose(PDouble(p2));
              Inc(self.ip);
            end;

            bcRSBP:  //read string
            begin
              p := self.stack.popv; //stream
              p2 := self.stack.popv; //str len
              SetLength(s, TSVMMem(p2).GetW);
              Move(p^, PByte(@s[1])^, TSVMMem(p2).GetW);
              Inc(self.ip);
            end;

            bcWSBP:   //write string
            begin
              p := self.stack.popv; //stream
              s := TSVMMem(self.stack.popv).GetS; //str
              Move(PByte(@s[1])^, p, Length(s));
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
            end

            else
              VMError('Error: not supported operation, byte 0x' + IntToHex(self.bytes^[self.ip], 2) +
                ', at #' + IntToStr(self.ip));
          end;
          end;
      {$IfNDef BuildInLibrary}
      except
        on E: Exception do
        begin
          self.stack.push(TSVMMem.CreateFS(E.Message));
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
  var
    c: Cardinal;
  begin
    extern_methods^.Parse(self.bytes, mainclasspath);
    consts^.Parse(self.bytes);
    self.ip := 0;
    self.end_ip := length(self.bytes^);
    {$IfDef DebugVer}
      c := 0;
      while c < Length(consts^.constants) do
       begin
         writeln('ConstID: ', c, ', Val: ', TSVMMem(consts^.constants[c]).GetS);
         inc(c);
       end;
    {$EndIf}

    c := ParamCount;
    while c > 0 do
     begin
       self.stack.push(TSVMMem.CreateFS(ParamStr(c)));
       dec(c);
     end;
    self.stack.push(TSVMMem.CreateFW(ParamCount));

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
{$ifdef BuildInLibrary}
function SVM_Create:PSVM; stdcall;
begin
  New(Result);
  new(Result^.bytes);
  New(Result^.consts);
  New(Result^.extern_methods);
  New(Result^.mem);
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
begin
  if ParamCount<1 then
   begin
     writeln('MASH!');
     writeln('Stack-based virtual machine.');
     writeln('Version: 1.4');
	 writeln('Using: ',ExtractFileName(ParamStr(0)),' <svmexe file>');
   end;
  new(svm.bytes);
  new(svm.consts);
  new(svm.extern_methods);
  new(svm.mem);
  svm.stack.init(@svm);
  svm.cbstack.init;
  svm.grabber.init;
  svm.LoadByteCodeFromFile(ParamStr(1));
  CheckHeader(svm.bytes);
  CutLeftBytes(svm.bytes,10);
  svm.Run;
end.
{$endif}
