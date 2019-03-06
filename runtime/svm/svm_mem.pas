unit svm_mem;

{$mode objfpc}{$H+}{$inline on}

interface

uses
  SysUtils, svm_grabber;

const
  TSVMTypeAddr = 255;

type
  TSVMType = (svmtNull, svmtWord, svmtInt, svmtReal, svmtStr, svmtArr, svmtClass);

  TSVMMem = class
    m_val: pointer;
    m_type: TSVMType;
    constructor Create;
    constructor CreateF(const value; t:TSVMType);
    constructor CreateFS(s:string);
    constructor CreateFW(w:cardinal);
    constructor CreateArr(size:cardinal = 0);
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

  function CreateSVMMemCopy(m:TSVMMem):TSVMMem;

implementation

constructor TSVMMem.Create;
begin
  m_val := nil;
  m_type := svmtNull;
end;

constructor TSVMMem.CreateF(const value; t:TSVMType);
begin
  m_val := nil;
  m_type := t;
  SetV(value, t);
end;

constructor TSVMMem.CreateFS(s:string);
begin
  m_val := nil;
  m_type := svmtStr;
  SetS(S);
end;

constructor TSVMMem.CreateFW(w:cardinal);
begin
  m_val := nil;
  m_type := svmtWord;
  SetW(w);
end;

constructor TSVMMem.CreateArr(size:cardinal = 0);
begin
  m_type := svmtArr;
  new(PMemArray(m_val));
  SetLength(PMemArray(m_val)^, size);
end;

destructor TSVMMem.Destroy;
begin
  Clear;
end;

procedure TSVMMem.Clear; inline;
begin
  case m_type of
    svmtNull: { nop };
    svmtWord: Dispose(PCardinal(m_val));
    svmtInt:  Dispose(PInt64(m_val));
    svmtReal: Dispose(PDouble(m_val));
    svmtStr:  Dispose(PString(m_val));
    svmtArr, svmtClass:
              begin
                SetLength(PMemArray(m_val)^, 0);
                Dispose(PMemArray(m_val));
              end;
    else
      Error(reVarInvalidOp);
  end;
end;

{** Setters **}

procedure TSVMMem.SetV(const value; t:TSVMType); inline;
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

procedure TSVMMem.SetW(value:cardinal); inline;
begin
  if (m_val <> nil) and (m_type = svmtWord) then
   PCardinal(m_val)^ := value
  else
   begin
     if m_val <> nil then
      FreeMem(m_val);

     m_type := svmtWord;
     New(PCardinal(m_val));
     PCardinal(m_val)^ := value;
   end;
end;

procedure TSVMMem.SetI(value:int64); inline;
begin
  if (m_val <> nil) and (m_type = svmtInt) then
   PInt64(m_val)^ := value
  else
   begin
     if m_val <> nil then
      FreeMem(m_val);

     m_type := svmtInt;
     New(PInt64(m_val));
     PInt64(m_val)^ := value;
   end;
end;

procedure TSVMMem.SetD(value:double); inline;
begin
    if (m_val <> nil) and (m_type = svmtReal) then
   PDouble(m_val)^ := value
  else
   begin
     if m_val <> nil then
      FreeMem(m_val);

     m_type := svmtReal;
     New(PDouble(m_val));
     PDouble(m_val)^ := value;
   end;
end;

procedure TSVMMem.SetS(value:string); inline;
begin
  if (m_val <> nil) and (m_type = svmtStr) then
   PString(m_val)^ := value
  else
   begin
     if m_val <> nil then
      FreeMem(m_val);

     m_type := svmtStr;
     New(PString(m_val));
     PString(m_val)^ := value;
   end;
end;

procedure TSVMMem.SetB(b:boolean); inline;
begin
  if b then
   SetI(-1)
  else
   SetI(0);
end;

procedure TSVMMem.SetM(m:TSVMMem); inline;
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

function TSVMMem.GetW:cardinal; inline;
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

function TSVMMem.GetI:int64; inline;
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

function TSVMMem.GetD:double; inline;
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

function TSVMMem.GetS:string; inline;
begin
  Result := '';
  case m_type of
    svmtWord: begin
                if (PCardinal(m_val)^ >= 0) and (PCardinal(m_val)^ <= 255) then
                 Result := Chr(PCardinal(m_val)^)
                else
                 Result := IntToStr(PCardinal(m_val)^);
              end;
    svmtInt:  Result := IntToStr(PInt64(m_val)^);
    svmtReal: Result := FloatToStr(PDouble(m_val)^);
    svmtStr:  Result := PString(m_val)^;
    else
      Error(reVarTypeCast);
  end;
end;

function TSVMMem.GetB:boolean; inline;
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

procedure TSVMMem.OpNot; inline;
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

procedure TSVMMem.OpEq(m:TSVMMem); inline;
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

procedure TSVMMem.OpBg(m:TSVMMem); inline;
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

procedure TSVMMem.OpBe(m:TSVMMem); inline;
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

procedure TSVMMem.OpAnd(m:TSVMMem); inline;
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

procedure TSVMMem.OpOr(m:TSVMMem); inline;
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

procedure TSVMMem.OpXor(m:TSVMMem); inline;
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

procedure TSVMMem.OpShl(m:TSVMMem); inline;
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
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpShr(m:TSVMMem); inline;
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
    else
      Error(reVarInvalidOp);
  end;
end;

{** Math operations **}

procedure TSVMMem.OpInc; inline;
begin
  case m_type of
    svmtWord: SetW(GetW + 1);
    svmtInt: SetI(GetI + 1);
    svmtReal: SetD(GetD + 1);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpDec; inline;
begin
  case m_type of
    svmtWord: SetI(GetW - 1);
    svmtInt: SetI(GetI - 1);
    svmtReal: SetD(GetD - 1);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpNeg; inline;
begin
  case m_type of
    svmtWord: SetI(-GetW);
    svmtInt: SetI(-GetI);
    svmtReal: SetD(-GetD);
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpAdd(m:TSVMMem); inline;
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

procedure TSVMMem.OpSub(m:TSVMMem); inline;
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetI(GetW             - m.GetW);
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
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpDiv(m:TSVMMem); inline;
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
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpMul(m:TSVMMem); inline;
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetI(GetW             * m.GetW);
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
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpIDiv(m:TSVMMem); inline;
begin
  case m_type of
    svmtWord: case m.m_type of
                svmtWord: SetI(GetW             div m.GetW);
                svmtInt:  SetI(GetW             div m.GetI);
                svmtReal: SetI(Trunc(GetW       / m.GetD));
                svmtStr:  SetI(Trunc(GetW       / StrToFloat(m.GetS)));
                else
                  Error(reVarInvalidOp);
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             div m.GetW);
                svmtInt:  SetI(GetI             div m.GetI);
                svmtReal: SetI(Trunc(GetI       / m.GetD));
                svmtStr:  SetI(Trunc(GetI       / StrToFloat(m.GetS)));
                else
                  Error(reVarInvalidOp);
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(Trunc(GetD / m.GetW));
                svmtInt:  SetI(Trunc(GetD / m.GetI));
                svmtReal: SetI(Trunc(GetD / m.GetD));
                svmtStr:  SetI(Trunc(GetD / StrToFloat(m.GetS)));
                else
                  Error(reVarInvalidOp);
              end;
    else
      Error(reVarInvalidOp);
  end;
end;

procedure TSVMMem.OpMod(m:TSVMMem); inline;
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
    else
      Error(reVarInvalidOp);
  end;
end;

{** Arrays **}

procedure TSVMMem.ArrSetSize(newsize: cardinal); inline;
begin
  case m_type of
    svmtArr, svmtClass: SetLength(PMemArray(m_val)^, newsize);
    svmtStr: SetLength(PString(m_val)^, newsize);
    else
      Error(reInvalidOp);
  end;
end;

function  TSVMMem.ArrGetSize: cardinal; inline;
begin
  Result := 0;
  case m_type of
    svmtArr, svmtClass: Result := Length(PMemArray(m_val)^);
    svmtStr: Result := Length(PString(m_val)^);
    else
      Error(reInvalidOp);
  end;
end;

procedure TSVMMem.ArrSet(index: cardinal; val:pointer); inline;
begin
  case m_type of
    svmtArr, svmtClass: PMemArray(m_val)^[index] := val;
    svmtWord: PString(m_val)^[index] := Chr(TSVMMem(val).GetW);
    svmtStr: PString(m_val)^[index] := TSVMMem(val).GetS[1];
    else
      Error(reInvalidOp);
  end;
end;

function  TSVMMem.ArrGet(index: cardinal; grabber:PGrabber): pointer; inline;
begin
  Result := nil;
  case m_type of
    svmtArr, svmtClass: Result := PMemArray(m_val)^[index];
    svmtStr: begin
               Result := TSVMMem.CreateFW(Ord(PString(m_val)^[index]));
               grabber^.AddTask(Result);
             end;
    else
      Error(reInvalidOp);
  end;
end;

{** Any **}

function TSVMMem.GetSize:cardinal; inline;
begin
  Result := 0;
  case m_type of
    svmtWord: Result := SizeOf(Cardinal);
    svmtInt:  Result := SizeOf(Int64);
    svmtReal: Result := SizeOf(Double);
    svmtStr:  Result := Length(PString(m_val)^);
    svmtArr, svmtClass:  Result := Length(PMemArray(m_val)^) * SizeOf(Pointer);
    else
      Error(reVarTypeCast);
  end;
end;

function CreateSVMMemCopy(m:TSVMMem):TSVMMem; inline;
var
  c, l: cardinal;
begin
  Result := nil;
  if m.m_type = svmtClass then
   Result := m
  else
  if m.m_type = svmtArr then
   begin
     Result := TSVMMem.Create;
     Result.m_type := svmtArr;
     new(PMemArray(Result.m_val));
     l := Length(PMemArray(m.m_val)^);
     SetLength(PMemArray(Result.m_val)^, l);
     c := 0;
     while c < l do
      begin
        PMemArray(Result.m_val)^[c] := PMemArray(m.m_val)^[c];
        inc(c);
      end;
   end
  else
   begin
     Result := TSVMMem.Create;
     Result.m_val := nil;
     Result.m_type := m.m_type;
     Result.SetV(m.m_val^, m.m_type);
   end;
end;

end.
