unit u_prep_methods;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function GetProcName(s: string): string;
function ExtractProcName(s: string): string;

implementation

function ExtractProcName(s: string): string;
var
  bf: string;
begin
  while pos('::', s) > 0 do
   begin
     bf := Trim(copy(s, 1, pos('::', s)-1));
     Delete(s, 1, pos('::', s)+1);
     s := Trim(s);
     s := bf + '__' + s;
   end;
  Result := s;
end;

function GetProcName(s: string): string;
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
end;

end.

