unit svm_threads;

{$mode objfpc}
{$H+}

interface

uses
  Classes,
  SysUtils,
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
      extern_methods: PImportSection; svm_memory: PMemory;
      method: TInstructionPointer; arg: pointer);
    procedure Execute; override;
    destructor Destroy; override;
  end;

implementation

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

{***** Thread *****************************************************************}

constructor TSVMThread.Create(bytes: PByteArr; consts: PConstSection;
  extern_methods: PImportSection; svm_memory: PMemory;
  method: TInstructionPointer; arg: pointer);
var
  c, ml: cardinal;
  m: TSVMMem;
begin
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

  //fill mem map
  new(vm^.mem);
  ml := Length(svm_memory^);
  SetLength(vm^.mem^, ml);
  c := 0;
  while c < ml do
  begin
    vm^.mem^[c] := svm_memory^[c];

    if svm_memory^[c] <> nil then
      //if TObject(svm_memory^[c]) is TSVMMem then
      Inc(TSVMMem(svm_memory^[c]).m_refc);

    Inc(c);
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
      //if TObject(vm^.mem^[c]) is TSVMMem then
      Dec(TSVMMem(vm^.mem^[c]).m_refc);

    Inc(c);
  end;

  vm^.stack.drop;
  vm^.rstack.drop;

  GrabbersStorage.Add(vm^.grabber);

  SetLength(vm^.mem^, 0);
  Dispose(vm^.mem);
  Dispose(vm);

  inherited Destroy;
end;

end.

