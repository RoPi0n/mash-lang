unit svm_imports;

{$mode objfpc}
{$H+}

interface

uses
  SysUtils,
  dynlibs,
  svm_common,
  svm_libs;

type
  TExternalFunction = procedure(pContext: pointer); stdcall;
  PExternalFunction = ^TExternalFunction;

type
  TImportSection = object
  public
    methods: array of PExternalFunction;
    libs: TLibraryListSection;
    procedure SetSize(sz: cardinal);
    procedure SetFunc(id: cardinal; p: PExternalFunction);
    procedure Parse(pb: PByteArr; mainclasspath: string);
    function GetFunc(id: cardinal): PExternalFunction;
  end;

  PImportSection = ^TImportSection;

implementation

procedure TImportSection.SetSize(sz: cardinal);
begin
  setlength(self.methods, sz);
end;

procedure TImportSection.SetFunc(id: cardinal; p: PExternalFunction);
begin
  self.methods[id] := p;
end;

procedure TImportSection.Parse(pb: PByteArr; mainclasspath: string);
var
  methods_count, bpos: cardinal;
  lb: word;
  sl: byte;
  s: string;
  ssz: cardinal;
begin
  ssz := length(self.methods);
  libs.Parse(pb, mainclasspath);
  if length(libs.libs) > 0 then
  begin
    methods_count := cardinal((pb^[3] shl 24) + (pb^[2] shl 16) +
      (pb^[1] shl 8) + pb^[0]);
    bpos := 4;
    self.SetSize(methods_count + ssz);
    while methods_count > 0 do
    begin
      lb := (pb^[bpos] shl 8) + pb^[bpos + 1];
      sl := pb^[bpos + 2];
      Inc(bpos, sl + 3);
      s := '';
      while sl > 0 do
      begin
        s := s + chr(pb^[bpos - sl]);
        Dec(sl);
      end;
      self.SetFunc(cardinal(length(self.methods)) - methods_count,
        GetProcAddress(libs.GetLibH(lb), s));
      Dec(methods_count);
    end;
    CutLeftBytes(pb, bpos);
  end;
end;

function TImportSection.GetFunc(id: cardinal): PExternalFunction;
begin
  Result := self.methods[id];
end;


end.
