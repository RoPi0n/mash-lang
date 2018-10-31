unit u_classes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_variables;

const
  ClassChildPref = '__class__child_';

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
    AllocSize: cardinal;
    CName: string;
    VarDefs: TList;
    Methods, Constructors, Destructors: TStringList;
    Table: TStringList;
    function GenAllocator(varmgr: TVarManager): string;
    constructor Create(Name: string);
    destructor Destroy; override;
    procedure FillTable;
  end;

function PreprocessClassCalls(s: string): string;

implementation

uses
  u_prep_expressions;

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
  Table := TStringList.Create;
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
  FreeAndNil(Table);
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

function TMashClass.GenAllocator(varmgr: TVarManager): string;
var
  allcname: string;
begin
  allcname := '__class_' + CName + '_allocator';
  Result := allcname + ':' + sLineBreak + PushIt(IntToStr(AllocSize), varmgr) +
    sLineBreak + PushIt('1', varmgr) + sLineBreak + 'newa' + sLineBreak +
    '__gen_' + allcname + '_method_end:' + sLineBreak + 'jr';
end;

function PreprocessClassCalls(s: string): string;
const
  alpha: set of char = ['A'..'Z', 'a'..'z', '_'];
var
  ConstStr: boolean;
  EnableEnding: boolean;
begin
  s := Trim(s);
  ConstStr := False;
  EnableEnding := False;
  Result := '';
  while Length(s) > 0 do
  begin
    if s[1] = '"' then
      ConstStr := not ConstStr;
    if ConstStr then
    begin
      Result := Result + s[1];
      Delete(s, 1, 1);
    end
    else
    begin
      if copy(s, 1, 2) = '->' then
      begin
        Delete(s, 1, 2);
        Result := Result + '[' + ClassChildPref;
        while Length(s) > 0 do
        begin
          if s[1] in alpha then
            Result := Result + s[1]
          else
          begin
            Result := Result + ']';
            break;
          end;
          Delete(s, 1, 1);
        end;
      end
      else
      begin
        Result := Result + s[1];
        Delete(s, 1, 1);
      end;
    end;
  end;
end;

end.
