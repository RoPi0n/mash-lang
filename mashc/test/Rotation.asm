import crt_cursorbig "crt.lib" "CURSORBIG"
import crt_cursoroff "crt.lib" "CURSOROFF"
import crt_cursoron "crt.lib" "CURSORON"
import crt_delline "crt.lib" "DELLINE"
import crt_gotoxy "crt.lib" "GOTOXY32"
import crt_insline "crt.lib" "INSLINE"
import crt_keypressed "crt.lib" "KEYPRESSED"
import crt_readkey "crt.lib" "READKEY"
import crt_sound "crt.lib" "SOUND"
import crt_wherex32 "crt.lib" "WHEREX32"
import crt_wherey32 "crt.lib" "WHEREY32"
import crt_window32 "crt.lib" "WINDOW32"
import crt_clreol "crt.lib" "CLREOL"
import crt_clrscr "crt.lib" "CLRSCR"
import crt_getdirectvideo "crt.lib" "GETDIRECTVIDEO"
import crt_getlastmode "crt.lib" "GETLASTMODE"
import crt_settextattr "crt.lib" "SETTEXTATTR"
import crt_gettextattr "crt.lib" "GETTEXTATTR"
import crt_getwindmax "crt.lib" "GETWINDMAX"
import crt_getwindmaxx "crt.lib" "GETWINDMAXX"
import crt_getwindmaxy "crt.lib" "GETWINDMAXY"
import crt_getwindmin "crt.lib" "GETWINDMIN"
import crt_getwindminx "crt.lib" "GETWINDMINX"
import crt_getwindminy "crt.lib" "GETWINDMINY"
import crt_getcheckbreak "crt.lib" "GETCHECKBREAK"
import crt_getcheckeof "crt.lib" "GETCHECKEOF"
import crt_getchecksnow "crt.lib" "GETCHECKSNOW"
import crt_textcolor "crt.lib" "SETTEXTCOLOR"
import crt_textbackground "crt.lib" "SETTEXTBACKGROUND"
import _print "crt.lib" "PRINT"
import _println "crt.lib" "PRINTLN"
import input "crt.lib" "INPUT"
import inputln "crt.lib" "INPUTLN"
import i2s "bf.lib" "INTTOSTR"
import f2s "bf.lib" "FLOATTOSTR"
import s2i "bf.lib" "STRTOINT"
import s2f "bf.lib" "STRTOFLOAT"
import halt "bf.lib" "HALT"
import sleep "bf.lib" "SLEEP"
import strupper "bf.lib" "STRUPPER"
import strlower "bf.lib" "STRLOWER"
import now "bf.lib" "CURRENTDATETIME"
import randomize "bf.lib" "RANDOMIZE"
import random "bf.lib" "RANDOM"
import randomto "bf.lib" "RANDOMB"
import tickcnt "bf.lib" "TICKCNT"
import getsystemslash "bf.lib" "GETSYSTEMSLASH"
import _sin "lmath.lib" "SIN"
import _cos "lmath.lib" "COS"
import _tg "lmath.lib" "TG"
import _ctg "lmath.lib" "CTG"
import _arcsin "lmath.lib" "ARCSIN"
import _arccos "lmath.lib" "ARCCOS"
import _arctg "lmath.lib" "ARCTG"
import _log10 "lmath.lib" "LOG10"
import _log2 "lmath.lib" "LOG2"
import _logn "lmath.lib" "LOGN"
import _lnxp1 "lmath.lib" "LNXP1"
import _exp "lmath.lib" "EXP"
import graph_arc "graph.lib" "ARC"
import graph_bar "graph.lib" "BAR"
import graph_bar3d "graph.lib" "BAR3D"
import graph_ellipse "graph.lib" "ELLIPSE"
import graph_fillellipse "graph.lib" "FILLELLIPSE"
import graph_detectgraph "graph.lib" "DETECTGRAPH"
import graph_lineto "graph.lib" "LINETO"
import graph_moveto "graph.lib" "MOVETO"
import graph_getfillpattern "graph.lib" "GETFILLPATTERN"
import graph_getfillsettings "graph.lib" "GETFILLSETTINGS"
import graph_getlinesettings "graph.lib" "GETLINESETTINGS"
import graph_floodfill "graph.lib" "FLOODFILL"
import graph_getarccoords "graph.lib" "GETARCCOORDS"
import graph_getaspectratio "graph.lib" "GETASPECTRATIO"
import graph_getmoderange "graph.lib" "GETMODERANGE"
import graph_gettextsettings "graph.lib" "GETTEXTSETTINGS"
import graph_getviewsettings "graph.lib" "GETVIEWSETTINGS"
import graph_graphdefaults "graph.lib" "GRAPHDEFAULTS"
import graph_grapherrormsg "graph.lib" "GRAPHERRORMSG"
import graph_graphresult "graph.lib" "GRAPHRESULT"
import graph_installuserdriver "graph.lib" "INSTALLUSERDRIVER"
import graph_installuserfont "graph.lib" "INSTALLUSERFONT"
import graph_linerel "graph.lib" "LINEREL"
import graph_moverel "graph.lib" "MOVEREL"
import graph_pieslice "graph.lib" "PIESLICE"
import graph_rectangle "graph.lib" "RECTANGLE"
import graph_restorecrtmode "graph.lib" "RESTORECRTMODE"
import graph_sector "graph.lib" "SECTOR"
import graph_setaspectratio "graph.lib" "SETASPECTRATIO"
import graph_setdirectvideo "graph.lib" "SETDIRECTVIDEO"
import graph_setfillpattern "graph.lib" "SETFILLPATTERN"
import graph_setgraphmode "graph.lib" "SETGRAPHMODE"
import graph_setlinestyle "graph.lib" "SETLINESTYLE"
import graph_setpalette "graph.lib" "SETPALETTE"
import graph_settextjustify "graph.lib" "SETTEXTJUSTIFY"
import graph_settextstyle "graph.lib" "SETTEXTSTYLE"
import graph_setusercharsize "graph.lib" "SETUSERCHARSIZE"
import graph_setviewport "graph.lib" "SETVIEWPORT"
import graph_setfillstyle "graph.lib" "SETFILLSTYLE"
import graph_fillpoly "graph.lib" "FILLPOLY"
import graph_cleardevice "graph.lib" "CLEARDEVICE"
import graph_closegraph "graph.lib" "CLOSEGRAPH"
import graph_drawpoly "graph.lib" "DRAWPOLY"
import graph_setcolor "graph.lib" "SETCOLOR"
import graph_getcolor "graph.lib" "GETCOLOR"
import graph_getdirectvideo "graph.lib" "GETDIRECTVIDEO"
import graph_getdrivername "graph.lib" "GETDRIVERNAME"
import graph_getmaxcolor "graph.lib" "GETMAXCOLOR"
import graph_getmaxmode "graph.lib" "GETMAXMODE"
import graph_getmaxx "graph.lib" "GETMAXX"
import graph_getmaxy "graph.lib" "GETMAXY"
import graph_getmodename "graph.lib" "GETMODENAME"
import graph_getgraphmode "graph.lib" "GETGRAPHMODE"
import graph_getpalettesize "graph.lib" "GETPALETTESIZE"
import graph_textheight "graph.lib" "TEXTHEIGHT"
import graph_textwidth "graph.lib" "TEXTWIDTH"
import graph_setwritemode "graph.lib" "SETWRITEMODE"
import graph_initgraph "graph.lib" "INITGRAPH"
import graph_getx "graph.lib" "GETX"
import graph_gety "graph.lib" "GETY"
import graph_outtext "graph.lib" "OUTTEXT"
word crt_bw40 0
word crt_co40 1
word crt_bw80 2
word crt_co80 3
word crt_mono 7
word crt_font8x8 256
word crt_black 0
word crt_blue 1
word crt_green 2
word crt_cyan 3
word crt_red 4
word crt_magenta 5
word crt_brown 6
word crt_lightgray 7
word crt_darkgray 8
word crt_lightblue 9
word crt_lightgreen 10
word crt_lightcyan 11
word crt_lightred 12
word crt_lightmagenta 13
word crt_yellow 14
word crt_white 15
word crt_blink 128
int mplot_defscale -1
str mplot_null "MPlot_NULL"
int true -1
word false 0
real m_pi 3.14159265358979
real m_e 2.71828182845904
word graph_black 0
word graph_blue 1
word graph_green 2
word graph_cyan 3
word graph_red 4
word graph_magenta 5
word graph_brown 6
word graph_lightgray 7
word graph_darkgray 8
word graph_lightblue 9
word graph_lightgreen 10
word graph_lightcyan 11
word graph_lightred 12
word graph_lightmagenta 13
word graph_yellow 14
word graph_white 15
word graph_solidln 0
word graph_dottedln 1
word graph_centerln 2
word graph_dashedln 3
word graph_userbitln 4
word graph_normwidth 1
word graph_thickwidth 3
word graph_defaultfont 0
word graph_triplexfont 1
word graph_smallfont 2
word graph_sansseriffont 3
word graph_gothicfont 4
word graph_scriptfont 5
word graph_simplefont 6
word graph_tscrfont 7
word graph_lcomfont 8
word graph_eurofont 9
word graph_boldfont 10
word graph_horizdir 0
word graph_vertdir 1
word graph_usercharsize 0
word graph_emptyfill 0
word graph_solidfill 1
word graph_linefill 2
word graph_ltslashfill 3
word graph_slashfill 4
word graph_bkslashfill 5
word graph_ltbkslashfill 6
word graph_hatchfill 7
word graph_xhatchfill 8
word graph_interleavefill 9
word graph_widedotfill 10
word graph_closedotfill 11
word graph_userfill 12
word graph_lefttext 0
word graph_centertext 1
word graph_righttext 2
word graph_bottomtext 0
word graph_toptext 2
word vtable__type 0
word vtable__x 1
word vtable__y 2
word vtable__z 3
word vtable__maxx 4
word vtable__maxy 5
word vtable__stepsx 6
word vtable__x0 7
word vtable__y0 8
word vtable__drawinginprocess 9
word vtable__sctype 10
word vtable__scscale 11
word vtable__classname 12
word vtable__message 13
word vtable__re 14
word vtable__im 15
word vtable__xstart 16
word vtable__ystart 17
word vtable__xend 18
word vtable__yend 19
word vtable__pattern 20
word vtable__color 21
word vtable__linestyle 22
word vtable__thickness 23
word vtable__normvideo 24
word vtable__wherex 25
word vtable__wherey 26
word vtable__pause 27
word vtable__cursorbig 28
word vtable__cursoroff 29
word vtable__cursoron 30
word vtable__delline 31
word vtable__gotoxy 32
word vtable__insline 33
word vtable__keypressed 34
word vtable__readkey 35
word vtable__sound 36
word vtable__window32 37
word vtable__clreol 38
word vtable__clrscr 39
word vtable__getdirectvideo 40
word vtable__getlastmode 41
word vtable__settextattr 42
word vtable__gettextattr 43
word vtable__getwindmax 44
word vtable__getwindmaxx 45
word vtable__getwindmaxy 46
word vtable__getwindmin 47
word vtable__getwindminx 48
word vtable__getwindminy 49
word vtable__getcheckbreak 50
word vtable__getcheckeof 51
word vtable__getchecksnow 52
word vtable__textcolor 53
word vtable__textbackground 54
word vtable__create 55
word vtable__set 56
word vtable__clone 57
word vtable__compare 58
word vtable__drawdecart 59
word vtable__drawpolar 60
word vtable__offsetx 61
word vtable__offsety 62
word vtable__nextpoint 63
word vtable__nextpolar 64
word vtable__breakspline 65
word vtable__finish 66
word vtable__next 67
word vtable__dot 68
word vtable__function 69
word vtable__draw 70
word vtable__push 71
word vtable__peek 72
word vtable__pop 73
word vtable__tostring 74
word vtable__compareto 75
word vtable__module 76
word vtable__angle 77
word vtable__conjugate 78
word vtable__unite 79
word vtable__uniteim 80
word vtable__uniteviaexp 81
word vtable__add 82
word vtable__sub 83
word vtable__mul 84
word vtable__div 85
word vtable__power 86
word vtable__ln 87
word vtable__logn 88
word vtable__sin 89
word vtable__cos 90
word vtable__tg 91
word vtable__ctg 92
word vtable__sec 93
word vtable__cosec 94
word vtable__arc 95
word vtable__bar 96
word vtable__bar3d 97
word vtable__ellipse 98
word vtable__fillellipse 99
word vtable__floodfill 100
word vtable__getarccoords 101
word vtable__getaspectratio 102
word vtable__getfillpattern 103
word vtable__getfillsettings 104
word vtable__getlinesettings 105
word vtable__getmoderange 106
word vtable__detect 107
word vtable__clear 108
word vtable__initialize 109
word vtable__lineto 110
word vtable__moveto 111
word vtable__setfillstyle 112
word vtable__fillpoly 113
word vtable__cleardevice 114
word vtable__close 115
word vtable__drawpoly 116
word vtable__setcolor 117
word vtable__getcolor 118
word vtable__getdrivername 119
word vtable__getmaxcolor 120
word vtable__getmaxmode 121
word vtable__getmaxx 122
word vtable__getmaxy 123
word vtable__getmodename 124
word vtable__getgraphmode 125
word vtable__getpalettesize 126
word vtable__textheight 127
word vtable__textwidth 128
word vtable__setwritemode 129
word vtable__getx 130
word vtable__gety 131
word vtable__outtext 132
@global.arg_counter
@global.temp
@global.this
word global.zero 0
word global.one 1
str global.raised "ERaisedException"
pushc global.zero
peek global.arg_counter
pop
@mplottype
@types
@eabstractexception
@emathexception
@ecriticalexception
@typeptr
@sysslash
@null
@params
@eunknown
word crt 8
@structure_instance_crt
pushcp __allocator__crt
jc
peek structure_instance_crt
pop
word point 9
@structure_instance_point
pushcp __allocator__point
jc
peek structure_instance_point
pop
word point3d 10
@structure_instance_point3d
pushcp __allocator__point3d
jc
peek structure_instance_point3d
pop
word mplot 11
@structure_instance_mplot
pushcp __allocator__mplot
jc
peek structure_instance_mplot
pop
word stack 12
@structure_instance_stack
pushcp __allocator__stack
jc
peek structure_instance_stack
pop
word polymorph 13
@structure_instance_polymorph
pushcp __allocator__polymorph
jc
peek structure_instance_polymorph
pop
word exception 14
@structure_instance_exception
pushcp __allocator__exception
jc
peek structure_instance_exception
pop
word complex 15
@structure_instance_complex
pushcp __allocator__complex
jc
peek structure_instance_complex
pop
word cmath 16
@structure_instance_cmath
pushcp __allocator__cmath
jc
peek structure_instance_cmath
pop
word arccoordstype 17
@structure_instance_arccoordstype
pushcp __allocator__arccoordstype
jc
peek structure_instance_arccoordstype
pop
word fillsettingstype 18
@structure_instance_fillsettingstype
pushcp __allocator__fillsettingstype
jc
peek structure_instance_fillsettingstype
pop
word linesettingstype 19
@structure_instance_linesettingstype
pushcp __allocator__linesettingstype
jc
peek structure_instance_linesettingstype
pop
word graph 20
@structure_instance_graph
pushcp __allocator__graph
jc
peek structure_instance_graph
pop
pushcp __init__
jc
@mplottype
word generator.const.gcn.0 2
pushcp generator.const.gcn.0
pushcp global.one
newa
peek mplottype
word mplot_decart 0
pcopy
pushc mplot_decart
swp
word generator.const.gcn.1 0
pushcp generator.const.gcn.1
swp
peekai
word mplot_polar 1
pcopy
pushc mplot_polar
swp
word generator.const.gcn.2 1
pushcp generator.const.gcn.2
swp
peekai
pop
@types
word generator.const.gcn.3 8
pushcp generator.const.gcn.3
pushcp global.one
newa
peek types
word typenull 0
pcopy
pushc typenull
swp
word generator.const.gcn.4 0
pushcp generator.const.gcn.4
swp
peekai
word typeword 1
pcopy
pushc typeword
swp
word generator.const.gcn.5 1
pushcp generator.const.gcn.5
swp
peekai
word typeint 2
pcopy
pushc typeint
swp
word generator.const.gcn.6 2
pushcp generator.const.gcn.6
swp
peekai
word typereal 3
pcopy
pushc typereal
swp
word generator.const.gcn.7 3
pushcp generator.const.gcn.7
swp
peekai
word typestr 4
pcopy
pushc typestr
swp
word generator.const.gcn.8 4
pushcp generator.const.gcn.8
swp
peekai
word typearray 5
pcopy
pushc typearray
swp
word generator.const.gcn.9 5
pushcp generator.const.gcn.9
swp
peekai
word typeclass 6
pcopy
pushc typeclass
swp
word generator.const.gcn.10 6
pushcp generator.const.gcn.10
swp
peekai
word typeref 7
pcopy
pushc typeref
swp
word generator.const.gcn.11 7
pushcp generator.const.gcn.11
swp
peekai
pop
@eabstractexception
word generator.const.gcn.12 5
pushcp generator.const.gcn.12
pushcp global.one
newa
peek eabstractexception
str eraisedexception "ERaisedException"
pcopy
pushc eraisedexception
swp
word generator.const.gcn.13 0
pushcp generator.const.gcn.13
swp
peekai
str einvalidvmop "EInvalidSVMOperation"
pcopy
pushc einvalidvmop
swp
word generator.const.gcn.14 1
pushcp generator.const.gcn.14
swp
peekai
str einvalidtypecast "EInvalidSVMTypeCast"
pcopy
pushc einvalidtypecast
swp
word generator.const.gcn.15 2
pushcp generator.const.gcn.15
swp
peekai
str eabstracterror "EAbstractError"
pcopy
pushc eabstracterror
swp
word generator.const.gcn.16 3
pushcp generator.const.gcn.16
swp
peekai
str eunknownexception "EUnknownException"
pcopy
pushc eunknownexception
swp
word generator.const.gcn.17 4
pushcp generator.const.gcn.17
swp
peekai
pop
@emathexception
word generator.const.gcn.18 9
pushcp generator.const.gcn.18
pushcp global.one
newa
peek emathexception
str einterror "EInterror"
pcopy
pushc einterror
swp
word generator.const.gcn.19 0
pushcp generator.const.gcn.19
swp
peekai
str edivbyzero "EDivByZero"
pcopy
pushc edivbyzero
swp
word generator.const.gcn.20 1
pushcp generator.const.gcn.20
swp
peekai
str erangeerror "ERangeError"
pcopy
pushc erangeerror
swp
word generator.const.gcn.21 2
pushcp generator.const.gcn.21
swp
peekai
str eintoverflow "EIntOverflow"
pcopy
pushc eintoverflow
swp
word generator.const.gcn.22 3
pushcp generator.const.gcn.22
swp
peekai
str ematherror "EMathError"
pcopy
pushc ematherror
swp
word generator.const.gcn.23 4
pushcp generator.const.gcn.23
swp
peekai
str einvalidop "EInvalidOp"
pcopy
pushc einvalidop
swp
word generator.const.gcn.24 5
pushcp generator.const.gcn.24
swp
peekai
str ezerodivide "EZeroDivide"
pcopy
pushc ezerodivide
swp
word generator.const.gcn.25 6
pushcp generator.const.gcn.25
swp
peekai
str eoverflow "EOverflow"
pcopy
pushc eoverflow
swp
word generator.const.gcn.26 7
pushcp generator.const.gcn.26
swp
peekai
str eunderflow "EUnderflow"
pcopy
pushc eunderflow
swp
word generator.const.gcn.27 8
pushcp generator.const.gcn.27
swp
peekai
pop
@ecriticalexception
word generator.const.gcn.28 3
pushcp generator.const.gcn.28
pushcp global.one
newa
peek ecriticalexception
str eaccessviolation "EAccessViolation"
pcopy
pushc eaccessviolation
swp
word generator.const.gcn.29 0
pushcp generator.const.gcn.29
swp
peekai
str eoserror "EOSError"
pcopy
pushc eoserror
swp
word generator.const.gcn.30 1
pushcp generator.const.gcn.30
swp
peekai
str enothreadsupport "ENoThreadSupport"
pcopy
pushc enothreadsupport
swp
word generator.const.gcn.31 2
pushcp generator.const.gcn.31
swp
peekai
pop
push null
peek typeptr
pop
pushcp __init__end__
jp
__init__:
pushc getsystemslash
invoke
peek sysslash
pop
str generator.const.gcn.32 "<null>"
pushc generator.const.gcn.32
peek null
pop
push null
peek params
pop
pushc __initproc__
word generator.const.gcn.33 0
pushcp generator.const.gcn.33
push global.arg_counter
mov
jc
jr
__init__end__:
str generator.const.gcn.35 "Unknown raised exception"
pushc generator.const.gcn.35
pushc eunknownexception
pushc system_makeexception
word generator.const.gcn.34 2
pushcp generator.const.gcn.34
push global.arg_counter
mov
jc
peek eunknown
pop
pushcp main__end
jp
main:
@main.this
@main.plt
@main.rect
@main.dist
@main.al
@main.k
@main.dx
@main.dy
@main.x
@main.y
pushcp __allocator__mplot
jc
pcopy
peek global.this
word generator.const.gcn.37 80
pushc generator.const.gcn.37
swp
pushc mplot_decart
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.36 2
pushcp generator.const.gcn.36
push global.arg_counter
mov
jc
peek main.plt
pop
word generator.const.gcn.38 8
pushcp generator.const.gcn.38
word generator.const.gcn.39 1
pushcp generator.const.gcn.39
newa
pcopy
pushcp __allocator__point3d
jc
pcopy
peek global.this
word generator.const.gcn.49 0
pushc generator.const.gcn.49
swp
word generator.const.gcn.50 2
pushc generator.const.gcn.50
copy
swp
pop
neg
swp
word generator.const.gcn.51 2
pushc generator.const.gcn.51
copy
swp
pop
neg
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.48 3
pushcp generator.const.gcn.48
push global.arg_counter
mov
jc
swp
word generator.const.gcn.40 0
pushcp generator.const.gcn.40
swp
peekai
pcopy
pushcp __allocator__point3d
jc
pcopy
peek global.this
word generator.const.gcn.53 0
pushc generator.const.gcn.53
swp
word generator.const.gcn.54 2
pushc generator.const.gcn.54
swp
word generator.const.gcn.55 2
pushc generator.const.gcn.55
copy
swp
pop
neg
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.52 3
pushcp generator.const.gcn.52
push global.arg_counter
mov
jc
swp
word generator.const.gcn.41 1
pushcp generator.const.gcn.41
swp
peekai
pcopy
pushcp __allocator__point3d
jc
pcopy
peek global.this
word generator.const.gcn.57 0
pushc generator.const.gcn.57
swp
word generator.const.gcn.58 2
pushc generator.const.gcn.58
swp
word generator.const.gcn.59 2
pushc generator.const.gcn.59
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.56 3
pushcp generator.const.gcn.56
push global.arg_counter
mov
jc
swp
word generator.const.gcn.42 2
pushcp generator.const.gcn.42
swp
peekai
pcopy
pushcp __allocator__point3d
jc
pcopy
peek global.this
word generator.const.gcn.61 0
pushc generator.const.gcn.61
swp
word generator.const.gcn.62 2
pushc generator.const.gcn.62
copy
swp
pop
neg
swp
word generator.const.gcn.63 2
pushc generator.const.gcn.63
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.60 3
pushcp generator.const.gcn.60
push global.arg_counter
mov
jc
swp
word generator.const.gcn.43 3
pushcp generator.const.gcn.43
swp
peekai
pcopy
pushcp __allocator__point3d
jc
pcopy
peek global.this
word generator.const.gcn.65 0
pushc generator.const.gcn.65
swp
word generator.const.gcn.66 2
pushc generator.const.gcn.66
copy
swp
pop
neg
swp
word generator.const.gcn.67 2
pushc generator.const.gcn.67
copy
swp
pop
neg
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.64 3
pushcp generator.const.gcn.64
push global.arg_counter
mov
jc
swp
word generator.const.gcn.44 4
pushcp generator.const.gcn.44
swp
peekai
pcopy
pushcp __allocator__point3d
jc
pcopy
peek global.this
word generator.const.gcn.69 0
pushc generator.const.gcn.69
swp
word generator.const.gcn.70 2
pushc generator.const.gcn.70
swp
word generator.const.gcn.71 2
pushc generator.const.gcn.71
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.68 3
pushcp generator.const.gcn.68
push global.arg_counter
mov
jc
swp
word generator.const.gcn.45 5
pushcp generator.const.gcn.45
swp
peekai
pcopy
pushcp __allocator__point3d
jc
pcopy
peek global.this
word generator.const.gcn.73 0
pushc generator.const.gcn.73
swp
word generator.const.gcn.74 2
pushc generator.const.gcn.74
copy
swp
pop
neg
swp
word generator.const.gcn.75 2
pushc generator.const.gcn.75
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.72 3
pushcp generator.const.gcn.72
push global.arg_counter
mov
jc
swp
word generator.const.gcn.46 6
pushcp generator.const.gcn.46
swp
peekai
pcopy
pushcp __allocator__point3d
jc
pcopy
peek global.this
word generator.const.gcn.77 0
pushc generator.const.gcn.77
swp
word generator.const.gcn.78 2
pushc generator.const.gcn.78
swp
word generator.const.gcn.79 2
pushc generator.const.gcn.79
copy
swp
pop
neg
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.76 3
pushcp generator.const.gcn.76
push global.arg_counter
mov
jc
swp
word generator.const.gcn.47 7
pushcp generator.const.gcn.47
swp
peekai
peek main.rect
pop
word generator.const.gcn.80 1
pushc generator.const.gcn.80
peek main.dist
pop
word generator.const.gcn.81 0
pushc generator.const.gcn.81
peek main.al
pop
real generator.const.gcn.82 0.05
pushc generator.const.gcn.82
peek main.k
pop
generator.while.gcn.83.start:
pushcp generator.while.gcn.83.end
pushc true
jz
pop
@generator.for_each.gcn.84.array
@generator.for_each.gcn.84.i
@generator.for_each.gcn.84.to
push main.rect
peek generator.for_each.gcn.84.array
alen
peek generator.for_each.gcn.84.to
pop
pushc global.zero
peek generator.for_each.gcn.84.i
pop
generator.for_each.gcn.84.start:
pushcp generator.for_each.gcn.84.end
push generator.for_each.gcn.84.i
push generator.for_each.gcn.84.to
eq
not
jz
pop
push generator.for_each.gcn.84.i
push generator.for_each.gcn.84.array
pushai
@main.p
peek main.p
pop
push main.al
pushc sin
word generator.const.gcn.85 1
pushcp generator.const.gcn.85
push global.arg_counter
mov
jc
push main.p
pushc vtable__y
swp
pushai
copy
swp
pop
mul
push main.al
pushc cos
word generator.const.gcn.86 1
pushcp generator.const.gcn.86
push global.arg_counter
mov
jc
push main.p
pushc vtable__x
swp
pushai
copy
swp
pop
mul
copy
swp
pop
sub
peek main.dx
pop
push main.al
pushc cos
word generator.const.gcn.87 1
pushcp generator.const.gcn.87
push global.arg_counter
mov
jc
push main.p
pushc vtable__y
swp
pushai
copy
swp
pop
mul
push main.al
pushc sin
word generator.const.gcn.88 1
pushcp generator.const.gcn.88
push global.arg_counter
mov
jc
push main.dx
copy
swp
pop
mul
copy
swp
pop
add
peek main.dy
pop
push main.dist
push main.p
pushc vtable__z
swp
pushai
copy
swp
pop
add
push main.dist
push main.dx
copy
swp
pop
mul
copy
swp
pop
div
peek main.x
pop
push main.dist
push main.p
pushc vtable__z
swp
pushai
copy
swp
pop
add
push main.dist
push main.dy
copy
swp
pop
mul
copy
swp
pop
div
peek main.y
pop
push main.y
push main.x
push main.plt
peek global.this
pushc vtable__next
swp
pushai
word generator.const.gcn.89 2
pushcp generator.const.gcn.89
push global.arg_counter
mov
jc
push main.y
push main.x
push main.plt
peek global.this
pushc vtable__dot
swp
pushai
word generator.const.gcn.90 2
pushcp generator.const.gcn.90
push global.arg_counter
mov
jc
generator.for_each.gcn.84.continue:
push generator.for_each.gcn.84.i
inc
pop
pushcp generator.for_each.gcn.84.start
jp
generator.for_each.gcn.84.end:
word generator.const.gcn.92 0
pushc generator.const.gcn.92
word generator.const.gcn.93 0
pushc generator.const.gcn.93
push main.plt
peek global.this
pushc vtable__dot
swp
pushai
word generator.const.gcn.91 2
pushcp generator.const.gcn.91
push global.arg_counter
mov
jc
push main.plt
peek global.this
pushc vtable__finish
swp
pushai
word generator.const.gcn.94 0
pushcp generator.const.gcn.94
push global.arg_counter
mov
jc
word generator.const.gcn.95 24
pushc generator.const.gcn.95
word generator.const.gcn.96 500
pushc generator.const.gcn.96
copy
swp
pop
idiv
pushc sleep
invoke
push structure_instance_graph
peek global.this
pushc vtable__clear
swp
pushai
word generator.const.gcn.97 0
pushcp generator.const.gcn.97
push global.arg_counter
mov
jc
pushcp generator.if.gcn.98.else
word generator.const.gcn.99 1
pushc generator.const.gcn.99
push main.k
pushc abs
word generator.const.gcn.100 1
pushcp generator.const.gcn.100
push global.arg_counter
mov
jc
be
jz
pop
word generator.const.gcn.101 1
pushc generator.const.gcn.101
copy
swp
pop
neg
push main.k
mul
pop
generator.if.gcn.98.else:
push main.k
push main.al
add
pop
pushc gc
word generator.const.gcn.102 0
pushcp generator.const.gcn.102
push global.arg_counter
mov
jc
pushcp generator.while.gcn.83.start
jp
generator.while.gcn.83.end:
pushc inputln
invoke
jr
main__end:
pushcp __printarray__end
jp
__printarray:
@__printarray.this
@__printarray.arr
@__printarray.l
@__printarray.i
peek __printarray.arr
pop
str generator.const.gcn.103 "["
pushc generator.const.gcn.103
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.104 1
pushcp generator.const.gcn.104
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.105 0
pushc generator.const.gcn.105
peek __printarray.i
pop
generator.while.gcn.106.start:
pushcp generator.while.gcn.106.end
push __printarray.l
push __printarray.i
swp
bg
jz
pop
push __printarray.this
rst
push __printarray.arr
rst
push __printarray.l
rst
push __printarray.i
rst
push __printarray.arr
push __printarray.i
swp
pushai
pushc __print
word generator.const.gcn.107 1
pushcp generator.const.gcn.107
push global.arg_counter
mov
jc
rld
peek __printarray.i
pop
rld
peek __printarray.l
pop
rld
peek __printarray.arr
pop
rld
peek __printarray.this
pop
pushcp generator.if.gcn.108.else
push __printarray.l
word generator.const.gcn.109 1
pushc generator.const.gcn.109
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.110 ", "
pushc generator.const.gcn.110
pushc _print
invoke
generator.if.gcn.108.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.106.start
jp
generator.while.gcn.106.end:
str generator.const.gcn.111 "]"
pushc generator.const.gcn.111
pushc _print
invoke
jr
__printarray__end:
pushcp __print__end
jp
__print:
@__print.this
@__print.obj
peek __print.obj
pop
push __print.obj
pushc typeof
word generator.const.gcn.113 1
pushcp generator.const.gcn.113
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.114.end
swp
jz
str generator.const.gcn.115 "(null)"
pushc generator.const.gcn.115
pushc _print
invoke
pushcp generator.switch.gcn.112.end
jp
generator.case.gcn.114.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.116.end
swp
jz
push __print.obj
peek global.this
pushc vtable__tostring
swp
pushai
word generator.const.gcn.117 0
pushcp generator.const.gcn.117
push global.arg_counter
mov
jc
pushc _print
invoke
pushcp generator.switch.gcn.112.end
jp
generator.case.gcn.116.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.118.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.119 1
pushcp generator.const.gcn.119
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.112.end
jp
generator.case.gcn.118.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.112.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.120 0
pushcp generator.const.gcn.120
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.121.array
@generator.for_each.gcn.121.i
@generator.for_each.gcn.121.to
push print.args
peek generator.for_each.gcn.121.array
alen
peek generator.for_each.gcn.121.to
pop
pushc global.zero
peek generator.for_each.gcn.121.i
pop
generator.for_each.gcn.121.start:
pushcp generator.for_each.gcn.121.end
push generator.for_each.gcn.121.i
push generator.for_each.gcn.121.to
eq
not
jz
pop
push generator.for_each.gcn.121.i
push generator.for_each.gcn.121.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.122 1
pushcp generator.const.gcn.122
push global.arg_counter
mov
jc
generator.for_each.gcn.121.continue:
push generator.for_each.gcn.121.i
inc
pop
pushcp generator.for_each.gcn.121.start
jp
generator.for_each.gcn.121.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.123 0
pushcp generator.const.gcn.123
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.124.array
@generator.for_each.gcn.124.i
@generator.for_each.gcn.124.to
push println.args
peek generator.for_each.gcn.124.array
alen
peek generator.for_each.gcn.124.to
pop
pushc global.zero
peek generator.for_each.gcn.124.i
pop
generator.for_each.gcn.124.start:
pushcp generator.for_each.gcn.124.end
push generator.for_each.gcn.124.i
push generator.for_each.gcn.124.to
eq
not
jz
pop
push generator.for_each.gcn.124.i
push generator.for_each.gcn.124.array
pushai
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.125 1
pushcp generator.const.gcn.125
push global.arg_counter
mov
jc
generator.for_each.gcn.124.continue:
push generator.for_each.gcn.124.i
inc
pop
pushcp generator.for_each.gcn.124.start
jp
generator.for_each.gcn.124.end:
str generator.const.gcn.126 ""
pushc generator.const.gcn.126
pushc _println
invoke
jr
println__end:
pushcp crt__normvideo__end
jp
crt__normvideo:
@crt__normvideo.this
push global.this
peek crt__normvideo.this
pop
word generator.const.gcn.127 7
pushc generator.const.gcn.127
pushc crt_textcolor
invoke
word generator.const.gcn.128 0
pushc generator.const.gcn.128
pushc crt_textbackground
invoke
jr
crt__normvideo__end:
pushcp crt__wherex__end
jp
crt__wherex:
@crt__wherex.this
push global.this
peek crt__wherex.this
pop
word generator.const.gcn.129 256
pushc generator.const.gcn.129
pushc crt_wherex32
invoke
copy
swp
pop
mod
jr
jr
crt__wherex__end:
pushcp crt__wherey__end
jp
crt__wherey:
@crt__wherey.this
push global.this
peek crt__wherey.this
pop
word generator.const.gcn.130 256
pushc generator.const.gcn.130
pushc crt_wherey32
invoke
copy
swp
pop
mod
jr
jr
crt__wherey__end:
pushcp crt__pause__end
jp
crt__pause:
@crt__pause.this
@crt__pause.k
push global.this
peek crt__pause.this
pop
pushc crt_readkey
invoke
peek crt__pause.k
pop
jr
crt__pause__end:
pushcp crt__cursorbig__end
jp
crt__cursorbig:
@crt__cursorbig.this
push global.this
peek crt__cursorbig.this
pop
pushc crt_cursorbig
invoke
jr
crt__cursorbig__end:
pushcp crt__cursoroff__end
jp
crt__cursoroff:
@crt__cursoroff.this
push global.this
peek crt__cursoroff.this
pop
pushc crt_cursoroff
invoke
jr
crt__cursoroff__end:
pushcp crt__cursoron__end
jp
crt__cursoron:
@crt__cursoron.this
push global.this
peek crt__cursoron.this
pop
pushc crt_cursoron
invoke
jr
crt__cursoron__end:
pushcp crt__delline__end
jp
crt__delline:
@crt__delline.this
push global.this
peek crt__delline.this
pop
pushc crt_delline
invoke
jr
crt__delline__end:
pushcp crt__gotoxy__end
jp
crt__gotoxy:
@crt__gotoxy.this
push global.this
peek crt__gotoxy.this
pop
pushc crt_gotoxy
invoke
jr
crt__gotoxy__end:
pushcp crt__insline__end
jp
crt__insline:
@crt__insline.this
push global.this
peek crt__insline.this
pop
pushc crt_insline
invoke
jr
crt__insline__end:
pushcp crt__keypressed__end
jp
crt__keypressed:
@crt__keypressed.this
push global.this
peek crt__keypressed.this
pop
pushc crt_keypressed
invoke
jr
crt__keypressed__end:
pushcp crt__readkey__end
jp
crt__readkey:
@crt__readkey.this
push global.this
peek crt__readkey.this
pop
pushc crt_readkey
invoke
jr
crt__readkey__end:
pushcp crt__sound__end
jp
crt__sound:
@crt__sound.this
push global.this
peek crt__sound.this
pop
pushc crt_sound
invoke
jr
crt__sound__end:
pushcp crt__window32__end
jp
crt__window32:
@crt__window32.this
push global.this
peek crt__window32.this
pop
pushc crt_window32
invoke
jr
crt__window32__end:
pushcp crt__clreol__end
jp
crt__clreol:
@crt__clreol.this
push global.this
peek crt__clreol.this
pop
pushc crt_clreol
invoke
jr
crt__clreol__end:
pushcp crt__clrscr__end
jp
crt__clrscr:
@crt__clrscr.this
push global.this
peek crt__clrscr.this
pop
pushc crt_clrscr
invoke
jr
crt__clrscr__end:
pushcp crt__getdirectvideo__end
jp
crt__getdirectvideo:
@crt__getdirectvideo.this
push global.this
peek crt__getdirectvideo.this
pop
pushc crt_getdirectvideo
invoke
jr
crt__getdirectvideo__end:
pushcp crt__getlastmode__end
jp
crt__getlastmode:
@crt__getlastmode.this
push global.this
peek crt__getlastmode.this
pop
pushc crt_getlastmode
invoke
jr
crt__getlastmode__end:
pushcp crt__settextattr__end
jp
crt__settextattr:
@crt__settextattr.this
push global.this
peek crt__settextattr.this
pop
pushc crt_settextattr
invoke
jr
crt__settextattr__end:
pushcp crt__gettextattr__end
jp
crt__gettextattr:
@crt__gettextattr.this
push global.this
peek crt__gettextattr.this
pop
pushc crt_gettextattr
invoke
jr
crt__gettextattr__end:
pushcp crt__getwindmax__end
jp
crt__getwindmax:
@crt__getwindmax.this
push global.this
peek crt__getwindmax.this
pop
pushc crt_getwindmax
invoke
jr
crt__getwindmax__end:
pushcp crt__getwindmaxx__end
jp
crt__getwindmaxx:
@crt__getwindmaxx.this
push global.this
peek crt__getwindmaxx.this
pop
pushc crt_getwindmaxx
invoke
jr
crt__getwindmaxx__end:
pushcp crt__getwindmaxy__end
jp
crt__getwindmaxy:
@crt__getwindmaxy.this
push global.this
peek crt__getwindmaxy.this
pop
pushc crt_getwindmaxy
invoke
jr
crt__getwindmaxy__end:
pushcp crt__getwindmin__end
jp
crt__getwindmin:
@crt__getwindmin.this
push global.this
peek crt__getwindmin.this
pop
pushc crt_getwindmin
invoke
jr
crt__getwindmin__end:
pushcp crt__getwindminx__end
jp
crt__getwindminx:
@crt__getwindminx.this
push global.this
peek crt__getwindminx.this
pop
pushc crt_getwindminx
invoke
jr
crt__getwindminx__end:
pushcp crt__getwindminy__end
jp
crt__getwindminy:
@crt__getwindminy.this
push global.this
peek crt__getwindminy.this
pop
pushc crt_getwindminy
invoke
jr
crt__getwindminy__end:
pushcp crt__getcheckbreak__end
jp
crt__getcheckbreak:
@crt__getcheckbreak.this
push global.this
peek crt__getcheckbreak.this
pop
pushc crt_getcheckbreak
invoke
jr
crt__getcheckbreak__end:
pushcp crt__getcheckeof__end
jp
crt__getcheckeof:
@crt__getcheckeof.this
push global.this
peek crt__getcheckeof.this
pop
pushc crt_getcheckeof
invoke
jr
crt__getcheckeof__end:
pushcp crt__getchecksnow__end
jp
crt__getchecksnow:
@crt__getchecksnow.this
push global.this
peek crt__getchecksnow.this
pop
pushc crt_getchecksnow
invoke
jr
crt__getchecksnow__end:
pushcp crt__textcolor__end
jp
crt__textcolor:
@crt__textcolor.this
push global.this
peek crt__textcolor.this
pop
pushc crt_textcolor
invoke
jr
crt__textcolor__end:
pushcp crt__textbackground__end
jp
crt__textbackground:
@crt__textbackground.this
push global.this
peek crt__textbackground.this
pop
pushc crt_textbackground
invoke
jr
crt__textbackground__end:
pushcp point__create__end
jp
point__create:
@point__create.this
@point__create.x
@point__create.y
peek point__create.x
pop
peek point__create.y
pop
push global.this
peek point__create.this
pop
push point__create.x
pushc copy
word generator.const.gcn.131 1
pushcp generator.const.gcn.131
push global.arg_counter
mov
jc
push point__create.this
pushc vtable__x
swp
peekai
push point__create.y
pushc copy
word generator.const.gcn.132 1
pushcp generator.const.gcn.132
push global.arg_counter
mov
jc
push point__create.this
pushc vtable__y
swp
peekai
jr
point__create__end:
pushcp point__set__end
jp
point__set:
@point__set.this
@point__set.x
@point__set.y
peek point__set.x
pop
peek point__set.y
pop
push global.this
peek point__set.this
pop
push point__set.x
push point__set.this
pushc vtable__x
swp
pushai
mov
push point__set.y
push point__set.this
pushc vtable__y
swp
pushai
mov
jr
point__set__end:
pushcp point__clone__end
jp
point__clone:
@point__clone.this
push global.this
peek point__clone.this
pop
pushcp __allocator__point
jc
pcopy
peek global.this
push point__clone.this
pushc vtable__y
swp
pushai
swp
push point__clone.this
pushc vtable__x
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.133 2
pushcp generator.const.gcn.133
push global.arg_counter
mov
jc
jr
jr
point__clone__end:
pushcp point__compare__end
jp
point__compare:
@point__compare.this
@point__compare.p
peek point__compare.p
pop
push global.this
peek point__compare.this
pop
push point__compare.p
pushc vtable__y
swp
pushai
push point__compare.this
pushc vtable__y
swp
pushai
eq
push point__compare.p
pushc vtable__x
swp
pushai
push point__compare.this
pushc vtable__x
swp
pushai
eq
copy
swp
pop
and
jr
jr
point__compare__end:
pushcp point3d__create__end
jp
point3d__create:
@point3d__create.this
@point3d__create.x
@point3d__create.y
@point3d__create.z
peek point3d__create.x
pop
peek point3d__create.y
pop
peek point3d__create.z
pop
push global.this
peek point3d__create.this
pop
push point3d__create.x
push point3d__create.this
pushc vtable__x
swp
peekai
push point3d__create.y
push point3d__create.this
pushc vtable__y
swp
peekai
push point3d__create.z
push point3d__create.this
pushc vtable__z
swp
peekai
jr
point3d__create__end:
pushcp point3d__set__end
jp
point3d__set:
@point3d__set.this
@point3d__set.x
@point3d__set.y
@point3d__set.z
peek point3d__set.x
pop
peek point3d__set.y
pop
peek point3d__set.z
pop
push global.this
peek point3d__set.this
pop
push point3d__set.x
push point3d__set.this
pushc vtable__x
swp
pushai
mov
push point3d__set.y
push point3d__set.this
pushc vtable__y
swp
pushai
mov
push point3d__set.z
push point3d__set.this
pushc vtable__z
swp
pushai
mov
jr
point3d__set__end:
pushcp point3d__compare__end
jp
point3d__compare:
@point3d__compare.this
@point3d__compare.p
peek point3d__compare.p
pop
push global.this
peek point3d__compare.this
pop
push point3d__compare.p
pushc vtable__z
swp
pushai
push point3d__compare.this
pushc vtable__z
swp
pushai
eq
push point3d__compare.p
pushc vtable__y
swp
pushai
push point3d__compare.this
pushc vtable__y
swp
pushai
eq
push point3d__compare.p
pushc vtable__x
swp
pushai
push point3d__compare.this
pushc vtable__x
swp
pushai
eq
copy
swp
pop
and
copy
swp
pop
and
jr
jr
point3d__compare__end:
pushcp mplot__create__end
jp
mplot__create:
@mplot__create.this
@mplot__create.sctype
@mplot__create.scscale
peek mplot__create.sctype
pop
peek mplot__create.scscale
pop
push global.this
peek mplot__create.this
pop
push mplot__create.sctype
push mplot__create.this
pushc vtable__sctype
swp
peekai
pushcp generator.if.gcn.134.else
pushc mplot_defscale
push mplot__create.scscale
eq
jz
pop
word generator.const.gcn.135 100
pushc generator.const.gcn.135
push mplot__create.this
pushc vtable__scscale
swp
peekai
pushcp generator.if.gcn.134.end
jp
generator.if.gcn.134.else:
push mplot__create.scscale
push mplot__create.this
pushc vtable__scscale
swp
peekai
generator.if.gcn.134.end:
pushc false
push mplot__create.this
pushc vtable__drawinginprocess
swp
peekai
push structure_instance_graph
peek global.this
pushc vtable__initialize
swp
pushai
word generator.const.gcn.136 0
pushcp generator.const.gcn.136
push global.arg_counter
mov
jc
push structure_instance_graph
peek global.this
pushc vtable__getmaxx
swp
pushai
word generator.const.gcn.137 0
pushcp generator.const.gcn.137
push global.arg_counter
mov
jc
push mplot__create.this
pushc vtable__maxx
swp
peekai
push structure_instance_graph
peek global.this
pushc vtable__getmaxy
swp
pushai
word generator.const.gcn.138 0
pushcp generator.const.gcn.138
push global.arg_counter
mov
jc
push mplot__create.this
pushc vtable__maxy
swp
peekai
word generator.const.gcn.139 1
pushc generator.const.gcn.139
word generator.const.gcn.140 2
pushc generator.const.gcn.140
push mplot__create.this
pushc vtable__scscale
swp
pushai
push mplot__create.this
pushc vtable__maxx
swp
pushai
copy
swp
pop
idiv
copy
swp
pop
idiv
copy
swp
pop
add
push mplot__create.this
pushc vtable__stepsx
swp
peekai
word generator.const.gcn.141 2
pushc generator.const.gcn.141
push mplot__create.this
pushc vtable__maxx
swp
pushai
copy
swp
pop
idiv
push mplot__create.this
pushc vtable__x0
swp
peekai
word generator.const.gcn.142 2
pushc generator.const.gcn.142
push mplot__create.this
pushc vtable__maxy
swp
pushai
copy
swp
pop
idiv
push mplot__create.this
pushc vtable__y0
swp
peekai
pushcp generator.if.gcn.143.else
pushc mplot_decart
push mplot__create.this
pushc vtable__sctype
swp
pushai
eq
jz
pop
push mplot__create.this
peek global.this
pushc vtable__drawdecart
swp
pushai
word generator.const.gcn.144 0
pushcp generator.const.gcn.144
push global.arg_counter
mov
jc
pushcp generator.if.gcn.143.end
jp
generator.if.gcn.143.else:
push mplot__create.this
peek global.this
pushc vtable__drawpolar
swp
pushai
word generator.const.gcn.145 0
pushcp generator.const.gcn.145
push global.arg_counter
mov
jc
generator.if.gcn.143.end:
jr
mplot__create__end:
pushcp mplot__drawdecart__end
jp
mplot__drawdecart:
@mplot__drawdecart.this
@mplot__drawdecart.steps
@mplot__drawdecart.i
@mplot__drawdecart.x
@mplot__drawdecart.y
push global.this
peek mplot__drawdecart.this
pop
word generator.const.gcn.146 2
pushc generator.const.gcn.146
push mplot__drawdecart.this
pushc vtable__scscale
swp
pushai
push mplot__drawdecart.this
pushc vtable__maxx
swp
pushai
copy
swp
pop
idiv
copy
swp
pop
idiv
peek mplot__drawdecart.steps
pop
word generator.const.gcn.148 0
pushc generator.const.gcn.148
push mplot__drawdecart.this
pushc vtable__x0
swp
pushai
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.147 2
pushcp generator.const.gcn.147
push global.arg_counter
mov
jc
push mplot__drawdecart.this
pushc vtable__maxy
swp
pushai
push mplot__drawdecart.this
pushc vtable__x0
swp
pushai
push structure_instance_graph
peek global.this
pushc vtable__lineto
swp
pushai
word generator.const.gcn.149 2
pushcp generator.const.gcn.149
push global.arg_counter
mov
jc
push mplot__drawdecart.this
pushc vtable__y0
swp
pushai
word generator.const.gcn.151 0
pushc generator.const.gcn.151
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.150 2
pushcp generator.const.gcn.150
push global.arg_counter
mov
jc
push mplot__drawdecart.this
pushc vtable__y0
swp
pushai
push mplot__drawdecart.this
pushc vtable__maxx
swp
pushai
push structure_instance_graph
peek global.this
pushc vtable__lineto
swp
pushai
word generator.const.gcn.152 2
pushcp generator.const.gcn.152
push global.arg_counter
mov
jc
push mplot__drawdecart.steps
copy
swp
pop
neg
peek mplot__drawdecart.i
pop
generator.while.gcn.153.start:
pushcp generator.while.gcn.153.end
push mplot__drawdecart.steps
push mplot__drawdecart.i
swp
bg
jz
pop
push mplot__drawdecart.i
push mplot__drawdecart.this
pushc vtable__scscale
swp
pushai
copy
swp
pop
mul
push mplot__drawdecart.this
pushc vtable__x0
swp
pushai
copy
swp
pop
add
peek mplot__drawdecart.x
pop
push mplot__drawdecart.this
pushc vtable__y0
swp
pushai
push mplot__drawdecart.x
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.154 2
pushcp generator.const.gcn.154
push global.arg_counter
mov
jc
word generator.const.gcn.156 5
pushc generator.const.gcn.156
push mplot__drawdecart.this
pushc vtable__y0
swp
pushai
copy
swp
pop
add
push mplot__drawdecart.x
push structure_instance_graph
peek global.this
pushc vtable__lineto
swp
pushai
word generator.const.gcn.155 2
pushcp generator.const.gcn.155
push global.arg_counter
mov
jc
word generator.const.gcn.158 5
pushc generator.const.gcn.158
push mplot__drawdecart.this
pushc vtable__y0
swp
pushai
copy
swp
pop
sub
push mplot__drawdecart.x
push structure_instance_graph
peek global.this
pushc vtable__lineto
swp
pushai
word generator.const.gcn.157 2
pushcp generator.const.gcn.157
push global.arg_counter
mov
jc
push mplot__drawdecart.i
push mplot__drawdecart.this
pushc vtable__scscale
swp
pushai
copy
swp
pop
mul
push mplot__drawdecart.this
pushc vtable__y0
swp
pushai
copy
swp
pop
add
peek mplot__drawdecart.y
pop
push mplot__drawdecart.y
push mplot__drawdecart.this
pushc vtable__x0
swp
pushai
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.159 2
pushcp generator.const.gcn.159
push global.arg_counter
mov
jc
push mplot__drawdecart.y
word generator.const.gcn.161 5
pushc generator.const.gcn.161
push mplot__drawdecart.this
pushc vtable__x0
swp
pushai
copy
swp
pop
add
push structure_instance_graph
peek global.this
pushc vtable__lineto
swp
pushai
word generator.const.gcn.160 2
pushcp generator.const.gcn.160
push global.arg_counter
mov
jc
push mplot__drawdecart.y
word generator.const.gcn.163 5
pushc generator.const.gcn.163
push mplot__drawdecart.this
pushc vtable__x0
swp
pushai
copy
swp
pop
sub
push structure_instance_graph
peek global.this
pushc vtable__lineto
swp
pushai
word generator.const.gcn.162 2
pushcp generator.const.gcn.162
push global.arg_counter
mov
jc
push mplot__drawdecart.i
inc
pop
pushcp generator.while.gcn.153.start
jp
generator.while.gcn.153.end:
jr
mplot__drawdecart__end:
pushcp mplot__drawpolar__end
jp
mplot__drawpolar:
@mplot__drawpolar.this
@mplot__drawpolar.steps
@mplot__drawpolar.i
push global.this
peek mplot__drawpolar.this
pop
word generator.const.gcn.164 2
pushc generator.const.gcn.164
push mplot__drawpolar.this
pushc vtable__scscale
swp
pushai
push mplot__drawpolar.this
pushc vtable__maxx
swp
pushai
copy
swp
pop
idiv
copy
swp
pop
idiv
peek mplot__drawpolar.steps
pop
word generator.const.gcn.166 0
pushc generator.const.gcn.166
push mplot__drawpolar.this
pushc vtable__x0
swp
pushai
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.165 2
pushcp generator.const.gcn.165
push global.arg_counter
mov
jc
push mplot__drawpolar.this
pushc vtable__maxy
swp
pushai
push mplot__drawpolar.this
pushc vtable__x0
swp
pushai
push structure_instance_graph
peek global.this
pushc vtable__lineto
swp
pushai
word generator.const.gcn.167 2
pushcp generator.const.gcn.167
push global.arg_counter
mov
jc
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
word generator.const.gcn.169 0
pushc generator.const.gcn.169
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.168 2
pushcp generator.const.gcn.168
push global.arg_counter
mov
jc
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
push mplot__drawpolar.this
pushc vtable__maxx
swp
pushai
push structure_instance_graph
peek global.this
pushc vtable__lineto
swp
pushai
word generator.const.gcn.170 2
pushcp generator.const.gcn.170
push global.arg_counter
mov
jc
pushc graph_lightgray
push structure_instance_graph
peek global.this
pushc vtable__setcolor
swp
pushai
word generator.const.gcn.171 1
pushcp generator.const.gcn.171
push global.arg_counter
mov
jc
word generator.const.gcn.172 1
pushc generator.const.gcn.172
peek mplot__drawpolar.i
pop
generator.while.gcn.173.start:
pushcp generator.while.gcn.173.end
word generator.const.gcn.174 4
pushc generator.const.gcn.174
push mplot__drawpolar.steps
copy
swp
pop
add
push mplot__drawpolar.i
swp
bg
jz
pop
push mplot__drawpolar.i
push mplot__drawpolar.this
pushc vtable__scscale
swp
pushai
copy
swp
pop
mul
push mplot__drawpolar.i
push mplot__drawpolar.this
pushc vtable__scscale
swp
pushai
copy
swp
pop
mul
word generator.const.gcn.176 360
pushc generator.const.gcn.176
word generator.const.gcn.177 0
pushc generator.const.gcn.177
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
push mplot__drawpolar.this
pushc vtable__x0
swp
pushai
push structure_instance_graph
peek global.this
pushc vtable__ellipse
swp
pushai
word generator.const.gcn.175 6
pushcp generator.const.gcn.175
push global.arg_counter
mov
jc
push mplot__drawpolar.i
inc
pop
pushcp generator.while.gcn.173.start
jp
generator.while.gcn.173.end:
word generator.const.gcn.179 2000
pushc generator.const.gcn.179
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
copy
swp
pop
add
word generator.const.gcn.180 2000
pushc generator.const.gcn.180
push mplot__drawpolar.this
pushc vtable__x0
swp
pushai
copy
swp
pop
sub
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.178 2
pushcp generator.const.gcn.178
push global.arg_counter
mov
jc
word generator.const.gcn.182 2000
pushc generator.const.gcn.182
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
copy
swp
pop
sub
word generator.const.gcn.183 2000
pushc generator.const.gcn.183
push mplot__drawpolar.this
pushc vtable__x0
swp
pushai
copy
swp
pop
add
push structure_instance_graph
peek global.this
pushc vtable__lineto
swp
pushai
word generator.const.gcn.181 2
pushcp generator.const.gcn.181
push global.arg_counter
mov
jc
word generator.const.gcn.185 2000
pushc generator.const.gcn.185
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
copy
swp
pop
add
word generator.const.gcn.186 2000
pushc generator.const.gcn.186
push mplot__drawpolar.this
pushc vtable__x0
swp
pushai
copy
swp
pop
add
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.184 2
pushcp generator.const.gcn.184
push global.arg_counter
mov
jc
word generator.const.gcn.188 2000
pushc generator.const.gcn.188
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
copy
swp
pop
sub
word generator.const.gcn.189 2000
pushc generator.const.gcn.189
push mplot__drawpolar.this
pushc vtable__x0
swp
pushai
copy
swp
pop
sub
push structure_instance_graph
peek global.this
pushc vtable__lineto
swp
pushai
word generator.const.gcn.187 2
pushcp generator.const.gcn.187
push global.arg_counter
mov
jc
pushc graph_black
push structure_instance_graph
peek global.this
pushc vtable__setcolor
swp
pushai
word generator.const.gcn.190 1
pushcp generator.const.gcn.190
push global.arg_counter
mov
jc
jr
mplot__drawpolar__end:
pushcp mplot__offsetx__end
jp
mplot__offsetx:
@mplot__offsetx.this
@mplot__offsetx.x
peek mplot__offsetx.x
pop
push global.this
peek mplot__offsetx.this
pop
push mplot__offsetx.this
pushc vtable__scscale
swp
pushai
push mplot__offsetx.x
copy
swp
pop
mul
pushc trunc
word generator.const.gcn.191 1
pushcp generator.const.gcn.191
push global.arg_counter
mov
jc
push mplot__offsetx.this
pushc vtable__x0
swp
pushai
copy
swp
pop
add
jr
jr
mplot__offsetx__end:
pushcp mplot__offsety__end
jp
mplot__offsety:
@mplot__offsety.this
@mplot__offsety.y
peek mplot__offsety.y
pop
push global.this
peek mplot__offsety.this
pop
push mplot__offsety.this
pushc vtable__scscale
swp
pushai
push mplot__offsety.y
copy
swp
pop
mul
pushc trunc
word generator.const.gcn.192 1
pushcp generator.const.gcn.192
push global.arg_counter
mov
jc
push mplot__offsety.this
pushc vtable__y0
swp
pushai
copy
swp
pop
sub
jr
jr
mplot__offsety__end:
pushcp mplot__nextpoint__end
jp
mplot__nextpoint:
@mplot__nextpoint.this
@mplot__nextpoint.x
@mplot__nextpoint.y
@mplot__nextpoint.px
@mplot__nextpoint.py
peek mplot__nextpoint.x
pop
peek mplot__nextpoint.y
pop
push global.this
peek mplot__nextpoint.this
pop
push mplot__nextpoint.x
push mplot__nextpoint.this
peek global.this
pushc vtable__offsetx
swp
pushai
word generator.const.gcn.193 1
pushcp generator.const.gcn.193
push global.arg_counter
mov
jc
peek mplot__nextpoint.px
pop
push mplot__nextpoint.y
push mplot__nextpoint.this
peek global.this
pushc vtable__offsety
swp
pushai
word generator.const.gcn.194 1
pushcp generator.const.gcn.194
push global.arg_counter
mov
jc
peek mplot__nextpoint.py
pop
pushcp generator.if.gcn.195.else
push mplot__nextpoint.this
pushc vtable__drawinginprocess
swp
pushai
jz
pop
push mplot__nextpoint.py
push mplot__nextpoint.px
push structure_instance_graph
peek global.this
pushc vtable__lineto
swp
pushai
word generator.const.gcn.196 2
pushcp generator.const.gcn.196
push global.arg_counter
mov
jc
pushcp generator.if.gcn.195.end
jp
generator.if.gcn.195.else:
push mplot__nextpoint.py
push mplot__nextpoint.px
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.197 2
pushcp generator.const.gcn.197
push global.arg_counter
mov
jc
pushc true
push mplot__nextpoint.this
pushc vtable__drawinginprocess
swp
pushai
mov
generator.if.gcn.195.end:
jr
mplot__nextpoint__end:
pushcp mplot__nextpolar__end
jp
mplot__nextpolar:
@mplot__nextpolar.this
@mplot__nextpolar.length
@mplot__nextpolar.angle
@mplot__nextpolar.vect
peek mplot__nextpolar.length
pop
peek mplot__nextpolar.angle
pop
push global.this
peek mplot__nextpolar.this
pop
push mplot__nextpolar.angle
push mplot__nextpolar.length
push structure_instance_cmath
peek global.this
pushc vtable__uniteviaexp
swp
pushai
word generator.const.gcn.198 2
pushcp generator.const.gcn.198
push global.arg_counter
mov
jc
peek mplot__nextpolar.vect
pop
push mplot__nextpolar.vect
pushc vtable__im
swp
pushai
push mplot__nextpolar.vect
pushc vtable__re
swp
pushai
push mplot__nextpolar.this
peek global.this
pushc vtable__nextpoint
swp
pushai
word generator.const.gcn.199 2
pushcp generator.const.gcn.199
push global.arg_counter
mov
jc
jr
mplot__nextpolar__end:
pushcp mplot__breakspline__end
jp
mplot__breakspline:
@mplot__breakspline.this
push global.this
peek mplot__breakspline.this
pop
pushcp generator.if.gcn.200.else
push mplot__breakspline.this
pushc vtable__drawinginprocess
swp
pushai
jz
pop
pushc false
push mplot__breakspline.this
pushc vtable__drawinginprocess
swp
pushai
mov
word generator.const.gcn.202 4
pushc generator.const.gcn.202
word generator.const.gcn.203 4
pushc generator.const.gcn.203
word generator.const.gcn.204 360
pushc generator.const.gcn.204
word generator.const.gcn.205 0
pushc generator.const.gcn.205
push structure_instance_graph
peek global.this
pushc vtable__gety
swp
pushai
word generator.const.gcn.206 0
pushcp generator.const.gcn.206
push global.arg_counter
mov
jc
push structure_instance_graph
peek global.this
pushc vtable__getx
swp
pushai
word generator.const.gcn.207 0
pushcp generator.const.gcn.207
push global.arg_counter
mov
jc
push structure_instance_graph
peek global.this
pushc vtable__ellipse
swp
pushai
word generator.const.gcn.201 6
pushcp generator.const.gcn.201
push global.arg_counter
mov
jc
generator.if.gcn.200.else:
jr
mplot__breakspline__end:
pushcp mplot__finish__end
jp
mplot__finish:
@mplot__finish.this
push global.this
peek mplot__finish.this
pop
pushc false
push mplot__finish.this
pushc vtable__drawinginprocess
swp
pushai
mov
jr
mplot__finish__end:
pushcp mplot__next__end
jp
mplot__next:
@mplot__next.this
@mplot__next.i
@mplot__next.res
peek mplot__next.i
pop
peek mplot__next.res
pop
push global.this
peek mplot__next.this
pop
pushcp generator.if.gcn.208.else
pushc mplot_decart
push mplot__next.this
pushc vtable__sctype
swp
pushai
eq
jz
pop
push mplot__next.res
push mplot__next.i
push mplot__next.this
peek global.this
pushc vtable__nextpoint
swp
pushai
word generator.const.gcn.209 2
pushcp generator.const.gcn.209
push global.arg_counter
mov
jc
pushcp generator.if.gcn.208.end
jp
generator.if.gcn.208.else:
push mplot__next.i
push mplot__next.res
push mplot__next.this
peek global.this
pushc vtable__nextpolar
swp
pushai
word generator.const.gcn.210 2
pushcp generator.const.gcn.210
push global.arg_counter
mov
jc
generator.if.gcn.208.end:
jr
mplot__next__end:
pushcp mplot__dot__end
jp
mplot__dot:
@mplot__dot.this
@mplot__dot.i
@mplot__dot.res
@mplot__dot.cn
peek mplot__dot.i
pop
peek mplot__dot.res
pop
push global.this
peek mplot__dot.this
pop
pushcp generator.if.gcn.211.else
pushc mplot_decart
push mplot__dot.this
pushc vtable__sctype
swp
pushai
eq
jz
pop
word generator.const.gcn.213 2
pushc generator.const.gcn.213
word generator.const.gcn.214 2
pushc generator.const.gcn.214
push mplot__dot.res
push mplot__dot.this
peek global.this
pushc vtable__offsety
swp
pushai
word generator.const.gcn.215 1
pushcp generator.const.gcn.215
push global.arg_counter
mov
jc
push mplot__dot.i
push mplot__dot.this
peek global.this
pushc vtable__offsetx
swp
pushai
word generator.const.gcn.216 1
pushcp generator.const.gcn.216
push global.arg_counter
mov
jc
push structure_instance_graph
peek global.this
pushc vtable__fillellipse
swp
pushai
word generator.const.gcn.212 4
pushcp generator.const.gcn.212
push global.arg_counter
mov
jc
pushcp generator.if.gcn.211.end
jp
generator.if.gcn.211.else:
push mplot__dot.res
push mplot__dot.i
push structure_instance_cmath
peek global.this
pushc vtable__uniteviaexp
swp
pushai
word generator.const.gcn.217 2
pushcp generator.const.gcn.217
push global.arg_counter
mov
jc
peek mplot__dot.cn
pop
word generator.const.gcn.219 2
pushc generator.const.gcn.219
word generator.const.gcn.220 2
pushc generator.const.gcn.220
push mplot__dot.cn
pushc vtable__im
swp
pushai
push mplot__dot.this
peek global.this
pushc vtable__offsety
swp
pushai
word generator.const.gcn.221 1
pushcp generator.const.gcn.221
push global.arg_counter
mov
jc
push mplot__dot.cn
pushc vtable__re
swp
pushai
push mplot__dot.this
peek global.this
pushc vtable__offsetx
swp
pushai
word generator.const.gcn.222 1
pushcp generator.const.gcn.222
push global.arg_counter
mov
jc
push structure_instance_graph
peek global.this
pushc vtable__fillellipse
swp
pushai
word generator.const.gcn.218 4
pushcp generator.const.gcn.218
push global.arg_counter
mov
jc
generator.if.gcn.211.end:
jr
mplot__dot__end:
pushcp mplot__function__end
jp
mplot__function:
@mplot__function.this
@mplot__function.fun
@mplot__function.from
@mplot__function.to
@mplot__function.step
@mplot__function.first
@mplot__function.i
@mplot__function.r
@mplot__function.e
peek mplot__function.fun
pop
peek mplot__function.from
pop
peek mplot__function.to
pop
peek mplot__function.step
pop
push global.this
peek mplot__function.this
pop
pushc true
peek mplot__function.first
pop
push mplot__function.from
pushc copy
word generator.const.gcn.223 1
pushcp generator.const.gcn.223
push global.arg_counter
mov
jc
peek mplot__function.i
pop
generator.while.gcn.224.start:
pushcp generator.while.gcn.224.end
push mplot__function.to
push mplot__function.i
swp
bg
jz
pop
pushcp generator.try.gcn.225.finally
pushcp generator.try.gcn.225.catch
tr
push mplot__function.i
push mplot__function.fun
word generator.const.gcn.226 1
pushcp generator.const.gcn.226
push global.arg_counter
mov
jc
peek mplot__function.r
pop
pushcp generator.if.gcn.227.else
push null
push mplot__function.r
eq
jz
pop
push mplot__function.this
peek global.this
pushc vtable__breakspline
swp
pushai
word generator.const.gcn.228 0
pushcp generator.const.gcn.228
push global.arg_counter
mov
jc
pushcp generator.if.gcn.227.end
jp
generator.if.gcn.227.else:
push mplot__function.r
push mplot__function.i
push mplot__function.this
peek global.this
pushc vtable__next
swp
pushai
word generator.const.gcn.229 2
pushcp generator.const.gcn.229
push global.arg_counter
mov
jc
generator.if.gcn.227.end:
generator.try.gcn.225.break:
trs
generator.try.gcn.225.catch:
pushcp system_makeexception
jc
@mplot__function.e
peek mplot__function.e
pop
push mplot__function.this
peek global.this
pushc vtable__breakspline
swp
pushai
word generator.const.gcn.230 0
pushcp generator.const.gcn.230
push global.arg_counter
mov
jc
generator.try.gcn.225.finally:
pushc gc
word generator.const.gcn.231 0
pushcp generator.const.gcn.231
push global.arg_counter
mov
jc
push mplot__function.step
push mplot__function.i
add
pop
pushcp generator.while.gcn.224.start
jp
generator.while.gcn.224.end:
pushc false
push mplot__function.this
pushc vtable__drawinginprocess
swp
peekai
jr
mplot__function__end:
pushcp mplot__draw__end
jp
mplot__draw:
@mplot__draw.this
@mplot__draw.fun
peek mplot__draw.fun
pop
push global.this
peek mplot__draw.this
pop
pushcp generator.if.gcn.232.else
pushc mplot_decart
push mplot__draw.this
pushc vtable__sctype
swp
pushai
eq
jz
pop
real generator.const.gcn.234 0.01
pushc generator.const.gcn.234
push mplot__draw.this
pushc vtable__stepsx
swp
pushai
push mplot__draw.this
pushc vtable__stepsx
swp
pushai
copy
swp
pop
neg
push mplot__draw.fun
push mplot__draw.this
peek global.this
pushc vtable__function
swp
pushai
word generator.const.gcn.233 4
pushcp generator.const.gcn.233
push global.arg_counter
mov
jc
pushcp generator.if.gcn.232.end
jp
generator.if.gcn.232.else:
real generator.const.gcn.236 0.01
pushc generator.const.gcn.236
word generator.const.gcn.237 90
pushc generator.const.gcn.237
word generator.const.gcn.238 0
pushc generator.const.gcn.238
push mplot__draw.fun
push mplot__draw.this
peek global.this
pushc vtable__function
swp
pushai
word generator.const.gcn.235 4
pushcp generator.const.gcn.235
push global.arg_counter
mov
jc
generator.if.gcn.232.end:
jr
mplot__draw__end:
pushcp system_op_range__end
jp
system_op_range:
@system_op_range.this
@system_op_range.from
@system_op_range.to
@system_op_range.isback
@system_op_range.l
@system_op_range.res
@system_op_range.i
@system_op_range.j
peek system_op_range.from
pop
peek system_op_range.to
pop
push system_op_range.to
push system_op_range.from
bg
peek system_op_range.isback
pop
pushcp generator.if.gcn.239.else
push system_op_range.isback
jz
pop
word generator.const.gcn.240 1
pushc generator.const.gcn.240
push system_op_range.to
push system_op_range.from
copy
swp
pop
sub
copy
swp
pop
add
peek system_op_range.l
pop
pushcp generator.if.gcn.239.end
jp
generator.if.gcn.239.else:
word generator.const.gcn.241 1
pushc generator.const.gcn.241
push system_op_range.from
push system_op_range.to
copy
swp
pop
sub
copy
swp
pop
add
peek system_op_range.l
pop
generator.if.gcn.239.end:
push system_op_range.l
word generator.const.gcn.242 1
pushcp generator.const.gcn.242
newa
peek system_op_range.res
pop
word generator.const.gcn.243 0
pushc generator.const.gcn.243
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.244 1
pushcp generator.const.gcn.244
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.245.start:
pushcp generator.while.gcn.245.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.246 1
pushcp generator.const.gcn.246
push global.arg_counter
mov
jc
push system_op_range.res
push system_op_range.i
swp
peekai
push system_op_range.i
inc
pop
pushcp generator.if.gcn.247.else
push system_op_range.isback
jz
pop
word generator.const.gcn.248 1
pushc generator.const.gcn.248
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.247.end
jp
generator.if.gcn.247.else:
word generator.const.gcn.249 1
pushc generator.const.gcn.249
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.247.end:
pushcp generator.while.gcn.245.start
jp
generator.while.gcn.245.end:
push system_op_range.res
jr
jr
system_op_range__end:
pushcp system_op_in__end
jp
system_op_in:
@system_op_in.this
@system_op_in.left
@system_op_in.right
peek system_op_in.left
pop
peek system_op_in.right
pop
push null
push system_op_in.left
push system_op_in.right
pushc indexof
word generator.const.gcn.250 2
pushcp generator.const.gcn.250
push global.arg_counter
mov
jc
eq
not
jr
jr
system_op_in__end:
pushcp system_op_argsarr__end
jp
system_op_argsarr:
@system_op_argsarr.this
@system_op_argsarr.argcount
@system_op_argsarr.tmp
@system_op_argsarr.t
@system_op_argsarr.argset
peek system_op_argsarr.argcount
pop
push null
peek system_op_argsarr.tmp
pop
word generator.const.gcn.251 0
pushc generator.const.gcn.251
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.252 1
pushcp generator.const.gcn.252
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.253.start:
pushcp generator.while.gcn.253.end
push system_op_argsarr.argcount
push system_op_argsarr.t
swp
bg
jz
pop
peek system_op_argsarr.tmp
pop
push system_op_argsarr.tmp
push system_op_argsarr.argset
push system_op_argsarr.t
swp
peekai
push system_op_argsarr.t
inc
pop
pushcp generator.while.gcn.253.start
jp
generator.while.gcn.253.end:
push system_op_argsarr.argset
jr
jr
system_op_argsarr__end:
pushcp len__end
jp
len:
@len.this
@len.array
peek len.array
pop
push len.array
alen
jr
len__end:
pushcp setlen__end
jp
setlen:
@setlen.this
@setlen.array
@setlen.new_length
peek setlen.array
pop
peek setlen.new_length
pop
push setlen.array
push setlen.new_length
salen
pop
jr
setlen__end:
pushcp typeof__end
jp
typeof:
@typeof.this
@typeof.object
@typeof.t
peek typeof.object
pop
push null
peek typeof.t
pop
push typeof.object
typeof
peek typeof.t
pop
pushcp generator.if.gcn.254.else
word generator.const.gcn.255 255
pushc generator.const.gcn.255
push typeof.t
eq
jz
pop
push null
jr
generator.if.gcn.254.else:
push typeof.t
jr
jr
typeof__end:
pushcp system_op_is__end
jp
system_op_is:
@system_op_is.this
@system_op_is.left
@system_op_is.right
@system_op_is.t
peek system_op_is.left
pop
peek system_op_is.right
pop
push system_op_is.left
pushc typeof
word generator.const.gcn.256 1
pushcp generator.const.gcn.256
push global.arg_counter
mov
jc
peek system_op_is.t
pop
pushcp generator.if.gcn.257.else
pushc typeclass
push system_op_is.t
eq
jz
pop
push system_op_is.right
push system_op_is.left
pushc vtable__type
swp
pushai
eq
jr
pushcp generator.if.gcn.257.end
jp
generator.if.gcn.257.else:
push system_op_is.right
push system_op_is.t
eq
jr
generator.if.gcn.257.end:
jr
system_op_is__end:
pushcp system_copy_object__end
jp
system_copy_object:
@system_copy_object.this
@system_copy_object.object
peek system_copy_object.object
pop
push copy.object
copy
swp
pop
jr
system_copy_object__end:
pushcp system_copy_array__end
jp
system_copy_array:
@system_copy_array.this
@system_copy_array.array
@system_copy_array.l
@system_copy_array.r
@system_copy_array.i
peek system_copy_array.array
pop
push system_copy_array.array
pushc len
word generator.const.gcn.258 1
pushcp generator.const.gcn.258
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.259 1
pushcp generator.const.gcn.259
newa
peek system_copy_array.r
pop
word generator.const.gcn.260 0
pushc generator.const.gcn.260
peek system_copy_array.i
pop
generator.while.gcn.261.start:
pushcp generator.while.gcn.261.end
push system_copy_array.l
push system_copy_array.i
swp
bg
jz
pop
push system_copy_array.i
push system_copy_array.l
push system_copy_array.r
push system_copy_array.array
push system_copy_array.array
push system_copy_array.i
swp
pushai
pushc copy
word generator.const.gcn.262 1
pushcp generator.const.gcn.262
push global.arg_counter
mov
jc
push system_copy_array.r
push system_copy_array.i
swp
peekai
peek system_copy_array.array
pop
peek system_copy_array.r
pop
peek system_copy_array.l
pop
peek system_copy_array.i
pop
push system_copy_array.i
inc
pop
pushcp generator.while.gcn.261.start
jp
generator.while.gcn.261.end:
push system_copy_array.r
jr
jr
system_copy_array__end:
pushcp copy__end
jp
copy:
@copy.this
@copy.object
peek copy.object
pop
pushcp generator.if.gcn.263.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.264 1
pushcp generator.const.gcn.264
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.265 1
pushcp generator.const.gcn.265
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.263.end
jp
generator.if.gcn.263.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.266 1
pushcp generator.const.gcn.266
push global.arg_counter
mov
jc
jr
generator.if.gcn.263.end:
jr
copy__end:
pushcp gc__end
jp
gc:
@gc.this
stkdrop
gc
jr
gc__end:
pushcp ord__end
jp
ord:
@ord.this
@ord.char
peek ord.char
pop
push ord.char
chord
jr
ord__end:
pushcp _chr__end
jp
_chr:
@_chr.this
@_chr.wrd
peek _chr.wrd
pop
push _chr.wrd
ordch
jr
_chr__end:
pushcp chr__end
jp
chr:
@chr.this
@chr.chars
@chr.r
word generator.const.gcn.267 0
pushcp generator.const.gcn.267
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.268 ""
pushc generator.const.gcn.268
peek chr.r
pop
@generator.for_each.gcn.269.array
@generator.for_each.gcn.269.i
@generator.for_each.gcn.269.to
push chr.chars
peek generator.for_each.gcn.269.array
alen
peek generator.for_each.gcn.269.to
pop
pushc global.zero
peek generator.for_each.gcn.269.i
pop
generator.for_each.gcn.269.start:
pushcp generator.for_each.gcn.269.end
push generator.for_each.gcn.269.i
push generator.for_each.gcn.269.to
eq
not
jz
pop
push generator.for_each.gcn.269.i
push generator.for_each.gcn.269.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.270 1
pushcp generator.const.gcn.270
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.269.continue:
push generator.for_each.gcn.269.i
inc
pop
pushcp generator.for_each.gcn.269.start
jp
generator.for_each.gcn.269.end:
push chr.r
jr
jr
chr__end:
pushcp stack__push__end
jp
stack__push:
@stack__push.this
@stack__push.value
peek stack__push.value
pop
push global.this
peek stack__push.this
pop
push stack__push.value
jr
stack__push__end:
pushcp stack__peek__end
jp
stack__peek:
@stack__peek.this
push global.this
peek stack__peek.this
pop
jr
stack__peek__end:
pushcp stack__pop__end
jp
stack__pop:
@stack__pop.this
@stack__pop.res
push global.this
peek stack__pop.this
pop
push null
peek stack__pop.res
pop
peek stack__pop.res
pop
push stack__pop.res
jr
jr
stack__pop__end:
pushcp str__end
jp
str:
@str.this
@str.value
peek str.value
pop
push str.value
pushc typeof
word generator.const.gcn.272 1
pushcp generator.const.gcn.272
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.273.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.271.end
jp
generator.case.gcn.273.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.274.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.271.end
jp
generator.case.gcn.274.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.275.end
swp
jz
push str.value
pushc f2s
invoke
jr
pushcp generator.switch.gcn.271.end
jp
generator.case.gcn.275.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.276.end
swp
jz
push str.value
jr
pushcp generator.switch.gcn.271.end
jp
generator.case.gcn.276.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.278 "Invalid type cast via str()."
pushc generator.const.gcn.278
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.277 1
pushcp generator.const.gcn.277
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.271.end:
jr
str__end:
pushcp int__end
jp
int:
@int.this
@int.value
peek int.value
pop
push int.value
pushc typeof
word generator.const.gcn.280 1
pushcp generator.const.gcn.280
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.281.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.279.end
jp
generator.case.gcn.281.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.282.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.279.end
jp
generator.case.gcn.282.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.283.end
swp
jz
word generator.const.gcn.284 1
pushc generator.const.gcn.284
push int.value
copy
swp
pop
idiv
jr
pushcp generator.switch.gcn.279.end
jp
generator.case.gcn.283.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.285.end
swp
jz
push int.value
pushc s2i
invoke
jr
pushcp generator.switch.gcn.279.end
jp
generator.case.gcn.285.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.287 "Invalid type cast via int()."
pushc generator.const.gcn.287
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.286 1
pushcp generator.const.gcn.286
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.279.end:
jr
int__end:
pushcp real__end
jp
real:
@real.this
@real.value
peek real.value
pop
push real.value
pushc typeof
word generator.const.gcn.289 1
pushcp generator.const.gcn.289
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.290.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.288.end
jp
generator.case.gcn.290.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.291.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.288.end
jp
generator.case.gcn.291.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.292.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.288.end
jp
generator.case.gcn.292.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.293.end
swp
jz
push real.value
pushc s2f
invoke
jr
pushcp generator.switch.gcn.288.end
jp
generator.case.gcn.293.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.295 "Invalid type cast via int()."
pushc generator.const.gcn.295
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.294 1
pushcp generator.const.gcn.294
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.288.end:
jr
real__end:
pushcp check__end
jp
check:
@check.this
@check.cond
@check.rtrue
@check.rfalse
peek check.cond
pop
peek check.rtrue
pop
peek check.rfalse
pop
pushcp generator.if.gcn.296.else
push check.cond
jz
pop
push check.rtrue
jr
pushcp generator.if.gcn.296.end
jp
generator.if.gcn.296.else:
push check.rfalse
jr
generator.if.gcn.296.end:
jr
check__end:
pushcp between__end
jp
between:
@between.this
@between.value
@between.left
@between.right
@between._
peek between.value
pop
peek between.left
pop
peek between.right
pop
pushcp generator.if.gcn.297.else
push between.right
push between.left
bg
jz
pop
push between.left
peek between._
pop
push between.left
peek between.right
pop
push between._
peek between.left
pop
generator.if.gcn.297.else:
word generator.const.gcn.298 2
pushcp generator.const.gcn.298
word generator.const.gcn.299 1
pushcp generator.const.gcn.299
newa
pcopy
push between.left
swp
word generator.const.gcn.300 0
pushcp generator.const.gcn.300
swp
peekai
pcopy
push between.right
swp
word generator.const.gcn.301 1
pushcp generator.const.gcn.301
swp
peekai
push between.value
pushcp system_op_in
jc
push between.right
push between.value
swp
bg
push between.left
push between.value
bg
copy
swp
pop
and
copy
swp
pop
or
jr
jr
between__end:
pushcp maxfromarray__end
jp
maxfromarray:
@maxfromarray.this
@maxfromarray.arr
@maxfromarray.r
peek maxfromarray.arr
pop
pushcp generator.if.gcn.302.else
word generator.const.gcn.303 0
pushc generator.const.gcn.303
push maxfromarray.arr
pushc len
word generator.const.gcn.304 1
pushcp generator.const.gcn.304
push global.arg_counter
mov
jc
bg
jz
pop
push maxfromarray.arr
word generator.const.gcn.305 0
pushc generator.const.gcn.305
swp
pushai
peek maxfromarray.r
pop
@generator.for_each.gcn.306.array
@generator.for_each.gcn.306.i
@generator.for_each.gcn.306.to
push maxfromarray.arr
peek generator.for_each.gcn.306.array
alen
peek generator.for_each.gcn.306.to
pop
pushc global.zero
peek generator.for_each.gcn.306.i
pop
generator.for_each.gcn.306.start:
pushcp generator.for_each.gcn.306.end
push generator.for_each.gcn.306.i
push generator.for_each.gcn.306.to
eq
not
jz
pop
push generator.for_each.gcn.306.i
push generator.for_each.gcn.306.array
pushai
@maxfromarray.x
peek maxfromarray.x
pop
pushcp generator.if.gcn.307.else
push maxfromarray.r
push maxfromarray.x
bg
jz
pop
push maxfromarray.x
push maxfromarray.r
mov
generator.if.gcn.307.else:
generator.for_each.gcn.306.continue:
push generator.for_each.gcn.306.i
inc
pop
pushcp generator.for_each.gcn.306.start
jp
generator.for_each.gcn.306.end:
push maxfromarray.r
jr
pushcp generator.if.gcn.302.end
jp
generator.if.gcn.302.else:
push null
jr
generator.if.gcn.302.end:
jr
maxfromarray__end:
pushcp minfromarray__end
jp
minfromarray:
@minfromarray.this
@minfromarray.arr
@minfromarray.r
peek minfromarray.arr
pop
pushcp generator.if.gcn.308.else
word generator.const.gcn.309 0
pushc generator.const.gcn.309
push minfromarray.arr
pushc len
word generator.const.gcn.310 1
pushcp generator.const.gcn.310
push global.arg_counter
mov
jc
bg
jz
pop
push minfromarray.arr
word generator.const.gcn.311 0
pushc generator.const.gcn.311
swp
pushai
peek minfromarray.r
pop
@generator.for_each.gcn.312.array
@generator.for_each.gcn.312.i
@generator.for_each.gcn.312.to
push minfromarray.arr
peek generator.for_each.gcn.312.array
alen
peek generator.for_each.gcn.312.to
pop
pushc global.zero
peek generator.for_each.gcn.312.i
pop
generator.for_each.gcn.312.start:
pushcp generator.for_each.gcn.312.end
push generator.for_each.gcn.312.i
push generator.for_each.gcn.312.to
eq
not
jz
pop
push generator.for_each.gcn.312.i
push generator.for_each.gcn.312.array
pushai
@minfromarray.x
peek minfromarray.x
pop
pushcp generator.if.gcn.313.else
push minfromarray.r
push minfromarray.x
swp
bg
jz
pop
push minfromarray.x
push minfromarray.r
mov
generator.if.gcn.313.else:
generator.for_each.gcn.312.continue:
push generator.for_each.gcn.312.i
inc
pop
pushcp generator.for_each.gcn.312.start
jp
generator.for_each.gcn.312.end:
push minfromarray.r
jr
pushcp generator.if.gcn.308.end
jp
generator.if.gcn.308.else:
push null
jr
generator.if.gcn.308.end:
jr
minfromarray__end:
pushcp max__end
jp
max:
@max.this
@max.args
@max.l
@max.first
@max.r
@max.i
@max.t
@max._
word generator.const.gcn.314 0
pushcp generator.const.gcn.314
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
push max.args
pushc len
word generator.const.gcn.315 1
pushcp generator.const.gcn.315
push global.arg_counter
mov
jc
peek max.l
pop
pushcp generator.if.gcn.316.else
word generator.const.gcn.317 0
pushc generator.const.gcn.317
push max.l
bg
jz
pop
push max.args
word generator.const.gcn.318 0
pushc generator.const.gcn.318
swp
pushai
peek max.first
pop
pushcp generator.if.gcn.319.else
pushc typearray
push max.first
pushcp system_op_is
jc
jz
pop
push max.first
pushc maxfromarray
word generator.const.gcn.320 1
pushcp generator.const.gcn.320
push global.arg_counter
mov
jc
peek max.r
pop
pushcp generator.if.gcn.319.end
jp
generator.if.gcn.319.else:
push max.first
peek max.r
pop
generator.if.gcn.319.end:
word generator.const.gcn.321 1
pushc generator.const.gcn.321
peek max.i
pop
generator.while.gcn.322.start:
pushcp generator.while.gcn.322.end
push max.l
push max.i
swp
bg
jz
pop
push max.args
push max.i
swp
pushai
peek max.t
pop
pushcp generator.if.gcn.323.else
pushc typearray
push max.t
pushcp system_op_is
jc
jz
pop
push max.t
pushc maxfromarray
word generator.const.gcn.324 1
pushcp generator.const.gcn.324
push global.arg_counter
mov
jc
peek max._
pop
pushcp generator.if.gcn.325.else
push max.r
push max._
bg
jz
pop
push max._
push max.r
mov
generator.if.gcn.325.else:
pushcp generator.if.gcn.323.end
jp
generator.if.gcn.323.else:
pushcp generator.if.gcn.326.else
push max.r
push max.t
bg
jz
pop
push max.t
push max.r
mov
generator.if.gcn.326.else:
generator.if.gcn.323.end:
push max.i
inc
pop
pushcp generator.while.gcn.322.start
jp
generator.while.gcn.322.end:
push max.r
jr
pushcp generator.if.gcn.316.end
jp
generator.if.gcn.316.else:
push null
jr
generator.if.gcn.316.end:
jr
max__end:
pushcp min__end
jp
min:
@min.this
@min.args
@min.l
@min.first
@min.r
@min.i
@min.t
@min._
word generator.const.gcn.327 0
pushcp generator.const.gcn.327
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
push min.args
pushc len
word generator.const.gcn.328 1
pushcp generator.const.gcn.328
push global.arg_counter
mov
jc
peek min.l
pop
pushcp generator.if.gcn.329.else
word generator.const.gcn.330 0
pushc generator.const.gcn.330
push min.l
bg
jz
pop
push min.args
word generator.const.gcn.331 0
pushc generator.const.gcn.331
swp
pushai
peek min.first
pop
pushcp generator.if.gcn.332.else
pushc typearray
push min.first
pushcp system_op_is
jc
jz
pop
push min.first
pushc minfromarray
word generator.const.gcn.333 1
pushcp generator.const.gcn.333
push global.arg_counter
mov
jc
peek min.r
pop
pushcp generator.if.gcn.332.end
jp
generator.if.gcn.332.else:
push min.first
peek min.r
pop
generator.if.gcn.332.end:
word generator.const.gcn.334 1
pushc generator.const.gcn.334
peek min.i
pop
push min.args
pushc len
word generator.const.gcn.335 1
pushcp generator.const.gcn.335
push global.arg_counter
mov
jc
peek min.l
pop
generator.while.gcn.336.start:
pushcp generator.while.gcn.336.end
push min.l
push min.i
swp
bg
jz
pop
push min.args
push min.i
swp
pushai
peek min.t
pop
pushcp generator.if.gcn.337.else
pushc typearray
push min.t
pushcp system_op_is
jc
jz
pop
push min.t
pushc minfromarray
word generator.const.gcn.338 1
pushcp generator.const.gcn.338
push global.arg_counter
mov
jc
peek min._
pop
pushcp generator.if.gcn.339.else
push min.r
push min._
swp
bg
jz
pop
push min._
push min.r
mov
generator.if.gcn.339.else:
pushcp generator.if.gcn.337.end
jp
generator.if.gcn.337.else:
pushcp generator.if.gcn.340.else
push min.r
push min.t
swp
bg
jz
pop
push min.t
push min.r
mov
generator.if.gcn.340.else:
generator.if.gcn.337.end:
push min.i
inc
pop
pushcp generator.while.gcn.336.start
jp
generator.while.gcn.336.end:
push min.r
jr
pushcp generator.if.gcn.329.end
jp
generator.if.gcn.329.else:
push null
jr
generator.if.gcn.329.end:
jr
min__end:
pushcp append__end
jp
append:
@append.this
@append.array
@append.values
@append.i
@append.nl
peek append.array
pop
word generator.const.gcn.341 1
pushcp generator.const.gcn.341
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek append.values
pop
push append.array
pushc len
word generator.const.gcn.342 1
pushcp generator.const.gcn.342
push global.arg_counter
mov
jc
peek append.i
pop
push append.values
pushc len
word generator.const.gcn.343 1
pushcp generator.const.gcn.343
push global.arg_counter
mov
jc
push append.i
copy
swp
pop
add
peek append.nl
pop
push append.nl
push append.array
pushc setlen
word generator.const.gcn.344 2
pushcp generator.const.gcn.344
push global.arg_counter
mov
jc
@generator.for_each.gcn.345.array
@generator.for_each.gcn.345.i
@generator.for_each.gcn.345.to
push append.values
peek generator.for_each.gcn.345.array
alen
peek generator.for_each.gcn.345.to
pop
pushc global.zero
peek generator.for_each.gcn.345.i
pop
generator.for_each.gcn.345.start:
pushcp generator.for_each.gcn.345.end
push generator.for_each.gcn.345.i
push generator.for_each.gcn.345.to
eq
not
jz
pop
push generator.for_each.gcn.345.i
push generator.for_each.gcn.345.array
pushai
@append.v
peek append.v
pop
push append.v
push append.array
push append.i
swp
peekai
push append.i
inc
pop
generator.for_each.gcn.345.continue:
push generator.for_each.gcn.345.i
inc
pop
pushcp generator.for_each.gcn.345.start
jp
generator.for_each.gcn.345.end:
push append.array
jr
jr
append__end:
pushcp reverse__end
jp
reverse:
@reverse.this
@reverse.array
@reverse.l
@reverse.hl
@reverse.i
@reverse._
peek reverse.array
pop
push reverse.array
pushc len
word generator.const.gcn.346 1
pushcp generator.const.gcn.346
push global.arg_counter
mov
jc
peek reverse.l
pop
word generator.const.gcn.347 2
pushc generator.const.gcn.347
push reverse.l
copy
swp
pop
idiv
peek reverse.hl
pop
word generator.const.gcn.348 0
pushc generator.const.gcn.348
peek reverse.i
pop
generator.while.gcn.349.start:
pushcp generator.while.gcn.349.end
push reverse.hl
push reverse.i
swp
bg
jz
pop
push reverse.array
word generator.const.gcn.350 1
pushc generator.const.gcn.350
push reverse.i
push reverse.l
copy
swp
pop
sub
copy
swp
pop
sub
swp
pushai
peek reverse._
pop
push reverse.array
push reverse.i
swp
pushai
push reverse.array
word generator.const.gcn.351 1
pushc generator.const.gcn.351
push reverse.i
push reverse.l
copy
swp
pop
sub
copy
swp
pop
sub
swp
peekai
push reverse._
push reverse.array
push reverse.i
swp
peekai
push reverse.i
inc
pop
pushcp generator.while.gcn.349.start
jp
generator.while.gcn.349.end:
push reverse.array
jr
jr
reverse__end:
pushcp indexof__end
jp
indexof:
@indexof.this
@indexof.array
@indexof.object
@indexof.i
peek indexof.array
pop
peek indexof.object
pop
word generator.const.gcn.352 0
pushc generator.const.gcn.352
peek indexof.i
pop
@generator.for_each.gcn.353.array
@generator.for_each.gcn.353.i
@generator.for_each.gcn.353.to
push indexof.array
peek generator.for_each.gcn.353.array
alen
peek generator.for_each.gcn.353.to
pop
pushc global.zero
peek generator.for_each.gcn.353.i
pop
generator.for_each.gcn.353.start:
pushcp generator.for_each.gcn.353.end
push generator.for_each.gcn.353.i
push generator.for_each.gcn.353.to
eq
not
jz
pop
push generator.for_each.gcn.353.i
push generator.for_each.gcn.353.array
pushai
@indexof.x
peek indexof.x
pop
pushcp generator.if.gcn.354.else
pushc typeclass
push indexof.x
pushcp system_op_is
jc
jz
pop
pushcp generator.if.gcn.355.else
push indexof.object
new
peek global.temp
movp
push global.temp
push indexof.x
new
peek global.temp
movp
push global.temp
eq
jz
pop
push indexof.i
jr
generator.if.gcn.355.else:
pushcp generator.if.gcn.354.end
jp
generator.if.gcn.354.else:
pushcp generator.if.gcn.356.else
push indexof.object
push indexof.x
eq
jz
pop
push indexof.i
jr
generator.if.gcn.356.else:
generator.if.gcn.354.end:
push indexof.i
inc
pop
generator.for_each.gcn.353.continue:
push generator.for_each.gcn.353.i
inc
pop
pushcp generator.for_each.gcn.353.start
jp
generator.for_each.gcn.353.end:
push null
jr
jr
indexof__end:
pushcp insert__end
jp
insert:
@insert.this
@insert.array
@insert.object
@insert.index
@insert.l
peek insert.array
pop
peek insert.object
pop
peek insert.index
pop
push insert.array
pushc len
word generator.const.gcn.357 1
pushcp generator.const.gcn.357
push global.arg_counter
mov
jc
peek insert.l
pop
word generator.const.gcn.359 1
pushc generator.const.gcn.359
push insert.l
copy
swp
pop
add
push insert.array
pushc setlen
word generator.const.gcn.358 2
pushcp generator.const.gcn.358
push global.arg_counter
mov
jc
generator.while.gcn.360.start:
pushcp generator.while.gcn.360.end
push insert.index
push insert.l
bg
jz
pop
push insert.array
word generator.const.gcn.361 1
pushc generator.const.gcn.361
push insert.l
copy
swp
pop
sub
swp
pushai
push insert.array
push insert.l
swp
peekai
push insert.l
dec
pop
pushcp generator.while.gcn.360.start
jp
generator.while.gcn.360.end:
push insert.object
push insert.array
push insert.index
swp
peekai
push insert.array
jr
jr
insert__end:
pushcp delete__end
jp
delete:
@delete.this
@delete.array
@delete.index
@delete.i
@delete.l
peek delete.array
pop
peek delete.index
pop
push delete.index
pushc copy
word generator.const.gcn.362 1
pushcp generator.const.gcn.362
push global.arg_counter
mov
jc
peek delete.i
pop
word generator.const.gcn.363 1
pushc generator.const.gcn.363
push delete.array
pushc len
word generator.const.gcn.364 1
pushcp generator.const.gcn.364
push global.arg_counter
mov
jc
copy
swp
pop
sub
peek delete.l
pop
generator.while.gcn.365.start:
pushcp generator.while.gcn.365.end
push delete.l
push delete.i
swp
bg
jz
pop
push delete.array
word generator.const.gcn.366 1
pushc generator.const.gcn.366
push delete.i
copy
swp
pop
add
swp
pushai
push delete.array
push delete.i
swp
peekai
push delete.i
inc
pop
pushcp generator.while.gcn.365.start
jp
generator.while.gcn.365.end:
push delete.i
push delete.array
pushc setlen
word generator.const.gcn.367 2
pushcp generator.const.gcn.367
push global.arg_counter
mov
jc
push delete.array
jr
jr
delete__end:
pushcp remove__end
jp
remove:
@remove.this
@remove.array
@remove.object
@remove.index
peek remove.array
pop
peek remove.object
pop
push remove.object
push remove.array
pushc indexof
word generator.const.gcn.368 2
pushcp generator.const.gcn.368
push global.arg_counter
mov
jc
peek remove.index
pop
pushcp generator.if.gcn.369.else
push null
push remove.index
eq
not
jz
pop
push remove.index
push remove.array
pushc delete
word generator.const.gcn.370 2
pushcp generator.const.gcn.370
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.369.end
jp
generator.if.gcn.369.else:
push remove.array
jr
generator.if.gcn.369.end:
jr
remove__end:
pushcp clear__end
jp
clear:
@clear.this
@clear.array
peek clear.array
pop
word generator.const.gcn.372 0
pushc generator.const.gcn.372
push clear.array
pushc setlen
word generator.const.gcn.371 2
pushcp generator.const.gcn.371
push global.arg_counter
mov
jc
push clear.array
jr
jr
clear__end:
pushcp __initproc____end
jp
__initproc__:
@__initproc__.this
@__initproc__.argc
@__initproc__.local_i
@__initproc__.local_a
word generator.const.gcn.373 0
pushc generator.const.gcn.373
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.374 1
pushcp generator.const.gcn.374
newa
peek params
pop
word generator.const.gcn.375 0
pushc generator.const.gcn.375
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.376.start:
pushcp generator.while.gcn.376.end
push __initproc__.argc
push __initproc__.local_i
swp
bg
jz
pop
peek __initproc__.local_a
pop
push __initproc__.local_a
push params
push __initproc__.local_i
swp
peekai
push __initproc__.local_i
inc
pop
pushcp generator.while.gcn.376.start
jp
generator.while.gcn.376.end:
jr
__initproc____end:
pushcp exception__create__end
jp
exception__create:
@exception__create.this
@exception__create.message
peek exception__create.message
pop
push global.this
peek exception__create.this
pop
pushc eraisedexception
push exception__create.this
pushc vtable__classname
swp
peekai
push exception__create.message
push exception__create.this
pushc vtable__message
swp
peekai
jr
exception__create__end:
pushcp exception__tostring__end
jp
exception__tostring:
@exception__tostring.this
push global.this
peek exception__tostring.this
pop
str generator.const.gcn.377 "'."
pushc generator.const.gcn.377
push exception__tostring.this
pushc vtable__message
swp
pushai
str generator.const.gcn.378 ">, message: '"
pushc generator.const.gcn.378
push exception__tostring.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.379 "Exception <"
pushc generator.const.gcn.379
copy
swp
pop
add
copy
swp
pop
add
copy
swp
pop
add
copy
swp
pop
add
jr
jr
exception__tostring__end:
pushcp system_makeexception__end
jp
system_makeexception:
@system_makeexception.this
@system_makeexception.classname
@system_makeexception.message
@system_makeexception.e
peek system_makeexception.classname
pop
peek system_makeexception.message
pop
pushcp generator.if.gcn.380.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.380.end
jp
generator.if.gcn.380.else:
pushcp __allocator__exception
jc
peek system_makeexception.e
pop
push system_makeexception.classname
push system_makeexception.e
pushc vtable__classname
swp
peekai
push system_makeexception.message
push system_makeexception.e
pushc vtable__message
swp
peekai
push system_makeexception.e
jr
generator.if.gcn.380.end:
jr
system_makeexception__end:
pushcp sin__end
jp
sin:
@sin.this
pushc _sin
invoke
jr
sin__end:
pushcp cos__end
jp
cos:
@cos.this
pushc _cos
invoke
jr
cos__end:
pushcp tg__end
jp
tg:
@tg.this
pushc _tg
invoke
jr
tg__end:
pushcp ctg__end
jp
ctg:
@ctg.this
pushc _ctg
invoke
jr
ctg__end:
pushcp arcsin__end
jp
arcsin:
@arcsin.this
pushc _arcsin
invoke
jr
arcsin__end:
pushcp arccos__end
jp
arccos:
@arccos.this
pushc _arccos
invoke
jr
arccos__end:
pushcp arctg__end
jp
arctg:
@arctg.this
pushc _arctg
invoke
jr
arctg__end:
pushcp log10__end
jp
log10:
@log10.this
pushc _log10
invoke
jr
log10__end:
pushcp log2__end
jp
log2:
@log2.this
pushc _log2
invoke
jr
log2__end:
pushcp logn__end
jp
logn:
@logn.this
pushc _logn
invoke
jr
logn__end:
pushcp lnxp1__end
jp
lnxp1:
@lnxp1.this
pushc _lnxp1
invoke
jr
lnxp1__end:
pushcp exp__end
jp
exp:
@exp.this
pushc _exp
invoke
jr
exp__end:
pushcp trunc__end
jp
trunc:
@trunc.this
@trunc.a
peek trunc.a
pop
word generator.const.gcn.381 1
pushc generator.const.gcn.381
push trunc.a
copy
swp
pop
idiv
jr
trunc__end:
pushcp frac__end
jp
frac:
@frac.this
@frac.a
peek frac.a
pop
word generator.const.gcn.382 1
pushc generator.const.gcn.382
push frac.a
copy
swp
pop
idiv
push frac.a
copy
swp
pop
sub
jr
frac__end:
pushcp round__end
jp
round:
@round.this
@round.a
peek round.a
pop
real generator.const.gcn.384 0.5
pushc generator.const.gcn.384
push round.a
copy
swp
pop
add
pushc trunc
word generator.const.gcn.383 1
pushcp generator.const.gcn.383
push global.arg_counter
mov
jc
jr
round__end:
pushcp ceil__end
jp
ceil:
@ceil.this
@ceil.a
peek ceil.a
pop
real generator.const.gcn.386 0.999999
pushc generator.const.gcn.386
push ceil.a
copy
swp
pop
add
pushc trunc
word generator.const.gcn.385 1
pushcp generator.const.gcn.385
push global.arg_counter
mov
jc
jr
ceil__end:
pushcp abs__end
jp
abs:
@abs.this
@abs.a
peek abs.a
pop
pushcp generator.if.gcn.387.else
word generator.const.gcn.388 0
pushc generator.const.gcn.388
push abs.a
bg
jz
pop
push abs.a
pushcp generator.if.gcn.387.end
jp
generator.if.gcn.387.else:
push abs.a
copy
swp
pop
neg
generator.if.gcn.387.end:
jr
abs__end:
pushcp sgn__end
jp
sgn:
@sgn.this
@sgn.a
peek sgn.a
pop
pushcp generator.if.gcn.389.else
word generator.const.gcn.390 0
pushc generator.const.gcn.390
push sgn.a
eq
jz
pop
word generator.const.gcn.391 0
pushc generator.const.gcn.391
jr
generator.if.gcn.389.else:
pushcp generator.if.gcn.392.else
word generator.const.gcn.393 0
pushc generator.const.gcn.393
push sgn.a
swp
bg
jz
pop
word generator.const.gcn.394 1
pushc generator.const.gcn.394
copy
swp
pop
neg
jr
pushcp generator.if.gcn.392.end
jp
generator.if.gcn.392.else:
word generator.const.gcn.395 1
pushc generator.const.gcn.395
jr
generator.if.gcn.392.end:
jr
sgn__end:
pushcp log__end
jp
log:
@log.this
@log.a
peek log.a
pop
push log.a
pushc m_e
pushc logn
word generator.const.gcn.396 2
pushcp generator.const.gcn.396
push global.arg_counter
mov
jc
jr
log__end:
pushcp power__end
jp
power:
@power.this
@power.a
@power.n
peek power.a
pop
peek power.n
pop
pushcp generator.if.gcn.397.else
word generator.const.gcn.398 0
pushc generator.const.gcn.398
push power.n
eq
jz
pop
word generator.const.gcn.399 1
pushc generator.const.gcn.399
jr
pushcp generator.if.gcn.397.end
jp
generator.if.gcn.397.else:
pushcp generator.if.gcn.400.else
word generator.const.gcn.401 0
pushc generator.const.gcn.401
push power.a
eq
jz
pop
word generator.const.gcn.402 0
pushc generator.const.gcn.402
jr
pushcp generator.if.gcn.400.end
jp
generator.if.gcn.400.else:
push power.n
push power.a
pushc log
word generator.const.gcn.404 1
pushcp generator.const.gcn.404
push global.arg_counter
mov
jc
copy
swp
pop
mul
pushc exp
word generator.const.gcn.403 1
pushcp generator.const.gcn.403
push global.arg_counter
mov
jc
jr
generator.if.gcn.400.end:
generator.if.gcn.397.end:
jr
power__end:
pushcp intpower__end
jp
intpower:
@intpower.this
@intpower.a
@intpower.n
peek intpower.a
pop
peek intpower.n
pop
push intpower.n
push intpower.a
pushc power
word generator.const.gcn.406 2
pushcp generator.const.gcn.406
push global.arg_counter
mov
jc
pushc round
word generator.const.gcn.405 1
pushcp generator.const.gcn.405
push global.arg_counter
mov
jc
jr
intpower__end:
pushcp sqrt__end
jp
sqrt:
@sqrt.this
@sqrt.a
peek sqrt.a
pop
pushcp generator.if.gcn.407.else
word generator.const.gcn.408 0
pushc generator.const.gcn.408
push sqrt.a
be
jz
pop
real generator.const.gcn.410 0.5
pushc generator.const.gcn.410
push sqrt.a
pushc power
word generator.const.gcn.409 2
pushcp generator.const.gcn.409
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.407.end
jp
generator.if.gcn.407.else:
push null
jr
generator.if.gcn.407.end:
jr
sqrt__end:
pushcp factorial__end
jp
factorial:
@factorial.this
@factorial.a
@factorial.r
@factorial.i
peek factorial.a
pop
word generator.const.gcn.411 1
pushc generator.const.gcn.411
peek factorial.r
pop
word generator.const.gcn.412 0
pushc generator.const.gcn.412
peek factorial.i
pop
generator.while.gcn.413.start:
pushcp generator.while.gcn.413.end
push factorial.a
push factorial.i
swp
bg
jz
pop
word generator.const.gcn.414 1
pushc generator.const.gcn.414
push factorial.i
copy
swp
pop
add
push factorial.r
mul
pop
push factorial.i
inc
pop
pushcp generator.while.gcn.413.start
jp
generator.while.gcn.413.end:
push factorial.r
jr
jr
factorial__end:
pushcp hypot__end
jp
hypot:
@hypot.this
@hypot.w
@hypot.h
peek hypot.w
pop
peek hypot.h
pop
push hypot.h
push hypot.h
copy
swp
pop
mul
push hypot.w
push hypot.w
copy
swp
pop
mul
copy
swp
pop
add
pushc sqrt
word generator.const.gcn.415 1
pushcp generator.const.gcn.415
push global.arg_counter
mov
jc
jr
hypot__end:
pushcp radians__end
jp
radians:
@radians.this
@radians.a
peek radians.a
pop
pushc m_pi
word generator.const.gcn.416 180
pushc generator.const.gcn.416
copy
swp
pop
div
push radians.a
copy
swp
pop
mul
jr
radians__end:
pushcp degrees__end
jp
degrees:
@degrees.this
@degrees.a
peek degrees.a
pop
word generator.const.gcn.417 180
pushc generator.const.gcn.417
pushc m_pi
copy
swp
pop
div
push degrees.a
copy
swp
pop
mul
jr
degrees__end:
pushcp sinh__end
jp
sinh:
@sinh.this
@sinh.a
peek sinh.a
pop
word generator.const.gcn.418 2
pushc generator.const.gcn.418
push sinh.a
copy
swp
pop
neg
pushc m_e
pushc power
word generator.const.gcn.419 2
pushcp generator.const.gcn.419
push global.arg_counter
mov
jc
push sinh.a
pushc m_e
pushc power
word generator.const.gcn.420 2
pushcp generator.const.gcn.420
push global.arg_counter
mov
jc
copy
swp
pop
sub
copy
swp
pop
div
jr
sinh__end:
pushcp cosh__end
jp
cosh:
@cosh.this
@cosh.a
peek cosh.a
pop
word generator.const.gcn.421 2
pushc generator.const.gcn.421
push cosh.a
copy
swp
pop
neg
pushc m_e
pushc power
word generator.const.gcn.422 2
pushcp generator.const.gcn.422
push global.arg_counter
mov
jc
push cosh.a
pushc m_e
pushc power
word generator.const.gcn.423 2
pushcp generator.const.gcn.423
push global.arg_counter
mov
jc
copy
swp
pop
add
copy
swp
pop
div
jr
cosh__end:
pushcp cosech__end
jp
cosech:
@cosech.this
@cosech.a
peek cosech.a
pop
push cosech.a
pushc sinh
word generator.const.gcn.424 1
pushcp generator.const.gcn.424
push global.arg_counter
mov
jc
word generator.const.gcn.425 1
pushc generator.const.gcn.425
copy
swp
pop
div
jr
cosech__end:
pushcp sech__end
jp
sech:
@sech.this
@sech.a
peek sech.a
pop
push sech.a
pushc cosh
word generator.const.gcn.426 1
pushcp generator.const.gcn.426
push global.arg_counter
mov
jc
word generator.const.gcn.427 1
pushc generator.const.gcn.427
copy
swp
pop
div
jr
sech__end:
pushcp tgh__end
jp
tgh:
@tgh.this
@tgh.a
peek tgh.a
pop
push tgh.a
pushc cosh
word generator.const.gcn.428 1
pushcp generator.const.gcn.428
push global.arg_counter
mov
jc
push tgh.a
pushc sinh
word generator.const.gcn.429 1
pushcp generator.const.gcn.429
push global.arg_counter
mov
jc
copy
swp
pop
div
jr
tgh__end:
pushcp ctgh__end
jp
ctgh:
@ctgh.this
@ctgh.a
peek ctgh.a
pop
push ctgh.a
pushc tgh
word generator.const.gcn.430 1
pushcp generator.const.gcn.430
push global.arg_counter
mov
jc
word generator.const.gcn.431 1
pushc generator.const.gcn.431
copy
swp
pop
div
jr
ctgh__end:
pushcp arcsinh__end
jp
arcsinh:
@arcsinh.this
@arcsinh.a
peek arcsinh.a
pop
word generator.const.gcn.434 1
pushc generator.const.gcn.434
push arcsinh.a
push arcsinh.a
copy
swp
pop
mul
copy
swp
pop
add
pushc sqrt
word generator.const.gcn.433 1
pushcp generator.const.gcn.433
push global.arg_counter
mov
jc
push arcsinh.a
copy
swp
pop
add
pushc log
word generator.const.gcn.432 1
pushcp generator.const.gcn.432
push global.arg_counter
mov
jc
jr
arcsinh__end:
pushcp arccosh__end
jp
arccosh:
@arccosh.this
@arccosh.a
peek arccosh.a
pop
word generator.const.gcn.437 1
pushc generator.const.gcn.437
push arccosh.a
push arccosh.a
copy
swp
pop
mul
copy
swp
pop
sub
pushc sqrt
word generator.const.gcn.436 1
pushcp generator.const.gcn.436
push global.arg_counter
mov
jc
push arccosh.a
copy
swp
pop
add
pushc log
word generator.const.gcn.435 1
pushcp generator.const.gcn.435
push global.arg_counter
mov
jc
jr
arccosh__end:
pushcp arctgh__end
jp
arctgh:
@arctgh.this
@arctgh.a
peek arctgh.a
pop
word generator.const.gcn.438 2
pushc generator.const.gcn.438
push arctgh.a
word generator.const.gcn.440 1
pushc generator.const.gcn.440
copy
swp
pop
sub
push arctgh.a
word generator.const.gcn.441 1
pushc generator.const.gcn.441
copy
swp
pop
add
copy
swp
pop
div
pushc log
word generator.const.gcn.439 1
pushcp generator.const.gcn.439
push global.arg_counter
mov
jc
copy
swp
pop
div
jr
arctgh__end:
pushcp arcctgh__end
jp
arcctgh:
@arcctgh.this
@arcctgh.a
peek arcctgh.a
pop
word generator.const.gcn.442 2
pushc generator.const.gcn.442
word generator.const.gcn.444 1
pushc generator.const.gcn.444
push arcctgh.a
copy
swp
pop
sub
word generator.const.gcn.445 1
pushc generator.const.gcn.445
push arcctgh.a
copy
swp
pop
add
copy
swp
pop
div
pushc log
word generator.const.gcn.443 1
pushcp generator.const.gcn.443
push global.arg_counter
mov
jc
copy
swp
pop
div
jr
arcctgh__end:
pushcp complex__create__end
jp
complex__create:
@complex__create.this
@complex__create.re
@complex__create.im
peek complex__create.re
pop
peek complex__create.im
pop
push global.this
peek complex__create.this
pop
push complex__create.re
push complex__create.this
pushc vtable__re
swp
peekai
push complex__create.im
push complex__create.this
pushc vtable__im
swp
peekai
jr
complex__create__end:
pushcp complex__set__end
jp
complex__set:
@complex__set.this
@complex__set.re
@complex__set.im
peek complex__set.re
pop
peek complex__set.im
pop
push global.this
peek complex__set.this
pop
push complex__set.re
push complex__set.this
pushc vtable__re
swp
pushai
mov
push complex__set.im
push complex__set.this
pushc vtable__im
swp
pushai
mov
jr
complex__set__end:
pushcp complex__tostring__end
jp
complex__tostring:
@complex__tostring.this
push global.this
peek complex__tostring.this
pop
str generator.const.gcn.447 ""
pushc generator.const.gcn.447
str generator.const.gcn.448 "0"
pushc generator.const.gcn.448
word generator.const.gcn.449 0
pushc generator.const.gcn.449
push complex__tostring.this
pushc vtable__im
swp
pushai
eq
word generator.const.gcn.450 0
pushc generator.const.gcn.450
push complex__tostring.this
pushc vtable__re
swp
pushai
eq
copy
swp
pop
and
pushc check
word generator.const.gcn.446 3
pushcp generator.const.gcn.446
push global.arg_counter
mov
jc
str generator.const.gcn.452 ""
pushc generator.const.gcn.452
str generator.const.gcn.454 "i"
pushc generator.const.gcn.454
push complex__tostring.this
pushc vtable__im
swp
pushai
str generator.const.gcn.455 ""
pushc generator.const.gcn.455
copy
swp
pop
add
copy
swp
pop
add
str generator.const.gcn.457 "-i"
pushc generator.const.gcn.457
str generator.const.gcn.458 "i"
pushc generator.const.gcn.458
word generator.const.gcn.459 0
pushc generator.const.gcn.459
push complex__tostring.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.456 3
pushcp generator.const.gcn.456
push global.arg_counter
mov
jc
word generator.const.gcn.460 1
pushc generator.const.gcn.460
push complex__tostring.this
pushc vtable__im
swp
pushai
pushc abs
word generator.const.gcn.461 1
pushcp generator.const.gcn.461
push global.arg_counter
mov
jc
eq
pushc check
word generator.const.gcn.453 3
pushcp generator.const.gcn.453
push global.arg_counter
mov
jc
str generator.const.gcn.463 ""
pushc generator.const.gcn.463
str generator.const.gcn.465 ""
pushc generator.const.gcn.465
str generator.const.gcn.466 "+"
pushc generator.const.gcn.466
word generator.const.gcn.467 0
pushc generator.const.gcn.467
push complex__tostring.this
pushc vtable__re
swp
pushai
eq
not
pushc check
word generator.const.gcn.464 3
pushcp generator.const.gcn.464
push global.arg_counter
mov
jc
word generator.const.gcn.468 0
pushc generator.const.gcn.468
push complex__tostring.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.462 3
pushcp generator.const.gcn.462
push global.arg_counter
mov
jc
copy
swp
pop
add
word generator.const.gcn.469 0
pushc generator.const.gcn.469
push complex__tostring.this
pushc vtable__im
swp
pushai
eq
not
pushc check
word generator.const.gcn.451 3
pushcp generator.const.gcn.451
push global.arg_counter
mov
jc
str generator.const.gcn.471 ""
pushc generator.const.gcn.471
push complex__tostring.this
pushc vtable__re
swp
pushai
str generator.const.gcn.472 ""
pushc generator.const.gcn.472
copy
swp
pop
add
word generator.const.gcn.473 0
pushc generator.const.gcn.473
push complex__tostring.this
pushc vtable__re
swp
pushai
eq
not
pushc check
word generator.const.gcn.470 3
pushcp generator.const.gcn.470
push global.arg_counter
mov
jc
copy
swp
pop
add
copy
swp
pop
add
jr
jr
complex__tostring__end:
pushcp complex__clone__end
jp
complex__clone:
@complex__clone.this
push global.this
peek complex__clone.this
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push complex__clone.this
pushc vtable__im
swp
pushai
swp
push complex__clone.this
pushc vtable__re
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.474 2
pushcp generator.const.gcn.474
push global.arg_counter
mov
jc
jr
jr
complex__clone__end:
pushcp complex__compareto__end
jp
complex__compareto:
@complex__compareto.this
@complex__compareto.z
peek complex__compareto.z
pop
push global.this
peek complex__compareto.this
pop
push complex__compareto.z
pushc vtable__im
swp
pushai
push complex__compareto.this
pushc vtable__im
swp
pushai
eq
push complex__compareto.z
pushc vtable__re
swp
pushai
push complex__compareto.this
pushc vtable__re
swp
pushai
eq
copy
swp
pop
and
jr
jr
complex__compareto__end:
pushcp complex__module__end
jp
complex__module:
@complex__module.this
push global.this
peek complex__module.this
pop
pushcp generator.if.gcn.475.else
word generator.const.gcn.476 0
pushc generator.const.gcn.476
push complex__module.this
pushc vtable__re
swp
pushai
eq
jz
pop
push complex__module.this
pushc vtable__im
swp
pushai
jr
generator.if.gcn.475.else:
pushcp generator.if.gcn.477.else
word generator.const.gcn.478 0
pushc generator.const.gcn.478
push complex__module.this
pushc vtable__im
swp
pushai
eq
jz
pop
push complex__module.this
pushc vtable__re
swp
pushai
jr
generator.if.gcn.477.else:
push complex__module.this
pushc vtable__im
swp
pushai
push complex__module.this
pushc vtable__im
swp
pushai
copy
swp
pop
mul
push complex__module.this
pushc vtable__re
swp
pushai
push complex__module.this
pushc vtable__re
swp
pushai
copy
swp
pop
mul
copy
swp
pop
add
pushc sqrt
word generator.const.gcn.479 1
pushcp generator.const.gcn.479
push global.arg_counter
mov
jc
jr
jr
complex__module__end:
pushcp complex__angle__end
jp
complex__angle:
@complex__angle.this
@complex__angle.fival
push global.this
peek complex__angle.this
pop
pushcp generator.if.gcn.480.else
word generator.const.gcn.481 0
pushc generator.const.gcn.481
push complex__angle.this
pushc vtable__re
swp
pushai
eq
jz
pop
word generator.const.gcn.483 2
pushc generator.const.gcn.483
pushc m_pi
copy
swp
pop
neg
copy
swp
pop
div
word generator.const.gcn.484 2
pushc generator.const.gcn.484
pushc m_pi
copy
swp
pop
div
word generator.const.gcn.485 0
pushc generator.const.gcn.485
push complex__angle.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.482 3
pushcp generator.const.gcn.482
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.480.end
jp
generator.if.gcn.480.else:
push complex__angle.this
pushc vtable__re
swp
pushai
push complex__angle.this
pushc vtable__im
swp
pushai
copy
swp
pop
div
pushc arctg
word generator.const.gcn.486 1
pushcp generator.const.gcn.486
push global.arg_counter
mov
jc
peek complex__angle.fival
pop
pushc m_pi
push complex__angle.fival
copy
swp
pop
sub
pushc m_pi
push complex__angle.fival
copy
swp
pop
add
word generator.const.gcn.489 0
pushc generator.const.gcn.489
push complex__angle.this
pushc vtable__im
swp
pushai
be
pushc check
word generator.const.gcn.488 3
pushcp generator.const.gcn.488
push global.arg_counter
mov
jc
push complex__angle.fival
word generator.const.gcn.490 0
pushc generator.const.gcn.490
push complex__angle.this
pushc vtable__re
swp
pushai
bg
pushc check
word generator.const.gcn.487 3
pushcp generator.const.gcn.487
push global.arg_counter
mov
jc
jr
generator.if.gcn.480.end:
jr
complex__angle__end:
pushcp complex__conjugate__end
jp
complex__conjugate:
@complex__conjugate.this
push global.this
peek complex__conjugate.this
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push complex__conjugate.this
pushc vtable__im
swp
pushai
copy
swp
pop
neg
swp
push complex__conjugate.this
pushc vtable__re
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.491 2
pushcp generator.const.gcn.491
push global.arg_counter
mov
jc
jr
jr
complex__conjugate__end:
pushcp cmath__unite__end
jp
cmath__unite:
@cmath__unite.this
@cmath__unite.args
word generator.const.gcn.492 0
pushcp generator.const.gcn.492
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek cmath__unite.args
pop
push global.this
peek cmath__unite.this
pop
push cmath__unite.args
pushc len
word generator.const.gcn.494 1
pushcp generator.const.gcn.494
push global.arg_counter
mov
jc
pcopy
word generator.const.gcn.496 0
pushc generator.const.gcn.496
eq
pushcp generator.case.gcn.495.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
word generator.const.gcn.498 0
pushc generator.const.gcn.498
swp
word generator.const.gcn.499 0
pushc generator.const.gcn.499
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.497 2
pushcp generator.const.gcn.497
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.493.end
jp
generator.case.gcn.495.end:
pcopy
word generator.const.gcn.501 1
pushc generator.const.gcn.501
eq
pushcp generator.case.gcn.500.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
word generator.const.gcn.503 0
pushc generator.const.gcn.503
swp
push cmath__unite.args
word generator.const.gcn.504 0
pushc generator.const.gcn.504
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.502 2
pushcp generator.const.gcn.502
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.493.end
jp
generator.case.gcn.500.end:
pcopy
word generator.const.gcn.506 2
pushc generator.const.gcn.506
eq
pushcp generator.case.gcn.505.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__unite.args
word generator.const.gcn.508 1
pushc generator.const.gcn.508
swp
pushai
swp
push cmath__unite.args
word generator.const.gcn.509 0
pushc generator.const.gcn.509
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.507 2
pushcp generator.const.gcn.507
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.493.end
jp
generator.case.gcn.505.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.511 "CMath.Unite: Invalid args."
pushc generator.const.gcn.511
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.510 1
pushcp generator.const.gcn.510
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.493.end:
jr
cmath__unite__end:
pushcp cmath__uniteim__end
jp
cmath__uniteim:
@cmath__uniteim.this
@cmath__uniteim.im
peek cmath__uniteim.im
pop
push global.this
peek cmath__uniteim.this
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__uniteim.im
swp
word generator.const.gcn.513 0
pushc generator.const.gcn.513
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.512 2
pushcp generator.const.gcn.512
push global.arg_counter
mov
jc
jr
jr
cmath__uniteim__end:
pushcp cmath__uniteviaexp__end
jp
cmath__uniteviaexp:
@cmath__uniteviaexp.this
@cmath__uniteviaexp.mod
@cmath__uniteviaexp.angl
peek cmath__uniteviaexp.mod
pop
peek cmath__uniteviaexp.angl
pop
push global.this
peek cmath__uniteviaexp.this
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__uniteviaexp.angl
pushc sin
word generator.const.gcn.515 1
pushcp generator.const.gcn.515
push global.arg_counter
mov
jc
push cmath__uniteviaexp.mod
copy
swp
pop
mul
swp
push cmath__uniteviaexp.angl
pushc cos
word generator.const.gcn.516 1
pushcp generator.const.gcn.516
push global.arg_counter
mov
jc
push cmath__uniteviaexp.mod
copy
swp
pop
mul
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.514 2
pushcp generator.const.gcn.514
push global.arg_counter
mov
jc
jr
jr
cmath__uniteviaexp__end:
pushcp cmath__add__end
jp
cmath__add:
@cmath__add.this
@cmath__add.z1
@cmath__add.z2
peek cmath__add.z1
pop
peek cmath__add.z2
pop
push global.this
peek cmath__add.this
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__add.z2
pushc vtable__im
swp
pushai
push cmath__add.z1
pushc vtable__im
swp
pushai
copy
swp
pop
add
swp
push cmath__add.z2
pushc vtable__re
swp
pushai
push cmath__add.z1
pushc vtable__re
swp
pushai
copy
swp
pop
add
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.517 2
pushcp generator.const.gcn.517
push global.arg_counter
mov
jc
jr
jr
cmath__add__end:
pushcp cmath__sub__end
jp
cmath__sub:
@cmath__sub.this
@cmath__sub.z1
@cmath__sub.z2
peek cmath__sub.z1
pop
peek cmath__sub.z2
pop
push global.this
peek cmath__sub.this
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__sub.z2
pushc vtable__im
swp
pushai
push cmath__sub.z1
pushc vtable__im
swp
pushai
copy
swp
pop
sub
swp
push cmath__sub.z2
pushc vtable__re
swp
pushai
push cmath__sub.z1
pushc vtable__re
swp
pushai
copy
swp
pop
sub
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.518 2
pushcp generator.const.gcn.518
push global.arg_counter
mov
jc
jr
jr
cmath__sub__end:
pushcp cmath__mul__end
jp
cmath__mul:
@cmath__mul.this
@cmath__mul.z1
@cmath__mul.z2
peek cmath__mul.z1
pop
peek cmath__mul.z2
pop
push global.this
peek cmath__mul.this
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__mul.z1
pushc vtable__im
swp
pushai
push cmath__mul.z2
pushc vtable__re
swp
pushai
copy
swp
pop
mul
push cmath__mul.z2
pushc vtable__im
swp
pushai
push cmath__mul.z1
pushc vtable__re
swp
pushai
copy
swp
pop
mul
copy
swp
pop
add
swp
push cmath__mul.z2
pushc vtable__im
swp
pushai
push cmath__mul.z1
pushc vtable__im
swp
pushai
copy
swp
pop
mul
push cmath__mul.z2
pushc vtable__re
swp
pushai
push cmath__mul.z1
pushc vtable__re
swp
pushai
copy
swp
pop
mul
copy
swp
pop
sub
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.519 2
pushcp generator.const.gcn.519
push global.arg_counter
mov
jc
jr
jr
cmath__mul__end:
pushcp cmath__div__end
jp
cmath__div:
@cmath__div.this
@cmath__div.z1
@cmath__div.z2
@cmath__div.top
@cmath__div.bottom
peek cmath__div.z1
pop
peek cmath__div.z2
pop
push global.this
peek cmath__div.this
pop
push cmath__div.z2
peek global.this
pushc vtable__conjugate
swp
pushai
word generator.const.gcn.521 0
pushcp generator.const.gcn.521
push global.arg_counter
mov
jc
push cmath__div.z1
push structure_instance_cmath
peek global.this
pushc vtable__mul
swp
pushai
word generator.const.gcn.520 2
pushcp generator.const.gcn.520
push global.arg_counter
mov
jc
peek cmath__div.top
pop
push cmath__div.z2
peek global.this
pushc vtable__conjugate
swp
pushai
word generator.const.gcn.523 0
pushcp generator.const.gcn.523
push global.arg_counter
mov
jc
push cmath__div.z2
push structure_instance_cmath
peek global.this
pushc vtable__mul
swp
pushai
word generator.const.gcn.522 2
pushcp generator.const.gcn.522
push global.arg_counter
mov
jc
peek cmath__div.bottom
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__div.bottom
pushc vtable__re
swp
pushai
push cmath__div.top
pushc vtable__im
swp
pushai
copy
swp
pop
div
swp
push cmath__div.bottom
pushc vtable__re
swp
pushai
push cmath__div.top
pushc vtable__re
swp
pushai
copy
swp
pop
div
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.524 2
pushcp generator.const.gcn.524
push global.arg_counter
mov
jc
jr
jr
cmath__div__end:
pushcp cmath__power__end
jp
cmath__power:
@cmath__power.this
@cmath__power.z
@cmath__power.n
@cmath__power.pn
@cmath__power.fn
peek cmath__power.z
pop
peek cmath__power.n
pop
push global.this
peek cmath__power.this
pop
push cmath__power.n
push cmath__power.z
peek global.this
pushc vtable__module
swp
pushai
word generator.const.gcn.526 0
pushcp generator.const.gcn.526
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.525 2
pushcp generator.const.gcn.525
push global.arg_counter
mov
jc
peek cmath__power.pn
pop
push cmath__power.n
push cmath__power.z
peek global.this
pushc vtable__angle
swp
pushai
word generator.const.gcn.527 0
pushcp generator.const.gcn.527
push global.arg_counter
mov
jc
copy
swp
pop
mul
peek cmath__power.fn
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__power.fn
pushc sin
word generator.const.gcn.529 1
pushcp generator.const.gcn.529
push global.arg_counter
mov
jc
push cmath__power.pn
copy
swp
pop
mul
swp
push cmath__power.fn
pushc cos
word generator.const.gcn.530 1
pushcp generator.const.gcn.530
push global.arg_counter
mov
jc
push cmath__power.pn
copy
swp
pop
mul
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.528 2
pushcp generator.const.gcn.528
push global.arg_counter
mov
jc
jr
jr
cmath__power__end:
pushcp cmath__ln__end
jp
cmath__ln:
@cmath__ln.this
@cmath__ln.z
peek cmath__ln.z
pop
push global.this
peek cmath__ln.this
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__ln.z
peek global.this
pushc vtable__angle
swp
pushai
word generator.const.gcn.532 0
pushcp generator.const.gcn.532
push global.arg_counter
mov
jc
swp
push cmath__ln.z
peek global.this
pushc vtable__module
swp
pushai
word generator.const.gcn.534 0
pushcp generator.const.gcn.534
push global.arg_counter
mov
jc
pushc log
word generator.const.gcn.533 1
pushcp generator.const.gcn.533
push global.arg_counter
mov
jc
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.531 2
pushcp generator.const.gcn.531
push global.arg_counter
mov
jc
jr
jr
cmath__ln__end:
pushcp cmath__logn__end
jp
cmath__logn:
@cmath__logn.this
@cmath__logn.z
@cmath__logn.n
peek cmath__logn.z
pop
peek cmath__logn.n
pop
push global.this
peek cmath__logn.this
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
pushc m_e
push cmath__logn.n
pushc logn
word generator.const.gcn.536 2
pushcp generator.const.gcn.536
push global.arg_counter
mov
jc
push cmath__logn.z
peek global.this
pushc vtable__angle
swp
pushai
word generator.const.gcn.537 0
pushcp generator.const.gcn.537
push global.arg_counter
mov
jc
copy
swp
pop
mul
swp
push cmath__logn.z
peek global.this
pushc vtable__module
swp
pushai
word generator.const.gcn.539 0
pushcp generator.const.gcn.539
push global.arg_counter
mov
jc
push cmath__logn.n
pushc logn
word generator.const.gcn.538 2
pushcp generator.const.gcn.538
push global.arg_counter
mov
jc
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.535 2
pushcp generator.const.gcn.535
push global.arg_counter
mov
jc
jr
jr
cmath__logn__end:
pushcp cmath__sin__end
jp
cmath__sin:
@cmath__sin.this
@cmath__sin.z
peek cmath__sin.z
pop
push global.this
peek cmath__sin.this
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__sin.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.541 1
pushcp generator.const.gcn.541
push global.arg_counter
mov
jc
push cmath__sin.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.542 1
pushcp generator.const.gcn.542
push global.arg_counter
mov
jc
copy
swp
pop
mul
swp
push cmath__sin.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.543 1
pushcp generator.const.gcn.543
push global.arg_counter
mov
jc
push cmath__sin.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.544 1
pushcp generator.const.gcn.544
push global.arg_counter
mov
jc
copy
swp
pop
mul
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.540 2
pushcp generator.const.gcn.540
push global.arg_counter
mov
jc
jr
jr
cmath__sin__end:
pushcp cmath__cos__end
jp
cmath__cos:
@cmath__cos.this
@cmath__cos.z
peek cmath__cos.z
pop
push global.this
peek cmath__cos.this
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__cos.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.546 1
pushcp generator.const.gcn.546
push global.arg_counter
mov
jc
push cmath__cos.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.547 1
pushcp generator.const.gcn.547
push global.arg_counter
mov
jc
copy
swp
pop
mul
swp
push cmath__cos.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.548 1
pushcp generator.const.gcn.548
push global.arg_counter
mov
jc
push cmath__cos.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.549 1
pushcp generator.const.gcn.549
push global.arg_counter
mov
jc
copy
swp
pop
mul
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.545 2
pushcp generator.const.gcn.545
push global.arg_counter
mov
jc
jr
jr
cmath__cos__end:
pushcp cmath__tg__end
jp
cmath__tg:
@cmath__tg.this
@cmath__tg.z
@cmath__tg.k
peek cmath__tg.z
pop
push global.this
peek cmath__tg.this
pop
push cmath__tg.z
pushc vtable__im
swp
pushai
word generator.const.gcn.551 2
pushc generator.const.gcn.551
copy
swp
pop
mul
pushc cosh
word generator.const.gcn.550 1
pushcp generator.const.gcn.550
push global.arg_counter
mov
jc
push cmath__tg.z
pushc vtable__re
swp
pushai
word generator.const.gcn.553 2
pushc generator.const.gcn.553
copy
swp
pop
mul
pushc cos
word generator.const.gcn.552 1
pushcp generator.const.gcn.552
push global.arg_counter
mov
jc
copy
swp
pop
add
peek cmath__tg.k
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__tg.k
push cmath__tg.z
pushc vtable__im
swp
pushai
word generator.const.gcn.556 2
pushc generator.const.gcn.556
copy
swp
pop
mul
pushc sinh
word generator.const.gcn.555 1
pushcp generator.const.gcn.555
push global.arg_counter
mov
jc
copy
swp
pop
div
swp
push cmath__tg.k
push cmath__tg.z
pushc vtable__re
swp
pushai
word generator.const.gcn.558 2
pushc generator.const.gcn.558
copy
swp
pop
mul
pushc sin
word generator.const.gcn.557 1
pushcp generator.const.gcn.557
push global.arg_counter
mov
jc
copy
swp
pop
div
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.554 2
pushcp generator.const.gcn.554
push global.arg_counter
mov
jc
jr
jr
cmath__tg__end:
pushcp cmath__ctg__end
jp
cmath__ctg:
@cmath__ctg.this
@cmath__ctg.z
@cmath__ctg.re
@cmath__ctg.im
peek cmath__ctg.z
pop
push global.this
peek cmath__ctg.this
pop
word generator.const.gcn.560 2
pushc generator.const.gcn.560
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.561 1
pushcp generator.const.gcn.561
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.559 2
pushcp generator.const.gcn.559
push global.arg_counter
mov
jc
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.562 1
pushcp generator.const.gcn.562
push global.arg_counter
mov
jc
copy
swp
pop
mul
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.563 1
pushcp generator.const.gcn.563
push global.arg_counter
mov
jc
copy
swp
pop
neg
copy
swp
pop
sub
peek cmath__ctg.re
pop
word generator.const.gcn.565 2
pushc generator.const.gcn.565
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.566 1
pushcp generator.const.gcn.566
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.564 2
pushcp generator.const.gcn.564
push global.arg_counter
mov
jc
word generator.const.gcn.568 2
pushc generator.const.gcn.568
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.569 1
pushcp generator.const.gcn.569
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.567 2
pushcp generator.const.gcn.567
push global.arg_counter
mov
jc
copy
swp
pop
add
push cmath__ctg.re
div
pop
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.570 1
pushcp generator.const.gcn.570
push global.arg_counter
mov
jc
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.571 1
pushcp generator.const.gcn.571
push global.arg_counter
mov
jc
word generator.const.gcn.573 2
pushc generator.const.gcn.573
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.574 1
pushcp generator.const.gcn.574
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.572 2
pushcp generator.const.gcn.572
push global.arg_counter
mov
jc
copy
swp
pop
mul
copy
swp
pop
sub
peek cmath__ctg.im
pop
word generator.const.gcn.576 2
pushc generator.const.gcn.576
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.577 1
pushcp generator.const.gcn.577
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.575 2
pushcp generator.const.gcn.575
push global.arg_counter
mov
jc
word generator.const.gcn.579 2
pushc generator.const.gcn.579
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.580 1
pushcp generator.const.gcn.580
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.578 2
pushcp generator.const.gcn.578
push global.arg_counter
mov
jc
copy
swp
pop
add
push cmath__ctg.im
div
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__ctg.im
swp
push cmath__ctg.re
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.581 2
pushcp generator.const.gcn.581
push global.arg_counter
mov
jc
jr
jr
cmath__ctg__end:
pushcp cmath__sec__end
jp
cmath__sec:
@cmath__sec.this
@cmath__sec.z
@cmath__sec.k
peek cmath__sec.z
pop
push global.this
peek cmath__sec.this
pop
word generator.const.gcn.583 2
pushc generator.const.gcn.583
push cmath__sec.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.584 1
pushcp generator.const.gcn.584
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.582 2
pushcp generator.const.gcn.582
push global.arg_counter
mov
jc
word generator.const.gcn.586 2
pushc generator.const.gcn.586
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.587 1
pushcp generator.const.gcn.587
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.585 2
pushcp generator.const.gcn.585
push global.arg_counter
mov
jc
copy
swp
pop
mul
peek cmath__sec.k
pop
word generator.const.gcn.589 2
pushc generator.const.gcn.589
push cmath__sec.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.590 1
pushcp generator.const.gcn.590
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.588 2
pushcp generator.const.gcn.588
push global.arg_counter
mov
jc
word generator.const.gcn.592 2
pushc generator.const.gcn.592
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.593 1
pushcp generator.const.gcn.593
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.591 2
pushcp generator.const.gcn.591
push global.arg_counter
mov
jc
copy
swp
pop
mul
push cmath__sec.k
add
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__sec.k
push cmath__sec.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.595 1
pushcp generator.const.gcn.595
push global.arg_counter
mov
jc
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.596 1
pushcp generator.const.gcn.596
push global.arg_counter
mov
jc
copy
swp
pop
mul
copy
swp
pop
div
swp
push cmath__sec.k
push cmath__sec.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.597 1
pushcp generator.const.gcn.597
push global.arg_counter
mov
jc
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.598 1
pushcp generator.const.gcn.598
push global.arg_counter
mov
jc
copy
swp
pop
mul
copy
swp
pop
div
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.594 2
pushcp generator.const.gcn.594
push global.arg_counter
mov
jc
jr
jr
cmath__sec__end:
pushcp cmath__cosec__end
jp
cmath__cosec:
@cmath__cosec.this
@cmath__cosec.z
@cmath__cosec.k
peek cmath__cosec.z
pop
push global.this
peek cmath__cosec.this
pop
word generator.const.gcn.600 2
pushc generator.const.gcn.600
push cmath__cosec.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.601 1
pushcp generator.const.gcn.601
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.599 2
pushcp generator.const.gcn.599
push global.arg_counter
mov
jc
word generator.const.gcn.603 2
pushc generator.const.gcn.603
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.604 1
pushcp generator.const.gcn.604
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.602 2
pushcp generator.const.gcn.602
push global.arg_counter
mov
jc
copy
swp
pop
mul
peek cmath__cosec.k
pop
word generator.const.gcn.606 2
pushc generator.const.gcn.606
push cmath__cosec.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.607 1
pushcp generator.const.gcn.607
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.605 2
pushcp generator.const.gcn.605
push global.arg_counter
mov
jc
word generator.const.gcn.609 2
pushc generator.const.gcn.609
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.610 1
pushcp generator.const.gcn.610
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.608 2
pushcp generator.const.gcn.608
push global.arg_counter
mov
jc
copy
swp
pop
mul
push cmath__cosec.k
add
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__cosec.k
push cmath__cosec.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.612 1
pushcp generator.const.gcn.612
push global.arg_counter
mov
jc
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.613 1
pushcp generator.const.gcn.613
push global.arg_counter
mov
jc
copy
swp
pop
neg
copy
swp
pop
mul
copy
swp
pop
div
swp
push cmath__cosec.k
push cmath__cosec.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.614 1
pushcp generator.const.gcn.614
push global.arg_counter
mov
jc
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.615 1
pushcp generator.const.gcn.615
push global.arg_counter
mov
jc
copy
swp
pop
mul
copy
swp
pop
div
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.611 2
pushcp generator.const.gcn.611
push global.arg_counter
mov
jc
jr
jr
cmath__cosec__end:
pushcp graph__arc__end
jp
graph__arc:
@graph__arc.this
@graph__arc.x
@graph__arc.y
@graph__arc.stangle
@graph__arc.endangle
@graph__arc.radius
peek graph__arc.x
pop
peek graph__arc.y
pop
peek graph__arc.stangle
pop
peek graph__arc.endangle
pop
peek graph__arc.radius
pop
push global.this
peek graph__arc.this
pop
push graph__arc.x
push graph__arc.y
push graph__arc.stangle
push graph__arc.endangle
push graph__arc.radius
pushc graph_arc
invoke
jr
graph__arc__end:
pushcp graph__bar__end
jp
graph__bar:
@graph__bar.this
@graph__bar.x1
@graph__bar.y1
@graph__bar.x2
@graph__bar.y2
peek graph__bar.x1
pop
peek graph__bar.y1
pop
peek graph__bar.x2
pop
peek graph__bar.y2
pop
push global.this
peek graph__bar.this
pop
push graph__bar.x1
push graph__bar.y1
push graph__bar.x2
push graph__bar.y2
pushc graph_bar
invoke
jr
graph__bar__end:
pushcp graph__bar3d__end
jp
graph__bar3d:
@graph__bar3d.this
@graph__bar3d.x1
@graph__bar3d.y1
@graph__bar3d.x2
@graph__bar3d.y2
@graph__bar3d.depth
@graph__bar3d.top
peek graph__bar3d.x1
pop
peek graph__bar3d.y1
pop
peek graph__bar3d.x2
pop
peek graph__bar3d.y2
pop
peek graph__bar3d.depth
pop
peek graph__bar3d.top
pop
push global.this
peek graph__bar3d.this
pop
push graph__bar3d.x1
push graph__bar3d.y1
push graph__bar3d.x2
push graph__bar3d.y2
push graph__bar3d.depth
push graph__bar3d.top
pushc graph_bar3d
invoke
jr
graph__bar3d__end:
pushcp graph__ellipse__end
jp
graph__ellipse:
@graph__ellipse.this
@graph__ellipse.x
@graph__ellipse.y
@graph__ellipse.stangle
@graph__ellipse.endangle
@graph__ellipse.xradius
@graph__ellipse.yradius
peek graph__ellipse.x
pop
peek graph__ellipse.y
pop
peek graph__ellipse.stangle
pop
peek graph__ellipse.endangle
pop
peek graph__ellipse.xradius
pop
peek graph__ellipse.yradius
pop
push global.this
peek graph__ellipse.this
pop
push graph__ellipse.x
push graph__ellipse.y
push graph__ellipse.stangle
push graph__ellipse.endangle
push graph__ellipse.xradius
push graph__ellipse.yradius
pushc graph_ellipse
invoke
jr
graph__ellipse__end:
pushcp graph__fillellipse__end
jp
graph__fillellipse:
@graph__fillellipse.this
@graph__fillellipse.x
@graph__fillellipse.y
@graph__fillellipse.xradius
@graph__fillellipse.yradius
peek graph__fillellipse.x
pop
peek graph__fillellipse.y
pop
peek graph__fillellipse.xradius
pop
peek graph__fillellipse.yradius
pop
push global.this
peek graph__fillellipse.this
pop
push graph__fillellipse.x
push graph__fillellipse.y
push graph__fillellipse.xradius
push graph__fillellipse.yradius
pushc graph_fillellipse
invoke
jr
graph__fillellipse__end:
pushcp graph__floodfill__end
jp
graph__floodfill:
@graph__floodfill.this
@graph__floodfill.x
@graph__floodfill.y
@graph__floodfill.border
peek graph__floodfill.x
pop
peek graph__floodfill.y
pop
peek graph__floodfill.border
pop
push global.this
peek graph__floodfill.this
pop
push graph__floodfill.x
push graph__floodfill.y
push graph__floodfill.border
pushc graph_floodfill
invoke
jr
graph__floodfill__end:
pushcp graph__getarccoords__end
jp
graph__getarccoords:
@graph__getarccoords.this
@graph__getarccoords.coords
push global.this
peek graph__getarccoords.this
pop
pushcp __allocator__arccoordstype
jc
peek graph__getarccoords.coords
pop
pushc graph_getarccoords
invoke
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.616 0
pushcp generator.const.gcn.616
push global.arg_counter
mov
jc
push graph__getarccoords.coords
pushc vtable__x
swp
peekai
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.617 0
pushcp generator.const.gcn.617
push global.arg_counter
mov
jc
push graph__getarccoords.coords
pushc vtable__y
swp
peekai
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.618 0
pushcp generator.const.gcn.618
push global.arg_counter
mov
jc
push graph__getarccoords.coords
pushc vtable__xstart
swp
peekai
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.619 0
pushcp generator.const.gcn.619
push global.arg_counter
mov
jc
push graph__getarccoords.coords
pushc vtable__ystart
swp
peekai
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.620 0
pushcp generator.const.gcn.620
push global.arg_counter
mov
jc
push graph__getarccoords.coords
pushc vtable__xend
swp
peekai
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.621 0
pushcp generator.const.gcn.621
push global.arg_counter
mov
jc
push graph__getarccoords.coords
pushc vtable__yend
swp
peekai
push graph__getarccoords.coords
jr
jr
graph__getarccoords__end:
pushcp graph__getaspectratio__end
jp
graph__getaspectratio:
@graph__getaspectratio.this
@graph__getaspectratio.xasp
@graph__getaspectratio.yasp
push global.this
peek graph__getaspectratio.this
pop
pushc graph_getaspectratio
invoke
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.622 0
pushcp generator.const.gcn.622
push global.arg_counter
mov
jc
peek graph__getaspectratio.xasp
pop
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.623 0
pushcp generator.const.gcn.623
push global.arg_counter
mov
jc
peek graph__getaspectratio.yasp
pop
word generator.const.gcn.624 2
pushcp generator.const.gcn.624
word generator.const.gcn.625 1
pushcp generator.const.gcn.625
newa
pcopy
push graph__getaspectratio.xasp
swp
word generator.const.gcn.626 0
pushcp generator.const.gcn.626
swp
peekai
pcopy
push graph__getaspectratio.yasp
swp
word generator.const.gcn.627 1
pushcp generator.const.gcn.627
swp
peekai
jr
jr
graph__getaspectratio__end:
pushcp graph__getfillpattern__end
jp
graph__getfillpattern:
@graph__getfillpattern.this
@graph__getfillpattern.r
push global.this
peek graph__getfillpattern.this
pop
pushc graph_getfillpattern
invoke
word generator.const.gcn.629 8
pushc generator.const.gcn.629
word generator.const.gcn.628 1
pushcp generator.const.gcn.628
newa
peek graph__getfillpattern.r
pop
@generator.for_each.gcn.630.array
@generator.for_each.gcn.630.i
@generator.for_each.gcn.630.to
word generator.const.gcn.631 7
pushc generator.const.gcn.631
word generator.const.gcn.632 0
pushc generator.const.gcn.632
pushcp system_op_range
jc
peek generator.for_each.gcn.630.array
alen
peek generator.for_each.gcn.630.to
pop
pushc global.zero
peek generator.for_each.gcn.630.i
pop
generator.for_each.gcn.630.start:
pushcp generator.for_each.gcn.630.end
push generator.for_each.gcn.630.i
push generator.for_each.gcn.630.to
eq
not
jz
pop
push generator.for_each.gcn.630.i
push generator.for_each.gcn.630.array
pushai
@graph__getfillpattern.i
peek graph__getfillpattern.i
pop
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.633 0
pushcp generator.const.gcn.633
push global.arg_counter
mov
jc
push graph__getfillpattern.r
push graph__getfillpattern.i
swp
peekai
generator.for_each.gcn.630.continue:
push generator.for_each.gcn.630.i
inc
pop
pushcp generator.for_each.gcn.630.start
jp
generator.for_each.gcn.630.end:
push graph__getfillpattern.r
jr
jr
graph__getfillpattern__end:
pushcp graph__getfillsettings__end
jp
graph__getfillsettings:
@graph__getfillsettings.this
@graph__getfillsettings.fs
push global.this
peek graph__getfillsettings.this
pop
pushcp __allocator__fillsettingstype
jc
peek graph__getfillsettings.fs
pop
pushc graph_getfillsettings
invoke
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.634 0
pushcp generator.const.gcn.634
push global.arg_counter
mov
jc
push graph__getfillsettings.fs
pushc vtable__pattern
swp
peekai
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.635 0
pushcp generator.const.gcn.635
push global.arg_counter
mov
jc
push graph__getfillsettings.fs
pushc vtable__color
swp
peekai
push graph__getfillsettings.fs
jr
jr
graph__getfillsettings__end:
pushcp graph__getlinesettings__end
jp
graph__getlinesettings:
@graph__getlinesettings.this
@graph__getlinesettings.ls
push global.this
peek graph__getlinesettings.this
pop
pushcp __allocator__linesettingstype
jc
peek graph__getlinesettings.ls
pop
pushc graph_getlinesettings
invoke
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.636 0
pushcp generator.const.gcn.636
push global.arg_counter
mov
jc
push graph__getlinesettings.ls
pushc vtable__linestyle
swp
peekai
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.637 0
pushcp generator.const.gcn.637
push global.arg_counter
mov
jc
push graph__getlinesettings.ls
pushc vtable__pattern
swp
peekai
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.638 0
pushcp generator.const.gcn.638
push global.arg_counter
mov
jc
push graph__getlinesettings.ls
pushc vtable__thickness
swp
peekai
push graph__getlinesettings.ls
jr
jr
graph__getlinesettings__end:
pushcp graph__getmoderange__end
jp
graph__getmoderange:
@graph__getmoderange.this
@graph__getmoderange.mode
@graph__getmoderange.a
@graph__getmoderange.b
peek graph__getmoderange.mode
pop
push global.this
peek graph__getmoderange.this
pop
push graph__getmoderange.mode
pushc graph_getmoderange
invoke
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.639 0
pushcp generator.const.gcn.639
push global.arg_counter
mov
jc
peek graph__getmoderange.a
pop
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.640 0
pushcp generator.const.gcn.640
push global.arg_counter
mov
jc
peek graph__getmoderange.b
pop
word generator.const.gcn.641 2
pushcp generator.const.gcn.641
word generator.const.gcn.642 1
pushcp generator.const.gcn.642
newa
pcopy
push graph__getmoderange.a
swp
word generator.const.gcn.643 0
pushcp generator.const.gcn.643
swp
peekai
pcopy
push graph__getmoderange.b
swp
word generator.const.gcn.644 1
pushcp generator.const.gcn.644
swp
peekai
jr
jr
graph__getmoderange__end:
pushcp graph__detect__end
jp
graph__detect:
@graph__detect.this
@graph__detect.driver
@graph__detect.mode
push global.this
peek graph__detect.this
pop
pushc graph_detectgraph
invoke
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.645 0
pushcp generator.const.gcn.645
push global.arg_counter
mov
jc
peek graph__detect.driver
pop
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.646 0
pushcp generator.const.gcn.646
push global.arg_counter
mov
jc
peek graph__detect.mode
pop
word generator.const.gcn.647 2
pushcp generator.const.gcn.647
word generator.const.gcn.648 1
pushcp generator.const.gcn.648
newa
pcopy
push graph__detect.driver
swp
word generator.const.gcn.649 0
pushcp generator.const.gcn.649
swp
peekai
pcopy
push graph__detect.mode
swp
word generator.const.gcn.650 1
pushcp generator.const.gcn.650
swp
peekai
jr
jr
graph__detect__end:
pushcp graph__clear__end
jp
graph__clear:
@graph__clear.this
push global.this
peek graph__clear.this
pop
pushc graph_solidfill
pushc graph_white
pushc graph_setfillstyle
invoke
pushc graph_getmaxy
invoke
pushc graph_getmaxx
invoke
word generator.const.gcn.652 0
pushc generator.const.gcn.652
word generator.const.gcn.653 0
pushc generator.const.gcn.653
push structure_instance_graph
peek global.this
pushc vtable__bar
swp
pushai
word generator.const.gcn.651 4
pushcp generator.const.gcn.651
push global.arg_counter
mov
jc
pushc graph_black
pushc graph_setcolor
invoke
pushc graph_solidfill
pushc graph_black
pushc graph_setfillstyle
invoke
jr
graph__clear__end:
pushcp graph__initialize__end
jp
graph__initialize:
@graph__initialize.this
push global.this
peek graph__initialize.this
pop
str generator.const.gcn.654 ""
pushc generator.const.gcn.654
word generator.const.gcn.655 0
pushc generator.const.gcn.655
word generator.const.gcn.656 0
pushc generator.const.gcn.656
pushc graph_initgraph
invoke
push structure_instance_graph
peek global.this
pushc vtable__clear
swp
pushai
word generator.const.gcn.657 0
pushcp generator.const.gcn.657
push global.arg_counter
mov
jc
jr
graph__initialize__end:
pushcp graph__lineto__end
jp
graph__lineto:
@graph__lineto.this
@graph__lineto.x
@graph__lineto.y
peek graph__lineto.x
pop
peek graph__lineto.y
pop
push global.this
peek graph__lineto.this
pop
push graph__lineto.x
push graph__lineto.y
pushc graph_lineto
invoke
jr
graph__lineto__end:
pushcp graph__moveto__end
jp
graph__moveto:
@graph__moveto.this
@graph__moveto.x
@graph__moveto.y
peek graph__moveto.x
pop
peek graph__moveto.y
pop
push global.this
peek graph__moveto.this
pop
push graph__moveto.x
push graph__moveto.y
pushc graph_moveto
invoke
jr
graph__moveto__end:
pushcp graph__setfillstyle__end
jp
graph__setfillstyle:
@graph__setfillstyle.this
push global.this
peek graph__setfillstyle.this
pop
pushc graph_setfillstyle
invoke
jr
graph__setfillstyle__end:
pushcp graph__fillpoly__end
jp
graph__fillpoly:
@graph__fillpoly.this
push global.this
peek graph__fillpoly.this
pop
pushc graph_fillpoly
invoke
jr
graph__fillpoly__end:
pushcp graph__cleardevice__end
jp
graph__cleardevice:
@graph__cleardevice.this
push global.this
peek graph__cleardevice.this
pop
pushc graph_cleardevice
invoke
jr
graph__cleardevice__end:
pushcp graph__close__end
jp
graph__close:
@graph__close.this
push global.this
peek graph__close.this
pop
pushc graph_closegraph
invoke
jr
graph__close__end:
pushcp graph__drawpoly__end
jp
graph__drawpoly:
@graph__drawpoly.this
push global.this
peek graph__drawpoly.this
pop
pushc graph_drawpoly
invoke
jr
graph__drawpoly__end:
pushcp graph__setcolor__end
jp
graph__setcolor:
@graph__setcolor.this
push global.this
peek graph__setcolor.this
pop
pushc graph_setcolor
invoke
jr
graph__setcolor__end:
pushcp graph__getcolor__end
jp
graph__getcolor:
@graph__getcolor.this
push global.this
peek graph__getcolor.this
pop
pushc graph_getcolor
invoke
jr
graph__getcolor__end:
pushcp graph__getdirectvideo__end
jp
graph__getdirectvideo:
@graph__getdirectvideo.this
push global.this
peek graph__getdirectvideo.this
pop
pushc graph_getdirectvideo
invoke
jr
graph__getdirectvideo__end:
pushcp graph__getdrivername__end
jp
graph__getdrivername:
@graph__getdrivername.this
push global.this
peek graph__getdrivername.this
pop
pushc graph_getdrivername
invoke
jr
graph__getdrivername__end:
pushcp graph__getmaxcolor__end
jp
graph__getmaxcolor:
@graph__getmaxcolor.this
push global.this
peek graph__getmaxcolor.this
pop
pushc graph_getmaxcolor
invoke
jr
graph__getmaxcolor__end:
pushcp graph__getmaxmode__end
jp
graph__getmaxmode:
@graph__getmaxmode.this
push global.this
peek graph__getmaxmode.this
pop
pushc graph_getmaxmode
invoke
jr
graph__getmaxmode__end:
pushcp graph__getmaxx__end
jp
graph__getmaxx:
@graph__getmaxx.this
push global.this
peek graph__getmaxx.this
pop
pushc graph_getmaxx
invoke
jr
graph__getmaxx__end:
pushcp graph__getmaxy__end
jp
graph__getmaxy:
@graph__getmaxy.this
push global.this
peek graph__getmaxy.this
pop
pushc graph_getmaxy
invoke
jr
graph__getmaxy__end:
pushcp graph__getmodename__end
jp
graph__getmodename:
@graph__getmodename.this
push global.this
peek graph__getmodename.this
pop
pushc graph_getmodename
invoke
jr
graph__getmodename__end:
pushcp graph__getgraphmode__end
jp
graph__getgraphmode:
@graph__getgraphmode.this
push global.this
peek graph__getgraphmode.this
pop
pushc graph_getgraphmode
invoke
jr
graph__getgraphmode__end:
pushcp graph__getpalettesize__end
jp
graph__getpalettesize:
@graph__getpalettesize.this
push global.this
peek graph__getpalettesize.this
pop
pushc graph_getpalettesize
invoke
jr
graph__getpalettesize__end:
pushcp graph__textheight__end
jp
graph__textheight:
@graph__textheight.this
push global.this
peek graph__textheight.this
pop
pushc graph_textheight
invoke
jr
graph__textheight__end:
pushcp graph__textwidth__end
jp
graph__textwidth:
@graph__textwidth.this
push global.this
peek graph__textwidth.this
pop
pushc graph_textwidth
invoke
jr
graph__textwidth__end:
pushcp graph__setwritemode__end
jp
graph__setwritemode:
@graph__setwritemode.this
push global.this
peek graph__setwritemode.this
pop
pushc graph_setwritemode
invoke
jr
graph__setwritemode__end:
pushcp graph__getx__end
jp
graph__getx:
@graph__getx.this
push global.this
peek graph__getx.this
pop
pushc graph_getx
invoke
jr
graph__getx__end:
pushcp graph__gety__end
jp
graph__gety:
@graph__gety.this
push global.this
peek graph__gety.this
pop
pushc graph_gety
invoke
jr
graph__gety__end:
pushcp graph__outtext__end
jp
graph__outtext:
@graph__outtext.this
push global.this
peek graph__outtext.this
pop
pushc graph_outtext
invoke
jr
graph__outtext__end:
pushcp main
jc
word __vtable__size__ 133
pushcp __allocator__crt__end
jp
__allocator__crt:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc crt
swp
pushcp vtable__type
swp
peekai
pcopy
pushc crt__normvideo
swp
pushcp vtable__normvideo
swp
peekai
pcopy
pushc crt__wherex
swp
pushcp vtable__wherex
swp
peekai
pcopy
pushc crt__wherey
swp
pushcp vtable__wherey
swp
peekai
pcopy
pushc crt__pause
swp
pushcp vtable__pause
swp
peekai
pcopy
pushc crt__cursorbig
swp
pushcp vtable__cursorbig
swp
peekai
pcopy
pushc crt__cursoroff
swp
pushcp vtable__cursoroff
swp
peekai
pcopy
pushc crt__cursoron
swp
pushcp vtable__cursoron
swp
peekai
pcopy
pushc crt__delline
swp
pushcp vtable__delline
swp
peekai
pcopy
pushc crt__gotoxy
swp
pushcp vtable__gotoxy
swp
peekai
pcopy
pushc crt__insline
swp
pushcp vtable__insline
swp
peekai
pcopy
pushc crt__keypressed
swp
pushcp vtable__keypressed
swp
peekai
pcopy
pushc crt__readkey
swp
pushcp vtable__readkey
swp
peekai
pcopy
pushc crt__sound
swp
pushcp vtable__sound
swp
peekai
pcopy
pushc crt__window32
swp
pushcp vtable__window32
swp
peekai
pcopy
pushc crt__clreol
swp
pushcp vtable__clreol
swp
peekai
pcopy
pushc crt__clrscr
swp
pushcp vtable__clrscr
swp
peekai
pcopy
pushc crt__getdirectvideo
swp
pushcp vtable__getdirectvideo
swp
peekai
pcopy
pushc crt__getlastmode
swp
pushcp vtable__getlastmode
swp
peekai
pcopy
pushc crt__settextattr
swp
pushcp vtable__settextattr
swp
peekai
pcopy
pushc crt__gettextattr
swp
pushcp vtable__gettextattr
swp
peekai
pcopy
pushc crt__getwindmax
swp
pushcp vtable__getwindmax
swp
peekai
pcopy
pushc crt__getwindmaxx
swp
pushcp vtable__getwindmaxx
swp
peekai
pcopy
pushc crt__getwindmaxy
swp
pushcp vtable__getwindmaxy
swp
peekai
pcopy
pushc crt__getwindmin
swp
pushcp vtable__getwindmin
swp
peekai
pcopy
pushc crt__getwindminx
swp
pushcp vtable__getwindminx
swp
peekai
pcopy
pushc crt__getwindminy
swp
pushcp vtable__getwindminy
swp
peekai
pcopy
pushc crt__getcheckbreak
swp
pushcp vtable__getcheckbreak
swp
peekai
pcopy
pushc crt__getcheckeof
swp
pushcp vtable__getcheckeof
swp
peekai
pcopy
pushc crt__getchecksnow
swp
pushcp vtable__getchecksnow
swp
peekai
pcopy
pushc crt__textcolor
swp
pushcp vtable__textcolor
swp
peekai
pcopy
pushc crt__textbackground
swp
pushcp vtable__textbackground
swp
peekai
jr
__allocator__crt__end:
pushcp __allocator__point__end
jp
__allocator__point:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc point
swp
pushcp vtable__type
swp
peekai
pcopy
pushc point__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc point__set
swp
pushcp vtable__set
swp
peekai
pcopy
pushc point__clone
swp
pushcp vtable__clone
swp
peekai
pcopy
pushc point__compare
swp
pushcp vtable__compare
swp
peekai
jr
__allocator__point__end:
pushcp __allocator__point3d__end
jp
__allocator__point3d:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc point3d
swp
pushcp vtable__type
swp
peekai
pcopy
pushc point3d__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc point3d__set
swp
pushcp vtable__set
swp
peekai
pcopy
pushc point3d__compare
swp
pushcp vtable__compare
swp
peekai
jr
__allocator__point3d__end:
pushcp __allocator__mplot__end
jp
__allocator__mplot:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc mplot
swp
pushcp vtable__type
swp
peekai
pcopy
pushc mplot__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc mplot__drawdecart
swp
pushcp vtable__drawdecart
swp
peekai
pcopy
pushc mplot__drawpolar
swp
pushcp vtable__drawpolar
swp
peekai
pcopy
pushc mplot__offsetx
swp
pushcp vtable__offsetx
swp
peekai
pcopy
pushc mplot__offsety
swp
pushcp vtable__offsety
swp
peekai
pcopy
pushc mplot__nextpoint
swp
pushcp vtable__nextpoint
swp
peekai
pcopy
pushc mplot__nextpolar
swp
pushcp vtable__nextpolar
swp
peekai
pcopy
pushc mplot__breakspline
swp
pushcp vtable__breakspline
swp
peekai
pcopy
pushc mplot__finish
swp
pushcp vtable__finish
swp
peekai
pcopy
pushc mplot__next
swp
pushcp vtable__next
swp
peekai
pcopy
pushc mplot__dot
swp
pushcp vtable__dot
swp
peekai
pcopy
pushc mplot__function
swp
pushcp vtable__function
swp
peekai
pcopy
pushc mplot__draw
swp
pushcp vtable__draw
swp
peekai
jr
__allocator__mplot__end:
pushcp __allocator__stack__end
jp
__allocator__stack:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc stack
swp
pushcp vtable__type
swp
peekai
pcopy
pushc stack__push
swp
pushcp vtable__push
swp
peekai
pcopy
pushc stack__peek
swp
pushcp vtable__peek
swp
peekai
pcopy
pushc stack__pop
swp
pushcp vtable__pop
swp
peekai
jr
__allocator__stack__end:
pushcp __allocator__polymorph__end
jp
__allocator__polymorph:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc polymorph
swp
pushcp vtable__type
swp
peekai
jr
__allocator__polymorph__end:
pushcp __allocator__exception__end
jp
__allocator__exception:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc exception
swp
pushcp vtable__type
swp
peekai
pcopy
pushc exception__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc exception__tostring
swp
pushcp vtable__tostring
swp
peekai
jr
__allocator__exception__end:
pushcp __allocator__complex__end
jp
__allocator__complex:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc complex
swp
pushcp vtable__type
swp
peekai
pcopy
pushc complex__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc complex__set
swp
pushcp vtable__set
swp
peekai
pcopy
pushc complex__tostring
swp
pushcp vtable__tostring
swp
peekai
pcopy
pushc complex__clone
swp
pushcp vtable__clone
swp
peekai
pcopy
pushc complex__compareto
swp
pushcp vtable__compareto
swp
peekai
pcopy
pushc complex__module
swp
pushcp vtable__module
swp
peekai
pcopy
pushc complex__angle
swp
pushcp vtable__angle
swp
peekai
pcopy
pushc complex__conjugate
swp
pushcp vtable__conjugate
swp
peekai
jr
__allocator__complex__end:
pushcp __allocator__cmath__end
jp
__allocator__cmath:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc cmath
swp
pushcp vtable__type
swp
peekai
pcopy
pushc cmath__unite
swp
pushcp vtable__unite
swp
peekai
pcopy
pushc cmath__uniteim
swp
pushcp vtable__uniteim
swp
peekai
pcopy
pushc cmath__uniteviaexp
swp
pushcp vtable__uniteviaexp
swp
peekai
pcopy
pushc cmath__add
swp
pushcp vtable__add
swp
peekai
pcopy
pushc cmath__sub
swp
pushcp vtable__sub
swp
peekai
pcopy
pushc cmath__mul
swp
pushcp vtable__mul
swp
peekai
pcopy
pushc cmath__div
swp
pushcp vtable__div
swp
peekai
pcopy
pushc cmath__power
swp
pushcp vtable__power
swp
peekai
pcopy
pushc cmath__ln
swp
pushcp vtable__ln
swp
peekai
pcopy
pushc cmath__logn
swp
pushcp vtable__logn
swp
peekai
pcopy
pushc cmath__sin
swp
pushcp vtable__sin
swp
peekai
pcopy
pushc cmath__cos
swp
pushcp vtable__cos
swp
peekai
pcopy
pushc cmath__tg
swp
pushcp vtable__tg
swp
peekai
pcopy
pushc cmath__ctg
swp
pushcp vtable__ctg
swp
peekai
pcopy
pushc cmath__sec
swp
pushcp vtable__sec
swp
peekai
pcopy
pushc cmath__cosec
swp
pushcp vtable__cosec
swp
peekai
jr
__allocator__cmath__end:
pushcp __allocator__arccoordstype__end
jp
__allocator__arccoordstype:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc arccoordstype
swp
pushcp vtable__type
swp
peekai
jr
__allocator__arccoordstype__end:
pushcp __allocator__fillsettingstype__end
jp
__allocator__fillsettingstype:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc fillsettingstype
swp
pushcp vtable__type
swp
peekai
jr
__allocator__fillsettingstype__end:
pushcp __allocator__linesettingstype__end
jp
__allocator__linesettingstype:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc linesettingstype
swp
pushcp vtable__type
swp
peekai
jr
__allocator__linesettingstype__end:
pushcp __allocator__graph__end
jp
__allocator__graph:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc graph
swp
pushcp vtable__type
swp
peekai
pcopy
pushc graph__arc
swp
pushcp vtable__arc
swp
peekai
pcopy
pushc graph__bar
swp
pushcp vtable__bar
swp
peekai
pcopy
pushc graph__bar3d
swp
pushcp vtable__bar3d
swp
peekai
pcopy
pushc graph__ellipse
swp
pushcp vtable__ellipse
swp
peekai
pcopy
pushc graph__fillellipse
swp
pushcp vtable__fillellipse
swp
peekai
pcopy
pushc graph__floodfill
swp
pushcp vtable__floodfill
swp
peekai
pcopy
pushc graph__getarccoords
swp
pushcp vtable__getarccoords
swp
peekai
pcopy
pushc graph__getaspectratio
swp
pushcp vtable__getaspectratio
swp
peekai
pcopy
pushc graph__getfillpattern
swp
pushcp vtable__getfillpattern
swp
peekai
pcopy
pushc graph__getfillsettings
swp
pushcp vtable__getfillsettings
swp
peekai
pcopy
pushc graph__getlinesettings
swp
pushcp vtable__getlinesettings
swp
peekai
pcopy
pushc graph__getmoderange
swp
pushcp vtable__getmoderange
swp
peekai
pcopy
pushc graph__detect
swp
pushcp vtable__detect
swp
peekai
pcopy
pushc graph__clear
swp
pushcp vtable__clear
swp
peekai
pcopy
pushc graph__initialize
swp
pushcp vtable__initialize
swp
peekai
pcopy
pushc graph__lineto
swp
pushcp vtable__lineto
swp
peekai
pcopy
pushc graph__moveto
swp
pushcp vtable__moveto
swp
peekai
pcopy
pushc graph__setfillstyle
swp
pushcp vtable__setfillstyle
swp
peekai
pcopy
pushc graph__fillpoly
swp
pushcp vtable__fillpoly
swp
peekai
pcopy
pushc graph__cleardevice
swp
pushcp vtable__cleardevice
swp
peekai
pcopy
pushc graph__close
swp
pushcp vtable__close
swp
peekai
pcopy
pushc graph__drawpoly
swp
pushcp vtable__drawpoly
swp
peekai
pcopy
pushc graph__setcolor
swp
pushcp vtable__setcolor
swp
peekai
pcopy
pushc graph__getcolor
swp
pushcp vtable__getcolor
swp
peekai
pcopy
pushc graph__getdirectvideo
swp
pushcp vtable__getdirectvideo
swp
peekai
pcopy
pushc graph__getdrivername
swp
pushcp vtable__getdrivername
swp
peekai
pcopy
pushc graph__getmaxcolor
swp
pushcp vtable__getmaxcolor
swp
peekai
pcopy
pushc graph__getmaxmode
swp
pushcp vtable__getmaxmode
swp
peekai
pcopy
pushc graph__getmaxx
swp
pushcp vtable__getmaxx
swp
peekai
pcopy
pushc graph__getmaxy
swp
pushcp vtable__getmaxy
swp
peekai
pcopy
pushc graph__getmodename
swp
pushcp vtable__getmodename
swp
peekai
pcopy
pushc graph__getgraphmode
swp
pushcp vtable__getgraphmode
swp
peekai
pcopy
pushc graph__getpalettesize
swp
pushcp vtable__getpalettesize
swp
peekai
pcopy
pushc graph__textheight
swp
pushcp vtable__textheight
swp
peekai
pcopy
pushc graph__textwidth
swp
pushcp vtable__textwidth
swp
peekai
pcopy
pushc graph__setwritemode
swp
pushcp vtable__setwritemode
swp
peekai
pcopy
pushc graph__getx
swp
pushcp vtable__getx
swp
peekai
pcopy
pushc graph__gety
swp
pushcp vtable__gety
swp
peekai
pcopy
pushc graph__outtext
swp
pushcp vtable__outtext
swp
peekai
jr
__allocator__graph__end: