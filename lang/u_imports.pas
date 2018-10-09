unit u_imports;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global;

type
  TImportLibrary = class(TObject)
  public
    LibraryPath: string;
    Imports, Methods: TStringList;
    constructor Create(lpath: string);
    destructor Destroy; override;
  end;

  TImportSection = class(TObject)
  public
    Libs: TList;
    Lines: TStringList;
    constructor Create(sl: TStringList);
    destructor Destroy; override;
    function GetLibIndx(l_path: string): integer;
    procedure AddMethod(l_path, m_name, exm_name: string);
    procedure ParseSection;
    procedure GenerateCode(Stream: TStream);
  end;

implementation

{** ImportLibrary **}

constructor TImportLibrary.Create(lpath: string);
begin
  LibraryPath := lpath;
  Imports := TStringList.Create;
  Methods := TStringList.Create;
  inherited Create;
end;

destructor TImportLibrary.Destroy;
begin
  Imports.Free;
  Methods.Free;
  inherited Destroy;
end;

{** ImportSection **}

constructor TImportSection.Create(sl: TStringList);
begin
  Self.Lines := sl;
  Libs := TList.Create;
  inherited Create;
end;

destructor TImportSection.Destroy;
var
  w: word;
begin
  if Libs.Count > 0 then
    for w := 0 to Libs.Count - 1 do
      TImportLibrary(Libs[w]).Free;
  FreeAndNil(Libs);
  inherited Destroy;
end;

function TImportSection.GetLibIndx(l_path: string): integer;
var
  c: cardinal;
begin
  Result := -1;
  c := 0;
  while c < Libs.Count do
  begin
    if TImportLibrary(Libs[c]).LibraryPath = l_path then
    begin
      Result := c;
      break;
    end;
    Inc(c);
  end;
end;

procedure TImportSection.AddMethod(l_path, m_name, exm_name: string);
var
  lb_indx: integer;
begin
  lb_indx := GetLibIndx(l_path);
  if lb_indx <> -1 then
  begin
    with TImportLibrary(Libs[lb_indx]) do
    begin
      if Methods.IndexOf(m_name) <> -1 then
        AsmError('Dublicate import "' + m_name + '", from "' +
          l_path + '":"' + exm_name + '"');
      Methods.Add(m_name);
      Imports.Add(exm_name);
    end;
  end
  else
  begin
    Libs.Add(TImportLibrary.Create(l_path));
    with TImportLibrary(Libs[Libs.Count - 1]) do
    begin
      Methods.Add(m_name);
      Imports.Add(exm_name);
    end;
  end;
end;

procedure TImportSection.ParseSection;
var
  c: cardinal;
begin
  c := 0;
  while c < Lines.Count do
  begin
    if Tk(Lines[c], 1) = 'import' then
    begin
      AddMethod(Tk(Lines[c], 3), Tk(Lines[c], 2), Tk(Lines[c], 4));
      Lines[c] := '';
    end;
    Inc(c);
  end;
end;

procedure TImportSection.GenerateCode(Stream: TStream);
var
  w, w1: word;
  b: byte;
  c: cardinal;
begin
  w := Libs.Count;
  St_WriteWord(Stream, w);
  if w > 0 then
  begin
    for w := 0 to Libs.Count - 1 do
      with TImportLibrary(Libs[w]) do
      begin
        w1 := Length(LibraryPath);
        St_WriteWord(Stream, w1);
        Stream.WriteBuffer(LibraryPath[1], w1);
      end;
    c := 0;
    for w := 0 to Libs.Count - 1 do
      with TImportLibrary(Libs[w]) do
      begin
        c := c + Imports.Count;
      end;
    St_WriteCardinal(Stream, c);
    for w := 0 to Libs.Count - 1 do
      with TImportLibrary(Libs[w]) do
      begin
        if Imports.Count > 0 then
          for w1 := 0 to Imports.Count - 1 do
          begin
            b := Length(Imports[w1]);
            St_WriteWord(Stream, w);
            Stream.WriteByte(b);
            if b > 0 then
              Stream.WriteBuffer(Imports[w1][1], b);
          end;
      end;
  end;
end;

end.
