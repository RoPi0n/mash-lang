unit u_prep_expressions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StrUtils, u_variables, u_global, u_globalvars, u_prep_global,
  u_prep_methods, u_prep_array, u_prep_enums, u_classes;

function IsExpr(s: string): boolean;
function CutNextExprToken(var s: string): string;
function GetNextExprToken(s: string): string;
function CutNextExprOp(var s: string): string;
function GetNextExprOp(s: string): string;
function CutExprInBraces(var s: string): string;
function BracesDelt(s: string): integer;
function GetExprInBraces(s: string): string;
function PreprocessExpression(s: string; varmgr: TVarManager): string;
function IsEqExpr(s: string; varmgr: TVarManager): boolean;
function ParseEqExpr(s: string; varmgr: TVarManager): string;
function PushIt(s: string; varmgr: TVarManager; PushTemporary: boolean = True): string;
function TempPushIt(s: string; varmgr: TVarManager): string;
function IsOpNew(s: string): boolean;
function PreprocessOpNew(s: string; varmgr: TVarManager): string;
function PreprocessCall(s: string; varmgr: TVarManager; SwapMode:boolean = false): string;
function PreprocessArrAction(arrexpr, action: string; varmgr: TVarManager): string;

implementation

function PreprocessCall(s: string; varmgr: TVarManager; SwapMode:boolean = false): string;
var
  bf, pn: string;
  sl: TStringList;
  argc: cardinal;
begin
  Result := '';
  s := Trim(s);
  pn := GetProcName(s);
  s := Trim(s);
  Delete(s, 1, Length(pn) + 1);
  Delete(s, Length(s), 1);

  sl := TStringList.Create;
  while length(s) > 0 do
  begin
    sl.Add(Trim(CutNextArg(s)));
    s := Trim(s);
  end;

  argc := sl.Count;

  while sl.Count > 0 do
  begin
    Bf := sl[sl.Count - 1];
    if IsOpNew(s) then
      Result := Result + sLineBreak + PreprocessOpNew(s, varmgr)
    else
    if (Length(GetProcName(s)) > 0) and (CheckName(GetProcName(s)) or
      IsArr(GetProcName(s))) then
    begin
      if pos('(', s) > 0 then
      begin
        Result := PreprocessCall(s, varmgr);
        s := Trim(GetProcName(s));
      end;

      if IsArr(s) then
        Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
      else
        Result := Result + sLineBreak + 'pushc ' + GetConst('!' + s) +
          sLineBreak + 'gpm';

      if (ProcList.IndexOf(s) <> -1) or IsArr(s) then
        Result := Result + sLineBreak + 'jc'
      else
        Result := Result + sLineBreak + 'invoke';
    end
    else
    if IsExpr(Bf) then
      Result := Result + sLineBreak + PreprocessExpression(Bf, varmgr)
    else
      Result := Result + sLineBreak + PushIt(Bf, varmgr);

    sl.Delete(sl.Count - 1);

    if SwapMode then
     Result := Result + sLineBreak + 'swp';
  end;
  FreeAndNil(sl);

  if ARGC_Enable and
     ((ProcList.IndexOf(pn) <> -1)) and
     (not SwapMode) and
     (not IsClassProcCallingAddr(pn)) then
   begin
     Result := Result + sLineBreak + PushIt(IntToStr(Argc), varmgr);
     //if SwapMode then
     // Result := Result + sLineBreak + 'swp';
   end;

  {if IsClassProcCallingAddr(s) then
   begin
     Result := Result + sLineBreak + PushIt(GetClassProcCallingContext(s), varmgr);
     if SwapMode then
      Result := Result + sLineBreak + 'swp';
   end;}
end;

function PreprocessArrAction(arrexpr, action: string; varmgr: TVarManager): string;
var
  c, lvl: cardinal;
  s: string;
begin
  Result := '';
  lvl := GetArrLvl(arrexpr);
  c := lvl;
  while c > 0 do
  begin
    s := GetArrLvlVal(arrexpr, c);
    if IsArr(s) then
      Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
    else
    if IsVar(s, varmgr) then
      Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
    else
    if IsConst(s) then
      Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
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
        Result := Result + sLineBreak + 'pushc ' + GetConst('!' + s) +
          sLineBreak + 'gpm';

      if (ProcList.IndexOf(s) <> -1) or IsArr(s) then
        Result := Result + sLineBreak + 'jc'
      else
        Result := Result + sLineBreak + 'invoke';
    end
    {else
      PrpError('Error in operation with [<index>] -> "' + s + '".')};
    Dec(c);
  end;
  Result := Result + sLineBreak + 'push ' + GetVar(GetArrName(arrexpr), varmgr);
  c := 1;
  while c < lvl do
  begin
    Result := Result + sLineBreak + 'pushai';
    Inc(c);
  end;
  Result := Result + sLineBreak + action;
end;

function PopIt(s: string; varmgr: TVarManager): string;
var
  bf: string;
begin
  s := Trim(s);
  bf := s;
  Result := '';
  if IsVar(s, varmgr) then
    Result := Result + sLineBreak + PreprocessVarAction(s, 'peek', varmgr) +
      sLineBreak + 'pop'
  else
  if IsArr(s) then
    Result := Result + sLineBreak + PreprocessArrAction(s, 'peekai', varmgr)
  else
    PrpError('Invalid call "' + bf + '".');
end;

function PushIt(s: string; varmgr: TVarManager; PushTemporary: boolean = True): string;
var
  bf: string;
  c: cardinal;
begin
  s := Trim(s);
  bf := s;
  Result := '';
  if Copy(s, 1, 1)[1] in ['@', '?'] then
    Delete(s, 1, 1);
  if IsExpr(s) then
    Result := Result + sLineBreak + PreprocessExpression(s, varmgr)
  else
  if IsOpNew(s) then
    Result := Result + sLineBreak + PreprocessOpNew(s, varmgr)
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
      Result := Result + sLineBreak + 'jc'
    else
      Result := Result + sLineBreak + 'invoke';
  end
  else
  if IsVar(s, varmgr) then
    Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
  else
  if IsConst(s) then
  begin
    Result := Result + sLineBreak + 'pushc ' + GetConst(s);
    if PushTemporary then
      Result := Result + sLineBreak + 'gpm';
  end
  else
  if IsArr(s) then
    Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
  else
  if IsEnumVals(s) then
  begin
    Result := Result + sLineBreak + PushIt(IntToStr(CountEnumItems(s)), varmgr) +
      sLineBreak + PushIt('1', varmgr) + sLineBreak + 'newa';
    // to return
    Delete(s, 1, 1);
    Delete(s, Length(s), 1);
    s := Trim(s);
    c := 0;
    while Length(s) > 0 do
    begin                              { | copying pointer to array.}
      Result := Result + sLineBreak + 'pcopy' + sLineBreak +
        // [2] : val
        PushIt(Trim(CutNextArg(s)), varmgr, False) + sLineBreak +
        // [1] : indx
        'swp' + sLineBreak + PushIt(IntToStr(c), varmgr) + sLineBreak +
        // [0] : @arr
        'swp' + sLineBreak + 'peekai';
      // peekai
      s := Trim(s);
      Inc(c);
    end;
  end
  else
    PrpError('Invalid call "' + bf + '".');

  if copy(bf, 1, 1) = '@' then //we need to push pointer to object!
  begin
    bf := '__p_reg_ptr_op_reg';
    varmgr.DefVar(Bf);
    Result := Result + sLineBreak + 'new' + sLineBreak + 'gpm' +
      sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr) + sLineBreak +
      'movp' + sLineBreak + 'push ' + GetVar('$' + Bf, varmgr);
  end;

  if copy(bf, 1, 1) = '?' then //we need to push object by pointer!
  begin
    bf := '__p_reg_ptr_op_reg';
    varmgr.DefVar(Bf);
    Result := Result + sLineBreak + 'new' + sLineBreak + 'peek ' +
      GetVar('$' + Bf, varmgr) + sLineBreak + 'pop' + sLineBreak +
      'push ' + GetVar('$' + Bf, varmgr) + sLineBreak + 'gvbp' +
      sLineBreak + 'push ' + GetVar('$' + Bf, varmgr);
  end;
end;


function TempPushIt(s: string; varmgr: TVarManager): string;
var
  bf: string;
begin
  s := Trim(s);
  bf := s;
  Result := '';
  if Copy(s, 1, 1)[1] in ['@', '?'] then
    Delete(s, 1, 1);
  if IsExpr(s) then
    Result := Result + sLineBreak + PreprocessExpression(s, varmgr)
  else
  if IsOpNew(s) then
    Result := Result + sLineBreak + PreprocessOpNew(s, varmgr)
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
      Result := Result + sLineBreak + 'jc'
    else
      Result := Result + sLineBreak + 'invoke';
  end
  else
  if IsVar(s, varmgr) then
    Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr) +
      sLineBreak + 'copy' + sLineBreak + 'gpm' + sLineBreak +
      'swp' + sLineBreak + 'pop'
  else
  if IsConst(s) then
    Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
  else
  if IsArr(s) then
    Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr) +
      sLineBreak + 'copy' + sLineBreak + 'gpm' + sLineBreak +
      'swp' + sLineBreak + 'pop'
  else
    PrpError('Invalid call "' + bf + '".');

  if copy(bf, 1, 1) = '@' then //we need to push pointer to object!
  begin
    bf := '__p_reg_ptr_op_reg';
    varmgr.DefVar(Bf);
    Result := Result + sLineBreak + 'new' + sLineBreak + 'gpm' +
      sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr) + sLineBreak +
      'movp' + sLineBreak + 'push ' + GetVar('$' + Bf, varmgr);
  end;

  if copy(bf, 1, 1) = '?' then //we need to push object by pointer!
  begin
    bf := '__p_reg_ptr_op_reg';
    varmgr.DefVar(Bf);
    Result := Result + sLineBreak + 'new' + sLineBreak + 'peek ' +
      GetVar('$' + Bf, varmgr) + sLineBreak + 'pop' + sLineBreak +
      'push ' + GetVar('$' + Bf, varmgr) + sLineBreak + 'gvbp' +
      sLineBreak + 'push ' + GetVar('$' + Bf, varmgr);
  end;
end;

function IsExpr(s: string): boolean;
var
  in_str: boolean;
  in_br, in_rbr: integer;
begin
  Result := False;
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

    if (not in_str) and (in_br = 0) and (in_rbr = 0) then
    begin
      if s[1] in ['+', '-', '*', '/', '\', '%', '&', '|', '^', '~', '>', '<', '='] then
      begin
        Result := True;
        break;
      end;
      if Length(s) > 1 then
        if (s[1] + s[2] = '>=') or (s[1] + s[2] = '<=') or
          (s[1] + s[2] = '<<') or (s[1] + s[2] = '>>') or (s[1] + s[2] = '<>') or
          (s[1] + s[2] = '?=') then
        begin
          Result := True;
          break;
        end;
    end;
    Delete(s, 1, 1);
  end;
end;

function CutNextExprToken(var s: string): string;
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

    if (not in_str) and (in_br = 0) and (in_rbr = 0) then
    begin
      if s[1] in ['+', '-', '*', '/', '\', '%', '&', '|', '^', '~', '>', '<', '='] then
        break;
      if Length(s) > 1 then
        if (s[1] + s[2] = '>=') or (s[1] + s[2] = '<=') or (s[1] + s[2] = '<<') or
          (s[1] + s[2] = '>>') or (s[1] + s[2] = '<>') or
          (s[1] + s[2] = '?=') then
          break;
      if (in_br < 0) or (in_rbr < 0) then
        break;
    end;

    Result := Result + s[1];
    Delete(s, 1, 1);
  end;
end;

function GetNextExprToken(s: string): string;
begin
  Result := CutNextExprToken(s);
end;

function CutNextExprOp(var s: string): string;
begin
  Result := '';
  if Length(s) > 1 then
  begin
    if (s[1] + s[2] = '>=') or (s[1] + s[2] = '<=') or (s[1] + s[2] = '<<') or
      (s[1] + s[2] = '>>') or (s[1] + s[2] = '<>') or (s[1] + s[2] = '==') or
      (s[1] + s[2] = '?=') then
    begin
      Result := s[1] + s[2];
      Delete(s, 1, 2);
      Exit;
    end;

    if s[1] in ['+', '-', '*', '/', '\', '%', '&', '~', '|', '^', '>', '<', '='] then
    begin
      Result := s[1];
      Delete(s, 1, 1);
    end;
  end;
end;

function GetNextExprOp(s: string): string;
begin
  Result := CutNextExprOp(s);
end;

function CutExprInBraces(var s: string): string;
var
  in_str: boolean;
  in_br, in_rbr: integer;
begin
  Result := '';
  in_str := False;
  in_br := 0;
  in_rbr := 0;
  {if s[1] = '(' then
   begin
     Delete(s, 1, 1);
     Inc(in_br);
   end;}
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
      Result := Result + s[1];
      Delete(s, 1, 1);
      break;
    end;

    Result := Result + s[1];
    Delete(s, 1, 1);
  end;
end;

function BracesDelt(s: string): integer;
var
  in_str: boolean;
  in_br, in_rbr: integer;
begin
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

    Delete(s, 1, 1);
  end;
  Result := in_br;
end;

function GetExprInBraces(s: string): string;
begin
  Result := CutExprInBraces(s);
end;

function PreprocessExpression(s: string; varmgr: TVarManager): string;
var
  TokensStack: TStringList;
  Bf: string;
  c, vn, warnops: integer;
begin
  warnops := 0;
  Result := '';
  TokensStack := TStringList.Create;
  s := Trim(s);

  {while Length(s) > 1 do
   if (s[1] = '(') and (s[Length(s)] = ')') then
    begin
      if BracesDelt(s) = 0 then
       begin
        Delete(s,1,1);
        Delete(s,Length(s),1);
        s := Trim(s);
       end
      else
       break;
    end
   else
    break;}

  if Length(s) > 0 then
    if s[1] in ['-', '+'] then
      s := '0' + s;
  //build tokens stack
  while Length(s) > 0 do
  begin
    Bf := '';
    if Length(s) > 0 then
      repeat
        Bf := Trim(CutNextExprOp(s));
        if Length(Bf) > 0 then
          TokensStack.Add(Bf);
        s := Trim(s);
      until Bf = '';

    if Length(s) > 0 then
      if s[1] = '(' then
      begin
        Bf := Trim(CutExprInBraces(s));
        if Length(Bf) > 0 then
          TokensStack.Add(Bf);
        s := Trim(s);
      end;

    if Length(s) > 0 then
      repeat
        Bf := Trim(CutNextExprOp(s));
        if Length(Bf) > 0 then
          TokensStack.Add(Bf);
        s := Trim(s);
      until Bf = '';

    if Length(s) > 0 then
      Bf := Trim(CutNextExprToken(s));
    if Length(Bf) > 0 then
      TokensStack.Add(Bf);

    if Length(s) > 0 then
      s := Trim(s);
  end;

  c := 0;
  while c < TokensStack.Count do
  begin
    TokensStack[c] := Trim(TokensStack[c]);
    if Length(TokensStack[c]) = 0 then
    begin
      TokensStack.Delete(c);
      Dec(c);
    end;
    Inc(c);
  end;

  vn := 0;

  // --, ++, +- cleaning
  c := 0;
  while c < TokensStack.Count do
  begin
    if c + 1 < TokensStack.Count then
    begin
      if (TokensStack[c] = '-') and (TokensStack[c + 1] = '-') then
      begin
        TokensStack[c] := '+';
        TokensStack.Delete(c + 1);
        c := 0;
      end;

      if (TokensStack[c] = '+') and (TokensStack[c + 1] = '-') then
      begin
        TokensStack[c] := '-';
        TokensStack.Delete(c + 1);
        c := 0;
      end;

      if (TokensStack[c] = '+') and (TokensStack[c + 1] = '+') then
      begin
        TokensStack.Delete(c + 1);
        c := 0;
      end;

      if (TokensStack[c] = '-') and (TokensStack[c + 1] = '+') then
      begin
        TokensStack.Delete(c + 1);
        c := 0;
      end;
    end;
    Inc(c);
  end;

  // ( ... )
  c := 0;
  while c < TokensStack.Count do
  begin
    if Copy(TokensStack[c], 1, 1) = '(' then
    begin
      Bf := TokensStack[c];
      Delete(Bf, 1, 1);
      Delete(Bf, Length(Bf), 1);
      TokensStack[c] := Bf;
      Bf := '__m_reg_' + IntToStr(vn);
      varmgr.DefVar(Bf);
      Inc(vn);
      Result := Result + sLineBreak + PreprocessExpression(TokensStack[c], varmgr) +
        sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr) + sLineBreak + 'pop';
      TokensStack[c] := '$' + Bf;
    end;
    Inc(c);
  end;

  // * / % \
  c := 0;
  while c < TokensStack.Count do
  begin
    if (c < TokensStack.Count) and (c >= 0) then
      if (TokensStack[c] = '*') and (c > 0) and (c + 1 < TokensStack.Count) then
      begin
        Bf := '__m_reg_' + IntToStr(vn);
        varmgr.DefVar(Bf);
        Inc(vn);
        Result := Result + sLineBreak + PushIt(TokensStack[c + 1], varmgr) +
          sLineBreak + TempPushIt(TokensStack[c - 1], varmgr) +
          sLineBreak + 'mul' + sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr) +
          sLineBreak + 'pop';
        TokensStack[c - 1] := '$' + Bf;
        TokensStack.Delete(c);
        TokensStack.Delete(c);
        Dec(c);
        //Inc(warnops);
      end;

    if (c < TokensStack.Count) and (c >= 0) then
      if (TokensStack[c] = '/') and (c > 0) and (c + 1 < TokensStack.Count) then
      begin
        Bf := '__m_reg_' + IntToStr(vn);
        varmgr.DefVar(Bf);
        Inc(vn);
        Result := Result + sLineBreak + PushIt(TokensStack[c + 1], varmgr) +
          sLineBreak + TempPushIt(TokensStack[c - 1], varmgr) +
          sLineBreak + 'div' + sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr) +
          sLineBreak + 'pop';
        TokensStack[c - 1] := '$' + Bf;
        TokensStack.Delete(c);
        TokensStack.Delete(c);
        Dec(c);
        //Inc(warnops);
      end;

    if (c < TokensStack.Count) and (c >= 0) then
      if (TokensStack[c] = '%') and (c > 0) and (c + 1 < TokensStack.Count) then
      begin
        Bf := '__m_reg_' + IntToStr(vn);
        varmgr.DefVar(Bf);
        Inc(vn);
        Result := Result + sLineBreak + PushIt(TokensStack[c + 1], varmgr) +
          sLineBreak + TempPushIt(TokensStack[c - 1], varmgr) +
          sLineBreak + 'mod' + sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr) +
          sLineBreak + 'pop';
        TokensStack[c - 1] := '$' + Bf;
        TokensStack.Delete(c);
        TokensStack.Delete(c);
        Dec(c);
        //Inc(warnops);
      end;

    if (c < TokensStack.Count) and (c >= 0) then
      if (TokensStack[c] = '\') and (c > 0) and (c + 1 < TokensStack.Count) then
      begin
        Bf := '__m_reg_' + IntToStr(vn);
        varmgr.DefVar(Bf);
        Inc(vn);
        Result := Result + sLineBreak + PushIt(TokensStack[c + 1], varmgr) +
          sLineBreak + TempPushIt(TokensStack[c - 1], varmgr) +
          sLineBreak + 'idiv' + sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr) +
          sLineBreak + 'pop';
        TokensStack[c - 1] := '$' + Bf;
        TokensStack.Delete(c);
        TokensStack.Delete(c);
        Dec(c);
        //Inc(warnops);
      end;

    Inc(c);
  end;

  if TokensStack.Count > 0 then
  begin
    if (TokensStack[0] = '>=') or (TokensStack[0] = '<=') or
      (TokensStack[0] = '<<') or (TokensStack[0] = '>>') or
      (TokensStack[0] = '<>') {or (TokensStack[0] = 'not')} or
      (TokensStack[0] = 'and') or (TokensStack[0] = 'or') or
      (TokensStack[0] = 'xor') or (TokensStack[0] = '+') or
      (TokensStack[0] = '-') or (TokensStack[0] = '&') or
      (TokensStack[0] = '^') {or (TokensStack[0] = '~')} or
      (TokensStack[0] = '|') or (TokensStack[0] = '>') or
      (TokensStack[0] = '<') or (TokensStack[0] = '=') then
    begin
      Result := Result + sLineBreak + TempPushIt('0', varmgr);
    end
    else
    if (TokensStack[0] <> '~') and (TokensStack[0] <> 'not') then
    begin
      Result := Result + sLineBreak + TempPushIt(TokensStack[0], varmgr);
      TokensStack.Delete(0);
    end;
  end;

  // + -
  while TokensStack.Count > 1 do
  begin
    if (TokensStack.Count > 1) then
    begin
      if (TokensStack[0] = '+') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'swp' + sLineBreak + 'add' {+ sLineBreak + 'gpm'};
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '-') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'swp' + sLineBreak + 'sub'{ + sLineBreak + 'gpm'};
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '<<') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'swp' + sLineBreak + 'shl' {+ sLineBreak + 'gpm'};
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '>>') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'swp' + sLineBreak + 'shr'{ + sLineBreak + 'gpm'};
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '>=') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'swp' + sLineBreak + 'be' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '<=') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'be' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '<>') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'eq' + sLineBreak + 'not' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '>') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'swp' + sLineBreak + 'bg' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '<') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'bg' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '==') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'eq' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '&') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'and' {+ sLineBreak + 'gpm'};
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '|') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'or' {+ sLineBreak + 'gpm'};
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '^') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'swp' + sLineBreak + 'xor' {+ sLineBreak + 'gpm'};
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = '~') then
      begin
        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) +
          sLineBreak + 'not'{ + sLineBreak + 'gpm'};
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      {else
      if (TokensStack[0] = 'and') then
      begin
        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr) +
          sLineBreak + 'land'(* + sLineBreak + 'gpm'*);
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = 'or') then
      begin
        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr) +
          sLineBreak + 'lor'(* + sLineBreak + 'gpm'*);
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = 'xor') then
      begin
        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr) +
          sLineBreak + 'swp' + sLineBreak + 'lxor'(* + sLineBreak + 'gpm'*);
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = 'not') then
      begin
        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr) +
          sLineBreak + 'lnot'(* + sLineBreak + 'gpm'*);
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end}
      else
        break;
    end;
    Inc(c);
  end;

  while warnops > 1 do
  begin
    Result := Result + sLineBreak + 'swp' + sLineBreak + 'pop';
    Dec(warnops);
  end;

  FreeAndNil(TokensStack);
end;

function IsEqExpr(s: string; varmgr: TVarManager): boolean;
var
  Bf: string;
begin
  Result :=  False;

  {if IsExpr(s) then
  begin}
    Bf := Trim(CutNextExprToken(s));
    s := Trim(s);
    {if IsVar(Bf, varmgr) or IsArr(Bf) then
    begin}
      Bf := Trim(GetNextExprOp(s));
      Result := (Bf = '=') or (Bf = '?=') or (Bf = '@=');
    {end;
  end;}
end;

function ParseEqExpr(s: string; varmgr: TVarManager): string;
var
  Bf, Op: string;
begin
  Result := '';
  Bf := Trim(CutNextExprToken(s));
  s := Trim(s);
  Op := CutNextExprOp(s);
  if Op = '=' then
  begin
    s := Trim(s);
    if IsOpNew(s) then
      Result := PreprocessOpNew(s, varmgr) + sLineBreak + PopIt(Bf, varmgr)
    else
    if IsExpr(s) then
      Result := PreprocessExpression(s, varmgr) + sLineBreak +
        PushIt(Bf, varmgr) + sLineBreak + 'mov'
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
        Result := Result + sLineBreak + 'jc' + sLineBreak +
        PushIt(Bf, varmgr) + sLineBreak + 'mov'
      else
        Result := Result + sLineBreak + 'invoke' + sLineBreak +
        PushIt(Bf, varmgr) + sLineBreak + 'mov';
    end
    else
    if IsArr(s) then
      Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr) + sLineBreak
        + PushIt(Bf, varmgr) + sLineBreak + 'mov'
    else
      Result := PushIt(s, varmgr) + sLineBreak + PushIt(Bf, varmgr) + sLineBreak + 'mov';
  end
  else
  if Op = '@=' then
  begin
    s := Trim(s);
    if IsExpr(s) then
      Result := PreprocessExpression(s, varmgr) + sLineBreak +
        PushIt(Bf, varmgr) + sLineBreak + 'movbp'
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
        Result := Result + sLineBreak + 'jc' + sLineBreak +
        PushIt(Bf, varmgr) + sLineBreak + 'movbp'
      else
        Result := Result + sLineBreak + 'invoke' + sLineBreak +
        PushIt(Bf, varmgr) + sLineBreak + 'movbp';
    end
    else
    if IsArr(s) then
      Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr) + sLineBreak
        + PushIt(Bf, varmgr) + sLineBreak + 'movbp'
    else
      Result := PushIt(s, varmgr) + sLineBreak + PushIt(Bf, varmgr) +
        sLineBreak + 'movbp';
  end
  else
  if Op = '?=' then
  begin
    s := Trim(s);
    if IsOpNew(s) then
      Result := PreprocessOpNew(s, varmgr) + sLineBreak + PopIt(Bf, varmgr)
    else
    if IsExpr(s) then
      Result := PreprocessExpression(s, varmgr) + sLineBreak + PopIt(Bf, varmgr)
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
        Result := Result + sLineBreak + 'jc' + sLineBreak + PopIt(Bf, varmgr)
      else
        Result := Result + sLineBreak + 'invoke' + sLineBreak + PopIt(Bf, varmgr);
    end
    else
    if IsArr(s) then
      Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr) + sLineBreak
        + PopIt(Bf, varmgr)
    else
      Result := PushIt(s, varmgr) + sLineBreak + PopIt(Bf, varmgr);
  end;
end;

function IsOpNew(s: string): boolean;
begin
  Result := False;
  s := Trim(s);
  if s = 'new' then
    Result := True
  else
  if (Copy(s, 1, 3) = 'new') and (Copy(s, 4, 4)[1] in [' ', '[']) then
    Result := True;
end;

function PreprocessOpNew(s: string; varmgr: TVarManager): string;
var
  lvl, i: integer;
  bf: string;
  mc: TMashClass;
begin
  Result := '';
  s := Trim(s);
  if s = 'new' then
    Result := 'new'
  else
  begin
    Delete(s, 1, 3);
    s := Trim(s);
    if s[1] = '[' then
    begin
      lvl := GetArrLvl(s);
      i := lvl;
      while i > 0 do
      begin
        bf := GetArrLvlVal(s, i);
        if IsExpr(bf) then
          Result := Result + sLineBreak + PreprocessExpression(bf, varmgr)
        else
          Result := Result + sLineBreak + PushIt(bf, varmgr);
        Dec(i);
      end;
      Result := Result + sLineBreak + PushIt(IntToStr(lvl), varmgr) +
        sLineBreak + 'newa';
    end
    else
    begin //for classes...
      bf := '';
      if Length(GetProcName(s)) > 0 then
       begin
         bf := s;
         s := Trim(GetProcName(s));
       end;

      mc := FindClassRec(s);
      if mc = nil then
       PrpError('Not exist class object allocation "'+s+'".');

      if ConstDefs.IndexOf('__class_' + s + '_allocator') = -1 then
        ConstDefs.Add('__class_' + s + '_allocator');

      Result := Result + TempPushIt('__class_' + s + '_allocator', varmgr) +
        sLineBreak + 'jc';

      if Length(bf) > 0 then
       begin
         i := mc.Methods.IndexOf('create');
         if i = -1 then
          PrpError('Calling to class "' + s + '" constructor, but this class haven''t constructor!' + sLineBreak +
                   'Declarate class "' + s + '" constructor (proc create) or change this allocation construction to fix that error.');
                                         //.this
         Result := Result + sLineBreak + 'pcopy' + sLineBreak +
                   PreprocessCall(bf, varmgr, true) + sLineBreak;

         Result := Result + 'pushc ' + mc.MethodsLinks[i] +
                   sLineBreak + 'gpm' + sLineBreak + 'jc';
       end;
    end;
  end;
end;

end.
