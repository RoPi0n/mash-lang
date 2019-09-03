library svmcrt;
{$mode objfpc}{$H+}

uses
  crt;

{$I '..\libapi.inc'}

procedure _CursorBig(pctx: pointer); stdcall;
begin
  crt.cursorbig;
end;

procedure _CursorOff(pctx: pointer); stdcall;
begin
  crt.cursoroff;
end;

procedure _CursorOn(pctx: pointer); stdcall;
begin
  crt.cursoron;
end;

procedure _DelLine(pctx: pointer); stdcall;
begin
  crt.DelLine;
end;

procedure _GotoXY32(pctx: pointer); stdcall;
var
  x: word;
begin
  x := __Next_Word(pctx);
  crt.GotoXY32(x, __Next_Word(pctx));
end;

procedure _InsLine(pctx: pointer); stdcall;
begin
  crt.InsLine;
end;

procedure _KeyPressed(pctx: pointer); stdcall;
begin
  __Return_Bool(pctx, crt.KeyPressed);
end;

procedure _ReadKey(pctx: pointer); stdcall;
var
  s: string;
begin
 s := '';
 try
   s := ReadKey;
 finally
   __Return_String(pctx, @s);
 end;
end;

procedure _Sound(pctx: pointer); stdcall;
begin
  crt.Sound(__Next_Word(pctx));
end;

procedure _WhereX32(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, crt.WhereX32);
end;

procedure _WhereY32(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, crt.WhereY32);
end;

procedure _Window32(pctx: pointer); stdcall;
begin
  crt.Window32(__Next_Word(pctx),
               __Next_Word(pctx),
	       __Next_Word(pctx),
	       __Next_Word(pctx));
end;

procedure _ClrEol(pctx: pointer); stdcall;
begin
  crt.ClrEol;
end;

procedure _ClrScr(pctx: pointer); stdcall;
begin
  crt.ClrScr;
end;

////////////////////////////////////////////////
procedure _GetDirectVideo(pctx: pointer); stdcall;
begin
  __Return_Bool(pctx, DirectVideo);
end;

procedure _GetLastMode(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, LastMode);
end;

procedure _GetTextAttr(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, TextAttr);
end;

procedure _GetWindMax(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, WindMax);
end;

procedure _GetWindMaxX(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, WindMaxX);
end;

procedure _GetWindMaxY(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, WindMaxY);
end;

procedure _GetWindMin(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, WindMin);
end;

procedure _GetWindMinX(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, WindMinX);
end;

procedure _GetWindMinY(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, WindMinY);
end;

procedure _GetCheckBreak(pctx: pointer); stdcall;
begin
  __Return_Bool(pctx, CheckBreak);
end;

procedure _GetCheckEOF(pctx: pointer); stdcall;
begin
  __Return_Bool(pctx, CheckEOF);
end;

procedure _GetCheckSnow(pctx: pointer); stdcall;
begin
  __Return_Bool(pctx, CheckSnow);
end;

procedure _PRINT(pctx: pointer); stdcall;
var
  s: string;
begin
  case TVMValueType(__Next_Type(pctx)) of
    vmtWord: write(__Next_Word(pctx));
    else
      begin
        s := '';
        __Next_String(pctx, @s);
        write(s);
      end;
  end;
end;

procedure _PRINTLN(pctx: pointer); stdcall;
var
  s: string;
begin
  case TVMValueType(__Next_Type(pctx)) of
    vmtWord: writeln(__Next_Word(pctx));
    else
      begin
        s := '';
        __Next_String(pctx, @s);
        writeln(s);
      end;
  end;
end;

procedure _SETTEXTATTR(pctx: pointer); stdcall;
begin
  crt.TextAttr := __Next_Word(pctx);
end;

procedure _INPUT(pctx: pointer); stdcall;
var
  s:string;
begin
  Read(s);
  __Return_String(pctx, @s);
end;

procedure _INPUTLN(pctx: pointer); stdcall;
var
  s:string;
begin
  ReadLn(s);
  __Return_String(pctx, @s);
end;

procedure _SETTEXTCOLOR(pctx: pointer); stdcall;
begin
  TextColor(__Next_Word(pctx));
end;

procedure _SETTEXTBACKGROUND(pctx: pointer); stdcall;
begin
  TextBackground(__Next_Word(pctx));
end;

exports _GetDirectVideo name 'GETDIRECTVIDEO';
exports _GetLastMode name 'GETLASTMODE';
exports _GetTextAttr name 'GETTEXTATTR';
exports _GetWindMax name 'GETWINDMAX';
exports _GetWindMaxX name 'GETWINDMAXX';
exports _GetWindMaxY name 'GETWINDMAXY';
exports _GetWindMin name 'GETWINDMIN';
exports _GetWindMinX name 'GETWINDMINX';
exports _GetWindMinY name 'GETWINDMINY';
exports _GetCheckBreak name 'GETCHECKBREAK';
exports _GetCheckEOF name 'GETCHECKEOF';
exports _GetCheckSnow name 'GETCHECKSNOW';

exports  _CursorBig name 'CURSORBIG';
exports  _CursorOff name 'CURSOROFF';
exports  _CursorOn name 'CURSORON';
exports  _DelLine name 'DELLINE';
exports  _GotoXY32 name 'GOTOXY32';
exports  _InsLine name 'INSLINE';
exports  _KeyPressed name 'KEYPRESSED';
exports  _ReadKey name 'READKEY';
exports  _Sound name 'SOUND';
exports  _WhereX32 name 'WHEREX32';
exports  _WhereY32 name 'WHEREY32';
exports  _Window32 name 'WINDOW32';
exports  _ClrEol name 'CLREOL';
exports  _ClrScr name 'CLRSCR';

exports  _SetTextAttr name 'SETTEXTATTR';

exports  _Print name 'PRINT';
exports  _Println name 'PRINTLN';
exports  _Input name 'INPUT';
exports  _Inputln name 'INPUTLN';

exports  _SETTEXTCOLOR name 'SETTEXTCOLOR';
exports  _SETTEXTBACKGROUND name 'SETTEXTBACKGROUND';

//HIGHVIDEO
//LOWVIDEO
//NORMVIDEO
//WINDOW
//TEXTBACKGROUND
//TEXTCOLOR
//WHEREX
//GotoXY
begin
end.

