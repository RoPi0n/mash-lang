unit svm_opcodes;

{$mode objfpc}
{$H+}

interface

{***** OP Codes ***************************************************************}
type
  TInstruction = (
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
    bcNA,     // [top] = @new array[  [top]  ] of pointer
    bcTF,     // [top] = typeof( [top] )
    bcTMC,    // [top].type = type of class
    bcSF,     // [top] = sizeof( [top] )
    //bcRM,     // rem object
    //bcGPM,    // mark garbage
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

    bcTHREXT,// stop code execution

    bcDBP,   // debug method call

    bcRST,   // Extra stack for recursion
    bcRLD

    //bcCOPST  //set handler for class-object operation
  );

implementation

end.

