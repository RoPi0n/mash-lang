library DGraph;

uses SysUtils,Classes,Graph;

{$I ..\crlib.h}

{FUNCTIONS}
procedure _ARC(Stack:PStack); cdecl;
begin
Arc(Stack^.pop,
    Stack^.pop,
    Stack^.pop,
    Stack^.pop,
    Stack^.pop);
end;

procedure _BAR(Stack:PStack); cdecl;
begin
Bar(Stack^.pop,
    Stack^.pop,
    Stack^.pop,
    Stack^.pop);
end;

procedure _BAR3d(Stack:PStack); cdecl;
begin
Bar3d(Stack^.pop,
      Stack^.pop,
      Stack^.pop,
      Stack^.pop,
	  Stack^.pop,
	  Stack^.pop);
end;

procedure _ClearDevice(Stack:PStack); cdecl;
begin
 ClearDevice;
end;

procedure _CloseGraph(Stack:PStack); cdecl;
begin
 CloseGraph;
end;

procedure _DetectGraph(Stack:PStack); cdecl;
var a,b:smallint;
begin
 DetectGraph(a,b);
 Stack^.push(b);
 Stack^.push(a);
end;

procedure _DrawPoly(Stack:PStack); cdecl;
var a,b:integer;
begin
 a:=Stack^.pop;
 b:=Stack^.pop;
 DrawPoly(a,b);
end;

procedure _Ellipse(Stack:PStack); cdecl;
begin
 Ellipse(Stack^.pop,
      Stack^.pop,
      Stack^.pop,
      Stack^.pop,
	  Stack^.pop,
	  Stack^.pop);
end;

procedure _FillEllipse(Stack:PStack); cdecl;
begin
 FillEllipse(Stack^.pop,
      Stack^.pop,
      Stack^.pop,
      Stack^.pop);
end;

procedure _FillPoly(Stack:PStack); cdecl;
var a,b:integer;
begin
 a:=Stack^.pop;
 b:=Stack^.pop;
 FillPoly(a,b);
end;

procedure _FloodFill(Stack:PStack); cdecl;
begin
 FloodFill(Stack^.pop,
           Stack^.pop,
           Stack^.pop);
end;

procedure _GetArcCoords(Stack:PStack); cdecl;
var actpe:ArcCoordsType;
begin
 GetArcCoords(actpe);
 Stack^.push(actpe.yend);
 Stack^.push(actpe.xend);
 Stack^.push(actpe.ystart);
 Stack^.push(actpe.xstart);
 Stack^.push(actpe.y);
 Stack^.push(actpe.x);
end;

procedure _GetAspectRatio(Stack:PStack); cdecl;
var a,b:word;
begin
 GetAspectRatio(a,b);
 Stack^.push(b);
 Stack^.push(a);
end;

procedure _GetColor(Stack:PStack); cdecl;
begin
 Stack^.push(GetColor);
end;

procedure _GetDirectVideo(Stack:PStack); cdecl;
begin
 Stack^.push(GetDirectVideo);
end;

procedure _GetDriverName(Stack:PStack); cdecl;
begin
 Stack^.push('"'+GetDriverName+'"');
end;

procedure _GetFillPattern(Stack:PStack); cdecl;
var tpe:FillPatternType;
begin
 GetFillPattern(tpe);
 Stack^.push(tpe[8]);
 Stack^.push(tpe[7]);
 Stack^.push(tpe[6]);
 Stack^.push(tpe[5]);
 Stack^.push(tpe[4]);
 Stack^.push(tpe[3]);
 Stack^.push(tpe[2]);
 Stack^.push(tpe[1]);
end;

procedure _GetFillSettings(Stack:PStack); cdecl;
var tpe:FillSettingsType;
begin
 GetFillSettings(tpe);
 Stack^.push(tpe.color);
 Stack^.push(tpe.pattern);
end;

procedure _GetGraphMode(Stack:PStack); cdecl;
begin
 Stack^.push(GetGraphMode);
end;

procedure _GetLineSettings(Stack:PStack); cdecl;
var tpe:LineSettingsType;
begin
 GetLineSettings(tpe);
 Stack^.push(tpe.thickness);
 Stack^.push(tpe.pattern);
 Stack^.push(tpe.linestyle);
end;

procedure _GetMaxColor(Stack:PStack); cdecl;
begin
 Stack^.push(GetMaxColor);
end;

procedure _GetMaxMode(Stack:PStack); cdecl;
begin
 Stack^.push(GetMaxMode);
end;

procedure _GetMaxX(Stack:PStack); cdecl;
begin
 Stack^.push(GetMaxX);
end;

procedure _GetMaxY(Stack:PStack); cdecl;
begin
 Stack^.push(GetMaxY);
end;

procedure _GetModeName(Stack:PStack); cdecl;
begin
 Stack^.push(GetModeName(Stack^.pop));
end;

procedure _GetModeRange(Stack:PStack); cdecl;
var a,b:smallint;
begin
 GetModeRange(Stack^.pop,a,b);
 Stack^.push(b);
 Stack^.push(a);
end;

procedure _GetPaletteSize(Stack:PStack); cdecl;
begin
 Stack^.push(GetPaletteSize);
end;

procedure _GetTextSettings(Stack:PStack); cdecl;
var tpe:TextSettingsType;
begin
 GetTextSettings(tpe);
 Stack^.push(tpe.vert);
 Stack^.push(tpe.horiz);
 Stack^.push(tpe.charsize);
 Stack^.push(tpe.direction);
 Stack^.push(tpe.font);
end;

procedure _GetViewSettings(Stack:PStack); cdecl;
var tpe:ViewPortType;
begin
 GetViewSettings(tpe);
 Stack^.push(tpe.Clip);
 Stack^.push(tpe.y2);
 Stack^.push(tpe.x2);
 Stack^.push(tpe.y1);
 Stack^.push(tpe.x1);
end;

procedure _GetX(Stack:PStack); cdecl;
begin
 Stack^.push(GetX);
end;

procedure _GetY(Stack:PStack); cdecl;
begin
 Stack^.push(GetY);
end;

procedure _GraphDefaults(Stack:PStack); cdecl;
begin
 GraphDefaults;
end;

procedure _GraphErrorMsg(Stack:PStack); cdecl;
begin
 Stack^.push('"'+GraphErrorMsg(Stack^.pop)+'"');
end;

procedure _GraphResult(Stack:PStack); cdecl;
begin
 Stack^.push(GraphResult);
end;

procedure _InitGraph(Stack:PStack); cdecl;
var a,b:smallint;
begin
 a:=Stack^.pop;
 b:=Stack^.pop;
 InitGraph(a,b,ExtractStr(Stack^.pop));
end;

procedure _InstallUserDriver(Stack:PStack); cdecl;
begin
 Stack^.push(InstallUserDriver(ExtractStr(Stack^.pop),nil));
end;

procedure _InstallUserFont(Stack:PStack); cdecl;
begin
 Stack^.push(InstallUserFont(ExtractStr(Stack^.pop)));
end;

procedure _LineRel(Stack:PStack); cdecl;
begin
 LineRel(Stack^.pop,Stack^.pop);
end;

procedure _LineTo(Stack:PStack); cdecl;
begin
 LineTo(Stack^.pop,Stack^.pop);
end;

procedure _MoveRel(Stack:PStack); cdecl;
begin
 MoveRel(Stack^.pop,Stack^.pop);
end;

procedure _MoveTo(Stack:PStack); cdecl;
begin
 MoveTo(Stack^.pop,Stack^.pop);
end;

procedure _OutText(Stack:PStack); cdecl;
begin
 OutText(ExtractStr(Stack^.pop));
end;

procedure _PieSlice(Stack:PStack); cdecl;
begin
 PieSlice(Stack^.pop,Stack^.pop,Stack^.pop,Stack^.pop,Stack^.pop);
end;

procedure _Rectangle(Stack:PStack); cdecl;
begin
 Rectangle(Stack^.pop,Stack^.pop,Stack^.pop,Stack^.pop);
end;

procedure _RestoreCrtMode(Stack:PStack); cdecl;
begin
 RestoreCrtMode;
end;

procedure _Sector(Stack:PStack); cdecl;
begin
 Sector(Stack^.pop,Stack^.pop,Stack^.pop,Stack^.pop,Stack^.pop,Stack^.pop);
end;

procedure _SetAspectRatio(Stack:PStack); cdecl;
begin
 SetAspectRatio(Stack^.pop,Stack^.pop);
end;

procedure _SetColor(Stack:PStack); cdecl;
begin
 SetColor(Stack^.pop);
end;

procedure _SetDirectVideo(Stack:PStack); cdecl;
begin
 SetDirectVideo(Stack^.pop);
end;

procedure _SetFillPattern(Stack:PStack); cdecl;
var arr:FillPatternType;
begin
 arr[1]:=Stack^.pop;
 arr[2]:=Stack^.pop;
 arr[3]:=Stack^.pop;
 arr[4]:=Stack^.pop;
 arr[5]:=Stack^.pop;
 arr[6]:=Stack^.pop;
 arr[7]:=Stack^.pop;
 arr[8]:=Stack^.pop;
 SetFillPattern(
 arr,
 Stack^.pop);
end;

procedure _SetFillStyle(Stack:PStack); cdecl;
begin
 SetFillStyle(Stack^.pop,Stack^.pop);
end;

procedure _SetGraphMode(Stack:PStack); cdecl;
begin
 SetGraphMode(Stack^.pop);
end;

procedure _SetLineStyle(Stack:PStack); cdecl;
begin
 SetLineStyle(Stack^.pop,Stack^.pop,Stack^.pop);
end;

procedure _SetPalette(Stack:PStack); cdecl;
begin
 SetPalette(Stack^.pop,Stack^.pop);
end;

procedure _SetTextJustify(Stack:PStack); cdecl;
begin
 SetTextJustify(Stack^.pop,Stack^.pop);
end;

procedure _SetTextStyle(Stack:PStack); cdecl;
begin
 SetTextStyle(Stack^.pop,Stack^.pop,Stack^.pop);
end;

procedure _SetUserCharSize(Stack:PStack); cdecl;
begin
 SetUserCharSize(Stack^.pop,Stack^.pop,Stack^.pop,Stack^.pop);
end;

procedure _SetViewPort(Stack:PStack); cdecl;
begin
 SetViewPort(Stack^.pop,Stack^.pop,Stack^.pop,Stack^.pop,Stack^.pop);
end;

procedure _SetWriteMode(Stack:PStack); cdecl;
begin
 SetWriteMode(Stack^.pop);
end;

procedure _TextHeight(Stack:PStack); cdecl;
begin
 Stack^.push(TextHeight(ExtractStr(Stack^.pop)));
end;

procedure _TextWidth(Stack:PStack); cdecl;
begin
 Stack^.push(TextHeight(ExtractStr(Stack^.pop)));
end;
{EXPORTS DB}
exports _Arc  name 'ARC';
exports _Bar  name 'BAR';
exports _Bar3D  name 'BAR3D';
exports _ClearDevice  name 'CLEARDEVICE';
exports _Closegraph  name 'CLOSEGRAPH';
exports _DetectGraph  name 'DETECTGRAPH';
exports _DrawPoly  name 'DRAWPOLY';
exports _Ellipse  name 'ELLIPSE';
exports _FillEllipse  name 'FILLELLIPSE';
exports _FillPoly  name 'FILLPOLY';
exports _FloodFill  name 'FLOODFILL';
exports _GetArcCoords  name 'GETARCCOORDS';
exports _GetAspectRatio  name 'GETASPECTRATIO';
exports _GetColor  name 'GETCOLOR';
exports _GetDirectVideo  name 'GETDIRECTVIDEO';
exports _GetDriverName  name 'GETDRIVERNAME';
exports _GetFillPattern  name 'GETFILLPATTERN';
exports _GetFillSettings  name 'GETFILLSETTINGS';
exports _GetGraphMode  name 'GETGRAPHMODE';
exports _GetLineSettings  name 'GETLINESETTINGS';
exports _GetMaxColor  name 'GETMAXCOLOR';
exports _GetMaxMode  name 'GETMAXMODE';
exports _GetMaxX  name 'GETMAXX';
exports _GetMaxY  name 'GETMAXY';
exports _GetModeName  name 'GETMODENAME';
exports _GetModeRange  name 'GETMODERANGE';
exports _GetPaletteSize  name 'GETPALETTESIZE';
exports _GetTextSettings  name 'GETTEXTSETTINGS';
exports _GetViewSettings  name 'GETVIEWSETTINGS';
exports _GetX  name 'GETX';
exports _GetY  name 'GETY';
exports _GraphDefaults  name 'GRAPHDEFAULTS';
exports _GraphErrorMsg  name 'GRAPHERRORMSG';
exports _GraphResult  name 'GRAPHRESULT';
exports _InitGraph  name 'INITGRAPH';
exports _InstallUserDriver  name 'INSTALLUSERDRIVER';
exports _InstallUserFont  name 'INSTALLUSERFONT';
exports _LineRel  name 'LINEREL';
exports _LineTo  name 'LINETO';
exports _MoveRel  name 'MOVEREL';
exports _MoveTo  name 'MOVETO';
exports _OutText  name 'OUTTEXT';
exports _PieSlice  name 'PIESLICE';
exports _Rectangle  name 'RECTANGLE';
exports _RestoreCrtMode  name 'RESTORECRTMODE';
exports _Sector  name 'SECTOR';
exports _SetAspectRatio  name 'SETASPECTRATIO';
exports _SetColor  name 'SETCOLOR';
exports _SetDirectVideo  name 'SETDIRECTVIDEO';
exports _SetFillPattern  name 'SETFILLPATTERN';
exports _SetFillStyle  name 'SETFILLSTYLE';
exports _SetGraphMode  name 'SETGRAPHMODE';
exports _SetLineStyle  name 'SETLINESTYLE';
exports _SetPalette  name 'SETPALETTE';
exports _SetTextJustify  name 'SETTEXTJUSTIFY';
exports _SetTextStyle  name 'SETTEXTSTYLE';
exports _SetUserCharSize  name 'SETUSERCHARSIZE';
exports _SetViewPort  name 'SETVIEWPORT';
exports _SetWriteMode  name 'SETWRITEMODE';
exports _TextHeight  name 'TEXTHEIGHT';
exports _TextWidth  name 'TEXTWIDTH';


{
  -getDefaultPalete
  -getPalete
  -queryadapterinfo
  -RegisterBGIDriver
  -RegisterBGIFont
}

begin
end.
