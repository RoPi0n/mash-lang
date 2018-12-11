library math;

uses Math, svm_api in '..\svm_api.pas';

procedure FSin(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.Create);
  TSVMMem(Stack^.peek).SetD(sin(TSVMMem(Stack^.popv).GetD));
end;

procedure FCos(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.Create);
  TSVMMem(Stack^.peek).SetD(cos(TSVMMem(Stack^.popv).GetD));
end;

procedure FTg(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.Create);
  TSVMMem(Stack^.peek).SetD(tan(TSVMMem(Stack^.popv).GetD));
end;

procedure FCtg(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.Create);
  TSVMMem(Stack^.peek).SetD(cotan(TSVMMem(Stack^.popv).GetD));
end;

procedure FArcSin(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.Create);
  TSVMMem(Stack^.peek).SetD(ArcSin(TSVMMem(Stack^.popv).GetD));
end;

procedure FArcCos(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.Create);
  TSVMMem(Stack^.peek).SetD(ArcCos(TSVMMem(Stack^.popv).GetD));
end;

procedure FLog10(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.Create);
  TSVMMem(Stack^.peek).SetD(Log10(TSVMMem(Stack^.popv).GetD));
end;

procedure FLog2(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.Create);
  TSVMMem(Stack^.peek).SetD(Log2(TSVMMem(Stack^.popv).GetD));
end;

procedure FLogN(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.Create);
  TSVMMem(Stack^.peek).SetD(LogN(TSVMMem(Stack^.popv).GetD, TSVMMem(Stack^.popv).GetD));
end;

procedure Flnxp1(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.Create);
  TSVMMem(Stack^.peek).SetD(lnxp1(TSVMMem(Stack^.popv).GetD));
end;

procedure FExp(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.Create);
  TSVMMem(Stack^.peek).SetD(Exp(TSVMMem(Stack^.popv).GetD));
end;

{EXPORTS}
exports FSIN     name 'SIN';
exports FCOS     name 'COS';
exports FTG      name 'TG';
exports FCTG     name 'CTG';
exports FARCSIN  name 'ARCSIN';
exports FARCCOS  name 'ARCCOS';
exports FLOG10   name 'LOG10';
exports FLOG2    name 'LOG2';
exports FLOGN    name 'LOGN';
exports FLNXP1   name 'LNXP1';
exports FExp     name 'EXP';

begin
end.
