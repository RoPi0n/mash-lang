unit u_prep_array;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global, u_globalvars, u_prep_methods;

function IsArr(s: string): boolean;
function GetArrLvl(s: string): cardinal;
function GetArrLvlVal(s: string; indx: cardinal): string;

implementation

function IsArr(s: string): boolean;
var
  cnt: integer;
begin
  Result := False;
  if length(s) > 0 then
    if (pos('[', s) > 0) and (pos(']', s) > 0) then
    begin
      Result := s[1] <> '[';
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

end.

