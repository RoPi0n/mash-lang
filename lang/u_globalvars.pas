unit u_globalvars;

{$mode objfpc}{$H+}

interface

uses Classes, u_consts;

type
  TSVMAppMode = (amBin, amConsole, amGUI);

var
  {** Preprocessor **}
  IncludedFiles: TStringList;
  LocalVarPref: string = '';
  ProcEnterList, ImportsLst, ProcList: TStringList;
  Constants: TConstantManager;
  RTTI_Enable: boolean = true;
  ARGC_Enable: boolean = true;
  EnableOptimization: boolean = true;
  OptimizationLvl: cardinal = 0;
  Debug_Enable: boolean = false;
  Debug_InfoGen: boolean = false;
  FastPrep_Defines: TStringList;
  AppMode: TSVMAppMode = amConsole;
  Hints_Enable: boolean = false;
  NeverUsedClasses: TStringList;

  Current_CodeLine: cardinal = 1;
  Current_CodeFile: string = '';

implementation

end.
