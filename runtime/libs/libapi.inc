type
  TVMValueType = (
    vmtNull, vmtWord, vmtInt, vmtReal, vmtStr, vmtArr, vmtClass, vmtRef
  );

function __Next_Type(pctx: Pointer): byte; stdcall; external 'libapi.lib' name '__Next_Type';
function __Next_Word(pctx: Pointer): longword; stdcall; external 'libapi.lib' name '__Next_Word';
function __Next_Int(pctx: Pointer): int64; stdcall; external 'libapi.lib' name '__Next_Int';
function __Next_Float(pctx: Pointer): double; stdcall; external 'libapi.lib' name '__Next_Float';
procedure __Next_String(pctx: Pointer; str: PString); stdcall; external 'libapi.lib' name '__Next_String'; overload;
function __Next_Bool(pctx: Pointer): boolean; stdcall; external 'libapi.lib' name '__Next_Bool';
function __Next_Ref(pctx: Pointer): pointer; stdcall; external 'libapi.lib' name '__Next_Ref';

procedure __Return_Word(pctx: Pointer; val: longword); stdcall; external 'libapi.lib' name '__Return_Word';
procedure __Return_Int(pctx: Pointer; val: int64); stdcall; external 'libapi.lib' name '__Return_Int';
procedure __Return_Float(pctx: Pointer; val: double); stdcall; external 'libapi.lib' name '__Return_Float';
procedure __Return_String(pctx: Pointer; val: PString); stdcall; external 'libapi.lib' name '__Return_String'; overload;
procedure __Return_Bool(pctx: Pointer; val: boolean); stdcall; external 'libapi.lib' name '__Return_Bool';
procedure __Return_Ref(pctx: Pointer; val: pointer); stdcall; external 'libapi.lib' name '__Return_Ref';

function __Next_String(pctx: Pointer): string; overload;
begin
  Result := '';
  __Next_String(pctx, @Result);
end;

procedure __Return_String(pctx: Pointer; val: string); overload;
begin
  __Return_String(pctx, @val);
end;
