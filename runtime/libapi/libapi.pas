library libapi;

uses
  svm_api, svm_mem;

type
  TCallingContext = record
    pVM: pointer;
    pStack: pointer;
    pGrabber: pointer;
  end;

  PCallingContext = ^TCallingContext;

{***** Receiving arguments *****}

function __Next_Type(pctx: PCallingContext): byte; stdcall;
begin
  Result := byte(TSVMMem(PStack(pctx^.pStack)^.peek).m_type);
end;

function __Next_Word(pctx: PCallingContext): longword; stdcall;
begin
  Result := TSVMMem(PStack(pctx^.pStack)^.popv).GetW;
end;

function __Next_Int(pctx: PCallingContext): int64; stdcall;
begin
  Result := TSVMMem(PStack(pctx^.pStack)^.popv).GetI;
end;

function __Next_Float(pctx: PCallingContext): double; stdcall;
begin
  Result := TSVMMem(PStack(pctx^.pStack)^.popv).GetD;
end;

procedure __Next_String(pctx: PCallingContext; str: PString); stdcall;
begin
  str^ := TSVMMem(PStack(pctx^.pStack)^.popv).GetS;
end;

function __Next_Bool(pctx: PCallingContext): boolean; stdcall;
begin
  Result := TSVMMem(PStack(pctx^.pStack)^.popv).GetB;
end;

function __Next_Ref(pctx: PCallingContext): pointer; stdcall;
begin
  Result := TSVMMem(PStack(pctx^.pStack)^.popv).m_val;
end;

{***** Pushing arguments *****}

procedure __Return_Word(pctx: PCallingContext; val: longword); stdcall;
begin
  PStack(pctx^.pStack)^.push( NewSVMM_FW(val, TGrabber(pctx^.pGrabber)) );
end;

procedure __Return_Int(pctx: PCallingContext; val: int64); stdcall;
begin
  PStack(pctx^.pStack)^.push( NewSVMM_FI(val, TGrabber(pctx^.pGrabber)) );
end;

procedure __Return_Float(pctx: PCallingContext; val: double); stdcall;
begin
  PStack(pctx^.pStack)^.push( NewSVMM_FD(val, TGrabber(pctx^.pGrabber)) );
end;

procedure __Return_String(pctx: PCallingContext; val: PString); stdcall;
var
  s: string;
begin
  s := val^;
  PStack(pctx^.pStack)^.push( NewSVMM_FS(s, TGrabber(pctx^.pGrabber)) );
end;

procedure __Return_Bool(pctx: PCallingContext; val: boolean); stdcall;
begin
  PStack(pctx^.pStack)^.push( NewSVMM_FI(Int64(val), TGrabber(pctx^.pGrabber)) );
end;

procedure __Return_Ref(pctx: PCallingContext; val: pointer); stdcall;
begin
  PStack(pctx^.pStack)^.push( NewSVMM_Ref(val, TGrabber(pctx^.pGrabber)) );
end;

exports __Next_Type     name '__Next_Type';
exports __Next_Word     name '__Next_Word';
exports __Next_Int      name '__Next_Int';
exports __Next_Float    name '__Next_Float';
exports __Next_String   name '__Next_String';
exports __Next_Bool     name '__Next_Bool';
exports __Next_Ref      name '__Next_Ref';

exports __Return_Word   name '__Return_Word';
exports __Return_Int    name '__Return_Int';
exports __Return_Float  name '__Return_Float';
exports __Return_String name '__Return_String';
exports __Return_Bool   name '__Return_Bool';
exports __Return_Ref    name '__Return_Ref';
begin
end.
