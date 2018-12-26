unit u_prep_c_loops;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_globalvars, u_variables, u_prep_global,
  u_prep_expressions,
  u_prep_codeblock;

function IsWhile(s: string): boolean;
function ParseWhile(s: string; varmgr: TVarManager): string;
function IsUntil(s: string): boolean;
function ParseUntil(s: string; varmgr: TVarManager): string;

implementation

function IsWhile(s: string): boolean;
begin
  Result := False;
  if Length(s) > 5 then
    if copy(s, 1, 5) = 'while' then
    begin
      Delete(s, 1, 5);
      if Length(s) > 0 then
        Result := ((s[1] = ' ') or (s[1] = '(')) and (s[Length(s)] = ':');
    end;
end;

function ParseWhile(s: string; varmgr: TVarManager): string;
var
  WhileNum, ExprCode: string;
begin
  Delete(s, 1, 5);
  Delete(s, Length(s), 1);
  s := Trim(s);
  WhileNum := '__gen_while_' + IntToStr(WhileBlCounter);
  Inc(WhileBlCounter);
  if IsExpr(s) then
    ExprCode := PreprocessExpression(s, varmgr)
  else
    ExprCode := PushIt(s, varmgr);
  Result := WhileNum + ':' + sLineBreak + 'pushcp ' + WhileNum + '_end' +
    sLineBreak + ExprCode + sLineBreak + 'jz' +
    sLineBreak + 'pop';
  BlockStack.Add(TCodeBlock.Create(btWhile, '', 'pushcp ' + WhileNum +
    sLineBreak + 'jp' + sLineBreak + WhileNum +
    '_end:', WhileNum + '_end'));
end;

function IsUntil(s: string): boolean;
begin
  Result := False;
  if Length(s) > 5 then
    if copy(s, 1, 5) = 'until' then
    begin
      Delete(s, 1, 5);
      if Length(s) > 0 then
        Result := ((s[1] = ' ') or (s[1] = '(')) and (s[Length(s)] = ':');
    end;
end;

function ParseUntil(s: string; varmgr: TVarManager): string;
var
  UntilNum, ExprCode: string;
begin
  Delete(s, 1, 5);
  Delete(s, Length(s), 1);
  s := Trim(s);
  UntilNum := '__gen_until_' + IntToStr(UntilBlCounter);
  Inc(UntilBlCounter);
  Result := UntilNum + ':';
  if IsExpr(s) then
    ExprCode := PreprocessExpression(s, varmgr)
  else
    ExprCode := PushIt(s, varmgr);
  BlockStack.Add(TCodeBlock.Create(btUntil, '', 'pushcp ' + UntilNum +
    sLineBreak + ExprCode + sLineBreak + 'jz' +
    sLineBreak + 'pop' + sLineBreak + UntilNum + '_end:', UntilNum + '_end'));
end;

end.
