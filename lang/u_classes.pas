unit u_classes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_variables, u_global, u_globalvars;

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
    Methods, MethodsLinks, Constructors, Destructors: TStringList;
    Table: TStringList;
    constructor Create(Name: string);
    destructor Destroy; override;
    procedure FillTable;
  end;

function PreprocessClassCalls(s: string): string;
function IsClassProcCallingAddr(s: string): boolean;
function GetClassProcCallingContext(s: string): string;

implementation

uses
  u_prep_expressions, u_prep_array, u_prep_global;

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
  MethodsLinks := TStringList.Create;
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
  FreeAndNil(MethodsLinks);
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

  c := 0;
  while c < Methods.Count do
  begin
    Table.Add(Methods[c]);
    Inc(c);
  end;
end;

function PreprocessClassCalls(s: string): string;
{
  classname->childval  =  classname[genprefix_childvar]
  $childvar  =  .this->childvar  =  .this[genprefix_childvar]
  variable = class::method  =  variable = class_method
}
const
  alpha: set of char = ['A'..'Z', 'a'..'z', '0'..'9', '_', '.'];
var
  ConstStr: boolean;
  BraceOpenned: boolean;
  ChrCounter: cardinal;
  IsClassMethod: boolean;
begin
  ChrCounter := 0;
  IsClassMethod := False;
  s := Trim(s);
  ConstStr := False;
  BraceOpenned := False;
  Result := '';
  while Length(s) > 0 do
  begin
    if s[1] = '"' then
      ConstStr := not ConstStr;

    if ((copy(s, 1, 5) = 'proc ') or (copy(s, 1, 5) = 'func ')) and
      (ChrCounter = 0) then
      IsClassMethod := True;


    if ConstStr then
    begin
      Result := Result + s[1];
      Delete(s, 1, 1);
      Inc(ChrCounter);
    end
    else
    begin
      if copy(s, 1, 2) = '->' then
      begin
        Delete(s, 1, 2);
        Inc(ChrCounter, 2);
        Result := Trim(Result);
        s := Trim(s);
        Result := Result + '[' + ClassChildPref;
        BraceOpenned := True;
        while Length(s) > 0 do
        begin
          if s[1] in alpha then
            Result := Result + s[1]
          else
          begin
            Result := Result + ']';
            BraceOpenned := False;
            break;
          end;
          Delete(s, 1, 1);
          Inc(ChrCounter);
        end;
        if BraceOpenned then
        begin
          Result := Result + ']';
          BraceOpenned := False;
        end;
      end
      else
      if copy(s, 1, 1) = '$' then
      begin
        Delete(s, 1, 1);
        Inc(ChrCounter);
        s := Trim(s);
        if (copy(s, 1, 1)[1] in ['[', ']', '(', ')']) or (copy(s, 1, 2) = '->') then
          Result := Result + '.this'
        else
        begin
          Result := Result + '.this[' + ClassChildPref;
          BraceOpenned := True;
          while Length(s) > 0 do
          begin
            if s[1] in alpha then
              Result := Result + s[1]
            else
            begin
              Result := Result + ']';
              BraceOpenned := False;
              break;
            end;
            Delete(s, 1, 1);
            Inc(ChrCounter);
          end;
          if BraceOpenned then
          begin
            Result := Result + ']';
            BraceOpenned := False;
          end;
        end;
      end
      else
      if (copy(s, 1, 2) = '::') and (not IsClassMethod) then
      begin
        Delete(s, 1, 2);
        Inc(ChrCounter, 2);
        Result := Trim(Result);
        s := Trim(s);
        Result := Result + '__';
      end
      else
      begin
        Result := Result + s[1];
        Delete(s, 1, 1);
        Inc(ChrCounter);
      end;
    end;
  end;
end;

function IsClassProcCallingAddr(s: string): boolean;
begin
  Result := False;
  s := Trim(s);
  if IsArr(s) then
    Result := Pos(ClassChildPref, GetArrLvlVal(s, GetArrLvl(s))) > 0;
end;

function GetClassProcCallingContext(s: string): string;
var
  calling_lvl, c: cardinal;
begin
  s := Trim(s);
  Result := s;
  if IsArr(s) then
  begin
    calling_lvl := GetArrLvl(s);
    Result := GetArrName(s);
    c := 1;
    while c < calling_lvl do
    begin
      Result := Result + '[' + GetArrLvlVal(s, c) + ']';
      Inc(c);
    end;
  end;
end;

end.
