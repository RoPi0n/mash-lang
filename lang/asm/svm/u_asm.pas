unit u_asm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_common, u_consts, u_writers;

type
  TCodeSection = class(TObject)
  public
    Lines: TStringList;
    Constants: TConstantManager;
    Outp: TMemoryStream;
    Vars: TStringList;
    constructor Create(sl: TStringList; vars_lst: TStringList; cnsts: TConstantManager);
    destructor Destroy; override;
    procedure ParseSection;
    procedure GenerateCode(Stream: TStream);
  end;

implementation

{** Code section **}

constructor TCodeSection.Create(sl: TStringList; vars_lst: TStringList; cnsts: TConstantManager);
begin
  Outp := TMemoryStream.Create;
  Lines := sl;
  Constants := cnsts;
  Vars := vars_lst;
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
    bcPHL,
    bcPKL,
    bcPP,     // pop
    bcSDP,    // stkdrop
    bcSWP,    // [top] <-> [top-1]

    {** jump's **}
    bcJP,     // jump [top]
    bcJZ,     // [top] == 0 ? jp [top-1]
    bcJN,     // [top] <> 0 ? jp [top-1]
    bcJC,     // jp [top] & push callback point as ip+1
    bcJR,     // jp to last callback point & rem last callback point
    bcJRP,

    {** for untyped's **}
    bcEQ,     // [top] == [top-1] ? [top] = true : [top] = false
    bcBG,     // [top] >  [top-1] ? [top] = true : [top] = false
    bcBE,     // [top] >= [top-1] ? [top] = true : [top] = false

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
    bcNA,     // [top] = @new array[  [top]  ] of pointer
    bcTF,     // [top] = typeof( [top] )
    bcTMC,    // [top].type = type of class
    bcSF,     // [top] = sizeof( [top] )
    bcGC,     // garbage collect

    {** array's **}
    bcAL,     // length( [top] as array )
    bcSL,     // setlength( [top] as array, {stack} )

    bcPA,     // push ([top] as array)[top-1]
    bcSA,     // peek [top-2] -> ([top] as array)[top-1]

    {** constant's **}
    bcPHC,    // push copy of const
    bcPHCP,   // push pointer to original const

    {** external call's **}
    bcINV,    // call external method

    {** for thread's **}
    bcPHN,    // push null
    bcCTHR,   // [top] = thread(method = [top], arg = [top+1]):id
    bcSTHR,   // suspendthread(id = [top])
    bcRTHR,   // resumethread(id = [top])
    bcTTHR,   // terminatethread(id = [top])
    bcTHSP,   // set thread priority

    bcPLC,    // push last callback
    bcPCT,    // push context
    bcLCT,    // load context
    bcJRX,    // jp to last callback point & rem last callback point twice

    {** for try..catch..finally block's **}
    bcTR,     // try @block_catch = [top], @block_end = [top+1]
    bcTRS,    // success exit from try/catch block
    bcTRR,    // raise exception, message = [top]

    {** for string's **}
    bcSTRD,     // strdel
    bcCHORD,
    bcORDCH,

    bcTHREXT,//stop code execution

    bcDBP,   //debug method call

    bcRST,
    bcRLD,
    bcRDP
    );

procedure TCodeSection.ParseSection;
var
  p1, p2: cardinal;
  s, bf: string;
  v: Int64;
begin
  p1 := 0;
  p2 := 0;
  while p2 < Lines.Count do
  begin
    s := Trim(Lines[p2]);

    if Length(s) > 0 then
     begin
       if (s[length(s)] = ':') then
       begin
         Constants.AddConstCardinal(copy(s, 1, length(s) - 1), p1);
         Lines.Delete(p2);
         Dec(p2);
         Dec(p1);
       end;

       bf := Tk(s, 1);

       if (bf = 'push') or (bf = 'peek') or (bf = 'pushc') or
          (bf = 'pushm') or (bf = 'pushcp') then
        Inc(p1, 5)
       else
        Inc(p1);
     end;

    Inc(p2);
  end;
  while Lines.Count > 0 do
  begin
    s := Trim(Lines[0]);
    bf := Tk(s, 1);
    Lines.Delete(0);

    if length(s) = 0 then
      // skip line
    else
    if bf = 'push' then
    begin
      v := Vars.IndexOf(Tk(s, 2));
      if v = -1 then
       AsmErr('Invalid variable <' + Tk(s, 2) + '> call.');

      if Pos('.', Tk(s, 2)) > 0 then
       Outp.WriteByte(byte(bcPHL))
      else
       Outp.WriteByte(byte(bcPH));

      St_WriteCardinal(Outp, v);
      s := '';
    end
    else
    if bf = 'peek' then
    begin
      v := Vars.IndexOf(Tk(s, 2));
      if v = -1 then
       AsmErr('Invalid variable <' + Tk(s, 2) + '> call.');

      if Pos('.', Tk(s, 2)) > 0 then
       Outp.WriteByte(byte(bcPKL))
      else
       Outp.WriteByte(byte(bcPK));

      St_WriteCardinal(Outp, v);
      s := '';
    end
    else
    if bf = 'pushc' then
    begin
      Outp.WriteByte(byte(bcPHC));
      St_WriteCardinal(Outp, Constants.GetAddr(Tk(s, 2)));
      s := '';
    end
    else
    if bf = 'pushcp' then
    begin
      Outp.WriteByte(byte(bcPHCP));
      St_WriteCardinal(Outp, Constants.GetAddr(Tk(s, 2)));
      s := '';
    end
    else
    if bf = 'pop' then
      Outp.WriteByte(byte(bcPP))
    else
    if bf = 'stkdrop' then
      Outp.WriteByte(byte(bcSDP))
    else
    if bf = 'swp' then
      Outp.WriteByte(byte(bcSWP))
    else
    if bf = 'jp' then
      Outp.WriteByte(byte(bcJP))
    else
    if bf = 'jz' then
      Outp.WriteByte(byte(bcJZ))
    else
    if bf = 'jn' then
      Outp.WriteByte(byte(bcJN))
    else
    if bf = 'jc' then
      Outp.WriteByte(byte(bcJC))
    else
    if bf = 'jr' then
      Outp.WriteByte(byte(bcJR))
    else
    if bf = 'eq' then
      Outp.WriteByte(byte(bcEQ))
    else
    if bf = 'bg' then
      Outp.WriteByte(byte(bcBG))
    else
    if bf = 'be' then
      Outp.WriteByte(byte(bcBE))
    else
    if bf = 'not' then
      Outp.WriteByte(byte(bcNOT))
    else
    if bf = 'and' then
      Outp.WriteByte(byte(bcAND))
    else
    if bf = 'or' then
      Outp.WriteByte(byte(bcOR))
    else
    if bf = 'xor' then
      Outp.WriteByte(byte(bcXOR))
    else
    if bf = 'shr' then
      Outp.WriteByte(byte(bcSHR))
    else
    if bf = 'shl' then
      Outp.WriteByte(byte(bcSHL))
    else
    if bf = 'neg' then
      Outp.WriteByte(byte(bcNEG))
    else
    if bf = 'inc' then
      Outp.WriteByte(byte(bcINC))
    else
    if bf = 'dec' then
      Outp.WriteByte(byte(bcDEC))
    else
    if bf = 'add' then
      Outp.WriteByte(byte(bcADD))
    else
    if bf = 'sub' then
      Outp.WriteByte(byte(bcSUB))
    else
    if bf = 'mul' then
      Outp.WriteByte(byte(bcMUL))
    else
    if bf = 'div' then
      Outp.WriteByte(byte(bcDIV))
    else
    if bf = 'mod' then
      Outp.WriteByte(byte(bcMOD))
    else
    if bf = 'idiv' then
      Outp.WriteByte(byte(bcIDIV))
    else
    if bf = 'mov' then
      Outp.WriteByte(byte(bcMV))
    else
    if bf = 'movbp' then
      Outp.WriteByte(byte(bcMVBP))
    else
    if bf = 'gvbp' then
      Outp.WriteByte(byte(bcGVBP))
    else
    if bf = 'movp' then
      Outp.WriteByte(byte(bcMVP))
    else
    if bf = 'msz' then
      Outp.WriteByte(byte(bcMS))
    else
    if bf = 'new' then
      Outp.WriteByte(byte(bcNW))
    else
    if bf = 'copy' then
      Outp.WriteByte(byte(bcMC))
    else
    if bf = 'pcopy' then
      Outp.WriteByte(byte(bcMD))
    else
    if bf = 'newa' then
      Outp.WriteByte(byte(bcNA))
    else
    if bf = 'typeof' then
      Outp.WriteByte(byte(bcTF))
    else
    if bf = 'typemarkclass' then
      Outp.WriteByte(byte(bcTMC))
    else
    if bf = 'sizeof' then
      Outp.WriteByte(byte(bcSF))
    else
    if bf = 'alen' then
      Outp.WriteByte(byte(bcAL))
    else
    if bf = 'salen' then
      Outp.WriteByte(byte(bcSL))
    else
    if bf = 'pushai' then
      Outp.WriteByte(byte(bcPA))
    else
    if bf = 'peekai' then
      Outp.WriteByte(byte(bcSA))
    else
    if bf = 'gc' then
      Outp.WriteByte(byte(bcGC))
    else
    if bf = 'invoke' then
      Outp.WriteByte(byte(bcINV))
    else
    if bf = 'pushn' then
      Outp.WriteByte(byte(bcPHN))
    else
    if bf = 'cthr' then
      Outp.WriteByte(byte(bcCTHR))
    else
    if bf = 'sthr' then
      Outp.WriteByte(byte(bcSTHR))
    else
    if bf = 'rthr' then
      Outp.WriteByte(byte(bcRTHR))
    else
    if bf = 'tthr' then
      Outp.WriteByte(byte(bcTTHR))
    else
    if bf = 'thsp' then
      Outp.WriteByte(byte(bcTHSP))
    else
    if bf = 'plc' then
      Outp.WriteByte(byte(bcPLC))
    else
    if bf = 'pct' then
      Outp.WriteByte(byte(bcPCT))
    else
    if bf = 'lct' then
      Outp.WriteByte(byte(bcLCT))
    else
    if bf = 'jrx' then
      Outp.WriteByte(byte(bcJRX))
    else
    if bf = 'tr' then
      Outp.WriteByte(byte(bcTR))
    else
    if bf = 'trs' then
      Outp.WriteByte(byte(bcTRS))
    else
    if bf = 'trr' then
      Outp.WriteByte(byte(bcTRR))
    else
    if bf = 'strd' then
      Outp.WriteByte(byte(bcSTRD))
    else
    if bf = 'chord' then
      Outp.WriteByte(byte(bcCHORD))
    else
    if bf = 'ordch' then
      Outp.WriteByte(byte(bcORDCH))
    else
    if bf = 'threxit' then
      Outp.WriteByte(byte(bcTHREXT))
    else
    if bf = 'dbgbreakpoint' then
      Outp.WriteByte(byte(bcDBP))
    else
    if bf = 'rst' then
      Outp.WriteByte(byte(bcRST))
    else
    if bf = 'rld' then
      Outp.WriteByte(byte(bcRLD))
    else
    if bf = 'rdp' then
      Outp.WriteByte(byte(bcRDP))
    else
    if bf = 'jrp' then
      Outp.WriteByte(byte(bcJRP))
    else
    if Length(s) > 0 then
      AsmErr('Invalid token in line: "' + s + '"');
  end;
end;

procedure TCodeSection.GenerateCode(Stream: TStream);
begin
  Stream.WriteBuffer(Outp.Memory^, Outp.Size);
end;

end.

