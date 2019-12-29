unit u_consts;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_imports, u_writers, u_common;

type
  TConstantType = (
    ctUnsigned64,
    ctInt64,
    ctDouble,
    ctString,
    ctStream
    );

  TConstant = class(TObject)
  public
    c_names: TStringList;
    c_type: TConstantType;
    c_value: TMemoryStream;
    constructor Create;
    destructor Destroy; override;
    procedure GenerateCode(Stream: TStream);
  end;

  TConstantManager = class(TObject)
  public
    Constants: TList;
    Lines: TStringList;
    constructor Create(sl: TStringList);
    destructor Destroy; override;
    procedure AddConstCardinal(c_name: string; c: cardinal);
    procedure Add(Cnst: TConstant);
    function GetAddr(c_name: string): cardinal;
    procedure ParseSection;
    procedure AppendImports(ImportSection: TImportSection);
    procedure GenerateCode(Stream: TStream);
  end;

implementation

{** Constant **}

constructor TConstant.Create;
begin
  c_value := TMemoryStream.Create;
  c_names := TStringList.Create;
  inherited Create;
end;

destructor TConstant.Destroy;
begin
  c_value.Free;
  inherited Destroy;
end;

procedure TConstant.GenerateCode(Stream: TStream);
begin
  case c_type of
    ctUnsigned64:
    begin
      Stream.WriteByte(byte(ctUnsigned64));
      Stream.WriteBuffer(c_value.Memory^, c_value.size);
    end;
    ctInt64:
    begin
      Stream.WriteByte(byte(ctInt64));
      Stream.WriteBuffer(c_value.Memory^, c_value.size);
    end;
    ctDouble:
    begin
      Stream.WriteByte(byte(ctDouble));
      Stream.WriteBuffer(c_value.Memory^, c_value.size);
    end;
    ctString:
    begin
      Stream.WriteByte(byte(ctString));
      St_WriteWord(Stream, c_value.Size);
      Stream.WriteBuffer(c_value.Memory^, c_value.size);
    end;
    ctStream:
    begin
      Stream.WriteByte(byte(ctStream));
      St_WriteCardinal(Stream, c_value.Size);
      Stream.WriteBuffer(c_value.Memory^, c_value.Size);
    end;
  end;
end;

{** ConstantManager **}

constructor TConstantManager.Create(sl: TStringList);
begin
  Lines := sl;
  Constants := TList.Create;
  inherited Create;
end;

destructor TConstantManager.Destroy;
var
  c: cardinal;
begin
  if Constants.Count > 0 then
    for c := 0 to Constants.Count - 1 do
      TConstant(Constants[c]).Free;
  Constants.Free;
  inherited Destroy;
end;

function CompareStreams(s1, s2: TMemoryStream): boolean;
var
  c: cardinal;
begin
  Result := False;
  if (s1 <> nil) and (s2 <> nil) then
    if s1.Size = s2.Size then
    begin
      c := 0;
      Result := True;
      while c < s1.Size do
      begin
        Result := Result and (PByte(Pointer(s1.Memory) + c)^ =
          PByte(Pointer(s2.Memory) + c)^);
        Inc(c);
      end;
    end;
end;

procedure TConstantManager.Add(Cnst: TConstant);
var
  c: cardinal;
  Cnst2: TConstant;
begin
  c := 0;
  while c < Constants.Count do
  begin
    Cnst2 := TConstant(Constants[c]);
    if Cnst.c_type = Cnst2.c_type then
      if CompareStreams(Cnst.c_value, Cnst2.c_value) then
      begin
        Cnst2.c_names.AddStrings(Cnst.c_names);
        FreeAndNil(Cnst);
        Exit;
      end;
    Inc(c);
  end;
  Constants.Add(Cnst);
end;

procedure TConstantManager.AddConstCardinal(c_name: string; c: cardinal);
var
  Constant: TConstant;
begin
  Constant := TConstant.Create;
  Constant.c_names.Add(c_name);
  Constant.c_type := ctUnsigned64;
  St_WriteCardinal(Constant.c_value, c);
  Constants.Add(Constant);
end;

function TConstantManager.GetAddr(c_name: string): cardinal;
var
  c: cardinal;
  Cnst: TConstant;
begin
  if pos(sLineBreak, c_name) > 0 then
    c_name := copy(c_name, 1, pos(slinebreak, c_name) - 1);

  if Constants.Count = 0 then
    AsmErr('Invalid constant call "' + c_name + '".');

  for c := 0 to Constants.Count - 1 do
  begin
    Cnst := TConstant(Constants[c]);
    if Cnst.c_names.IndexOf(c_name) <> -1 then
    begin
      Result := c;
      break;
    end
    else
    if c = Constants.Count - 1 then
      AsmErr('Invalid constant call "' + c_name + '"');
  end;
end;

procedure TConstantManager.ParseSection;
var
  c: cardinal;
  Constant: TConstant;
  s, t: string;
begin
  c := 0;
  while c < Lines.Count do
  begin
    s := Trim(Lines[c]);
    t := Tk(s, 1);
    if t = 'word' then
    begin
      Constant := TConstant.Create;
      Constant.c_names.Add(Tk(s, 2));
      Constant.c_type := ctUnsigned64;
      St_WriteCardinal(Constant.c_value, StrToQWord(Tk(s, 3)));
      Self.Add(Constant);
      Lines[c] := '';
    end;

    if t = 'int' then
    begin
      Constant := TConstant.Create;
      Constant.c_names.Add(Tk(s, 2));
      Constant.c_type := ctInt64;
      St_WriteInt64(Constant.c_value, StrToInt(Tk(s, 3)));
      Self.Add(Constant);
      Lines[c] := '';
    end;

    if t = 'real' then
    begin
      Constant := TConstant.Create;
      Constant.c_names.Add(Tk(s, 2));
      Constant.c_type := ctDouble;
      St_WriteDouble(Constant.c_value, double(StrToFloat(Tk(s, 3))));
      Self.Add(Constant);
      Lines[c] := '';
    end;

    if t = 'str' then
    begin
      Constant := TConstant.Create;
      Constant.c_names.Add(Tk(s, 2));
      Constant.c_type := ctString;
      Constant.c_value.WriteBuffer(Tk(s, 3)[1], Length(Tk(s, 3)));
      Self.Add(Constant);
      Lines[c] := '';
    end;

    if t = 'stream' then
    begin
      Constant := TConstant.Create;
      Constant.c_names.Add(Tk(s, 2));
      Constant.c_type := ctStream;
      Constant.c_value.LoadFromFile(ExtractFilePath(ParamStr(1)) + Tk(s, 3));
      Self.Add(Constant);
      Lines[c] := '';
    end;

    if t = 'api' then
    begin
      Constant := TConstant.Create;
      Constant.c_names.Add(Tk(s, 2));
      Constant.c_type := ctUnsigned64;
      St_WriteCardinal(Constant.c_value, RgAPICnt);
      inc(RgAPICnt);
      Self.Add(Constant);
      Lines[c] := '';
    end;

    Inc(c);
  end;
end;

procedure TConstantManager.AppendImports(ImportSection: TImportSection);
var
  w: word;
  c, c2: cardinal;
  Constant: TConstant;
begin
  if ImportSection.Libs.Count > 0 then
  begin
    c := 0;
    for w := 0 to ImportSection.Libs.Count - 1 do
    begin
      with TImportLibrary(ImportSection.Libs[w]) do
      begin
        if Methods.Count > 0 then
        begin
          for c2 := 0 to Methods.Count - 1 do
          begin
            Constant := TConstant.Create;
            Constant.c_names.Add(Methods[c2]);
            Constant.c_type := ctUnsigned64;
            St_WriteCardinal(Constant.c_value, c + RgAPICnt);
            Constants.Add(Constant);
            Inc(c);
          end;
        end;
      end;
    end;
  end;
end;

procedure TConstantManager.GenerateCode(Stream: TStream);
var
  c: cardinal;
begin
  St_WriteCardinal(Stream, Constants.Count);
  if Constants.Count > 0 then
    for c := 0 to Constants.Count - 1 do
      TConstant(Constants[c]).GenerateCode(Stream);
end;

end.

