unit svm_mem;

{$mode objfpc}{$H+}{$inline on}

interface

uses
  SysUtils, svm_grabber, svm_utils;

const
  TSVMTypeAddr = 255;
  EInvalidSVMTypeCast_ErrorCode = 255;

type
  EInvalidSVMTypeCast = class(Exception)
    constructor Create(msg: string);
  end;

  TSVMType = (svmtNull, svmtWord, svmtInt, svmtReal, svmtStr, svmtArr, svmtClass, svmtRef);

  TSVMMem = class
    m_val: pointer;
    m_type: TSVMType;
    m_refc: integer;

    constructor MCreate;
    constructor MCreateF(const value; t:TSVMType);
    constructor MCreateFS(s:string);
    constructor MCreateFW(w:LongWord);
    constructor MCreateArr(size:LongWord = 0);

    destructor Destroy; override;

    procedure Clear;

    // variables

    procedure SetV(const value; t:TSVMType);
    procedure SetW(value:LongWord);
    procedure SetI(value:int64);
    procedure SetD(value:double);
    procedure SetS(value:string);
    procedure SetB(b:boolean);
    procedure SetM(m:TSVMMem);

    function  GetW: LongWord;
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

    procedure ArrSetSize(newsize: LongWord);
    function  ArrGetSize: LongWord;
    procedure ArrSet(index: LongWord; val:pointer);
    function  ArrGet(index: LongWord; Grabber: TGrabber): pointer;

    // any

    function GetSize: LongWord;
  end;

  TMemArray = array of pointer;
  PMemArray = ^TMemArray;

  function CreateSVMMemCopy(m:TSVMMem; Grabber: TGrabber):TSVMMem;

  function NewSVMM(Grabber: TGrabber): TSVMMem;
  function NewSVMM_F(const value; t:TSVMType; Grabber: TGrabber): TSVMMem;
  function NewSVMM_FS(s:string; Grabber: TGrabber): TSVMMem;
  function NewSVMM_FW(w:LongWord; Grabber: TGrabber): TSVMMem;
  function NewSVMM_Arr(size:LongWord; Grabber: TGrabber): TSVMMem;
  function NewSVMM_Ref(ref:pointer; Grabber: TGrabber): TSVMMem;

implementation

// Custom exception

constructor EInvalidSVMTypeCast.Create(msg: string);
begin
  inherited CreateFmt(msg, [EInvalidSVMTypeCast_ErrorCode]);
end;

// Allocations

function NewSVMM(Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreate;
  Result.m_type := svmtNull;
  Result.m_val := nil;
  Grabber.Reg(Result);
end;

function NewSVMM_F(const value; t:TSVMType; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreateF(value, t);
  Grabber.Reg(Result);
end;

function NewSVMM_FS(s:string; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreateFS(s);
  Grabber.Reg(Result);
end;

function NewSVMM_FW(w:LongWord; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreateFW(w);
  Grabber.Reg(Result);
end;

function NewSVMM_Arr(size:LongWord; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreateArr(size);
  Grabber.Reg(Result);
end;

function NewSVMM_Ref(ref:pointer; Grabber: TGrabber): TSVMMem;
begin
  Result := TSVMMem.MCreate;
  Result.m_type := svmtRef;
  Result.m_val := ref;
  Grabber.Reg(Result);
end;

// TSVMMem

constructor TSVMMem.MCreate;
begin
  m_val := nil;
  m_type := svmtNull;
  m_refc := 0;
end;

constructor TSVMMem.MCreateF(const value; t:TSVMType);
begin
  m_val := nil;
  m_type := t;
  m_refc := 0;
  SetV(value, t);
end;

constructor TSVMMem.MCreateFS(s:string);
begin
  m_val := nil;
  m_type := svmtStr;
  m_refc := 0;
  SetS(S);
end;

constructor TSVMMem.MCreateFW(w:LongWord);
begin
  m_val := nil;
  m_type := svmtWord;
  m_refc := 0;
  SetW(w);
end;

constructor TSVMMem.MCreateArr(size:LongWord = 0);
begin
  m_type := svmtArr;
  new(PMemArray(m_val));
  m_refc := 0;
  SetLength(PMemArray(m_val)^, size);
end;

destructor TSVMMem.Destroy;
begin
  Clear;
end;

procedure TSVMMem.Clear; inline;
begin
  case m_type of
    svmtNull, svmtRef: { no actions };
    svmtWord: Dispose(PLongWord(m_val));
    svmtInt:  Dispose(PInt64(m_val));
    svmtReal: Dispose(PDouble(m_val));
    svmtStr:  Dispose(PString(m_val));
    svmtArr, svmtClass:
              begin
                SetLength(PMemArray(m_val)^, 0);
                Dispose(PMemArray(m_val));
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.Clear()');
  end;
end;

{** Setters **}

procedure TSVMMem.SetV(const value; t:TSVMType);
begin
  if (m_val <> nil) and (m_type = t) then
   begin
     case t of
       svmtWord: PLongWord(m_val)^ := LongWord(value);
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
                   New(PLongWord(m_val));
                   PLongWord(m_val)^ := LongWord(value);
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
       svmtNull: begin
                   m_val := nil;
                 end;
       else
         RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.SetV()');
     end;
   end;
end;

procedure TSVMMem.SetW(value:LongWord); inline;
begin
  if (m_val <> nil) and (m_type = svmtWord) then
   PLongWord(m_val)^ := value
  else
   begin
     if m_val <> nil then
      FreeMem(m_val);

     m_type := svmtWord;
     New(PLongWord(m_val));
     PLongWord(m_val)^ := value;
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
    svmtArr, svmtClass, svmtRef: begin
               Clear;
               m_val := m.m_val;
               m_type := m.m_type;
             end;
    else
      SetV(m.m_val^, m.m_type);
  end;
end;

{** Getters **}

function TSVMMem.GetW:LongWord;
begin
  Result := 0;
  case m_type of
    svmtWord: Result := PLongWord(m_val)^;
    svmtInt:  Result := PInt64(m_val)^;
    svmtReal: Result := Trunc(PDouble(m_val)^);
    svmtStr:  Result := StrToQWord(PString(m_val)^);
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.GetW()');
  end;
end;

function TSVMMem.GetI:int64;
begin
  Result := 0;
  case m_type of
    svmtWord: Result := PLongWord(m_val)^;
    svmtInt:  Result := PInt64(m_val)^;
    svmtReal: Result := Trunc(PDouble(m_val)^);
    svmtStr:  Result := StrToInt(PString(m_val)^);
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.GetI()');
  end;
end;

function TSVMMem.GetD:double;
begin
  Result := 0;
  case m_type of
    svmtWord: Result := PLongWord(m_val)^;
    svmtInt:  Result := PInt64(m_val)^;
    svmtReal: Result := PDouble(m_val)^;
    svmtStr:  Result := StrToFloat(PString(m_val)^);
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.GetD()');
  end;
end;

function TSVMMem.GetS:string;
begin
  Result := '';
  case m_type of
    svmtWord: begin
                if (PLongWord(m_val)^ >= 0) and (PLongWord(m_val)^ <= 255) then
                 Result := Chr(PLongWord(m_val)^)
                else
                 Result := IntToStr(PLongWord(m_val)^);
              end;
    svmtInt:  Result := IntToStr(PInt64(m_val)^);
    svmtReal: Result := FloatToStr(PDouble(m_val)^);
    svmtStr:  Result := PString(m_val)^;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.GetS()');
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
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.GetB()');
  end;
end;

{** Logic operations **}

procedure TSVMMem.OpNot; inline;
begin
  case m_type of
    svmtWord: SetW(not GetW);
    svmtInt: SetI(not GetI);
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpNot()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpEq()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetB(GetI             = m.GetW);
                svmtInt:  SetB(GetI             = m.GetI);
                svmtReal: SetB(GetI             = m.GetD);
                svmtStr:  SetB(IntToStr(GetI)   = m.GetS);
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpEq()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetB(GetD             = m.GetW);
                svmtInt:  SetB(GetD             = m.GetI);
                svmtReal: SetB(GetD             = m.GetD);
                svmtStr:  SetB(FloatToStr(GetD) = m.GetS);
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpEq()');
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(GetS             = IntToStr(m.GetW));
                svmtInt:  SetB(GetS             = IntToStr(m.GetI));
                svmtReal: SetB(GetS             = FloatToStr(m.GetD));
                svmtStr:  SetB(GetS             = m.GetS);
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpEq()');
              end;

    svmtNull: SetB(m.m_type = svmtNull);

    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpEq()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpBg()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetB(GetI             > m.GetW);
                svmtInt:  SetB(GetI             > m.GetI);
                svmtReal: SetB(GetI             > m.GetD);
                svmtStr:  SetB(GetI             > StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpBg()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetB(GetD             > m.GetW);
                svmtInt:  SetB(GetD             > m.GetI);
                svmtReal: SetB(GetD             > m.GetD);
                svmtStr:  SetB(GetD             > StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpBg()');
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(StrToFloat(GetS) > m.GetW);
                svmtInt:  SetB(StrToFloat(GetS) > m.GetI);
                svmtReal: SetB(StrToFloat(GetS) > m.GetD);
                svmtStr:  SetB(StrToFloat(GetS) > StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpBg()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpBg()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpBe()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetB(GetI             >= m.GetW);
                svmtInt:  SetB(GetI             >= m.GetI);
                svmtReal: SetB(GetI             >= m.GetD);
                svmtStr:  SetB(GetI             >= StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpBe()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetB(GetD             >= m.GetW);
                svmtInt:  SetB(GetD             >= m.GetI);
                svmtReal: SetB(GetD             >= m.GetD);
                svmtStr:  SetB(GetD             >= StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpBe()');
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(StrToFloat(GetS) >= m.GetW);
                svmtInt:  SetB(StrToFloat(GetS) >= m.GetI);
                svmtReal: SetB(StrToFloat(GetS) >= m.GetD);
                svmtStr:  SetB(StrToFloat(GetS) >= StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpBe()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpBe()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpAnd()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             and m.GetW);
                svmtInt:  SetI(GetI             and m.GetI);
                svmtReal: SetI(GetI             and m.GetI);
                svmtStr:  SetI(GetI             and StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpAnd()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(GetI             and m.GetW);
                svmtInt:  SetI(GetI             and m.GetI);
                svmtReal: SetI(GetI             and m.GetI);
                svmtStr:  SetI(GetI             and StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpAnd()');
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(GetB             and m.GetB);
                svmtInt:  SetB(GetB             and m.GetB);
                svmtReal: SetB(GetB             and m.GetB);
                svmtStr:  SetB(GetB             and m.GetB);
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpAnd()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpAnd()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpOr()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             or m.GetW);
                svmtInt:  SetI(GetI             or m.GetI);
                svmtReal: SetI(GetI             or m.GetI);
                svmtStr:  SetI(GetI             or StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpOr()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(GetI             or m.GetW);
                svmtInt:  SetI(GetI             or m.GetI);
                svmtReal: SetI(GetI             or m.GetI);
                svmtStr:  SetI(GetI             or StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpOr()');
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(GetB             or m.GetB);
                svmtInt:  SetB(GetB             or m.GetB);
                svmtReal: SetB(GetB             or m.GetB);
                svmtStr:  SetB(GetB             or m.GetB);
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpOr()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpOr()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpXor()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             xor m.GetW);
                svmtInt:  SetI(GetI             xor m.GetI);
                svmtReal: SetI(GetI             xor m.GetI);
                svmtStr:  SetI(GetI             xor StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpXor()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(GetI             xor m.GetW);
                svmtInt:  SetI(GetI             xor m.GetI);
                svmtReal: SetI(GetI             xor m.GetI);
                svmtStr:  SetI(GetI             xor StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpXor()');
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetB(GetB             xor m.GetB);
                svmtInt:  SetB(GetB             xor m.GetB);
                svmtReal: SetB(GetB             xor m.GetB);
                svmtStr:  SetB(GetB             xor m.GetB);
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpXor()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpXor()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpShl()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             shl m.GetW);
                svmtInt:  SetI(GetI             shl m.GetI);
                svmtReal: SetI(GetI             shl m.GetI);
                svmtStr:  SetI(GetI             shl StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpShl()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(GetI             shl m.GetW);
                svmtInt:  SetI(GetI             shl m.GetI);
                svmtReal: SetI(GetI             shl m.GetI);
                svmtStr:  SetI(GetI             shl StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpShl()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpShl()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpShr()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             shr m.GetW);
                svmtInt:  SetI(GetI             shr m.GetI);
                svmtReal: SetI(GetI             shr m.GetI);
                svmtStr:  SetI(GetI             shr StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpShr()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(GetI             shr m.GetW);
                svmtInt:  SetI(GetI             shr m.GetI);
                svmtReal: SetI(GetI             shr m.GetI);
                svmtStr:  SetI(GetI             shr StrToInt(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpShr()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpShr()');
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
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpInc()');
  end;
end;

procedure TSVMMem.OpDec; inline;
begin
  case m_type of
    svmtWord: SetI(GetW - 1);
    svmtInt: SetI(GetI - 1);
    svmtReal: SetD(GetD - 1);
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpDec()');
  end;
end;

procedure TSVMMem.OpNeg; inline;
begin
  case m_type of
    svmtWord: SetI(-GetW);
    svmtInt: SetI(-GetI);
    svmtReal: SetD(-GetD);
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpNeg()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpAdd()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             + m.GetW);
                svmtInt:  SetI(GetI             + m.GetI);
                svmtReal: SetD(GetI             + m.GetD);
                svmtStr:  SetD(GetI             + StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpAdd()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetD(GetD             + m.GetW);
                svmtInt:  SetD(GetD             + m.GetI);
                svmtReal: SetD(GetD             + m.GetD);
                svmtStr:  SetD(GetD             + StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpAdd()');
              end;

    svmtStr:  case m.m_type of
                svmtWord: SetS(GetS             + IntToStr(m.GetW));
                svmtInt:  SetS(GetS             + IntToStr(m.GetI));
                svmtReal: SetS(GetS             + FloatToStr(m.GetD));
                svmtStr:  SetS(GetS             + m.GetS);
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpAdd()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpAdd()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpSub()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             - m.GetW);
                svmtInt:  SetI(GetI             - m.GetI);
                svmtReal: SetD(GetI             - m.GetD);
                svmtStr:  SetD(GetI             - StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpSub()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetD(GetD             - m.GetW);
                svmtInt:  SetD(GetD             - m.GetI);
                svmtReal: SetD(GetD             - m.GetD);
                svmtStr:  SetD(GetD             - StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpSub()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpSub()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpDiv()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetD(GetI             / m.GetW);
                svmtInt:  SetD(GetI             / m.GetI);
                svmtReal: SetD(GetI             / m.GetD);
                svmtStr:  SetD(GetI             / StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpDiv()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetD(GetD             / m.GetW);
                svmtInt:  SetD(GetD             / m.GetI);
                svmtReal: SetD(GetD             / m.GetD);
                svmtStr:  SetD(GetD             / StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpDiv()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpDiv()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpMul()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             * m.GetW);
                svmtInt:  SetI(GetI             * m.GetI);
                svmtReal: SetD(GetI             * m.GetD);
                svmtStr:  SetD(GetI             * StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpMul()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetD(GetD             * m.GetW);
                svmtInt:  SetD(GetD             * m.GetI);
                svmtReal: SetD(GetD             * m.GetD);
                svmtStr:  SetD(GetD             * StrToFloat(m.GetS));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpMul()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpMul()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpIDiv()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetI(GetI             div m.GetW);
                svmtInt:  SetI(GetI             div m.GetI);
                svmtReal: SetI(Trunc(GetI       / m.GetD));
                svmtStr:  SetI(Trunc(GetI       / StrToFloat(m.GetS)));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpIDiv()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetI(Trunc(GetD / m.GetW));
                svmtInt:  SetI(Trunc(GetD / m.GetI));
                svmtReal: SetI(Trunc(GetD / m.GetD));
                svmtStr:  SetI(Trunc(GetD / StrToFloat(m.GetS)));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpIDiv()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpIDiv()');
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
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpMod()');
              end;

    svmtInt:  case m.m_type of
                svmtWord: SetW(GetI             mod m.GetW);
                svmtInt:  SetW(GetI             mod m.GetI);
                svmtReal: SetW(GetI             mod Trunc(m.GetD));
                svmtStr:  SetW(GetI             mod Trunc(StrToFloat(m.GetS)));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpMod()');
              end;

    svmtReal: case m.m_type of
                svmtWord: SetW(Trunc(GetD) mod m.GetW);
                svmtInt:  SetW(Trunc(GetD) mod m.GetI);
                svmtReal: SetW(Trunc(GetD) mod Trunc(m.GetD));
                svmtStr:  SetW(Trunc(GetD) mod Trunc(StrToFloat(m.GetS)));
                else
                  RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpMod()');
              end;
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.OpMod()');
  end;
end;

{** Arrays **}

procedure TSVMMem.ArrSetSize(newsize: LongWord); inline;
var
  c, l: LongWord;
  p: pointer;
begin
  case m_type of
    svmtArr, svmtClass:
      begin
        l := Length(PMemArray(m_val)^);
        if l > newsize then
         begin
           c := newsize;
           while c < l do
            begin
              p := PMemArray(m_val)^[c];
              if p <> nil then
               Dec(TSVMMem(p).m_refc);
              inc(c);
            end;
         end;

        SetLength(PMemArray(m_val)^, newsize);
      end;
    svmtStr: SetLength(PString(m_val)^, newsize);
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.ArrSetSize()');
  end;
end;

function  TSVMMem.ArrGetSize: LongWord; inline;
begin
  Result := 0;
  case m_type of
    svmtArr, svmtClass: Result := Length(PMemArray(m_val)^);
    svmtStr: Result := Length(PString(m_val)^);
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.ArrGetSize()');
  end;
end;

procedure TSVMMem.ArrSet(index: LongWord; val:pointer); inline;
var
  p: pointer;
begin
  case m_type of
    svmtArr, svmtClass:
      begin
        p := PMemArray(m_val)^[index];
        if TObject(p) is TSVMMem then
         Dec(TSVMMem(p).m_refc);

        PMemArray(m_val)^[index] := val;
      end;
    svmtStr: PString(m_val)^[index + 1] := TSVMMem(val).GetS[1];
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.ArrSet()');
  end;
end;

function  TSVMMem.ArrGet(index: LongWord; Grabber: TGrabber): pointer; inline;
begin
  Result := nil;
  case m_type of
    svmtArr, svmtClass: Result := PMemArray(m_val)^[index];
    svmtStr: Result := NewSVMM_FS(PString(m_val)^[index + 1], Grabber);
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.ArrGet()');
  end;
end;

{** Any **}

function TSVMMem.GetSize:LongWord; inline;
begin
  Result := 0;
  case m_type of
    svmtWord: Result := SizeOf(LongWord);
    svmtInt:  Result := SizeOf(Int64);
    svmtReal: Result := SizeOf(Double);
    svmtStr:  Result := Length(PString(m_val)^);
    svmtArr, svmtClass:  Result := Length(PMemArray(m_val)^) * SizeOf(Pointer);
    else
      RaiseSafeException; //raise EInvalidSVMTypeCast.Create('At TSVMMem.GetSize()');
  end;
end;

function CreateSVMMemCopy(m:TSVMMem; Grabber: TGrabber):TSVMMem; inline;
var
  c, l: LongWord;
begin
  Result := nil;
  if m.m_type in [svmtArr, svmtClass] then
   begin
     l := Length(PMemArray(m.m_val)^);
     Result := NewSVMM_Arr(l, Grabber);
     Result.m_type := m.m_type;
     c := 0;
     while c < l do
      begin
        PMemArray(Result.m_val)^[c] := PMemArray(m.m_val)^[c];

        if PMemArray(Result.m_val)^[c] <> nil then
         inc(TSVMMem(PMemArray(Result.m_val)^[c]).m_refc);

        inc(c);
      end;
   end
  else
   begin
     Result := NewSVMM(Grabber);
     Result.SetM(m);
   end;
end;

end.
