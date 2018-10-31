unit u_prep_enums;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_prep_global, u_global, u_globalvars, u_consts;

function IsEnumVals(s: string): boolean;
function CountEnumItems(s: string): cardinal;
function IsEnumDef(s: string): boolean;
function PreprocessEnum(s: string): string;

implementation

function IsEnumVals(s: string): boolean; // var a = [1, 2, 3, 4, 5]
begin
  Result := False;
  if Length(s) > 2 then
    Result := (s[1] = '[') and (s[length(s)] = ']');
end;

function CountEnumItems(s: string): cardinal;
begin
  Result := 0;
  Delete(s, 1, 1);
  Delete(s, Length(s), 1);
  s := Trim(s);
  while Length(s) > 0 do
  begin
    CutNextArg(s);
    s := Trim(s);
    Inc(Result);
  end;
end;

function IsEnumDef(s: string): boolean;
begin
  Result := False;
  s := Trim(s);
  if (Length(s) > 6) and (Pos('[', s) > 0) and (Pos(']', s) > 0) then
    if copy(s, 1, 4) = 'enum' then
    begin
      Delete(s, 1, 4);
      Result := CheckName(Trim(Copy(s, 1, Pos('[', s) - 1)));
    end;
end;

function PreprocessEnum(s: string): string;
var
  n: string;
  c, cnt: cardinal;
  Cnst: TConstant;
begin
  Result := '';
  s := Trim(s);
  if (Length(s) > 0) and (Pos('[', s) > 0) and (Pos(']', s) > 0) then
    if copy(s, 1, 4) = 'enum' then
    begin
      Delete(s, 1, 4);
      s := trim(s);
      n := trim(copy(s, 1, pos('[', s) - 1));
      Delete(s, 1, pos('[', s) - 1);
      cnt := CountEnumItems(s);

      ConstDefs.Add(n);
      Cnst := TConstant.Create;
      Cnst.c_names.Add(n);
      Cnst.c_type := ctUnsigned64;
      St_WriteCardinal(Cnst.c_value, cnt);
      Constants.Add(Cnst);

      Delete(s, 1, 1);
      Delete(s, Length(s), 1);
      c := 0;
      while c < cnt do
      begin
        n := Trim(CutNextArg(s));
        if CheckName(n) then
        begin
          ConstDefs.Add(n);
          Cnst := TConstant.Create;
          Cnst.c_names.Add(n);
          Cnst.c_type := ctUnsigned64;
          St_WriteCardinal(Cnst.c_value, c);
          Constants.Add(Cnst);
        end
        else
          PrpError('Error in enum construction. It''s must be valid names (Error in "' +
            n + '").');
        Inc(c);
      end;
    end;
end;

end.

