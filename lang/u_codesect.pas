unit u_codesect;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global, u_consts;

type

  TCodeSection = class(TObject)
  public
    Lines: TStringList;
    Constants: TConstantManager;
    Outp: TMemoryStream;
    constructor Create(sl: TStringList; cnsts: TConstantManager);
    destructor Destroy; override;
    procedure ParseSection;
    procedure GenerateCode(Stream: TStream);
  end;

implementation

{** Code section **}

constructor TCodeSection.Create(sl: TStringList; cnsts: TConstantManager);
begin
  Outp := TMemoryStream.Create;
  Lines := sl;
  Constants := cnsts;
  inherited Create;
end;

destructor TCodeSection.Destroy;
begin
  Outp.Free;
  inherited Destroy;
end;

type
  TComand = (
    {** for stack **}
    bcPH,     // [top] = [var]
    bcPK,     // [var] = [top]
    bcPP,     // pop
    bcSDP,    // stkdrop
    bcSWP,    // [top] <-> [top-1]

    {** jump's **}
    bcJP,     // jump [top]
    bcJZ,     // [top] == 0 ? jp [top-1]
    bcJN,     // [top] <> 0 ? jp [top-1]
    bcJC,     // jp [top] & push callback point as ip+1
    bcJR,     // jp to last callback point & rem last callback point

    {** for untyped's **}
    bcEQ,     // [top] == [top-1] ? [top] = 1 : [top] = 0
    bcBG,     // [top] >  [top-1] ? [top] = 1 : [top] = 0
    bcBE,     // [top] >= [top-1] ? [top] = 1 : [top] = 0
    bcLAND,   // [top] = [top] and [top-1]
    bcLOR,    // [top] = [top] or [top-1]
    bcLXOR,   // [top] = [top] xor [top-1]
    bcLNOT,   // [top] = not [top]

    bcNOT,    // [top] = ![top]
    bcAND,    // [top] = [top] and [top-1]
    bcOR,     // [top] = [top] or  [top-1]
    bcXOR,    // [top] = [top] xor [top-1]
    bcSHR,    // [top] = [top] shr [top-1]
    bcSHL,    // [top] = [top] shl [top-1]

    bcNEG,    // [top] = -[top]
    bcINC,    // [top]++
    bcDEC,    // [top]--
    bcADD,    // [top] = [top] + [top-1]
    bcSUB,    // [top] = [top] - [top-1]
    bcMUL,    // [top] = [top] * [top-1]
    bcDIV,    // [top] = [top] / [top-1]
    bcMOD,    // [top] = [top] % [top-1]
    bcIDIV,   // [top] = [top] \ [top-1]

    bcMV,     // [top]^ = [top-1]^
    bcMVBP,   // [top]^^ = [top-1]^
    bcGVBP,   // [top]^ = [top-1]^^
    bcMVP,    // [top]^ = [top-1]

    {** memory operation's **}
    bcMS,     // memory map size = [top]
    bcNW,     // [top] = @new
    bcMC,     // copy [top]
    bcMD,     // double [top]
    bcRM,     // rem @[top]
    bcNA,     // [top] = @new array[  [top]  ] of pointer

    {** array's **}
    bcSF,     // sizeof( [top] as object )
    bcAL,     // length( [top] as array )
    bcSL,     // setlength( [top] as array, {stack} )

    bcPA,     // push ([top] as array)[top-1]
    bcSA,     // peek [top-2] -> ([top] as array)[top-1]

    {** memory grabber **}
    bcGPM,    // add pointer to TMem to grabber task-list
    bcGPA,    // add pointer to TMemArr to grabber task-list
    bcGC,     // run grabber

    {** constant's **}
    bcPHC,    // push const

    {** external call's **}
    bcPHEXMP, // push pointer to external method
    bcINV,    // call external method
    bcINVBP,  // call external method by pointer [top]

    {** for thread's **}
    bcPHN,    // push null
    bcCTHR,   // [top] = thread(method = [top], arg = [top+1]):id
    bcSTHR,   // suspendthread(id = [top])
    bcRTHR,   // resumethread(id = [top])
    bcTTHR,   // terminatethread(id = [top])

    {** for try..catch..finally block's **}
    bcTR,     // try @block_catch = [top], @block_end = [top+1]
    bcTRS,    // success exit from try/catch block
    bcTRR,    // raise exception, message = [top]

    {** for word's **}
    bcEQ_W,     // [top] == [top-1] ? [top] = 1 : [top] = 0
    bcBG_W,     // [top] >  [top-1] ? [top] = 1 : [top] = 0
    bcBE_W,     // [top] >= [top-1] ? [top] = 1 : [top] = 0

    bcNOT_W,    // [top] = ![top]
    bcAND_W,    // [top] = [top] and [top-1]
    bcOR_W,     // [top] = [top] or  [top-1]
    bcXOR_W,    // [top] = [top] xor [top-1]
    bcSHR_W,    // [top] = [top] shr [top-1]
    bcSHL_W,    // [top] = [top] shl [top-1]

    bcINC_W,    // [top]++
    bcDEC_W,    // [top]--
    bcADD_W,    // [top] = [top] + [top-1]
    bcSUB_W,    // [top] = [top] - [top-1]
    bcMUL_W,    // [top] = [top] * [top-1]
    bcDIV_W,    // [top] = [top] / [top-1]
    bcMOD_W,    // [top] = [top] % [top-1]
    bcIDIV_W,   // [top] = [top] \ [top-1]

    bcMV_W,     // [top]^ = [top-1]^
    bcMVBP_W,   // [top]^^ = [top-1]^

    {** for integer's **}
    bcEQ_I,     // [top] == [top-1] ? [top] = 1 : [top] = 0
    bcBG_I,     // [top] >  [top-1] ? [top] = 1 : [top] = 0
    bcBE_I,     // [top] >= [top-1] ? [top] = 1 : [top] = 0

    bcNOT_I,    // [top] = ![top]
    bcAND_I,    // [top] = [top] and [top-1]
    bcOR_I,     // [top] = [top] or  [top-1]
    bcXOR_I,    // [top] = [top] xor [top-1]
    bcSHR_I,    // [top] = [top] shr [top-1]
    bcSHL_I,    // [top] = [top] shl [top-1]

    bcNEG_I,    // [top] = -[top]
    bcINC_I,    // [top]++
    bcDEC_I,    // [top]--
    bcADD_I,    // [top] = [top] + [top-1]
    bcSUB_I,    // [top] = [top] - [top-1]
    bcMUL_I,    // [top] = [top] * [top-1]
    bcDIV_I,    // [top] = [top] / [top-1]
    bcMOD_I,    // [top] = [top] % [top-1]
    bcIDIV_I,   // [top] = [top] \ [top-1]

    bcMV_I,     // [top]^ = [top-1]^
    bcMVBP_I,   // [top]^^ = [top-1]^

    {** for digit's with floating point **}
    bcEQ_D,     // [top] == [top-1] ? [top] = 1 : [top] = 0
    bcBG_D,     // [top] >  [top-1] ? [top] = 1 : [top] = 0
    bcBE_D,     // [top] >= [top-1] ? [top] = 1 : [top] = 0

    bcNEG_D,    // [top] = -[top]
    bcINC_D,    // [top]++
    bcDEC_D,    // [top]--
    bcADD_D,    // [top] = [top] + [top-1]
    bcSUB_D,    // [top] = [top] - [top-1]
    bcMUL_D,    // [top] = [top] * [top-1]
    bcDIV_D,    // [top] = [top] / [top-1]
    bcMOD_D,    // [top] = [top] % [top-1]
    bcIDIV_D,   // [top] = [top] \ [top-1]

    bcMV_D,     // [top]^ = [top-1]^
    bcMVBP_D,   // [top]^^ = [top-1]^

    {** for string's **}
    bcEQ_S,
    bcADD_S,
    bcMV_S,
    bcMVBP_S,
    bcSTRL,     // strlen
    bcSTRD,     // strdel
    bcSTCHATP,  // push str[x]
    bcSTCHATK,  // peek str[x]
    bcCHORD,
    bcORDCH,

    {** [!] directly memory operations **}
    bcALLC,  //alloc memory
    bcRALLC, //realloc memory
    bcDISP,  //dispose memory
    bcGTB,   //get byte
    bcSTB,   //set byte
    bcCBP,   //mem copy
    bcRWBP,  //read word
    bcWWBP,  //write word
    bcRIBP,  //read int
    bcWIBP,  //write int
    bcRFBP,  //read float
    bcWFBP,  //write float
    bcRSBP,  //read string
    bcWSBP,  //write string

    bcTHREXT //stop code execution
    );

procedure TCodeSection.ParseSection;
var
  p1, p2: cardinal;
  s: string;
begin
  //writeln('Executable code generation...');
  p1 := 0;
  p2 := 0;
  while p2 < Lines.Count do
  begin
    s := Lines[p2];
    if (s[length(s)] = ':') then
    begin
      Constants.AddConstCardinal(copy(s, 1, length(s) - 1), p1);
      Lines.Delete(p2);
      Dec(p2);
      Dec(p1);
    end;
    if (Tk(s, 1) = 'push') or (Tk(s, 1) = 'peek') or (Tk(s, 1) = 'pushc') or
      (Tk(s, 1) = 'pushm') then
      Inc(p1, 5)
    else
    if Length(s) > 0 then
      Inc(p1);
    Inc(p2);
  end;
  while Lines.Count > 0 do
  begin
    s := Lines[0];
    Lines.Delete(0);
    if Tk(s, 1) = 'push' then
    begin
      Outp.WriteByte(byte(bcPH));
      St_WriteCardinal(Outp, StrToQWord(Tk(s, 2)));
      s := '';
    end;
    if Tk(s, 1) = 'peek' then
    begin
      Outp.WriteByte(byte(bcPK));
      St_WriteCardinal(Outp, StrToQWord(Tk(s, 2)));
      s := '';
    end;
    if Tk(s, 1) = 'pushc' then
    begin
      Outp.WriteByte(byte(bcPHC));
      St_WriteCardinal(Outp, Constants.GetAddr(Tk(s, 2)));
      s := '';
    end;
    if Tk(s, 1) = 'pushm' then
    begin
      Outp.WriteByte(byte(bcPHEXMP));
      St_WriteCardinal(Outp, Constants.GetAddr(Tk(s, 2)));
      s := '';
    end;
    if Tk(s, 1) = 'pop' then
      Outp.WriteByte(byte(bcPP))
    else
    if Tk(s, 1) = 'stkdrop' then
      Outp.WriteByte(byte(bcSDP))
    else
    if Tk(s, 1) = 'swp' then
      Outp.WriteByte(byte(bcSWP))
    else
    if Tk(s, 1) = 'jp' then
      Outp.WriteByte(byte(bcJP))
    else
    if Tk(s, 1) = 'jz' then
      Outp.WriteByte(byte(bcJZ))
    else
    if Tk(s, 1) = 'jn' then
      Outp.WriteByte(byte(bcJN))
    else
    if Tk(s, 1) = 'jc' then
      Outp.WriteByte(byte(bcJC))
    else
    if Tk(s, 1) = 'jr' then
      Outp.WriteByte(byte(bcJR))
    else
    if Tk(s, 1) = 'eq' then
      Outp.WriteByte(byte(bcEQ))
    else
    if Tk(s, 1) = 'bg' then
      Outp.WriteByte(byte(bcBG))
    else
    if Tk(s, 1) = 'be' then
      Outp.WriteByte(byte(bcBE))
    else
    if Tk(s, 1) = 'not' then
      Outp.WriteByte(byte(bcNOT))
    else
    if Tk(s, 1) = 'and' then
      Outp.WriteByte(byte(bcAND))
    else
    if Tk(s, 1) = 'or' then
      Outp.WriteByte(byte(bcOR))
    else
    if Tk(s, 1) = 'xor' then
      Outp.WriteByte(byte(bcXOR))
    else
    if Tk(s, 1) = 'shr' then
      Outp.WriteByte(byte(bcSHR))
    else
    if Tk(s, 1) = 'shl' then
      Outp.WriteByte(byte(bcSHL))
    else
    if Tk(s, 1) = 'neg' then
      Outp.WriteByte(byte(bcNEG))
    else
    if Tk(s, 1) = 'inc' then
      Outp.WriteByte(byte(bcINC))
    else
    if Tk(s, 1) = 'dec' then
      Outp.WriteByte(byte(bcDEC))
    else
    if Tk(s, 1) = 'add' then
      Outp.WriteByte(byte(bcADD))
    else
    if Tk(s, 1) = 'sub' then
      Outp.WriteByte(byte(bcSUB))
    else
    if Tk(s, 1) = 'mul' then
      Outp.WriteByte(byte(bcMUL))
    else
    if Tk(s, 1) = 'div' then
      Outp.WriteByte(byte(bcDIV))
    else
    if Tk(s, 1) = 'mod' then
      Outp.WriteByte(byte(bcMOD))
    else
    if Tk(s, 1) = 'idiv' then
      Outp.WriteByte(byte(bcIDIV))
    else
    if Tk(s, 1) = 'land' then
      Outp.WriteByte(byte(bcLAND))
    else
    if Tk(s, 1) = 'lor' then
      Outp.WriteByte(byte(bcLOR))
    else
    if Tk(s, 1) = 'lxor' then
      Outp.WriteByte(byte(bcLXOR))
    else
    if Tk(s, 1) = 'lnot' then
      Outp.WriteByte(byte(bcLNOT))
    else
    if Tk(s, 1) = 'mov' then
      Outp.WriteByte(byte(bcMV))
    else
    if Tk(s, 1) = 'movbp' then
      Outp.WriteByte(byte(bcMVBP))
    else
    if Tk(s, 1) = 'gvbp' then
      Outp.WriteByte(byte(bcGVBP))
    else
    if Tk(s, 1) = 'movp' then
      Outp.WriteByte(byte(bcMVP))
    else
    if Tk(s, 1) = 'msz' then
      Outp.WriteByte(byte(bcMS))
    else
    if Tk(s, 1) = 'new' then
      Outp.WriteByte(byte(bcNW))
    else
    if Tk(s, 1) = 'copy' then
      Outp.WriteByte(byte(bcMC))
    else
    if Tk(s, 1) = 'pcopy' then
      Outp.WriteByte(byte(bcMD))
    else
    if Tk(s, 1) = 'rem' then
      Outp.WriteByte(byte(bcRM))
    else
    if Tk(s, 1) = 'newa' then
      Outp.WriteByte(byte(bcNA))
    else
    if Tk(s, 1) = 'sizeof' then
      Outp.WriteByte(byte(bcSF))
    else
    if Tk(s, 1) = 'alen' then
      Outp.WriteByte(byte(bcAL))
    else
    if Tk(s, 1) = 'salen' then
      Outp.WriteByte(byte(bcSL))
    else
    if Tk(s, 1) = 'pushai' then
      Outp.WriteByte(byte(bcPA))
    else
    if Tk(s, 1) = 'peekai' then
      Outp.WriteByte(byte(bcSA))
    else
    if Tk(s, 1) = 'gpm' then
      Outp.WriteByte(byte(bcGPM))
    else
    if Tk(s, 1) = 'gpa' then
      Outp.WriteByte(byte(bcGPA))
    else
    if Tk(s, 1) = 'gc' then
      Outp.WriteByte(byte(bcGC))
    else
    if Tk(s, 1) = 'invoke' then
      Outp.WriteByte(byte(bcINV))
    else
    if Tk(s, 1) = 'invokebp' then
      Outp.WriteByte(byte(bcINVBP))
    else
    if Tk(s, 1) = 'pushn' then
      Outp.WriteByte(byte(bcPHN))
    else
    if Tk(s, 1) = 'cthr' then
      Outp.WriteByte(byte(bcCTHR))
    else
    if Tk(s, 1) = 'sthr' then
      Outp.WriteByte(byte(bcSTHR))
    else
    if Tk(s, 1) = 'rthr' then
      Outp.WriteByte(byte(bcRTHR))
    else
    if Tk(s, 1) = 'tthr' then
      Outp.WriteByte(byte(bcTTHR))
    else
    if Tk(s, 1) = 'tr' then
      Outp.WriteByte(byte(bcTR))
    else
    if Tk(s, 1) = 'trs' then
      Outp.WriteByte(byte(bcTRS))
    else
    if Tk(s, 1) = 'trr' then
      Outp.WriteByte(byte(bcTRR))
    else
    if Tk(s, 1) = 'eqw' then
      Outp.WriteByte(byte(bcEQ_W))
    else
    if Tk(s, 1) = 'bgw' then
      Outp.WriteByte(byte(bcBG_W))
    else
    if Tk(s, 1) = 'bew' then
      Outp.WriteByte(byte(bcBE_W))
    else
    if Tk(s, 1) = 'notw' then
      Outp.WriteByte(byte(bcNOT_W))
    else
    if Tk(s, 1) = 'andw' then
      Outp.WriteByte(byte(bcAND_W))
    else
    if Tk(s, 1) = 'orw' then
      Outp.WriteByte(byte(bcOR_W))
    else
    if Tk(s, 1) = 'xorw' then
      Outp.WriteByte(byte(bcXOR_W))
    else
    if Tk(s, 1) = 'shrw' then
      Outp.WriteByte(byte(bcSHR_W))
    else
    if Tk(s, 1) = 'shlw' then
      Outp.WriteByte(byte(bcSHL_W))
    else
    if Tk(s, 1) = 'eqi' then
      Outp.WriteByte(byte(bcEQ_I))
    else
    if Tk(s, 1) = 'bgi' then
      Outp.WriteByte(byte(bcBG_I))
    else
    if Tk(s, 1) = 'bei' then
      Outp.WriteByte(byte(bcBE_I))
    else
    if Tk(s, 1) = 'noti' then
      Outp.WriteByte(byte(bcNOT_I))
    else
    if Tk(s, 1) = 'andi' then
      Outp.WriteByte(byte(bcAND_I))
    else
    if Tk(s, 1) = 'ori' then
      Outp.WriteByte(byte(bcOR_I))
    else
    if Tk(s, 1) = 'xori' then
      Outp.WriteByte(byte(bcXOR_I))
    else
    if Tk(s, 1) = 'shri' then
      Outp.WriteByte(byte(bcSHR_I))
    else
    if Tk(s, 1) = 'shli' then
      Outp.WriteByte(byte(bcSHL_I))
    else
    if Tk(s, 1) = 'eqd' then
      Outp.WriteByte(byte(bcEQ_D))
    else
    if Tk(s, 1) = 'bgd' then
      Outp.WriteByte(byte(bcBG_D))
    else
    if Tk(s, 1) = 'bed' then
      Outp.WriteByte(byte(bcBE_D))
    else
    if Tk(s, 1) = 'incw' then
      Outp.WriteByte(byte(bcINC_W))
    else
    if Tk(s, 1) = 'decw' then
      Outp.WriteByte(byte(bcDEC_W))
    else
    if Tk(s, 1) = 'addw' then
      Outp.WriteByte(byte(bcADD_W))
    else
    if Tk(s, 1) = 'subw' then
      Outp.WriteByte(byte(bcSUB_W))
    else
    if Tk(s, 1) = 'mulw' then
      Outp.WriteByte(byte(bcMUL_W))
    else
    if Tk(s, 1) = 'divw' then
      Outp.WriteByte(byte(bcDIV_W))
    else
    if Tk(s, 1) = 'modw' then
      Outp.WriteByte(byte(bcMOD_W))
    else
    if Tk(s, 1) = 'idivw' then
      Outp.WriteByte(byte(bcIDIV_W))
    else
    if Tk(s, 1) = 'mvw' then
      Outp.WriteByte(byte(bcMV_W))
    else
    if Tk(s, 1) = 'mvbpw' then
      Outp.WriteByte(byte(bcMVBP_W))
    else
    if Tk(s, 1) = 'negi' then
      Outp.WriteByte(byte(bcNEG_I))
    else
    if Tk(s, 1) = 'inci' then
      Outp.WriteByte(byte(bcINC_I))
    else
    if Tk(s, 1) = 'deci' then
      Outp.WriteByte(byte(bcDEC_I))
    else
    if Tk(s, 1) = 'addi' then
      Outp.WriteByte(byte(bcADD_I))
    else
    if Tk(s, 1) = 'subi' then
      Outp.WriteByte(byte(bcSUB_I))
    else
    if Tk(s, 1) = 'muli' then
      Outp.WriteByte(byte(bcMUL_I))
    else
    if Tk(s, 1) = 'divi' then
      Outp.WriteByte(byte(bcDIV_I))
    else
    if Tk(s, 1) = 'modi' then
      Outp.WriteByte(byte(bcMOD_I))
    else
    if Tk(s, 1) = 'idivi' then
      Outp.WriteByte(byte(bcIDIV_I))
    else
    if Tk(s, 1) = 'mvi' then
      Outp.WriteByte(byte(bcMV_I))
    else
    if Tk(s, 1) = 'mvbpi' then
      Outp.WriteByte(byte(bcMVBP_I))
    else
    if Tk(s, 1) = 'negd' then
      Outp.WriteByte(byte(bcNEG_D))
    else
    if Tk(s, 1) = 'incd' then
      Outp.WriteByte(byte(bcINC_D))
    else
    if Tk(s, 1) = 'decd' then
      Outp.WriteByte(byte(bcDEC_D))
    else
    if Tk(s, 1) = 'addd' then
      Outp.WriteByte(byte(bcADD_D))
    else
    if Tk(s, 1) = 'subd' then
      Outp.WriteByte(byte(bcSUB_D))
    else
    if Tk(s, 1) = 'muld' then
      Outp.WriteByte(byte(bcMUL_D))
    else
    if Tk(s, 1) = 'divd' then
      Outp.WriteByte(byte(bcDIV_D))
    else
    if Tk(s, 1) = 'modd' then
      Outp.WriteByte(byte(bcMOD_D))
    else
    if Tk(s, 1) = 'idivd' then
      Outp.WriteByte(byte(bcIDIV_D))
    else
    if Tk(s, 1) = 'mvd' then
      Outp.WriteByte(byte(bcMV_D))
    else
    if Tk(s, 1) = 'mvbpd' then
      Outp.WriteByte(byte(bcMVBP_D))
    else
    if Tk(s, 1) = 'eqs' then
      Outp.WriteByte(byte(bcEQ_S))
    else
    if Tk(s, 1) = 'adds' then
      Outp.WriteByte(byte(bcADD_S))
    else
    if Tk(s, 1) = 'mvs' then
      Outp.WriteByte(byte(bcMV_S))
    else
    if Tk(s, 1) = 'mvbps' then
      Outp.WriteByte(byte(bcMVBP_S))
    else
    if Tk(s, 1) = 'strl' then
      Outp.WriteByte(byte(bcSTRL))
    else
    if Tk(s, 1) = 'strd' then
      Outp.WriteByte(byte(bcSTRD))
    else
    if Tk(s, 1) = 'stchatp' then
      Outp.WriteByte(byte(bcSTCHATP))
    else
    if Tk(s, 1) = 'stchatk' then
      Outp.WriteByte(byte(bcSTCHATK))
    else
    if Tk(s, 1) = 'chord' then
      Outp.WriteByte(byte(bcCHORD))
    else
    if Tk(s, 1) = 'ordch' then
      Outp.WriteByte(byte(bcORDCH))
    else
    if Tk(s, 1) = 'allc' then
      Outp.WriteByte(byte(bcALLC))
    else
    if Tk(s, 1) = 'rallc' then
      Outp.WriteByte(byte(bcRALLC))
    else
    if Tk(s, 1) = 'disp' then
      Outp.WriteByte(byte(bcDISP))
    else
    if Tk(s, 1) = 'gtb' then
      Outp.WriteByte(byte(bcGTB))
    else
    if Tk(s, 1) = 'stb' then
      Outp.WriteByte(byte(bcSTB))
    else
    if Tk(s, 1) = 'cbp' then
      Outp.WriteByte(byte(bcCBP))
    else
    if Tk(s, 1) = 'rwbp' then
      Outp.WriteByte(byte(bcRWBP))
    else
    if Tk(s, 1) = 'wwbp' then
      Outp.WriteByte(byte(bcWWBP))
    else
    if Tk(s, 1) = 'ribp' then
      Outp.WriteByte(byte(bcRIBP))
    else
    if Tk(s, 1) = 'wibp' then
      Outp.WriteByte(byte(bcWIBP))
    else
    if Tk(s, 1) = 'rfbp' then
      Outp.WriteByte(byte(bcRFBP))
    else
    if Tk(s, 1) = 'wfbp' then
      Outp.WriteByte(byte(bcWFBP))
    else
    if Tk(s, 1) = 'rsbp' then
      Outp.WriteByte(byte(bcRSBP))
    else
    if Tk(s, 1) = 'wsbp' then
      Outp.WriteByte(byte(bcWSBP))
    else
    if Tk(s, 1) = 'threxit' then
      Outp.WriteByte(byte(bcTHREXT))
    else
    if Length(s) > 0 then
      AsmError('Invalid token in line: "' + s + '"');
  end;
end;

procedure TCodeSection.GenerateCode(Stream: TStream);
begin
  Stream.WriteBuffer(Outp.Memory^, Outp.Size);
end;

end.

