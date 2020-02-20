unit u_compiler;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  u_parser,
  u_ast_constructions,
  u_ast_blocks,
  u_tokens,
  u_ast_constructions_blocks,
  u_sem,
  u_gen;

type
  TMashCompiler = class
    protected
      fp, destp: string;

    public
      constructor Create(_fp, _destp: string);
      procedure Compile;
  end;

implementation

constructor TMashCompiler.Create(_fp, _destp: string);
begin
  self.fp := _fp;
  self.destp := _destp;
end;

procedure TMashCompiler.Compile;
var
  mainpath, path: string;
  code, included: TStringList;
  parser: TMashParser;
  i, k: cardinal;
  imports_lst, regapi_lst, uses_lst, const_lst, ast_lst: TList;
  ast: TMashAST;
  parsers: TList;

  u: TMashASTB_Uses;
  t: TMashToken;

  sem: TMashSEM;
  outp: TStringList;
begin
  writeln('Starting compilation, target: ', self.fp);
  mainpath := ExtractFilePath(self.fp);

  parsers := TList.Create;

  included := TStringList.Create;
  included.add(self.fp);

  code := TStringList.Create;
  try
    code.LoadFromFile(self.fp);
  except
    on E: Exception do
      raise Exception.Create('Can''t open file "' + self.fp + '".');
  end;

  parser := TMashParser.Create(code, self.fp);
  parsers.add(parser);
  parser.Parse;

  imports_lst := TList.Create;
  regapi_lst := TList.Create;
  uses_lst := TList.Create;
  const_lst := TList.Create;
  ast_lst := TList.Create;

  ast := TMashAST.Create(parser.tokens, imports_lst, regapi_lst, uses_lst, const_lst);
  ast_lst.add(ast);
  ast.process;

  // Including inc\sys.mash
  path := 'inc\sys.mash';
  try
    code.Clear;
    code.LoadFromFile(path);
  except
    raise Exception.Create('Can''t open file ''' + path + '''.');
  end;

  parser := TMashParser.Create(code, path);
  parsers.add(parser);
  parser.Parse;

  ast := TMashAST.Create(parser.tokens, imports_lst, regapi_lst, uses_lst, const_lst);
  ast_lst.add(ast);
  ast.Process;
  included.add(path);

  // Checking another uses
  i := 0;
  while i < uses_lst.count do
   begin
     u := TMashASTB_Uses(uses_lst[i]);
     path := '';
     t := TMashToken(u.Expr[0]);
     if (u.Expr.count = 1) and (t.info = ttString) then
       path := mainpath + t.value
     else
      begin
        path := 'inc\';
        k := 0;

        while k < u.Expr.count do
         begin
           t := TMashToken(u.Expr[k]);
           if t.info = ttToken then
            begin
              if t.value = '.' then
                path := path + '\'
              else
                raise Exception.Create(
                  'Invalid uses at line ' + IntToStr(t.line + 1) +
                  ' at file ''' + t.filep^ + '''.'
                );
            end
           else
             path := path + t.value;

           Inc(k);
         end;

        path := path + '.mash';
      end;

     if included.IndexOf(path) = -1 then
      begin
        try
          code.Clear;
          code.LoadFromFile(path);
        except
          raise Exception.Create('Can''t open file ''' + path + '''.');
        end;

        writeln('[uses]: ''' + path + '''...');
        parser := TMashParser.Create(code, path);
        parsers.add(parser);
        parser.Parse;

        ast := TMashAST.Create(parser.tokens, imports_lst, regapi_lst, uses_lst, const_lst);
        ast_lst.add(ast);
        ast.Process;

        included.add(path);
      end;

    Inc(i);
  end;

  // Semantic analyse of code
  writeln('Semantic analyse...');
  Sem := TMashSem.Create(imports_lst, regapi_lst, ast_lst, const_lst);
  Sem.Process;

  writeln('Generating output...');
  Outp := TStringList.Create;
  GenerateCode(gaSVM, Sem, Outp);

  Outp.SaveToFile(self.destp);

  {CleanUpASTBlocks;

  FreeAndNil(code);

  while Parsers.Count > 0 do
   begin
     TMashParser(Parsers[0]).Free;
     Parsers.Delete(0);
   end;
  FreeAndNil(parsers);

  FreeAndNil(imports_lst);
  FreeAndNil(regapi_lst);
  FreeAndNil(uses_lst);
  FreeAndNil(const_lst);

  while ast_lst.Count > 0 do
   begin
     TMashAST(ast_lst[0]).Free;
     ast_lst.Delete(0);
   end;
  FreeAndNil(ast_lst);}
end;

end.

