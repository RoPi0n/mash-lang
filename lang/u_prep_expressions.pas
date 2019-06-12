unit u_prep_expressions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StrUtils, u_variables, u_global, u_globalvars, u_prep_global,
  u_prep_methods, u_prep_array, u_prep_enums, u_classes, u_local_variables;

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
function PushIt(s: string; varmgr: TVarManager; PushTemporary: boolean = True;
  PushCP: boolean = False): string;
function PopIt(s: string; varmgr: TVarManager): string;
function TempPushIt(s: string; varmgr: TVarManager): string;
function IsOpNew(s: string): boolean;
function PreprocessOpNew(s: string; varmgr: TVarManager): string;
function PreprocessCall(s: string; varmgr: TVarManager;
  SwapMode: boolean = False): string;
function PreprocessArrAction(arrexpr, action: string; varmgr: TVarManager): string;

implementation

function PreprocessCall(s: string; varmgr: TVarManager;
  SwapMode: boolean = False): string;
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
    if IsExpr(Bf) then
      Result := Result + sLineBreak + PreprocessExpression(Bf, varmgr)
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
        Result := Result + sLineBreak + 'pushc ' + GetConst('!' + s, varmgr) +
          sLineBreak + 'gpm';

      if (ProcList.IndexOf(s) <> -1) or IsArr(s) then
        Result := Result + sLineBreak + 'jc'
      else
        Result := Result + sLineBreak + 'invoke';
    end
    else
      Result := Result + sLineBreak + PushIt(Bf, varmgr);

    sl.Delete(sl.Count - 1);

    if SwapMode then
      Result := Result + sLineBreak + 'swp';
  end;
  FreeAndNil(sl);

  if ARGC_Enable then
  begin
    Result := Result + sLineBreak + PushIt(IntToStr(Argc), varmgr) +
      sLineBreak + PopIt('argcount', varmgr);
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
  s, pops: string;
  IsItSafe: boolean;
begin
  Result := '';
  lvl := GetArrLvl(arrexpr);
  c := lvl;
  while c > 0 do
  begin
    s := GetArrLvlVal(arrexpr, c);

    IsItSafe := false;
    if copy(s, 1, 5) = 'safe ' then
     begin
       IsItSafe := true;
       Pops := PopLocalVariables(varmgr);
       Result := Result + sLineBreak + PushLocalVariables(varmgr);
       Delete(s, 1, 5);
       s := Trim(s);
     end;

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
        Result := Result + sLineBreak + 'pushcp ' + GetConst('!' + s, varmgr);

      if (ProcList.IndexOf(s) <> -1) or IsArr(s) then
        Result := Result + sLineBreak + 'jc'
      else
        Result := Result + sLineBreak + 'invoke';
    end
    else
    if IsArr(s) then
      Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
    else
    if IsVar(s, varmgr) then
      Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
    else
    if IsConst(s) then
      Result := Result + sLineBreak + 'pushcp ' + GetConst(s, varmgr)
    {else
      PrpError('Error in operation with [<index>] -> "' + s + '".')};

    if IsItSafe then
     Result := Result + sLineBreak + Pops;

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

function PushIt(s: string; varmgr: TVarManager; PushTemporary: boolean = True;
  PushCP: boolean = False): string;
var
  bf, Pops: string;
  c: cardinal;
  IsItSafe: boolean;
begin
  Result := '';
  s := Trim(s);

  IsItSafe := false;
  if Copy(s, 1, 5) = 'safe ' then
   begin
     IsItSafe := true;
     Pops := PopLocalVariables(varmgr);
     Result := PushLocalVariables(varmgr) + sLineBreak;
     Delete(s, 1, 5);
     s := Trim(s);
   end;

  bf := s;
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
      Result := Result + sLineBreak + 'pushcp ' + GetConst('!' + s, varmgr);

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
    if PushCP then
      Result := Result + sLineBreak + 'pushcp ' + GetConst(s, varmgr)
    else
    begin
      Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr);
      if PushTemporary then
        Result := Result + sLineBreak + 'gpm';
    end;
  end
  else
  if IsEnumVals(s) then
  begin
    Result := Result + sLineBreak + PushIt(IntToStr(CountEnumItems(s)),
      varmgr, True, True) + sLineBreak + PushIt('1', varmgr, True, True) +
      sLineBreak + 'newa';
    // to return

    if PushTemporary then
      Result := Result + sLineBreak + 'gpm';

    Delete(s, 1, 1);
    Delete(s, Length(s), 1);
    s := Trim(s);
    c := 0;
    while Length(s) > 0 do
    begin                              { | copying pointer to array.}
      Result := Result + sLineBreak + 'pcopy' + sLineBreak +
        // [2] : val
        PushIt(Trim(CutNextArg(s)), varmgr, PushTemporary) + sLineBreak +
        // [1] : indx
        'swp' + sLineBreak + PushIt(IntToStr(c), varmgr, PushTemporary) + sLineBreak +
        // [0] : @arr
        'swp' + sLineBreak + 'peekai';
      // peekai
      s := Trim(s);
      Inc(c);
    end;
  end
  else
  if IsArr(s) then
    Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
  else
    PrpError('Invalid call "' + bf + '".');

  if copy(bf, 1, 1) = '@' then //we need to push pointer to object!
  begin
    Delete(bf, 1, 1);
    s := bf;
    if IsConst(s) then
     begin
       Result := 'pushcp ' + s;
     end
    else
     begin
       bf := '__p_reg_ptr_op_reg';
       varmgr.DefVar(Bf);
       Result := Result + sLineBreak + 'new';
       if PushTemporary then
        Result := Result + sLineBreak + 'gpm';

       Result := Result + sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr, true) +
                 sLineBreak + 'movp' + sLineBreak + 'push ' + GetVar('$' + Bf, varmgr, true);
     end;
  end;

  if copy(bf, 1, 1) = '?' then //we need to push object by pointer!
    Result := Result + sLineBreak {+ 'push ' + GetVar('$' + Bf, varmgr) + sLineBreak}
      + 'gvbp';

  if IsItSafe then
   Result := Result + sLineBreak + Pops;
end;


function TempPushIt(s: string; varmgr: TVarManager): string;
var
  bf, Pops: string;
  IsItSafe: boolean;
begin
  s := Trim(s);
  Result := '';
  IsItSafe := false;
  if Copy(s, 1, 5) = 'safe ' then
   begin
     IsItSafe := true;
     Pops := PopLocalVariables(varmgr);
     Result := PushLocalVariables(varmgr) + sLineBreak;
     Delete(s, 1, 5);
     s := Trim(s);
   end;
  bf := s;
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
      Result := Result + sLineBreak + 'pushcp ' + GetConst('!' + s, varmgr);

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
    Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
  else
  if IsArr(s) then
    Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr) +
      sLineBreak + 'copy' + sLineBreak + 'gpm' + sLineBreak +
      'swp' + sLineBreak + 'pop'
  else
    Result := PushIt(bf, varmgr);
  //PrpError('Invalid call "' + bf + '".');

  if IsItSafe then
   Result := Result + sLineBreak + Pops;
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
          (s[1] + s[2] = '?=') or (s[1] + s[2] = '@=') or
          (s[1] + s[2] = '+=') or (s[1] + s[2] = '-=') or (s[1] + s[2] = '*=') or
          (s[1] + s[2] = '/=') or (s[1] + s[2] = '\=') or (s[1] + s[2] = '%=') or
          (s[1] + s[2] = '&=') or (s[1] + s[2] = '|=') or (s[1] + s[2] = '^=') or
          (s[1] + s[2] = '++') or (s[1] + s[2] = '--') or (copy(s, 1, 4) = ' in ') or
          (s[1] + s[2] = '..') then
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
           (s[1] + s[2] = '>>') or (s[1] + s[2] = '<>') or (s[1] + s[2] = '?=') or
           (s[1] + s[2] = '@=') or (s[1] + s[2] = '+=') or (s[1] + s[2] = '-=') or
           (s[1] + s[2] = '*=') or (s[1] + s[2] = '/=') or (s[1] + s[2] = '\=') or
           (s[1] + s[2] = '%=') or (s[1] + s[2] = '&=') or (s[1] + s[2] = '|=') or
           (s[1] + s[2] = '^=') or (s[1] + s[2] = '++') or (s[1] + s[2] = '--') or
           (copy(s, 1, 3) = 'in ') or (s[1] + s[2] = '..') then
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
      (s[1] + s[2] = '?=') or (s[1] + s[2] = '@=') or (s[1] + s[2] = '+=') or
      (s[1] + s[2] = '-=') or (s[1] + s[2] = '*=') or (s[1] + s[2] = '/=') or
      (s[1] + s[2] = '\=') or (s[1] + s[2] = '%=') or (s[1] + s[2] = '&=') or
      (s[1] + s[2] = '|=') or (s[1] + s[2] = '^=') or (s[1] + s[2] = '++') or
      (s[1] + s[2] = '--') or (copy(s, 1, 3) = 'in ') or (s[1] + s[2] = '..') then
    begin
      if copy(s, 1, 3) = 'in ' then
       begin
         Result := 'in';
         Delete(s, 1, 3);
       end
      else
       begin
         Result := s[1] + s[2];
         Delete(s, 1, 2);
       end;
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
  in_br: integer;
begin
  Result := '';
  in_str := False;
  in_br := 0;

  if not (copy(s, 1, 1) = '(') then
   Result := s
  else
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
    end;

    Result := Result + s[1];
    Delete(s, 1, 1);

    if in_br = 0 then
      break;
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

function IfNeg(b: boolean): string;
begin
  Result := '';
  if b then
    Result := sLineBreak + 'neg';
end;

function PreprocessExpression(s: string; varmgr: TVarManager): string;
var
  TokensStack: TStringList;
  Bf: string;
  c, vn, warnops: integer;
  neg: boolean;
begin
  warnops := 0;
  Result := '';
  TokensStack := TStringList.Create;
  s := Trim(s);

  bf := Trim(GetExprInBraces(s));
  while (Length(bf) <> Length(s)) and (Length(bf) > 0) do
   begin
     s := bf;
     bf := Trim(GetExprInBraces(s));
   end;

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
      if varmgr.DefinedVars.IndexOf(LocalVarPref + Bf) = -1 then
       varmgr.DefVar(LocalVarPref + Bf);
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
        if varmgr.DefinedVars.IndexOf(LocalVarPref + Bf) = -1 then
         varmgr.DefVar(LocalVarPref + Bf);
        Inc(vn);
        Result := Result + sLineBreak + PushIt(TokensStack[c + 1], varmgr, True, True) +
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
        if varmgr.DefinedVars.IndexOf(LocalVarPref + Bf) = -1 then
         varmgr.DefVar(LocalVarPref + Bf);
        Inc(vn);
        Result := Result + sLineBreak + PushIt(TokensStack[c + 1], varmgr, True, True) +
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
        if varmgr.DefinedVars.IndexOf(LocalVarPref + Bf) = -1 then
         varmgr.DefVar(LocalVarPref + Bf);
        Inc(vn);
        Result := Result + sLineBreak + PushIt(TokensStack[c + 1], varmgr, True, True) +
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
        if varmgr.DefinedVars.IndexOf(LocalVarPref + Bf) = -1 then
         varmgr.DefVar(LocalVarPref + Bf);
        Inc(vn);
        Result := Result + sLineBreak + PushIt(TokensStack[c + 1], varmgr, True, True) +
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
      (TokensStack[0] = '<>') or (TokensStack[0] = '+') or
      (TokensStack[0] = '-') or (TokensStack[0] = '&') or
      (TokensStack[0] = '^') {or (TokensStack[0] = '~')} or
      (TokensStack[0] = '|') or (TokensStack[0] = '>') or
      (TokensStack[0] = '<') or (TokensStack[0] = '=') or
      (TokensStack[0] = 'in') or (TokensStack[0] = '..') then
    begin
      Result := Result + sLineBreak + TempPushIt('0', varmgr);
    end
    else
    if (TokensStack[0] <> '~') then
    begin
      Result := Result + sLineBreak + TempPushIt(TokensStack[0], varmgr);
      TokensStack.Delete(0);
    end;
  end;

  // + -
  while TokensStack.Count > 1 do
  begin
    neg := false;

    if (TokensStack.Count > 1) then
    begin
      if (TokensStack[0] = '+') then
      begin
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'swp' + sLineBreak + 'add';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '-') then
      begin
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'swp' + sLineBreak + 'sub';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '<<') then
      begin 
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'swp' + sLineBreak + 'shl';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '>>') then
      begin 
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'swp' + sLineBreak + 'shr';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '>=') then
      begin 
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'swp' + sLineBreak + 'be' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '<=') then
      begin 
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'be' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '<>') then
      begin 
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'eq' + sLineBreak + 'not' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = 'in') then
      begin  
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'swp' + sLineBreak + 'pushcp _op_in' + sLineBreak + 'jc';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '..') then
      begin  
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'swp' + sLineBreak + 'pushcp _op_range' + sLineBreak + 'jc';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '>') then
      begin
        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'swp' + sLineBreak + 'bg' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '<') then
      begin 
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'bg' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '==') then
      begin
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'eq' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '===') then
      begin 
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'peq' + sLineBreak + 'gpm';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '&') then
      begin   
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'swp' + sLineBreak + 'and';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '|') then
      begin  
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'swp' + sLineBreak + 'or';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '^') then
      begin   
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr, True, True) + IfNeg(neg) +
          sLineBreak + 'swp' + sLineBreak + 'xor';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
      else
      if (TokensStack[0] = '~') then
      begin   
        if TokensStack[1] = '-' then
         begin
           neg := true;
           TokensStack.Delete(1);
         end;

        Result := Result + sLineBreak + TempPushIt(TokensStack[1], varmgr) + IfNeg(neg) +
          sLineBreak + 'not';
        TokensStack.Delete(0);
        TokensStack.Delete(0);

      end
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
  Result := False;

  {if IsExpr(s) then
  begin}
  Bf := Trim(CutNextExprToken(s));
  s := Trim(s);
    {if IsVar(Bf, varmgr) or IsArr(Bf) then
    begin}
  Bf := Trim(GetNextExprOp(s));
  Result := (Bf = '=') or (Bf = '?=') or (Bf = '@=') or (Bf = '+=') or
    (Bf = '-=') or (Bf = '*=') or (Bf = '/=') or (Bf = '\=') or
    (Bf = '%=') or (Bf = '&=') or (Bf = '|=') or (Bf = '^=') or
    (Bf = '++') or (Bf = '--');
    {end;
  end;}
end;

function ParseEqExpr(s: string; varmgr: TVarManager): string;
var
  Bf, Op, Pops: string;
  IsItSafe: boolean;
begin
  Result := '';
  Bf := Trim(CutNextExprToken(s));
  s := Trim(s);
  Op := CutNextExprOp(s);
  s := Trim(s);
  IsItSafe := false;
  if Copy(s, 1, 5) = 'safe ' then
   begin
     IsItSafe := true;
     Pops := PopLocalVariables(varmgr);
     Result := PushLocalVariables(varmgr) + sLineBreak;
     Delete(s, 1, 5);
     s := Trim(s);
   end;
  if Op = '=' then
  begin
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
        Result := Result + sLineBreak + 'pushcp ' + GetConst('!' + s, varmgr);

      if (ProcList.IndexOf(s) <> -1) or IsArr(s) then
        Result := Result + sLineBreak + 'jc' + sLineBreak +
          PushIt(Bf, varmgr) + sLineBreak + 'mov'
      else
        Result := Result + sLineBreak + 'invoke' + sLineBreak +
          PushIt(Bf, varmgr) + sLineBreak + 'mov';
    end
    else
    if IsArr(s) then
      Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr) +
        sLineBreak + PushIt(Bf, varmgr) + sLineBreak + 'mov'
    else
      Result := PushIt(s, varmgr) + sLineBreak + PushIt(Bf, varmgr) + sLineBreak + 'mov';
  end
  else
  if Op = '@=' then
  begin
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
        Result := Result + sLineBreak + 'pushcp ' + GetConst('!' + s, varmgr);

      if (ProcList.IndexOf(s) <> -1) or IsArr(s) then
        Result := Result + sLineBreak + 'jc' + sLineBreak +
          PushIt(Bf, varmgr) + sLineBreak + 'movbp'
      else
        Result := Result + sLineBreak + 'invoke' + sLineBreak +
          PushIt(Bf, varmgr) + sLineBreak + 'movbp';
    end
    else
    if IsArr(s) then
      Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr) +
        sLineBreak + PushIt(Bf, varmgr) + sLineBreak + 'movbp'
    else
      Result := PushIt(s, varmgr) + sLineBreak + PushIt(Bf, varmgr) +
        sLineBreak + 'movbp';
  end
  else
  if Op = '?=' then
  begin
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
        Result := Result + sLineBreak + 'pushcp ' + GetConst('!' + s, varmgr);

      if (ProcList.IndexOf(s) <> -1) or IsArr(s) then
        Result := Result + sLineBreak + 'jc' + sLineBreak + PopIt(Bf, varmgr)
      else
        Result := Result + sLineBreak + 'invoke' + sLineBreak + PopIt(Bf, varmgr);
    end
    else
    if IsArr(s) then
      Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr) +
        sLineBreak + PopIt(Bf, varmgr)
    else
      Result := PushIt(s, varmgr) + sLineBreak + PopIt(Bf, varmgr);
  end
  else
  if (Op = '++') or (Op = '--') then
  begin
    Result := Result + sLineBreak + PushIt(Bf, varmgr) + sLineBreak;
    case Op[1] of
      '+': Result := Result + 'inc';
      '-': Result := Result + 'dec';
    end;
    Result := Result + sLineBreak + 'pop';
    if Length(Trim(s)) > 0 then
      PrpError('Invalid construction: "' + Bf + ' ' + Op + ' ' + s + '".');
  end
  else
  begin
    Result := Result + sLineBreak + PushIt(s, varmgr) + sLineBreak +
      PushIt(Bf, varmgr) + sLineBreak;
    case Op[1] of
      '+': Result := Result + 'add';
      '-': Result := Result + 'sub';
      '*': Result := Result + 'mul';
      '/': Result := Result + 'div';
      '\': Result := Result + 'idiv';
      '%': Result := Result + 'mod';
      '&': Result := Result + 'and';
      '|': Result := Result + 'or';
      '^': Result := Result + 'xor';
    end;
    Result := Result + sLineBreak + 'pop';
  end;
  if IsItSafe then
   Result := Result + sLineBreak + Pops;
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
          Result := Result + sLineBreak + PushIt(bf, varmgr, True, True);
        Dec(i);
      end;
      Result := Result + sLineBreak + PushIt(IntToStr(lvl), varmgr, True, True) +
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
        PrpError('Not exist class object allocation "' + s + '".');

      mc.ClassUsed := true;

      if ConstDefs.IndexOf('__class_' + s + '_allocator') = -1 then
        ConstDefs.Add('__class_' + s + '_allocator');

      Result := Result + 'pushcp ' + '__class_' + s + '_allocator' + sLineBreak + 'jc';

      if Length(bf) > 0 then
      begin
        i := mc.Methods.IndexOf('create');
        if i = -1 then
          PrpError('Calling to class "' + s +
            '" constructor, but this class haven''t constructor!' + sLineBreak +
            'Declarate class "' + s +
            '" constructor (proc create) or change this allocation construction to fix that error.');
        //.this
        Result := Result + sLineBreak + 'pcopy' + sLineBreak +
          PreprocessCall(bf, varmgr, True) + sLineBreak;

        Result := Result + 'pushcp ' + mc.MethodsLinks[i] +
          sLineBreak + 'jc';
      end;
    end;
  end;
end;

end.
