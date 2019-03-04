unit u_prep_vardefs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_globalvars, u_variables, u_prep_global,
  u_prep_expressions, u_prep_array, u_prep_methods, u_global, u_classes;

function PreprocessVarDefine(s: string; varmgr: TVarManager; IsGlobal: boolean = false): string;
function PreprocessVarDefines(s: string; varmgr: TVarManager; IsGlobal: boolean = false): string;

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

function PreprocessVarDefine(s: string; varmgr: TVarManager; IsGlobal: boolean = false): string;
var
  v: string;
begin
  Result := '';
  s := Trim(s);

  if s = '' then
    exit;
  if pos('=', s) > 0 then
  begin
    v := Trim(copy(s, 1, pos('=', s) - 1));

    if IsGlobal then
     GlobalVars.Add(v);

    if v[1] = '.' then
     begin
       Delete(v, 1, 1);
       v := LocalVarPref + v;
     end
     else
     if not IsGlobal then
      v := LocalVarPref + v;

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
        Result := Result + sLineBreak + 'pushc ' + GetConst('!' + s, varmgr) + sLineBreak + 'gpm';

      if (ProcList.IndexOf(s) <> -1) or IsArr(s) then
        Result := Result + sLineBreak + 'jc'
      else
        Result := Result + sLineBreak + 'invoke';
    end
    else
    //Result := Result + sLineBreak + PushIt(s, varmgr);
    if IsVar(s, varmgr) then
      Result := PreprocessVarAction(s, 'push', varmgr)
    else
    if IsConst(s) then
      Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr)
    else
    if IsArr(s) then
      Result := PreprocessArrAction(s, 'pushai', varmgr)
    else
      Result := Result + sLineBreak + PushIt(s, varmgr, False);
    //PrpError('Invalid variable definition with = in "' + s + '".');
    if varmgr.DefinedVars.IndexOf(v) = -1 then
      varmgr.DefVar(v);
    Result := Result + sLineBreak + 'peek ' + GetVar('$' + v, varmgr, true) +
      sLineBreak + 'pop';
  end
  else
  begin
    //writeln(GetFullVarName(s));
    //VarDefs.Add(s);

    if IsGlobal then
     GlobalVars.Add(s);

    if s[1] = '.' then
     begin
       Delete(s, 1, 1);
       s := LocalVarPref + s;
     end
     else
     if not IsGlobal then
      s := LocalVarPref + s;

    varmgr.DefVar(s);
  end;
end;

function PreprocessVarDefines(s: string; varmgr: TVarManager; IsGlobal: boolean = false): string;
begin
  Result := '';
  while Length(s) > 0 do
    Result := Result + sLineBreak + PreprocessVarDefine(CutNextArg(s), varmgr, IsGlobal);
end;

end.
