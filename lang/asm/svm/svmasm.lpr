program svmasm;

{$mode objfpc}{$H+}

uses
  SysUtils,
  Classes,
  u_common,
  u_imports,
  u_consts,
  u_writers,
  u_asm;

var
  code: TStringList;
  stream: TMemoryStream;
  vars: TStringList;
  imports: TImportSection;
  consts: TConstantManager;
  code_sect: TCodeSection;
  bf: string;
  cnst: TConstant;

procedure ScanForVars;
var
  i: integer;
  s: string;
begin
  i := 0;
  while i < code.Count do
   begin
     s := Trim(code[i]);
     if length(s) > 0 then
      if s[1] = '@' then
       begin
         Delete(s, 1, 1);
         vars.Add(s);
         code.Delete(i);
         dec(i);
       end;

     inc(i);
   end;
end;

begin
  if ParamCount > 2 then
   begin
     {* Initialization *}
     DecimalSeparator := '.';

     if not FileExists(ParamStr(2)) then
      begin
        writeln('File "' + ParamStr(2) + '" not found.');
        halt;
      end;

     code := TStringList.Create;
     code.LoadFromFile(ParamStr(2));

     vars := TStringList.Create;

     stream := TMemoryStream.Create;

     {* Gen header *}
     stream.WriteByte(Ord('S'));
     stream.WriteByte(Ord('V'));
     stream.WriteByte(Ord('M'));
     stream.WriteByte(Ord('E'));
     stream.WriteByte(Ord('X'));
     stream.WriteByte(Ord('E'));
     stream.WriteByte(Ord('_'));

     if LowerCase(ParamStr(1)) = 'console' then
      begin
        stream.WriteByte(Ord('C'));
        stream.WriteByte(Ord('N'));
        stream.WriteByte(Ord('S'));
      end
     else
     if LowerCase(ParamStr(1)) = 'gui' then
      begin
        stream.WriteByte(Ord('G'));
        stream.WriteByte(Ord('U'));
        stream.WriteByte(Ord('I'));
      end
     else
      AsmErr('Invalid flag.');

     {* Preprocess code *}
     ScanForVars;
     consts := TConstantManager.Create(code);
     consts.ParseSection;
     imports := TImportSection.Create(code);
     imports.ParseSection;
     consts.AppendImports(imports);

     cnst := TConstant.Create;
     cnst.c_names.Add('global.addr_table_size');
     cnst.c_type := ctUnsigned64;
     St_WriteCardinal(cnst.c_value, vars.Count);
     consts.Add(cnst);

     bf := 'pushcp global.addr_table_size' + sLineBreak + 'msz' + sLineBreak;
     code.Text := bf + code.Text;

     code_sect := TCodeSection.Create(code, vars, consts);
     code_sect.ParseSection;

     imports.GenerateCode(stream);
     consts.GenerateCode(stream);
     code_sect.GenerateCode(stream);

     stream.seek(0, soFromBeginning);
     stream.SaveToFile(ParamStr(3));

     writeln('Success.');
     writeln('Output file size: ', stream.Size, ' bytes.');
   end
  else
   begin
     writeln('Assembler for SVM.');
     writeln('Version: 1.1.');
     writeln('Author: Chernov P. -> RoPi0n.');
     writeln('github.com/RoPi0n/mash-lang');
     writeln;
     writeln('Using: svmasm <flag> <input> <output>');
     writeln('Flags: console | gui');
   end;
end.
