library DGraph;

{$mode objfpc}{$H+}

uses SysUtils, Graph;

{$I '..\svm.inc'}

{FUNCTIONS}
procedure _ARC(pctx: Pointer); stdcall;
begin
Arc(__Next_Int(pctx),
    __Next_Int(pctx),
    __Next_Int(pctx),
    __Next_Int(pctx),
    __Next_Int(pctx));
end;

procedure _BAR(pctx: Pointer); stdcall;
begin
Bar(__Next_Int(pctx),
    __Next_Int(pctx),
    __Next_Int(pctx),
    __Next_Int(pctx));
end;

procedure _BAR3d(pctx: Pointer); stdcall;
begin
Bar3d(__Next_Int(pctx),
      __Next_Int(pctx),
      __Next_Int(pctx),
      __Next_Int(pctx),
      __Next_Int(pctx),
      __Next_Bool(pctx));
end;

procedure _ClearDevice(pctx: Pointer); stdcall;
begin
 ClearDevice;
end;

procedure _CloseGraph(pctx: Pointer); stdcall;
begin
 CloseGraph;
end;

procedure _DetectGraph(pctx: Pointer); stdcall;
var a,b:smallint;
begin
 DetectGraph(a,b);
 __Return_Int(pctx, b);
 __Return_Int(pctx, a);
end;

procedure _DrawPoly(pctx: Pointer); stdcall;
var a,b:integer;
begin
 a:=__Next_Int(pctx);
 b:=__Next_Int(pctx);
 DrawPoly(a,b);
end;

procedure _Ellipse(pctx: Pointer); stdcall;
begin
 Ellipse(__Next_Int(pctx),
      __Next_Int(pctx),
      __Next_Int(pctx),
      __Next_Int(pctx),
      __Next_Int(pctx),
      __Next_Int(pctx));
end;

procedure _FillEllipse(pctx: Pointer); stdcall;
begin
 FillEllipse(__Next_Int(pctx),
      __Next_Int(pctx),
      __Next_Int(pctx),
      __Next_Int(pctx));
end;

procedure _FillPoly(pctx: Pointer); stdcall;
var a,b:integer;
begin
 a:=__Next_Int(pctx);
 b:=__Next_Int(pctx);
 FillPoly(a,b);
end;

procedure _FloodFill(pctx: Pointer); stdcall;
begin
 FloodFill(__Next_Int(pctx),
           __Next_Int(pctx),
           __Next_Int(pctx));
end;

procedure _GetArcCoords(pctx: Pointer); stdcall;
var actpe:ArcCoordsType;
begin
 GetArcCoords(actpe);
 __Return_Int(pctx, actpe.yend);
 __Return_Int(pctx, actpe.xend);
 __Return_Int(pctx, actpe.ystart);
 __Return_Int(pctx, actpe.xstart);
 __Return_Int(pctx, actpe.y);
 __Return_Int(pctx, actpe.x);
end;

procedure _GetAspectRatio(pctx: Pointer); stdcall;
var a,b:word;
begin
 GetAspectRatio(a,b);
 __Return_Word(pctx, b);
 __Return_Word(pctx, a);
end;

procedure _GetColor(pctx: Pointer); stdcall;
begin
 __Return_Word(pctx, GetColor);
end;

procedure _GetDirectVideo(pctx: Pointer); stdcall;
begin
 __Return_Bool(pctx, GetDirectVideo);
end;

procedure _GetDriverName(pctx: Pointer); stdcall;
begin
 __Return_String(pctx, GetDriverName);
end;

procedure _GetFillPattern(pctx: Pointer); stdcall;
var tpe:FillPatternType;
begin
 GetFillPattern(tpe);
 __Return_Word(pctx, tpe[8]);
 __Return_Word(pctx, tpe[7]);
 __Return_Word(pctx, tpe[6]);
 __Return_Word(pctx, tpe[5]);
 __Return_Word(pctx, tpe[4]);
 __Return_Word(pctx, tpe[3]);
 __Return_Word(pctx, tpe[2]);
 __Return_Word(pctx, tpe[1]);
end;

procedure _GetFillSettings(pctx: Pointer); stdcall;
var tpe:FillSettingsType;
begin
 GetFillSettings(tpe);
 __Return_Word(pctx, tpe.color);
 __Return_Word(pctx, tpe.pattern);
end;

procedure _GetGraphMode(pctx: Pointer); stdcall;
begin
 __Return_Int(pctx, GetGraphMode);
end;

procedure _GetLineSettings(pctx: Pointer); stdcall;
var tpe:LineSettingsType;
begin
 GetLineSettings(tpe);
 __Return_Word(pctx, tpe.thickness);
 __Return_Word(pctx, tpe.pattern);
 __Return_Word(pctx, tpe.linestyle);
end;

procedure _GetMaxColor(pctx: Pointer); stdcall;
begin
 __Return_Word(pctx, GetMaxColor);
end;

procedure _GetMaxMode(pctx: Pointer); stdcall;
begin
 __Return_Int(pctx, GetMaxMode);
end;

procedure _GetMaxX(pctx: Pointer); stdcall;
begin
 __Return_Int(pctx, GetMaxX);
end;

procedure _GetMaxY(pctx: Pointer); stdcall;
begin
 __Return_Int(pctx, GetMaxY);
end;

procedure _GetModeName(pctx: Pointer); stdcall;
begin
 __Return_String(pctx, GetModeName(__Next_Int(pctx)));
end;

procedure _GetModeRange(pctx: Pointer); stdcall;
var a,b:smallint;
begin
 GetModeRange(__Next_Int(pctx),a,b);
 __Return_Int(pctx, b);
 __Return_Int(pctx, a);
end;

procedure _GetPaletteSize(pctx: Pointer); stdcall;
begin
 __Return_Int(pctx, GetPaletteSize);
end;

procedure _GetTextSettings(pctx: Pointer); stdcall;
var tpe:TextSettingsType;
begin
 GetTextSettings(tpe);
 __Return_Word(pctx, tpe.vert);
 __Return_Word(pctx, tpe.horiz);
 __Return_Word(pctx, tpe.charsize);
 __Return_Word(pctx, tpe.direction);
 __Return_Word(pctx, tpe.font);
end;

procedure _GetViewSettings(pctx: Pointer); stdcall;
var tpe:ViewPortType;
begin
 GetViewSettings(tpe);
 __Return_Bool(pctx, tpe.Clip);
 __Return_Int(pctx, tpe.y2);
 __Return_Int(pctx, tpe.x2);
 __Return_Int(pctx, tpe.y1);
 __Return_Int(pctx, tpe.x1);
end;

procedure _GetX(pctx: Pointer); stdcall;
begin
 __Return_Int(pctx, GetX);
end;

procedure _GetY(pctx: Pointer); stdcall;
begin
 __Return_Int(pctx, GetY);
end;

procedure _GraphDefaults(pctx: Pointer); stdcall;
begin
 GraphDefaults;
end;

procedure _GraphErrorMsg(pctx: Pointer); stdcall;
begin
 __Return_String(pctx, GraphErrorMsg(__Next_Int(pctx)));
end;

procedure _GraphResult(pctx: Pointer); stdcall;
begin
 __Return_Int(pctx, GraphResult);
end;

procedure _InitGraph(pctx: Pointer); stdcall;
var a,b:smallint;
begin
 a:=__Next_Int(pctx);
 b:=__Next_Int(pctx);
 InitGraph(a,b,__Next_String(pctx));
end;

procedure _InstallUserDriver(pctx: Pointer); stdcall;
begin
 __Return_Int(pctx, InstallUserDriver(__Next_String(pctx),nil));
end;

procedure _InstallUserFont(pctx: Pointer); stdcall;
begin
 __Return_Int(pctx, InstallUserFont(__Next_String(pctx)));
end;

procedure _LineRel(pctx: Pointer); stdcall;
begin
 LineRel(__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _LineTo(pctx: Pointer); stdcall;
begin
 LineTo(__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _MoveRel(pctx: Pointer); stdcall;
begin
 MoveRel(__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _MoveTo(pctx: Pointer); stdcall;
begin
 MoveTo(__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _OutText(pctx: Pointer); stdcall;
begin
 OutText(__Next_String(pctx));
end;

procedure _PieSlice(pctx: Pointer); stdcall;
begin
 PieSlice(__Next_Int(pctx),__Next_Int(pctx),__Next_Int(pctx),__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _Rectangle(pctx: Pointer); stdcall;
begin
 Rectangle(__Next_Int(pctx),__Next_Int(pctx),__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _RestoreCrtMode(pctx: Pointer); stdcall;
begin
 RestoreCrtMode;
end;

procedure _Sector(pctx: Pointer); stdcall;
begin
 Sector(__Next_Int(pctx),__Next_Int(pctx),__Next_Word(pctx),__Next_Word(pctx),__Next_Word(pctx),__Next_Word(pctx));
end;

procedure _SetAspectRatio(pctx: Pointer); stdcall;
begin
 SetAspectRatio(__Next_Word(pctx), __Next_Word(pctx));
end;

procedure _SetColor(pctx: Pointer); stdcall;
begin
 SetColor(__Next_Word(pctx));
end;

procedure _SetDirectVideo(pctx: Pointer); stdcall;
begin
 SetDirectVideo(__Next_Bool(pctx));
end;

procedure _SetFillPattern(pctx: Pointer); stdcall;
var arr:FillPatternType;
begin
 arr[1]:=__Next_Int(pctx);
 arr[2]:=__Next_Int(pctx);
 arr[3]:=__Next_Int(pctx);
 arr[4]:=__Next_Int(pctx);
 arr[5]:=__Next_Int(pctx);
 arr[6]:=__Next_Int(pctx);
 arr[7]:=__Next_Int(pctx);
 arr[8]:=__Next_Int(pctx);
 SetFillPattern(
 arr,
 __Next_Int(pctx));
end;

procedure _SetFillStyle(pctx: Pointer); stdcall;
begin
 SetFillStyle(__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _SetGraphMode(pctx: Pointer); stdcall;
begin
 SetGraphMode(__Next_Int(pctx));
end;

procedure _SetLineStyle(pctx: Pointer); stdcall;
begin
 SetLineStyle(__Next_Int(pctx),__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _SetPalette(pctx: Pointer); stdcall;
begin
 SetPalette(__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _SetTextJustify(pctx: Pointer); stdcall;
begin
 SetTextJustify(__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _SetTextStyle(pctx: Pointer); stdcall;
begin
 SetTextStyle(__Next_Int(pctx),__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _SetUserCharSize(pctx: Pointer); stdcall;
begin
 SetUserCharSize(__Next_Int(pctx),__Next_Int(pctx),__Next_Int(pctx),__Next_Int(pctx));
end;

procedure _SetViewPort(pctx: Pointer); stdcall;
begin
 SetViewPort(__Next_Int(pctx),__Next_Int(pctx),__Next_Int(pctx),__Next_Int(pctx),__Next_Bool(pctx));
end;

procedure _SetWriteMode(pctx: Pointer); stdcall;
begin
 SetWriteMode(__Next_Int(pctx));
end;

procedure _TextHeight(pctx: Pointer); stdcall;
begin
 __Return_Word(pctx, TextHeight(__Next_String(pctx)));
end;

procedure _TextWidth(pctx: Pointer); stdcall;
begin
 __Return_Word(pctx, TextHeight(__Next_String(pctx)));
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
