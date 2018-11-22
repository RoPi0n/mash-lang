unit u_globalvars;

{$mode objfpc}{$H+}

interface

uses Classes, u_consts;

var
  {** Preprocessor **}
  IncludedFiles: TStringList;
  LocalVarPref: string = '';
  ProcEnterList, ImportsLst, ProcList: TStringList;
  Constants: TConstantManager;
  RTTI_Enable: boolean = true;
  ARGC_Enable: boolean = true;
  EnableOptimization: boolean = True;
  FastPrep_Defines: TStringList;

implementation

end.
