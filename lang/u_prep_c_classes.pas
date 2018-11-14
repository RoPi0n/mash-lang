unit u_prep_c_classes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global, u_globalvars, u_variables, u_prep_global,
  u_prep_expressions,
  u_prep_codeblock, u_classes, u_prep_array, u_prep_methods, u_prep_c_global;

function IsClassDefine(s: string): boolean;
function PreprocessClassDefine(s: string): string;
function IsInClassBlock: boolean;
//procedure PreprocessClassVarDefine(s: string; varmgr: TVarManager; MClass: TMashClass);
procedure PreprocessClassVarDefines(s: string; varmgr: TVarManager; MClass: TMashClass);
function PreprocessClassPart(s: string; varmgr: TVarManager): string;
function GenClassAllocator(MClass: TMashClass; varmgr: TVarManager): string;

implementation

function IsClassDefine(s: string): boolean;
begin // class ClassName:
  Result := False;
  s := Trim(s);
  if copy(s, 1, 5) = 'class' then
  begin
    Delete(s, 1, 5);
    s := Trim(s);
    if Length(s) > 1 then
      Result := s[length(s)] = ':';
  end;
end;

function PreprocessClassDefine(s: string): string;
begin
  Result := '';
  s := Trim(s);
  Delete(s, 1, 5);
  Delete(s, Length(s), 1);
  s := Trim(s);
  BlockStack.Add(TCodeBlock.Create(btClass, s, '', ''));
  ClassStack.Add(TMashClass.Create(s));
end;

function IsInClassBlock: boolean;
begin
  Result := False;
  if BlockStack.Count > 0 then
    Result := TCodeBlock(BlockStack[BlockStack.Count - 1]).bType = btClass;
end;

(*procedure PreprocessClassVarDefine(s: string; varmgr: TVarManager; MClass: TMashClass);
var
  v, def: string;
  vr: TMashClassVariableDefine;
begin
  Def := '';
  s := Trim(s);
  if s[1] = '$' then
    Delete(s, 1, 1);
  if s = '' then
    PrpError('empty class variable definition.');
  if pos('=', s) > 0 then
  begin
    v := Trim(copy(s, 1, pos('=', s) - 1));
    Delete(s, 1, pos('=', s));
    s := Trim(s);
    if IsOpNew(s) then
      Def := PreprocessOpNew(s, varmgr)
    else
    //Result := Result + sLineBreak + PushIt(s, varmgr);
    if IsVar(s, varmgr) then
      Def := PreprocessVarAction(s, 'push', varmgr)
    else
    if IsConst(s) then
      Def := 'pushc ' + GetConst(s)
    else
    if IsArr(s) then
      Def := PreprocessArrAction(s, 'pushai', varmgr)
    else
    if IsExpr(s) then
      Def := PreprocessExpression(s, varmgr)
    else
    if (Pos('(', s) > 0) and (s[1] <> '[') then
    begin
      if (ProcList.IndexOf(TryToGetProcName(s)) <> -1) or
        (ImportsLst.IndexOf(TryToGetProcName(s)) <> -1) then
      begin
        if pos('(', s) > 0 then
        begin
          Def := PreprocessCall(s, varmgr);
          s := GetProcName(Trim(s));
        end;

        s := Trim(s);

        Def := Def + sLineBreak + 'pushc ' + GetConst('!' + s) +
          sLineBreak + 'gpm' + sLineBreak;
        if ProcList.IndexOf(s) <> -1 then
          Def := Def + 'jc'
        else
          Def := Def + 'invoke';
      end
      else
        PrpError('Invalid calling "' + s + '".');
    end
    else
      Def := Def + sLineBreak + PushIt(s, varmgr);
    vr := TMashClassVariableDefine.Create(v, True, Def);
    MClass.VarDefs.Add(vr);
  end
  else
  begin
    vr := TMashClassVariableDefine.Create(v, False, '');
    MClass.VarDefs.Add(vr);
  end;
end;*)

procedure PreprocessClassVarDefines(s: string; varmgr: TVarManager; MClass: TMashClass);
begin
  while Length(s) > 0 do
  begin
    MClass.VarDefs.Add(TMashClassVariableDefine.Create(Trim(CutNextArg(s)), False, ''));
    //PreprocessClassVarDefine(CutNextArg(s), varmgr, MClass);
  end;
end;


function PreprocessClassPart(s: string; varmgr: TVarManager): string;
begin
  Result := '';
  s := Trim(s);
  if s = 'end' then
    GenEnd
  else
  if copy(s, 1, 4) = 'var ' then
  begin
    Delete(s, 1, 3);
    s := Trim(s);
    PreprocessClassVarDefines(s, varmgr, TMashClass(ClassStack[ClassStack.Count - 1]));
  end
  else
  if (copy(s, 1, 5) = 'func ') or (copy(s, 1, 5) = 'proc ') then
  begin
    Delete(s, 1, 4);
    s := Trim(s);
    while Length(s) > 0 do
     begin
       TMashClass(ClassStack[ClassStack.Count - 1]).Methods.Add(Trim(CutNextArg(s)));
     end;
  end;
end;

function GenClassAllocator(MClass: TMashClass; varmgr: TVarManager): string;
var
  mname: string;
  c: cardinal;
begin
  // Allocation

  mname := '__class_' + MClass.CName + '_allocator';
  Result := mname + ':' + sLineBreak + TempPushIt(IntToStr(MClass.AllocSize), varmgr) +
            sLineBreak + TempPushIt('1', varmgr) + sLineBreak + 'newa' + sLineBreak;

  // StructFree()
  Result := Result + 'pcopy' + sLineBreak + 'pushc ' + '__class_' + MClass.CName + '_structure_free' + sLineBreak +
            'swp' + sLineBreak + 'pushc ' + ClassChildPref + 'structfree' + sLineBreak + 'gpm' + sLineBreak + 'swp' + sLineBreak +
            'peekai' + sLineBreak;

  c := 0;
  while c < MClass.Methods.Count do
   begin
     Result := Result + 'pcopy' + sLineBreak + 'pushc ' + MClass.CName + '__' + MClass.Methods[c] + sLineBreak +
               'swp' + sLineBreak + 'pushc ' + ClassChildPref + MClass.Methods[c] + sLineBreak + 'gpm' + sLineBreak + 'swp' + sLineBreak +
               'peekai' + sLineBreak;
     inc(c);
   end;

  Result := Result + '__gen_' + mname + '_method_end:' + sLineBreak + 'jr' + sLineBreak;

  // Clear memory

  mname := '__class_' + MClass.CName + '_structure_free';
  Result := Result + sLineBreak + mname + ':';

  Result := Result + sLineBreak + 'pcopy' + sLineBreak + 'pushc ' +
            ClassChildPref + 'structfree' + sLineBreak + 'gpm' + sLineBreak +
            'swp' + sLineBreak + 'pushai' + sLineBreak + 'gpm' + sLineBreak + 'pop';

  c := 0;
  while c < MClass.Methods.Count do
   begin
     Result := Result + sLineBreak + 'pcopy' + sLineBreak + 'pushc ' +
               ClassChildPref + MClass.Methods[c] + sLineBreak + 'gpm' + sLineBreak +
               'swp' + sLineBreak + 'pushai' + sLineBreak + 'gpm' + sLineBreak + 'pop';
     inc(c);
   end;

  Result := Result {+ sLineBreak + 'gpa'} + sLineBreak + 'pop' + sLineBreak +
            '__gen_' + mname + '_method_end:' + sLineBreak + 'jr' + sLineBreak;
end;

end.
