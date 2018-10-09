program mashc;

{$Apptype console}
{$Mode objfpc}
{$H+}

uses
  SysUtils, Classes, u_imports, u_global, u_consts, u_variables,
  u_globalvars, u_codesect, u_preprocessor, u_optimizator;

  {** Main **}

var
  Code: TStringList;
  c: cardinal;
  Output: TMemoryStream;
  varmgr: TVarManager;
  Imports: TImportSection;
  CodeSection: TCodeSection;
  AppMode: string = '/cns';
  Tm, Tm2: TDateTime;
begin
  if ParamCount = 0 then
  begin
    writeln('Assembler for SVM.');
    writeln('Use: ', ExtractFileName(ParamStr(0)), ' <file> [mode]');
    writeln('Mode''s:');
    writeln(' /cns  - make console program (default).');
    writeln(' /gui  - make GUI program.');
    writeln(' /bin  - make program without SVMEXE header.');
    halt;
  end;
  Tm := Now;
  writeln('Building started.');
  DecimalSeparator := '.';
  IncludedFiles := TStringList.Create;
  Code := TStringList.Create;
  Code.LoadFromFile(ParamStr(1));
  if Code.Count > 0 then
    for c := 0 to Code.Count - 1 do
      Code[c] := TrimCodeStr(Code[c]);
 {for c:=code.count-1 downto 0 do
  if trim(code[c
  ])='' then code.delete(c);}
  varmgr := TVarManager.Create;
  Constants := TConstantManager.Create(Code);
  WriteLn('Code analyzing...');
  InitPreprocessor;
  c := 0;
  while c < Code.Count do
  begin
    if Trim(Code[c]) <> '' then
      PreprocessDefinitions(Code[c]);
    Inc(c);
  end;
  IncludedFiles.Clear;
  c := 0;
  while c < Code.Count do
  begin
    if Trim(Code[c]) <> '' then
      Code[c] := Trim(PreprocessStr(Code[c], varmgr));
    Inc(c);
  end;
  FreePreprocessor;
  code.Text := 'word __addrtsz ' + IntToStr(varmgr.DefinedVars.Count) +
    sLineBreak + 'pushc __addrtsz' + sLineBreak + 'gpm' + sLineBreak +
    'msz' + sLineBreak + 'gc' + sLineBreak + 'pushc __entrypoint' +
    slinebreak + 'gpm' + slinebreak + 'jc' + sLineBreak + 'pushc __haltpoint' +
    sLineBreak + 'gpm' + sLineBreak + 'jp' + sLineBreak + code.Text +
    sLineBreak + '__haltpoint:' + sLineBreak + 'gc';
  code.SaveToFile('buf.tmp');
  code.LoadFromFile('buf.tmp');
  DeleteFile('buf.tmp');
  if Code.Count > 0 then
  begin
    Output := TMemoryStream.Create;

    if ParamCount >= 2 then
      AppMode := LowerCase(ParamStr(2));

    if AppMode <> '/bin' then
    begin
      Output.WriteByte(Ord('S'));
      Output.WriteByte(Ord('V'));
      Output.WriteByte(Ord('M'));
      Output.WriteByte(Ord('E'));
      Output.WriteByte(Ord('X'));
      Output.WriteByte(Ord('E'));
      Output.WriteByte(Ord('_'));
      if AppMode = '/gui' then
      begin
        Output.WriteByte(Ord('G'));
        Output.WriteByte(Ord('U'));
        Output.WriteByte(Ord('I'));
        writeln('Header: SVMEXE / GUI program.');
      end
      else
      begin
        Output.WriteByte(Ord('C'));
        Output.WriteByte(Ord('N'));
        Output.WriteByte(Ord('S'));
        writeln('Header: SVMEXE / Console program.');
      end;
    end
    else
      writeln('Header: SVM / Object file.');
    OptimizeCode(Code);
    Imports := TImportSection.Create(Code);
    Imports.ParseSection;
    Imports.GenerateCode(Output);
    Constants.ParseSection;
    Constants.AppendImports(Imports);
    for c := code.Count - 1 downto 0 do
      if trim(code[c]) = '' then
        code.Delete(c);
    CodeSection := TCodeSection.Create(Code, Constants);
    CodeSection.ParseSection;
    Constants.GenerateCode(Output);
    writeln('Constants defined: ', Constants.Constants.Count, '.');
    CodeSection.GenerateCode(Output);
    writeln('Success.');
    Tm2 := Now;
    writeln('Build time: ', trunc((Tm2 - Tm) / 60), ',', Copy(
      FloatToStr(frac((Tm2 - Tm) / 60)), 3, 6), ' sec.');
    writeln('Executable file size: ', Output.Size, ' bytes.');
    FreeAndNil(Imports);
    FreeAndNil(Constants);
    FreeAndNil(CodeSection);
    Output.SaveToFile(ChangeFileExt(ParamStr(1), '.vmc'));
    FreeAndNil(Output);
  end;
  FreeAndNil(Code);
  FreeAndNil(IncludedFiles);
end.
