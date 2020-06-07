{*
 *  Mash SVM API.
 *  You should read docs before using it.
 *}

const
  svmlib = 'svm.lib';

procedure SVM_Init; stdcall; external svmlib name '_SVM_INIT';
procedure SVM_Free; stdcall; external svmlib name '_SVM_FREE';

function  SVM_CreateVM(CustomArgs: boolean = false):Pointer; stdcall; external svmlib name '_SVM_CREATE_VM';
procedure SVM_FreeVM(SVM:Pointer); stdcall; external svmlib name '_SVM_FREE_VM';

procedure SVM_RegAPI(SVM:Pointer; ExtFunc:Pointer); stdcall; external svmlib name '_SVM_REGAPI';
procedure SVM_SetDbgCallBack(SVM:Pointer; DbgCB:Pointer); stdcall; external svmlib name '_SVM_DEBUGCALLBACK';
procedure SVM_Run(SVM:Pointer); stdcall; external svmlib name '_SVM_RUN';
procedure SVM_LoadExeFromFile(SVM:Pointer; MainClassPath:PString); stdcall; external svmlib name '_SVM_LOADEXEFROMFILE';
procedure SVM_LoadExeFromMem(SVM:Pointer; MainClassPath:PString; Buf:Pointer; Size:Cardinal); stdcall; external svmlib name '_SVM_LOADEXEFROMMEM';
procedure SVM_CheckErr(SVM:Pointer; E:Exception); stdcall; external svmlib name '_SVM_CHECKERR';
procedure SVM_Continue(SVM:Pointer); stdcall; external svmlib name '_SVM_CONTINUE';

type
  TVMValueType = (
    vmtNull, vmtWord, vmtInt, vmtReal, vmtStr, vmtArr, vmtClass, vmtRef
  );

  TRefDestructorCallBack = procedure(p: pointer); stdcall;
  PRefDestructorCallBack = ^TRefDestructorCallBack;

function  __Next_Type(SVM: Pointer): byte; stdcall; external svmlib name '__Next_Type';
function  __Next_Word(SVM: Pointer): longword; stdcall; external svmlib name '__Next_Word';
function  __Next_Int(SVM: Pointer): int64; stdcall; external svmlib name '__Next_Int';
function  __Next_Float(SVM: Pointer): double; stdcall; external svmlib name '__Next_Float';
procedure __Next_String(SVM: Pointer; str: PString); stdcall; external svmlib name '__Next_String'; overload;
function  __Next_Bool(SVM: Pointer): boolean; stdcall; external svmlib name '__Next_Bool';
function  __Next_Ref(SVM: Pointer): pointer; stdcall; external svmlib name '__Next_Ref';
function  __Next_Object(SVM: Pointer): pointer; stdcall; external svmlib name '__Next_Object';

procedure __Return_Word(SVM: Pointer; val: longword); stdcall; external svmlib name '__Return_Word';
procedure __Return_Int(SVM: Pointer; val: int64); stdcall; external svmlib name '__Return_Int';
procedure __Return_Float(SVM: Pointer; val: double); stdcall; external svmlib name '__Return_Float';
procedure __Return_String(SVM: Pointer; val: PString); stdcall; external svmlib name '__Return_String'; overload;
procedure __Return_Bool(SVM: Pointer; val: boolean); stdcall; external svmlib name '__Return_Bool';
procedure __Return_Ref(SVM: Pointer; val: pointer; dcbp: pointer); stdcall; external svmlib name '__Return_Ref';
procedure __Return_Object(SVM: Pointer; val: pointer); stdcall; external svmlib name '__Return_Object';
procedure __Return_Null(SVM: Pointer); stdcall; external svmlib name '__Return_Null';

function __Next_String(SVM: Pointer): string; overload;
begin
  Result := '';
  __Next_String(SVM, @Result);
end;

procedure __Return_String(SVM: Pointer; val: string); overload;
begin
  __Return_String(SVM, @val);
end;

procedure __Make_CallBack(SVM: Pointer; addr: cardinal); stdcall; external svmlib name '__Make_CallBack';

function  __New_Set(SVM: Pointer): pointer; stdcall; external svmlib name '__New_Set';
procedure __Push_To_Set(pSet: Pointer; Ptr: pointer); stdcall; external svmlib name '__Push_To_Set';

function __New_Word(pVM: Pointer; val: longword): pointer; stdcall; external svmlib name '__New_Word';
function __New_Int(pVM: Pointer; val: int64): pointer; stdcall; external svmlib name '__New_Int';
function __New_Float(pVM: Pointer; val: double): pointer; stdcall; external svmlib name '__New_Float';
function __New_String(pVM: Pointer; val: PString): pointer; stdcall; external svmlib name '__New_String'; overload;
function __New_Bool(pVM: Pointer; val: boolean): pointer; stdcall; external svmlib name '__New_Bool';
function __New_Ref(pVM: Pointer; val: pointer; dcbp: Pointer): pointer; stdcall; external svmlib name '__New_Ref';

function __New_String(SVM: Pointer; val: string): pointer; overload;
begin
  Result := __New_String(SVM, @val);
end;
