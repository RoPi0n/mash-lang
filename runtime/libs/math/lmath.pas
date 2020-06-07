library lmath;

uses Math, SysUtils;

{$I '..\svm.inc'}

procedure FSin(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, Sin(__Next_Float(pctx)));
end;

procedure FCos(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, Cos(__Next_Float(pctx)));
end;

procedure FTg(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, Tan(__Next_Float(pctx)));
end;

procedure FCtg(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, CoTan(__Next_Float(pctx)));
end;

procedure FArcSin(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, ArcSin(__Next_Float(pctx)));
end;

procedure FArcCos(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, ArcCos(__Next_Float(pctx)));
end;

procedure FArcTg(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, arctan(__Next_Float(pctx)));
end;

procedure FLog10(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, Log10(__Next_Float(pctx)));
end;

procedure FLog2(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, Log2(__Next_Float(pctx)));
end;

procedure FLogN(pctx: pointer); stdcall;
var
  a: double;
begin
  a := __Next_Float(pctx);
  __Return_Float(pctx, LogN(a, __Next_Float(pctx)));
end;

procedure Flnxp1(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, lnxp1(__Next_Float(pctx)));
end;

procedure FExp(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, Exp(__Next_Float(pctx)));
end;

{EXPORTS}
exports FSIN     name 'SIN';
exports FCOS     name 'COS';
exports FTG      name 'TG';
exports FCTG     name 'CTG';
exports FARCSIN  name 'ARCSIN';
exports FARCCOS  name 'ARCCOS';
exports FARCTG   name 'ARCTG';
exports FLOG10   name 'LOG10';
exports FLOG2    name 'LOG2';
exports FLOGN    name 'LOGN';
exports FLNXP1   name 'LNXP1';
exports FExp     name 'EXP';

begin
end.
