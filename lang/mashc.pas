program mashc;

{$Apptype console}
{$Mode objfpc}
{$H+}

uses
  SysUtils,
  Classes,
  u_imports,
  u_global,
  u_consts,
  u_variables,
  u_globalvars,
  u_codesect,
  u_preprocessor,
  u_optimizator,
  u_classes,
  u_prep_global,
  u_prep_codeblock,
  u_prep_methods,
  u_prep_expressions,
  u_prep_array,
  u_prep_enums,
  u_prep_vardefs,
  u_prep_c_methods,
  u_prep_c_ifelse,
  u_prep_c_global,
  u_prep_c_try,
  u_prep_c_loops,
  u_prep_c_classes,
  u_writers;

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
  OutFilePath, s: string;
  EnableOptimization: boolean = True;
begin
  writeln('Mash lang!');
  writeln('Version: 1.2, Pavel Shiryaev (c) from 2018.');
  writeln('See more at: https://github.com/RoPi0n/mash-lang');
  if ParamCount = 0 then
  begin
    writeln('Use: ', ExtractFileName(ParamStr(0)), ' <input file> [arguments]');
    writeln('Arguments:');
    writeln(' /cns        - make console program (default).');
    writeln(' /gui        - make GUI program.');
    writeln(' /bin        - make program without header.');
    writeln(' /o-         - build without optimisation.');
    writeln(' /o+         - build with optimization (default).');
    writeln(' /out <file> - write output in <file> (default - change extension to "*.vmc").');
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
      Code[c] := PreprocessClassCalls(TrimCodeStr(Code[c]));
 {for c:=code.count-1 downto 0 do
  if trim(code[c
  ])='' then code.delete(c);}
  varmgr := TVarManager.Create;
  Constants := TConstantManager.Create(Code);
  //WriteLn('Code analyzing...');
  InitPreprocessor;
  c := 0;
  while c < Code.Count do
  begin
    if Trim(Code[c]) <> '' then
      PreprocessDefinitions(Code[c], varmgr);
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
  FreePreprocessor(varmgr);
  code.Text := 'word __addrtsz ' + IntToStr(varmgr.DefinedVars.Count) +
    sLineBreak + 'pushc __addrtsz' + sLineBreak + 'gpm' + sLineBreak +
    'msz' + sLineBreak + 'gc' + sLineBreak + InitCode.Text + sLineBreak +
    'pushc __entrypoint' + slinebreak + 'gpm' + slinebreak + 'jc' +
    sLineBreak + 'pushc __haltpoint' + sLineBreak + 'gpm' + sLineBreak +
    'jp' + sLineBreak + code.Text + sLineBreak + '__haltpoint:' + sLineBreak + 'gc';
  code.SaveToFile('buf.tmp');
  code.LoadFromFile('buf.tmp');
  DeleteFile('buf.tmp');
  if Code.Count > 0 then
  begin
    OutFilePath := ChangeFileExt(ParamStr(1), '.vmc');
    Output := TMemoryStream.Create;

    c := 2;
    while c <= ParamCount do
    begin
      s := Trim(LowerCase(ParamStr(c)));

      if (s = '/bin') or (s = '/gui') or (s = '/cns') then
        AppMode := s;

      if s = '/o+' then
        EnableOptimization := True;

      if s = '/o-' then
        EnableOptimization := False;

      if s = '/out' then
      begin
        OutFilePath := ParamStr(c + 1);
        Inc(c);
      end;

      Inc(c);
    end;

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
        writeln('Header: SVM - Executable GUI program.');
      end
      else
      begin
        Output.WriteByte(Ord('C'));
        Output.WriteByte(Ord('N'));
        Output.WriteByte(Ord('S'));
        writeln('Header: SVM - Executable console program.');
      end;
    end
    else
      writeln('Header: SVM - Executable object file.');

    if EnableOptimization then
      OptimizeCode(Code);

    Imports := TImportSection.Create(Code);
    Imports.ParseSection;
    Imports.GenerateCode(Output);
    Constants.AppendImports(Imports);
    Constants.ParseSection;
    for c := code.Count - 1 downto 0 do
      if trim(code[c]) = '' then
        code.Delete(c);
    CodeSection := TCodeSection.Create(Code, Constants);
    CodeSection.ParseSection;
    Constants.GenerateCode(Output);
    //writeln('Constants defined: ', Constants.Constants.Count, '.');
    CodeSection.GenerateCode(Output);
    writeln('Success.');
    Tm2 := Now;
    writeln('Build time: ', trunc((Tm2 - Tm) / 60), ',', Copy(
      FloatToStr(frac((Tm2 - Tm) / 60)), 3, 6), ' sec.');
    writeln('Executable file size: ', Output.Size, ' bytes.');
    FreeAndNil(Imports);
    FreeAndNil(Constants);
    FreeAndNil(CodeSection);
    Output.SaveToFile(OutFilePath);
    FreeAndNil(Output);
  end;
  FreeAndNil(Code);
  FreeAndNil(IncludedFiles);
end.
