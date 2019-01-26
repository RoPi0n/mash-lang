unit u_optimizator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure OptimizeCode(Lines: TStringList);

implementation

uses
  u_global, u_globalvars;

var
  Waste: TStringList;

{*** Common methods ***}

procedure FilterWaste(Lines: TStringList);
var
  i, k: longint;
  j: integer;
  s: string;
  IsWaste: boolean;
begin
  i := 0;
  while i < Lines.Count do
  begin
    s := Lines[i];
    if length(s) > 5 then
      if s[1] = 'p' then
        if (Copy(s, 1, 5) = 'pushc') or (Copy(s, 1, 6) = 'pushcp') then
        begin
          Delete(s, 1, pos(' ', s));
          s := Trim(s);

          IsWaste := False;
          k := i + 1;
          while k < Lines.Count do
          begin
            if Lines[k] = s + ':' then
              break;
            if Lines[k] = '__gen_' + s + '_method_end:' then
            begin
              IsWaste := True;
              break;
            end;
            Inc(k);
          end;

          if not IsWaste then
          begin
            j := Waste.IndexOf(s);
            if j <> -1 then
              Waste.Delete(j);
          end;
        end;
    Inc(i);
  end;
end;

{*** waste code blocks ***}

procedure FindAllMethods(Lines: TStringList);
var
  i, x: longint;
  s: string;
begin
  i := 0;
  while i < Lines.Count do
  begin
    s := Lines[i];
    x := Length(s);
    if x > 0 then
      if s[x] = ':' then
      begin
        Delete(s, x, 1);
        if Lines.IndexOf('__gen_' + s + '_method_end:') > i then
          Waste.Add(s);
      end;
    Inc(i);
  end;
end;

procedure RemoveMethod(Name: string; Lines: TStringList);
var
  i, x: longint;
begin
  i := Lines.IndexOf(Name + ':') - 2;
  if i <> -1 then
  begin
    x := Lines.Count;
    while x > i do
    begin
      if Length(Lines[i]) > 1 then
        if Lines[i][1] = '_' then
          if Lines[i] = '__gen_' + Name + '_method_end:' then
            break;
      Lines.Delete(i);
      Dec(x);
    end;
    if Lines.Count > i then
      if Lines[i] = '__gen_' + Name + '_method_end:' then
      begin
        Lines.Delete(i);
        if Lines.Count > i then
          if Lines[i] = 'jr' then
           begin
             Lines.Delete(i);
             Lines.Delete(i); // label
           end;
        if Hints_Enable then
          AsmInfo('Method "' + Name + '" declared but not used.');
      end;
  end;
end;

procedure DelWasteMethods(Lines: TStringList);
begin
  while Waste.Count > 0 do
  begin
    RemoveMethod(Waste[0], Lines);
    Waste.Delete(0);
  end;
end;

{*** waste imports ***}

procedure FindAllImports(Lines: TStringList);
var
  i, x: longint;
  s: string;
begin
  i := 0;
  x := Lines.Count;
  while i < x do
  begin
    s := Lines[i];
    if Length(s) > 7 then
      if s[1] = 'i' then
      begin
        if copy(s, 1, 7) = 'import ' then
          Waste.Add(tk(s, 2));
      end;
    Inc(i);
  end;
end;

procedure RemoveWasteImports(Lines: TStringList);
var
  i, x, w, wc: longint;
  s: string;
begin
  i := 0;
  x := Lines.Count;
  wc := Waste.Count;
  while (i < x) and (wc > 0) do
  begin
    s := Lines[i];
    if Length(s) > 7 then
      if s[1] = 'i' then
      begin
        if copy(s, 1, 7) = 'import ' then
        begin
          w := Waste.IndexOf(tk(s, 2));
          if w <> -1 then
          begin
            Waste.Delete(w);
            Lines.Delete(i);
            Dec(i);
            Dec(x);
            Dec(wc);
            if Hints_Enable then
              AsmInfo('Imported method "' + tk(s, 2) + '" declared but not used.');
          end;
        end;
      end;
    Inc(i);
  end;
end;

{*** waste constants ***}

procedure FindAllConsts(Lines: TStringList);
var
  i, x: longint;
  s, bf: string;
begin
  i := 0;
  x := Lines.Count;
  while i < x do
  begin
    s := Lines[i];
    if Length(s) > 0 then
      if s[1] in ['i', 'w', 'r', 's'] then
      begin
        bf := tk(s, 1);
        if (bf = 'int') or (bf = 'word') or (bf = 'real') or (bf = 'str') or
          (bf = 'stream') then
          Waste.Add(tk(s, 2));
      end;
    Inc(i);
  end;
end;

procedure RemoveWasteConsts(Lines: TStringList);
var
  i, x, w, wc: longint;
  s, bf: string;
begin
  i := 0;
  x := Lines.Count;
  wc := Waste.Count;
  while (i < x) and (wc > 0) do
  begin
    s := Lines[i];
    if Length(s) > 0 then
      if s[1] in ['i', 'w', 'r', 's'] then
      begin
        bf := tk(s, 1);
        if (bf = 'int') or (bf = 'word') or (bf = 'real') or (bf = 'str') or
          (bf = 'stream') then
        begin
          w := Waste.IndexOf(tk(s, 2));
          if w <> -1 then
          begin
            Lines.Delete(i);
            Waste.Delete(w);
            Dec(i);
            Dec(x);
            Dec(wc);
            if Hints_Enable then
              AsmInfo('Constant "' + tk(s, 2) + '" declared but not used.');
          end;
        end;
      end;
    Inc(i);
  end;
end;

{*** Main method ***}

procedure OptimizeCode(Lines: TStringList);
var
  b: byte;
begin
  //writeln('Optimization...');

  //***   waste code blocks optimization
  Waste := TStringList.Create;

  case OptimizationLvl of
    0: ;
    //middle
    2:
    begin
      FindAllMethods(Lines);
      FilterWaste(Lines);
      b := 3;
      while (Waste.Count > 0) and (b > 0) do
      begin
        DelWasteMethods(Lines);
        FindAllMethods(Lines);
        FilterWaste(Lines);
        Dec(b);
      end;
    end;
    //full
    3:
    begin
      FindAllMethods(Lines);
      FilterWaste(Lines);
      while Waste.Count > 0 do
      begin
        DelWasteMethods(Lines);
        FindAllMethods(Lines);
        FilterWaste(Lines);
      end;
    end;
      //ligth
    else
    begin
      FindAllMethods(Lines);
      FilterWaste(Lines);
      DelWasteMethods(Lines);
    end;
  end;

  //*** waste imports
  if OptimizationLvl > 0 then
  begin
    FindAllImports(Lines);
    FilterWaste(Lines);
    RemoveWasteImports(Lines);
  end;

  //*** waste consts
  if OptimizationLvl > 0 then
  begin
    FindAllConsts(Lines);
    FilterWaste(Lines);
    RemoveWasteConsts(Lines);
  end;

  FreeAndNil(Waste);
end;

end.
