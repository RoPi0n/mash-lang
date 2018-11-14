unit u_prep_vardefs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_globalvars, u_variables, u_prep_global,
  u_prep_expressions, u_prep_array, u_prep_methods, u_global, u_classes;

function PreprocessVarDefine(s: string; varmgr: TVarManager): string;
function PreprocessVarDefines(s: string; varmgr: TVarManager): string;

implementation

(* function PreprocessVarDefine(s: string; varmgr: TVarManager): string;
var
  v: string;
  init: boolean;
begin
  Result := '';
  init := false;
  s := Trim(s);
  v := Trim(GetNextExprToken(s));
  if Length(s) > Length(v) then
   init := true;
  if v[1] = '$' then
   Delete(v, 1, 1);
  if v[1] = '.' then
  begin
    Delete(v, 1, 1);
    v := LocalVarPref + v;
  end;

  if varmgr.DefinedVars.IndexOf(v) = -1 then
   varmgr.DefVar(v);

  if init then
   Result := PreprocessStr(s, varmgr);
end; *)

function PreprocessVarDefine(s: string; varmgr: TVarManager): string;
var
  v: string;
begin
  Result := '';
  s := Trim(s);
  if s[1] = '$' then
    Delete(s, 1, 1);
  if s[1] = '.' then
  begin
    Delete(s, 1, 1);
    s := LocalVarPref + s;
  end;
  if s = '' then
    exit;
  if pos('=', s) > 0 then
  begin
    v := Trim(copy(s, 1, pos('=', s) - 1));
    //VarDefs.Add(v);
    Delete(s, 1, pos('=', s));
    s := Trim(s);
    if IsOpNew(s) then
      Result := Result + sLineBreak + PreprocessOpNew(s, varmgr)
    else
    if IsExpr(s) then
      Result := Result + sLineBreak + PreprocessExpression(s, varmgr)
    else
    if (Length(GetProcName(s)) > 0) and (CheckName(GetProcName(s)) or IsArr(s)) then
    begin
      if pos('(', s) > 0 then
      begin
        Result := PreprocessCall(s, varmgr);
        s := Trim(GetProcName(s));
        if IsClassProcCallingAddr(s) then
          Result := Result + sLineBreak + PushIt(GetClassProcCallingContext(s), varmgr);
      end;

      if IsArr(s) then
        Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
      else
        Result := Result + sLineBreak + 'pushc ' + GetConst('!' + s) + sLineBreak + 'gpm';

      if (ProcList.IndexOf(s) <> -1) or IsArr(s) then
        Result := Result + sLineBreak + 'jc' + sLineBreak
      else
        Result := Result + sLineBreak + 'invoke' + sLineBreak;
    end
    else
    //Result := Result + sLineBreak + PushIt(s, varmgr);
    if IsVar(s, varmgr) then
      Result := PreprocessVarAction(s, 'push', varmgr)
    else
    if IsConst(s) then
      Result := Result + sLineBreak + 'pushc ' + GetConst(s)
    else
    if IsArr(s) then
      Result := PreprocessArrAction(s, 'pushai', varmgr)
    else
      Result := Result + sLineBreak + PushIt(s, varmgr);
    //PrpError('Invalid variable definition with = in "' + s + '".');
    if varmgr.DefinedVars.IndexOf(v) = -1 then
      varmgr.DefVar(v);
    Result := Result + sLineBreak + 'peek ' + GetVar('$' + v, varmgr) +
      sLineBreak + 'pop';
  end
  else
  begin
    //writeln(GetFullVarName(s));
    //VarDefs.Add(s);
    varmgr.DefVar(s);
  end;
end;

function PreprocessVarDefines(s: string; varmgr: TVarManager): string;
begin
  Result := '';
  while Length(s) > 0 do
    Result := Result + sLineBreak + PreprocessVarDefine(CutNextArg(s), varmgr);
end;

end.
