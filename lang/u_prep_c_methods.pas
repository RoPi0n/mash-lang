unit u_prep_c_methods;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global, u_variables, u_globalvars, u_prep_global,
  u_prep_codeblock, u_prep_methods;

function IsProc(s: string): boolean;
function PreprocessProc(s: string; varmgr: TVarManager;
                        PrepForClass:boolean = false; CName: string = ''): string;

implementation

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
       begin
         if Pos('::', s) > 0 then
          Result := True
         else
         if CheckName(Copy(s, 1, Pos('(', s) - 1)) then
          Result := True;
       end;
    end;
end;

function PreprocessProc(s: string; varmgr: TVarManager;
                        PrepForClass:boolean = false; CName: string = ''): string;
var
  bf, pn: string;
  CB: TCodeBlock;
  IsClassM: boolean;
  ArgN: word;
  RestReserved: boolean;
begin
  RestReserved := false;
  ArgN := 0;
  s := Trim(s);
  bf := Copy(s, 1, 4);
  Delete(s, 1, 4);
  s := Trim(s);
  if s[Length(s)] = ':' then
    Delete(s, length(s), 1);
  pn := Trim(GetProcName(Trim(s)));

  if (pos('::', pn) > 0) or PrepForClass then
   begin
     IsClassM := True;

     if (pos('::', pn) > 0) and PrepForClass then
      PrpError('Error in class method declaration -> ' + pn);

     if PrepForClass then
      pn := CName + '::' + pn;

     pn := ExtractProcName(pn);
   end
  else
   IsClassM := False;

  if bf = 'proc' then
    CB := TCodeBlock.Create(btProc, '', '', '__gen_' + pn + '_method_end')
  else
    CB := TCodeBlock.Create(btFunc, '', '-', '__gen_' + pn + '_method_end');
  BlockStack.Add(CB);
  CB.mName := pn;

  if pn = 'main' then
   MainDefined := true;

  Result := 'pushcp __gen_' + pn + '_method_end_block' + sLineBreak + 'jp' + sLineBreak + pn + ':';

  ProcEnterList.Add(pn);
  LocalVarPref := {LocalVarPref + }pn + '.';
  Delete(s, 1, pos('(', s));
  Delete(s, pos(')', s), length(s));
  s := Trim(s);

  if IsClassM then
   if Length(s) > 0 then
    s := 'this, ' + s
   else
    s := 'this';

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

    if RestReserved then
     PrpError('Receiving arguments after receive rest-arguments "' + bf +
          '" in method "' + pn + '".');

    if (copy(bf, 1, 1) = '[') and (copy(bf, length(bf), 1) = ']') then
     begin
       Delete(bf, 1, 1);
       Delete(bf, length(bf), 1);
       bf := Trim(bf);
       RestReserved := True;

       if GlobalVars.IndexOf(bf) <> -1 then
        PrpError('Receiving global variable as argument "' + bf +
           '" in method "' + pn + '".');

       Result := Result + sLineBreak + 'pushcp ' + GetConst(IntToStr(ArgN), varmgr) +
                 sLineBreak + 'push ' + GetVar('argcount', varmgr) + sLineBreak +
                 'sub' + sLineBreak + 'pushcp __poprest' + sLineBreak + 'jc' +
                 sLineBreak + 'peek ' + GetVar(bf, varmgr) + sLineBreak + 'pop';

       inc(ArgN);
     end
    else
    if IsVar(bf, varmgr) then
    begin
      if bf[1] = '$' then
        Delete(bf, 1, 1);

      if GlobalVars.IndexOf(bf) <> -1 then
       PrpError('Receiving global variable as argument "' + bf +
          '" in method "' + pn + '".');

      if varmgr.DefinedVars.IndexOf(bf) = -1 then
      begin
        if GlobalVars.IndexOf(bf) = -1 then
         begin
           varmgr.DefVar(LocalVarPref + bf);
           bf := LocalVarPref + bf;
         end
        else
        if bf[1] <> '.' then
        begin
          Delete(bf, 1, 1);
          varmgr.DefVar(bf);
          //bf := '$' + bf;
        end
        else
        begin
          Delete(bf, 1, 1);
          varmgr.DefVar(LocalVarPref + bf);
          bf := {'$' + }LocalVarPref + bf;
        end;
      end;
      Result := Result + sLineBreak + 'peek ' + GetVar(bf, varmgr, true) +
        sLineBreak + 'pop';

      inc(ArgN);
    end
    else
      PrpError('Invalid method "' + pn + '" definition.');
  end;
end;

end.
