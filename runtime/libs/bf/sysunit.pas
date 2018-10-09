library SysUNIT;

uses SysUtils,Classes;

{$I ..\adp.inc}

{FUNCTIONS}
procedure DHalt(Stack:PStack); cdecl;
begin
 halt;
end;

procedure DStrToInt(Stack:PStack); cdecl;
var s:string;
begin
 s:=PMem(Stack^.popv)^;
 Stack^.push(new_svmval(strtoint(s)));
end;

procedure DStrToFloat(Stack:PStack); cdecl;
var s:string;
begin
 s:=PMem(Stack^.popv)^;
 Stack^.push(new_svmval(strtofloat(s)));
end;

procedure DCHRUpper(Stack:PStack); cdecl;
var s:char;
begin
 s:=PMem(Stack^.popv)^;
 Stack^.push(new_svmval(upcase(s)));
end;

procedure DChrLower(Stack:PStack); cdecl;
var s:char;
begin
 s:=PMem(Stack^.popv)^;
 Stack^.push(new_svmval(ord(s)));
end;

procedure DStrUpper(Stack:PStack); cdecl;
var s:string;
begin
 s:=PMem(Stack^.popv)^;
 Stack^.push(new_svmval(uppercase(s)));
end;

procedure DStrLower(Stack:PStack); cdecl;
var s:string;
begin
 s:=PMem(Stack^.popv)^;
 Stack^.push(new_svmval(lowercase(s)));
end;

procedure DIntToStr(Stack:PStack); cdecl;
var s:longint;
begin
 s:=PMem(Stack^.popv)^;
 Stack^.push(new_svmval(inttostr(s)));
end;

procedure DFloatToStr(Stack:PStack); cdecl;
var s:double;
begin
 s:=PMem(Stack^.popv)^;
 Stack^.push(new_svmval(floattostr(s)));
end;

procedure DSleep(Stack:PStack); cdecl;
begin
 sleep(PMem(Stack^.popv)^);
end;

//DateTime
procedure DNow(Stack:PStack); cdecl;
begin
 Stack^.push(new_svmval(now));
end;

procedure DRandomize(Stack:PStack); cdecl;
begin
 Randomize;
end;

procedure DRandom(Stack:PStack); cdecl;
begin
 Stack^.push(new_svmval(Random));
end;

procedure DRandomB(Stack:PStack); cdecl;
begin
 Stack^.push(new_svmval(Random(PMem(Stack^.popv)^)));
end;

procedure DTickCnt(Stack:PStack); cdecl;
begin
 Stack^.push(new_svmval(GetTickCount64));
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
exports DCHRUPPER           name 'CHRUPPER';
exports DCHRLOWER           name 'CHRLOWER';
exports DNOW                name 'CURRENTDATETIME';
exports DRANDOMIZE          name 'RANDOMIZE';
exports DRANDOM             name 'RANDOM';
exports DRANDOMB            name 'RANDOMB';
exports DTICKCNT            name 'TICKCNT';

begin
end.
