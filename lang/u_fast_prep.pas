unit u_fast_prep;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_globalvars;

var
  DelUntilEnd: boolean = false;

function FastPrep(s:string):string;

implementation

function FastPrep(s:string):string;
var
  i: integer;
begin
  Result := '';
  if DelUntilEnd then
   begin
     if s = '{_end_}' then
      begin
        DelUntilEnd := false;
      end;
   end
  else
   begin
     if copy(s, 1, 8) = '{_mode_ ' then
      begin
        delete(s, 1, 8);
        delete(s, length(s), 1);
        s := Trim(s);

        if s = 'o+' then
         begin
           RTTI_Enable := true;
           if FastPrep_Defines.IndexOf('o') = -1 then
            FastPrep_Defines.Add('o');
         end;
        if s = 'o-' then
         begin
           RTTI_Enable := false;
           i := FastPrep_Defines.IndexOf('o');
           if i <> -1 then
            FastPrep_Defines.Delete(i);
         end;

        if s = 'rtti+' then
         begin
           RTTI_Enable := true;
           if FastPrep_Defines.IndexOf('rtti') = -1 then
            FastPrep_Defines.Add('rtti');
         end;
        if s = 'rtti-' then
         begin
           RTTI_Enable := false;
           i := FastPrep_Defines.IndexOf('rtti');
           if i <> -1 then
            FastPrep_Defines.Delete(i);
         end;

        if s = 'argcounter+' then
         begin
           RTTI_Enable := true;
           if FastPrep_Defines.IndexOf('argcounter') = -1 then
            FastPrep_Defines.Add('argcounter');
         end;
        if s = 'argcounter-' then
         begin
           RTTI_Enable := false;
           i := FastPrep_Defines.IndexOf('argcounter');
           if i <> -1 then
            FastPrep_Defines.Delete(i);
         end;
      end
     else
     if s = '{_end_}' then
     else
     if copy(s, 1, 10) = '{_define_ ' then
      begin
        delete(s, 1, 10);
        delete(s, length(s), 1);
        FastPrep_Defines.Add(Trim(s));
      end
     else
     if copy(s, 1, 9) = '{_ifdef_ ' then
      begin
        delete(s, 1, 9);
        delete(s, length(s), 1);
        if FastPrep_Defines.IndexOf(Trim(s)) = -1 then
         DelUntilEnd := true;
      end
     else
     if copy(s, 1, 10) = '{_ifndef_ ' then
      begin
        delete(s, 1, 10);
        delete(s, length(s), 1);
        if FastPrep_Defines.IndexOf(Trim(s)) <> -1 then
         DelUntilEnd := true;
      end
     else
     Result := s;
   end;
end;

end.

