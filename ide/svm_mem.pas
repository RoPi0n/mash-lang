unit svm_mem;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, svm_grabber;

type
  TSVMType = (svmtNull, svmtWord, svmtInt, svmtReal, svmtStr, svmtArr);

  TSVMMem = class
    m_val: pointer;
    m_type: TSVMType;
    constructor Create;
    constructor CreateF(const value; t:TSVMType);
    constructor CreateFS(s:string);
    constructor CreateFW(w:cardinal);
    constructor CreateArr(size:cardinal = 0);
    constructor CreateCopy(m:TSVMMem);
    destructor Destroy; override;

    procedure Clear;

    // variables

    procedure SetV(const value; t:TSVMType);
    procedure SetW(value:cardinal);
    procedure SetI(value:int64);
    procedure SetD(value:double);
    procedure SetS(value:string);
    procedure SetB(b:boolean);
    procedure SetM(m:TSVMMem);

    function  GetW: cardinal;
    function  GetI: int64;
    function  GetD: double;
    function  GetS: string;
    function  GetB: boolean;

    procedure OpEq(m:TSVMMem);
    procedure OpBg(m:TSVMMem);
    procedure OpBe(m:TSVMMem);

    procedure OpNot;
    procedure OpAnd(m:TSVMMem);
    procedure OpOr(m:TSVMMem);
    procedure OpXor(m:TSVMMem);
    procedure OpShl(m:TSVMMem);
    procedure OpShr(m:TSVMMem);

    procedure OpInc;
    procedure OpDec;
    procedure OpNeg;

    procedure OpAdd(m:TSVMMem);
    procedure OpSub(m:TSVMMem);
    procedure OpDiv(m:TSVMMem);
    procedure OpMul(m:TSVMMem);
    procedure OpIDiv(m:TSVMMem);
    procedure OpMod(m:TSVMMem);

    // arrays

    procedure ArrSetSize(newsize: cardinal);
    function  ArrGetSize: cardinal;
    procedure ArrSet(index: cardinal; val:pointer);
    function  ArrGet(index: cardinal; grabber:PGrabber): pointer;

    // any

    function GetSize: cardinal;
  end;

  TMemArray = array of pointer;
  PMemArray = ^TMemArray;

implementation

constructor TSVMMem.Create;
begin
  inherited;
  m_val := nil;
  m_type := svmtNull;
end;

constructor TSVMMem.CreateF(const value; t:TSVMType);
begin
  inherited;
  m_val := nil;
  m_type := t;
  SetV(value, t);
end;

constructor TSVMMem.CreateFS(s:string);
begin
  inherited;
  m_val := nil;
  m_type := svmtStr;
  SetS(S);
end;

constructor TSVMMem.CreateFW(w:cardinal);
begin
  inherited;
  m_val := nil;
  m_type := svmtWord;
  SetW(w);
end;

constructor TSVMMem.CreateArr(size:cardinal = 0);
begin
  inherited;
  m_type := svmtArr;
  new(PMemArray(m_val));
  SetLength(PMemArray(m_val)^, size);
end;

constructor TSVMMem.CreateCopy(m:TSVMMem);
begin
  inherited;
  m_val := nil;
  m_type := m.m_type;
  SetV(m.m_val^, m.m_type);
end;

destructor TSVMMem.Destroy;
begin
  Clear;
  inherited;
end;

procedure TSVMMem.Clear;
begin
  case m_type of
    svmtNull: { nop };
    svmtWord: Dispose(PCardinal(m_val));
    svmtInt:  Dispose(PInt64(m_val));
    svmtReal: Dispose(PDouble(m_val));
    svmtStr:  Dispose(PString(m_val));
    svmtArr:  begin
                SetLength(PMemArray(m_val)^, 0);
                Dispose(PMemArray(m_val));
              end;
    else
      Error(reVarInvalidOp);
  end;
end;

{** Setters **}

procedure TSVMMem.SetV(const value; t:TSVMType);
begin
  if (m_val <> nil) and (m_type = t) then
   begin
     case t of
       svmtWord: PCardinal(m_val)^ := Cardinal(value);
       svmtInt:  PInt64(m_val)^ := Int64(value);
       svmtReal: PDouble(m_val)^ := Double(value);
       svmtStr:  PString(m_val)^ := String(value);
     end;
   end
  else
   begin
     if m_val <> nil then
      FreeMem(m_val);

     m_type := t;
     case t of
       svmtWord: begin
                   New(PCardinal(m_val));
                   PCardinal(m_val)^ := Cardinal(value);
                 end;
       svmtInt:  begin
                   New(PInt64(m_val));
                   PInt64(m_val)^ := Int64(value);
                 end;
       svmtReal: begin
                   New(PDouble(m_val));
                   PDouble(m_val)^ := Double(value);
                 end;
       svmtStr:  begin
                   New(PString(m_val));
                   PString(m_val)^ := String(value);
                 end;
       else
         Error(reVarTypeCast);
     end;
   end;
end;

procedure TSVMMem.SetW(value:cardinal);
begin
  SetV(value, svmtWord);
end;

procedure TSVMMem.SetI(value:int64);
begin
  SetV(value, svmtInt);
end;

procedure TSVMMem.SetD(value:double);
begin
  SetV(value, svmtReal);
end;

procedure TSVMMem.SetS(value:string);
begin
  SetV(value, svmtStr);
end;

procedure TSVMMem.SetB(b:boolean);
var
  i:Int64;
begin
  if b then
   i := -1
  else
   i := 0;

  SetV(i, svmtInt);
end;

procedure TSVMMem.SetM(m:TSVMMem);
begin
  case m.m_type of
    svmtArr: begin
               m_val := m.m_val;
               m_type := m.m_type;
               Clear;
             end;
    else
      SetV(m.m_val^, m.m_type);
  end;
end;

{** Getters **}

function TSVMMem.GetW:cardinal;
begin
  Result := 0;
  case m_type of
    svmtWord: Result := PCardinal(m_val)^;
    svmtInt:  Result := PInt64(m_val)^;
    svmtReal: Result := Trunc(PDouble(m_val)^);
    svmtStr:  Result := StrToQWord(PString(m_val)^);
    else
      Error(reVarTypeCast);
  end;
end;

function TSVMMem.GetI:int64;
begin
  Result := 0;
  case m_type of
    svmtWord: Result := PCardinal(m_val)^;
    svmtInt:  Result := PInt64(m_val)^;
    svmtReal: Result := Trunc(PDouble(m_val)^);
    svmtStr:  Result := StrToInt(PString(m_val)^);
    else
      Error(reVarTypeCast);
  end;
end;

function TSVMMem.GetD:double;
begin
  Result := 0;
  case m_type of
    svmtWord: Result := PCardinal(m_val)^;
    svmtInt:  Result := PInt64(m_val)^;
    svmtReal: Result := PDouble(m_val)^;
    svmtStr:  Result := StrToFloat(PString(m_val)^);
    else
      Error(reVarTypeCast);
  end;
end;

function TSVMMem.GetS:string;
begin
  Result := '';
  case m_type of
    svmtWord: Result := IntToStr(PCardinal(m_val)^);
    svmtInt:  Result := IntToStr(PInt64(m_val)^);
    svmtReal: Result := FloatToStr(PDouble(m_val)^);
    svmtStr:  Result := PString(m_val)^;
    else
      Error(reVarTypeCast);
  end;
end;

function TSVMMem.GetB:boolean;
begin
  Result := false;
  case m_type of
    svmtWord: Result := false;
    svmtInt:  Result := PInt64(m_val)^ = -1;
    svmtReal: Result := PDouble(m_val)^ = -1;
    svmtStr:  Result := LowerCase(PString(m_val)^) = 'true';
    else
      Error(reVarTypeCast);
  end;
end;

{** Logic operations **}

procedure TSVMMem.OpNot;
begin
  case m_type of
    svmtWord: SetW(not GetW);
    svmtInt: SetI(not GetI);
    svmtReal: Error(reVarInvalidOp);
    svmtStr:  Error(reVarInvalidOp);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpEq(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetB(GetW             = m.GetW);
                svmtInt:  SetB(GetW             = m.GetI);
                svmtReal: SetB(GetW             = m.GetD);
                svmtStr:  SetB(IntToStr(GetW)   = m.GetS);
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetB(GetI             = m.GetW);
                svmtInt:  SetB(GetI             = m.GetI);
                svmtReal: SetB(GetI             = m.GetD);
                svmtStr:  SetB(IntToStr(GetI)   = m.GetS);
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetB(GetD             = m.GetW);
                svmtInt:  SetB(GetD             = m.GetI);
                svmtReal: SetB(GetD             = m.GetD);
                svmtStr:  SetB(FloatToStr(GetD) = m.GetS);
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(GetS             = IntToStr(m.GetW));
                svmtInt:  SetB(GetS             = IntToStr(m.GetI));
                svmtReal: SetB(GetS             = FloatToStr(m.GetD));
                svmtStr:  SetB(GetS             = m.GetS);
                else
                  Error(reVarInvalidOp);
              end;
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpBg(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetB(GetW             > m.GetW);
                svmtInt:  SetB(GetW             > m.GetI);
                svmtReal: SetB(GetW             > m.GetD);
                svmtStr:  SetB(GetW             > StrToQWord(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetB(GetI             > m.GetW);
                svmtInt:  SetB(GetI             > m.GetI);
                svmtReal: SetB(GetI             > m.GetD);
                svmtStr:  SetB(GetI             > StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetB(GetD             > m.GetW);
                svmtInt:  SetB(GetD             > m.GetI);
                svmtReal: SetB(GetD             > m.GetD);
                svmtStr:  SetB(GetD             > StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(StrToFloat(GetS) > m.GetW);
                svmtInt:  SetB(StrToFloat(GetS) > m.GetI);
                svmtReal: SetB(StrToFloat(GetS) > m.GetD);
                svmtStr:  SetB(StrToFloat(GetS) > StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpBe(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetB(GetW             >= m.GetW);
                svmtInt:  SetB(GetW             >= m.GetI);
                svmtReal: SetB(GetW             >= m.GetD);
                svmtStr:  SetB(GetW             >= StrToQWord(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetB(GetI             >= m.GetW);
                svmtInt:  SetB(GetI             >= m.GetI);
                svmtReal: SetB(GetI             >= m.GetD);
                svmtStr:  SetB(GetI             >= StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetB(GetD             >= m.GetW);
                svmtInt:  SetB(GetD             >= m.GetI);
                svmtReal: SetB(GetD             >= m.GetD);
                svmtStr:  SetB(GetD             >= StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(StrToFloat(GetS) >= m.GetW);
                svmtInt:  SetB(StrToFloat(GetS) >= m.GetI);
                svmtReal: SetB(StrToFloat(GetS) >= m.GetD);
                svmtStr:  SetB(StrToFloat(GetS) >= StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpAnd(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetW(GetW             and m.GetW);
                svmtInt:  SetW(GetW             and m.GetI);
                svmtReal: SetW(GetW             and m.GetI);
                svmtStr:  SetW(GetW             and StrToQWord(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             and m.GetW);
                svmtInt:  SetI(GetI             and m.GetI);
                svmtReal: SetI(GetI             and m.GetI);
                svmtStr:  SetI(GetI             and StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(GetI             and m.GetW);
                svmtInt:  SetI(GetI             and m.GetI);
                svmtReal: SetI(GetI             and m.GetI);
                svmtStr:  SetI(GetI             and StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(GetB             and m.GetB);
                svmtInt:  SetB(GetB             and m.GetB);
                svmtReal: SetB(GetB             and m.GetB);
                svmtStr:  SetB(GetB             and m.GetB);
                else
                  Error(reVarInvalidOp);
              end;
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpOr(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetW(GetW             or m.GetW);
                svmtInt:  SetW(GetW             or m.GetI);
                svmtReal: SetW(GetW             or m.GetI);
                svmtStr:  SetW(GetW             or StrToQWord(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             or m.GetW);
                svmtInt:  SetI(GetI             or m.GetI);
                svmtReal: SetI(GetI             or m.GetI);
                svmtStr:  SetI(GetI             or StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(GetI             or m.GetW);
                svmtInt:  SetI(GetI             or m.GetI);
                svmtReal: SetI(GetI             or m.GetI);
                svmtStr:  SetI(GetI             or StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(GetB             or m.GetB);
                svmtInt:  SetB(GetB             or m.GetB);
                svmtReal: SetB(GetB             or m.GetB);
                svmtStr:  SetB(GetB             or m.GetB);
                else
                  Error(reVarInvalidOp);
              end;
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpXor(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetW(GetW             xor m.GetW);
                svmtInt:  SetW(GetW             xor m.GetI);
                svmtReal: SetW(GetW             xor m.GetI);
                svmtStr:  SetW(GetW             xor StrToQWord(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             xor m.GetW);
                svmtInt:  SetI(GetI             xor m.GetI);
                svmtReal: SetI(GetI             xor m.GetI);
                svmtStr:  SetI(GetI             xor StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(GetI             xor m.GetW);
                svmtInt:  SetI(GetI             xor m.GetI);
                svmtReal: SetI(GetI             xor m.GetI);
                svmtStr:  SetI(GetI             xor StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(GetB             xor m.GetB);
                svmtInt:  SetB(GetB             xor m.GetB);
                svmtReal: SetB(GetB             xor m.GetB);
                svmtStr:  SetB(GetB             xor m.GetB);
                else
                  Error(reVarInvalidOp);
              end;
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpShl(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetW(GetW             shl m.GetW);
                svmtInt:  SetW(GetW             shl m.GetI);
                svmtReal: SetW(GetW             shl m.GetI);
                svmtStr:  SetW(GetW             shl StrToQWord(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             shl m.GetW);
                svmtInt:  SetI(GetI             shl m.GetI);
                svmtReal: SetI(GetI             shl m.GetI);
                svmtStr:  SetI(GetI             shl StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(GetI             shl m.GetW);
                svmtInt:  SetI(GetI             shl m.GetI);
                svmtReal: SetI(GetI             shl m.GetI);
                svmtStr:  SetI(GetI             shl StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  Error(reVarInvalidOp);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpShr(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetW(GetW             shr m.GetW);
                svmtInt:  SetW(GetW             shr m.GetI);
                svmtReal: SetW(GetW             shr m.GetI);
                svmtStr:  SetW(GetW             shr StrToQWord(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             shr m.GetW);
                svmtInt:  SetI(GetI             shr m.GetI);
                svmtReal: SetI(GetI             shr m.GetI);
                svmtStr:  SetI(GetI             shr StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(GetI             shr m.GetW);
                svmtInt:  SetI(GetI             shr m.GetI);
                svmtReal: SetI(GetI             shr m.GetI);
                svmtStr:  SetI(GetI             shr StrToInt(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  Error(reVarInvalidOp);
    else
      Error(reVarInvalidOp);
  end;
end;

{** Math operations **}

procedure TSVMMem.OpInc;
begin
  case m_type of
    svmtWord: SetW(GetW + 1);
    svmtInt: SetI(GetI + 1);
    svmtReal: SetD(GetD + 1);
    svmtStr:  Error(reVarInvalidOp);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpDec;
begin
  case m_type of
    svmtWord: SetW(GetW - 1);
    svmtInt: SetI(GetI - 1);
    svmtReal: SetD(GetD - 1);
    svmtStr:  Error(reVarInvalidOp);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpNeg;
begin
  case m_type of
    svmtWord: SetI(-GetW);
    svmtInt: SetI(-GetI);
    svmtReal: SetD(-GetD);
    svmtStr:  Error(reVarInvalidOp);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpAdd(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetW(GetW             + m.GetW);
                svmtInt:  SetI(GetW             + m.GetI);
                svmtReal: SetD(GetW             + m.GetD);
                svmtStr:  SetD(GetW             + StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             + m.GetW);
                svmtInt:  SetI(GetI             + m.GetI);
                svmtReal: SetD(GetI             + m.GetD);
                svmtStr:  SetD(GetI             + StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetD(GetD             + m.GetW);
                svmtInt:  SetD(GetD             + m.GetI);
                svmtReal: SetD(GetD             + m.GetD);
                svmtStr:  SetD(GetD             + StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetS(GetS             + IntToStr(m.GetW));
                svmtInt:  SetS(GetS             + IntToStr(m.GetI));
                svmtReal: SetS(GetS             + FloatToStr(m.GetD));
                svmtStr:  SetS(GetS             + m.GetS);
                else
                  Error(reVarInvalidOp);
              end;
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpSub(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetW(GetW             - m.GetW);
                svmtInt:  SetI(GetW             - m.GetI);
                svmtReal: SetD(GetW             - m.GetD);
                svmtStr:  SetD(GetW             - StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             - m.GetW);
                svmtInt:  SetI(GetI             - m.GetI);
                svmtReal: SetD(GetI             - m.GetD);
                svmtStr:  SetD(GetI             - StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetD(GetD             - m.GetW);
                svmtInt:  SetD(GetD             - m.GetI);
                svmtReal: SetD(GetD             - m.GetD);
                svmtStr:  SetD(GetD             - StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  Error(reVarInvalidOp);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpDiv(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetD(GetW             / m.GetW);
                svmtInt:  SetD(GetW             / m.GetI);
                svmtReal: SetD(GetW             / m.GetD);
                svmtStr:  SetD(GetW             / StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetD(GetI             / m.GetW);
                svmtInt:  SetD(GetI             / m.GetI);
                svmtReal: SetD(GetI             / m.GetD);
                svmtStr:  SetD(GetI             / StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetD(GetD             / m.GetW);
                svmtInt:  SetD(GetD             / m.GetI);
                svmtReal: SetD(GetD             / m.GetD);
                svmtStr:  SetD(GetD             / StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  Error(reVarInvalidOp);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpMul(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetW(GetW             * m.GetW);
                svmtInt:  SetI(GetW             * m.GetI);
                svmtReal: SetD(GetW             * m.GetD);
                svmtStr:  SetD(GetW             * StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             * m.GetW);
                svmtInt:  SetI(GetI             * m.GetI);
                svmtReal: SetD(GetI             * m.GetD);
                svmtStr:  SetD(GetI             * StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetD(GetD             * m.GetW);
                svmtInt:  SetD(GetD             * m.GetI);
                svmtReal: SetD(GetD             * m.GetD);
                svmtStr:  SetD(GetD             * StrToFloat(m.GetS));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  Error(reVarInvalidOp);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpIDiv(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetW(GetW             div m.GetW);
                svmtInt:  SetW(GetW             div m.GetI);
                svmtReal: SetW(Trunc(GetW       / m.GetD));
                svmtStr:  SetW(Trunc(GetW       / StrToFloat(m.GetS)));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetW(GetI             div m.GetW);
                svmtInt:  SetW(GetI             div m.GetI);
                svmtReal: SetW(Trunc(GetI       / m.GetD));
                svmtStr:  SetW(Trunc(GetI       / StrToFloat(m.GetS)));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetD(Trunc(GetD / m.GetW));
                svmtInt:  SetD(Trunc(GetD / m.GetI));
                svmtReal: SetD(Trunc(GetD / m.GetD));
                svmtStr:  SetD(Trunc(GetD / StrToFloat(m.GetS)));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  Error(reVarInvalidOp);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpMod(m:TSVMMem);
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetW(GetW             mod m.GetW);
                svmtInt:  SetW(GetW             mod m.GetI);
                svmtReal: SetW(GetW             mod Trunc(m.GetD));
                svmtStr:  SetW(GetW             mod Trunc(StrToFloat(m.GetS)));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetW(GetI             mod m.GetW);
                svmtInt:  SetW(GetI             mod m.GetI);
                svmtReal: SetW(GetI             mod Trunc(m.GetD));
                svmtStr:  SetW(GetI             mod Trunc(StrToFloat(m.GetS)));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetW(Trunc(GetD) mod m.GetW);
                svmtInt:  SetW(Trunc(GetD) mod m.GetI);
                svmtReal: SetW(Trunc(GetD) mod Trunc(m.GetD));
                svmtStr:  SetW(Trunc(GetD) mod Trunc(StrToFloat(m.GetS)));
                else
                  Error(reVarInvalidOp);
              end;

    svmtStr:  Error(reVarInvalidOp);
    else
      Error(reVarInvalidOp);
  end;
end;

{** Arrays **}

procedure TSVMMem.ArrSetSize(newsize: cardinal);
begin
  case m_type of
    svmtStr: SetLength(PString(m_val)^, newsize);
    svmtArr: SetLength(PMemArray(m_val)^, newsize);
    else
      Error(reInvalidOp);
  end;
end;

function  TSVMMem.ArrGetSize: cardinal;
begin
  Result := 0;
  case m_type of
    svmtStr: Result := Length(PString(m_val)^);
    svmtArr: Result := Length(PMemArray(m_val)^);
    else
      Error(reInvalidOp);
  end;
end;

procedure TSVMMem.ArrSet(index: cardinal; val:pointer);
begin
  case m_type of
    svmtStr: PString(m_val)^[index] := TSVMMem(val).GetS[1];
    svmtArr: PMemArray(m_val)^[index] := val;
    else
      Error(reInvalidOp);
  end;
end;

function  TSVMMem.ArrGet(index: cardinal; grabber:PGrabber): pointer;
begin
  Result := nil;
  case m_type of
    svmtStr: begin
               Result := TSVMMem.CreateFS(PString(m_val)^[index]);
               grabber^.AddTask(Result);
             end;
    svmtArr: Result := PMemArray(m_val)^[index];
    else
      Error(reInvalidOp);
  end;
end;

{** Any **}

function TSVMMem.GetSize:cardinal;
begin
  Result := 0;
  case m_type of
    svmtWord: Result := SizeOf(Cardinal);
    svmtInt:  Result := SizeOf(Int64);
    svmtReal: Result := SizeOf(Double);
    svmtStr:  Result := Length(PString(m_val)^);
    svmtArr:  Result := Length(PMemArray(m_val)^) * SizeOf(Pointer);
    else
      Error(reVarTypeCast);
  end;
end;

end.
