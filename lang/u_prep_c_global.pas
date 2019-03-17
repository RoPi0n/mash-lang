unit u_prep_c_global;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, u_global, u_globalvars, u_variables, u_prep_global,
   u_prep_expressions, u_classes, u_prep_codeblock, u_consts, u_writers;

function GenEnd: string;
function GenExit: string;
function GenBreak: string;
function GenReturn(s: string; varmgr: TVarManager): string;
function IsLabel(s: string): boolean;
function GetLabelName(s: string): string;

implementation

procedure SolveDepends(MC: TMashClass);
var
   MC2: TMashClass;
   c: cardinal;
begin
   MC2 := FindNextUnresolved(MC.CName);
   while MC2 <> nil do
    begin
      c := 0;
      while c < Mc.Methods.Count do
       begin
         if Mc2.Methods.IndexOf(Mc.Methods[c]) = -1 then
          begin
            Mc2.Methods.Add(Mc.Methods[c]);
            Mc2.MethodsLinks.Add(Mc.MethodsLinks[c]);
          end;
         Inc(c);
       end;

      if RTTI_Enable then
         MC2.AllocSize := ClassTable.Count + 2
      else
         MC2.AllocSize := ClassTable.Count + 1;

      Mc2.UnresolvedDepends.Delete(Mc2.UnresolvedDepends.IndexOf(MC.CName));

      c := 0;
      while c < Mc.UnresolvedDepends.Count do
       begin
         if Mc2.UnresolvedDepends.IndexOf(Mc.UnresolvedDepends[c]) = - 1 then
          Mc2.UnresolvedDepends.Add(Mc.UnresolvedDepends[c]);
         inc(c);
       end;

      Mc2 := FindNextUnresolved(MC.CName);
    end;
end;

function GenEnd: string;
var
   CB: TCodeBlock;
   MC, MC2: TMashClass;
   CN: TConstant;
   c: cardinal;
begin
   Result := '';
   if BlockStack.Count > 0 then
    begin
      CB := TCodeBlock(BlockStack[BlockStack.Count - 1]);
      case CB.bType of
         btProc:
          begin
        {if pos('.', LocalVarPref) > 0 then
         Delete(LocalVarPref, 1, pos('.', LocalVarPref))
        else
         LocalVarPref := '';}
            LocalVarPref := GetCurrentMethodName + '.';
            if LocalVarPref = 'global code.' then
               LocalVarPref := '';

            Result := CB.bEndCode + ':' + sLineBreak + 'jr' + sLineBreak +
               CB.bEndCode + '_block:';

            ProcEnterList.Delete(ProcEnterList.Count - 1);
          end;
         btFunc:
          begin
        {if pos('.', LocalVarPref) > 0 then
         Delete(LocalVarPref, 1, pos('.', LocalVarPref))
        else
         LocalVarPref := '';}
            LocalVarPref := GetCurrentMethodName + '.';
            if LocalVarPref = 'global code.' then
               LocalVarPref := '';

            Result := CB.bEndCode + ':' + sLineBreak + 'jr' + sLineBreak +
               CB.bEndCode + '_block:';
            if CB.bMeta <> '+' then
               PrpError('Declarate function without return.');

            ProcEnterList.Delete(ProcEnterList.Count - 1);
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
         btWhilst:
          begin
            Result := CB.bMCode;
          end;
         btLaunch:
          begin
            Result := CB.bMCode;
          end;
         btAsync:
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
          end;
         btClass:
          begin
            Result := '';
            c := ClassTable.Count;
            MC := TMashClass(ClassStack[ClassStack.Count - 1]);
            MC.FillTable;

            while MC.Table.Count > 0 do
             begin
               if ClassTable.IndexOf(Trim(MC.Table[0])) = -1 then
                  ClassTable.Add(Trim(MC.Table[0]));
               MC.Table.Delete(0);
             end;

            if RTTI_Enable then
               MC.AllocSize := ClassTable.Count + 2
            else
               MC.AllocSize := ClassTable.Count + 1;

            if RTTI_Enable then
             begin
               CN := TConstant.Create;
               CN.c_names.Add(MC.CName);
               CN.c_type := ctUnsigned64;
               St_WriteCardinal(CN.c_value, ClassStack.Count - 1);
               Constants.Add(CN);
               ConstDefs.Add(MC.CName);
             end;

            while c < ClassTable.Count do
             begin
               CN := TConstant.Create;
               CN.c_names.Add(ClassChildPref + ClassTable[c]);
               CN.c_type := ctUnsigned64;
               St_WriteCardinal(CN.c_value, c);
               Constants.Add(CN);
               ConstDefs.Add(ClassChildPref + ClassTable[c]);
               Inc(c);
             end;

            SolveDepends(MC);
          end;
         btSwitch:
          begin
            if CB.bMeta = '0' then
               PrpError('Using switch without cases.');
            Result := CB.bMCode;
          end;
         btCase:
          begin
            Result := 'pushcp ' + CB.bEndCode + sLineBreak + 'jp' + sLineBreak + CB.bMCode;
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

function GenExit: string;
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
         if CB.bType in [btFunc, btProc] then
          begin
            Result := 'jr';
            break;
          end;
         Inc(i);
      until BlockStack.Count - i = -1;
      if Result = '' then
         PrpError('Using operator "exit" outside a method.');
    end
   else
      PrpError('Using operator "exit" outside a method.');
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
            if CB.bType = btLaunch then
             begin
               Result := CB.bEndCode + sLineBreak;
               break;
             end
            else
            if CB.bType in [btFor, btWhile, btWhilst, btCase, btAsync] then
             begin
               Result := 'pushcp ' + CB.bEndCode + sLineBreak + 'jp';
               break;
             end;
            Inc(i);
         until BlockStack.Count - i = 0;
         if Result = '' then
          begin
            CB := TCodeBlock(BlockStack[BlockStack.Count - 1]);
            Result := 'pushcp ' + CB.bEndCode + sLineBreak + 'jp';
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
   s := Trim(s);
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
         PrpError('Using operator "return" outside a function.');
    end
   else
      PrpError('Using operator "return" outside a function.');
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

end.
