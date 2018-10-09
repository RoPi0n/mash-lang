library dmath;

uses Math;

{$I ..\adp.inc}

procedure DSin(Stack:PStack); cdecl;
begin
 Stack^.push(new_d6v(sin(PMem(Stack^.popv)^)));
end;
procedure DCos(Stack:PStack); cdecl;
begin
 Stack^.push(new_d6v(cos(PMem(Stack^.popv)^)));
end;
procedure DTg(Stack:PStack); cdecl;
begin
 Stack^.push(new_d6v(tan(PMem(Stack^.popv)^)));
end;
procedure DCtg(Stack:PStack); cdecl;
begin
 Stack^.push(new_d6v(cotan(PMem(Stack^.popv)^)));
end;
procedure DArcSin(Stack:PStack); cdecl;
begin
 Stack^.push(new_d6v(ArcSin(PMem(Stack^.popv)^)));
end;
procedure DArcCos(Stack:PStack); cdecl;
begin
 Stack^.push(new_d6v(ArcCos(PMem(Stack^.popv)^)));
end;
procedure DLog10(Stack:PStack); cdecl;
begin
 Stack^.push(new_d6v(Log10(PMem(Stack^.popv)^)));
end;
procedure DLog2(Stack:PStack); cdecl;
begin
 Stack^.push(new_d6v(Log2(PMem(Stack^.popv)^)));
end;
procedure DLogN(Stack:PStack); cdecl;
begin
 Stack^.push(new_d6v(LogN(PMem(Stack^.popv)^,PMem(Stack^.popv)^)));
end;
procedure Dlnxp1(Stack:PStack); cdecl;
begin
 Stack^.push(new_d6v(lnxp1(PMem(Stack^.popv)^)));
end;
procedure DExp(Stack:PStack); cdecl;
begin
 Stack^.push(new_d6v(Exp(PMem(Stack^.popv)^)));
end;

{EXPORTS DB}
exports DSIN                name 'SIN';
exports DCOS                name 'COS';
exports DTG                 name 'TG';
exports DCTG                name 'CTG';
exports DARCSIN             name 'ARCSIN';
exports DARCCOS             name 'ARCCOS';
exports DLOG10              name 'LOG10';
exports DLOG2               name 'LOG2';
exports DLOGN               name 'LOGN';
exports DLNXP1              name 'LNXP1';
exports DExp                name 'EXP';

begin
end.
