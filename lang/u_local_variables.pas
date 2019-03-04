unit u_local_variables;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global, u_globalvars, u_variables, u_prep_global;

function PushLocalVariables(varmgr: TVarManager): string;
function PopLocalVariables(varmgr: TVarManager): string;
function DublicateLocalVariablesAndPushOrigins(varmgr: TVarManager): string;
function MarkLocalVariables(varmgr: TVarManager): string;

implementation

function PushLocalVariables(varmgr: TVarManager): string;
var
  c, l:cardinal;
  s:string;
begin
  Result := sLineBreak;
  if ProcEnterList.Count > 0 then
   begin
     s := ProcEnterList[ProcEnterList.Count-1] + '.';
     l := Length(s);
     c := 0;
     while c < varmgr.DefinedVars.Count do
      begin
        if Copy(varmgr.DefinedVars[c], 1, l) = s then
         Result := Result + sLineBreak + 'push ' + IntToStr(c);
        inc(c);
      end;
   end;
end;

function DublicateLocalVariablesAndPushOrigins(varmgr: TVarManager): string;
var
  c, l:cardinal;
  s:string;
begin
  Result := sLineBreak;
  if ProcEnterList.Count > 0 then
   begin
     s := ProcEnterList[ProcEnterList.Count-1] + '.';
     l := Length(s);
     c := 0;
     while c < varmgr.DefinedVars.Count do
      begin
        if Copy(varmgr.DefinedVars[c], 1, l) = s then
         Result := Result + sLineBreak + 'push ' + IntToStr(c) + sLineBreak +
                            'copy' + sLineBreak + {'gpm' + sLineBreak +}
                            'peek ' + IntToStr(c) + sLineBreak + 'pop';
        inc(c);
      end;
   end;
end;

function MarkLocalVariables(varmgr: TVarManager): string;
var
  c, l:cardinal;
  s:string;
begin
  Result := sLineBreak;
  if ProcEnterList.Count > 0 then
   begin
     s := ProcEnterList[ProcEnterList.Count-1] + '.';
     l := Length(s);
     c := 0;
     while c < varmgr.DefinedVars.Count do
      begin
        if Copy(varmgr.DefinedVars[c], 1, l) = s then
         Result := Result + sLineBreak + 'push ' + IntToStr(c) + sLineBreak +
                            'gpm' + sLineBreak + 'pop ';
        inc(c);
      end;
   end;
end;

function PopLocalVariables(varmgr: TVarManager): string;
var
  c, l:cardinal;
  s:string;
begin
  Result := sLineBreak;
  if ProcEnterList.Count > 0 then
   begin
     s := ProcEnterList[ProcEnterList.Count-1] + '.';
     l := Length(s);
     c := varmgr.DefinedVars.Count - 1;
     while c > 0 do
      begin
        if Copy(varmgr.DefinedVars[c], 1, l) = s then
         Result := Result + sLineBreak + 'peek ' + IntToStr(c) + sLineBreak +
                            'pop' + sLineBreak;
        dec(c);
      end;
   end;
end;

end.

