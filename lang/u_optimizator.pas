unit u_optimizator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_globalvars, u_global;

procedure OptimizeCode(Lines: TStringList);

implementation

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

          IsWaste := (Lines.IndexOf('__gen_' + s + '_method_end:') > i) and
                     (Lines.IndexOf(s + ':') < i); //False;

          {k := i + 1;
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
          end;}

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

procedure LightFilterWaste(Lines: TStringList);
var
  i: longint;
  j: integer;
  s: string;
begin
  i := 0;
  while i < Lines.Count do
  begin
    s := Lines[i];
    if (Copy(s, 1, 5) = 'pushc') or (Copy(s, 1, 6) = 'pushcp') then
     begin
       Delete(s, 1, pos(' ', s));
       s := Trim(s);

       j := Waste.IndexOf(s);
       if j <> -1 then
        Waste.Delete(j);
     end;
    Inc(i);
  end;
end;

{*** waste code blocks ***}

procedure FindNeverUsedMethods(Lines: TStringList);
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
        Delete(s, length(s), 1);
        s := Trim(s);

        if pos('__', s) > 0 then
         if NeverUsedClasses.IndexOf(Trim(Copy(s, 1, pos('__', s) - 1))) <> -1 then
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

    if x > i - 3 then
     begin
       Lines.Delete(i);
       Lines.Delete(i);
       Lines.Delete(i);
     end;

    if Hints_Enable then
     AsmInfo('Method "' + Name + '" declared but never used.');
  end;
end;

function DelWasteMethods(Lines: TStringList): boolean;
var
  c, l, e, k, cnt: cardinal;
  s, s2: string;
  isw: boolean;
begin
  Result := false;
  c := 0;
  while c < Lines.Count do
  begin
    s := Trim(Lines[c]);
    l := Length(s);
    if l > 0 then
     begin
       if s[l] = ':' then
        begin
          Delete(s, length(s), 1);
          s := Trim(s);
          e := Lines.IndexOf('__gen_' + s + '_method_end:');
          inc(e, 2); //setup it to method end
          isw := true;

          if e > c then
           begin //we are in method!
             dec(c, 2); //return back to jump-over point
             cnt := Lines.Count;
             k := 1;
             while (k < cnt - e) or (k < c) do
              begin
                if k < c then
                 begin
                   s2 := Trim(Lines[c - k]);
                   if copy(s2, 1, 5) = 'pushc' then
                    begin
                      Delete(s2, 1, pos(' ', s2));
                      s2 := Trim(s2);
                      if s = s2 then
                       begin
                         isw := false;
                         break;
                       end;
                    end;
                 end;

                if k < cnt - e then
                 begin
                   s2 := Trim(Lines[e + k]);
                   if copy(s2, 1, 5) = 'pushc' then
                    begin
                      Delete(s2, 1, pos(' ', s2));
                      s2 := Trim(s2);
                      if s = s2 then
                       begin
                         isw := false;
                         break;
                       end;
                    end;
                 end;

                inc(k);
              end;

             k := e;
             if isw then
              begin
                Result := True;
                while k >= c do
                 begin
                   Lines.Delete(k);
                   dec(k);
                 end;
                dec(c);
              end
             else
              c := e + 1;
           end;
        end;
     end;
    inc(c);
  end;
end;

{*** waste imports ***}

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
begin
  //writeln('Optimization...');

  //***   waste code blocks optimization
  while DelWasteMethods(Lines) do continue;

  Waste := TStringList.Create;

  //*** never used classes
  FindNeverUsedMethods(Lines);
  while Waste.Count > 0 do
   begin
     RemoveMethod(Waste[0], Lines);
     Waste.Delete(0);
   end;

  while DelWasteMethods(Lines) do continue;

  //*** waste imports
  Waste.Text := ImportsLst.Text;
  LightFilterWaste(Lines);
  RemoveWasteImports(Lines);

  //*** waste consts
  FindAllConsts(Lines);
  LightFilterWaste(Lines);
  RemoveWasteConsts(Lines);

  FreeAndNil(Waste);
end;

end.
