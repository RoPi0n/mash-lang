unit u_prep_switch;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_globalvars, u_variables, u_prep_global,
  u_prep_expressions, u_prep_codeblock;

function IsSwitch(s: string): boolean;
function ParseSwitch(s: string; varmgr: TVarManager): string;
function IsCase(s: string): boolean;
function ParseCase(s: string; varmgr: TVarManager): string;

implementation

function IsSwitch(s: string): boolean;
begin
  Result := False;
  if Length(s) > 5 then
    if copy(s, 1, 6) = 'switch' then
    begin
      Delete(s, 1, 6);
      if Length(s) > 0 then
        Result := ((s[1] = ' ') or (s[1] = '(')) and (s[Length(s)] = ':');
    end;
end;

function ParseSwitch(s: string; varmgr: TVarManager): string;
var
  SwNum, ExprCode: string;
begin
  Delete(s, 1, 6);
  Delete(s, Length(s), 1);
  s := Trim(s);
  SwNum := '__gen_switch_' + IntToStr(SwBlCounter);
  Inc(SwBlCounter);
  if IsExpr(s) then
    ExprCode := PreprocessExpression(s, varmgr)
  else
    ExprCode := PushIt(s, varmgr);
  Result := SwNum + ':' + sLineBreak + ExprCode;
  BlockStack.Add(TCodeBlock.Create(btSwitch, '0', SwNum + '_end:' + sLineBreak + 'pop', SwNum + '_end'));
end;

function IsCase(s: string): boolean;
begin
  Result := False;
  if Length(s) > 3 then
    if copy(s, 1, 4) = 'case' then
    begin
      Delete(s, 1, 4);
      if Length(s) > 0 then
        Result := ((s[1] = ' ') or (s[1] = '(')) and (s[Length(s)] = ':');
    end;
end;

function ParseCase(s: string; varmgr: TVarManager): string;
var
  CsNum, ExprCode: string;
  CB: TCodeBlock;
begin
  if BlockStack.Count = 0 then
   PrpError('Error with switch-case. Using case without switch. Line: "'+s+'".');
  if TCodeBlock(BlockStack[BlockStack.Count - 1]).bType <> btSwitch then
   PrpError('Error with switch-case. Using case without switch. Line: "'+s+'".');

  Delete(s, 1, 4);
  Delete(s, Length(s), 1);
  s := Trim(s);
  CsNum := '__gen_case_' + IntToStr(CsBlCounter);
  Inc(CsBlCounter);
  if IsExpr(s) then
    ExprCode := PreprocessExpression(s, varmgr)
  else
    ExprCode := PushIt(s, varmgr);
  Result := CsNum + ':' + sLineBreak + 'pcopy' + sLineBreak + ExprCode + sLineBreak +
            'eq' + sLineBreak + 'pushc ' + CsNum + '_end' + sLineBreak + 'gpm' + sLineBreak +
            'swp' + sLineBreak + 'jz';

  CB := TCodeBlock(BlockStack[BlockStack.Count - 1]);
  if CB.bMeta = '0' then CB.bMeta := '1';
  BlockStack.Add(TCodeBlock.Create(btCase, '', CsNum + '_end:',
                 CB.bEndCode));
end;

end.

