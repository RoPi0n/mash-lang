unit svm_core;

//{$define WindowsSEH}
{$mode objfpc}
{$H+}

interface

uses
  Classes,
  SysUtils,
  svm_grabber,
  svm_mem,
  svm_utils,
  svm_common,
  svm_opcodes,
  svm_res,
  svm_imports,
  svm_callbacks,
  svm_stack,
  svm_exceptions;

type
  TSVM = object
  public
    ip, end_ip: TInstructionPointer;
    mainclasspath: string;
    mem, local_mem: PMemory;
    grabber: TGrabber;
    stack, rstack: TStack;
    cbstack: TCallBackStack;
    bytes: PByteArr;
    consts: PConstSection;
    extern_methods: PImportSection;
    try_blocks: TTRBlocks;
    isMainThread, CustomArgsMode: boolean;
    pVM_NULL: TSVMMem;
    procedure Run;
    procedure RunThread;
    procedure LoadByteCodeFromFile(fn: string);
    procedure LoadByteCodeFromMem(buf: PByte; sz: Cardinal);
    procedure LoadContext(Ctx: TObject);
  end;

  PSVM = ^TSVM;

implementation

uses svm_threads;

procedure TSVM.Run;
var
  c: cardinal;
  r: TSVMMem;
  s: string;
begin
  self.ip := 0;
  self.end_ip := length(self.bytes^);
  self.grabber := TGrabber.Create;

  if not self.CustomArgsMode then
  begin
    c := ParamCount;
    while c > 1 do
    begin
      r := NewSVMM_FS(ParamStr(c), Grabber);
      r.m_rcnt := 1;
      self.stack.push(r);
      Dec(c);
    end;
  end;

  s := ParamStr(1);
  if pos(':', s) < 0 then
    s := ExtractFilePath(ParamStr(0)) + ParamStr(1);

  r := NewSVMM_FS(s, Grabber);
  r.m_rcnt := 1;

  self.stack.push(r);

  r := NewSVMM_FW(self.stack.i_pos, Grabber);
  r.m_rcnt := 1;
  self.stack.push(r);

  self.RunThread;
  self.grabber.Term;

  FreeAndNil(self.grabber);
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

procedure TSVM.LoadByteCodeFromMem(buf: PByte; sz: Cardinal);
var
  i: cardinal;
begin
  setlength(self.bytes^, sz);
  for i := 0 to sz do
   self.bytes^[i] := PByte(LongWord(buf) + i)^;
end;

procedure TSVM.LoadContext(Ctx: TObject);
var
  p: pointer;
  c, l: cardinal;
begin
  p := self.mem;
  self.mem := TSVMThreadContext(Ctx).CtxMemory;
  TSVMThreadContext(Ctx).CtxMemory := p;

  self.stack.drop;
  l := TSVMThreadContext(Ctx).CtxStack.i_pos;
  c := 0;

  while c < l do
  begin
    self.stack.push(TSVMThreadContext(Ctx).CtxStack.items[c]);
    Inc(c);
  end;
end;

procedure TSVM.RunThread;
var
  p, p2: pointer;
  r: TSVMMem;
  s: string;
  c, j: cardinal;
  {$IfDef WindowsSEH}
  lst: TList;
  {$EndIf}
begin
  repeat
    try
      while self.ip < self.end_ip do
      begin
        {if isMainThread and (GrabbersInStorage > 0) then
         GlobalGC;}

        {$IfDef DebugVer}
        writeln('IP: ', self.ip, ', Op: ',
          GetEnumName(TypeInfo(TComand), self.bytes^[self.ip]));
        {$EndIf}

        {$IfDef WindowsSEH}
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

        case TInstruction(self.bytes^[self.ip]) of
          bcPH:
          begin
            c := cardinal((self.bytes^[self.ip + 4] shl 24) +
              (self.bytes^[self.ip + 3] shl 16) + (self.bytes^[self.ip + 2] shl 8) +
              self.bytes^[self.ip + 1]);

            p := self.mem^[c];

            InterlockedIncrement(TSVMMem(p).m_rcnt);

            self.stack.push(p);

            Inc(self.ip, 5);
          end;

          bcPK:
          begin
            c := cardinal((self.bytes^[self.ip + 4] shl 24) +
              (self.bytes^[self.ip + 3] shl 16) + (self.bytes^[self.ip + 2] shl 8) +
              self.bytes^[self.ip + 1]);

            p := self.mem^[c];
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            p2 := self.stack.peek;

            self.mem^[c] := p2;

            InterlockedIncrement(TSVMMem(p2).m_rcnt);

            Inc(self.ip, 5);
          end;


          bcPHL:
          begin
            c := cardinal((self.bytes^[self.ip + 4] shl 24) +
              (self.bytes^[self.ip + 3] shl 16) + (self.bytes^[self.ip + 2] shl 8) +
              self.bytes^[self.ip + 1]);

            p := self.local_mem^[c];

            InterlockedIncrement(TSVMMem(p).m_rcnt);

            self.stack.push(p);

            Inc(self.ip, 5);
          end;

          bcPKL:
          begin
            c := cardinal((self.bytes^[self.ip + 4] shl 24) +
              (self.bytes^[self.ip + 3] shl 16) + (self.bytes^[self.ip + 2] shl 8) +
              self.bytes^[self.ip + 1]);

            p := self.local_mem^[c];
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            p2 := self.stack.peek;

            self.local_mem^[c] := p2;

            InterlockedIncrement(TSVMMem(p2).m_rcnt);

            Inc(self.ip, 5);
          end;


          bcPP:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);
            Inc(self.ip);
          end;

          bcSDP:
          begin
            self.stack.drop;
            Inc(self.ip);

            {$IfDef BuildInLibrary}
            if DbgCallBack <> nil then
              TDbgCallBack(DbgCallBack)(@self);
            {$EndIf}
          end;

          bcSWP:
          begin
            self.stack.swp;
            Inc(self.ip);
          end;

          bcJP:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            self.ip := TSVMMem(p).GetW;
          end;

          bcJZ:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            if TSVMMem(p).GetI = 0 then
            begin
              p := self.stack.popv;
              InterlockedDecrement(TSVMMem(p).m_rcnt);

              self.ip := TSVMMem(p).GetW;
            end
            else
              Inc(self.ip);
          end;

          bcJN:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            if TSVMMem(p).GetI <> 0 then
            begin
              p := self.stack.popv;
              InterlockedDecrement(TSVMMem(p).m_rcnt);

              self.ip := TSVMMem(p).GetW;
            end
            else
              Inc(self.ip);
          end;

          bcJC:
          begin
            self.cbstack.push(self.ip + 1);
            {$IfDef DebugVer}
            writeln(' - Point to jump: ', TSVMMem(self.stack.peek).GetW);
            {$EndIf}

            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            self.ip := TSVMMem(p).GetW;

            {$IfDef BuildInLibrary}
            if DbgCallBack <> nil then
              TDbgCallBack(DbgCallBack)(@self);
            {$EndIf}
          end;

          bcJR:
          begin
            self.ip := Self.cbstack.popv;
            {$IfDef BuildInLibrary}
            if DbgCallBack <> nil then
              TDbgCallBack(DbgCallBack)(@self);
            {$EndIf}
          end;

          bcJRP:
          begin
            self.cbstack.pop;
            Inc(self.ip);
          end;

          bcEQ:
          begin
            p := self.stack.popv;
            p2 := self.stack.popv;

            InterlockedDecrement(TSVMMem(p).m_rcnt);
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            if p = p2 then
             begin
               r := NewSVMM(self.grabber);
               r.SetB(true);
               r.m_rcnt := 1;
               self.stack.push(r);
             end
            else
             begin
               if (TSVMMem(p).m_type = svmtNull) or (TSVMMem(p2).m_type = svmtNull) then
                begin
                  r := NewSVMM(self.grabber);  
                  r.m_rcnt := 1;
                  r.SetB((TSVMMem(p).m_type = svmtNull) and (TSVMMem(p2).m_type = svmtNull));
                  self.stack.push(r);
                end
               else
                begin
                  r := CreateSVMMemCopy(TSVMMem(p), Grabber);
                  r.m_rcnt := 1;
                  self.stack.push(r);
                  r.OpEq(TSVMMem(p2));
                end;
             end;

            Inc(self.ip);
          end;

          bcBG:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            r := CreateSVMMemCopy(TSVMMem(p), Grabber);

            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            r.m_rcnt := 1;
            self.stack.push(r);
            r.OpBg(TSVMMem(p));
            Inc(self.ip);
          end;

          bcBE:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);
            r := CreateSVMMemCopy(TSVMMem(p), Grabber);

            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            r.m_rcnt := 1;
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
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p);
            TSVMMem(p).OpAnd(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcOR:
          begin
            p := self.stack.popv;

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p);
            TSVMMem(p).OpOr(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcXOR:
          begin
            p := self.stack.popv;

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p);
            TSVMMem(p).OpXor(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcSHR:
          begin
            p := self.stack.popv;

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p);
            TSVMMem(p).OpSHR(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcSHL:
          begin
            p := self.stack.popv;

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p);
            TSVMMem(p).OpSHL(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcNEG:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);
            r := NewSVMM_F(TSVMMem(p).m_val^, TSVMMem(p).m_type, Grabber);
            r.OpNeg;
            r.m_rcnt := 1;
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
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p);
            TSVMMem(p).OpAdd(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcSUB:
          begin
            p := self.stack.popv;

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p);
            TSVMMem(p).OpSub(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcMUL:
          begin
            p := self.stack.popv;

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p);
            TSVMMem(p).OpMul(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcDIV:
          begin
            p := self.stack.popv;

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p);
            TSVMMem(p).OpDiv(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcMOD:
          begin
            p := self.stack.popv;

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p);
            TSVMMem(p).OpMod(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcIDIV:
          begin
            p := self.stack.popv;

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p);
            TSVMMem(p).OpIDiv(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcMV:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            if (p = pointer(VM_NULL)) or (p2 = pointer(VM_NULL)) then
             raise ENullPointer.Create('Null pointer exception');

            TSVMMem(p).SetM(TSVMMem(p2));
            Inc(self.ip);
          end;

          bcMVBP:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            {$HINTS OFF}
            TSVMMem(Pointer(TSVMMem(p).GetW)).SetM(TSVMMem(p2));
            {$HINTS ON}
            Inc(self.ip);
          end;

          bcGVBP:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            {$HINTS OFF}
            r := TSVMMem(Pointer(TSVMMem(p).GetW));
            self.stack.push(r);

            Inc(r.m_rcnt);
            {$HINTS ON}
            Inc(self.ip);
          end;

          bcMVP:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            {$HINTS OFF}
            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            TSVMMem(p).SetW(longword(p2));
            {$HINTS ON}

            Inc(self.ip);
          end;

          bcMS:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            c := Length(self.mem^);
            j := TSVMMem(p).GetW;
            SetLength(self.mem^, j);
            SetLength(self.local_mem^, j);

            while c < j do
             begin
               self.mem^[c] := VM_NULL;
               self.local_mem^[c] := VM_NULL;
               inc(c);
             end;

            {$IfDef DebugVer}
            writeln(' - Mem size: ', Length(self.mem^));
            {$EndIf}
            Inc(self.ip);
          end;

          bcNW:
          begin
            r := NewSVMM(Grabber);
            r.m_rcnt := 1;
            self.stack.push(r);
            Inc(self.ip);
          end;

          bcMC:
          begin
            p := self.stack.peek;
            r := CreateSVMMemCopy(TSVMMem(p), Grabber);
            r.m_rcnt := 1;
            self.stack.push(r);
            Inc(self.ip);
          end;

          bcMD:
          begin
            p := self.stack.peek;
            InterlockedIncrement(TSVMMem(p).m_rcnt);

            self.stack.push(p);
            Inc(self.ip);
          end;

          bcGC:
          begin
            grabber.Run;

            if isMainThread then
             GlobalGC;

            //writeln('GC stack: ', grabber.Stack.i_pos, ', Safe stack: ', rstack.i_pos);
            Inc(self.ip);
          end;

          bcNA:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            r := NewArr(@self.stack, cardinal(TSVMMem(p).GetW), self.Grabber);
            r.m_rcnt := 1;
            self.stack.push(r);
            Inc(self.ip);
          end;

          bcTF:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            r := NewSVMM_FW(byte(TSVMMem(p).m_type), Grabber);
            r.m_rcnt := 1;
            self.stack.push(r);

            Inc(self.ip);
          end;

          bcTMC:
          begin
            TSVMMem(self.stack.peek).m_type := svmtClass;
            Inc(self.ip);
          end;

          bcSF:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            r := NewSVMM_FW(TSVMMem(p).GetSize, Grabber);
            r.m_rcnt := 1;
            self.stack.push(r);
            Inc(self.ip);
          end;

          bcAL:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            r := NewSVMM_FW(TSVMMem(p).ArrGetSize, Grabber);
            r.m_rcnt := 1;
            self.stack.push(r);
            Inc(self.ip);
          end;

          bcSL:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            TSVMMem(self.stack.peek).ArrSetSize(TSVMMem(p).GetW);
            Inc(self.ip);
          end;

          bcPA:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            p2 := TSVMMem(p).ArrGet(r.GetW, Grabber);
            InterlockedIncrement(TSVMMem(p2).m_rcnt);

            self.stack.push(p2);
            Inc(self.ip);
          end;

          bcSA:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            TSVMMem(p).ArrSet(r.GetW, self.stack.popv);
            Inc(self.ip);
          end;

          bcPHC:
          begin
            r := CreateSVMMemCopy(TSVMMem(self.consts^.GetConst(
              cardinal((self.bytes^[self.ip + 4] shl 24) +
              (self.bytes^[self.ip + 3] shl 16) +
              (self.bytes^[self.ip + 2] shl 8) +
              self.bytes^[self.ip + 1]))),
              Grabber);
            r.m_rcnt := 1;

            self.stack.push(r);

            Inc(self.ip, 5);
          end;

          bcPHCP:
          begin
            self.stack.push(TSVMMem(self.consts^.GetConst(
              cardinal((self.bytes^[self.ip + 4] shl 24) +
              (self.bytes^[self.ip + 3] shl 16) +
              (self.bytes^[self.ip + 2] shl 8) +
              self.bytes^[self.ip + 1]))));

            Inc(self.ip, 5);
          end;

          bcINV:
          begin
            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            Inc(self.ip);

            TExternalFunction(self.extern_methods^.GetFunc(r.GetW))(@self);

            {$IfDef BuildInLibrary}
            if DbgCallBack <> nil then
              TDbgCallBack(DbgCallBack)(@self);
            {$EndIf}
          end;

          bcPHN:
          begin
            self.stack.push(VM_NULL);

            Inc(self.ip);
          end;

          bcCTHR:
          begin
            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            p := self.stack.popv;
            // don't touch ref cnt because new thread will have it in stack.
            InterlockedDecrement(TSVMMem(p).m_rcnt);
            // 05.03.2020 - wtf? Return decrement...


            p2 := NewSVMM_Ref(TSVMThread.Create(self.bytes,
              self.consts, self.extern_methods, self.mem, self.local_mem, r.GetW, p),
              self.grabber);
            TSVMMem(p2).m_rcnt := 1;

            self.stack.push(p2);
            Inc(self.ip);
          end;

          bcSTHR:
          begin
            {$WARNINGS OFF}
            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            TSVMThread(r.m_val).Suspend;
            {$WARNINGS ON}
            Inc(self.ip);
          end;

          bcRTHR:
          begin
            {$WARNINGS OFF}
            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            TSVMThread(r.m_val).Resume;
            {$WARNINGS ON}
            Inc(self.ip);
          end;

          bcTTHR:
          begin
            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            TSVMThread(r.m_val).Terminate;
            //PushTerminatedThread(TSVMThread(r.m_val));
            Inc(self.ip);
          end;

          bcTHSP:
          begin
            p := self.stack.popv;
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            TSVMThread(TSVMMem(p).m_val).Priority := TThreadPriority(r.GetW);
            Inc(self.ip);
          end;

          bcPLC:
          begin
            r := NewSVMM_FW(self.cbstack.peek, Grabber);
            r.m_rcnt := 1;
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
            InterlockedDecrement(TSVMMem(p).m_rcnt);

            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            try_blocks.add(TSVMMem(p).GetW, r.GetW);
            Inc(self.ip);
          end;

          bcTRS:
          begin
            self.ip := try_blocks.TR_Finally;
          end;

          bcTRR:
          begin
            p := EUnhandledVirtualRaisedException.Create('At point 0x' +
              IntToHex(self.ip, 8));
            self.ip := try_blocks.TR_Catch(Exception(p));
            FreeAndNil(p);
          end;

          {** for string's **}

          bcSTRD:
          begin// strdel;
            p := self.stack.popv;

            r := TSVMMem(p);
            InterlockedDecrement(r.m_rcnt);
            S := string(r.GetS);

            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            p2 := self.stack.popv;
            InterlockedDecrement(TSVMMem(p2).m_rcnt);

            System.Delete(s, TSVMMem(p2).GetW + 1, r.GetW);
            TSVMMem(p).SetS(s);
            S := '';
            Inc(self.ip);
          end;

          bcCHORD:
          begin
            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            p := NewSVMM_FW(Ord(r.GetS[1]), Grabber);
            TSVMMem(p).m_rcnt := 1;

            self.stack.push(p);
            Inc(self.ip);
          end;

          bcORDCH:
          begin
            r := TSVMMem(self.stack.popv);
            InterlockedDecrement(r.m_rcnt);

            p := NewSVMM_FS(Chr(r.GetW), Grabber);
            TSVMMem(p).m_rcnt := 1;

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
            if DbgCallBack <> nil then
              TDbgCallBack(DbgCallBack)(@self);

            Inc(self.ip);
          end;

          bcRST:
          begin
            rstack.push(stack.popv);
            Inc(self.ip);
          end;

          bcRLD:
          begin
            stack.push(rstack.popv);
            Inc(self.ip);
          end;

          bcRDP:
          begin
            rstack.drop;
            Inc(self.ip);
          end;

          else
            VMError('Error: not supported operation, byte 0x' +
              IntToHex(self.bytes^[self.ip], 2) + ', at #' + IntToStr(self.ip));
        end;
      end;
    except
      on E: Exception do
      begin
        p := NewSVMM_FS(E.Message, Grabber);
        TSVMMem(p).m_rcnt := 1;
        self.stack.push(p);

        p := NewSVMM_FS(E.ClassName, Grabber);
        TSVMMem(p).m_rcnt := 1;
        self.stack.push(p);

        p := NewSVMM_FW(self.ip, Grabber);
        TSVMMem(p).m_rcnt := 1;
        self.stack.push(p);

        self.ip := self.try_blocks.TR_Catch(E);
      end;
    end;
  until self.ip >= self.end_ip;

  self.stack.drop;
  self.rstack.drop;
end;

end.
