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

implementation

end.
