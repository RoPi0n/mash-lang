unit svm_threads;

{$mode objfpc}
{$H+}

interface

uses
  Classes,
  SysUtils,
  syncobjs,
  svm_common,
  svm_stack,
  svm_res,
  svm_imports,
  svm_mem,
  svm_grabber,
  svm_utils,
  svm_core;

{***** Context ****************************************************************}
type
  TSVMThreadContext = class
    public
      CtxMemory: PMemory;
      CtxStack: TStack;
      constructor Create(mem: PMemory; stack: PStack);
      destructor Destroy; override;
  end;

  TSVMThread = class(TThread)
    public
      vm: PSVM;
      constructor Create(bytes: PByteArr; consts: PConstSection;
        extern_methods: PImportSection; svm_memory, svm_local_memory: PMemory;
        method: TInstructionPointer; arg: pointer);
      procedure Execute; override;
      destructor Destroy; override;
  end;

  procedure InitThreads;
  procedure FreeThreads;

  procedure RefCounterInc(m: TSVMMem); inline;
  procedure RefCounterDec(m: TSVMMem); inline;

  procedure ThreadDestructor(pThr: pointer); stdcall;
implementation

procedure InitThreads;
begin

end;

procedure FreeThreads;
begin

end;

{***** Context ****************************************************************}

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

// Some features

procedure RefCounterInc(m: TSVMMem); inline;
var
  c, l: cardinal;
  _m: TSVMMem;
begin
  if m.m_type in [svmtArr, svmtClass] then
   begin
     c := 0;
     l := Length(PMemArray(m.m_val)^);
     while c < l do
      begin
        _m := TSVMMem(PMemArray(m.m_val)^[c]);
        if _m.m_type <> svmtNull then
         InterlockedIncrement(_m.m_rcnt);
        Inc(c);
      end;
   end;

  if m.m_type <> svmtNull then
   InterlockedIncrement(m.m_rcnt);
end;

procedure RefCounterDec(m: TSVMMem); inline;
var
  c, l: cardinal;
  _m: TSVMMem;
begin
  if m.m_type in [svmtArr, svmtClass] then
   begin
     c := 0;
     l := Length(PMemArray(m.m_val)^);
     while c < l do
      begin
        _m := TSVMMem(PMemArray(m.m_val)^[c]);
        if _m.m_type <> svmtNull then
         InterlockedDecrement(_m.m_rcnt);
        Inc(c);
      end;
   end;

  if m.m_type <> svmtNull then
   InterlockedDecrement(m.m_rcnt);
end;

{***** Thread *****************************************************************}

constructor TSVMThread.Create(bytes: PByteArr; consts: PConstSection;
  extern_methods: PImportSection; svm_memory, svm_local_memory: PMemory;
  method: TInstructionPointer; arg: pointer);
var
  c, ml: cardinal;
  m: TSVMMem;
begin
  GlobalLock.Enter;

  FreeOnTerminate := True;
  new(vm);
  vm^.isMainThread := False;
  vm^.bytes := bytes;
  vm^.end_ip := length(bytes^);
  vm^.consts := consts;
  vm^.extern_methods := extern_methods;
  vm^.stack.init;
  vm^.rstack.init;
  vm^.cbstack.init;
  vm^.pVM_NULL := VM_NULL;

  //fill mem map
  vm^.mem := svm_memory;
  new(vm^.local_mem);
  vm^.grabber := TGrabber.Create;

  ml := Length(svm_memory^);
  SetLength(vm^.local_mem^, ml);
  c := 0;
  while c < ml do
  begin
    vm^.local_mem^[c] := svm_local_memory^[c];
    InterlockedIncrement(TSVMMem(vm^.local_mem^[c]).m_rcnt);

    Inc(c);
  end;

  vm^.stack.push(arg);

  vm^.ip := method;
  m := NewSVMM_Ref(self, vm^.grabber);
  m.m_rcnt := 1;
  vm^.stack.push(m);

  GlobalLock.Release;

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
  GlobalLock.Enter;

  ml := Length(vm^.local_mem^);
  c := 0;
  while c < ml do
  begin
    InterlockedDecrement(TSVMMem(vm^.local_mem^[c]).m_rcnt);

    Inc(c);
  end;

  vm^.stack.free;
  vm^.rstack.free;
  SetLength(vm^.try_blocks.trblocks, 0);

  vm^.grabber.RunFull(True);
  GrabbersStorage.Add(vm^.grabber);
  //InterlockedIncrement(GrabbersInStorage);

  SetLength(vm^.local_mem^, 0);
  Dispose(vm^.local_mem);
  Dispose(vm);

  GlobalLock.Release;

  inherited Destroy;
end;

procedure ThreadDestructor(pThr: pointer); stdcall;
begin
  if TSVMThread(pThr).Suspended then
   TSVMThread(pThr).Terminate;
end;

end.

