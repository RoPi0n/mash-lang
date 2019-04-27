unit u_prep_c_loops;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_globalvars, u_variables, u_prep_global,
  u_prep_expressions, u_prep_codeblock, u_global;

function IsWhile(s: string): boolean;
function ParseWhile(s: string; varmgr: TVarManager): string;
function IsWhilst(s: string): boolean;
function ParseWhilst(s: string; varmgr: TVarManager): string;
function IsForEach(s: string): boolean;
function ParseForEach(s: string; varmgr: TVarManager): string;
function IsForBack(s: string): boolean;                       
function ParseForBack(s: string; varmgr: TVarManager): string;

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

function IsWhilst(s: string): boolean;
begin
  Result := False;
  if Length(s) > 6 then
    if copy(s, 1, 6) = 'whilst' then
    begin
      Delete(s, 1, 6);
      if Length(s) > 0 then
        Result := ((s[1] = ' ') or (s[1] = '(')) and (s[Length(s)] = ':');
    end;
end;

function ParseWhilst(s: string; varmgr: TVarManager): string;
var
  WhilstNum, ExprCode: string;
begin
  Delete(s, 1, 6);
  Delete(s, Length(s), 1);
  s := Trim(s);
  WhilstNum := '__gen_whilst_' + IntToStr(WhilstBlCounter);
  Inc(WhilstBlCounter);
  Result := WhilstNum + ':';
  if IsExpr(s) then
    ExprCode := PreprocessExpression(s, varmgr)
  else
    ExprCode := PushIt(s, varmgr);
  BlockStack.Add(TCodeBlock.Create(btWhilst, '', 'pushcp ' + WhilstNum +
    sLineBreak + ExprCode + sLineBreak + 'jn' +
    sLineBreak + 'pop' + sLineBreak + WhilstNum + '_end:', WhilstNum + '_end'));
end;

function IsForEach(s: string): boolean;
begin
  Result := False;
  if Length(s) > 3 then
    if copy(s, 1, 3) = 'for' then
    begin
      Delete(s, 1, 3);
      s := Trim(s);
      if Length(s) > 0 then
        Result := (Tk(s, 2) = 'in') and (s[Length(s)] = ':');
    end;
end;

function ParseForEach(s: string; varmgr: TVarManager): string;
var
  ForNum: string;
  LVar, RVar, LpCounter, LpDest: string;
begin
  Delete(s, 1, 3);
  Delete(s, Length(s), 1);
  s := Trim(s);
  LVar := Tk(s, 1);
  Delete(s, 1, pos(' in ', s) + 3);
  RVar := Trim(s);

  LpCounter := '__gen_for_each_' + IntToStr(ForBlCounter) + '_counter';
  LpDest := '__gen_for_each_' + IntToStr(ForBlCounter) + '_dest';
  ForNum := '__gen_for_each_' + IntToStr(ForBlCounter);
  Inc(ForBlCounter);

  Result := sLineBreak + PushIt(RVar, varmgr) + sLineBreak
                       + 'alen' + sLineBreak
                       + 'peek ' + GetVar(LpDest, varmgr) + sLineBreak
                       + 'pop' + sLineBreak
                       + 'pushc ' + GetConst('0', varmgr) + sLineBreak
                       + 'peek ' + GetVar(LpCounter, varmgr) + sLineBreak
                       + 'pop' + sLineBreak
                       + ForNum + ':' + sLineBreak
                       + 'pushcp ' + ForNum + '_for_end' + sLineBreak
                       + 'push ' + GetVar(LpCounter, varmgr) + sLineBreak
                       + 'push ' + GetVar(LpDest, varmgr) + sLineBreak
                       + 'bg' + sLineBreak
                       + 'gpm' + sLineBreak
                       + 'jz' + sLineBreak
                       + 'pop' + sLineBreak
                       + 'push ' + GetVar(LpCounter, varmgr) + sLineBreak
                       + PushIt(RVar, varmgr) + sLineBreak
                       + 'pushai' + sLineBreak
                       + 'peek ' + GetVar(LVar, varmgr) + sLineBreak;

  BlockStack.Add(TCodeBlock.Create(btFor, '',
                       sLineBreak + 'push ' + GetVar(LpCounter, varmgr) +
                       sLineBreak + 'inc' +
                       sLineBreak + 'pushcp ' + ForNum + sLineBreak + 'jp' +
                       sLineBreak + ForNum + '_for_end:' +
                       sLineBreak + 'push ' + GetVar(LpCounter, varmgr) +
                       sLineBreak + 'rem' +
                       sLineBreak + 'push ' + GetVar(LpDest, varmgr) +
                       sLineBreak + 'rem',

                       ForNum + '_for_end'));
end;

function IsForBack(s: string): boolean;
begin
  Result := False;
  if Length(s) > 3 then
    if copy(s, 1, 3) = 'for' then
    begin
      Delete(s, 1, 3);
      s := Trim(s);
      if Length(s) > 0 then
        Result := (Tk(s, 2) = 'back') and (s[Length(s)] = ':');
    end;
end;

function ParseForBack(s: string; varmgr: TVarManager): string;
var
  ForNum: string;
  LVar, RVar, LpCounter, LpDest: string;
begin
  Delete(s, 1, 3);
  Delete(s, Length(s), 1);
  s := Trim(s);
  LVar := Tk(s, 1);
  Delete(s, 1, pos(' back ', s) + 5);
  RVar := Trim(s);

  LpCounter := '__gen_for_back_' + IntToStr(ForBlCounter) + '_counter';
  LpDest := '__gen_for_back_' + IntToStr(ForBlCounter) + '_dest';
  ForNum := '__gen_for_back_' + IntToStr(ForBlCounter);
  Inc(ForBlCounter);

  Result := sLineBreak + PushIt(RVar, varmgr) + sLineBreak
                       + 'alen' + sLineBreak
                       + 'dec' + sLineBreak
                       + 'peek ' + GetVar(LpCounter, varmgr) + sLineBreak
                       + 'pop' + sLineBreak
                       + 'pushc ' + GetConst('0', varmgr) + sLineBreak
                       + 'peek ' + GetVar(LpDest, varmgr) + sLineBreak
                       + 'pop' + sLineBreak
                       + ForNum + ':' + sLineBreak
                       + 'pushcp ' + ForNum + '_for_end' + sLineBreak
                       + 'push ' + GetVar(LpDest, varmgr) + sLineBreak
                       + 'push ' + GetVar(LpCounter, varmgr) + sLineBreak
                       + 'be' + sLineBreak
                       + 'gpm' + sLineBreak
                       + 'jz' + sLineBreak
                       + 'pop' + sLineBreak
                       + 'push ' + GetVar(LpCounter, varmgr) + sLineBreak
                       + PushIt(RVar, varmgr) + sLineBreak
                       + 'pushai' + sLineBreak
                       + 'peek ' + GetVar(LVar, varmgr) + sLineBreak;

  BlockStack.Add(TCodeBlock.Create(btFor, '',
                       sLineBreak + 'push ' + GetVar(LpCounter, varmgr) +
                       sLineBreak + 'dec' +
                       sLineBreak + 'pushcp ' + ForNum + sLineBreak + 'jp' +
                       sLineBreak + ForNum + '_for_end:' +
                       sLineBreak + 'push ' + GetVar(LpCounter, varmgr) +
                       sLineBreak + 'rem' +
                       sLineBreak + 'push ' + GetVar(LpDest, varmgr) +
                       sLineBreak + 'rem',

                       ForNum + '_for_end'));
end;

end.
