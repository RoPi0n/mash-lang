unit u_prep_c_ifelse;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_variables, u_prep_global, u_prep_expressions,
  u_prep_codeblock;

function IsIf(s: string): boolean;
function ParseIf(s: string; varmgr: TVarManager): string;
function IsElse(s: string): boolean;
function GenElse: string;

implementation

function IsIf(s: string): boolean;
begin
  Result := False;
  if Length(s) > 2 then
    if s[1] + s[2] = 'if' then
    begin
      Delete(s, 1, 2);
      if Length(s) > 0 then
        Result := ((s[1] = ' ') or (s[1] = '(')) and (s[Length(s)] = ':');
    end;
end;

function ParseIf(s: string; varmgr: TVarManager): string;
var
  IfNum, ExprCode: string;
begin
  Delete(s, 1, 2);
  Delete(s, Length(s), 1);
  s := Trim(s);
  IfNum := '__gen_if_' + IntToStr(IfBlCounter);
  Inc(IfBlCounter);
  if IsExpr(s) then
    ExprCode := PreprocessExpression(s, varmgr)
  else
    ExprCode := PushIt(s, varmgr);
  Result := 'pushcp ' + IfNum + '_end' + sLineBreak +
    ExprCode + sLineBreak + 'jz' + sLineBreak + 'pop';
  BlockStack.Add(TCodeBlock.Create(btIf, '-', IfNum + '_else_end', IfNum + '_end'));
end;

function IsElse(s: string): boolean;
begin
  Result := False;
  if Length(s) > 4 then
    if copy(s, 1, 4) = 'else' then
    begin
      Delete(s, 1, 4);
      s := Trim(s);
      Result := s = ':';
    end;
end;

function GenElse: string;
var
  CB: TCodeBlock;
begin
  Result := '';
  if BlockStack.Count > 0 then
  begin
    CB := TCodeBlock(BlockStack[BlockStack.Count - 1]);
    if CB.bType = btIf then
    begin
      if CB.bMeta = '+' then
        PrpError('Using operator "else" more than once for one construction "if".');
      Result := 'pushcp ' + CB.bMCode + sLineBreak +
        'jp' + sLineBreak + CB.bEndCode + ':';
      CB.bMeta := '+';
    end
    else
    if CB.bType = btSwitch then
    begin
      if CB.bMeta = '2' then
       PrpError('Add two or more else''s in switch construction.');
      CB.bMeta := '2';
    end
    else
      PrpError('Using operator "else" without "if".');
  end
  else
    PrpError('Using operator "else" without "if".');
end;

end.

