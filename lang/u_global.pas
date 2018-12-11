unit u_global;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TBytes = array of byte;
  PBytes = ^TBytes;

function CheckName(n: string): boolean;
function TrimCodeStr(s: string): string;
function Tk(s: string; w: word): string;
procedure AsmError(m: string);
procedure AsmWarn(m: string);
procedure AsmInfo(m: string);

var
  RgAPICnt: cardinal = 0;
  GlobalCommentBegin: boolean = False;

implementation

uses
  u_globalvars;

{** Methods **}

function CheckName(n: string): boolean;
var
  chars: set of char = ['a'..'z', '0'..'9', '_', '.'];
begin
  Result := False;
  if not (n[1] in ['0'..'9']) then
  begin
    Delete(n, 1, 1);
    while Length(n) > 0 do
    begin
      if not (n[1] in chars) then
        exit;
      Delete(n, 1, 1);
    end;
    Result := True;
  end;
end;

function TrimCodeStr(s: string): string;
var
  ConstStr: boolean;
begin
  s := Trim(s);
  ConstStr := False;
  Result := '';
  while Length(s) > 0 do
  begin
    if not GlobalCommentBegin then
    begin
      if s[1] = '"' then
        ConstStr := not ConstStr;
      if ConstStr then
      begin
        Result := Result + s[1];
        Delete(s, 1, 1);
      end
      else
      if copy(s, 1, 2) = '  ' then
        Delete(s, 1, 1)
      else
      begin
        if copy(s, 1, 2) = '//' then
         break;

        if copy(s, 1, 2) = '/*' then
         begin
           GlobalCommentBegin := true;
           break;
         end;

        Result := Result + LowerCase(s[1]);
        if s[1] in ['?', '=', '@'] then
        begin
          Delete(s, 1, 1);
          s := Trim(s);
        end
        else
          Delete(s, 1, 1);
      end;
    end
   else
    begin
      if copy(s, 1, 2) = '*/' then
       begin
         GlobalCommentBegin := false;
         Delete(s, 1, 2);
       end
      else
       Delete(s, 1, 1);
    end;
  end;
end;

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

procedure AsmError(m: string);
begin
  writeln('Error: ', m);
  halt;
end;

procedure AsmWarn(m: string);
begin
  writeln('Warning: ', m);
end;

procedure AsmInfo(m: string);
begin
  if Hints_Enable then
    writeln('Info: ', m);
end;

end.

