unit svm;

{*
 *  Mash Stack-based Virtual Machine native API.
 *  You should read docs before using it.
 *}

interface
  uses sysutils{$IfDef Unix}, dynlibs{$EndIf};

  const
    svmlib = 'svm.lib';

  type
    TVMValueType = (
      vmtNull, vmtWord, vmtInt, vmtReal, vmtStr, vmtArr, vmtClass, vmtRef
    );

    TRefDestructorCallBack = procedure(p: pointer); stdcall;
    PRefDestructorCallBack = ^TRefDestructorCallBack;

  {$IfDef Windows}
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

  function  __Next_Type(SVM: Pointer): byte; stdcall; external svmlib name '__Next_Type';
  function  __Next_Word(SVM: Pointer): longword; stdcall; external svmlib name '__Next_Word';
  function  __Next_Int(SVM: Pointer): int64; stdcall; external svmlib name '__Next_Int';
  function  __Next_Float(SVM: Pointer): double; stdcall; external svmlib name '__Next_Float';
  procedure __Next_String(SVM: Pointer; str: PString); stdcall; external svmlib name '__Next_String';
  function  __Next_Bool(SVM: Pointer): boolean; stdcall; external svmlib name '__Next_Bool';
  function  __Next_Ref(SVM: Pointer): pointer; stdcall; external svmlib name '__Next_Ref';
  function  __Next_Object(SVM: Pointer): pointer; stdcall; external svmlib name '__Next_Object';

  procedure __Return_Word(SVM: Pointer; val: longword); stdcall; external svmlib name '__Return_Word';
  procedure __Return_Int(SVM: Pointer; val: int64); stdcall; external svmlib name '__Return_Int';
  procedure __Return_Float(SVM: Pointer; val: double); stdcall; external svmlib name '__Return_Float';
  procedure __Return_String(SVM: Pointer; val: PString); stdcall; external svmlib name '__Return_String';
  procedure __Return_Bool(SVM: Pointer; val: boolean); stdcall; external svmlib name '__Return_Bool';
  procedure __Return_Ref(SVM: Pointer; val: pointer; dcbp: pointer); stdcall; external svmlib name '__Return_Ref';
  procedure __Return_Object(SVM: Pointer; val: pointer); stdcall; external svmlib name '__Return_Object';
  procedure __Return_Null(SVM: Pointer); stdcall; external svmlib name '__Return_Null';

  procedure __Make_CallBack(SVM: Pointer; addr: cardinal); stdcall; external svmlib name '__Make_CallBack';

  function  __New_Set(SVM: Pointer): pointer; stdcall; external svmlib name '__New_Set';
  procedure __Push_To_Set(pSet: Pointer; Ptr: pointer); stdcall; external svmlib name '__Push_To_Set';

  function __New_Word(pVM: Pointer; val: longword): pointer; stdcall; external svmlib name '__New_Word';
  function __New_Int(pVM: Pointer; val: int64): pointer; stdcall; external svmlib name '__New_Int';
  function __New_Float(pVM: Pointer; val: double): pointer; stdcall; external svmlib name '__New_Float';
  function __New_String(pVM: Pointer; val: PString): pointer; stdcall; external svmlib name '__New_String';
  function __New_Bool(pVM: Pointer; val: boolean): pointer; stdcall; external svmlib name '__New_Bool';
  function __New_Ref(pVM: Pointer; val: pointer; dcbp: Pointer): pointer; stdcall; external svmlib name '__New_Ref';
  {$EndIf}

  {$IfDef Unix}
  type
    TSVM_Init = procedure; stdcall;
    TSVM_Free = procedure; stdcall;

    TSVM_CreateVM = function(CustomArgs: boolean):Pointer; stdcall;
    TSVM_FreeVM = procedure(SVM:Pointer); stdcall;

    TSVM_RegAPI = procedure(SVM:Pointer; ExtFunc:Pointer); stdcall;
    TSVM_SetDbgCallBack = procedure(SVM:Pointer; DbgCB:Pointer); stdcall;
    TSVM_Run = procedure(SVM:Pointer); stdcall;
    TSVM_LoadExeFromFile = procedure(SVM:Pointer; MainClassPath:PString); stdcall;
    TSVM_LoadExeFromMem = procedure(SVM:Pointer; MainClassPath:PString; Buf:Pointer; Size:Cardinal); stdcall;
    TSVM_CheckErr = procedure(SVM:Pointer; E:Exception); stdcall;
    TSVM_Continue = procedure(SVM:Pointer); stdcall;

    T__Next_Type = function(SVM: Pointer): byte; stdcall;
    T__Next_Word = function(SVM: Pointer): longword; stdcall;
    T__Next_Int = function(SVM: Pointer): int64; stdcall;
    T__Next_Float = function(SVM: Pointer): double; stdcall;
    T__Next_String = procedure(SVM: Pointer; str: PString); stdcall;
    T__Next_Bool = function(SVM: Pointer): boolean; stdcall;
    T__Next_Ref = function(SVM: Pointer): pointer; stdcall;
    T__Next_Object = function(SVM: Pointer): pointer; stdcall;

    T__Return_Word = procedure(SVM: Pointer; val: longword); stdcall;
    T__Return_Int = procedure(SVM: Pointer; val: int64); stdcall;
    T__Return_Float = procedure(SVM: Pointer; val: double); stdcall;
    T__Return_String = procedure(SVM: Pointer; val: PString); stdcall;
    T__Return_Bool = procedure(SVM: Pointer; val: boolean); stdcall;
    T__Return_Ref = procedure(SVM: Pointer; val: pointer; dcbp: pointer); stdcall;
    T__Return_Object = procedure(SVM: Pointer; val: pointer); stdcall;
    T__Return_Null = procedure(SVM: Pointer); stdcall;

    T__Make_CallBack = procedure(SVM: Pointer; addr: cardinal); stdcall;

    T__New_Set = function(SVM: Pointer): pointer; stdcall;
    T__Push_To_Set = procedure(pSet: Pointer; Ptr: pointer); stdcall;

    T__New_Word = function(pVM: Pointer; val: longword): pointer; stdcall;
    T__New_Int = function(pVM: Pointer; val: int64): pointer; stdcall;
    T__New_Float = function(pVM: Pointer; val: double): pointer; stdcall;
    T__New_String = function(pVM: Pointer; val: PString): pointer; stdcall;
    T__New_Bool = function(pVM: Pointer; val: boolean): pointer; stdcall;
    T__New_Ref = function(pVM: Pointer; val: pointer; dcbp: Pointer): pointer; stdcall;



  var
    __svmlib: THandle;

    SVM_Init: TSVM_Init;
    SVM_Free: TSVM_Free;

    SVM_CreateVM: TSVM_CreateVM;
    SVM_FreeVM: TSVM_FreeVM;

    SVM_RegAPI: TSVM_RegAPI;
    SVM_SetDbgCallBack: TSVM_SetDbgCallBack;
    SVM_Run: TSVM_Run;
    SVM_LoadExeFromFile: TSVM_LoadExeFromFile;
    SVM_LoadExeFromMem: TSVM_LoadExeFromMem;
    SVM_CheckErr: TSVM_CheckErr;
    SVM_Continue: TSVM_Continue;

    __Next_Type: T__Next_Type;
    __Next_Word: T__Next_Word;
    __Next_Int: T__Next_Int;
    __Next_Float: T__Next_Float;
    __Next_String: T__Next_String;
    __Next_Bool: T__Next_Bool;
    __Next_Ref: T__Next_Ref;
    __Next_Object: T__Next_Object;

    __Return_Word: T__Return_Word;
    __Return_Int: T__Return_Int;
    __Return_Float: T__Return_Float;
    __Return_String: T__Return_String;
    __Return_Bool: T__Return_Bool;
    __Return_Ref: T__Return_Ref;
    __Return_Object: T__Return_Object;
    __Return_Null: T__Return_Null;

    __Make_CallBack: T__Make_CallBack;

    __New_Set: T__New_Set;
    __Push_To_Set: T__Push_To_Set;
    __New_Word: T__New_Word;
    __New_Int: T__New_Int;
    __New_Float: T__New_Float;
    __New_String: T__New_String;
    __New_Bool: T__New_Bool;
    __New_Ref: T__New_Ref;
  {$EndIf}

  function __Next_StringA(SVM: Pointer): string;
  procedure __Return_StringA(SVM: Pointer; val: string);  
  function __New_StringA(SVM: Pointer; val: string): pointer;

implementation

function __Next_StringA(SVM: Pointer): string;
begin
  Result := '';
  __Next_String(SVM, @Result);
end;

procedure __Return_StringA(SVM: Pointer; val: string);
begin
  __Return_String(SVM, @val);
end;

function __New_StringA(SVM: Pointer; val: string): pointer;
begin
  Result := __New_String(SVM, @val);
end;




{$IfDef Unix}
initialization
  __svmlib := LoadLibrary(svmlib);

  SVM_Init := TSVM_Init(GetProcAddress(__svmlib, '_SVM_INIT'));
  SVM_Free := TSVM_Free(GetProcAddress(__svmlib, '_SVM_FREE'));

  SVM_CreateVM := TSVM_CreateVM(GetProcAddress(__svmlib, '_SVM_CREATE_VM'));
  SVM_FreeVM := TSVM_FreeVM(GetProcAddress(__svmlib, '_SVM_FREE_VM'));

  SVM_RegAPI := TSVM_RegAPI(GetProcAddress(__svmlib, '_SVM_REGAPI'));
  SVM_SetDbgCallBack := TSVM_SetDbgCallBack(GetProcAddress(__svmlib, '_SVM_DEBUGCALLBACK'));
  SVM_Run := TSVM_Run(GetProcAddress(__svmlib, '_SVM_RUN'));
  SVM_LoadExeFromFile := TSVM_LoadExeFromFile(GetProcAddress(__svmlib, '_SVM_LOADEXEFROMFILE'));
  SVM_LoadExeFromMem := TSVM_LoadExeFromMem(GetProcAddress(__svmlib, '_SVM_LOADEXEFROMMEM'));
  SVM_CheckErr := TSVM_CheckErr(GetProcAddress(__svmlib, '_SVM_CHECKERR'));
  SVM_Continue := TSVM_Continue(GetProcAddress(__svmlib, '_SVM_CONTINUE'));

  __Next_Type := T__Next_Type(GetProcAddress(__svmlib, '__Next_Type'));
  __Next_Word := T__Next_Word(GetProcAddress(__svmlib, '__Next_Word'));
  __Next_Int := T__Next_Int(GetProcAddress(__svmlib, '__Next_Int'));
  __Next_Float := T__Next_Float(GetProcAddress(__svmlib, '__Next_Float'));
  __Next_String := T__Next_String(GetProcAddress(__svmlib, '__Next_String'));
  __Next_Bool := T__Next_Bool(GetProcAddress(__svmlib, '__Next_Bool'));
  __Next_Ref := T__Next_Ref(GetProcAddress(__svmlib, '__Next_Ref'));
  __Next_Object := T__Next_Object(GetProcAddress(__svmlib, '__Next_Object'));

  __Return_Word := T__Return_Word(GetProcAddress(__svmlib, '__Return_Word'));
  __Return_Int := T__Return_Int(GetProcAddress(__svmlib, '__Return_Int'));
  __Return_Float := T__Return_Float(GetProcAddress(__svmlib, '__Return_Float'));
  __Return_String := T__Return_String(GetProcAddress(__svmlib, '__Return_String'));
  __Return_Bool := T__Return_Bool(GetProcAddress(__svmlib, '__Return_Bool'));
  __Return_Ref := T__Return_Ref(GetProcAddress(__svmlib, '__Return_Ref'));
  __Return_Object := T__Return_Object(GetProcAddress(__svmlib, '__Return_Object'));
  __Return_Null := T__Return_Null(GetProcAddress(__svmlib, '__Return_Null'));

  __Make_CallBack := T__Make_CallBack(GetProcAddress(__svmlib, '__Make_CallBack'));

  __New_Set := T__New_Set(GetProcAddress(__svmlib, '__New_Set'));
  __Push_To_Set := T__Push_To_Set(GetProcAddress(__svmlib, '__Push_To_Set'));
  __New_Word := T__New_Word(GetProcAddress(__svmlib, '__New_Word'));
  __New_Int := T__New_Int(GetProcAddress(__svmlib, '__New_Int'));
  __New_Float := T__New_Float(GetProcAddress(__svmlib, '__New_Float'));
  __New_String := T__New_String(GetProcAddress(__svmlib, '__New_String'));
  __New_Bool := T__New_Bool(GetProcAddress(__svmlib, '__New_Bool'));
  __New_Ref := T__New_Ref(GetProcAddress(__svmlib, '__New_Ref'));

finalization
  FreeLibrary(__svmlib);
{$EndIf}

end.
