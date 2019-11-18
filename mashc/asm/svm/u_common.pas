unit u_common;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function Tk(s: string; w: word): string;
procedure AsmErr(s: string);

var
  RgAPICnt: cardinal = 0;

implementation

function Tk(s: string; w: word): string;
begin
  Result := '';
  while (length(s) > 0) and (w > 0) do
  begin
    if s[1] = '"' then
    begin
      Delete(s, 1, 1);
      Result := copy(s, 1, pos('"', s) - 1);
      Delete(s, 1, pos('"', s));
      s := trim(s);
    end
    else
    if Pos(' ', s) > 0 then
    begin
      Result := copy(s, 1, pos(' ', s) - 1);
      Delete(s, 1, pos(' ', s));
      s := trim(s);
    end
    else
    begin
      Result := s;
      s := '';
    end;
    Dec(w);
  end;
end;

procedure AsmErr(s: string);
begin
  writeln('[Error]: ', s);
  halt;
end;

end.

