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
   u_writers,
   u_fast_prep,
   u_prep_switch,
   u_local_variables,
   u_prep_launch;

{** Main **}

var
   Code: TStringList;
   c, x, b: cardinal;
   i64: int64;
   d: double;
   Output: TMemoryStream;
   varmgr: TVarManager;
   Imports: TImportSection;
   CodeSection: TCodeSection;
   Tm, Tm2: cardinal;
   OutFilePath, OutDebugInfoFilePath, s: string;
   dbgig: boolean = False;
   outasmp: boolean = False;
   Cnst: TConstant;
begin
    try
      writeln('Mash lang!');
      writeln('Version: 0.4, Pavel Chernov (c) from 2018.');
      writeln('See more at: https://github.com/RoPi0n/mash-lang');
      if ParamCount = 0 then
       begin
         writeln('Use: ', ExtractFileName(ParamStr(0)), ' <input file> [arguments]');
         writeln('Arguments:');
         writeln(' /cns           - make console program (default).');
         writeln(' /gui           - make GUI program.');
         writeln(' /bin           - make program without header.');
         writeln(' /o-            - build without optimisation.');
         writeln(' /o+            - build with optimization (default).');
         writeln(' /olvl <lvl>    - optimization level: light - 1 (default), middle - 2, full - 3.');
         writeln(' /out <file>    - write output in <file> (default - change extension to "*.vmc").');
         writeln(' /rtti-         - disable RTTI support.');
         writeln(' /rtti+         - enable RTTI support (default).');
         writeln(' /ccargcs+      - enable passing the number of arguments to methods (default).');
         writeln(' /ccargcs-      - disable passing the number of arguments to methods.');
         writeln(' /mdbg+         - enable debug mode.');
         writeln(' /mdbg-         - disable debug mode (default).');
         writeln(' /gdbg+         - enable debug info generation (default enabled if enabled debug mode).');
         writeln(' /gdbg-         - disable debug info generation (default).');
         writeln(' /mdbgo <file>  - write debug info in <file> (default - change extension to "*.mdbg").');
         writeln(' /outinf+       - enable output hints.');
         writeln(' /outinf-       - disable output hints (default).');
         writeln(' /oasmp         - out assembly listing of common part of code.');
         halt;
       end;

      FastPrep_Defines := TStringList.Create;
      OutFilePath := ChangeFileExt(ParamStr(1), '.vmc');
      OutDebugInfoFilePath := ChangeFileExt(ParamStr(1), '.mdbg');

      c := 2;
      while c <= ParamCount do
       begin
         s := Trim(LowerCase(ParamStr(c)));

         if s = '/bin' then
            AppMode := amBin;

         if s = '/gui' then
            AppMode := amGUI;

         if s = '/cns' then
            AppMode := amConsole;

         if s = '/o+' then
            EnableOptimization := True;

         if s = '/o-' then
            EnableOptimization := False;

         if s = '/olvl' then
          begin
            OptimizationLvl := StrToInt(ParamStr(c + 1));
            Inc(c);
          end;

         if s = '/rtti+' then
            RTTI_Enable := True;

         if s = '/rtti-' then
            RTTI_Enable := False;

         if s = '/ccargcs+' then
            ARGC_Enable := True;

         if s = '/ccargcs-' then
            ARGC_Enable := False;

         if s = '/out' then
          begin
            OutFilePath := ParamStr(c + 1);
            Inc(c);
          end;

         if s = '/mdbg+' then
            Debug_Enable := True;

         if s = '/mdbg-' then
            Debug_Enable := False;

         if s = '/gdbg+' then
          begin
            dbgig := True;
            Debug_InfoGen := True;
          end;

         if s = '/gdbg-' then
          begin
            dbgig := True;
            Debug_InfoGen := False;
          end;

         if s = '/mdbgo' then
          begin
            OutDebugInfoFilePath := ParamStr(c + 1);
            Inc(c);
          end;

         if s = '/outinf+' then
            Hints_Enable := True;

         if s = '/outinf-' then
            Hints_Enable := False;

         if s = '/oasmp' then
            outasmp := True;

         Inc(c);
       end;

      if RTTI_Enable then
         FastPrep_Defines.Add('rtti');

      if ARGC_Enable then
         FastPrep_Defines.Add('argcounter');

      if Debug_Enable then
       begin
         FastPrep_Defines.Add('debug');
         if not dbgig then
            Debug_InfoGen := True;
       end;

      Tm := GetTickCount;
      writeln('Building started.');
      DecimalSeparator := '.';
      IncludedFiles := TStringList.Create;
      Code := TStringList.Create;
      Code.LoadFromFile(ParamStr(1));
      Code.Text := 'uses <bf>' + sLineBreak + Code.Text;

      varmgr := TVarManager.Create;
      Constants := TConstantManager.Create(Code);
      InitPreprocessor(varmgr);

      varmgr := TVarManager.Create;
      Constants := TConstantManager.Create(Code);
      InitPreprocessor(varmgr);

      //pre-processing code
      c := 0;
      while c < Code.Count do
       begin
         Code[c] := PreprocessClassCalls(FastPrep(TrimCodeStr(Code[c])));
         Inc(c);
       end;

      PrepLines(Code);

      //pre-processing code
      c := 0;
      while c < Code.Count do
       begin
         PreprocessDefinitions(Code[c], varmgr);
         Inc(c);
       end;

      //compile
      Current_CodeFile := ParamStr(1);
      IncludedFiles.Clear;
      c := 0;
      while c < Code.Count do
       begin
         if Trim(Code[c]) <> '' then
            Code[c] := Trim(PreprocessStr(Code[c], varmgr));
         Inc(c);
       end;
      FreePreprocessor(varmgr);

      if not MainDefined then
       PrpError('Method "main" not found!');

      code.Text :=
         //Initialization + Initialization code
         'word __addrtsz ' + IntToStr(varmgr.DefinedVars.Count) + sLineBreak +
         'pushcp __addrtsz' + sLineBreak + 'msz' +
         sLineBreak + InitCode.Text +

         //Code
         sLineBreak + code.Text + sLineBreak +

         //Entry point call
         'pushcp __entrypoint' + slinebreak + 'jc' +
         sLineBreak + 'pushcp __haltpoint' + sLineBreak + 'jp' +

         // Postinit code + haltpoint
         sLineBreak + PostInitCode.Text + sLineBreak + '__haltpoint:' +
         sLineBreak + 'stkdrop' + sLineBreak + 'gc';

      code.SaveToFile('data.tmp');
      code.LoadFromFile('data.tmp');
      DeleteFile('data.tmp');

      if Code.Count > 0 then
       begin
         Output := TMemoryStream.Create;

         if AppMode <> amBin then
          begin
            Output.WriteByte(Ord('S'));
            Output.WriteByte(Ord('V'));
            Output.WriteByte(Ord('M'));
            Output.WriteByte(Ord('E'));
            Output.WriteByte(Ord('X'));
            Output.WriteByte(Ord('E'));
            Output.WriteByte(Ord('_'));
            if AppMode = amGUI then
             begin
               Output.WriteByte(Ord('G'));
               Output.WriteByte(Ord('U'));
               Output.WriteByte(Ord('I'));
               writeln('Header: Executable GUI program.');
             end
            else
             begin
               Output.WriteByte(Ord('C'));
               Output.WriteByte(Ord('N'));
               Output.WriteByte(Ord('S'));
               writeln('Header: Executable console program.');
             end;
          end
         else
            writeln('Header: Executable object file.');

         if EnableOptimization then
            OptimizeCode(Code);

         FreeAndNil(ImportsLst);

         Imports := TImportSection.Create(Code);
         Imports.ParseSection;
         Imports.GenerateCode(Output);

         Constants.AppendImports(Imports);
         Constants.ParseSection;

         for c := code.Count - 1 downto 0 do
            if trim(code[c]) = '' then
               code.Delete(c);

         s := Code.Text;

         CodeSection := TCodeSection.Create(Code, Constants);
         CodeSection.ParseSection;
         Constants.GenerateCode(Output);
         //writeln('Constants defined: ', Constants.Constants.Count, '.');

         CodeSection.GenerateCode(Output);

         Code.Text := s;

         if outasmp then
          begin
       {c := 0;
       Code.Add('');
       while c < Constants.Constants.Count do
        begin
          Cnst := TConstant(Constants.Constants[c]);
          x := 0;
          while x < Cnst.c_names.Count do
           begin
             if Pos(AutoDefConstPref, Cnst.c_names[x]) > 0 then
              begin
                case Cnst.c_type of
                  ctUnsigned64: begin
                    Cnst.c_value.Read(b, Cnst.c_value.Size);
                    Code.Add('word ' + Cnst.c_names[x] + ' ' + IntToStr(b));
                  end;

                  ctInt64: begin
                    Cnst.c_value.Read(i64, Cnst.c_value.Size);
                    Code.Add('int  ' + Cnst.c_names[x] + ' ' + IntToStr(i64));
                  end;

                  ctDouble: begin
                    Cnst.c_value.Read(d, Cnst.c_value.Size);
                    Code.Add('real ' + Cnst.c_names[x] + ' ' + FloatToStr(d));
                  end;

                  ctString: begin
                    SetLength(s, Cnst.c_value.Size);
                    Cnst.c_value.Read(s[1], Cnst.c_value.Size);
                    Code.Add('str  ' + Cnst.c_names[x] + ' "' + s + '"');
                  end;
                end;
              end;
             inc(x);
           end;
          inc(c);
        end;}

            Code.SaveToFile(ChangeFileExt(OutFilePath, '.partof.asm'));
          end;

         writeln('Success.');
         Tm2 := GetTickCount;
         writeln('Build time: ', trunc((Tm2 - Tm) / 1000), ',', Copy(
            FloatToStr(frac((Tm2 - Tm) / 1000)), 3, 6), ' sec.');
         writeln('Executable file size: ', Output.Size, ' bytes.');

         FreeAndNil(CodeSection);

         Output.SaveToFile(OutFilePath);
         FreeAndNil(Output);

         if Debug_InfoGen then
          begin
            Output := TMemoryStream.Create;
            Output.Clear;
            c := Varmgr.DefinedVars.Count;
            Output.Write(c, sizeof(c));
            c := 0;
            while c < Varmgr.DefinedVars.Count do
             begin
               x := Length(Varmgr.DefinedVars[c]);
               Output.Write(x, sizeof(x));
               s := Varmgr.DefinedVars[c];
               Output.Write(s[1], x);
               Inc(c);
             end;
            Output.SaveToFile(OutDebugInfoFilePath);
            FreeAndNil(Output);
          end;

         FreeAndNil(varmgr);
         FreeAndNil(Imports);
         FreeAndNil(Constants);
       end;
      FreeAndNil(Code);
      FreeAndNil(IncludedFiles);

    except
      on E: EOutOfMemory do
         writeln('Internal compiler exception: out of memory.');
      on E: EInOutError do
         writeln('I/O exception.');
      on E: Exception do
         writeln('Internal compiler exception: "' + E.Message + '".');
    end;
end.
