unit u_prep_c_try;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global, u_globalvars, u_variables, u_prep_global,
  u_prep_expressions,
  u_prep_codeblock;

function IsTry(s: string): boolean;
function GenTry: string;
function IsCatch(s: string): boolean;
function GenCatch(s: string; varmgr: TVarManager): string;
function IsFinally(s: string): boolean;
function GenFinally: string;
function GenRaise(s: string; varmgr: TVarManager): string;

implementation

function IsTry(s: string): boolean;
begin
  Result := False;
  if Length(s) > 0 then
    if s[length(s)] = ':' then
    begin
      Delete(s, Length(s), 1);
      s := Trim(s);
      Result := s = 'try';
    end;
end;

function GenTry: string;
var
  TryNum: string;
begin
  TryNum := '__gen_try' + IntToStr(TryBlCounter);
  Inc(TryBlCounter);
  Result := 'pushcp ' + TryNum + '_finally' +
    sLineBreak + 'pushcp ' + TryNum + '_catch' +
    sLineBreak + 'tr';
  BlockStack.Add(TCodeBlock.Create(btTry, '-', 'trs' + sLineBreak +
    TryNum + '_catch:' + sLineBreak + 'gpm', TryNum + '_finally'));
end;

function IsCatch(s: string): boolean;
begin
  Result := False;
  if Length(s) > 0 then
    if s[length(s)] = ':' then
    begin
      Delete(s, Length(s), 1);
      s := Trim(s);
      Result := Copy(s, 1, 6) = 'catch ';
    end;
end;

function GenCatch(s: string; varmgr: TVarManager): string;
var
  CB: TCodeBlock;
begin
  s := Trim(s);
  Delete(s, length(s), 1);
  Delete(s, 1, 6);
  s := Trim(s);
  Result := '';
  if BlockStack.Count > 0 then
  begin
    CB := TCodeBlock(BlockStack[BlockStack.Count - 1]);
    if CB.bType = btTry then
    begin
      Result := CB.bMCode
                + sLineBreak + 'peek ' + GetVar(s, varmgr)
                + sLineBreak + 'pop' + sLineBreak;
      CB.bMeta := 'c';
    end
    else
      PrpError('Using operator "catch" outside critical code block.');
  end
  else
    PrpError('Using operator "catch" outside critical code block.');
end;

function IsFinally(s: string): boolean;
begin
  Result := False;
  if Length(s) > 0 then
    if s[length(s)] = ':' then
    begin
      Delete(s, Length(s), 1);
      s := Trim(s);
      Result := s = 'finally';
    end;
end;

function GenFinally: string;
var
  CB: TCodeBlock;
begin
  Result := '';
  if BlockStack.Count > 0 then
  begin
    CB := TCodeBlock(BlockStack[BlockStack.Count - 1]);
    if CB.bType = btTry then
    begin
      if CB.bMeta = '-' then
        Result := CB.bMCode + sLineBreak + 'pop';
      Result := Result + sLineBreak + CB.bEndCode + ':';
      CB.bMeta := 'f';
    end
    else
      PrpError('Using operator "finally" outside critical code block.');
  end
  else
    PrpError('Using operator "finally" outside critical code block.');
end;

function GenRaise(s: string; varmgr: TVarManager): string;
begin
  if IsExpr(s) then
    Result := PreprocessExpression(s, varmgr)
  else
    Result := PushIt(s, varmgr);
  Result := Result + sLineBreak + 'trr';
end;

end.
