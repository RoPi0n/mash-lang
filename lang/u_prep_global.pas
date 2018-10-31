unit u_prep_global;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global, u_globalvars, u_variables, u_consts,
  u_prep_codeblock, u_classes, u_writers;

function IsWord(var s: string): boolean;
function IsInt(s: string): boolean;
function IsFloat(s: string): boolean;
function IsStr(s: string): boolean;
function IsConst(var s: string): boolean;
function GetConst(s: string): string;
function TkPos(tk, s: string): cardinal;
procedure PrpError(m: string);
procedure PrpWarn(m: string);
function IsVar(s: string; varmgr: TVarManager): boolean;
function GetVar(s: string; varmgr: TVarManager): string;
function PreprocessVarAction(varexpr, action: string; varmgr: TVarManager): string;
function GetFullVarName(s: string): string;
function GetCurrentMethodName: string;
function CutNextArg(var s: string): string;
function GetArrName(s: string): string;
function IsClass(s: string): boolean;
function FindClassRec(s: string): TMashClass;

var
  IfBlCounter: cardinal = 0;
  ForBlCounter: cardinal = 0;
  WhileBlCounter: cardinal = 0;
  UntilBlCounter: cardinal = 0;
  TryBlCounter: cardinal = 0;
  BlockStack: TList;
  ConstDefs: TStringList;
  //VarDefs: TStringList;
  ClassStack: TList;
  ClassTable: TStringList;
  CntConstAutoDefs: cardinal = 0;
  InitCode: TStringList;

const
  AutoDefConstPref = '__defc_gen_';
  AutoDefConstSuffx = '_n';


implementation

function TkPos(tk, s: string): cardinal;
var
  R: cardinal;
begin
  Result := 0;
  R := 0;
  while Length(s) > 0 do
  begin
    if s[1] = '"' then
    begin
      Delete(s, 1, 1);
      Inc(R, Pos('"', s) + 1);
      Delete(s, 1, pos('"', s));
    end;
    if pos(tk, s) = 1 then
    begin
      Inc(R);
      Result := R;
      break;
    end;
    Delete(s, 1, 1);
    Inc(R);
  end;
end;

procedure PrpError(m: string);
begin
  writeln('[!] Error: ', m);
  writeln('    - In -> (method) "' + GetCurrentMethodName + '".');
  halt;
end;

procedure PrpWarn(m: string);
begin
  writeln('[!] Warning: ', m);
  writeln('    - In -> (method) "' + GetCurrentMethodName + '".');
end;

function IsVar(s: string; varmgr: TVarManager): boolean;
begin
  Result := False;
  if length(s) > 0 then
  begin
    if s[1] = '$' then
      Delete(s, 1, 1);

    if s[1] = '.' then
    begin
      Delete(s, 1, 1);
      s := LocalVarPref + s;
    end;
    Result := (CheckName(s) or (varmgr.DefinedVars.IndexOf(s) <> -1)) and
      (ConstDefs.IndexOf(s) = -1);
  end;
end;

function GetVar(s: string; varmgr: TVarManager): string;
begin
  if s[1] = '$' then
    Delete(s, 1, 1);

  if s[1] = '.' then
  begin
    Delete(s, 1, 1);
    s := {'$' + }LocalVarPref + s;
  end;

  if IsVar(s, varmgr) then
  begin
    Result := IntToStr(varmgr.Get(s));
  end
  else
    PrpError('Invalid variable call "' + s + '".');
end;

function PreprocessVarAction(varexpr, action: string; varmgr: TVarManager): string;
begin
  Result := action + ' ' + GetVar(varexpr, varmgr);
end;

function GetFullVarName(s: string): string;
begin
  if copy(s, 1, 1) = '$' then
    Delete(s, 1, 1);
  if copy(s, 1, 1) = '.' then
  begin
    Delete(s, 1, 1);
    s := LocalVarPref + s;
  end;
  Result := s;
end;

function GetCurrentMethodName: string;
var
  CB: TCodeBlock;
  i: integer;
begin
  i := 1;
  Result := 'global code';
  if BlockStack.Count > 0 then
    repeat
      CB := TCodeBlock(BlockStack[BlockStack.Count - i]);
      if CB.bType in [btFunc, btProc] then
      begin
        Result := CB.mName;
        break;
      end;
      Inc(i);
    until BlockStack.Count - i = 0;
end;

function CutNextArg(var s: string): string;
var
  in_str: boolean;
  in_br, in_rbr: integer;
begin
  Result := '';
  in_str := False;
  in_br := 0;
  in_rbr := 0;
  while Length(s) > 0 do
  begin
    if s[1] = '"' then
      in_str := not in_str;

    if not in_str then
    begin
      if s[1] = '(' then
        Inc(in_br);
      if s[1] = ')' then
        Dec(in_br);
      if s[1] = '[' then
        Inc(in_rbr);
      if s[1] = ']' then
        Dec(in_rbr);
    end;

    if (not in_str) and (in_br <= 0) and (in_rbr <= 0) then
    begin
      if s[1] = ',' then
      begin
        Delete(s, 1, 1);
        break;
      end;
    end;

    Result := Result + s[1];
    Delete(s, 1, 1);
  end;
end;

function GetArrName(s: string): string;
begin
  Result := copy(s, 1, pos('[', s) - 1);
end;

function IsClass(s: string): boolean;
var
  c: cardinal;
begin
  Result := False;
  c := 0;
  s := Trim(s);
  while c < ClassStack.Count do
  begin
    if TMashClass(ClassStack[c]).CName = s then
    begin
      Result := True;
      break;
    end;
    Inc(c);
  end;
end;

function FindClassRec(s: string): TMashClass;
var
  c: cardinal;
begin
  Result := nil;
  s := Trim(s);
  c := 0;
  while c < ClassStack.Count do
  begin
    if TMashClass(ClassStack[c]).CName = s then
    begin
      Result := TMashClass(ClassStack[c]);
      break;
    end;
    Inc(c);
  end;
  if Result = nil then
    PrpError('Invalid class allocation. Class "' + s + '" doesn''t exist.');
end;

function IsWord(var s: string): boolean;
var
  w: word;
begin
  Result := Length(s) > 0;
  w := 1;
  if Length(s) > 2 then
  begin
    if (s[1] = '0') and (s[2] = 'x') then
    begin
      Delete(s, 1, 2);
      while w <= Length(s) do
      begin
        Result := Result and (s[w] in ['0'..'9', 'a'..'f']);
        Inc(w);
      end;
      s := '$' + s;
    end
    else
      while w <= Length(s) do
      begin
        Result := Result and (s[w] in ['0'..'9']);
        Inc(w);
      end;
  end
  else
    while w <= Length(s) do
    begin
      Result := Result and (s[w] in ['0'..'9']);
      Inc(w);
    end;
end;

function IsInt(s: string): boolean;
var
  w: word;
  mchk: boolean;
begin
  Result := Length(s) > 0;
  w := 1;
  mchk := True;
  while w <= Length(s) do
  begin
    if (s[w] = '-') and (w > 1) then
      mchk := False;
    Result := Result and (mchk) and (s[w] in ['0'..'9', '-']);
    Inc(w);
  end;
end;

function IsFloat(s: string): boolean;
var
  w, dcnt: word;
  mchk: boolean;
begin
  Result := Length(s) > 0;
  w := 1;
  dcnt := 0;
  mchk := True;
  while w <= Length(s) do
  begin
    if (s[w] = '-') and (w > 1) then
      mchk := False;
    if s[w] = '.' then
      Inc(dcnt);
    Result := Result and (dcnt <= 1) and (mchk) and (s[w] in ['0'..'9', '.', '-']);
    Inc(w);
  end;
end;

function IsStr(s: string): boolean;
begin
  Result := Length(s) > 0;
  Result := Result and (s[1] = '"') and (s[length(s)] = '"');
  Delete(s, 1, 1);
  Delete(s, length(s), 1);
  Result := Result and (pos('"', s) = 0);
end;

function IsConst(var s: string): boolean;
var
  Cnt: TConstant;
  s1: string;
  c: cardinal;
  i: int64;
  d: double;
begin
  s1 := s;
  Result := False;
  if length(s1) > 0 then
  begin
    if ConstDefs.IndexOf(s1) <> -1 then
      Result := True
    else
    if s1[1] = '!' then
    begin
      Delete(s1, 1, 1);
      Result := CheckName(s1);
    end
    else
    if IsWord(s) then
    begin
      c := StrToInt(s);
      s := AutoDefConstPref + 'word' + AutoDefConstSuffx + IntToStr(CntConstAutoDefs);
      Cnt := TConstant.Create;
      Cnt.c_names.Add(s);
      Cnt.c_type := ctUnsigned64;
      St_WriteCardinal(Cnt.c_value, c);
      Constants.Add(Cnt);
      s := '!' + s;
      Result := True;
      Inc(CntConstAutoDefs);
    end
    else
    if IsInt(s) then
    begin
      i := StrToInt(s);
      s := AutoDefConstPref + 'int' + AutoDefConstSuffx + IntToStr(CntConstAutoDefs);
      Cnt := TConstant.Create;
      Cnt.c_names.Add(s);
      Cnt.c_type := ctInt64;
      St_WriteInt64(Cnt.c_value, i);
      Constants.Add(Cnt);
      s := '!' + s;
      Result := True;
      Inc(CntConstAutoDefs);
    end
    else
    if IsFloat(s) then
    begin
      d := StrToFloat(s);
      s := AutoDefConstPref + 'real' + AutoDefConstSuffx + IntToStr(CntConstAutoDefs);
      Cnt := TConstant.Create;
      Cnt.c_names.Add(s);
      Cnt.c_type := ctDouble;
      St_WriteDouble(Cnt.c_value, d);
      Constants.Add(Cnt);
      s := '!' + s;
      Result := True;
      Inc(CntConstAutoDefs);
    end
    else
    if IsStr(s) then
    begin
      s1 := s;
      Delete(s1, 1, 1);
      Delete(s1, Length(s1), 1);
      s := AutoDefConstPref + 'str' + AutoDefConstSuffx + IntToStr(CntConstAutoDefs);
      Cnt := TConstant.Create;
      Cnt.c_names.Add(s);
      Cnt.c_type := ctString;
      Cnt.c_value.Write(s1[1], length(s1));
      Constants.Add(Cnt);
      s := '!' + s;
      Result := True;
      Inc(CntConstAutoDefs);
    end;
  end;
end;

function GetConst(s: string): string;
begin
  Result := s;
  if IsConst(s) then
  begin
    if s[1] = '!' then
      Delete(s, 1, 1);
    Result := s;
  end
  else
    PrpError('Invalid constant call "' + s + '".');
end;

end.


