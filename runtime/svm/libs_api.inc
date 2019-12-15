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

function NewSVMM_Ref(ref:pointer; Grabber: TGrabber; dcbp: PDestructorCallBack): TSVMMem;
begin
  Result := TSVMMem.MCreate;
  Result.m_val := ref;
  Result.m_type := svmtRef;
  Result.m_refc := 0;
  Result.m_dcbp := dcbp;
  Grabber.Reg(Result);
end;

{** API Stack **}

type
  TAPIStack = object
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

  PAPIStack = ^TAPIStack;

procedure TAPIStack.push(p: pointer);
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

function TAPIStack.peek: pointer;
begin
  Result := items[i_pos - 1];
end;

procedure TAPIStack.pop;
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

function TAPIStack.popv: pointer;
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

procedure TAPIStack.swp;
var
  p: pointer;
begin
  p := items[i_pos - 2];
  items[i_pos - 2] := items[i_pos - 1];
  items[i_pos - 1] := p;
end;

procedure TAPIStack.drop;
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

{** Exports **}

function __Next_Type(pVM: PSVM): byte; stdcall;
begin
  Result := byte(TSVMMem(PAPIStack(@(pVM^.Stack))^.peek).m_type);
end;

function __Next_Word(pVM: PSVM): longword; stdcall;
begin
  Result := TSVMMem(PAPIStack(@(pVM^.Stack))^.popv).GetW;
end;

function __Next_Int(pVM: PSVM): int64; stdcall;
begin
  Result := TSVMMem(PAPIStack(@(pVM^.Stack))^.popv).GetI;
end;

function __Next_Float(pVM: PSVM): double; stdcall;
begin
  Result := TSVMMem(PAPIStack(@(pVM^.Stack))^.popv).GetD;
end;

procedure __Next_String(pVM: PSVM; str: PString); stdcall;
begin
  str^ := TSVMMem(PAPIStack(@(pVM^.Stack))^.popv).GetS;
end;

function __Next_Bool(pVM: PSVM): boolean; stdcall;
begin
  Result := TSVMMem(PAPIStack(@(pVM^.Stack))^.popv).GetB;
end;

function __Next_Ref(pVM: PSVM): pointer; stdcall;
begin
  Result := TSVMMem(PAPIStack(@(pVM^.Stack))^.popv).m_val;
end;

function __Next_Object(pVM: PSVM): pointer; stdcall;
begin
  Result := TSVMMem(PAPIStack(@(pVM^.Stack))^.popv);
end;

{***** Pushing arguments *****}

procedure __Return_Word(pVM: PSVM; val: longword); stdcall;
begin
  PAPIStack(@(pVM^.Stack))^.push( NewSVMM_FW(val, pVM^.Grabber) );
end;

procedure __Return_Int(pVM: PSVM; val: int64); stdcall;
begin
  PAPIStack(@(pVM^.Stack))^.push( NewSVMM_FI(val, pVM^.Grabber) );
end;

procedure __Return_Float(pVM: PSVM; val: double); stdcall;
begin
  PAPIStack(@(pVM^.Stack))^.push( NewSVMM_FD(val, pVM^.Grabber) );
end;

procedure __Return_String(pVM: PSVM; val: PString); stdcall;
var
  s: string;
begin
  s := val^;
  PAPIStack(@(pVM^.Stack))^.push( NewSVMM_FS(s, pVM^.Grabber) );
end;

procedure __Return_Bool(pVM: PSVM; val: boolean); stdcall;
begin
  PAPIStack(@(pVM^.Stack))^.push( NewSVMM_FI(Int64(val), pVM^.Grabber) );
end;

procedure __Return_Ref(pVM: PSVM; val: pointer; dcbp: PDestructorCallBack); stdcall;
begin
  PAPIStack(@(pVM^.Stack))^.push( NewSVMM_Ref(val, pVM^.Grabber, dcbp) );
end;

procedure __Return_Object(pVM: PSVM; val: pointer); stdcall;
begin
  PAPIStack(@(pVM^.Stack))^.push(val);
end;

function __New_Set(pVM: PSVM): pointer; stdcall;
begin
  Result := NewSVMM_Arr(0, pVM^.Grabber);
end;

procedure __Push_To_Set(pSet: TSVMMem; Ptr: pointer); stdcall;
var
  sz: cardinal;
begin
  sz := pSet.ArrGetSize;
  pSet.ArrSetSize(sz + 1);
  pSet.ArrSet(sz, Ptr);
  Inc(TSVMMem(Ptr).m_refc);
end;

function __New_Word(pVM: PSVM; val: longword): pointer; stdcall;
begin
  Result := NewSVMM_FW(val, pVM^.Grabber);
end;

function __New_Int(pVM: PSVM; val: int64): pointer; stdcall;
begin
  Result := NewSVMM_FI(val, pVM^.Grabber);
end;

function __New_Float(pVM: PSVM; val: double): pointer; stdcall;
begin
  Result := NewSVMM_FD(val, pVM^.Grabber);
end;

function __New_String(pVM: PSVM; val: PString): pointer; stdcall;
var
  s: string;
begin
  s := val^;
  Result := NewSVMM_FS(s, pVM^.Grabber);
end;

function __New_Bool(pVM: PSVM; val: boolean): pointer; stdcall;
begin
  Result := NewSVMM_FI(Int64(val), pVM^.Grabber);
end;

function __New_Ref(pVM: PSVM; val: pointer; dcbp: PDestructorCallBack): pointer; stdcall;
begin
  Result := NewSVMM_Ref(val, pVM^.Grabber, dcbp);
end;

{** Callback mechanic **}

procedure __Make_CallBack(pVM: PSVM; addr: TInstructionPointer); stdcall;
begin
  pVM^.cbstack.push(pVM^.ip + 1); //adding +1 for avoid looping
  pVM^.ip := addr;
end;

exports __Next_Type     name '__Next_Type';
exports __Next_Word     name '__Next_Word';
exports __Next_Int      name '__Next_Int';
exports __Next_Float    name '__Next_Float';
exports __Next_String   name '__Next_String';
exports __Next_Bool     name '__Next_Bool';
exports __Next_Ref      name '__Next_Ref';
exports __Next_Object   name '__Next_Object';

exports __Return_Word   name '__Return_Word';
exports __Return_Int    name '__Return_Int';
exports __Return_Float  name '__Return_Float';
exports __Return_String name '__Return_String';
exports __Return_Bool   name '__Return_Bool';
exports __Return_Ref    name '__Return_Ref';
exports __Return_Object name '__Return_Object';

exports __New_Set       name '__New_Set';
exports __Push_To_Set   name '__Push_To_Set';

exports __New_Word      name '__New_Word';
exports __New_Int       name '__New_Int';
exports __New_Float     name '__New_Float';
exports __New_String    name '__New_String';
exports __New_Bool      name '__New_Bool';
exports __New_Ref       name '__New_Ref';

exports __Make_CallBack name '__Make_CallBack';
