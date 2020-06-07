//{$Define BuildInLibrary}

{$ifdef BuildInLibrary}
  library svm;
{$else}
  program svm;
  //{$define BuildGUI}
{$endif}
{$inline on}
{$ifdef BuildGUI}
  {$apptype gui}
{$endif}

{$mode objfpc}

//{$Define DebugVer}

uses
  {$ifdef UNIX}
   cthreads,
  {$endif}
  {$ifdef Windows}
   windows,
  {$endif}
  SysUtils, Classes,
  svm_mem,
  svm_common,
  svm_utils,
  svm_callbacks,
  svm_stack,
  svm_exceptions,
  svm_core,
  svm_grabber,
  svm_threads;

{***** Main *******************************************************************}

//{$Define WindowsSEH}

{$IfDef BuildInLibrary}

{$I core_api.inc}
{$I libs_api.inc}

begin
end.

{$Else}

var
  vm:TSVM;
begin
  {$IfDef WindowsSEH}
    SVM_InitVEH;
  {$EndIf}
  InitSVMM;

  {$IfNDef BuildGUI}
  if ParamCount<1 then
   begin
     writeln('MASH!');
     writeln('Stack-based virtual machine.');
     writeln('Version: 1.9.4');
     writeln('Using: ',ExtractFileName(ParamStr(0)),' <svmexe file> [args]');
	 halt;
   end;
  {$EndIf}

  GrabbersStorage := TThreadList.Create;
  InitThreads;

  new(vm.bytes);
  new(vm.consts);
  new(vm.extern_methods);
  new(vm.mem);

  new(vm.local_mem);

  vm.isMainThread := true;
  vm.CustomArgsMode := false;
  vm.pVM_NULL := VM_NULL;

  vm.stack.init;
  vm.rstack.init;
  vm.cbstack.init;
  vm.LoadByteCodeFromFile(ParamStr(1));

  CheckHeader(vm.bytes);
  CutLeftBytes(vm.bytes,10);

  vm.extern_methods^.Parse(vm.bytes, vm.mainclasspath);
  vm.consts^.Parse(vm.bytes);

  vm.Run;

  Dispose(vm.consts);
  Dispose(vm.extern_methods);
  Dispose(vm.mem);
  Dispose(vm.local_mem);
  Dispose(vm.bytes);

  GlobalTerm;
  FreeThreads;
  FreeAndNil(GrabbersStorage);

  {$IfDef WindowsSEH}
    SVM_FreeVEH;
  {$EndIf}

  FreeSVMM;
end.
{$EndIf}
