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

end.

