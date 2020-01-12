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
int mplot_defscale -1
str mplot_null "MPlot_NULL"
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
word vtable__maxx 1
word vtable__maxy 2
word vtable__stepsx 3
word vtable__x0 4
word vtable__y0 5
word vtable__drawinginprocess 6
word vtable__sctype 7
word vtable__scscale 8
word vtable__classname 9
word vtable__message 10
word vtable__re 11
word vtable__im 12
word vtable__x 13
word vtable__y 14
word vtable__xstart 15
word vtable__ystart 16
word vtable__xend 17
word vtable__yend 18
word vtable__pattern 19
word vtable__color 20
word vtable__linestyle 21
word vtable__thickness 22
word vtable__create 23
word vtable__drawdecart 24
word vtable__drawpolar 25
word vtable__offsetx 26
word vtable__offsety 27
word vtable__nextpoint 28
word vtable__nextpolar 29
word vtable__breakspline 30
word vtable__finish 31
word vtable__next 32
word vtable__dot 33
word vtable__function 34
word vtable__draw 35
word vtable__normvideo 36
word vtable__wherex 37
word vtable__wherey 38
word vtable__pause 39
word vtable__cursorbig 40
word vtable__cursoroff 41
word vtable__cursoron 42
word vtable__delline 43
word vtable__gotoxy 44
word vtable__insline 45
word vtable__keypressed 46
word vtable__readkey 47
word vtable__sound 48
word vtable__window32 49
word vtable__clreol 50
word vtable__clrscr 51
word vtable__getdirectvideo 52
word vtable__getlastmode 53
word vtable__settextattr 54
word vtable__gettextattr 55
word vtable__getwindmax 56
word vtable__getwindmaxx 57
word vtable__getwindmaxy 58
word vtable__getwindmin 59
word vtable__getwindminx 60
word vtable__getwindminy 61
word vtable__getcheckbreak 62
word vtable__getcheckeof 63
word vtable__getchecksnow 64
word vtable__textcolor 65
word vtable__textbackground 66
word vtable__push 67
word vtable__peek 68
word vtable__pop 69
word vtable__tostring 70
word vtable__set 71
word vtable__clone 72
word vtable__compareto 73
word vtable__module 74
word vtable__angle 75
word vtable__conjugate 76
word vtable__unite 77
word vtable__uniteim 78
word vtable__uniteviaexp 79
word vtable__add 80
word vtable__sub 81
word vtable__mul 82
word vtable__div 83
word vtable__power 84
word vtable__ln 85
word vtable__logn 86
word vtable__sin 87
word vtable__cos 88
word vtable__tg 89
word vtable__ctg 90
word vtable__sec 91
word vtable__cosec 92
word vtable__arc 93
word vtable__bar 94
word vtable__bar3d 95
word vtable__ellipse 96
word vtable__fillellipse 97
word vtable__floodfill 98
word vtable__getarccoords 99
word vtable__getaspectratio 100
word vtable__getfillpattern 101
word vtable__getfillsettings 102
word vtable__getlinesettings 103
word vtable__getmoderange 104
word vtable__detect 105
word vtable__clear 106
word vtable__initialize 107
word vtable__lineto 108
word vtable__moveto 109
word vtable__setfillstyle 110
word vtable__fillpoly 111
word vtable__cleardevice 112
word vtable__close 113
word vtable__drawpoly 114
word vtable__setcolor 115
word vtable__getcolor 116
word vtable__getdrivername 117
word vtable__getmaxcolor 118
word vtable__getmaxmode 119
word vtable__getmaxx 120
word vtable__getmaxy 121
word vtable__getmodename 122
word vtable__getgraphmode 123
word vtable__getpalettesize 124
word vtable__textheight 125
word vtable__textwidth 126
word vtable__setwritemode 127
word vtable__getx 128
word vtable__gety 129
word vtable__outtext 130
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
word mplot 8
@structure_instance_mplot
pushcp __allocator__mplot
jc
peek structure_instance_mplot
pop
word crt 9
@structure_instance_crt
pushcp __allocator__crt
jc
peek structure_instance_crt
pop
word stack 10
@structure_instance_stack
pushcp __allocator__stack
jc
peek structure_instance_stack
pop
word polymorph 11
@structure_instance_polymorph
pushcp __allocator__polymorph
jc
peek structure_instance_polymorph
pop
word exception 12
@structure_instance_exception
pushcp __allocator__exception
jc
peek structure_instance_exception
pop
word complex 13
@structure_instance_complex
pushcp __allocator__complex
jc
peek structure_instance_complex
pop
word cmath 14
@structure_instance_cmath
pushcp __allocator__cmath
jc
peek structure_instance_cmath
pop
word arccoordstype 15
@structure_instance_arccoordstype
pushcp __allocator__arccoordstype
jc
peek structure_instance_arccoordstype
pop
word fillsettingstype 16
@structure_instance_fillsettingstype
pushcp __allocator__fillsettingstype
jc
peek structure_instance_fillsettingstype
pop
word linesettingstype 17
@structure_instance_linesettingstype
pushcp __allocator__linesettingstype
jc
peek structure_instance_linesettingstype
pop
word graph 18
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
pushcp butterfly__end
jp
butterfly:
@butterfly.this
@butterfly.fi
peek butterfly.fi
pop
word generator.const.gcn.37 24
pushc generator.const.gcn.37
pushc m_pi
push butterfly.fi
word generator.const.gcn.38 2
pushc generator.const.gcn.38
copy
swp
pop
mul
copy
swp
pop
sub
copy
swp
pop
div
pushc sin
word generator.const.gcn.36 1
pushcp generator.const.gcn.36
push global.arg_counter
mov
jc
push butterfly.fi
word generator.const.gcn.40 4
pushc generator.const.gcn.40
copy
swp
pop
mul
pushc cos
word generator.const.gcn.39 1
pushcp generator.const.gcn.39
push global.arg_counter
mov
jc
word generator.const.gcn.41 2
pushc generator.const.gcn.41
copy
swp
pop
mul
push butterfly.fi
pushc sin
word generator.const.gcn.43 1
pushcp generator.const.gcn.43
push global.arg_counter
mov
jc
pushc exp
word generator.const.gcn.42 1
pushcp generator.const.gcn.42
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
add
jr
jr
butterfly__end:
pushcp main__end
jp
main:
@main.this
@main.p
pushcp __allocator__mplot
jc
pcopy
peek global.this
pushc mplot_defscale
swp
pushc mplot_polar
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.44 2
pushcp generator.const.gcn.44
push global.arg_counter
mov
jc
peek main.p
pop
pushc butterfly
push main.p
peek global.this
pushc vtable__draw
swp
pushai
word generator.const.gcn.45 1
pushcp generator.const.gcn.45
push global.arg_counter
mov
jc
pushc inputln
invoke
jr
main__end:
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
pushcp generator.if.gcn.46.else
pushc mplot_defscale
push mplot__create.scscale
eq
jz
pop
word generator.const.gcn.47 100
pushc generator.const.gcn.47
push mplot__create.this
pushc vtable__scscale
swp
peekai
pushcp generator.if.gcn.46.end
jp
generator.if.gcn.46.else:
push mplot__create.scscale
push mplot__create.this
pushc vtable__scscale
swp
peekai
generator.if.gcn.46.end:
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
word generator.const.gcn.48 0
pushcp generator.const.gcn.48
push global.arg_counter
mov
jc
push structure_instance_graph
peek global.this
pushc vtable__getmaxx
swp
pushai
word generator.const.gcn.49 0
pushcp generator.const.gcn.49
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
word generator.const.gcn.50 0
pushcp generator.const.gcn.50
push global.arg_counter
mov
jc
push mplot__create.this
pushc vtable__maxy
swp
peekai
word generator.const.gcn.51 1
pushc generator.const.gcn.51
word generator.const.gcn.52 2
pushc generator.const.gcn.52
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
word generator.const.gcn.53 2
pushc generator.const.gcn.53
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
word generator.const.gcn.54 2
pushc generator.const.gcn.54
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
pushcp generator.if.gcn.55.else
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
word generator.const.gcn.56 0
pushcp generator.const.gcn.56
push global.arg_counter
mov
jc
pushcp generator.if.gcn.55.end
jp
generator.if.gcn.55.else:
push mplot__create.this
peek global.this
pushc vtable__drawpolar
swp
pushai
word generator.const.gcn.57 0
pushcp generator.const.gcn.57
push global.arg_counter
mov
jc
generator.if.gcn.55.end:
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
word generator.const.gcn.58 2
pushc generator.const.gcn.58
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
word generator.const.gcn.60 0
pushc generator.const.gcn.60
push mplot__drawdecart.this
pushc vtable__x0
swp
pushai
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.59 2
pushcp generator.const.gcn.59
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
word generator.const.gcn.61 2
pushcp generator.const.gcn.61
push global.arg_counter
mov
jc
push mplot__drawdecart.this
pushc vtable__y0
swp
pushai
word generator.const.gcn.63 0
pushc generator.const.gcn.63
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.62 2
pushcp generator.const.gcn.62
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
word generator.const.gcn.64 2
pushcp generator.const.gcn.64
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
generator.while.gcn.65.start:
pushcp generator.while.gcn.65.end
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
word generator.const.gcn.66 2
pushcp generator.const.gcn.66
push global.arg_counter
mov
jc
word generator.const.gcn.68 5
pushc generator.const.gcn.68
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
word generator.const.gcn.67 2
pushcp generator.const.gcn.67
push global.arg_counter
mov
jc
word generator.const.gcn.70 5
pushc generator.const.gcn.70
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
word generator.const.gcn.69 2
pushcp generator.const.gcn.69
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
word generator.const.gcn.71 2
pushcp generator.const.gcn.71
push global.arg_counter
mov
jc
push mplot__drawdecart.y
word generator.const.gcn.73 5
pushc generator.const.gcn.73
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
word generator.const.gcn.72 2
pushcp generator.const.gcn.72
push global.arg_counter
mov
jc
push mplot__drawdecart.y
word generator.const.gcn.75 5
pushc generator.const.gcn.75
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
word generator.const.gcn.74 2
pushcp generator.const.gcn.74
push global.arg_counter
mov
jc
push mplot__drawdecart.i
inc
pop
pushcp generator.while.gcn.65.start
jp
generator.while.gcn.65.end:
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
word generator.const.gcn.76 2
pushc generator.const.gcn.76
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
word generator.const.gcn.78 0
pushc generator.const.gcn.78
push mplot__drawpolar.this
pushc vtable__x0
swp
pushai
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.77 2
pushcp generator.const.gcn.77
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
word generator.const.gcn.79 2
pushcp generator.const.gcn.79
push global.arg_counter
mov
jc
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
word generator.const.gcn.81 0
pushc generator.const.gcn.81
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.80 2
pushcp generator.const.gcn.80
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
word generator.const.gcn.82 2
pushcp generator.const.gcn.82
push global.arg_counter
mov
jc
pushc graph_lightgray
push structure_instance_graph
peek global.this
pushc vtable__setcolor
swp
pushai
word generator.const.gcn.83 1
pushcp generator.const.gcn.83
push global.arg_counter
mov
jc
word generator.const.gcn.84 1
pushc generator.const.gcn.84
peek mplot__drawpolar.i
pop
generator.while.gcn.85.start:
pushcp generator.while.gcn.85.end
word generator.const.gcn.86 4
pushc generator.const.gcn.86
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
word generator.const.gcn.88 360
pushc generator.const.gcn.88
word generator.const.gcn.89 0
pushc generator.const.gcn.89
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
word generator.const.gcn.87 6
pushcp generator.const.gcn.87
push global.arg_counter
mov
jc
push mplot__drawpolar.i
inc
pop
pushcp generator.while.gcn.85.start
jp
generator.while.gcn.85.end:
word generator.const.gcn.91 2000
pushc generator.const.gcn.91
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
copy
swp
pop
add
word generator.const.gcn.92 2000
pushc generator.const.gcn.92
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
word generator.const.gcn.90 2
pushcp generator.const.gcn.90
push global.arg_counter
mov
jc
word generator.const.gcn.94 2000
pushc generator.const.gcn.94
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
copy
swp
pop
sub
word generator.const.gcn.95 2000
pushc generator.const.gcn.95
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
word generator.const.gcn.93 2
pushcp generator.const.gcn.93
push global.arg_counter
mov
jc
word generator.const.gcn.97 2000
pushc generator.const.gcn.97
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
copy
swp
pop
add
word generator.const.gcn.98 2000
pushc generator.const.gcn.98
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
word generator.const.gcn.96 2
pushcp generator.const.gcn.96
push global.arg_counter
mov
jc
word generator.const.gcn.100 2000
pushc generator.const.gcn.100
push mplot__drawpolar.this
pushc vtable__y0
swp
pushai
copy
swp
pop
sub
word generator.const.gcn.101 2000
pushc generator.const.gcn.101
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
word generator.const.gcn.99 2
pushcp generator.const.gcn.99
push global.arg_counter
mov
jc
pushc graph_black
push structure_instance_graph
peek global.this
pushc vtable__setcolor
swp
pushai
word generator.const.gcn.102 1
pushcp generator.const.gcn.102
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
word generator.const.gcn.103 1
pushcp generator.const.gcn.103
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
word generator.const.gcn.104 1
pushcp generator.const.gcn.104
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
word generator.const.gcn.105 1
pushcp generator.const.gcn.105
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
word generator.const.gcn.106 1
pushcp generator.const.gcn.106
push global.arg_counter
mov
jc
peek mplot__nextpoint.py
pop
pushcp generator.if.gcn.107.else
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
word generator.const.gcn.108 2
pushcp generator.const.gcn.108
push global.arg_counter
mov
jc
pushcp generator.if.gcn.107.end
jp
generator.if.gcn.107.else:
push mplot__nextpoint.py
push mplot__nextpoint.px
push structure_instance_graph
peek global.this
pushc vtable__moveto
swp
pushai
word generator.const.gcn.109 2
pushcp generator.const.gcn.109
push global.arg_counter
mov
jc
pushc true
push mplot__nextpoint.this
pushc vtable__drawinginprocess
swp
pushai
mov
generator.if.gcn.107.end:
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
word generator.const.gcn.110 2
pushcp generator.const.gcn.110
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
word generator.const.gcn.111 2
pushcp generator.const.gcn.111
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
pushcp generator.if.gcn.112.else
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
word generator.const.gcn.114 4
pushc generator.const.gcn.114
word generator.const.gcn.115 4
pushc generator.const.gcn.115
word generator.const.gcn.116 360
pushc generator.const.gcn.116
word generator.const.gcn.117 0
pushc generator.const.gcn.117
push structure_instance_graph
peek global.this
pushc vtable__gety
swp
pushai
word generator.const.gcn.118 0
pushcp generator.const.gcn.118
push global.arg_counter
mov
jc
push structure_instance_graph
peek global.this
pushc vtable__getx
swp
pushai
word generator.const.gcn.119 0
pushcp generator.const.gcn.119
push global.arg_counter
mov
jc
push structure_instance_graph
peek global.this
pushc vtable__ellipse
swp
pushai
word generator.const.gcn.113 6
pushcp generator.const.gcn.113
push global.arg_counter
mov
jc
generator.if.gcn.112.else:
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
pushcp generator.if.gcn.120.else
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
word generator.const.gcn.121 2
pushcp generator.const.gcn.121
push global.arg_counter
mov
jc
pushcp generator.if.gcn.120.end
jp
generator.if.gcn.120.else:
push mplot__next.i
push mplot__next.res
push mplot__next.this
peek global.this
pushc vtable__nextpolar
swp
pushai
word generator.const.gcn.122 2
pushcp generator.const.gcn.122
push global.arg_counter
mov
jc
generator.if.gcn.120.end:
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
pushcp generator.if.gcn.123.else
pushc mplot_decart
push mplot__dot.this
pushc vtable__sctype
swp
pushai
eq
jz
pop
word generator.const.gcn.125 2
pushc generator.const.gcn.125
word generator.const.gcn.126 2
pushc generator.const.gcn.126
push mplot__dot.res
push mplot__dot.this
peek global.this
pushc vtable__offsety
swp
pushai
word generator.const.gcn.127 1
pushcp generator.const.gcn.127
push global.arg_counter
mov
jc
push mplot__dot.i
push mplot__dot.this
peek global.this
pushc vtable__offsetx
swp
pushai
word generator.const.gcn.128 1
pushcp generator.const.gcn.128
push global.arg_counter
mov
jc
push structure_instance_graph
peek global.this
pushc vtable__fillellipse
swp
pushai
word generator.const.gcn.124 4
pushcp generator.const.gcn.124
push global.arg_counter
mov
jc
pushcp generator.if.gcn.123.end
jp
generator.if.gcn.123.else:
push mplot__dot.res
push mplot__dot.i
push structure_instance_cmath
peek global.this
pushc vtable__uniteviaexp
swp
pushai
word generator.const.gcn.129 2
pushcp generator.const.gcn.129
push global.arg_counter
mov
jc
peek mplot__dot.cn
pop
word generator.const.gcn.131 2
pushc generator.const.gcn.131
word generator.const.gcn.132 2
pushc generator.const.gcn.132
push mplot__dot.cn
pushc vtable__im
swp
pushai
push mplot__dot.this
peek global.this
pushc vtable__offsety
swp
pushai
word generator.const.gcn.133 1
pushcp generator.const.gcn.133
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
word generator.const.gcn.134 1
pushcp generator.const.gcn.134
push global.arg_counter
mov
jc
push structure_instance_graph
peek global.this
pushc vtable__fillellipse
swp
pushai
word generator.const.gcn.130 4
pushcp generator.const.gcn.130
push global.arg_counter
mov
jc
generator.if.gcn.123.end:
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
word generator.const.gcn.135 1
pushcp generator.const.gcn.135
push global.arg_counter
mov
jc
peek mplot__function.i
pop
generator.while.gcn.136.start:
pushcp generator.while.gcn.136.end
push mplot__function.to
push mplot__function.i
swp
bg
jz
pop
pushcp generator.try.gcn.137.finally
pushcp generator.try.gcn.137.catch
tr
push mplot__function.i
push mplot__function.fun
word generator.const.gcn.138 1
pushcp generator.const.gcn.138
push global.arg_counter
mov
jc
peek mplot__function.r
pop
pushcp generator.if.gcn.139.else
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
word generator.const.gcn.140 0
pushcp generator.const.gcn.140
push global.arg_counter
mov
jc
pushcp generator.if.gcn.139.end
jp
generator.if.gcn.139.else:
push mplot__function.r
push mplot__function.i
push mplot__function.this
peek global.this
pushc vtable__next
swp
pushai
word generator.const.gcn.141 2
pushcp generator.const.gcn.141
push global.arg_counter
mov
jc
generator.if.gcn.139.end:
generator.try.gcn.137.break:
trs
generator.try.gcn.137.catch:
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
word generator.const.gcn.142 0
pushcp generator.const.gcn.142
push global.arg_counter
mov
jc
generator.try.gcn.137.finally:
pushc gc
word generator.const.gcn.143 0
pushcp generator.const.gcn.143
push global.arg_counter
mov
jc
push mplot__function.step
push mplot__function.i
add
pop
pushcp generator.while.gcn.136.start
jp
generator.while.gcn.136.end:
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
pushcp generator.if.gcn.144.else
pushc mplot_decart
push mplot__draw.this
pushc vtable__sctype
swp
pushai
eq
jz
pop
real generator.const.gcn.146 0.01
pushc generator.const.gcn.146
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
word generator.const.gcn.145 4
pushcp generator.const.gcn.145
push global.arg_counter
mov
jc
pushcp generator.if.gcn.144.end
jp
generator.if.gcn.144.else:
real generator.const.gcn.148 0.01
pushc generator.const.gcn.148
word generator.const.gcn.149 90
pushc generator.const.gcn.149
word generator.const.gcn.150 0
pushc generator.const.gcn.150
push mplot__draw.fun
push mplot__draw.this
peek global.this
pushc vtable__function
swp
pushai
word generator.const.gcn.147 4
pushcp generator.const.gcn.147
push global.arg_counter
mov
jc
generator.if.gcn.144.end:
jr
mplot__draw__end:
pushcp __printarray__end
jp
__printarray:
@__printarray.this
@__printarray.arr
@__printarray.l
@__printarray.i
peek __printarray.arr
pop
str generator.const.gcn.151 "["
pushc generator.const.gcn.151
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.152 1
pushcp generator.const.gcn.152
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.153 0
pushc generator.const.gcn.153
peek __printarray.i
pop
generator.while.gcn.154.start:
pushcp generator.while.gcn.154.end
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
word generator.const.gcn.155 1
pushcp generator.const.gcn.155
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
pushcp generator.if.gcn.156.else
push __printarray.l
word generator.const.gcn.157 1
pushc generator.const.gcn.157
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.158 ", "
pushc generator.const.gcn.158
pushc _print
invoke
generator.if.gcn.156.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.154.start
jp
generator.while.gcn.154.end:
str generator.const.gcn.159 "]"
pushc generator.const.gcn.159
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
word generator.const.gcn.161 1
pushcp generator.const.gcn.161
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.162.end
swp
jz
str generator.const.gcn.163 "(null)"
pushc generator.const.gcn.163
pushc _print
invoke
pushcp generator.switch.gcn.160.end
jp
generator.case.gcn.162.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.164.end
swp
jz
push __print.obj
peek global.this
pushc vtable__tostring
swp
pushai
word generator.const.gcn.165 0
pushcp generator.const.gcn.165
push global.arg_counter
mov
jc
pushc _print
invoke
pushcp generator.switch.gcn.160.end
jp
generator.case.gcn.164.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.166.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.167 1
pushcp generator.const.gcn.167
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.160.end
jp
generator.case.gcn.166.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.160.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.168 0
pushcp generator.const.gcn.168
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.169.array
@generator.for_each.gcn.169.i
@generator.for_each.gcn.169.to
push print.args
peek generator.for_each.gcn.169.array
alen
peek generator.for_each.gcn.169.to
pop
pushc global.zero
peek generator.for_each.gcn.169.i
pop
generator.for_each.gcn.169.start:
pushcp generator.for_each.gcn.169.end
push generator.for_each.gcn.169.i
push generator.for_each.gcn.169.to
eq
not
jz
pop
push generator.for_each.gcn.169.i
push generator.for_each.gcn.169.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.170 1
pushcp generator.const.gcn.170
push global.arg_counter
mov
jc
generator.for_each.gcn.169.continue:
push generator.for_each.gcn.169.i
inc
pop
pushcp generator.for_each.gcn.169.start
jp
generator.for_each.gcn.169.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.171 0
pushcp generator.const.gcn.171
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.172.array
@generator.for_each.gcn.172.i
@generator.for_each.gcn.172.to
push println.args
peek generator.for_each.gcn.172.array
alen
peek generator.for_each.gcn.172.to
pop
pushc global.zero
peek generator.for_each.gcn.172.i
pop
generator.for_each.gcn.172.start:
pushcp generator.for_each.gcn.172.end
push generator.for_each.gcn.172.i
push generator.for_each.gcn.172.to
eq
not
jz
pop
push generator.for_each.gcn.172.i
push generator.for_each.gcn.172.array
pushai
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.173 1
pushcp generator.const.gcn.173
push global.arg_counter
mov
jc
generator.for_each.gcn.172.continue:
push generator.for_each.gcn.172.i
inc
pop
pushcp generator.for_each.gcn.172.start
jp
generator.for_each.gcn.172.end:
str generator.const.gcn.174 ""
pushc generator.const.gcn.174
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
word generator.const.gcn.175 7
pushc generator.const.gcn.175
pushc crt_textcolor
invoke
word generator.const.gcn.176 0
pushc generator.const.gcn.176
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
word generator.const.gcn.177 256
pushc generator.const.gcn.177
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
word generator.const.gcn.178 256
pushc generator.const.gcn.178
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
pushcp generator.if.gcn.179.else
push system_op_range.isback
jz
pop
word generator.const.gcn.180 1
pushc generator.const.gcn.180
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
pushcp generator.if.gcn.179.end
jp
generator.if.gcn.179.else:
word generator.const.gcn.181 1
pushc generator.const.gcn.181
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
generator.if.gcn.179.end:
push system_op_range.l
word generator.const.gcn.182 1
pushcp generator.const.gcn.182
newa
peek system_op_range.res
pop
word generator.const.gcn.183 0
pushc generator.const.gcn.183
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.184 1
pushcp generator.const.gcn.184
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.185.start:
pushcp generator.while.gcn.185.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.186 1
pushcp generator.const.gcn.186
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
pushcp generator.if.gcn.187.else
push system_op_range.isback
jz
pop
word generator.const.gcn.188 1
pushc generator.const.gcn.188
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.187.end
jp
generator.if.gcn.187.else:
word generator.const.gcn.189 1
pushc generator.const.gcn.189
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.187.end:
pushcp generator.while.gcn.185.start
jp
generator.while.gcn.185.end:
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
word generator.const.gcn.190 2
pushcp generator.const.gcn.190
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
word generator.const.gcn.191 0
pushc generator.const.gcn.191
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.192 1
pushcp generator.const.gcn.192
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.193.start:
pushcp generator.while.gcn.193.end
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
pushcp generator.while.gcn.193.start
jp
generator.while.gcn.193.end:
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
pushcp generator.if.gcn.194.else
word generator.const.gcn.195 255
pushc generator.const.gcn.195
push typeof.t
eq
jz
pop
push null
jr
generator.if.gcn.194.else:
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
word generator.const.gcn.196 1
pushcp generator.const.gcn.196
push global.arg_counter
mov
jc
peek system_op_is.t
pop
pushcp generator.if.gcn.197.else
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
pushcp generator.if.gcn.197.end
jp
generator.if.gcn.197.else:
push system_op_is.right
push system_op_is.t
eq
jr
generator.if.gcn.197.end:
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
word generator.const.gcn.198 1
pushcp generator.const.gcn.198
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.199 1
pushcp generator.const.gcn.199
newa
peek system_copy_array.r
pop
word generator.const.gcn.200 0
pushc generator.const.gcn.200
peek system_copy_array.i
pop
generator.while.gcn.201.start:
pushcp generator.while.gcn.201.end
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
word generator.const.gcn.202 1
pushcp generator.const.gcn.202
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
pushcp generator.while.gcn.201.start
jp
generator.while.gcn.201.end:
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
pushcp generator.if.gcn.203.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.204 1
pushcp generator.const.gcn.204
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.205 1
pushcp generator.const.gcn.205
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.203.end
jp
generator.if.gcn.203.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.206 1
pushcp generator.const.gcn.206
push global.arg_counter
mov
jc
jr
generator.if.gcn.203.end:
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
word generator.const.gcn.207 0
pushcp generator.const.gcn.207
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.208 ""
pushc generator.const.gcn.208
peek chr.r
pop
@generator.for_each.gcn.209.array
@generator.for_each.gcn.209.i
@generator.for_each.gcn.209.to
push chr.chars
peek generator.for_each.gcn.209.array
alen
peek generator.for_each.gcn.209.to
pop
pushc global.zero
peek generator.for_each.gcn.209.i
pop
generator.for_each.gcn.209.start:
pushcp generator.for_each.gcn.209.end
push generator.for_each.gcn.209.i
push generator.for_each.gcn.209.to
eq
not
jz
pop
push generator.for_each.gcn.209.i
push generator.for_each.gcn.209.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.210 1
pushcp generator.const.gcn.210
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.209.continue:
push generator.for_each.gcn.209.i
inc
pop
pushcp generator.for_each.gcn.209.start
jp
generator.for_each.gcn.209.end:
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
word generator.const.gcn.212 1
pushcp generator.const.gcn.212
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.213.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.211.end
jp
generator.case.gcn.213.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.214.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.211.end
jp
generator.case.gcn.214.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.215.end
swp
jz
push str.value
pushc f2s
invoke
jr
pushcp generator.switch.gcn.211.end
jp
generator.case.gcn.215.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.216.end
swp
jz
push str.value
jr
pushcp generator.switch.gcn.211.end
jp
generator.case.gcn.216.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.218 "Invalid type cast via str()."
pushc generator.const.gcn.218
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.217 1
pushcp generator.const.gcn.217
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.211.end:
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
word generator.const.gcn.220 1
pushcp generator.const.gcn.220
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.221.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.219.end
jp
generator.case.gcn.221.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.222.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.219.end
jp
generator.case.gcn.222.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.223.end
swp
jz
word generator.const.gcn.224 1
pushc generator.const.gcn.224
push int.value
copy
swp
pop
idiv
jr
pushcp generator.switch.gcn.219.end
jp
generator.case.gcn.223.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.225.end
swp
jz
push int.value
pushc s2i
invoke
jr
pushcp generator.switch.gcn.219.end
jp
generator.case.gcn.225.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.227 "Invalid type cast via int()."
pushc generator.const.gcn.227
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.226 1
pushcp generator.const.gcn.226
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.219.end:
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
word generator.const.gcn.229 1
pushcp generator.const.gcn.229
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.230.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.228.end
jp
generator.case.gcn.230.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.231.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.228.end
jp
generator.case.gcn.231.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.232.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.228.end
jp
generator.case.gcn.232.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.233.end
swp
jz
push real.value
pushc s2f
invoke
jr
pushcp generator.switch.gcn.228.end
jp
generator.case.gcn.233.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.235 "Invalid type cast via int()."
pushc generator.const.gcn.235
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.234 1
pushcp generator.const.gcn.234
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.228.end:
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
pushcp generator.if.gcn.236.else
push check.cond
jz
pop
push check.rtrue
jr
pushcp generator.if.gcn.236.end
jp
generator.if.gcn.236.else:
push check.rfalse
jr
generator.if.gcn.236.end:
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
pushcp generator.if.gcn.237.else
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
generator.if.gcn.237.else:
word generator.const.gcn.238 2
pushcp generator.const.gcn.238
word generator.const.gcn.239 1
pushcp generator.const.gcn.239
newa
pcopy
push between.left
swp
word generator.const.gcn.240 0
pushcp generator.const.gcn.240
swp
peekai
pcopy
push between.right
swp
word generator.const.gcn.241 1
pushcp generator.const.gcn.241
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
pushcp generator.if.gcn.242.else
word generator.const.gcn.243 0
pushc generator.const.gcn.243
push maxfromarray.arr
pushc len
word generator.const.gcn.244 1
pushcp generator.const.gcn.244
push global.arg_counter
mov
jc
bg
jz
pop
push maxfromarray.arr
word generator.const.gcn.245 0
pushc generator.const.gcn.245
swp
pushai
peek maxfromarray.r
pop
@generator.for_each.gcn.246.array
@generator.for_each.gcn.246.i
@generator.for_each.gcn.246.to
push maxfromarray.arr
peek generator.for_each.gcn.246.array
alen
peek generator.for_each.gcn.246.to
pop
pushc global.zero
peek generator.for_each.gcn.246.i
pop
generator.for_each.gcn.246.start:
pushcp generator.for_each.gcn.246.end
push generator.for_each.gcn.246.i
push generator.for_each.gcn.246.to
eq
not
jz
pop
push generator.for_each.gcn.246.i
push generator.for_each.gcn.246.array
pushai
@maxfromarray.x
peek maxfromarray.x
pop
pushcp generator.if.gcn.247.else
push maxfromarray.r
push maxfromarray.x
bg
jz
pop
push maxfromarray.x
push maxfromarray.r
mov
generator.if.gcn.247.else:
generator.for_each.gcn.246.continue:
push generator.for_each.gcn.246.i
inc
pop
pushcp generator.for_each.gcn.246.start
jp
generator.for_each.gcn.246.end:
push maxfromarray.r
jr
pushcp generator.if.gcn.242.end
jp
generator.if.gcn.242.else:
push null
jr
generator.if.gcn.242.end:
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
pushcp generator.if.gcn.248.else
word generator.const.gcn.249 0
pushc generator.const.gcn.249
push minfromarray.arr
pushc len
word generator.const.gcn.250 1
pushcp generator.const.gcn.250
push global.arg_counter
mov
jc
bg
jz
pop
push minfromarray.arr
word generator.const.gcn.251 0
pushc generator.const.gcn.251
swp
pushai
peek minfromarray.r
pop
@generator.for_each.gcn.252.array
@generator.for_each.gcn.252.i
@generator.for_each.gcn.252.to
push minfromarray.arr
peek generator.for_each.gcn.252.array
alen
peek generator.for_each.gcn.252.to
pop
pushc global.zero
peek generator.for_each.gcn.252.i
pop
generator.for_each.gcn.252.start:
pushcp generator.for_each.gcn.252.end
push generator.for_each.gcn.252.i
push generator.for_each.gcn.252.to
eq
not
jz
pop
push generator.for_each.gcn.252.i
push generator.for_each.gcn.252.array
pushai
@minfromarray.x
peek minfromarray.x
pop
pushcp generator.if.gcn.253.else
push minfromarray.r
push minfromarray.x
swp
bg
jz
pop
push minfromarray.x
push minfromarray.r
mov
generator.if.gcn.253.else:
generator.for_each.gcn.252.continue:
push generator.for_each.gcn.252.i
inc
pop
pushcp generator.for_each.gcn.252.start
jp
generator.for_each.gcn.252.end:
push minfromarray.r
jr
pushcp generator.if.gcn.248.end
jp
generator.if.gcn.248.else:
push null
jr
generator.if.gcn.248.end:
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
word generator.const.gcn.254 0
pushcp generator.const.gcn.254
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
push max.args
pushc len
word generator.const.gcn.255 1
pushcp generator.const.gcn.255
push global.arg_counter
mov
jc
peek max.l
pop
pushcp generator.if.gcn.256.else
word generator.const.gcn.257 0
pushc generator.const.gcn.257
push max.l
bg
jz
pop
push max.args
word generator.const.gcn.258 0
pushc generator.const.gcn.258
swp
pushai
peek max.first
pop
pushcp generator.if.gcn.259.else
pushc typearray
push max.first
pushcp system_op_is
jc
jz
pop
push max.first
pushc maxfromarray
word generator.const.gcn.260 1
pushcp generator.const.gcn.260
push global.arg_counter
mov
jc
peek max.r
pop
pushcp generator.if.gcn.259.end
jp
generator.if.gcn.259.else:
push max.first
peek max.r
pop
generator.if.gcn.259.end:
word generator.const.gcn.261 1
pushc generator.const.gcn.261
peek max.i
pop
generator.while.gcn.262.start:
pushcp generator.while.gcn.262.end
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
pushcp generator.if.gcn.263.else
pushc typearray
push max.t
pushcp system_op_is
jc
jz
pop
push max.t
pushc maxfromarray
word generator.const.gcn.264 1
pushcp generator.const.gcn.264
push global.arg_counter
mov
jc
peek max._
pop
pushcp generator.if.gcn.265.else
push max.r
push max._
bg
jz
pop
push max._
push max.r
mov
generator.if.gcn.265.else:
pushcp generator.if.gcn.263.end
jp
generator.if.gcn.263.else:
pushcp generator.if.gcn.266.else
push max.r
push max.t
bg
jz
pop
push max.t
push max.r
mov
generator.if.gcn.266.else:
generator.if.gcn.263.end:
push max.i
inc
pop
pushcp generator.while.gcn.262.start
jp
generator.while.gcn.262.end:
push max.r
jr
pushcp generator.if.gcn.256.end
jp
generator.if.gcn.256.else:
push null
jr
generator.if.gcn.256.end:
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
word generator.const.gcn.267 0
pushcp generator.const.gcn.267
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
push min.args
pushc len
word generator.const.gcn.268 1
pushcp generator.const.gcn.268
push global.arg_counter
mov
jc
peek min.l
pop
pushcp generator.if.gcn.269.else
word generator.const.gcn.270 0
pushc generator.const.gcn.270
push min.l
bg
jz
pop
push min.args
word generator.const.gcn.271 0
pushc generator.const.gcn.271
swp
pushai
peek min.first
pop
pushcp generator.if.gcn.272.else
pushc typearray
push min.first
pushcp system_op_is
jc
jz
pop
push min.first
pushc minfromarray
word generator.const.gcn.273 1
pushcp generator.const.gcn.273
push global.arg_counter
mov
jc
peek min.r
pop
pushcp generator.if.gcn.272.end
jp
generator.if.gcn.272.else:
push min.first
peek min.r
pop
generator.if.gcn.272.end:
word generator.const.gcn.274 1
pushc generator.const.gcn.274
peek min.i
pop
push min.args
pushc len
word generator.const.gcn.275 1
pushcp generator.const.gcn.275
push global.arg_counter
mov
jc
peek min.l
pop
generator.while.gcn.276.start:
pushcp generator.while.gcn.276.end
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
pushcp generator.if.gcn.277.else
pushc typearray
push min.t
pushcp system_op_is
jc
jz
pop
push min.t
pushc minfromarray
word generator.const.gcn.278 1
pushcp generator.const.gcn.278
push global.arg_counter
mov
jc
peek min._
pop
pushcp generator.if.gcn.279.else
push min.r
push min._
swp
bg
jz
pop
push min._
push min.r
mov
generator.if.gcn.279.else:
pushcp generator.if.gcn.277.end
jp
generator.if.gcn.277.else:
pushcp generator.if.gcn.280.else
push min.r
push min.t
swp
bg
jz
pop
push min.t
push min.r
mov
generator.if.gcn.280.else:
generator.if.gcn.277.end:
push min.i
inc
pop
pushcp generator.while.gcn.276.start
jp
generator.while.gcn.276.end:
push min.r
jr
pushcp generator.if.gcn.269.end
jp
generator.if.gcn.269.else:
push null
jr
generator.if.gcn.269.end:
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
word generator.const.gcn.281 1
pushcp generator.const.gcn.281
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek append.values
pop
push append.array
pushc len
word generator.const.gcn.282 1
pushcp generator.const.gcn.282
push global.arg_counter
mov
jc
peek append.i
pop
push append.values
pushc len
word generator.const.gcn.283 1
pushcp generator.const.gcn.283
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
word generator.const.gcn.284 2
pushcp generator.const.gcn.284
push global.arg_counter
mov
jc
@generator.for_each.gcn.285.array
@generator.for_each.gcn.285.i
@generator.for_each.gcn.285.to
push append.values
peek generator.for_each.gcn.285.array
alen
peek generator.for_each.gcn.285.to
pop
pushc global.zero
peek generator.for_each.gcn.285.i
pop
generator.for_each.gcn.285.start:
pushcp generator.for_each.gcn.285.end
push generator.for_each.gcn.285.i
push generator.for_each.gcn.285.to
eq
not
jz
pop
push generator.for_each.gcn.285.i
push generator.for_each.gcn.285.array
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
generator.for_each.gcn.285.continue:
push generator.for_each.gcn.285.i
inc
pop
pushcp generator.for_each.gcn.285.start
jp
generator.for_each.gcn.285.end:
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
word generator.const.gcn.286 1
pushcp generator.const.gcn.286
push global.arg_counter
mov
jc
peek reverse.l
pop
word generator.const.gcn.287 2
pushc generator.const.gcn.287
push reverse.l
copy
swp
pop
idiv
peek reverse.hl
pop
word generator.const.gcn.288 0
pushc generator.const.gcn.288
peek reverse.i
pop
generator.while.gcn.289.start:
pushcp generator.while.gcn.289.end
push reverse.hl
push reverse.i
swp
bg
jz
pop
push reverse.array
word generator.const.gcn.290 1
pushc generator.const.gcn.290
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
word generator.const.gcn.291 1
pushc generator.const.gcn.291
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
pushcp generator.while.gcn.289.start
jp
generator.while.gcn.289.end:
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
word generator.const.gcn.292 0
pushc generator.const.gcn.292
peek indexof.i
pop
@generator.for_each.gcn.293.array
@generator.for_each.gcn.293.i
@generator.for_each.gcn.293.to
push indexof.array
peek generator.for_each.gcn.293.array
alen
peek generator.for_each.gcn.293.to
pop
pushc global.zero
peek generator.for_each.gcn.293.i
pop
generator.for_each.gcn.293.start:
pushcp generator.for_each.gcn.293.end
push generator.for_each.gcn.293.i
push generator.for_each.gcn.293.to
eq
not
jz
pop
push generator.for_each.gcn.293.i
push generator.for_each.gcn.293.array
pushai
@indexof.x
peek indexof.x
pop
pushcp generator.if.gcn.294.else
pushc typeclass
push indexof.x
pushcp system_op_is
jc
jz
pop
pushcp generator.if.gcn.295.else
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
generator.if.gcn.295.else:
pushcp generator.if.gcn.294.end
jp
generator.if.gcn.294.else:
pushcp generator.if.gcn.296.else
push indexof.object
push indexof.x
eq
jz
pop
push indexof.i
jr
generator.if.gcn.296.else:
generator.if.gcn.294.end:
push indexof.i
inc
pop
generator.for_each.gcn.293.continue:
push generator.for_each.gcn.293.i
inc
pop
pushcp generator.for_each.gcn.293.start
jp
generator.for_each.gcn.293.end:
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
word generator.const.gcn.297 1
pushcp generator.const.gcn.297
push global.arg_counter
mov
jc
peek insert.l
pop
word generator.const.gcn.299 1
pushc generator.const.gcn.299
push insert.l
copy
swp
pop
add
push insert.array
pushc setlen
word generator.const.gcn.298 2
pushcp generator.const.gcn.298
push global.arg_counter
mov
jc
generator.while.gcn.300.start:
pushcp generator.while.gcn.300.end
push insert.index
push insert.l
bg
jz
pop
push insert.array
word generator.const.gcn.301 1
pushc generator.const.gcn.301
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
pushcp generator.while.gcn.300.start
jp
generator.while.gcn.300.end:
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
word generator.const.gcn.302 1
pushcp generator.const.gcn.302
push global.arg_counter
mov
jc
peek delete.i
pop
word generator.const.gcn.303 1
pushc generator.const.gcn.303
push delete.array
pushc len
word generator.const.gcn.304 1
pushcp generator.const.gcn.304
push global.arg_counter
mov
jc
copy
swp
pop
sub
peek delete.l
pop
generator.while.gcn.305.start:
pushcp generator.while.gcn.305.end
push delete.l
push delete.i
swp
bg
jz
pop
push delete.array
word generator.const.gcn.306 1
pushc generator.const.gcn.306
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
pushcp generator.while.gcn.305.start
jp
generator.while.gcn.305.end:
push delete.i
push delete.array
pushc setlen
word generator.const.gcn.307 2
pushcp generator.const.gcn.307
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
word generator.const.gcn.308 2
pushcp generator.const.gcn.308
push global.arg_counter
mov
jc
peek remove.index
pop
pushcp generator.if.gcn.309.else
push null
push remove.index
eq
not
jz
pop
push remove.index
push remove.array
pushc delete
word generator.const.gcn.310 2
pushcp generator.const.gcn.310
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.309.end
jp
generator.if.gcn.309.else:
push remove.array
jr
generator.if.gcn.309.end:
jr
remove__end:
pushcp clear__end
jp
clear:
@clear.this
@clear.array
peek clear.array
pop
word generator.const.gcn.312 0
pushc generator.const.gcn.312
push clear.array
pushc setlen
word generator.const.gcn.311 2
pushcp generator.const.gcn.311
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
word generator.const.gcn.313 0
pushc generator.const.gcn.313
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.314 1
pushcp generator.const.gcn.314
newa
peek params
pop
word generator.const.gcn.315 0
pushc generator.const.gcn.315
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.316.start:
pushcp generator.while.gcn.316.end
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
pushcp generator.while.gcn.316.start
jp
generator.while.gcn.316.end:
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
str generator.const.gcn.317 "'."
pushc generator.const.gcn.317
push exception__tostring.this
pushc vtable__message
swp
pushai
str generator.const.gcn.318 ">, message: '"
pushc generator.const.gcn.318
push exception__tostring.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.319 "Exception <"
pushc generator.const.gcn.319
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
pushcp generator.if.gcn.320.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.320.end
jp
generator.if.gcn.320.else:
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
generator.if.gcn.320.end:
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
word generator.const.gcn.321 1
pushc generator.const.gcn.321
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
word generator.const.gcn.322 1
pushc generator.const.gcn.322
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
real generator.const.gcn.324 0.5
pushc generator.const.gcn.324
push round.a
copy
swp
pop
add
pushc trunc
word generator.const.gcn.323 1
pushcp generator.const.gcn.323
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
real generator.const.gcn.326 0.999999
pushc generator.const.gcn.326
push ceil.a
copy
swp
pop
add
pushc trunc
word generator.const.gcn.325 1
pushcp generator.const.gcn.325
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
pushcp generator.if.gcn.327.else
word generator.const.gcn.328 0
pushc generator.const.gcn.328
push abs.a
bg
jz
pop
push abs.a
pushcp generator.if.gcn.327.end
jp
generator.if.gcn.327.else:
push abs.a
copy
swp
pop
neg
generator.if.gcn.327.end:
jr
abs__end:
pushcp sgn__end
jp
sgn:
@sgn.this
@sgn.a
peek sgn.a
pop
pushcp generator.if.gcn.329.else
word generator.const.gcn.330 0
pushc generator.const.gcn.330
push sgn.a
eq
jz
pop
word generator.const.gcn.331 0
pushc generator.const.gcn.331
jr
generator.if.gcn.329.else:
pushcp generator.if.gcn.332.else
word generator.const.gcn.333 0
pushc generator.const.gcn.333
push sgn.a
swp
bg
jz
pop
word generator.const.gcn.334 1
pushc generator.const.gcn.334
copy
swp
pop
neg
jr
pushcp generator.if.gcn.332.end
jp
generator.if.gcn.332.else:
word generator.const.gcn.335 1
pushc generator.const.gcn.335
jr
generator.if.gcn.332.end:
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
word generator.const.gcn.336 2
pushcp generator.const.gcn.336
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
pushcp generator.if.gcn.337.else
word generator.const.gcn.338 0
pushc generator.const.gcn.338
push power.n
eq
jz
pop
word generator.const.gcn.339 1
pushc generator.const.gcn.339
jr
pushcp generator.if.gcn.337.end
jp
generator.if.gcn.337.else:
pushcp generator.if.gcn.340.else
word generator.const.gcn.341 0
pushc generator.const.gcn.341
push power.a
eq
jz
pop
word generator.const.gcn.342 0
pushc generator.const.gcn.342
jr
pushcp generator.if.gcn.340.end
jp
generator.if.gcn.340.else:
push power.n
push power.a
pushc log
word generator.const.gcn.344 1
pushcp generator.const.gcn.344
push global.arg_counter
mov
jc
copy
swp
pop
mul
pushc exp
word generator.const.gcn.343 1
pushcp generator.const.gcn.343
push global.arg_counter
mov
jc
jr
generator.if.gcn.340.end:
generator.if.gcn.337.end:
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
word generator.const.gcn.346 2
pushcp generator.const.gcn.346
push global.arg_counter
mov
jc
pushc round
word generator.const.gcn.345 1
pushcp generator.const.gcn.345
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
pushcp generator.if.gcn.347.else
word generator.const.gcn.348 0
pushc generator.const.gcn.348
push sqrt.a
be
jz
pop
real generator.const.gcn.350 0.5
pushc generator.const.gcn.350
push sqrt.a
pushc power
word generator.const.gcn.349 2
pushcp generator.const.gcn.349
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.347.end
jp
generator.if.gcn.347.else:
push null
jr
generator.if.gcn.347.end:
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
word generator.const.gcn.351 1
pushc generator.const.gcn.351
peek factorial.r
pop
word generator.const.gcn.352 0
pushc generator.const.gcn.352
peek factorial.i
pop
generator.while.gcn.353.start:
pushcp generator.while.gcn.353.end
push factorial.a
push factorial.i
swp
bg
jz
pop
word generator.const.gcn.354 1
pushc generator.const.gcn.354
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
pushcp generator.while.gcn.353.start
jp
generator.while.gcn.353.end:
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
word generator.const.gcn.355 1
pushcp generator.const.gcn.355
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
word generator.const.gcn.356 180
pushc generator.const.gcn.356
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
word generator.const.gcn.357 180
pushc generator.const.gcn.357
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
word generator.const.gcn.358 2
pushc generator.const.gcn.358
push sinh.a
copy
swp
pop
neg
pushc m_e
pushc power
word generator.const.gcn.359 2
pushcp generator.const.gcn.359
push global.arg_counter
mov
jc
push sinh.a
pushc m_e
pushc power
word generator.const.gcn.360 2
pushcp generator.const.gcn.360
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
word generator.const.gcn.361 2
pushc generator.const.gcn.361
push cosh.a
copy
swp
pop
neg
pushc m_e
pushc power
word generator.const.gcn.362 2
pushcp generator.const.gcn.362
push global.arg_counter
mov
jc
push cosh.a
pushc m_e
pushc power
word generator.const.gcn.363 2
pushcp generator.const.gcn.363
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
word generator.const.gcn.364 1
pushcp generator.const.gcn.364
push global.arg_counter
mov
jc
word generator.const.gcn.365 1
pushc generator.const.gcn.365
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
word generator.const.gcn.366 1
pushcp generator.const.gcn.366
push global.arg_counter
mov
jc
word generator.const.gcn.367 1
pushc generator.const.gcn.367
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
word generator.const.gcn.368 1
pushcp generator.const.gcn.368
push global.arg_counter
mov
jc
push tgh.a
pushc sinh
word generator.const.gcn.369 1
pushcp generator.const.gcn.369
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
word generator.const.gcn.370 1
pushcp generator.const.gcn.370
push global.arg_counter
mov
jc
word generator.const.gcn.371 1
pushc generator.const.gcn.371
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
word generator.const.gcn.374 1
pushc generator.const.gcn.374
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
word generator.const.gcn.373 1
pushcp generator.const.gcn.373
push global.arg_counter
mov
jc
push arcsinh.a
copy
swp
pop
add
pushc log
word generator.const.gcn.372 1
pushcp generator.const.gcn.372
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
word generator.const.gcn.377 1
pushc generator.const.gcn.377
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
word generator.const.gcn.376 1
pushcp generator.const.gcn.376
push global.arg_counter
mov
jc
push arccosh.a
copy
swp
pop
add
pushc log
word generator.const.gcn.375 1
pushcp generator.const.gcn.375
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
word generator.const.gcn.378 2
pushc generator.const.gcn.378
push arctgh.a
word generator.const.gcn.380 1
pushc generator.const.gcn.380
copy
swp
pop
sub
push arctgh.a
word generator.const.gcn.381 1
pushc generator.const.gcn.381
copy
swp
pop
add
copy
swp
pop
div
pushc log
word generator.const.gcn.379 1
pushcp generator.const.gcn.379
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
word generator.const.gcn.382 2
pushc generator.const.gcn.382
word generator.const.gcn.384 1
pushc generator.const.gcn.384
push arcctgh.a
copy
swp
pop
sub
word generator.const.gcn.385 1
pushc generator.const.gcn.385
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
word generator.const.gcn.383 1
pushcp generator.const.gcn.383
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
str generator.const.gcn.387 ""
pushc generator.const.gcn.387
str generator.const.gcn.388 "0"
pushc generator.const.gcn.388
word generator.const.gcn.389 0
pushc generator.const.gcn.389
push complex__tostring.this
pushc vtable__im
swp
pushai
eq
word generator.const.gcn.390 0
pushc generator.const.gcn.390
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
word generator.const.gcn.386 3
pushcp generator.const.gcn.386
push global.arg_counter
mov
jc
str generator.const.gcn.392 ""
pushc generator.const.gcn.392
str generator.const.gcn.394 "i"
pushc generator.const.gcn.394
push complex__tostring.this
pushc vtable__im
swp
pushai
str generator.const.gcn.395 ""
pushc generator.const.gcn.395
copy
swp
pop
add
copy
swp
pop
add
str generator.const.gcn.397 "-i"
pushc generator.const.gcn.397
str generator.const.gcn.398 "i"
pushc generator.const.gcn.398
word generator.const.gcn.399 0
pushc generator.const.gcn.399
push complex__tostring.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.396 3
pushcp generator.const.gcn.396
push global.arg_counter
mov
jc
word generator.const.gcn.400 1
pushc generator.const.gcn.400
push complex__tostring.this
pushc vtable__im
swp
pushai
pushc abs
word generator.const.gcn.401 1
pushcp generator.const.gcn.401
push global.arg_counter
mov
jc
eq
pushc check
word generator.const.gcn.393 3
pushcp generator.const.gcn.393
push global.arg_counter
mov
jc
str generator.const.gcn.403 ""
pushc generator.const.gcn.403
str generator.const.gcn.405 ""
pushc generator.const.gcn.405
str generator.const.gcn.406 "+"
pushc generator.const.gcn.406
word generator.const.gcn.407 0
pushc generator.const.gcn.407
push complex__tostring.this
pushc vtable__re
swp
pushai
eq
not
pushc check
word generator.const.gcn.404 3
pushcp generator.const.gcn.404
push global.arg_counter
mov
jc
word generator.const.gcn.408 0
pushc generator.const.gcn.408
push complex__tostring.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.402 3
pushcp generator.const.gcn.402
push global.arg_counter
mov
jc
copy
swp
pop
add
word generator.const.gcn.409 0
pushc generator.const.gcn.409
push complex__tostring.this
pushc vtable__im
swp
pushai
eq
not
pushc check
word generator.const.gcn.391 3
pushcp generator.const.gcn.391
push global.arg_counter
mov
jc
str generator.const.gcn.411 ""
pushc generator.const.gcn.411
push complex__tostring.this
pushc vtable__re
swp
pushai
str generator.const.gcn.412 ""
pushc generator.const.gcn.412
copy
swp
pop
add
word generator.const.gcn.413 0
pushc generator.const.gcn.413
push complex__tostring.this
pushc vtable__re
swp
pushai
eq
not
pushc check
word generator.const.gcn.410 3
pushcp generator.const.gcn.410
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
word generator.const.gcn.414 2
pushcp generator.const.gcn.414
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
pushcp generator.if.gcn.415.else
word generator.const.gcn.416 0
pushc generator.const.gcn.416
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
generator.if.gcn.415.else:
pushcp generator.if.gcn.417.else
word generator.const.gcn.418 0
pushc generator.const.gcn.418
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
generator.if.gcn.417.else:
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
word generator.const.gcn.419 1
pushcp generator.const.gcn.419
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
pushcp generator.if.gcn.420.else
word generator.const.gcn.421 0
pushc generator.const.gcn.421
push complex__angle.this
pushc vtable__re
swp
pushai
eq
jz
pop
word generator.const.gcn.423 2
pushc generator.const.gcn.423
pushc m_pi
copy
swp
pop
neg
copy
swp
pop
div
word generator.const.gcn.424 2
pushc generator.const.gcn.424
pushc m_pi
copy
swp
pop
div
word generator.const.gcn.425 0
pushc generator.const.gcn.425
push complex__angle.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.422 3
pushcp generator.const.gcn.422
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.420.end
jp
generator.if.gcn.420.else:
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
word generator.const.gcn.426 1
pushcp generator.const.gcn.426
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
word generator.const.gcn.429 0
pushc generator.const.gcn.429
push complex__angle.this
pushc vtable__im
swp
pushai
be
pushc check
word generator.const.gcn.428 3
pushcp generator.const.gcn.428
push global.arg_counter
mov
jc
push complex__angle.fival
word generator.const.gcn.430 0
pushc generator.const.gcn.430
push complex__angle.this
pushc vtable__re
swp
pushai
bg
pushc check
word generator.const.gcn.427 3
pushcp generator.const.gcn.427
push global.arg_counter
mov
jc
jr
generator.if.gcn.420.end:
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
word generator.const.gcn.431 2
pushcp generator.const.gcn.431
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
word generator.const.gcn.432 0
pushcp generator.const.gcn.432
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
word generator.const.gcn.434 1
pushcp generator.const.gcn.434
push global.arg_counter
mov
jc
pcopy
word generator.const.gcn.436 0
pushc generator.const.gcn.436
eq
pushcp generator.case.gcn.435.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
word generator.const.gcn.438 0
pushc generator.const.gcn.438
swp
word generator.const.gcn.439 0
pushc generator.const.gcn.439
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.437 2
pushcp generator.const.gcn.437
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.433.end
jp
generator.case.gcn.435.end:
pcopy
word generator.const.gcn.441 1
pushc generator.const.gcn.441
eq
pushcp generator.case.gcn.440.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
word generator.const.gcn.443 0
pushc generator.const.gcn.443
swp
push cmath__unite.args
word generator.const.gcn.444 0
pushc generator.const.gcn.444
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.442 2
pushcp generator.const.gcn.442
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.433.end
jp
generator.case.gcn.440.end:
pcopy
word generator.const.gcn.446 2
pushc generator.const.gcn.446
eq
pushcp generator.case.gcn.445.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__unite.args
word generator.const.gcn.448 1
pushc generator.const.gcn.448
swp
pushai
swp
push cmath__unite.args
word generator.const.gcn.449 0
pushc generator.const.gcn.449
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.447 2
pushcp generator.const.gcn.447
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.433.end
jp
generator.case.gcn.445.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.451 "CMath.Unite: Invalid args."
pushc generator.const.gcn.451
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.450 1
pushcp generator.const.gcn.450
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.433.end:
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
word generator.const.gcn.453 0
pushc generator.const.gcn.453
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.452 2
pushcp generator.const.gcn.452
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
word generator.const.gcn.455 1
pushcp generator.const.gcn.455
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
word generator.const.gcn.456 1
pushcp generator.const.gcn.456
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
word generator.const.gcn.454 2
pushcp generator.const.gcn.454
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
word generator.const.gcn.457 2
pushcp generator.const.gcn.457
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
word generator.const.gcn.458 2
pushcp generator.const.gcn.458
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
word generator.const.gcn.459 2
pushcp generator.const.gcn.459
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
word generator.const.gcn.461 0
pushcp generator.const.gcn.461
push global.arg_counter
mov
jc
push cmath__div.z1
push structure_instance_cmath
peek global.this
pushc vtable__mul
swp
pushai
word generator.const.gcn.460 2
pushcp generator.const.gcn.460
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
word generator.const.gcn.463 0
pushcp generator.const.gcn.463
push global.arg_counter
mov
jc
push cmath__div.z2
push structure_instance_cmath
peek global.this
pushc vtable__mul
swp
pushai
word generator.const.gcn.462 2
pushcp generator.const.gcn.462
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
word generator.const.gcn.464 2
pushcp generator.const.gcn.464
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
word generator.const.gcn.466 0
pushcp generator.const.gcn.466
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.465 2
pushcp generator.const.gcn.465
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
word generator.const.gcn.467 0
pushcp generator.const.gcn.467
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
word generator.const.gcn.469 1
pushcp generator.const.gcn.469
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
word generator.const.gcn.470 1
pushcp generator.const.gcn.470
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
word generator.const.gcn.468 2
pushcp generator.const.gcn.468
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
word generator.const.gcn.472 0
pushcp generator.const.gcn.472
push global.arg_counter
mov
jc
swp
push cmath__ln.z
peek global.this
pushc vtable__module
swp
pushai
word generator.const.gcn.474 0
pushcp generator.const.gcn.474
push global.arg_counter
mov
jc
pushc log
word generator.const.gcn.473 1
pushcp generator.const.gcn.473
push global.arg_counter
mov
jc
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.471 2
pushcp generator.const.gcn.471
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
word generator.const.gcn.476 2
pushcp generator.const.gcn.476
push global.arg_counter
mov
jc
push cmath__logn.z
peek global.this
pushc vtable__angle
swp
pushai
word generator.const.gcn.477 0
pushcp generator.const.gcn.477
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
word generator.const.gcn.479 0
pushcp generator.const.gcn.479
push global.arg_counter
mov
jc
push cmath__logn.n
pushc logn
word generator.const.gcn.478 2
pushcp generator.const.gcn.478
push global.arg_counter
mov
jc
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.475 2
pushcp generator.const.gcn.475
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
word generator.const.gcn.481 1
pushcp generator.const.gcn.481
push global.arg_counter
mov
jc
push cmath__sin.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.482 1
pushcp generator.const.gcn.482
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
word generator.const.gcn.483 1
pushcp generator.const.gcn.483
push global.arg_counter
mov
jc
push cmath__sin.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.484 1
pushcp generator.const.gcn.484
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
word generator.const.gcn.480 2
pushcp generator.const.gcn.480
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
word generator.const.gcn.486 1
pushcp generator.const.gcn.486
push global.arg_counter
mov
jc
push cmath__cos.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.487 1
pushcp generator.const.gcn.487
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
word generator.const.gcn.488 1
pushcp generator.const.gcn.488
push global.arg_counter
mov
jc
push cmath__cos.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.489 1
pushcp generator.const.gcn.489
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
word generator.const.gcn.485 2
pushcp generator.const.gcn.485
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
word generator.const.gcn.491 2
pushc generator.const.gcn.491
copy
swp
pop
mul
pushc cosh
word generator.const.gcn.490 1
pushcp generator.const.gcn.490
push global.arg_counter
mov
jc
push cmath__tg.z
pushc vtable__re
swp
pushai
word generator.const.gcn.493 2
pushc generator.const.gcn.493
copy
swp
pop
mul
pushc cos
word generator.const.gcn.492 1
pushcp generator.const.gcn.492
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
word generator.const.gcn.496 2
pushc generator.const.gcn.496
copy
swp
pop
mul
pushc sinh
word generator.const.gcn.495 1
pushcp generator.const.gcn.495
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
word generator.const.gcn.498 2
pushc generator.const.gcn.498
copy
swp
pop
mul
pushc sin
word generator.const.gcn.497 1
pushcp generator.const.gcn.497
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
word generator.const.gcn.494 2
pushcp generator.const.gcn.494
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
word generator.const.gcn.500 2
pushc generator.const.gcn.500
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.501 1
pushcp generator.const.gcn.501
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.499 2
pushcp generator.const.gcn.499
push global.arg_counter
mov
jc
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.502 1
pushcp generator.const.gcn.502
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
word generator.const.gcn.503 1
pushcp generator.const.gcn.503
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
word generator.const.gcn.505 2
pushc generator.const.gcn.505
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.506 1
pushcp generator.const.gcn.506
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.504 2
pushcp generator.const.gcn.504
push global.arg_counter
mov
jc
word generator.const.gcn.508 2
pushc generator.const.gcn.508
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.509 1
pushcp generator.const.gcn.509
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.507 2
pushcp generator.const.gcn.507
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
word generator.const.gcn.510 1
pushcp generator.const.gcn.510
push global.arg_counter
mov
jc
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.511 1
pushcp generator.const.gcn.511
push global.arg_counter
mov
jc
word generator.const.gcn.513 2
pushc generator.const.gcn.513
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.514 1
pushcp generator.const.gcn.514
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.512 2
pushcp generator.const.gcn.512
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
word generator.const.gcn.516 2
pushc generator.const.gcn.516
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.517 1
pushcp generator.const.gcn.517
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.515 2
pushcp generator.const.gcn.515
push global.arg_counter
mov
jc
word generator.const.gcn.519 2
pushc generator.const.gcn.519
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.520 1
pushcp generator.const.gcn.520
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.518 2
pushcp generator.const.gcn.518
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
word generator.const.gcn.521 2
pushcp generator.const.gcn.521
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
word generator.const.gcn.523 2
pushc generator.const.gcn.523
push cmath__sec.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.524 1
pushcp generator.const.gcn.524
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.522 2
pushcp generator.const.gcn.522
push global.arg_counter
mov
jc
word generator.const.gcn.526 2
pushc generator.const.gcn.526
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.527 1
pushcp generator.const.gcn.527
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.525 2
pushcp generator.const.gcn.525
push global.arg_counter
mov
jc
copy
swp
pop
mul
peek cmath__sec.k
pop
word generator.const.gcn.529 2
pushc generator.const.gcn.529
push cmath__sec.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.530 1
pushcp generator.const.gcn.530
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.528 2
pushcp generator.const.gcn.528
push global.arg_counter
mov
jc
word generator.const.gcn.532 2
pushc generator.const.gcn.532
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.533 1
pushcp generator.const.gcn.533
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.531 2
pushcp generator.const.gcn.531
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
word generator.const.gcn.535 1
pushcp generator.const.gcn.535
push global.arg_counter
mov
jc
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.536 1
pushcp generator.const.gcn.536
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
word generator.const.gcn.537 1
pushcp generator.const.gcn.537
push global.arg_counter
mov
jc
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.538 1
pushcp generator.const.gcn.538
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
word generator.const.gcn.534 2
pushcp generator.const.gcn.534
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
word generator.const.gcn.540 2
pushc generator.const.gcn.540
push cmath__cosec.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.541 1
pushcp generator.const.gcn.541
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.539 2
pushcp generator.const.gcn.539
push global.arg_counter
mov
jc
word generator.const.gcn.543 2
pushc generator.const.gcn.543
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.544 1
pushcp generator.const.gcn.544
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.542 2
pushcp generator.const.gcn.542
push global.arg_counter
mov
jc
copy
swp
pop
mul
peek cmath__cosec.k
pop
word generator.const.gcn.546 2
pushc generator.const.gcn.546
push cmath__cosec.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.547 1
pushcp generator.const.gcn.547
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.545 2
pushcp generator.const.gcn.545
push global.arg_counter
mov
jc
word generator.const.gcn.549 2
pushc generator.const.gcn.549
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.550 1
pushcp generator.const.gcn.550
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.548 2
pushcp generator.const.gcn.548
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
word generator.const.gcn.552 1
pushcp generator.const.gcn.552
push global.arg_counter
mov
jc
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.553 1
pushcp generator.const.gcn.553
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
word generator.const.gcn.554 1
pushcp generator.const.gcn.554
push global.arg_counter
mov
jc
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.555 1
pushcp generator.const.gcn.555
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
word generator.const.gcn.551 2
pushcp generator.const.gcn.551
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
word generator.const.gcn.556 0
pushcp generator.const.gcn.556
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
word generator.const.gcn.557 0
pushcp generator.const.gcn.557
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
word generator.const.gcn.558 0
pushcp generator.const.gcn.558
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
word generator.const.gcn.559 0
pushcp generator.const.gcn.559
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
word generator.const.gcn.560 0
pushcp generator.const.gcn.560
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
word generator.const.gcn.561 0
pushcp generator.const.gcn.561
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
word generator.const.gcn.562 0
pushcp generator.const.gcn.562
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
word generator.const.gcn.563 0
pushcp generator.const.gcn.563
push global.arg_counter
mov
jc
peek graph__getaspectratio.yasp
pop
word generator.const.gcn.564 2
pushcp generator.const.gcn.564
word generator.const.gcn.565 1
pushcp generator.const.gcn.565
newa
pcopy
push graph__getaspectratio.xasp
swp
word generator.const.gcn.566 0
pushcp generator.const.gcn.566
swp
peekai
pcopy
push graph__getaspectratio.yasp
swp
word generator.const.gcn.567 1
pushcp generator.const.gcn.567
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
word generator.const.gcn.569 8
pushc generator.const.gcn.569
word generator.const.gcn.568 1
pushcp generator.const.gcn.568
newa
peek graph__getfillpattern.r
pop
@generator.for_each.gcn.570.array
@generator.for_each.gcn.570.i
@generator.for_each.gcn.570.to
word generator.const.gcn.571 7
pushc generator.const.gcn.571
word generator.const.gcn.572 0
pushc generator.const.gcn.572
pushcp system_op_range
jc
peek generator.for_each.gcn.570.array
alen
peek generator.for_each.gcn.570.to
pop
pushc global.zero
peek generator.for_each.gcn.570.i
pop
generator.for_each.gcn.570.start:
pushcp generator.for_each.gcn.570.end
push generator.for_each.gcn.570.i
push generator.for_each.gcn.570.to
eq
not
jz
pop
push generator.for_each.gcn.570.i
push generator.for_each.gcn.570.array
pushai
@graph__getfillpattern.i
peek graph__getfillpattern.i
pop
push structure_instance_stack
peek global.this
pushc vtable__pop
swp
pushai
word generator.const.gcn.573 0
pushcp generator.const.gcn.573
push global.arg_counter
mov
jc
push graph__getfillpattern.r
push graph__getfillpattern.i
swp
peekai
generator.for_each.gcn.570.continue:
push generator.for_each.gcn.570.i
inc
pop
pushcp generator.for_each.gcn.570.start
jp
generator.for_each.gcn.570.end:
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
word generator.const.gcn.574 0
pushcp generator.const.gcn.574
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
word generator.const.gcn.575 0
pushcp generator.const.gcn.575
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
word generator.const.gcn.576 0
pushcp generator.const.gcn.576
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
word generator.const.gcn.577 0
pushcp generator.const.gcn.577
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
word generator.const.gcn.578 0
pushcp generator.const.gcn.578
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
word generator.const.gcn.579 0
pushcp generator.const.gcn.579
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
word generator.const.gcn.580 0
pushcp generator.const.gcn.580
push global.arg_counter
mov
jc
peek graph__getmoderange.b
pop
word generator.const.gcn.581 2
pushcp generator.const.gcn.581
word generator.const.gcn.582 1
pushcp generator.const.gcn.582
newa
pcopy
push graph__getmoderange.a
swp
word generator.const.gcn.583 0
pushcp generator.const.gcn.583
swp
peekai
pcopy
push graph__getmoderange.b
swp
word generator.const.gcn.584 1
pushcp generator.const.gcn.584
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
word generator.const.gcn.585 0
pushcp generator.const.gcn.585
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
word generator.const.gcn.586 0
pushcp generator.const.gcn.586
push global.arg_counter
mov
jc
peek graph__detect.mode
pop
word generator.const.gcn.587 2
pushcp generator.const.gcn.587
word generator.const.gcn.588 1
pushcp generator.const.gcn.588
newa
pcopy
push graph__detect.driver
swp
word generator.const.gcn.589 0
pushcp generator.const.gcn.589
swp
peekai
pcopy
push graph__detect.mode
swp
word generator.const.gcn.590 1
pushcp generator.const.gcn.590
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
word generator.const.gcn.592 0
pushc generator.const.gcn.592
word generator.const.gcn.593 0
pushc generator.const.gcn.593
push structure_instance_graph
peek global.this
pushc vtable__bar
swp
pushai
word generator.const.gcn.591 4
pushcp generator.const.gcn.591
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
str generator.const.gcn.594 ""
pushc generator.const.gcn.594
word generator.const.gcn.595 0
pushc generator.const.gcn.595
word generator.const.gcn.596 0
pushc generator.const.gcn.596
pushc graph_initgraph
invoke
push structure_instance_graph
peek global.this
pushc vtable__clear
swp
pushai
word generator.const.gcn.597 0
pushcp generator.const.gcn.597
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
word __vtable__size__ 131
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