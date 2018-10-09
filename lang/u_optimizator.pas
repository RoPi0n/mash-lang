unit u_optimizator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global;

procedure OptimizeCode(Lines:TStringList);

implementation

var
  Waste: TStringList;

{*** Common methods ***}

procedure FilterWaste(Lines:TStringList);
var
  i:longint;
  j:integer;
  s:string;
begin
  i := 0;
  while i < Lines.Count do
   begin
     s := Lines[i];
     if Copy(s, 1, 5) = 'pushc' then
      begin
        Delete(s, 1, 5);
        s := Trim(s);
        j := Waste.IndexOf(s);
        if j <> -1 then
         Waste.Delete(j);
      end;
     inc(i);
   end;
end;

{*** waste code blocks ***}

procedure FindAllMethods(Lines:TStringList);
var
  i:longint;
  s:string;
begin
  i := 0;
  while i < Lines.Count do
   begin
     s := Lines[i];
     if Length(s) > 0 then
      begin
        if s[Length(s)] = ':' then
         begin
           Delete(s, Length(s), 1);
           if Lines.IndexOf('__gen_'+s+'_method_end:') > i then
            Waste.Add(s);
         end;
      end;
     inc(i);
   end;
end;

procedure RemoveMethod(name:string; Lines:TStringList);
var
  i:longint;
begin
  i := Lines.IndexOf(name+':');
  if i <> -1 then
   begin
     while (Lines[i] <> '__gen_'+name+'_method_end:') and (Lines.Count > i) do
      Lines.Delete(i);
     if Lines.Count > i then
      if Lines[i] = '__gen_'+name+'_method_end:' then
       begin
         Lines.Delete(i);
         if Lines.Count > i then
          if Lines[i] = 'jr' then
           Lines.Delete(i);
         //AsmInfo('Method "'+name+'" declared but not used.');
       end;
   end;
end;

procedure DelWasteMethods(Lines:TStringList);
begin
  while Waste.Count > 0 do
   begin
     RemoveMethod(Waste[0], Lines);
     Waste.Delete(0);
   end;
end;

{*** waste imports ***}

procedure FindAllImports(Lines:TStringList);
var
  i:longint;
  s:string;
begin
  i := 0;
  while i < Lines.Count do
   begin
     s := Lines[i];
     if Length(s) > 0 then
      begin
        if tk(s, 1) = 'import' then
         Waste.Add(tk(s, 2));
      end;
     inc(i);
   end;
end;

procedure RemoveWasteImports(Lines:TStringList);
var
  i:longint;
  s:string;
begin
  i := 0;
  while (i < Lines.Count) and (Waste.Count > 0) do
   begin
     s := Lines[i];
     if Length(s) > 0 then
      begin
        if tk(s, 1) = 'import' then
         if Waste.IndexOf(tk(s, 2)) <> -1 then
          begin
            Lines.Delete(i);
            dec(i);
            //AsmInfo('Imported method "'+tk(s, 2)+'" declared but not used.');
          end;
      end;
     inc(i);
   end;
end;

{*** waste constants ***}

procedure FindAllConsts(Lines:TStringList);
var
  i:longint;
  s, bf:string;
begin
  i := 0;
  while i < Lines.Count do
   begin
     s := Lines[i];
     if Length(s) > 0 then
      begin
        bf := tk(s, 1);
        if (bf = 'int') or (bf = 'word') or (bf = 'real') or (bf = 'str') or (bf = 'stream') then
         Waste.Add(tk(s, 2));
      end;
     inc(i);
   end;
end;

procedure RemoveWasteConsts(Lines:TStringList);
var
  i:longint;
  s, bf:string;
begin
  i := 0;
  while (i < Lines.Count) and (Waste.Count > 0) do
   begin
     s := Lines[i];
     if Length(s) > 0 then
      begin
        bf := tk(s, 1);
        if (bf = 'int') or (bf = 'word') or (bf = 'real') or (bf = 'str') or (bf = 'stream') then
         if Waste.IndexOf(tk(s, 2)) <> -1 then
          begin
            Lines.Delete(i);
            dec(i);
            //AsmInfo('Constant "'+tk(s, 2)+'" declared but not used.');
          end;
      end;
     inc(i);
   end;
end;

{*** Main method ***}

procedure OptimizeCode(Lines:TStringList);
begin
  writeln('Optimization...');

  //***   waste code blocks optimization
  Waste := TStringList.Create;
  FindAllMethods(Lines);
  FilterWaste(Lines);
  while Waste.Count > 0 do
   begin
     DelWasteMethods(Lines);
     FindAllMethods(Lines);
     FilterWaste(Lines);
   end;

  //*** waste imports
  FindAllImports(Lines);
  FilterWaste(Lines);
  RemoveWasteImports(Lines);

  //*** waste consts
  FindAllConsts(Lines);
  FilterWaste(Lines);
  RemoveWasteConsts(Lines);

  FreeAndNil(Waste);
end;

end.
