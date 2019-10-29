unit svm_libs;

{$mode objfpc}
{$H+}

interface

uses
  SysUtils,
  dynlibs,
  svm_common;

type
  TLibraryListSection = object
  public
    libs: array of THandle;
    procedure SetSize(sz: word);
    procedure SetLibH(id: word; h: THandle);
    procedure Parse(pb: PByteArr; mainclasspath: string);
    function  GetLibH(id: word): THandle;
  end;

implementation

procedure TLibraryListSection.SetSize(sz: word);
begin
  setlength(self.libs, sz);
end;

procedure TLibraryListSection.SetLibH(id: word; h: THandle);
begin
  self.libs[id] := h;
end;

procedure TLibraryListSection.Parse(pb: PByteArr; mainclasspath: string);
var
  bpos: cardinal;
  lib_count, sl: word;
  s: string;
begin
  lib_count := (pb^[0] shl 8) + pb^[1];
  bpos := 2;
  self.SetSize(lib_count);
  while lib_count > 0 do
  begin
    sl := (pb^[bpos] shl 8) + pb^[bpos + 1];
    Inc(bpos, sl + 2);
    s := '';
    while sl > 0 do
    begin
      s := s + chr(pb^[bpos - sl]);
      Dec(sl);
    end;
    if FileExists(ExtractFilePath(mainclasspath) + s) then
      s := ExtractFilePath(mainclasspath) + s
    else if FileExists(ExtractFilePath(ParamStr(0)) + 'lib\' + s) then
      s := ExtractFilePath(ParamStr(0)) + 'lib\' + s
    else if FileExists(ExtractFilePath(ParamStr(0)) + s) then
      s := ExtractFilePath(ParamStr(0)) + s
    else
      VMError('Error: can''t find library "' + s + '".');
    self.SetLibH(cardinal(length(self.libs)) - lib_count, LoadLibrary(s));
    Dec(lib_count);
  end;
  CutLeftBytes(pb, bpos);
end;

function TLibraryListSection.GetLibH(id: word): THandle;
begin
  Result := self.libs[id];
end;

end.

