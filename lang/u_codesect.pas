unit u_codesect;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global, u_consts, u_writers;

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
    bcTF,     // [top] = typeof( [top] )
    bcTMC,    // [top].type = type of class
    bcSF,     // [top] = sizeof( [top] )

    {** array's **}
    bcAL,     // length( [top] as array )
    bcSL,     // setlength( [top] as array, {stack} )

    bcPA,     // push ([top] as array)[top-1]
    bcSA,     // peek [top-2] -> ([top] as array)[top-1]

    {** memory grabber **}
    bcGPM,    // add pointer to TMem to grabber task-list
    bcGC,     // run grabber

    {** constant's **}
    bcPHC,    // push copy of const
    bcPHCP,   // push pointer to original const

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
    bcTHSP,   // set thread priority

    {** for try..catch..finally block's **}
    bcTR,     // try @block_catch = [top], @block_end = [top+1]
    bcTRS,    // success exit from try/catch block
    bcTRR,    // raise exception, message = [top]

    {** for string's **}
    bcSTRD,     // strdel
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

    bcTHREXT,//stop code execution

    bcDBP//,   //debug method call

    //bcCOPST
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
      (Tk(s, 1) = 'pushm') or (Tk(s, 1) = 'pushcp') then
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
    end
    else
    if Tk(s, 1) = 'peek' then
    begin
      Outp.WriteByte(byte(bcPK));
      St_WriteCardinal(Outp, StrToQWord(Tk(s, 2)));
      s := '';
    end
    else
    if Tk(s, 1) = 'pushc' then
    begin
      Outp.WriteByte(byte(bcPHC));
      St_WriteCardinal(Outp, Constants.GetAddr(Tk(s, 2)));
      s := '';
    end
    else
    if Tk(s, 1) = 'pushm' then
    begin
      Outp.WriteByte(byte(bcPHEXMP));
      St_WriteCardinal(Outp, Constants.GetAddr(Tk(s, 2)));
      s := '';
    end
    else
    if Tk(s, 1) = 'pushcp' then
    begin
      Outp.WriteByte(byte(bcPHCP));
      St_WriteCardinal(Outp, Constants.GetAddr(Tk(s, 2)));
      s := '';
    end
    else
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
    if Tk(s, 1) = 'typeof' then
      Outp.WriteByte(byte(bcTF))
    else
    if Tk(s, 1) = 'typemarkclass' then
      Outp.WriteByte(byte(bcTMC))
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
    if Tk(s, 1) = 'thsp' then
      Outp.WriteByte(byte(bcTHSP))
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
    if Tk(s, 1) = 'strd' then
      Outp.WriteByte(byte(bcSTRD))
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
    if Tk(s, 1) = 'dbgbreakpoint' then
      Outp.WriteByte(byte(bcDBP))
    else
    {if Tk(s, 1) = 'copst' then
      Outp.WriteByte(byte(bcCOPST))
    else}
    if Length(s) > 0 then
      AsmError('Invalid token in line: "' + s + '"');
  end;
end;

procedure TCodeSection.GenerateCode(Stream: TStream);
begin
  Stream.WriteBuffer(Outp.Memory^, Outp.Size);
end;

end.

