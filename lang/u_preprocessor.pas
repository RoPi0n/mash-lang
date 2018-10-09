unit u_preprocessor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StrUtils, u_global, u_globalvars, u_variables, u_consts;

type
  TBlockEntryType = (btProc, btFunc, btIf, btFor, btWhile, btUntil, btTry);

  TCodeBlock = class(TObject)
  public
    bType: TBlockEntryType;
    mName, bMeta, bMCode, bEndCode: string;
    constructor Create(bt: TBlockEntryType; MT, MC, EC: string);
  end;

function IsVar(s: string): boolean;
function GetVar(s: string; varmgr: TVarManager): string;
function IsWord(var s: string): boolean;
function IsInt(s: string): boolean;
function IsFloat(s: string): boolean;
function IsStr(s: string): boolean;
function IsConst(var s: string): boolean;
function GetConst(s: string): string;
function IsArr(s: string): boolean;
function GetArrLvl(s: string): cardinal;
function GetArrLvlVal(s: string; indx: cardinal): string;
function GetArrName(s: string): string;
function PreprocessVarAction(varexpr, action: string; varmgr: TVarManager): string;
function PreprocessArrAction(arrexpr, action: string; varmgr: TVarManager): string;
function PreprocessVarDefine(s: string; varmgr: TVarManager): string;
function PreprocessVarDefines(s: string; varmgr: TVarManager): string;
function GetProcName(s: string): string;
function PreprocessProc(s: string; varmgr: TVarManager): string;
function tkpos(tk, s: string): cardinal;
function PreprocessCall(s: string; varmgr: TVarManager): string;
function TryToGetProcName(s: string): string;
procedure PreprocessDefinitions(s: string);
function PreprocessStr(s: string; varmgr: TVarManager): string;
function CutNextArg(var s: string): string;
function PushIt(s: string; varmgr: TVarManager): string;
function PreprocessExpression(s: string; varmgr: TVarManager): string;
function IsExpr(s: string): boolean;
function GetCurrentMethodName: string;
function IsOpNew(s:string): boolean;
function PreprocessOpNew(s:string; varmgr:TVarManager): string;
procedure PrpError(m: string);
procedure PrpWarn(m: string);
procedure InitPreprocessor;
procedure FreePreprocessor;

implementation

procedure PrpError(m: string);
begin
  writeln('[!] Error: ', m);
  writeln('    - In -> (method) "' + GetCurrentMethodName + '".');
  halt;
end;

procedure PrpWarn(m: string);
begin
  writeln('[!] Warning: ', m);
  writeln('    - In -> (method) "' + GetCurrentMethodName + '".');
end;

constructor TCodeBlock.Create(bt: TBlockEntryType; MT, MC, EC: string);
begin
  inherited Create;
  self.bType := bt;
  self.bMeta := MT;
  self.bMCode := MC;
  self.bEndCode := EC;
end;

var
  IfBlCounter: cardinal = 0;
  ForBlCounter: cardinal = 0;
  WhileBlCounter: cardinal = 0;
  UntilBlCounter: cardinal = 0;
  TryBlCounter: cardinal = 0;
  BlockStack: TList;
  ConstDefs: TStringList;
  //VarDefs: TStringList;

function IsVar(s: string): boolean;
begin
  Result := False;
  if length(s) > 0 then
  begin
    if s[1] = '$' then
    begin
      Delete(s, 1, 1);
      if s[1] = '.' then
        s := LocalVarPref + s;
      Result := CheckName(s);
    end
    else
    begin
      if s[1] = '.' then
        s := LocalVarPref + s;

      Result := CheckName(s) and (ConstDefs.IndexOf(s) = -1);//VarDefs.IndexOf(s) <> -1;
    end;
  end;
end;

function GetVar(s: string; varmgr: TVarManager): string;
begin
  if s[2] = '.' then
  begin
    Delete(s, 1, 2);
    s := '$' + LocalVarPref + s;
  end
  else
  if s[1] = '.' then
  begin
    s := '$' + LocalVarPref + s;
  end;
  if IsVar(s) then
  begin
    Delete(s, 1, 1);
    Result := IntToStr(varmgr.Get(s));
  end
  else
    PrpError('Invalid variable call "' + s + '".');
end;

function IsWord(var s: string): boolean;
var
  w: word;
begin
  Result := Length(s) > 0;
  w := 1;
  if Length(s) > 2 then
  begin
    if (s[1] = '0') and (s[2] = 'x') then
    begin
      Delete(s, 1, 2);
      while w <= Length(s) do
      begin
        Result := Result and (s[w] in ['0'..'9', 'a'..'f']);
        Inc(w);
      end;
      s := '$' + s;
    end
    else
      while w <= Length(s) do
      begin
        Result := Result and (s[w] in ['0'..'9']);
        Inc(w);
      end;
  end
  else
    while w <= Length(s) do
    begin
      Result := Result and (s[w] in ['0'..'9']);
      Inc(w);
    end;
end;

function IsInt(s: string): boolean;
var
  w: word;
  mchk: boolean;
begin
  Result := Length(s) > 0;
  w := 1;
  mchk := True;
  while w <= Length(s) do
  begin
    if (s[w] = '-') and (w > 1) then
      mchk := False;
    Result := Result and (mchk) and (s[w] in ['0'..'9', '-']);
    Inc(w);
  end;
end;

function IsFloat(s: string): boolean;
var
  w, dcnt: word;
  mchk: boolean;
begin
  Result := Length(s) > 0;
  w := 1;
  dcnt := 0;
  mchk := True;
  while w <= Length(s) do
  begin
    if (s[w] = '-') and (w > 1) then
      mchk := False;
    if s[w] = '.' then
      Inc(dcnt);
    Result := Result and (dcnt <= 1) and (mchk) and (s[w] in ['0'..'9', '.', '-']);
    Inc(w);
  end;
end;

function IsStr(s: string): boolean;
begin
  Result := Length(s) > 0;
  Result := Result and (s[1] = '"') and (s[length(s)] = '"');
  Delete(s, 1, 1);
  Delete(s, length(s), 1);
  Result := Result and (pos('"', s) = 0);
end;

var
  CntConstAutoDefs: cardinal = 0;

const
  AutoDefConstPref = '__defc_';
  AutoDefConstSuffx = '_n';

function IsConst(var s: string): boolean;
var
  Cnt: TConstant;
  s1: string;
  c: cardinal;
  i: int64;
  d: double;
begin
  s1 := s;
  Result := False;
  if length(s1) > 0 then
  begin
    if ConstDefs.IndexOf(s1) <> -1 then
      Result := True
    else
    if s1[1] = '!' then
    begin
      Delete(s1, 1, 1);
      Result := CheckName(s1);
    end
    else
    if IsWord(s) then
    begin
      c := StrToInt(s);
      s := AutoDefConstPref + 'word' + AutoDefConstSuffx + IntToStr(CntConstAutoDefs);
      Cnt := TConstant.Create;
      Cnt.c_names.Add(s);
      Cnt.c_type := ctUnsigned64;
      St_WriteCardinal(Cnt.c_value, c);
      Constants.Add(Cnt);
      s := '!' + s;
      Result := True;
      Inc(CntConstAutoDefs);
    end
    else
    if IsInt(s) then
    begin
      i := StrToInt(s);
      s := AutoDefConstPref + 'int' + AutoDefConstSuffx + IntToStr(CntConstAutoDefs);
      Cnt := TConstant.Create;
      Cnt.c_names.Add(s);
      Cnt.c_type := ctInt64;
      St_WriteInt64(Cnt.c_value, i);
      Constants.Add(Cnt);
      s := '!' + s;
      Result := True;
      Inc(CntConstAutoDefs);
    end
    else
    if IsFloat(s) then
    begin
      d := StrToFloat(s);
      s := AutoDefConstPref + 'float' + AutoDefConstSuffx + IntToStr(CntConstAutoDefs);
      Cnt := TConstant.Create;
      Cnt.c_names.Add(s);
      Cnt.c_type := ctDouble;
      St_WriteDouble(Cnt.c_value, d);
      Constants.Add(Cnt);
      s := '!' + s;
      Result := True;
      Inc(CntConstAutoDefs);
    end
    else
    if IsStr(s) then
    begin
      s1 := s;
      Delete(s1, 1, 1);
      Delete(s1, Length(s1), 1);
      s := AutoDefConstPref + 'str' + AutoDefConstSuffx + IntToStr(CntConstAutoDefs);
      Cnt := TConstant.Create;
      Cnt.c_names.Add(s);
      Cnt.c_type := ctString;
      Cnt.c_value.Write(s1[1], length(s1));
      Constants.Add(Cnt);
      s := '!' + s;
      Result := True;
      Inc(CntConstAutoDefs);
    end;
  end;
end;

function GetConst(s: string): string;
begin
  Result := s;
  if IsConst(s) then
  begin
    if s[1] = '!' then
      Delete(s, 1, 1);
    Result := s;
  end
  else
    PrpError('Invalid constant call "' + s + '".');
end;

function IsArr(s: string): boolean;
var
  cnt: integer;
begin
  Result := False;
  if length(s) > 0 then
    if (pos('[', s) > 0) and (pos(']', s) > 0) then
    begin
      Result := True;
      cnt := 0;
      while length(s) > 0 do
      begin
        case s[1] of
          '[': Inc(cnt);
          ']': Dec(cnt);
        end;
        Delete(s, 1, 1);
      end;
      Result := Result and (cnt = 0);
    end;
end;

function GetArrLvl(s: string): cardinal;
var
  cnt: integer;
begin
  Result := 0;
  if (pos('[', s) > 0) and (pos(']', s) > 0) then
  begin
    cnt := 0;
    while length(s) > 0 do
    begin
      case s[1] of
        '[': Inc(cnt);
        ']': Dec(cnt);
      end;
      if (s[1] = ']') and (cnt = 0) then
        Inc(Result);
      Delete(s, 1, 1);
    end;
  end;
end;

function GetArrLvlVal(s: string; indx: cardinal): string;
var
  cnt: integer;
  i: cardinal;
begin
  Result := '';
  i := 0;
  if indx < 1 then
    exit;
  if (pos('[', s) > 0) and (pos(']', s) > 0) then
  begin
    Delete(s, 1, pos('[', s) - 1);
    cnt := 0;
    while length(s) > 0 do
    begin
      case s[1] of
        '[': Inc(cnt);
        ']': Dec(cnt);
      end;
      if (s[1] = ']') and (cnt = 0) then
        Inc(i);
      Delete(s, 1, 1);
      if i = indx - 1 then
      begin
        while length(s) > 0 do
        begin
          case s[1] of
            '[': Inc(cnt);
            ']': Dec(cnt);
          end;
          if (s[1] = ']') and (cnt = 0) then
            break;
          if not ((s[1] = '[') and (cnt = 1)) then
            Result := Result + s[1];
          Delete(s, 1, 1);
        end;
        break;
      end;
    end;
  end;
end;

function GetArrName(s: string): string;
begin
  Result := copy(s, 1, pos('[', s) - 1);
end;

function PreprocessVarAction(varexpr, action: string; varmgr: TVarManager): string;
begin
  Result := action + ' ' + GetVar(varexpr, varmgr);
end;

function PreprocessArrAction(arrexpr, action: string; varmgr: TVarManager): string;
var
  c, lvl: cardinal;
  s: string;
begin
  Result := '';
  lvl := GetArrLvl(arrexpr);
  c := 0;
  while c <= lvl do
  begin
    s := GetArrLvlVal(arrexpr, c);
    if IsArr(s) then
      Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
    else
    if IsVar(s) then
      Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
    else
    if IsConst(s) then
      Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
    else
    if IsExpr(s) then
      Result := Result + sLineBreak + PreprocessExpression(s, varmgr)
    else
    if Pos('(', s) > 0 then
    begin
      if (ProcList.IndexOf(TryToGetProcName(s)) <> -1) or
        (ImportsLst.IndexOf(TryToGetProcName(s)) <> -1) then
      begin
        if pos('(', s) > 0 then
        begin
          Result := Result + sLineBreak + PreprocessCall(s, varmgr);
          s := GetProcName(Trim(s));
        end;

        s := Trim(s);

        Result := Result + sLineBreak + 'pushc ' + GetConst('!' + s) +
          sLineBreak + 'gpm' + sLineBreak;
        if ProcList.IndexOf(s) <> -1 then
          Result := Result + 'jc'
        else
          Result := Result + 'invoke';
      end{
      else
        PrpError('Error in operation with [<index>] -> "' + s + '".')};
    end{
    else
      PrpError('Error in operation with [<index>] -> "' + s + '".')};
    Inc(c);
  end;
  for c := 0 to lvl - 1 do
    Result := Result + sLineBreak + 'push ' + GetVar(GetArrName(arrexpr), varmgr) +
      sLineBreak + action;
end;


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
      Result := PreprocessOpNew(s, varmgr)
    else
    if IsVar(s) then
      Result := PreprocessVarAction(s, 'push', varmgr)
    else
    if IsConst(s) then
      Result := Result + sLineBreak + 'pushc ' + GetConst(s)
    else
    if IsArr(s) then
      Result := PreprocessArrAction(s, 'pushai', varmgr)
    else
    if IsExpr(s) then
      Result := Result + sLineBreak + PreprocessExpression(s, varmgr)
    else
    if Pos('(', s) > 0 then
    begin
      if (ProcList.IndexOf(TryToGetProcName(s)) <> -1) or
        (ImportsLst.IndexOf(TryToGetProcName(s)) <> -1) then
      begin
        if pos('(', s) > 0 then
        begin
          Result := Result + sLineBreak + PreprocessCall(s, varmgr);
          s := GetProcName(Trim(s));
        end;

        s := Trim(s);

        Result := Result + sLineBreak + 'pushc ' + GetConst('!' + s) +
          sLineBreak + 'gpm' + sLineBreak;
        if ProcList.IndexOf(s) <> -1 then
          Result := Result + 'jc'
        else
          Result := Result + 'invoke';
      end
      else
        PrpError('Invalid variable definition with = in "' + s + '".');
    end
    else
      PrpError('Invalid variable definition with = in "' + s + '".');
    varmgr.DefVar(v);
    Result := Result + sLineBreak + 'peek ' + GetVar('$' + v, varmgr) +
      sLineBreak + 'pop';
  end
  else
    varmgr.DefVar(s);
end;

function PreprocessVarDefines(s: string; varmgr: TVarManager): string;
begin
  Result := '';
  while Length(s) > 0 do
    Result := Result + sLineBreak + PreprocessVarDefine(CutNextArg(s), varmgr);
end;

function GetProcName(s: string): string;
begin
  Result := Copy(s, 1, Pos('(', s) - 1);
end;

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
    if IsVar(bf) then
    begin
      if bf[2] <> '.' then
        AsmWarn('Receiving control of global variable "' + bf +
          '" in proc "' + pn + '".');
      if varmgr.DefinedVars.IndexOf(bf) = -1 then
      begin
        if bf[2] <> '.' then
        begin
          Delete(bf, 1, 1);
          varmgr.DefVar(bf);
          bf := '$' + bf;
        end
        else
        begin
          Delete(bf, 1, 2);
          varmgr.DefVar(LocalVarPref + bf);
          bf := '$' + LocalVarPref + bf;
        end;
      end;
      Result := Result + sLineBreak + PreprocessVarAction(bf, 'peek', varmgr) +
        sLineBreak + 'pop';
    end
    else
      PrpError('Invalid proc "' + pn + '" define.');
  end;
end;

function tkpos(tk, s: string): cardinal;
var
  R: cardinal;
begin
  Result := 0;
  R := 0;
  while Length(s) > 0 do
  begin
    if s[1] = '"' then
    begin
      Delete(s, 1, 1);
      Inc(R, Pos('"', s) + 1);
      Delete(s, 1, pos('"', s));
    end;
    if pos(tk, s) = 1 then
    begin
      Inc(R);
      Result := R;
      break;
    end;
    Delete(s, 1, 1);
    Inc(R);
  end;
end;


function PopIt(s: string; varmgr: TVarManager): string;
var
  bf: string;
begin
  s := Trim(s);
  bf := s;
  Result := '';
  if IsVar(s) then
    Result := Result + sLineBreak + PreprocessVarAction(s, 'peek', varmgr) + sLineBreak + 'pop'
  else
  if IsArr(s) then
    Result := Result + sLineBreak + PreprocessArrAction(s, 'peekai', varmgr)
  else
    PrpError('Invalid call "' + bf + '".');
end;


function PushIt(s: string; varmgr: TVarManager): string;
var
  bf: string;
begin
  s := Trim(s);
  bf := s;
  Result := '';
  if Copy(s, 1, 1)[1] in ['@', '?'] then
    Delete(s, 1, 1);
  if IsVar(s) then
    Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
  else
  if IsConst(s) then
    Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
  else
  if IsArr(s) then
    Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
  else
  if pos('(', s) > 0 then //calling
  begin
    if (ProcList.IndexOf(TryToGetProcName(s)) <> -1) or
      (ImportsLst.IndexOf(TryToGetProcName(s)) <> -1) then
    begin
      if pos('(', s) > 0 then
      begin
        Result := Result + sLineBreak + PreprocessCall(s, varmgr);
        s := GetProcName(Trim(s));
      end;

      s := Trim(s);

      Result := Result + sLineBreak + 'pushc ' + GetConst('!' + s) +
        sLineBreak + 'gpm' + sLineBreak;
      if ProcList.IndexOf(s) <> -1 then
        Result := Result + 'jc'
      else
        Result := Result + 'invoke';
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
  if IsVar(s) then
    Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr) + sLineBreak +
              'copy' + sLineBreak + 'gpm' + sLineBreak + 'swp' + sLineBreak + 'pop'
  else
  if IsConst(s) then
    Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
  else
  if IsArr(s) then
    Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr) + sLineBreak +
              'copy' + sLineBreak + 'gpm' + sLineBreak + 'swp' + sLineBreak + 'pop'
  else
  if pos('(', s) > 0 then //calling
  begin
    if (ProcList.IndexOf(TryToGetProcName(s)) <> -1) or
      (ImportsLst.IndexOf(TryToGetProcName(s)) <> -1) then
    begin
      if pos('(', s) > 0 then
      begin
        Result := Result + sLineBreak + PreprocessCall(s, varmgr);
        s := GetProcName(Trim(s));
      end;

      s := Trim(s);

      Result := Result + sLineBreak + 'pushc ' + GetConst('!' + s) +
        sLineBreak + 'gpm' + sLineBreak;
      if ProcList.IndexOf(s) <> -1 then
        Result := Result + 'jc'
      else
        Result := Result + 'invoke';
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

    if (not in_str) and (in_br <= 0) and (in_rbr <= 0) then
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
          sLineBreak + TempPushIt(TokensStack[c - 1], varmgr) + sLineBreak +
          'mul' + sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr) + sLineBreak + 'pop';
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
          sLineBreak + TempPushIt(TokensStack[c - 1], varmgr) + sLineBreak +
          'div' + sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr) + sLineBreak + 'pop';
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
          sLineBreak + TempPushIt(TokensStack[c - 1], varmgr) + sLineBreak +
          'mod' + sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr) + sLineBreak + 'pop';
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
          sLineBreak + TempPushIt(TokensStack[c - 1], varmgr) + sLineBreak +
          'idiv' + sLineBreak + 'peek ' + GetVar('$' + Bf, varmgr) + sLineBreak + 'pop';
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
          sLineBreak + 'land'{ + sLineBreak + 'gpm'};
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = 'or') then
      begin
        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr) +
          sLineBreak + 'lor'{ + sLineBreak + 'gpm'};
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = 'xor') then
      begin
        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr) +
          sLineBreak + 'swp' + sLineBreak + 'lxor'{ + sLineBreak + 'gpm'};
        TokensStack.Delete(0);
        TokensStack.Delete(0);
      end
      else
      if (TokensStack[0] = 'not') then
      begin
        Result := Result + sLineBreak + PushIt(TokensStack[1], varmgr) +
          sLineBreak + 'lnot'{ + sLineBreak + 'gpm'};
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

function IsEqExpr(s: string): boolean;
var
  Bf: string;
begin
  Result := False;
  if IsExpr(s) then
  begin
    Bf := Trim(CutNextExprToken(s));
    s := Trim(s);
    if IsVar(Bf) or IsArr(Bf) then
     begin
       Bf := Trim(GetNextExprOp(s));
       Result := (Bf = '=') or (Bf = '?=') or (Bf = '@=');
     end;
  end;
end;

function ParseEqExpr(s: string; varmgr: TVarManager): string;
var
  Bf, Op: string;
begin
  Result := '';
  Bf := Trim(CutNextExprToken(s));
  s := Trim(s);
  Op := CutNextExprOp(s);
  s := Trim(s);
  if Op = '=' then
  begin
    if IsOpNew(s) then
      Result := PreprocessOpNew(s, varmgr) + sLineBreak + PopIt(Bf, varmgr)
    else
    if IsExpr(s) then
      Result := PreprocessExpression(s, varmgr) + sLineBreak + PushIt(Bf, varmgr) + sLineBreak + 'mov'
    else
      Result := PushIt(s, varmgr) + sLineBreak + PushIt(Bf, varmgr) + sLineBreak + 'mov';
  end
  else
  if Op = '@=' then
  begin
    if IsExpr(s) then
      Result := PreprocessExpression(s, varmgr) + sLineBreak + PushIt(Bf, varmgr) + sLineBreak + 'movbp'
    else
      Result := PushIt(s, varmgr) + sLineBreak + PushIt(Bf, varmgr) + sLineBreak + 'movbp';
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
      Result := PushIt(s, varmgr) + sLineBreak + PopIt(Bf, varmgr);
  end;
end;

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
  IfNum: string;
begin
  Delete(s, 1, 2);
  Delete(s, Length(s), 1);
  s := Trim(s);
  IfNum := '__gen_if_' + IntToStr(IfBlCounter);
  Inc(IfBlCounter);
  Result := 'pushc ' + IfNum + '_end' + sLineBreak + 'gpm' + sLineBreak +
    PreprocessExpression(s, varmgr) + sLineBreak +
    'jz' + sLineBreak + 'pop';
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
      Result := 'pushc ' + CB.bMCode + sLineBreak + 'gpm' + sLineBreak +
        'jp' + sLineBreak + CB.bEndCode + ':';
      CB.bMeta := '+';
    end
    else
      PrpError('Using operator "else" without "if".');
  end
  else
    PrpError('Using operator "else" without "if".');
end;

function GenEnd: string;
var
  CB: TCodeBlock;
begin
  Result := '';
  if BlockStack.Count > 0 then
  begin
    CB := TCodeBlock(BlockStack[BlockStack.Count - 1]);
    case CB.bType of
      btProc:
      begin
        Result := CB.bEndCode + ':' + sLineBreak + 'jr';
      end;
      btFunc:
      begin
        Result := CB.bEndCode + ':' + sLineBreak + 'jr';
        if CB.bMeta <> '+' then
          PrpError('Declarate function without return.');
      end;
      btIf:
      begin
        if CB.bMeta = '-' then
          Result := CB.bEndCode + ':'
        else
          Result := CB.bMCode + ':';
      end;
      btFor:
      begin
        Result := CB.bMCode;
      end;
      btWhile:
      begin
        Result := CB.bMCode;
      end;
      btUntil:
      begin
        Result := CB.bMCode;
      end;
      btTry:
      begin
        case CB.bMeta[1] of
          '-':
          begin
            Result := CB.bMCode + sLineBreak + 'pop' + sLineBreak +
              CB.bEndCode + ':';
            PrpWarn('Using <try ... end> constructions.');
          end;
          'c': Result := CB.bEndCode + ':';
          'f': Result := '';
        end;
      end
      else
        PrpError('Using operator "end" for not supported block.');
    end;
    TCodeBlock(BlockStack[BlockStack.Count - 1]).Free;
    BlockStack.Delete(BlockStack.Count - 1);
  end
  else
    PrpError('Using operator "end" without openning any code block.');
end;

function GetCurrentMethodName: string;
var
  CB: TCodeBlock;
  i: integer;
begin
  i := 1;
  Result := 'global code';
  if BlockStack.Count > 0 then
    repeat
      CB := TCodeBlock(BlockStack[BlockStack.Count - i]);
      if CB.bType in [btFunc, btProc] then
      begin
        Result := CB.mName;
        break;
      end;
      Inc(i);
    until BlockStack.Count - i = 0;
end;

function GenBreak: string;
var
  CB: TCodeBlock;
  i: integer;
begin
  i := 1;
  Result := '';
  if BlockStack.Count > 0 then
  begin
    if TCodeBlock(BlockStack[BlockStack.Count - 1]).bType = btTry then
    begin
      Result := 'trs';
      PrpWarn('Exiting from critical block using break operator.');
    end
    else
    begin
      repeat
        CB := TCodeBlock(BlockStack[BlockStack.Count - i]);
        if CB.bType in [btFor, btWhile, btUntil] then
        begin
          Result := 'pushc ' + CB.bEndCode + sLineBreak + 'gpm' + sLineBreak + 'jp';
          break;
        end;
        Inc(i);
      until BlockStack.Count - i = 0;
      if Result = '' then
      begin
        CB := TCodeBlock(BlockStack[BlockStack.Count - 1]);
        Result := 'pushc ' + CB.bEndCode + sLineBreak + 'gpm' + sLineBreak + 'jp';
      end;

    end;
  end
  else
    PrpError('Using operator "break" without openning any code block.');
end;

function GenReturn(s: string; varmgr: TVarManager): string;
var
  CB: TCodeBlock;
  i: integer;
begin
  i := 1;
  Result := '';
  if BlockStack.Count > 0 then
  begin
    repeat
      CB := TCodeBlock(BlockStack[BlockStack.Count - i]);
      if CB.bType = btFunc then
      begin
        if IsExpr(s) then
          Result := PreprocessExpression(s, varmgr)
        else
          Result := PushIt(s, varmgr);
        Result := Result + sLineBreak + 'jr';
        CB.bMeta := '+';
        break;
      end;
      Inc(i);
    until BlockStack.Count - i = -1;
    if Result = '' then
      PrpError('Using return outside a function.');
  end
  else
    PrpError('Using return outside a function.');
end;

function IsFor(s: string): boolean;
begin
  Result := False;
  if Length(s) > 3 then
    if copy(s, 1, 3) = 'for' then
    begin
      Delete(s, 1, 3);
      if Length(s) > 0 then
        Result := ((s[1] = ' ') or (s[1] = '(')) and (s[Length(s)] = ':');
    end;
end;

function IsOpNew(s:string): boolean;
begin
  Result := False;
  s := Trim(s);
  if s = 'new' then
   Result := True
  else
  if (Copy(s, 1, 3) = 'new') and (Copy(s, 4, 4)[1] in [' ', '[', ',']) then
   Result := True;
end;

function PreprocessOpNew(s:string; varmgr:TVarManager): string;
var
  lvl, i: integer;
  bf: string;
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
        Result := Result + sLineBreak + PushIt(IntToStr(lvl), varmgr) + sLineBreak + 'newa';
      end
     else
     if s[1] = ',' then
      begin
        //$x = new, <value>
        Delete(s,1,1);
        s := Trim(s);
        Result := Result + sLineBreak + 'new' + sLineBreak + 'pcopy';
        if IsExpr(s) then
         Result := Result + sLineBreak + PreprocessExpression(s, varmgr)
        else
         Result := Result + sLineBreak + PushIt(s, varmgr);
        Result := Result + sLineBreak + 'swp' + sLineBreak + 'mov';
        writeln(Result);
      end
     else
      begin //for classes...

      end;
   end;
end;

function CutNextForArg(var s: string): string;
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
      if s[1] = ';' then
      begin
        Delete(s, 1, 1);
        break;
      end;
    end;

    Result := Result + s[1];
    Delete(s, 1, 1);
  end;
end;

function ParseFor(s: string; varmgr: TVarManager): string;
var
  ForNum: string;
  Defs, Expr, Ops: string;
begin
  Delete(s, 1, 3);
  Delete(s, Length(s), 1);
  s := Trim(s);
  Delete(s, 1, 1);         // (
  Delete(s, Length(s), 1); // )
  Defs := Trim(CutNextForArg(s));
  Expr := Trim(CutNextForArg(s));
  Ops := Trim(CutNextForArg(s));
  ForNum := '__gen_for_' + IntToStr(ForBlCounter);
  Inc(ForBlCounter);
  Result := PreprocessStr(Defs, varmgr) + sLineBreak + 'pushc ' +
    ForNum + '_expression_check' + sLineBreak + 'gpm' + sLineBreak +
    'gpm' + sLineBreak + 'jp' + sLineBreak + ForNum + ':';
  BlockStack.Add(TCodeBlock.Create(btFor, '', PreprocessStr(Ops, varmgr) +
    sLineBreak + ForNum + '_expression_check:' + sLineBreak + 'pushc ' +
    ForNum + sLineBreak + 'gpm' + sLineBreak + PreprocessExpression(Expr, varmgr) +
    sLineBreak + 'jn' + sLineBreak + ForNum + '_end:', ForNum + '_end'));
end;

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
  WhileNum: string;
begin
  Delete(s, 1, 5);
  Delete(s, Length(s), 1);
  s := Trim(s);
  WhileNum := '__gen_while_' + IntToStr(WhileBlCounter);
  Inc(WhileBlCounter);
  Result := WhileNum + ':' + sLineBreak + 'pushc ' + WhileNum + '_end' +
    sLineBreak + 'gpm' + sLineBreak + PreprocessExpression(s, varmgr) +
    sLineBreak + 'jz' + sLineBreak + 'pop';
  BlockStack.Add(TCodeBlock.Create(btWhile, '', 'pushc ' + WhileNum +
    sLineBreak + 'gpm' + sLineBreak + 'jp' + sLineBreak + WhileNum +
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
  UntilNum: string;
begin
  Delete(s, 1, 5);
  Delete(s, Length(s), 1);
  s := Trim(s);
  UntilNum := '__gen_until_' + IntToStr(UntilBlCounter);
  Inc(UntilBlCounter);
  Result := UntilNum + ':';
  BlockStack.Add(TCodeBlock.Create(btUntil, '', 'pushc ' + UntilNum +
    sLineBreak + 'gpm' + sLineBreak + PreprocessExpression(s, varmgr) +
    sLineBreak + 'jz' + sLineBreak + 'pop' + sLineBreak + UntilNum +
    '_end:', UntilNum + '_end'));
end;

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
  Result := 'pushc ' + TryNum + '_finally' + sLineBreak + 'gpm' +
    sLineBreak + 'pushc ' + TryNum + '_catch' + sLineBreak + 'gpm' +
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
      Result := s = 'catch';
    end;
end;

function GenCatch: string;
var
  CB: TCodeBlock;
begin
  if BlockStack.Count > 0 then
  begin
    CB := TCodeBlock(BlockStack[BlockStack.Count - 1]);
    if CB.bType = btTry then
    begin
      Result := CB.bMCode;
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

function CutNextArg(var s: string): string;
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
      if s[1] = ',' then
      begin
        Delete(s, 1, 1);
        break;
      end;
    end;

    Result := Result + s[1];
    Delete(s, 1, 1);
  end;
end;

function TryToGetProcName(s: string): string;
begin
  Result := '';
  if pos('(', s) > 0 then
  begin
    Delete(s, pos('(', s), length(s));
    if length(s) > 0 then
      if s[1] in ['$', '!'] then
        Delete(s, 1, 1);
    Result := s;
  end;
end;

function PreprocessCall(s: string; varmgr: TVarManager): string;
var
  bf: string;
  cnt: word;
begin
  Result := '';
  Delete(s, 1, pos('(', s));
  s := ReverseString(s);
  Delete(s, 1, pos(')', s));
  s := ReverseString(s);
  cnt := 0;
  while length(s) > 0 do
  begin
    bf := '';
    if pos(',', s) > 0 then
    begin
      s := Trim(ReverseString(s));
      bf := Trim(ReverseString(CutNextArg(s)));
      s := Trim(ReverseString(s));
    end
    else
    begin
      bf := Trim(s);
      s := '';
    end;
    if IsExpr(Bf) then
      Result := Result + sLineBreak + PreprocessExpression(Bf, varmgr)
    else
      Result := Result + sLineBreak + PushIt(Bf, varmgr);
    Inc(cnt);
  end;
end;

function IsLabel(s: string): boolean;
begin
  Result := False;
  if Copy(s, Length(s), 1) = ':' then
  begin
    Delete(s, Length(s), 1);
    Result := CheckName(s);
  end;
end;

function GetLabelName(s: string): string;
begin
  Delete(s, Length(s), 1);
  Result := s;
end;

procedure PreprocessDefinitions(s: string);
var
  sl: TStringList;
  c: cardinal;
  s1: string;
begin
  {** Include **}
  if Tk(s, 1) = 'uses' then
  begin
    Delete(s, 1, length('uses'));
    s := Trim(s);
    case s[1] of
      '"':
      begin
        Delete(s, 1, 1);
        if pos('"', s) <> Length(s) then
          PrpError('Invalid construction: "uses "' + s + '".');
        Delete(s, length(s), 1);
        s := ExtractFilePath(ParamStr(1)) + s;
        if not FileExists(s) then
          PrpError('File "' + s + '" not found.');
        if IncludedFiles.IndexOf(s) = -1 then
        begin
          IncludedFiles.Add(s);
          sl := TStringList.Create;
          sl.LoadFromFile(s);
          if sl.Count > 0 then
          begin
            IncludedFiles.Add(s);
            for c := 0 to sl.Count - 1 do
              sl[c] := TrimCodeStr(sl[c]);
            for c := 0 to sl.Count - 1 do
              PreprocessDefinitions(sl[c]);
          end;
          FreeAndNil(sl);
        end;
      end;
      '<':
      begin
        Delete(s, 1, 1);
        if pos('>', s) <> Length(s) then
          PrpError('Invalid construction: "uses <' + s + '".');
        Delete(s, length(s), 1);
        s := ExtractFilePath(ParamStr(0)) + 'inc\' + s;
        if not FileExists(s) then
          PrpError('File "' + s + '" not found.');
        if IncludedFiles.IndexOf(s) = -1 then
        begin
          IncludedFiles.Add(s);
          sl := TStringList.Create;
          sl.LoadFromFile(s);
          if sl.Count > 0 then
          begin
            for c := 0 to sl.Count - 1 do
              sl[c] := TrimCodeStr(sl[c]);
            for c := 0 to sl.Count - 1 do
              PreprocessDefinitions(sl[c]);
          end;
          FreeAndNil(sl);
        end;
      end;
      else
        PrpError('Invalid construction: "uses ' + s + '".');
    end;
  end
  else
  if IsProc(s) then
  begin
    Delete(s, 1, 4);
    s := Trim(s);
    s1 := GetProcName(Trim(s));
    if ProcList.IndexOf(s1) = -1 then
      ProcList.Add(s1);
    if ConstDefs.IndexOf(s1) = -1 then
      ConstDefs.Add(s1);
  end
  else
  if Tk(s, 1) = 'import' then
    ImportsLst.Add(Tk(s, 2))
  else
  if Tk(s, 1) = 'int' then
    ConstDefs.Add(Tk(s, 2))
  else
  if Tk(s, 1) = 'word' then
    ConstDefs.Add(Tk(s, 2))
  else
  if Tk(s, 1) = 'real' then
    ConstDefs.Add(Tk(s, 2))
  else
  if Tk(s, 1) = 'str' then
    ConstDefs.Add(Tk(s, 2))
  else
  if Tk(s, 1) = 'stream' then
    ConstDefs.Add(Tk(s, 2))
  else
  if IsLabel(s) then
    ConstDefs.Add(GetLabelName(s));
end;

function PreprocessStr(s: string; varmgr: TVarManager): string;
var
  sl: TStringList;
  c: cardinal;
  s1: string;
begin
  Result := '';
  {** Include **}
  if Tk(s, 1) = 'uses' then
  begin
    Delete(s, 1, length('uses'));
    s := Trim(s);
    case s[1] of
      '"':
      begin
        Delete(s, 1, 1);
        if pos('"', s) <> Length(s) then
          PrpError('Invalid construction: "uses "' + s + '".');
        Delete(s, length(s), 1);
        s := ExtractFilePath(ParamStr(1)) + s;
        if not FileExists(s) then
          PrpError('File "' + s + '" not found.');
        sl := TStringList.Create;
        sl.LoadFromFile(s);
        if sl.Count > 0 then
        begin
          for c := 0 to sl.Count - 1 do
            sl[c] := TrimCodeStr(sl[c]);
          for c := 0 to sl.Count - 1 do
            sl[c] := PreprocessStr(sl[c], varmgr);
          for c := sl.Count - 1 downto 0 do
            if trim(sl[c]) = '' then
              sl.Delete(c);
        end;
        Result := sl.Text + sLineBreak;
        FreeAndNil(sl);
      end;
      '<':
      begin
        Delete(s, 1, 1);
        if pos('>', s) <> Length(s) then
          PrpError('Invalid construction: "uses <' + s + '".');
        Delete(s, length(s), 1);
        s := ExtractFilePath(ParamStr(0)) + 'inc\' + s;
        if not FileExists(s) then
          PrpError('File "' + s + '" not found.');
        if IncludedFiles.IndexOf(s) = -1 then
        begin
          IncludedFiles.Add(s);
          sl := TStringList.Create;
          sl.LoadFromFile(s);
          if sl.Count > 0 then
          begin
            for c := 0 to sl.Count - 1 do
              sl[c] := TrimCodeStr(sl[c]);
            for c := 0 to sl.Count - 1 do
              sl[c] := PreprocessStr(sl[c], varmgr);
            for c := sl.Count - 1 downto 0 do
              if trim(sl[c]) = '' then
                sl.Delete(c);
          end;
          Result := sl.Text + sLineBreak;
          FreeAndNil(sl);
        end;
      end;
      else
        PrpError('Invalid construction: "uses ' + s + '".');
    end;
  end
  else
  {** RegAPI **}
  if Tk(s, 1) = 'regapi' then
  begin
    Delete(s, 1, length('regapi'));
    s := Trim(s);
    Result := 'word ' + s + IntToStr(RgAPICnt);
    Inc(RgAPICnt);
  end
  else
  {** Var **}
  if Tk(s, 1) = 'var' then
  begin
    Delete(s, 1, length('var'));
    s := Trim(s);
    Result := PreprocessVarDefines(s, varmgr);
  end
  else
  {** Proc/Func **}
  if IsProc(s) then
  begin
    Result := PreprocessProc(s, varmgr);
  end
  else
  if tk(s, 1) = 'return' then
  begin
    Delete(s, 1, 6);
    s := Trim(s);
    Result := GenReturn(s, varmgr);
  end
  else
  {** For **}
  if IsFor(s) then
    Result := ParseFor(s, varmgr)
  else
  {** While **}
  if IsWhile(s) then
    Result := ParseWhile(s, varmgr)
  else
  {** Until **}
  if IsUntil(s) then
    Result := ParseUntil(s, varmgr)
  else
  {** If **}
  if IsIf(s) then
    Result := ParseIf(s, varmgr)
  else
  {** Else **}
  if IsElse(s) then
    Result := GenElse
  else
  {** End **}
  if s = 'end' then
    Result := GenEnd
  else
  {** Break **}
  if s = 'break' then
    Result := GenBreak
  else
  {** Try **}
  if IsTry(s) then
    Result := GenTry
  else
  {** Catch **}
  if IsCatch(s) then
    Result := GenCatch
  else
  {** Finally **}
  if IsFinally(s) then
    Result := GenFinally
  else
  if tk(s, 1) = 'raise' then
  begin
    Delete(s, 1, 5);
    s := Trim(s);
    Result := GenRaise(s, varmgr);
  end
  else
  {** Endp **}
  if Tk(s, 1) = 'endp' then
  begin
    Delete(s, 1, length('endp'));
    s := ProcEnterList[ProcEnterList.Count - 1] + '.';
    if ProcEnterList.Count > 0 then
    begin
      if Pos(s, LocalVarPref) > 0 then
        Delete(LocalVarPref, Pos(s, LocalVarPref), Length(s));
    end
    else
      PrpError('Invalid endp ...');
    Result := 'jr';
  end
  else
  if Tk(s, 1) = 'super' then
  begin
    Result := 'pushc super.' + Tk(s, 2) + sLineBreak + 'gpm' + sLineBreak + 'jc';
  end
  else
  if Tk(s, 1) = 'store' then
  begin
    Delete(s, 1, length('store'));
    s := Trim(s);
    if s = '!null' then
      Result := 'pushn'
    else
    if IsVar(s) then
      Result := PreprocessVarAction(s, 'push', varmgr)
    else
    if IsConst(s) then
      Result := 'pushc ' + GetConst(s)
    else
    if IsArr(s) then
      Result := PreprocessArrAction(s, 'pushai', varmgr)
    else
      PrpError('Invalid store operation with "' + s + '".');
    Result := Result + sLineBreak + 'pushc store' + sLineBreak +
      'gpm' + sLineBreak + 'jc';
  end
  else
  if Tk(s, 1) = 'load' then
  begin
    Delete(s, 1, length('load'));
    s := Trim(s);
    if s = '!null' then
      PrpError('Invalid load operation with null.')
    else
    if IsVar(s) then
      Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
    else
    if IsConst(s) then
      PrpError('Invalid load operation with constant "' + s + '".')
    else
    if IsArr(s) then
      Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
    else
      PrpError('Invalid load operation with "' + s + '".');
    Result := Result + sLineBreak + 'pushc load' + sLineBreak +
      'gpm' + sLineBreak + 'jc';
  end
  else
  {** Check imports for fast calling **}
  if Tk(s, 1) = 'import' then
  begin
    Result := s;
  end
  else
  {** Fast Calling **}
  if (ProcList.IndexOf(TryToGetProcName(s)) <> -1) or
    (ImportsLst.IndexOf(TryToGetProcName(s)) <> -1) then
  begin
    if pos('(', s) > 0 then
    begin
      Result := PreprocessCall(s, varmgr);
      s := GetProcName(Trim(s));
    end;

    s := Trim(s);

    Result := Result + sLineBreak + 'pushc ' + GetConst('!' + s) +
      sLineBreak + 'gpm' + sLineBreak;
    if ProcList.IndexOf(s) <> -1 then
      Result := Result + 'jc'
    else
      Result := Result + 'invoke';
  end
  else
  if IsEqExpr(s) then
  begin
    Result := Result + sLineBreak + ParseEqExpr(s, varmgr);
  end
  else
  {** Anything **}
  if (pos('$', s) > 0) or (pos('!', s) > 0) or (pos(',', s) > 0) or
    (pos('.', s) > 0) or (pos(' ', s) > 0) then
  begin
    // push $a
    // push $a[expr 1][expr 2]..[expr n]
    if Tk(s, 1) = 'push' then
    begin
      Delete(s, 1, length('push'));
      s := Trim(s);
      if s = '!null' then
        Result := 'pushn'
      else
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        Result := 'pushc ' + GetConst(s)
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr);
    end
    else
    if Tk(s, 1) = 'call' then
    begin
      Delete(s, 1, length('call'));
      if pos('(', s) > 0 then
      begin
        Result := PreprocessCall(s, varmgr);
        s := GetProcName(Trim(s));
      end;
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr)
      else
        PrpError('Invalid call "' + s + '".');
      Result := Result + sLineBreak + 'jc';
    end
    else
    if Tk(s, 1) = 'invoke' then
    begin
      Delete(s, 1, length('invoke'));
      if pos('(', s) > 0 then
      begin
        Result := PreprocessCall(s, varmgr);
        s := GetProcName(Trim(s));
      end;
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr)
      else
        PrpError('Invalid call "' + s + '".');
      Result := Result + sLineBreak + 'invoke';
    end
    else
    if Tk(s, 1) = 'jump' then
    begin
      Delete(s, 1, length('jump'));
      if pos('(', s) > 0 then
      begin
        Result := PreprocessCall(s, varmgr);
        s := GetProcName(Trim(s));
      end;
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr)
      else
        PrpError('Invalid call "' + s + '".');
      Result := Result + sLineBreak + 'jp';
    end
    else
    if Tk(s, 1) = 'try' then
    begin
      Delete(s, 1, length('try'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s1) + sLineBreak + 'gpm'
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Try operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Try operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'tr';
      end
      else
      if s = 'end' then
        Result := 'trs'
      else
        PrpError('Try operation -> "try ' + s + '"');
    end
    else
    if Tk(s, 1) = 'raise' then
    begin
      Delete(s, 1, length('push'));
      s := Trim(s);
      if s = '!null' then
        Result := 'pushn'
      else
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        Result := 'pushc ' + GetConst(s)
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr);
      Result := Result + 'trr';
    end
    else
    if Tk(s, 1) = 'jz' then
    begin
      Delete(s, 1, length('jz'));
      if pos('(', s) > 0 then
      begin
        Result := PreprocessCall(s, varmgr);
        s := GetProcName(Trim(s));
      end;
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr)
      else
        PrpError('Invalid call "' + s + '".');
      Result := Result + sLineBreak + 'swp';
      Result := Result + sLineBreak + 'jz';
      Result := Result + sLineBreak + 'pop';
    end
    else
    if Tk(s, 1) = 'jn' then
    begin
      Delete(s, 1, length('jn'));
      if pos('(', s) > 0 then
      begin
        Result := PreprocessCall(s, varmgr);
        s := GetProcName(Trim(s));
      end;
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr)
      else
        PrpError('Invalid call "' + s + '".');
      Result := Result + sLineBreak + 'swp';
      Result := Result + sLineBreak + 'jn';
      Result := Result + sLineBreak + 'pop';
    end
    else
    if Tk(s, 1) = 'peek' then
    begin
      Delete(s, 1, length('peek'));
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'peek', varmgr)
      else
      if IsConst(s) then
        PrpError('Peek in constant value "' + s + '".')
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'peekai', varmgr)
      else
        PrpError('Peek in "' + s + '"');
    end
    else
    if Tk(s, 1) = 'pop' then
    begin
      Delete(s, 1, length('pop'));
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'peek', varmgr)
      else
      if IsConst(s) then
        PrpError('Pop in constant value "' + s + '".')
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'peekai', varmgr)
      else
        PrpError('Pop in "' + s + '"');
      Result := Result + sLineBreak + 'pop';
    end
    else
    if Tk(s, 1) = 'new' then
    begin
      Delete(s, 1, length('new'));
      s := Trim(s);
      Result := 'new';
      if IsVar(s) then
        Result := Result + sLineBreak + PreprocessVarAction(s, 'peek', varmgr)
      else
      if IsConst(s) then
        PrpError('Allocate memory and peek it in constant value "' + s + '".')
      else
      if IsArr(s) then
        Result := Result + sLineBreak + PreprocessArrAction(s, 'peekai', varmgr)
      else
        PrpError('New "' + s + '"');
      Result := Result + sLineBreak + 'pop';
    end
    else
    if Tk(s, 1) = 'gpm' then
    begin
      Delete(s, 1, length('gpm'));
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        PrpError('Trying to mark constant value as waste "' + s + '".')
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr)
      else
        PrpError('Gpm "' + s + '"');
      Result := Result + sLineBreak + 'gpm';
      Result := Result + sLineBreak + 'pop';
    end
    else
    if Tk(s, 1) = 'rem' then
    begin
      Delete(s, 1, length('rem'));
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        PrpError('Trying to free memory from constant value "' + s + '".')
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr)
      else
        PrpError('Rem "' + s + '"');
      Result := Result + sLineBreak + 'rem';
    end
    else
    if Tk(s, 1) = 'neg' then
    begin
      Delete(s, 1, length('neg'));
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        PrpError('Neg constant value "' + s + '".')
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr)
      else
        PrpError('Neg "' + s + '"');
      Result := Result + sLineBreak + 'neg';
      Result := Result + sLineBreak + 'pop';
    end
    else
    if Tk(s, 1) = 'inc' then
    begin
      Delete(s, 1, length('inc'));
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        PrpError('Inc constant value "' + s + '".')
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr)
      else
        PrpError('Inc "' + s + '"');
      Result := Result + sLineBreak + 'inc';
      Result := Result + sLineBreak + 'pop';
    end
    else
    if Tk(s, 1) = 'dec' then
    begin
      Delete(s, 1, length('dec'));
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        PrpError('Dec constant value "' + s + '".')
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr)
      else
        PrpError('Dec "' + s + '"');
      Result := Result + sLineBreak + 'dec';
      Result := Result + sLineBreak + 'pop';
    end
    else
    if Tk(s, 1) = 'add' then
    begin
      Delete(s, 1, length('add'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('Add operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Add operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Add operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'add';
        Result := Result + sLineBreak + 'pop';
      end;
    end
    else
    if Tk(s, 1) = 'eq' then
    begin
      Delete(s, 1, length('eq'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s1) + sLineBreak + 'gpm'
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Eq operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Eq operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'eq';
        Result := Result + sLineBreak + 'gpm';
      end;
    end
    else
    if Tk(s, 1) = 'bg' then
    begin
      Delete(s, 1, length('bg'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s1) + sLineBreak + 'gpm'
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Bg operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Eq operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'bg';
        Result := Result + sLineBreak + 'gpm';
      end;
    end
    else
    if Tk(s, 1) = 'be' then
    begin
      Delete(s, 1, length('be'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s1) + sLineBreak + 'gpm'
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Be operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Eq operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'be';
        Result := Result + sLineBreak + 'gpm';
      end;
    end
    else
    if Tk(s, 1) = 'sub' then
    begin
      Delete(s, 1, length('sub'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('Sub operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Sub operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Sub operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'sub';
        Result := Result + sLineBreak + 'pop';
      end;
    end
    else
    if Tk(s, 1) = 'mul' then
    begin
      Delete(s, 1, length('mul'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('Mul operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Mul operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Mul operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'mul';
        Result := Result + sLineBreak + 'pop';
      end;
    end
    else
    if Tk(s, 1) = 'div' then
    begin
      Delete(s, 1, length('div'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('Div operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Div operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Div operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'div';
        Result := Result + sLineBreak + 'pop';
      end;
    end
    else
    if Tk(s, 1) = 'mod' then
    begin
      Delete(s, 1, length('mod'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('Mod operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Mod operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Mod operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'mod';
        Result := Result + sLineBreak + 'pop';
      end;
    end
    else
    if Tk(s, 1) = 'idiv' then
    begin
      Delete(s, 1, length('idiv'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('Idiv operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Idiv operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Idiv operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'idiv';
        Result := Result + sLineBreak + 'pop';
      end;
    end
    else
    if Tk(s, 1) = 'mov' then
    begin
      Delete(s, 1, length('mov'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('Mov operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Mov operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Mov operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'mov';
      end;
    end
    else
    if Tk(s, 1) = 'movl' then
    begin
      Delete(s, 1, length('movl'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          PrpError('Movl operation not intended to constants -> "' + s + '"')
        else
        if IsArr(s) then
          Result := PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Movl operation -> "' + s1 + '".');
        if IsVar(s1) then
          Result := Result + sLineBreak + PreprocessVarAction(s1, 'peek', varmgr) + sLineBreak + 'pop'
        else
        if IsConst(s1) then
          PrpError('Movl operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := Result + sLineBreak + PreprocessArrAction(s1, 'peekai', varmgr)
        else
          PrpError('Movl operation -> "' + s1 + '".');
      end;
    end
    else
    if Tk(s, 1) = 'not' then
    begin
      Delete(s, 1, length('not'));
      s := Trim(s);
      if IsVar(s) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        PrpError('Not constant value "' + s + '".')
      else
      if IsArr(s) then
        Result := PreprocessArrAction(s, 'pushai', varmgr)
      else
        PrpError('Not "' + s + '"');
      Result := Result + sLineBreak + 'not';
      Result := Result + sLineBreak + 'pop';
    end
    else
    if Tk(s, 1) = 'and' then
    begin
      Delete(s, 1, length('and'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('And operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('And operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('And operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'and';
      end;
    end
    else
    if Tk(s, 1) = 'or' then
    begin
      Delete(s, 1, length('or'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('Or operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Or operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Or operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'or';
      end;
    end
    else
    if Tk(s, 1) = 'xor' then
    begin
      Delete(s, 1, length('xor'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('Xor operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Xor operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Xor operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'xor';
      end;
    end
    else
    if Tk(s, 1) = 'shl' then
    begin
      Delete(s, 1, length('shl'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('Shl operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Shl operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Shl operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'shl';
      end;
    end
    else
    if Tk(s, 1) = 'shr' then
    begin
      Delete(s, 1, length('shr'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          PrpError('Shr operation not intended to constants -> "' + s1 + '"')
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Shr operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s) + sLineBreak + 'gpm'
        else
        if IsArr(s) then
          Result := Result + sLineBreak + PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Shr operation -> "' + s + '".');
        Result := Result + sLineBreak + 'swp';
        Result := Result + sLineBreak + 'shr';
      end;
    end
    else
      Result := s;
  end
  else
    Result := s;
end;

procedure InitPreprocessor;
begin
  ImportsLst := TStringList.Create;
  ProcEnterList := TStringList.Create;
  ProcList := TStringList.Create;
  BlockStack := TList.Create;
  ConstDefs := TStringList.Create;
  //VarDefs := TStringList.Create;
end;

procedure FreePreprocessor;
begin
  FreeAndNil(ImportsLst);
  FreeAndNil(ProcEnterList);
  FreeAndNil(ProcList);
  {while BlockStack.Count > 0 do
   begin
     TCodeBlock(BlockStack[0]).Free;
     BlockStack.Delete(0);
   end;}
  if BlockStack.Count > 0 then
    PrpError('One or more code blocks are not completed by the end statement.');

  FreeAndNil(BlockStack);
  FreeAndNil(ConstDefs);
  //FreeAndNil(VarDefs);
end;

end.
