unit u_preprocessor;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  u_global,
  u_globalvars,
  u_variables,
  u_consts,
  u_classes,
  u_writers,
  u_prep_global,
  u_prep_codeblock,
  u_prep_methods,
  u_prep_expressions,
  u_prep_array,
  u_prep_enums,
  u_prep_vardefs,
  u_prep_c_methods,
  u_prep_c_ifelse,
  u_prep_c_global,
  u_prep_c_try,
  u_prep_c_loops,
  u_prep_c_classes,
  u_fast_prep,
  u_prep_switch,
  u_local_variables,
  u_prep_launch;

procedure PreprocessDefinitions(s: string; varmgr: TVarManager);
function PreprocessStr(s: string; varmgr: TVarManager): string;
procedure InitPreprocessor(varmgr: TVarManager);
procedure FreePreprocessor(varmgr: TVarManager);

implementation

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
  Defs := Trim(PreprocessStr(Defs, varmgr));

  Expr := Trim(CutNextForArg(s));
  if IsExpr(Expr) then
    Expr := PreprocessExpression(Expr, varmgr)
  else
    Expr := PushIt(Expr, varmgr);

  Ops := Trim(CutNextForArg(s));
  Ops := Trim(PreprocessStr(Ops, varmgr));
  ForNum := '__gen_for_' + IntToStr(ForBlCounter);
  Inc(ForBlCounter);
  Result := sLineBreak + Defs + sLineBreak + ForNum + ':' + sLineBreak +
    'pushcp ' + ForNum + '_for_end' + sLineBreak +
    Expr + sLineBreak + 'jz' + sLineBreak + 'pop' + sLineBreak;

  BlockStack.Add(TCodeBlock.Create(btFor, '', sLineBreak + Ops +
    sLineBreak + 'pushcp ' + ForNum + sLineBreak + 'jp' + sLineBreak +
    ForNum + '_for_end:' + sLineBreak, ForNum + '_for_end'));
end;


function GenDbgBreakPoint(varmgr: TVarManager): string;
begin
  Result := sLineBreak + PushIt('"' + Current_CodeFile + '"', varmgr) +
            sLineBreak + PushIt(IntToStr(Current_CodeLine), varmgr) +
            sLineBreak + 'dbgbreakpoint';
end;

procedure PreprocessDefinitions(s: string; varmgr: TVarManager);
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
        s := StringReplace(s, '\', CharDirSlash, [rfReplaceAll]);
        s := StringReplace(s, '/', CharDirSlash, [rfReplaceAll]);
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
              sl[c] := FastPrep(TrimCodeStr(sl[c]));

            PrepLines(sl);

            for c := 0 to sl.Count - 1 do
              PreprocessDefinitions(sl[c], varmgr);
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
        s := StringReplace(s, '\', CharDirSlash, [rfReplaceAll]);
        s := StringReplace(s, '/', CharDirSlash, [rfReplaceAll]);
        s := ExtractFilePath(ParamStr(0)) + 'inc\' + s;
        if not FileExists(s) then
         begin
           if FileExists(s + '.mash') then
            s := s + '.mash'
           else
           if FileExists(s + '.inc') then
            s := s + '.inc'
           else
           if FileExists(s + '.h') then
            s := s + '.h'
           else
           PrpError('File "' + s + '" not found.');
         end;
        if IncludedFiles.IndexOf(s) = -1 then
        begin
          IncludedFiles.Add(s);
          sl := TStringList.Create;
          sl.LoadFromFile(s);
          if sl.Count > 0 then
          begin
            for c := 0 to sl.Count - 1 do
              sl[c] := FastPrep(TrimCodeStr(sl[c]));

            PrepLines(sl);

            for c := 0 to sl.Count - 1 do
              PreprocessDefinitions(sl[c], varmgr);
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
    if copy(s, 1, 1) <> '!' then
     begin
       s1 := ExtractProcName(GetProcName(Trim(s)));
       if ProcList.IndexOf(s1) = -1 then
        ProcList.Add(s1);
       if ConstDefs.IndexOf(s1) = -1 then
        ConstDefs.Add(s1);
     end;
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
  bfcf: string;
  bfcl: cardinal;
begin
  Result := '';
  s := Trim(s);
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
          PrpError('Invalid construction: "uses <' + s + '".');
        Delete(s, length(s), 1);
        s := StringReplace(s, '\', CharDirSlash, [rfReplaceAll]);
        s := StringReplace(s, '/', CharDirSlash, [rfReplaceAll]);
        s := ExtractFilePath(ParamStr(1)) + s;
        if not FileExists(s) then
          PrpError('File "' + s + '" not found.');
        if IncludedFiles.IndexOf(s) = -1 then
        begin
          IncludedFiles.Add(s);
          sl := TStringList.Create;
          sl.LoadFromFile(s);

          bfcf := Current_CodeFile;
          Current_CodeFile := s;
          bfcl := Current_CodeLine;
          Current_CodeLine := 1;

          if sl.Count > 0 then
          begin
            for c := 0 to sl.Count - 1 do
              sl[c] := PreprocessClassCalls(FastPrep(TrimCodeStr(sl[c])));

            PrepLines(sl);

            for c := 0 to sl.Count - 1 do
              sl[c] := PreprocessStr(sl[c], varmgr);

            for c := sl.Count - 1 downto 0 do
              if trim(sl[c]) = '' then
                sl.Delete(c);
          end;
          Result := sl.Text + sLineBreak;
          FreeAndNil(sl);

          Current_CodeFile := bfcf;
          Current_CodeLine := bfcl;

        end;
      end;
      '<':
      begin
        Delete(s, 1, 1);
        if pos('>', s) <> Length(s) then
          PrpError('Invalid construction: "uses <' + s + '".');
        Delete(s, length(s), 1); 
        s := StringReplace(s, '\', CharDirSlash, [rfReplaceAll]);
        s := StringReplace(s, '/', CharDirSlash, [rfReplaceAll]);
        s := ExtractFilePath(ParamStr(0)) + 'inc\' + s;
        if not FileExists(s) then
         begin
           if FileExists(s + '.mash') then
            s := s + '.mash'
           else
           if FileExists(s + '.inc') then
            s := s + '.inc'
           else
           if FileExists(s + '.h') then
            s := s + '.h'
           else
           PrpError('File "' + s + '" not found.');
         end;
        if IncludedFiles.IndexOf(s) = -1 then
        begin
          IncludedFiles.Add(s);
          sl := TStringList.Create;
          sl.LoadFromFile(s);

          bfcf := Current_CodeFile;
          Current_CodeFile := s;
          bfcl := Current_CodeLine;
          Current_CodeLine := 1;

          if sl.Count > 0 then
          begin
            for c := 0 to sl.Count - 1 do
              sl[c] := PreprocessClassCalls(FastPrep(TrimCodeStr(sl[c])));

            PrepLines(sl);

            for c := 0 to sl.Count - 1 do
              sl[c] := PreprocessStr(sl[c], varmgr);

            for c := sl.Count - 1 downto 0 do
              if trim(sl[c]) = '' then
                sl.Delete(c);
          end;
          Result := sl.Text + sLineBreak;
          FreeAndNil(sl);

          Current_CodeFile := bfcf;
          Current_CodeLine := bfcl;

        end;
      end;
      else
        PrpError('Invalid construction: "uses ' + s + '".');
    end;
  end
  else
  {** Class preprocessing **}
  if IsInClassBlock then
  begin
    Result := PreprocessClassPart(s, varmgr);
  end
  else
  {** Class def **}
  if IsClassDefine(s) then
  begin
    Result := PreprocessClassDefine(s);
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
    {if GetCurrentMethodName = 'global code' then
    begin
      Result := PreprocessVarDefines(s, varmgr, true);
      InitCode.Add(Result);
      Result := '';
    end
    else
    Result := PreprocessVarDefines(s, varmgr);}

    if LocalVarPref = '' then
    begin
      Result := PreprocessVarDefines(s, varmgr, true);
      InitCode.Add(Result);
      Result := '';
    end
    else
    Result := PreprocessVarDefines(s, varmgr);

  end
  else
  {** Proc/Func **}
  if IsProc(s) then
  begin
    Result := PreprocessProc(s, varmgr);
  end
  else
  if copy(s, 1, 6) = 'return' then
  begin
    Delete(s, 1, 6);
    s := Trim(s);
    Result := GenReturn(s, varmgr);
  end
  else
  {** For in **}
  if IsForEach(s) then
    Result := ParseForEach(s, varmgr)
  else
  {** For back **}
  if IsForBack(s) then
    Result := ParseForBack(s, varmgr)
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
  if IsWhilst(s) then
    Result := ParseWhilst(s, varmgr)
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
  {** Switch **}
  if IsSwitch(s) then
    Result := ParseSwitch(s, varmgr)
  else
  {** Case **}
  if IsCase(s) then
    Result := ParseCase(s, varmgr)
  else
  {** Break **}
  if s = 'break' then
    Result := GenBreak
  else
  {** Exit **}
  if s = 'exit' then
    Result := GenExit
  else

  {** Launch **}
  if IsLaunch(s) then
    Result := ParseLaunch(s, varmgr)
  else

  {** Async **}
  if IsAsync(s) then
    Result := ParseAsync(s, varmgr)
  else

  {** Wait **}
  if IsWait(s) then
    Result := ParseWait(s, varmgr)
  else

  {** Safe-call's **}
  if copy(s, 1, 5) = 'safe ' then
   begin
     Delete(s, 1, 5);
     s := Trim(s);
     s1:= PopLocalVariables(varmgr);
     Result := PushLocalVariables(varmgr) +
               PreprocessStr(s, varmgr) +
               s1;
   end
  else
  {** Try **}
  if IsTry(s) then
    Result := GenTry
  else
  {** Catch **}
  if IsCatch(s) then
    Result := GenCatch(s, varmgr)
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
  {** Enum **}
  if IsEnumDef(s) then
    Result := PreprocessEnum(s)
  else
  if Tk(s, 1) = 'super' then
  begin
    Result := 'pushcp super.' + Tk(s, 2) + sLineBreak + 'jc';
  end
  else
  {** Check imports for fast calling **}
  if Tk(s, 1) = 'import' then
   Result := s
  else
  if IsOpNew(s) then
   Result := Result + sLineBreak + PreprocessOpNew(s, varmgr)
  else
  if IsEqExpr(s, varmgr) then
   Result := Result + sLineBreak + ParseEqExpr(s, varmgr)
  else
  {** Fast Calling **}
  if (Length(GetProcName(s)) > 0) and
     (CheckName(GetProcName(s)) or IsArr(s)) then
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
     Result := Result + sLineBreak + 'pushcp ' + GetConst('!'+s, varmgr);

    if (ProcList.IndexOf(s) <> -1) or IsArr(s) then
      Result := Result + sLineBreak + 'jc'
    else
      Result := Result + sLineBreak + 'invoke';
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
      if s = 'null' then
        Result := 'pushn'
      else
        Result := PushIt(s, varmgr);
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
      Result := TempPushIt(s, varmgr) + sLineBreak + 'jc';
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
      Result := TempPushIt(s, varmgr) + sLineBreak + 'invoke';
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
      Result := TempPushIt(s, varmgr) + sLineBreak + 'jp';
    end
    else
    if Tk(s, 1) = 'try' then
    begin
      Delete(s, 1, length('try'));
      s := Trim(s);
      if pos(',', s) > 0 then
      begin
        s1 := copy(s, 1, pos(',', s) - 1);
        if IsVar(s1, varmgr) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s1, varmgr) + sLineBreak + 'gpm'
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Try operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
      if IsVar(s, varmgr) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        Result := 'pushc ' + GetConst(s, varmgr)
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
      if IsVar(s, varmgr) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
      if IsVar(s, varmgr) then
        Result := PreprocessVarAction(s, 'push', varmgr)
      else
      if IsConst(s) then
        Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
      if IsVar(s, varmgr) then
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
      if IsVar(s, varmgr) then
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
      if IsVar(s, varmgr) then
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
      if IsVar(s, varmgr) then
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
      if IsVar(s, varmgr) then
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
      if IsVar(s, varmgr) then
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
      if IsVar(s, varmgr) then
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
      if IsVar(s, varmgr) then
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s1, varmgr) + sLineBreak + 'gpm'
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Eq operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s1, varmgr) + sLineBreak + 'gpm'
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Bg operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
          Result := PreprocessVarAction(s1, 'push', varmgr)
        else
        if IsConst(s1) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s1, varmgr) + sLineBreak + 'gpm'
        else
        if IsArr(s1) then
          Result := PreprocessArrAction(s1, 'pushai', varmgr)
        else
          PrpError('Be operation -> "' + s1 + '".');
        Delete(s, 1, pos(',', s));
        s := Trim(s);
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s, varmgr) then
          Result := PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          PrpError('Movl operation not intended to constants -> "' + s + '"')
        else
        if IsArr(s) then
          Result := PreprocessArrAction(s, 'pushai', varmgr)
        else
          PrpError('Movl operation -> "' + s1 + '".');
        if IsVar(s1, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s1, 'peek', varmgr) +
            sLineBreak + 'pop'
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
      if IsVar(s, varmgr) then
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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
        if IsVar(s1, varmgr) then
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
        if IsVar(s, varmgr) then
          Result := Result + sLineBreak + PreprocessVarAction(s, 'push', varmgr)
        else
        if IsConst(s) then
          Result := Result + sLineBreak + 'pushc ' + GetConst(s, varmgr) + sLineBreak + 'gpm'
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

  if (Length(Trim(Result)) > 0) and Debug_Enable then
   begin
     Result := Result + GenDbgBreakPoint(varmgr);
   end;
end;

procedure InitPreprocessor(varmgr: TVarManager);
var
  cn:TConstant;
begin
  ImportsLst := TStringList.Create;
  ProcEnterList := TStringList.Create;
  ProcList := TStringList.Create;
  BlockStack := TList.Create;
  ConstDefs := TStringList.Create;
  InitCode := TStringList.Create;
  PostInitCode := TStringList.Create;
  ClassStack := TList.Create;

  ClassTable := TStringList.Create;
  ClassTable.Add('rem');
  CN := TConstant.Create;
  CN.c_names.Add(ClassChildPref + 'rem');
  CN.c_type := ctUnsigned64;
  St_WriteCardinal(CN.c_value, 0);
  Constants.Add(CN);
  ConstDefs.Add(ClassChildPref + 'rem');
  GlobalVars := TStringList.Create;
  if ARGC_Enable then
   begin
     varmgr.DefVar('argcount');
     GlobalVars.Add('argcount');
   end;
  //VarDefs := TStringList.Create;

  NeverUsedClasses := TStringList.Create;
end;

procedure FreePreprocessor(varmgr: TVarManager);
var
  s: string;
  c: cardinal;
begin
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

  if ClassStack.Count > 0 then
  begin
    PostInitCode.Add('_common_class_constructor:');
    PostInitCode.Add('pop');
    PostInitCode.Add('jr');
  end;

  c := 0;
  while c < ClassStack.Count do
  begin
    if TMashClass(ClassStack[c]).UnresolvedDepends.Count > 0 then
     begin
       s := 'Unresolved class "' + TMashClass(ClassStack[c]).CName + '" depends:';
       c := 0;
       while c < TMashClass(ClassStack[c]).UnresolvedDepends.Count do
        begin
          s := s + sLineBreak + '     - Class "' + TMashClass(ClassStack[c]).UnresolvedDepends[c] + '"';
          inc(c);
        end;
       AsmError(s);
     end;
    if TMashClass(ClassStack[c]).ClassUsed then
     PostInitCode.Add(GenClassAllocator(TMashClass(ClassStack[c]), varmgr))
    else
     NeverUsedClasses.Add(TMashClass(ClassStack[c]).CName);

    inc(c);
  end;

  while ClassStack.Count > 0 do
   begin
     if TMashClass(ClassStack[0]).ClassUsed then
      begin
        c := 0;
        while c < TMashClass(ClassStack[0]).Extends.Count do
         begin
           if NeverUsedClasses.IndexOf(TMashClass(ClassStack[0]).Extends[c]) <> -1 then
            NeverUsedClasses.Delete(
              NeverUsedClasses.IndexOf(TMashClass(ClassStack[0]).Extends[c])
            );
           inc(c);
         end;
      end;
     TMashClass(ClassStack[0]).Free;
     ClassStack.Delete(0);
   end;
  FreeAndNil(ClassStack);

  FreeAndNil(ClassTable);
  FreeAndNil(ConstDefs);
  //FreeAndNil(InitCode);
  //FreeAndNil(VarDefs);

  FreeAndNil(GlobalVars);
end;

end.
