library bf;

uses SysUtils, svm_api in '..\svm_api.pas';

procedure DHalt(Stack:PStack); cdecl;
begin
  halt;
end;

procedure DStrToInt(Stack:PStack); cdecl;
var
  s:string;
begin
  s := TSVMMem(Stack^.popv).GetS;
  Stack^.push(TSVMMem.CreateF(StrToInt(s), svmtInt));
end;

procedure DStrToFloat(Stack:PStack); cdecl;
var
  s:string;
  f:double;
begin
  s := TSVMMem(Stack^.popv).GetS;
  f := StrToFloat(s);
  Stack^.push(TSVMMem.CreateF(f, svmtReal));
end;

procedure DStrUpper(Stack:PStack); cdecl;
var
  s:string;
begin
  s := TSVMMem(Stack^.popv).GetS;
  Stack^.push(TSVMMem.CreateFS(UpperCase(s)));
end;

procedure DStrLower(Stack:PStack); cdecl;
var
  s:string;
begin
  s := TSVMMem(Stack^.popv).GetS;
  Stack^.push(TSVMMem.CreateFS(LowerCase(s)));
end;

procedure DIntToStr(Stack:PStack); cdecl;
var
  s:int64;
begin
  s := TSVMMem(Stack^.popv).GetI;
  Stack^.push(TSVMMem.CreateFS(IntToStr(s)));
end;

procedure DFloatToStr(Stack:PStack); cdecl;
var
  s:double;
begin
  s := TSVMMem(Stack^.popv).GetD;
  Stack^.push(TSVMMem.CreateFS(FloatToStr(s)));
end;

procedure DSleep(Stack:PStack); cdecl;
begin
  sleep(TSVMMem(Stack^.popv).GetW);
end;

//DateTime
procedure DNow(Stack:PStack); cdecl;
var
  f:double;
begin
  f := now;
  Stack^.push(TSVMMem.CreateF(f, svmtReal));
end;

procedure DRandomize(Stack:PStack); cdecl;
begin
  Randomize;
end;

procedure DRandom(Stack:PStack); cdecl;
var
  f:double;
begin
  f := Random;
  Stack^.push(TSVMMem.CreateF(f, svmtReal));
end;

procedure DRandomB(Stack:PStack); cdecl;
var
  f:double;
begin
  f := Random(TSVMMem(Stack^.popv).GetW);
  Stack^.push(TSVMMem.CreateF(f, svmtReal));
end;

procedure DTickCnt(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.CreateFW(GetTickCount64));
end;

{EXPORTS DB}
exports DINTTOSTR           name 'INTTOSTR';
exports DFLOATTOSTR         name 'FLOATTOSTR';
exports DSTRTOINT           name 'STRTOINT';
exports DSTRTOFLOAT         name 'STRTOFLOAT';
exports DHALT               name 'HALT';
exports DSLEEP              name 'SLEEP';
exports DSTRUPPER           name 'STRUPPER';
exports DSTRLOWER           name 'STRLOWER';
exports DNOW                name 'CURRENTDATETIME';
exports DRANDOMIZE          name 'RANDOMIZE';
exports DRANDOM             name 'RANDOM';
exports DRANDOMB            name 'RANDOMB';
exports DTICKCNT            name 'TICKCNT';

begin
end.
