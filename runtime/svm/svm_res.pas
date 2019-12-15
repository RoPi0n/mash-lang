unit svm_res;

{$mode objfpc}
{$H+}

interface

uses
  Classes,
  SysUtils,
  svm_common,
  svm_mem;

type
  TConstType = (
    ctUnsigned64,
    ctInt64,
    ctDouble,
    ctString,
    ctStream
    );

type
  TConstSection = object
  private
    constants: array of pointer;
    procedure SetSize(sz: cardinal);
    procedure SetConst(id: cardinal; v: pointer);
  public
    procedure Parse(pb: PByteArr);
    function GetConst(id: cardinal): pointer;
  end;

  PConstSection = ^TConstSection;

implementation

procedure TConstSection.SetSize(sz: cardinal);
begin
  setlength(self.constants, sz);
end;

procedure TConstSection.SetConst(id: cardinal; v: pointer);
begin
  self.constants[id] := v;
end;

  {$HINTS OFF}
procedure TConstSection.Parse(pb: PByteArr);
var
  consts_count, bpos: cardinal;
  sl: word;
  s: string;
  stl: cardinal;
  st: TMemoryStream;
  d: double;
  i: int64;
begin
  consts_count := cardinal((pb^[3] shl 24) + (pb^[2] shl 16) +
    (pb^[1] shl 8) + pb^[0]);
  bpos := 4;
  self.SetSize(consts_count);
  while consts_count > 0 do
  begin
    case TConstType(pb^[bpos]) of
      ctUnsigned64:
      begin
        self.SetConst(
          cardinal(length(self.constants)) - consts_count,
          TSVMMem.MCreateFW(cardinal((pb^[bpos + 4] shl 24) +
          (pb^[bpos + 3] shl 16) + (pb^[bpos + 2] shl 8) + pb^[bpos + 1]))
          );

        Inc(bpos, 5);
      end;

      ctInt64:
      begin
        PByte(@i + 7)^ := pb^[bpos + 1];
        PByte(@i + 6)^ := pb^[bpos + 2];
        PByte(@i + 5)^ := pb^[bpos + 3];
        PByte(@i + 4)^ := pb^[bpos + 4];
        PByte(@i + 3)^ := pb^[bpos + 5];
        PByte(@i + 2)^ := pb^[bpos + 6];
        PByte(@i + 1)^ := pb^[bpos + 7];
        PByte(@i)^ := pb^[bpos + 4];
        self.SetConst(
          cardinal(length(self.constants)) - consts_count,
          TSVMMem.MCreateF(i, svmtInt)
          );
        Inc(bpos, 9);
      end;

      ctDouble:
      begin
        PByte(@d + 7)^ := pb^[bpos + 1];
        PByte(@d + 6)^ := pb^[bpos + 2];
        PByte(@d + 5)^ := pb^[bpos + 3];
        PByte(@d + 4)^ := pb^[bpos + 4];
        PByte(@d + 3)^ := pb^[bpos + 5];
        PByte(@d + 2)^ := pb^[bpos + 6];
        PByte(@d + 1)^ := pb^[bpos + 7];
        PByte(@d)^ := pb^[bpos + 8];
        self.SetConst(
          cardinal(length(self.constants)) - consts_count,
          TSVMMem.MCreateF(d, svmtReal));
        Inc(bpos, 9);
      end;

      ctString:
      begin
        sl := (pb^[bpos + 1] shl 8) + pb^[bpos + 2];
        Inc(bpos, sl + 3);
        s := '';
        while sl > 0 do
        begin
          s := s + chr(pb^[bpos - sl]);
          Dec(sl);
        end;
        self.SetConst(cardinal(length(self.constants)) - consts_count,
          TSVMMem.MCreateFS(s));
      end;

      ctStream:
      begin
        stl := cardinal((pb^[bpos + 4] shl 24) + (pb^[bpos + 3] shl 16) +
          (pb^[bpos + 2] shl 8) + pb^[bpos + 1]);
        Inc(bpos, 5);
        st := TMemoryStream.Create;
        st.SetSize(stl);
        st.Seek(0, soFromBeginning);
        st.WriteBuffer(pb^[bpos], stl);
        st.Seek(0, soFromBeginning);
        Inc(bpos, stl);
        self.SetConst(cardinal(length(self.constants)) - consts_count,
          TSVMMem.MCreateRef(st));
      end;
      else
        VMError('Error: resource section format not supported.');
    end;
    Dec(consts_count);
  end;
  CutLeftBytes(pb, bpos);
end;

  {$HINTS ON}

function TConstSection.GetConst(id: cardinal): pointer;
begin
  Result := self.constants[id];
end;

end.
