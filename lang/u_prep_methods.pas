unit u_prep_methods;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function GetProcName(s: string): string;
function TryToGetProcName(s: string): string;

implementation

function GetProcName(s: string): string;
begin
  Result := Copy(s, 1, Pos('(', s) - 1);
end;

function TryToGetProcName(s: string): string;
var
  in_br, in_rbr: integer;
  in_str: boolean;
begin
  Result := '';
  in_br := 0;
  in_rbr := 0;
  in_str := false;
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

    if (in_rbr = 0) and (in_br > 0) then
     break;

    Result := Result + s[1];
    Delete(s, 1, 1);
  end;
  if Length(s) = 0 then
   Result := '';
  {if pos('(', s) > 0 then
  begin
    Delete(s, pos('(', s), length(s));
    if length(s) > 0 then
      if s[1] in ['$', '!'] then
        Delete(s, 1, 1);
    Result := s;
  end;}
end;

end.

