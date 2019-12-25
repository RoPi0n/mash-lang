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
str eraisedexception "ERaisedException"
str einvalidvmop "EInvalidSVMOperation"
str einvalidtypecast "EInvalidSVMTypeCast"
str eabstracterror "EAbstractError"
str eunknownexception "EUnknownException"
str einterror "EInterror"
str edivbyzero "EDivByZero"
str erangeerror "ERangeError"
str eintoverflow "EIntOverflow"
str ematherror "EMathError"
str einvalidop "EInvalidOp"
str ezerodivide "EZeroDivide"
str eoverflow "EOverflow"
str eunderflow "EUnderflow"
str eaccessviolation "EAccessViolation"
str eoserror "EOSError"
str enothreadsupport "ENoThreadSupport"
real m_pi 3.14159265358979
real m_e 2.71828182845904
word vtable__type 0
word vtable__re 1
word vtable__im 2
word vtable__classname 3
word vtable__message 4
word vtable__normvideo 5
word vtable__wherex 6
word vtable__wherey 7
word vtable__pause 8
word vtable__cursorbig 9
word vtable__cursoroff 10
word vtable__cursoron 11
word vtable__delline 12
word vtable__gotoxy 13
word vtable__insline 14
word vtable__keypressed 15
word vtable__readkey 16
word vtable__sound 17
word vtable__window32 18
word vtable__clreol 19
word vtable__clrscr 20
word vtable__getdirectvideo 21
word vtable__getlastmode 22
word vtable__settextattr 23
word vtable__gettextattr 24
word vtable__getwindmax 25
word vtable__getwindmaxx 26
word vtable__getwindmaxy 27
word vtable__getwindmin 28
word vtable__getwindminx 29
word vtable__getwindminy 30
word vtable__getcheckbreak 31
word vtable__getcheckeof 32
word vtable__getchecksnow 33
word vtable__textcolor 34
word vtable__textbackground 35
word vtable__create 36
word vtable__set 37
word vtable__tostring 38
word vtable__clone 39
word vtable__compareto 40
word vtable__module 41
word vtable__angle 42
word vtable__conjugate 43
word vtable__unite 44
word vtable__uniteim 45
word vtable__uniteviaexp 46
word vtable__add 47
word vtable__sub 48
word vtable__mul 49
word vtable__div 50
word vtable__power 51
word vtable__ln 52
word vtable__logn 53
word vtable__sin 54
word vtable__cos 55
word vtable__tg 56
word vtable__ctg 57
word vtable__sec 58
word vtable__cosec 59
word vtable__push 60
word vtable__peek 61
word vtable__pop 62
@global.arg_counter
@global.temp
@global.this
word global.zero 0
word global.one 1
str global.raised "ERaisedException"
pushc global.zero
peek global.arg_counter
pop
@types
@typeptr
@sysslash
@null
@params
@eabstractexception
@emathexception
@ecriticalexception
@eunknown
word crt 8
@structure_instance_crt
pushcp __allocator__crt
jc
peek structure_instance_crt
pop
word complex 9
@structure_instance_complex
pushcp __allocator__complex
jc
peek structure_instance_complex
pop
word cmath 10
@structure_instance_cmath
pushcp __allocator__cmath
jc
peek structure_instance_cmath
pop
word stack 11
@structure_instance_stack
pushcp __allocator__stack
jc
peek structure_instance_stack
pop
word exception 12
@structure_instance_exception
pushcp __allocator__exception
jc
peek structure_instance_exception
pop
pushcp __init__
jc
@types
word generator.const.gcn.0 8
pushcp generator.const.gcn.0
pushcp global.one
newa
peek types
word typenull 0
pcopy
pushc typenull
swp
word generator.const.gcn.1 0
pushcp generator.const.gcn.1
swp
peekai
word typeword 1
pcopy
pushc typeword
swp
word generator.const.gcn.2 1
pushcp generator.const.gcn.2
swp
peekai
word typeint 2
pcopy
pushc typeint
swp
word generator.const.gcn.3 2
pushcp generator.const.gcn.3
swp
peekai
word typereal 3
pcopy
pushc typereal
swp
word generator.const.gcn.4 3
pushcp generator.const.gcn.4
swp
peekai
word typestr 4
pcopy
pushc typestr
swp
word generator.const.gcn.5 4
pushcp generator.const.gcn.5
swp
peekai
word typearray 5
pcopy
pushc typearray
swp
word generator.const.gcn.6 5
pushcp generator.const.gcn.6
swp
peekai
word typeclass 6
pcopy
pushc typeclass
swp
word generator.const.gcn.7 6
pushcp generator.const.gcn.7
swp
peekai
word typeref 7
pcopy
pushc typeref
swp
word generator.const.gcn.8 7
pushcp generator.const.gcn.8
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
pushc __getvm_null__
word generator.const.gcn.9 0
pushcp generator.const.gcn.9
push global.arg_counter
mov
jc
peek null
pop
push null
peek params
pop
pushc __initproc__
word generator.const.gcn.10 0
pushcp generator.const.gcn.10
push global.arg_counter
mov
jc
jr
__init__end__:
word generator.const.gcn.11 5
pushcp generator.const.gcn.11
word generator.const.gcn.12 1
pushcp generator.const.gcn.12
newa
pcopy
pushc eraisedexception
swp
word generator.const.gcn.13 0
pushcp generator.const.gcn.13
swp
peekai
pcopy
pushc einvalidvmop
swp
word generator.const.gcn.14 1
pushcp generator.const.gcn.14
swp
peekai
pcopy
pushc einvalidtypecast
swp
word generator.const.gcn.15 2
pushcp generator.const.gcn.15
swp
peekai
pcopy
pushc eabstracterror
swp
word generator.const.gcn.16 3
pushcp generator.const.gcn.16
swp
peekai
pcopy
pushc eunknownexception
swp
word generator.const.gcn.17 4
pushcp generator.const.gcn.17
swp
peekai
peek eabstractexception
pop
word generator.const.gcn.18 9
pushcp generator.const.gcn.18
word generator.const.gcn.19 1
pushcp generator.const.gcn.19
newa
pcopy
pushc einterror
swp
word generator.const.gcn.20 0
pushcp generator.const.gcn.20
swp
peekai
pcopy
pushc edivbyzero
swp
word generator.const.gcn.21 1
pushcp generator.const.gcn.21
swp
peekai
pcopy
pushc erangeerror
swp
word generator.const.gcn.22 2
pushcp generator.const.gcn.22
swp
peekai
pcopy
pushc eintoverflow
swp
word generator.const.gcn.23 3
pushcp generator.const.gcn.23
swp
peekai
pcopy
pushc ematherror
swp
word generator.const.gcn.24 4
pushcp generator.const.gcn.24
swp
peekai
pcopy
pushc einvalidop
swp
word generator.const.gcn.25 5
pushcp generator.const.gcn.25
swp
peekai
pcopy
pushc ezerodivide
swp
word generator.const.gcn.26 6
pushcp generator.const.gcn.26
swp
peekai
pcopy
pushc eoverflow
swp
word generator.const.gcn.27 7
pushcp generator.const.gcn.27
swp
peekai
pcopy
pushc eunderflow
swp
word generator.const.gcn.28 8
pushcp generator.const.gcn.28
swp
peekai
peek emathexception
pop
word generator.const.gcn.29 3
pushcp generator.const.gcn.29
word generator.const.gcn.30 1
pushcp generator.const.gcn.30
newa
pcopy
pushc eaccessviolation
swp
word generator.const.gcn.31 0
pushcp generator.const.gcn.31
swp
peekai
pcopy
pushc eoserror
swp
word generator.const.gcn.32 1
pushcp generator.const.gcn.32
swp
peekai
pcopy
pushc enothreadsupport
swp
word generator.const.gcn.33 2
pushcp generator.const.gcn.33
swp
peekai
peek ecriticalexception
pop
str generator.const.gcn.35 "Unknown raised exception."
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
@main.a
@main.b
pushcp __allocator__complex
jc
pcopy
peek global.this
word generator.const.gcn.37 1
pushc generator.const.gcn.37
swp
word generator.const.gcn.38 3
pushc generator.const.gcn.38
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.36 2
pushcp generator.const.gcn.36
push global.arg_counter
mov
jc
peek main.a
pop
pushcp __allocator__complex
jc
pcopy
peek global.this
word generator.const.gcn.40 2
pushc generator.const.gcn.40
copy
swp
pop
neg
swp
word generator.const.gcn.41 5
pushc generator.const.gcn.41
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.39 2
pushcp generator.const.gcn.39
push global.arg_counter
mov
jc
peek main.b
pop
push main.a
pushc println
word generator.const.gcn.42 1
pushcp generator.const.gcn.42
push global.arg_counter
mov
jc
str generator.const.gcn.44 "+"
pushc generator.const.gcn.44
pushc println
word generator.const.gcn.43 1
pushcp generator.const.gcn.43
push global.arg_counter
mov
jc
push main.b
pushc println
word generator.const.gcn.45 1
pushcp generator.const.gcn.45
push global.arg_counter
mov
jc
str generator.const.gcn.47 "="
pushc generator.const.gcn.47
pushc println
word generator.const.gcn.46 1
pushcp generator.const.gcn.46
push global.arg_counter
mov
jc
push main.b
push main.a
push structure_instance_cmath
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.49 2
pushcp generator.const.gcn.49
push global.arg_counter
mov
jc
pushc println
word generator.const.gcn.48 1
pushcp generator.const.gcn.48
push global.arg_counter
mov
jc
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
str generator.const.gcn.50 "["
pushc generator.const.gcn.50
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.51 1
pushcp generator.const.gcn.51
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.52 0
pushc generator.const.gcn.52
peek __printarray.i
pop
generator.while.gcn.53.start:
pushcp generator.while.gcn.53.end
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
word generator.const.gcn.54 1
pushcp generator.const.gcn.54
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
pushcp generator.if.gcn.55.else
push __printarray.l
word generator.const.gcn.56 1
pushc generator.const.gcn.56
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.57 ", "
pushc generator.const.gcn.57
pushc _print
invoke
generator.if.gcn.55.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.53.start
jp
generator.while.gcn.53.end:
str generator.const.gcn.58 "]"
pushc generator.const.gcn.58
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
word generator.const.gcn.60 1
pushcp generator.const.gcn.60
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.61.end
swp
jz
str generator.const.gcn.62 "(null)"
pushc generator.const.gcn.62
pushc _print
invoke
pushcp generator.switch.gcn.59.end
jp
generator.case.gcn.61.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.63.end
swp
jz
push __print.obj
peek global.this
pushc vtable__tostring
swp
pushai
word generator.const.gcn.64 0
pushcp generator.const.gcn.64
push global.arg_counter
mov
jc
pushc _print
invoke
pushcp generator.switch.gcn.59.end
jp
generator.case.gcn.63.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.65.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.66 1
pushcp generator.const.gcn.66
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.59.end
jp
generator.case.gcn.65.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.59.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.67 0
pushcp generator.const.gcn.67
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.68.array
@generator.for_each.gcn.68.i
@generator.for_each.gcn.68.to
push print.args
peek generator.for_each.gcn.68.array
alen
peek generator.for_each.gcn.68.to
pop
pushc global.zero
peek generator.for_each.gcn.68.i
pop
generator.for_each.gcn.68.start:
pushcp generator.for_each.gcn.68.end
push generator.for_each.gcn.68.i
push generator.for_each.gcn.68.to
eq
not
jz
pop
push generator.for_each.gcn.68.i
push generator.for_each.gcn.68.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.69 1
pushcp generator.const.gcn.69
push global.arg_counter
mov
jc
generator.for_each.gcn.68.continue:
push generator.for_each.gcn.68.i
inc
pop
pushcp generator.for_each.gcn.68.start
jp
generator.for_each.gcn.68.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.70 0
pushcp generator.const.gcn.70
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.71.array
@generator.for_each.gcn.71.i
@generator.for_each.gcn.71.to
push println.args
peek generator.for_each.gcn.71.array
alen
peek generator.for_each.gcn.71.to
pop
pushc global.zero
peek generator.for_each.gcn.71.i
pop
generator.for_each.gcn.71.start:
pushcp generator.for_each.gcn.71.end
push generator.for_each.gcn.71.i
push generator.for_each.gcn.71.to
eq
not
jz
pop
push generator.for_each.gcn.71.i
push generator.for_each.gcn.71.array
pushai
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.72 1
pushcp generator.const.gcn.72
push global.arg_counter
mov
jc
generator.for_each.gcn.71.continue:
push generator.for_each.gcn.71.i
inc
pop
pushcp generator.for_each.gcn.71.start
jp
generator.for_each.gcn.71.end:
str generator.const.gcn.73 ""
pushc generator.const.gcn.73
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
word generator.const.gcn.74 7
pushc generator.const.gcn.74
pushc crt_textcolor
invoke
word generator.const.gcn.75 0
pushc generator.const.gcn.75
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
word generator.const.gcn.76 256
pushc generator.const.gcn.76
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
word generator.const.gcn.77 256
pushc generator.const.gcn.77
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
str generator.const.gcn.79 ""
pushc generator.const.gcn.79
str generator.const.gcn.80 "0"
pushc generator.const.gcn.80
word generator.const.gcn.81 0
pushc generator.const.gcn.81
push complex__tostring.this
pushc vtable__im
swp
pushai
eq
word generator.const.gcn.82 0
pushc generator.const.gcn.82
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
word generator.const.gcn.78 3
pushcp generator.const.gcn.78
push global.arg_counter
mov
jc
str generator.const.gcn.84 ""
pushc generator.const.gcn.84
str generator.const.gcn.86 "i"
pushc generator.const.gcn.86
push complex__tostring.this
pushc vtable__im
swp
pushai
str generator.const.gcn.87 ""
pushc generator.const.gcn.87
copy
swp
pop
add
copy
swp
pop
add
str generator.const.gcn.89 "-i"
pushc generator.const.gcn.89
str generator.const.gcn.90 "i"
pushc generator.const.gcn.90
word generator.const.gcn.91 0
pushc generator.const.gcn.91
push complex__tostring.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.88 3
pushcp generator.const.gcn.88
push global.arg_counter
mov
jc
word generator.const.gcn.92 1
pushc generator.const.gcn.92
push complex__tostring.this
pushc vtable__im
swp
pushai
pushc abs
word generator.const.gcn.93 1
pushcp generator.const.gcn.93
push global.arg_counter
mov
jc
eq
pushc check
word generator.const.gcn.85 3
pushcp generator.const.gcn.85
push global.arg_counter
mov
jc
str generator.const.gcn.95 ""
pushc generator.const.gcn.95
str generator.const.gcn.97 ""
pushc generator.const.gcn.97
str generator.const.gcn.98 "+"
pushc generator.const.gcn.98
word generator.const.gcn.99 0
pushc generator.const.gcn.99
push complex__tostring.this
pushc vtable__re
swp
pushai
eq
not
pushc check
word generator.const.gcn.96 3
pushcp generator.const.gcn.96
push global.arg_counter
mov
jc
word generator.const.gcn.100 0
pushc generator.const.gcn.100
push complex__tostring.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.94 3
pushcp generator.const.gcn.94
push global.arg_counter
mov
jc
copy
swp
pop
add
word generator.const.gcn.101 0
pushc generator.const.gcn.101
push complex__tostring.this
pushc vtable__im
swp
pushai
eq
not
pushc check
word generator.const.gcn.83 3
pushcp generator.const.gcn.83
push global.arg_counter
mov
jc
str generator.const.gcn.103 ""
pushc generator.const.gcn.103
push complex__tostring.this
pushc vtable__re
swp
pushai
str generator.const.gcn.104 ""
pushc generator.const.gcn.104
copy
swp
pop
add
word generator.const.gcn.105 0
pushc generator.const.gcn.105
push complex__tostring.this
pushc vtable__re
swp
pushai
eq
not
pushc check
word generator.const.gcn.102 3
pushcp generator.const.gcn.102
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
word generator.const.gcn.106 2
pushcp generator.const.gcn.106
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
pushcp generator.if.gcn.107.else
word generator.const.gcn.108 0
pushc generator.const.gcn.108
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
generator.if.gcn.107.else:
pushcp generator.if.gcn.109.else
word generator.const.gcn.110 0
pushc generator.const.gcn.110
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
generator.if.gcn.109.else:
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
word generator.const.gcn.111 1
pushcp generator.const.gcn.111
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
pushcp generator.if.gcn.112.else
word generator.const.gcn.113 0
pushc generator.const.gcn.113
push complex__angle.this
pushc vtable__re
swp
pushai
eq
jz
pop
word generator.const.gcn.115 2
pushc generator.const.gcn.115
pushc m_pi
copy
swp
pop
neg
copy
swp
pop
div
word generator.const.gcn.116 2
pushc generator.const.gcn.116
pushc m_pi
copy
swp
pop
div
word generator.const.gcn.117 0
pushc generator.const.gcn.117
push complex__angle.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.114 3
pushcp generator.const.gcn.114
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.112.end
jp
generator.if.gcn.112.else:
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
word generator.const.gcn.118 1
pushcp generator.const.gcn.118
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
word generator.const.gcn.121 0
pushc generator.const.gcn.121
push complex__angle.this
pushc vtable__im
swp
pushai
be
pushc check
word generator.const.gcn.120 3
pushcp generator.const.gcn.120
push global.arg_counter
mov
jc
push complex__angle.fival
word generator.const.gcn.122 0
pushc generator.const.gcn.122
push complex__angle.this
pushc vtable__re
swp
pushai
bg
pushc check
word generator.const.gcn.119 3
pushcp generator.const.gcn.119
push global.arg_counter
mov
jc
jr
generator.if.gcn.112.end:
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
word generator.const.gcn.123 2
pushcp generator.const.gcn.123
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
word generator.const.gcn.124 0
pushcp generator.const.gcn.124
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
word generator.const.gcn.126 1
pushcp generator.const.gcn.126
push global.arg_counter
mov
jc
pcopy
word generator.const.gcn.128 0
pushc generator.const.gcn.128
eq
pushcp generator.case.gcn.127.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
word generator.const.gcn.130 0
pushc generator.const.gcn.130
swp
word generator.const.gcn.131 0
pushc generator.const.gcn.131
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.129 2
pushcp generator.const.gcn.129
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.125.end
jp
generator.case.gcn.127.end:
pcopy
word generator.const.gcn.133 1
pushc generator.const.gcn.133
eq
pushcp generator.case.gcn.132.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
word generator.const.gcn.135 0
pushc generator.const.gcn.135
swp
push cmath__unite.args
word generator.const.gcn.136 0
pushc generator.const.gcn.136
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.134 2
pushcp generator.const.gcn.134
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.125.end
jp
generator.case.gcn.132.end:
pcopy
word generator.const.gcn.138 2
pushc generator.const.gcn.138
eq
pushcp generator.case.gcn.137.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__unite.args
word generator.const.gcn.140 1
pushc generator.const.gcn.140
swp
pushai
swp
push cmath__unite.args
word generator.const.gcn.141 0
pushc generator.const.gcn.141
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.139 2
pushcp generator.const.gcn.139
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.125.end
jp
generator.case.gcn.137.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.143 "CMath.Unite: Invalid args."
pushc generator.const.gcn.143
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.142 1
pushcp generator.const.gcn.142
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.125.end:
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
word generator.const.gcn.145 0
pushc generator.const.gcn.145
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.144 2
pushcp generator.const.gcn.144
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
word generator.const.gcn.147 1
pushcp generator.const.gcn.147
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
word generator.const.gcn.148 1
pushcp generator.const.gcn.148
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
word generator.const.gcn.146 2
pushcp generator.const.gcn.146
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
word generator.const.gcn.149 2
pushcp generator.const.gcn.149
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
word generator.const.gcn.150 2
pushcp generator.const.gcn.150
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
word generator.const.gcn.151 2
pushcp generator.const.gcn.151
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
word generator.const.gcn.153 0
pushcp generator.const.gcn.153
push global.arg_counter
mov
jc
push cmath__div.z1
push structure_instance_cmath
peek global.this
pushc vtable__mul
swp
pushai
word generator.const.gcn.152 2
pushcp generator.const.gcn.152
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
word generator.const.gcn.155 0
pushcp generator.const.gcn.155
push global.arg_counter
mov
jc
push cmath__div.z2
push structure_instance_cmath
peek global.this
pushc vtable__mul
swp
pushai
word generator.const.gcn.154 2
pushcp generator.const.gcn.154
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
word generator.const.gcn.156 2
pushcp generator.const.gcn.156
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
word generator.const.gcn.158 0
pushcp generator.const.gcn.158
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.157 2
pushcp generator.const.gcn.157
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
word generator.const.gcn.159 0
pushcp generator.const.gcn.159
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
word generator.const.gcn.161 1
pushcp generator.const.gcn.161
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
word generator.const.gcn.162 1
pushcp generator.const.gcn.162
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
word generator.const.gcn.160 2
pushcp generator.const.gcn.160
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
word generator.const.gcn.164 0
pushcp generator.const.gcn.164
push global.arg_counter
mov
jc
swp
push cmath__ln.z
peek global.this
pushc vtable__module
swp
pushai
word generator.const.gcn.166 0
pushcp generator.const.gcn.166
push global.arg_counter
mov
jc
pushc log
word generator.const.gcn.165 1
pushcp generator.const.gcn.165
push global.arg_counter
mov
jc
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.163 2
pushcp generator.const.gcn.163
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
word generator.const.gcn.168 2
pushcp generator.const.gcn.168
push global.arg_counter
mov
jc
push cmath__logn.z
peek global.this
pushc vtable__angle
swp
pushai
word generator.const.gcn.169 0
pushcp generator.const.gcn.169
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
word generator.const.gcn.171 0
pushcp generator.const.gcn.171
push global.arg_counter
mov
jc
push cmath__logn.n
pushc logn
word generator.const.gcn.170 2
pushcp generator.const.gcn.170
push global.arg_counter
mov
jc
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.167 2
pushcp generator.const.gcn.167
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
word generator.const.gcn.173 1
pushcp generator.const.gcn.173
push global.arg_counter
mov
jc
push cmath__sin.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.174 1
pushcp generator.const.gcn.174
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
word generator.const.gcn.175 1
pushcp generator.const.gcn.175
push global.arg_counter
mov
jc
push cmath__sin.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.176 1
pushcp generator.const.gcn.176
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
word generator.const.gcn.172 2
pushcp generator.const.gcn.172
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
word generator.const.gcn.178 1
pushcp generator.const.gcn.178
push global.arg_counter
mov
jc
push cmath__cos.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.179 1
pushcp generator.const.gcn.179
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
word generator.const.gcn.180 1
pushcp generator.const.gcn.180
push global.arg_counter
mov
jc
push cmath__cos.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.181 1
pushcp generator.const.gcn.181
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
word generator.const.gcn.177 2
pushcp generator.const.gcn.177
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
word generator.const.gcn.183 2
pushc generator.const.gcn.183
copy
swp
pop
mul
pushc cosh
word generator.const.gcn.182 1
pushcp generator.const.gcn.182
push global.arg_counter
mov
jc
push cmath__tg.z
pushc vtable__re
swp
pushai
word generator.const.gcn.185 2
pushc generator.const.gcn.185
copy
swp
pop
mul
pushc cos
word generator.const.gcn.184 1
pushcp generator.const.gcn.184
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
word generator.const.gcn.188 2
pushc generator.const.gcn.188
copy
swp
pop
mul
pushc sinh
word generator.const.gcn.187 1
pushcp generator.const.gcn.187
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
word generator.const.gcn.190 2
pushc generator.const.gcn.190
copy
swp
pop
mul
pushc sin
word generator.const.gcn.189 1
pushcp generator.const.gcn.189
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
word generator.const.gcn.186 2
pushcp generator.const.gcn.186
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
word generator.const.gcn.192 2
pushc generator.const.gcn.192
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.193 1
pushcp generator.const.gcn.193
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.191 2
pushcp generator.const.gcn.191
push global.arg_counter
mov
jc
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.194 1
pushcp generator.const.gcn.194
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
word generator.const.gcn.195 1
pushcp generator.const.gcn.195
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
word generator.const.gcn.197 2
pushc generator.const.gcn.197
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.198 1
pushcp generator.const.gcn.198
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.196 2
pushcp generator.const.gcn.196
push global.arg_counter
mov
jc
word generator.const.gcn.200 2
pushc generator.const.gcn.200
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.201 1
pushcp generator.const.gcn.201
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.199 2
pushcp generator.const.gcn.199
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
word generator.const.gcn.202 1
pushcp generator.const.gcn.202
push global.arg_counter
mov
jc
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.203 1
pushcp generator.const.gcn.203
push global.arg_counter
mov
jc
word generator.const.gcn.205 2
pushc generator.const.gcn.205
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.206 1
pushcp generator.const.gcn.206
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.204 2
pushcp generator.const.gcn.204
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
word generator.const.gcn.208 2
pushc generator.const.gcn.208
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.209 1
pushcp generator.const.gcn.209
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.207 2
pushcp generator.const.gcn.207
push global.arg_counter
mov
jc
word generator.const.gcn.211 2
pushc generator.const.gcn.211
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.212 1
pushcp generator.const.gcn.212
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.210 2
pushcp generator.const.gcn.210
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
word generator.const.gcn.213 2
pushcp generator.const.gcn.213
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
word generator.const.gcn.215 2
pushc generator.const.gcn.215
push cmath__sec.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.216 1
pushcp generator.const.gcn.216
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.214 2
pushcp generator.const.gcn.214
push global.arg_counter
mov
jc
word generator.const.gcn.218 2
pushc generator.const.gcn.218
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.219 1
pushcp generator.const.gcn.219
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.217 2
pushcp generator.const.gcn.217
push global.arg_counter
mov
jc
copy
swp
pop
mul
peek cmath__sec.k
pop
word generator.const.gcn.221 2
pushc generator.const.gcn.221
push cmath__sec.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.222 1
pushcp generator.const.gcn.222
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.220 2
pushcp generator.const.gcn.220
push global.arg_counter
mov
jc
word generator.const.gcn.224 2
pushc generator.const.gcn.224
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.225 1
pushcp generator.const.gcn.225
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.223 2
pushcp generator.const.gcn.223
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
word generator.const.gcn.227 1
pushcp generator.const.gcn.227
push global.arg_counter
mov
jc
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.228 1
pushcp generator.const.gcn.228
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
word generator.const.gcn.229 1
pushcp generator.const.gcn.229
push global.arg_counter
mov
jc
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.230 1
pushcp generator.const.gcn.230
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
word generator.const.gcn.226 2
pushcp generator.const.gcn.226
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
word generator.const.gcn.232 2
pushc generator.const.gcn.232
push cmath__cosec.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.233 1
pushcp generator.const.gcn.233
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.231 2
pushcp generator.const.gcn.231
push global.arg_counter
mov
jc
word generator.const.gcn.235 2
pushc generator.const.gcn.235
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.236 1
pushcp generator.const.gcn.236
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.234 2
pushcp generator.const.gcn.234
push global.arg_counter
mov
jc
copy
swp
pop
mul
peek cmath__cosec.k
pop
word generator.const.gcn.238 2
pushc generator.const.gcn.238
push cmath__cosec.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.239 1
pushcp generator.const.gcn.239
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.237 2
pushcp generator.const.gcn.237
push global.arg_counter
mov
jc
word generator.const.gcn.241 2
pushc generator.const.gcn.241
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.242 1
pushcp generator.const.gcn.242
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.240 2
pushcp generator.const.gcn.240
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
word generator.const.gcn.244 1
pushcp generator.const.gcn.244
push global.arg_counter
mov
jc
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.245 1
pushcp generator.const.gcn.245
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
word generator.const.gcn.246 1
pushcp generator.const.gcn.246
push global.arg_counter
mov
jc
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.247 1
pushcp generator.const.gcn.247
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
word generator.const.gcn.243 2
pushcp generator.const.gcn.243
push global.arg_counter
mov
jc
jr
jr
cmath__cosec__end:
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
pushcp generator.if.gcn.248.else
push system_op_range.isback
jz
pop
word generator.const.gcn.249 1
pushc generator.const.gcn.249
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
pushcp generator.if.gcn.248.end
jp
generator.if.gcn.248.else:
word generator.const.gcn.250 1
pushc generator.const.gcn.250
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
generator.if.gcn.248.end:
push system_op_range.l
word generator.const.gcn.251 1
pushcp generator.const.gcn.251
newa
peek system_op_range.res
pop
word generator.const.gcn.252 0
pushc generator.const.gcn.252
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.253 1
pushcp generator.const.gcn.253
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.254.start:
pushcp generator.while.gcn.254.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.255 1
pushcp generator.const.gcn.255
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
pushcp generator.if.gcn.256.else
push system_op_range.isback
jz
pop
word generator.const.gcn.257 1
pushc generator.const.gcn.257
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.256.end
jp
generator.if.gcn.256.else:
word generator.const.gcn.258 1
pushc generator.const.gcn.258
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.256.end:
pushcp generator.while.gcn.254.start
jp
generator.while.gcn.254.end:
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
@generator.for_each.gcn.259.array
@generator.for_each.gcn.259.i
@generator.for_each.gcn.259.to
push system_op_in.right
peek generator.for_each.gcn.259.array
alen
peek generator.for_each.gcn.259.to
pop
pushc global.zero
peek generator.for_each.gcn.259.i
pop
generator.for_each.gcn.259.start:
pushcp generator.for_each.gcn.259.end
push generator.for_each.gcn.259.i
push generator.for_each.gcn.259.to
eq
not
jz
pop
push generator.for_each.gcn.259.i
push generator.for_each.gcn.259.array
pushai
@system_op_in.x
peek system_op_in.x
pop
pushcp generator.if.gcn.260.else
push system_op_in.left
push system_op_in.x
eq
jz
pop
pushc true
jr
generator.if.gcn.260.else:
generator.for_each.gcn.259.continue:
push generator.for_each.gcn.259.i
inc
pop
pushcp generator.for_each.gcn.259.start
jp
generator.for_each.gcn.259.end:
pushc false
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
word generator.const.gcn.261 0
pushc generator.const.gcn.261
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.262 1
pushcp generator.const.gcn.262
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.263.start:
pushcp generator.while.gcn.263.end
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
pushcp generator.while.gcn.263.start
jp
generator.while.gcn.263.end:
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
push typeof.t
pcopy
word generator.const.gcn.266 255
pushc generator.const.gcn.266
eq
pushcp generator.case.gcn.265.end
swp
jz
push null
peek typeof.t
pop
pushcp generator.switch.gcn.264.end
jp
generator.case.gcn.265.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.267.end
swp
jz
push typeof.object
pushc vtable__type
swp
pushai
peek typeof.t
pop
pushcp generator.switch.gcn.264.end
jp
generator.case.gcn.267.end:
push eunknown
pushc global.raised
trr
generator.switch.gcn.264.end:
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
peek system_op_is.left
pop
peek system_op_is.right
pop
str generator.const.gcn.269 "IS"
pushc generator.const.gcn.269
pushc println
word generator.const.gcn.268 1
pushcp generator.const.gcn.268
push global.arg_counter
mov
jc
push system_op_is.right
push system_op_is.left
pushc typeof
word generator.const.gcn.270 1
pushcp generator.const.gcn.270
push global.arg_counter
mov
jc
eq
jr
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
word generator.const.gcn.271 1
pushcp generator.const.gcn.271
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.272 1
pushcp generator.const.gcn.272
newa
peek system_copy_array.r
pop
word generator.const.gcn.273 0
pushc generator.const.gcn.273
peek system_copy_array.i
pop
generator.while.gcn.274.start:
pushcp generator.while.gcn.274.end
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
word generator.const.gcn.275 1
pushcp generator.const.gcn.275
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
pushcp generator.while.gcn.274.start
jp
generator.while.gcn.274.end:
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
pushcp generator.if.gcn.276.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.277 1
pushcp generator.const.gcn.277
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.278 1
pushcp generator.const.gcn.278
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.276.end
jp
generator.if.gcn.276.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.279 1
pushcp generator.const.gcn.279
push global.arg_counter
mov
jc
jr
generator.if.gcn.276.end:
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
pushcp max__end
jp
max:
@max.this
@max.args
@max.r
word generator.const.gcn.280 0
pushcp generator.const.gcn.280
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
pushcp generator.if.gcn.281.else
word generator.const.gcn.282 0
pushc generator.const.gcn.282
push max.args
pushc len
word generator.const.gcn.283 1
pushcp generator.const.gcn.283
push global.arg_counter
mov
jc
bg
jz
pop
push max.args
word generator.const.gcn.284 0
pushc generator.const.gcn.284
swp
pushai
peek max.r
pop
@generator.for_each.gcn.285.array
@generator.for_each.gcn.285.i
@generator.for_each.gcn.285.to
push max.args
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
@max.x
peek max.x
pop
pushcp generator.if.gcn.286.else
push max.r
push max.x
bg
jz
pop
push max.x
push max.r
mov
generator.if.gcn.286.else:
generator.for_each.gcn.285.continue:
push generator.for_each.gcn.285.i
inc
pop
pushcp generator.for_each.gcn.285.start
jp
generator.for_each.gcn.285.end:
push max.r
jr
pushcp generator.if.gcn.281.end
jp
generator.if.gcn.281.else:
push null
jr
generator.if.gcn.281.end:
jr
max__end:
pushcp min__end
jp
min:
@min.this
@min.args
@min.r
word generator.const.gcn.287 0
pushcp generator.const.gcn.287
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
pushcp generator.if.gcn.288.else
word generator.const.gcn.289 0
pushc generator.const.gcn.289
push min.args
pushc len
word generator.const.gcn.290 1
pushcp generator.const.gcn.290
push global.arg_counter
mov
jc
bg
jz
pop
push min.args
word generator.const.gcn.291 0
pushc generator.const.gcn.291
swp
pushai
peek min.r
pop
@generator.for_each.gcn.292.array
@generator.for_each.gcn.292.i
@generator.for_each.gcn.292.to
push min.args
peek generator.for_each.gcn.292.array
alen
peek generator.for_each.gcn.292.to
pop
pushc global.zero
peek generator.for_each.gcn.292.i
pop
generator.for_each.gcn.292.start:
pushcp generator.for_each.gcn.292.end
push generator.for_each.gcn.292.i
push generator.for_each.gcn.292.to
eq
not
jz
pop
push generator.for_each.gcn.292.i
push generator.for_each.gcn.292.array
pushai
@min.x
peek min.x
pop
pushcp generator.if.gcn.293.else
push min.r
push min.x
swp
bg
jz
pop
push min.x
push min.r
mov
generator.if.gcn.293.else:
generator.for_each.gcn.292.continue:
push generator.for_each.gcn.292.i
inc
pop
pushcp generator.for_each.gcn.292.start
jp
generator.for_each.gcn.292.end:
push min.r
jr
pushcp generator.if.gcn.288.end
jp
generator.if.gcn.288.else:
push null
jr
generator.if.gcn.288.end:
jr
min__end:
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
word generator.const.gcn.294 0
pushcp generator.const.gcn.294
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.295 ""
pushc generator.const.gcn.295
peek chr.r
pop
@generator.for_each.gcn.296.array
@generator.for_each.gcn.296.i
@generator.for_each.gcn.296.to
push chr.chars
peek generator.for_each.gcn.296.array
alen
peek generator.for_each.gcn.296.to
pop
pushc global.zero
peek generator.for_each.gcn.296.i
pop
generator.for_each.gcn.296.start:
pushcp generator.for_each.gcn.296.end
push generator.for_each.gcn.296.i
push generator.for_each.gcn.296.to
eq
not
jz
pop
push generator.for_each.gcn.296.i
push generator.for_each.gcn.296.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.297 1
pushcp generator.const.gcn.297
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.296.continue:
push generator.for_each.gcn.296.i
inc
pop
pushcp generator.for_each.gcn.296.start
jp
generator.for_each.gcn.296.end:
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
word generator.const.gcn.299 1
pushcp generator.const.gcn.299
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.300.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.298.end
jp
generator.case.gcn.300.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.301.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.298.end
jp
generator.case.gcn.301.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.302.end
swp
jz
push str.value
pushc f2s
invoke
jr
pushcp generator.switch.gcn.298.end
jp
generator.case.gcn.302.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.303.end
swp
jz
push str.value
jr
pushcp generator.switch.gcn.298.end
jp
generator.case.gcn.303.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.305 "Invalid type cast via str()."
pushc generator.const.gcn.305
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.304 1
pushcp generator.const.gcn.304
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.298.end:
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
word generator.const.gcn.307 1
pushcp generator.const.gcn.307
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.308.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.306.end
jp
generator.case.gcn.308.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.309.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.306.end
jp
generator.case.gcn.309.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.310.end
swp
jz
word generator.const.gcn.311 1
pushc generator.const.gcn.311
push int.value
copy
swp
pop
idiv
jr
pushcp generator.switch.gcn.306.end
jp
generator.case.gcn.310.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.312.end
swp
jz
push int.value
pushc s2i
invoke
jr
pushcp generator.switch.gcn.306.end
jp
generator.case.gcn.312.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.314 "Invalid type cast via int()."
pushc generator.const.gcn.314
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.313 1
pushcp generator.const.gcn.313
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.306.end:
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
word generator.const.gcn.316 1
pushcp generator.const.gcn.316
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.317.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.315.end
jp
generator.case.gcn.317.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.318.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.315.end
jp
generator.case.gcn.318.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.319.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.315.end
jp
generator.case.gcn.319.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.320.end
swp
jz
push real.value
pushc s2f
invoke
jr
pushcp generator.switch.gcn.315.end
jp
generator.case.gcn.320.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.322 "Invalid type cast via int()."
pushc generator.const.gcn.322
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.321 1
pushcp generator.const.gcn.321
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.315.end:
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
pushcp generator.if.gcn.323.else
push check.cond
jz
pop
push check.rtrue
jr
pushcp generator.if.gcn.323.end
jp
generator.if.gcn.323.else:
push check.rfalse
jr
generator.if.gcn.323.end:
jr
check__end:
pushcp __getvm_null____end
jp
__getvm_null__:
@__getvm_null__.this
pushn
jr
__getvm_null____end:
pushcp __initproc____end
jp
__initproc__:
@__initproc__.this
@__initproc__.argc
@__initproc__.local_i
@__initproc__.local_a
word generator.const.gcn.324 0
pushc generator.const.gcn.324
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.325 1
pushcp generator.const.gcn.325
newa
peek params
pop
word generator.const.gcn.326 0
pushc generator.const.gcn.326
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.327.start:
pushcp generator.while.gcn.327.end
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
pushcp generator.while.gcn.327.start
jp
generator.while.gcn.327.end:
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
str generator.const.gcn.328 "'."
pushc generator.const.gcn.328
push exception__tostring.this
pushc vtable__message
swp
pushai
str generator.const.gcn.329 ">, message: '"
pushc generator.const.gcn.329
push exception__tostring.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.330 "Exception <"
pushc generator.const.gcn.330
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
pushcp generator.if.gcn.331.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.331.end
jp
generator.if.gcn.331.else:
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
generator.if.gcn.331.end:
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
word generator.const.gcn.332 1
pushc generator.const.gcn.332
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
word generator.const.gcn.333 1
pushc generator.const.gcn.333
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
real generator.const.gcn.335 0.5
pushc generator.const.gcn.335
push round.a
copy
swp
pop
add
pushc trunc
word generator.const.gcn.334 1
pushcp generator.const.gcn.334
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
real generator.const.gcn.337 0.999999
pushc generator.const.gcn.337
push ceil.a
copy
swp
pop
add
pushc trunc
word generator.const.gcn.336 1
pushcp generator.const.gcn.336
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
pushcp generator.if.gcn.338.else
word generator.const.gcn.339 0
pushc generator.const.gcn.339
push abs.a
bg
jz
pop
push abs.a
pushcp generator.if.gcn.338.end
jp
generator.if.gcn.338.else:
push abs.a
copy
swp
pop
neg
generator.if.gcn.338.end:
jr
abs__end:
pushcp sgn__end
jp
sgn:
@sgn.this
@sgn.a
peek sgn.a
pop
pushcp generator.if.gcn.340.else
word generator.const.gcn.341 0
pushc generator.const.gcn.341
push sgn.a
eq
jz
pop
word generator.const.gcn.342 0
pushc generator.const.gcn.342
jr
generator.if.gcn.340.else:
pushcp generator.if.gcn.343.else
word generator.const.gcn.344 0
pushc generator.const.gcn.344
push sgn.a
swp
bg
jz
pop
word generator.const.gcn.345 1
pushc generator.const.gcn.345
copy
swp
pop
neg
jr
pushcp generator.if.gcn.343.end
jp
generator.if.gcn.343.else:
word generator.const.gcn.346 1
pushc generator.const.gcn.346
jr
generator.if.gcn.343.end:
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
word generator.const.gcn.347 2
pushcp generator.const.gcn.347
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
pushcp generator.if.gcn.348.else
word generator.const.gcn.349 0
pushc generator.const.gcn.349
push power.n
eq
jz
pop
word generator.const.gcn.350 1
pushc generator.const.gcn.350
jr
pushcp generator.if.gcn.348.end
jp
generator.if.gcn.348.else:
pushcp generator.if.gcn.351.else
word generator.const.gcn.352 0
pushc generator.const.gcn.352
push power.a
eq
jz
pop
word generator.const.gcn.353 0
pushc generator.const.gcn.353
jr
pushcp generator.if.gcn.351.end
jp
generator.if.gcn.351.else:
push power.n
push power.a
pushc log
word generator.const.gcn.355 1
pushcp generator.const.gcn.355
push global.arg_counter
mov
jc
copy
swp
pop
mul
pushc exp
word generator.const.gcn.354 1
pushcp generator.const.gcn.354
push global.arg_counter
mov
jc
jr
generator.if.gcn.351.end:
generator.if.gcn.348.end:
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
word generator.const.gcn.357 2
pushcp generator.const.gcn.357
push global.arg_counter
mov
jc
pushc round
word generator.const.gcn.356 1
pushcp generator.const.gcn.356
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
pushcp generator.if.gcn.358.else
word generator.const.gcn.359 0
pushc generator.const.gcn.359
push sqrt.a
be
jz
pop
real generator.const.gcn.361 0.5
pushc generator.const.gcn.361
push sqrt.a
pushc power
word generator.const.gcn.360 2
pushcp generator.const.gcn.360
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.358.end
jp
generator.if.gcn.358.else:
push null
jr
generator.if.gcn.358.end:
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
word generator.const.gcn.362 1
pushc generator.const.gcn.362
peek factorial.r
pop
word generator.const.gcn.363 0
pushc generator.const.gcn.363
peek factorial.i
pop
generator.while.gcn.364.start:
pushcp generator.while.gcn.364.end
push factorial.a
push factorial.i
swp
bg
jz
pop
word generator.const.gcn.365 1
pushc generator.const.gcn.365
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
pushcp generator.while.gcn.364.start
jp
generator.while.gcn.364.end:
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
word generator.const.gcn.366 1
pushcp generator.const.gcn.366
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
word generator.const.gcn.367 180
pushc generator.const.gcn.367
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
word generator.const.gcn.368 180
pushc generator.const.gcn.368
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
word generator.const.gcn.369 2
pushc generator.const.gcn.369
push sinh.a
copy
swp
pop
neg
pushc m_e
pushc power
word generator.const.gcn.370 2
pushcp generator.const.gcn.370
push global.arg_counter
mov
jc
push sinh.a
pushc m_e
pushc power
word generator.const.gcn.371 2
pushcp generator.const.gcn.371
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
word generator.const.gcn.372 2
pushc generator.const.gcn.372
push cosh.a
copy
swp
pop
neg
pushc m_e
pushc power
word generator.const.gcn.373 2
pushcp generator.const.gcn.373
push global.arg_counter
mov
jc
push cosh.a
pushc m_e
pushc power
word generator.const.gcn.374 2
pushcp generator.const.gcn.374
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
word generator.const.gcn.375 1
pushcp generator.const.gcn.375
push global.arg_counter
mov
jc
word generator.const.gcn.376 1
pushc generator.const.gcn.376
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
word generator.const.gcn.377 1
pushcp generator.const.gcn.377
push global.arg_counter
mov
jc
word generator.const.gcn.378 1
pushc generator.const.gcn.378
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
word generator.const.gcn.379 1
pushcp generator.const.gcn.379
push global.arg_counter
mov
jc
push tgh.a
pushc sinh
word generator.const.gcn.380 1
pushcp generator.const.gcn.380
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
word generator.const.gcn.381 1
pushcp generator.const.gcn.381
push global.arg_counter
mov
jc
word generator.const.gcn.382 1
pushc generator.const.gcn.382
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
word generator.const.gcn.385 1
pushc generator.const.gcn.385
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
word generator.const.gcn.384 1
pushcp generator.const.gcn.384
push global.arg_counter
mov
jc
push arcsinh.a
copy
swp
pop
add
pushc log
word generator.const.gcn.383 1
pushcp generator.const.gcn.383
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
word generator.const.gcn.388 1
pushc generator.const.gcn.388
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
word generator.const.gcn.387 1
pushcp generator.const.gcn.387
push global.arg_counter
mov
jc
push arccosh.a
copy
swp
pop
add
pushc log
word generator.const.gcn.386 1
pushcp generator.const.gcn.386
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
word generator.const.gcn.389 2
pushc generator.const.gcn.389
push arctgh.a
word generator.const.gcn.391 1
pushc generator.const.gcn.391
copy
swp
pop
sub
push arctgh.a
word generator.const.gcn.392 1
pushc generator.const.gcn.392
copy
swp
pop
add
copy
swp
pop
div
pushc log
word generator.const.gcn.390 1
pushcp generator.const.gcn.390
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
word generator.const.gcn.393 2
pushc generator.const.gcn.393
word generator.const.gcn.395 1
pushc generator.const.gcn.395
push arcctgh.a
copy
swp
pop
sub
word generator.const.gcn.396 1
pushc generator.const.gcn.396
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
word generator.const.gcn.394 1
pushcp generator.const.gcn.394
push global.arg_counter
mov
jc
copy
swp
pop
div
jr
arcctgh__end:
pushcp main
jc
word __vtable__size__ 63
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