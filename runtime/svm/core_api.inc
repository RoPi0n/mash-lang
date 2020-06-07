procedure SVM_Init; stdcall;
begin
  GrabbersStorage := TThreadList.Create;

  {$IfDef WindowsSEH}
    SVM_InitVEH;
  {$EndIf}

  InitSVMM;
  InitThreads;
end;

procedure SVM_Free; stdcall;
begin
  GlobalTerm;
  FreeThreads;
  FreeAndNil(GrabbersStorage);

  {$IfDef WindowsSEH}
    SVM_FreeVEH;
  {$EndIf}

  FreeSVMM;
end;

function SVM_CreateVM(CustomArgs: boolean):PSVM; stdcall;
begin
  new(Result);
  new(Result^.bytes);
  new(Result^.consts);
  new(Result^.extern_methods);
  new(Result^.mem);

  Result^.isMainThread := true;
  Result^.pVM_NULL := VM_NULL;
  Result^.stack.init;
  Result^.rstack.init;
  Result^.cbstack.init;
  Result^.CustomArgsMode := CustomArgs;
end;

procedure SVM_FreeVM(SVM:PSVM); stdcall;
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

  CheckHeader(SVM^.bytes);
  CutLeftBytes(SVM^.bytes, 10);

  SVM^.extern_methods^.Parse(SVM^.bytes, SVM^.mainclasspath);
  SVM^.consts^.Parse(SVM^.bytes);
end;

procedure SVM_LoadExeFromMem(SVM:PSVM; MainClassPath:PString; PMem: PByte; Size: Cardinal); stdcall;
begin
  SVM^.mainclasspath := MainClassPath^;
  SVM^.LoadByteCodeFromMem(PMem, Size);

  CheckHeader(SVM^.bytes);
  CutLeftBytes(SVM^.bytes, 10);

  SVM^.extern_methods^.Parse(SVM^.bytes, SVM^.mainclasspath);
  SVM^.consts^.Parse(SVM^.bytes);
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

exports SVM_Init            name '_SVM_INIT';
exports SVM_Free            name '_SVM_FREE';
exports SVM_CreateVM        name '_SVM_CREATE_VM';
exports SVM_FreeVM          name '_SVM_FREE_VM';
exports SVM_LoadExeFromFile name '_SVM_LOADEXEFROMFILE';
exports SVM_LoadExeFromMem  name '_SVM_LOADEXEFROMMEM';
exports SVM_Run             name '_SVM_RUN';
exports SVM_RegAPI          name '_SVM_REGAPI';
exports SVM_SetDbgCallBack  name '_SVM_DEBUGCALLBACK';
exports SVM_CheckErr        name '_SVM_CHECKERR';
exports SVM_Continue        name '_SVM_CONTINUE';
