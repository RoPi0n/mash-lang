unit svm_api;

{$mode objfpc}{$H+}

interface

uses
  SysUtils,
  svm_mem;
  
type
  TInstructionPointer = cardinal;
  TByteArr = array of byte;
  PByteArr = ^TByteArr;
  
  function CreateSVMMemCopy(m:TSVMMem):TSVMMem;

  function NewSVMM(Grabber: TGrabber): TSVMMem;
  function NewSVMM_F(const value; t:TSVMType; Grabber: TGrabber): TSVMMem;
  function NewSVMM_FS(s:string; Grabber: TGrabber): TSVMMem;
  function NewSVMM_FW(w:cardinal; Grabber: TGrabber): TSVMMem;
  function NewSVMM_FI(i:int64; Grabber: TGrabber): TSVMMem;
  function NewSVMM_FD(d:double; Grabber: TGrabber): TSVMMem;
  function NewSVMM_Arr(size:cardinal; Grabber: TGrabber): TSVMMem;
  function NewSVMM_Ref(ref:pointer; Grabber: TGrabber): TSVMMem;
  
  {** Stack **}
type
  TStack = object
   public
      items: array of pointer;
      size, i_pos: cardinal;
      procedure push(p: pointer);
      function peek: pointer;
      procedure pop;
      function popv: pointer;
      procedure swp;
      procedure drop;
   end;

  PStack = ^TStack;
  
const
  StackBlockSize = 256;

{** Callback stack **}
  
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
 
{** vm **}

  TSVM = object
  public
    ip,end_ip: TInstructionPointer;
    mainclasspath: string;
    mem: pointer;
    stack: TStack;
    cbstack: TCallBackStack;
    bytes: PByteArr;
    grabber: TGrabber;
  end;
  
  PSVM = ^TSVM;
  
implementation

{***** utils *****}

function CreateSVMMemCopy(m:TSVMMem):TSVMMem; inline;
var
  c, l: cardinal;
begin
  Result := nil;
  if m.m_type = svmtClass then
   Result := m
  else
  if m.m_type = svmtArr then
   begin
     Result := TSVMMem.Create;
     Result.m_type := svmtArr;
     Result.m_refc := 0;
	 new(PMemArray(Result.m_val));
     l := Length(PMemArray(m.m_val)^);
     SetLength(PMemArray(Result.m_val)^, l);
     c := 0;
     while c < l do
      begin
        PMemArray(Result.m_val)^[c] := PMemArray(m.m_val)^[c];
        inc(c);
      end;
   end
  else
   begin
     Result := TSVMMem.Create;
     Result.m_val := nil;
     Result.m_type := m.m_type;
	 Result.m_refc := 0;
     Result.SetV(m.m_val^, m.m_type);
   end;
end;

{** Allocations **}

function NewSVMM(Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreate;
  Result.m_refc := 0;
  Grabber.Reg(Result);
end;

function NewSVMM_F(const value; t:TSVMType; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreateF(value, t);
  Result.m_refc := 0;
  Grabber.Reg(Result);
end;

function NewSVMM_FS(s:string; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreateFS(s);
  Result.m_refc := 0;
  Grabber.Reg(Result);
end;

function NewSVMM_FW(w:cardinal; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreateFW(w);
  Result.m_refc := 0;
  Grabber.Reg(Result);
end;

function NewSVMM_FI(i:int64; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreate;
  Result.m_refc := 0;
  Result.SetV(i, svmtInt);
  Grabber.Reg(Result);
end;

function NewSVMM_FD(d:double; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreate;
  Result.m_refc := 0;
  Result.SetV(d, svmtReal);
  Grabber.Reg(Result);
end;

function NewSVMM_Arr(size:cardinal; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreateArr(size);
  Result.m_refc := 0;
  Grabber.Reg(Result);
end;

function NewSVMM_Ref(ref:pointer; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreate;
  Result.m_val := ref;
  Result.m_type := svmtRef;
  Result.m_refc := 0;
  Grabber.Reg(Result);
end;

{** Stack **}

procedure TStack.push(p: pointer);
begin
  items[i_pos] := p;
  inc(i_pos);

  try
    Inc(TSVMMem(p).m_refc);
  finally
    if i_pos >= size then
     begin
       size := size + StackBlockSize;
       SetLength(items, size)
     end;
  end;
end;

function TStack.peek: pointer;
begin
  Result := items[i_pos - 1];
end;

procedure TStack.pop;
begin
  try
    Dec(TSVMMem(self.peek).m_refc);
  finally
    Dec(i_pos);
    if size - i_pos > StackBlockSize then
     begin
       size := size - StackBlockSize;
       SetLength(items, size);
     end;
  end;
end;

function TStack.popv: pointer;
begin
  Dec(i_pos);
  Result := items[i_pos];

  try
    Dec(TSVMMem(Result).m_refc);
  finally
    if size - i_pos > StackBlockSize then
     begin
       size := size - StackBlockSize;
       SetLength(items, size);
     end;
  end;
end;

procedure TStack.swp;
var
  p: pointer;
begin
  p := items[i_pos - 2];
  items[i_pos - 2] := items[i_pos - 1];
  items[i_pos - 1] := p;
end;

procedure TStack.drop;
var
   c: cardinal;
begin
   c := 0;
   while c < i_pos do
    begin
      try
        Dec(TSVMMem(items[c]).m_refc);
      finally
        inc(c);
      end;
    end;

   SetLength(items, StackBlockSize);
   size := StackBlockSize;
   i_pos := 0;
end; 

{** Callback stack **}

procedure TCallBackStack.init;
begin
  SetLength(items, CallBackStackBlockSize);
  i_pos := 0;
  size := CallBackStackBlockSize;
end;

procedure TCallBackStack.push(ip: TInstructionPointer);
begin
  items[i_pos] := ip;
  inc(i_pos);
  if i_pos >= size then
   begin
     size := size + CallBackStackBlockSize;
     SetLength(items, size)
   end;
end;

function TCallBackStack.popv: TInstructionPointer;
begin
  dec(i_pos);
  Result := items[i_pos];
end;

function TCallBackStack.peek: TInstructionPointer;
begin
  Result := items[i_pos - 1];
end;

procedure TCallBackStack.pop;
begin
  dec(i_pos);
  if size - i_pos > CallBackStackBlockSize then
   begin
     size := size - CallBackStackBlockSize;
     SetLength(items, size);
   end;
end;

end.
