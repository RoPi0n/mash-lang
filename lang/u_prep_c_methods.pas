unit u_prep_c_methods;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global, u_variables, u_globalvars, u_prep_global,
  u_prep_codeblock, u_prep_methods,
  u_prep_expressions;

function IsProc(s: string): boolean;
function PreprocessProc(s: string; varmgr: TVarManager): string;

implementation

function IsProc(s: string): boolean;
begin
  Result := False;
  s := Trim(s);
  if Length(s) > 5 then
    if ((Copy(s, 1, 4) = 'proc') or (Copy(s, 1, 4) = 'func')) and
      (s[length(s)] = ':') then
    begin
      Delete(s, 1, 4);
      Delete(s, length(s), 1);
      s := Trim(s);
      if (Pos('(', s) > 0) and (Pos(')', s) > 0) then
        if CheckName(Copy(s, 1, Pos('(', s) - 1)) then
          Result := True;
    end;
end;

function PreprocessProc(s: string; varmgr: TVarManager): string;
var
  bf, pn: string;
  CB: TCodeBlock;
begin
  s := Trim(s);
  bf := Copy(s, 1, 4);
  Delete(s, 1, 4);
  s := Trim(s);
  if s[Length(s)] = ':' then
    Delete(s, length(s), 1);
  pn := GetProcName(Trim(s));
  if bf = 'proc' then
    CB := TCodeBlock.Create(btProc, '', '', '__gen_' + pn + '_method_end')
  else
    CB := TCodeBlock.Create(btFunc, '', '-', '__gen_' + pn + '_method_end');
  BlockStack.Add(CB);
  CB.mName := pn;
  Result := pn + ':';
  ProcEnterList.Add(pn);
  LocalVarPref := LocalVarPref + pn + '.';
  Delete(s, 1, pos('(', s));
  Delete(s, pos(')', s), length(s));
  while length(s) > 0 do
  begin
    if pos(',', s) > 0 then
    begin
      s := Trim(s);
      bf := Copy(s, 1, pos(',', s) - 1);
      Delete(s, 1, pos(',', s));
    end
    else
    begin
      bf := Trim(s);
      s := '';
    end;
    if IsVar(bf, varmgr) then
    begin
      if bf[1] = '$' then
        Delete(bf, 1, 1);
      if bf[1] <> '.' then
        AsmWarn('Receiving control of global variable "' + bf +
          '" in proc "' + pn + '".');
      if varmgr.DefinedVars.IndexOf(bf) = -1 then
      begin
        if bf[1] <> '.' then
        begin
          Delete(bf, 1, 1);
          varmgr.DefVar(bf);
          //bf := '$' + bf;
        end
        else
        begin
          Delete(bf, 1, 1);
          varmgr.DefVar(LocalVarPref + bf);
          bf := {'$' + }LocalVarPref + bf;
        end;
      end;
      Result := Result + sLineBreak + PreprocessVarAction(bf, 'peek', varmgr) +
        sLineBreak + 'pop';
    end
    else
      PrpError('Invalid proc "' + pn + '" define.');
  end;
end;

end.
