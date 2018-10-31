unit u_classes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TMashClassVariableDefine = class(TObject)
  public
    ClassVarName: string;
    Initialized: boolean;
    InitCode: string;
    constructor Create(VName: string; Init: boolean; InitStr: string);
  end;

  TMashClass = class(TObject)
  public
    CName: string;
    VarDefs: TList;
    Methods, Constructors, Destructors: TStringList;
    Table: TStringList;
    constructor Create(Name: string);
    destructor Destroy; override;
    procedure FillTable;
  end;

implementation

{*** Class variable ***}

constructor TMashClassVariableDefine.Create(VName: string; Init: boolean;
  InitStr: string);
begin
  ClassVarName := VName;
  Initialized := Init;
  InitCode := InitStr;
  inherited Create;
end;

{*** Class ***}

constructor TMashClass.Create(Name: string);
begin
  inherited Create;
  CName := Name;
  VarDefs := TList.Create;
  Methods := TStringList.Create;
  Constructors := TStringList.Create;
  Destructors := TStringList.Create;
end;

destructor TMashClass.Destroy;
begin
  while VarDefs.Count > 0 do
  begin
    TMashClassVariableDefine(VarDefs[0]).Free;
    VarDefs.Delete(0);
  end;
  FreeAndNil(VarDefs);
  FreeAndNil(Methods);
  FreeAndNil(Constructors);
  FreeAndNil(Destructors);
  inherited Destroy;
end;

procedure TMashClass.FillTable;
var
  c: cardinal;
begin
  c := 0;
  while c < VarDefs.Count do
  begin
    Table.Add(TMashClassVariableDefine(VarDefs[c]).ClassVarName);
    Inc(c);
  end;
end;

end.
