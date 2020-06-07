library bf;

{$mode objfpc}{$H+}
{$define FPC_USE_WIN64_SEH}
uses
  SysUtils;

{$I '..\svm.inc'}

procedure DHalt(pctx: pointer); stdcall;
begin
  halt;
end;

procedure DGetSystemSlash(pctx: pointer); stdcall;
var
  s: string;
begin
  s := '/';

  {$IfDef Windows}
  s := '\';
  {$EndIf}

  {$IfDef DOS}
  s := '\';
  {$EndIf}

  __Return_String(pctx, @s);
end;

procedure DStrToInt(pctx: pointer); stdcall;
var
  s: string;
begin
  s := '';
  __Next_String(pctx, @s);
  __Return_Float(pctx, StrToInt64(s));
end;
procedure DStrToFloat(pctx: pointer); stdcall;
var
  s: string;
begin
  s := '';
  __Next_String(pctx, @s);
  __Return_Float(pctx, StrToFloat(s));
end;

procedure DStrUpper(pctx: pointer); stdcall;
var
  s: string;
begin
  s := '';
  __Next_String(pctx, @s);
  s := UpperCase(s);
  __Return_String(pctx, @s);
end;

procedure DStrLower(pctx: pointer); stdcall;
var
  s: string;
begin
  s := '';
  __Next_String(pctx, @s);
  s := LowerCase(s);
  __Return_String(pctx, @s);
end;

procedure DIntToStr(pctx: pointer); stdcall;
var
  s: string;
begin
  s := IntToStr(__Next_Int(pctx));
  __Return_String(pctx, @s);
end;

procedure DFloatToStr(pctx: pointer); stdcall;
var
  s: string;
begin
  s := FloatToStr(__Next_Float(pctx));
  __Return_String(pctx, @s);
end;

procedure DSleep(pctx: pointer); stdcall;
begin
  sleep(__Next_Word(pctx));
end;

procedure DNow(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, Now);
end;

procedure DRandomize(pctx: pointer); stdcall;
begin
  Randomize;
end;

procedure DRandom(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, Random);
end;

procedure DRandomB(pctx: pointer); stdcall;
begin
  __Return_Float(pctx, Random(__Next_Int(pctx)));
end;

procedure DTickCnt(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, GetTickCount64);
end;

procedure DRaise(pctx: pointer); stdcall;
begin
  //raise Exception.Create('Raised external exception.');
  try
    raise Exception.Create('Test');
  except
    on E: Exception do
      writeln('Catched! ', E.Message);
  end;
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
exports DGetSystemSlash     name 'GETSYSTEMSLASH';
exports DRaise              name 'RAISE';

begin
end.
