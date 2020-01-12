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
word vtable__type 0
word vtable__classname 1
word vtable__message 2
word vtable__normvideo 3
word vtable__wherex 4
word vtable__wherey 5
word vtable__pause 6
word vtable__cursorbig 7
word vtable__cursoroff 8
word vtable__cursoron 9
word vtable__delline 10
word vtable__gotoxy 11
word vtable__insline 12
word vtable__keypressed 13
word vtable__readkey 14
word vtable__sound 15
word vtable__window32 16
word vtable__clreol 17
word vtable__clrscr 18
word vtable__getdirectvideo 19
word vtable__getlastmode 20
word vtable__settextattr 21
word vtable__gettextattr 22
word vtable__getwindmax 23
word vtable__getwindmaxx 24
word vtable__getwindmaxy 25
word vtable__getwindmin 26
word vtable__getwindminx 27
word vtable__getwindminy 28
word vtable__getcheckbreak 29
word vtable__getcheckeof 30
word vtable__getchecksnow 31
word vtable__textcolor 32
word vtable__textbackground 33
word vtable__push 34
word vtable__peek 35
word vtable__pop 36
word vtable__create 37
word vtable__tostring 38
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
word stack 9
@structure_instance_stack
pushcp __allocator__stack
jc
peek structure_instance_stack
pop
word polymorph 10
@structure_instance_polymorph
pushcp __allocator__polymorph
jc
peek structure_instance_polymorph
pop
word exception 11
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
@eabstractexception
word generator.const.gcn.9 5
pushcp generator.const.gcn.9
pushcp global.one
newa
peek eabstractexception
str eraisedexception "ERaisedException"
pcopy
pushc eraisedexception
swp
word generator.const.gcn.10 0
pushcp generator.const.gcn.10
swp
peekai
str einvalidvmop "EInvalidSVMOperation"
pcopy
pushc einvalidvmop
swp
word generator.const.gcn.11 1
pushcp generator.const.gcn.11
swp
peekai
str einvalidtypecast "EInvalidSVMTypeCast"
pcopy
pushc einvalidtypecast
swp
word generator.const.gcn.12 2
pushcp generator.const.gcn.12
swp
peekai
str eabstracterror "EAbstractError"
pcopy
pushc eabstracterror
swp
word generator.const.gcn.13 3
pushcp generator.const.gcn.13
swp
peekai
str eunknownexception "EUnknownException"
pcopy
pushc eunknownexception
swp
word generator.const.gcn.14 4
pushcp generator.const.gcn.14
swp
peekai
pop
@emathexception
word generator.const.gcn.15 9
pushcp generator.const.gcn.15
pushcp global.one
newa
peek emathexception
str einterror "EInterror"
pcopy
pushc einterror
swp
word generator.const.gcn.16 0
pushcp generator.const.gcn.16
swp
peekai
str edivbyzero "EDivByZero"
pcopy
pushc edivbyzero
swp
word generator.const.gcn.17 1
pushcp generator.const.gcn.17
swp
peekai
str erangeerror "ERangeError"
pcopy
pushc erangeerror
swp
word generator.const.gcn.18 2
pushcp generator.const.gcn.18
swp
peekai
str eintoverflow "EIntOverflow"
pcopy
pushc eintoverflow
swp
word generator.const.gcn.19 3
pushcp generator.const.gcn.19
swp
peekai
str ematherror "EMathError"
pcopy
pushc ematherror
swp
word generator.const.gcn.20 4
pushcp generator.const.gcn.20
swp
peekai
str einvalidop "EInvalidOp"
pcopy
pushc einvalidop
swp
word generator.const.gcn.21 5
pushcp generator.const.gcn.21
swp
peekai
str ezerodivide "EZeroDivide"
pcopy
pushc ezerodivide
swp
word generator.const.gcn.22 6
pushcp generator.const.gcn.22
swp
peekai
str eoverflow "EOverflow"
pcopy
pushc eoverflow
swp
word generator.const.gcn.23 7
pushcp generator.const.gcn.23
swp
peekai
str eunderflow "EUnderflow"
pcopy
pushc eunderflow
swp
word generator.const.gcn.24 8
pushcp generator.const.gcn.24
swp
peekai
pop
@ecriticalexception
word generator.const.gcn.25 3
pushcp generator.const.gcn.25
pushcp global.one
newa
peek ecriticalexception
str eaccessviolation "EAccessViolation"
pcopy
pushc eaccessviolation
swp
word generator.const.gcn.26 0
pushcp generator.const.gcn.26
swp
peekai
str eoserror "EOSError"
pcopy
pushc eoserror
swp
word generator.const.gcn.27 1
pushcp generator.const.gcn.27
swp
peekai
str enothreadsupport "ENoThreadSupport"
pcopy
pushc enothreadsupport
swp
word generator.const.gcn.28 2
pushcp generator.const.gcn.28
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
str generator.const.gcn.29 "<null>"
pushc generator.const.gcn.29
peek null
pop
push null
peek params
pop
pushc __initproc__
word generator.const.gcn.30 0
pushcp generator.const.gcn.30
push global.arg_counter
mov
jc
jr
__init__end__:
str generator.const.gcn.32 "Unknown raised exception"
pushc generator.const.gcn.32
pushc eunknownexception
pushc system_makeexception
word generator.const.gcn.31 2
pushcp generator.const.gcn.31
push global.arg_counter
mov
jc
peek eunknown
pop
pushcp main__end
jp
main:
@main.this
word generator.const.gcn.34 1
pushc generator.const.gcn.34
word generator.const.gcn.35 7
pushc generator.const.gcn.35
copy
swp
pop
shr
pushc println
word generator.const.gcn.33 1
pushcp generator.const.gcn.33
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
str generator.const.gcn.36 "["
pushc generator.const.gcn.36
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.37 1
pushcp generator.const.gcn.37
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.38 0
pushc generator.const.gcn.38
peek __printarray.i
pop
generator.while.gcn.39.start:
pushcp generator.while.gcn.39.end
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
word generator.const.gcn.40 1
pushcp generator.const.gcn.40
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
pushcp generator.if.gcn.41.else
push __printarray.l
word generator.const.gcn.42 1
pushc generator.const.gcn.42
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.43 ", "
pushc generator.const.gcn.43
pushc _print
invoke
generator.if.gcn.41.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.39.start
jp
generator.while.gcn.39.end:
str generator.const.gcn.44 "]"
pushc generator.const.gcn.44
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
word generator.const.gcn.46 1
pushcp generator.const.gcn.46
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.47.end
swp
jz
str generator.const.gcn.48 "(null)"
pushc generator.const.gcn.48
pushc _print
invoke
pushcp generator.switch.gcn.45.end
jp
generator.case.gcn.47.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.49.end
swp
jz
push __print.obj
peek global.this
pushc vtable__tostring
swp
pushai
word generator.const.gcn.50 0
pushcp generator.const.gcn.50
push global.arg_counter
mov
jc
pushc _print
invoke
pushcp generator.switch.gcn.45.end
jp
generator.case.gcn.49.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.51.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.52 1
pushcp generator.const.gcn.52
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.45.end
jp
generator.case.gcn.51.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.45.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.53 0
pushcp generator.const.gcn.53
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.54.array
@generator.for_each.gcn.54.i
@generator.for_each.gcn.54.to
push print.args
peek generator.for_each.gcn.54.array
alen
peek generator.for_each.gcn.54.to
pop
pushc global.zero
peek generator.for_each.gcn.54.i
pop
generator.for_each.gcn.54.start:
pushcp generator.for_each.gcn.54.end
push generator.for_each.gcn.54.i
push generator.for_each.gcn.54.to
eq
not
jz
pop
push generator.for_each.gcn.54.i
push generator.for_each.gcn.54.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.55 1
pushcp generator.const.gcn.55
push global.arg_counter
mov
jc
generator.for_each.gcn.54.continue:
push generator.for_each.gcn.54.i
inc
pop
pushcp generator.for_each.gcn.54.start
jp
generator.for_each.gcn.54.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.56 0
pushcp generator.const.gcn.56
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.57.array
@generator.for_each.gcn.57.i
@generator.for_each.gcn.57.to
push println.args
peek generator.for_each.gcn.57.array
alen
peek generator.for_each.gcn.57.to
pop
pushc global.zero
peek generator.for_each.gcn.57.i
pop
generator.for_each.gcn.57.start:
pushcp generator.for_each.gcn.57.end
push generator.for_each.gcn.57.i
push generator.for_each.gcn.57.to
eq
not
jz
pop
push generator.for_each.gcn.57.i
push generator.for_each.gcn.57.array
pushai
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.58 1
pushcp generator.const.gcn.58
push global.arg_counter
mov
jc
generator.for_each.gcn.57.continue:
push generator.for_each.gcn.57.i
inc
pop
pushcp generator.for_each.gcn.57.start
jp
generator.for_each.gcn.57.end:
str generator.const.gcn.59 ""
pushc generator.const.gcn.59
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
word generator.const.gcn.60 7
pushc generator.const.gcn.60
pushc crt_textcolor
invoke
word generator.const.gcn.61 0
pushc generator.const.gcn.61
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
word generator.const.gcn.62 256
pushc generator.const.gcn.62
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
word generator.const.gcn.63 256
pushc generator.const.gcn.63
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
pushcp generator.if.gcn.64.else
push system_op_range.isback
jz
pop
word generator.const.gcn.65 1
pushc generator.const.gcn.65
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
pushcp generator.if.gcn.64.end
jp
generator.if.gcn.64.else:
word generator.const.gcn.66 1
pushc generator.const.gcn.66
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
generator.if.gcn.64.end:
push system_op_range.l
word generator.const.gcn.67 1
pushcp generator.const.gcn.67
newa
peek system_op_range.res
pop
word generator.const.gcn.68 0
pushc generator.const.gcn.68
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.69 1
pushcp generator.const.gcn.69
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.70.start:
pushcp generator.while.gcn.70.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.71 1
pushcp generator.const.gcn.71
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
pushcp generator.if.gcn.72.else
push system_op_range.isback
jz
pop
word generator.const.gcn.73 1
pushc generator.const.gcn.73
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.72.end
jp
generator.if.gcn.72.else:
word generator.const.gcn.74 1
pushc generator.const.gcn.74
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.72.end:
pushcp generator.while.gcn.70.start
jp
generator.while.gcn.70.end:
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
word generator.const.gcn.75 2
pushcp generator.const.gcn.75
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
word generator.const.gcn.76 0
pushc generator.const.gcn.76
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.77 1
pushcp generator.const.gcn.77
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.78.start:
pushcp generator.while.gcn.78.end
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
pushcp generator.while.gcn.78.start
jp
generator.while.gcn.78.end:
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
pushcp generator.if.gcn.79.else
word generator.const.gcn.80 255
pushc generator.const.gcn.80
push typeof.t
eq
jz
pop
push null
jr
generator.if.gcn.79.else:
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
word generator.const.gcn.81 1
pushcp generator.const.gcn.81
push global.arg_counter
mov
jc
peek system_op_is.t
pop
pushcp generator.if.gcn.82.else
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
pushcp generator.if.gcn.82.end
jp
generator.if.gcn.82.else:
push system_op_is.right
push system_op_is.t
eq
jr
generator.if.gcn.82.end:
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
word generator.const.gcn.83 1
pushcp generator.const.gcn.83
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.84 1
pushcp generator.const.gcn.84
newa
peek system_copy_array.r
pop
word generator.const.gcn.85 0
pushc generator.const.gcn.85
peek system_copy_array.i
pop
generator.while.gcn.86.start:
pushcp generator.while.gcn.86.end
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
word generator.const.gcn.87 1
pushcp generator.const.gcn.87
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
pushcp generator.while.gcn.86.start
jp
generator.while.gcn.86.end:
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
pushcp generator.if.gcn.88.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.89 1
pushcp generator.const.gcn.89
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.90 1
pushcp generator.const.gcn.90
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.88.end
jp
generator.if.gcn.88.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.91 1
pushcp generator.const.gcn.91
push global.arg_counter
mov
jc
jr
generator.if.gcn.88.end:
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
word generator.const.gcn.92 0
pushcp generator.const.gcn.92
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.93 ""
pushc generator.const.gcn.93
peek chr.r
pop
@generator.for_each.gcn.94.array
@generator.for_each.gcn.94.i
@generator.for_each.gcn.94.to
push chr.chars
peek generator.for_each.gcn.94.array
alen
peek generator.for_each.gcn.94.to
pop
pushc global.zero
peek generator.for_each.gcn.94.i
pop
generator.for_each.gcn.94.start:
pushcp generator.for_each.gcn.94.end
push generator.for_each.gcn.94.i
push generator.for_each.gcn.94.to
eq
not
jz
pop
push generator.for_each.gcn.94.i
push generator.for_each.gcn.94.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.95 1
pushcp generator.const.gcn.95
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.94.continue:
push generator.for_each.gcn.94.i
inc
pop
pushcp generator.for_each.gcn.94.start
jp
generator.for_each.gcn.94.end:
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
word generator.const.gcn.97 1
pushcp generator.const.gcn.97
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.98.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.96.end
jp
generator.case.gcn.98.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.99.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.96.end
jp
generator.case.gcn.99.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.100.end
swp
jz
push str.value
pushc f2s
invoke
jr
pushcp generator.switch.gcn.96.end
jp
generator.case.gcn.100.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.101.end
swp
jz
push str.value
jr
pushcp generator.switch.gcn.96.end
jp
generator.case.gcn.101.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.103 "Invalid type cast via str()."
pushc generator.const.gcn.103
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.102 1
pushcp generator.const.gcn.102
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.96.end:
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
word generator.const.gcn.105 1
pushcp generator.const.gcn.105
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.106.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.104.end
jp
generator.case.gcn.106.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.107.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.104.end
jp
generator.case.gcn.107.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.108.end
swp
jz
word generator.const.gcn.109 1
pushc generator.const.gcn.109
push int.value
copy
swp
pop
idiv
jr
pushcp generator.switch.gcn.104.end
jp
generator.case.gcn.108.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.110.end
swp
jz
push int.value
pushc s2i
invoke
jr
pushcp generator.switch.gcn.104.end
jp
generator.case.gcn.110.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.112 "Invalid type cast via int()."
pushc generator.const.gcn.112
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.111 1
pushcp generator.const.gcn.111
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.104.end:
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
word generator.const.gcn.114 1
pushcp generator.const.gcn.114
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.115.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.113.end
jp
generator.case.gcn.115.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.116.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.113.end
jp
generator.case.gcn.116.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.117.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.113.end
jp
generator.case.gcn.117.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.118.end
swp
jz
push real.value
pushc s2f
invoke
jr
pushcp generator.switch.gcn.113.end
jp
generator.case.gcn.118.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.120 "Invalid type cast via int()."
pushc generator.const.gcn.120
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.119 1
pushcp generator.const.gcn.119
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.113.end:
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
pushcp generator.if.gcn.121.else
push check.cond
jz
pop
push check.rtrue
jr
pushcp generator.if.gcn.121.end
jp
generator.if.gcn.121.else:
push check.rfalse
jr
generator.if.gcn.121.end:
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
pushcp generator.if.gcn.122.else
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
generator.if.gcn.122.else:
word generator.const.gcn.123 2
pushcp generator.const.gcn.123
word generator.const.gcn.124 1
pushcp generator.const.gcn.124
newa
pcopy
push between.left
swp
word generator.const.gcn.125 0
pushcp generator.const.gcn.125
swp
peekai
pcopy
push between.right
swp
word generator.const.gcn.126 1
pushcp generator.const.gcn.126
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
pushcp generator.if.gcn.127.else
word generator.const.gcn.128 0
pushc generator.const.gcn.128
push maxfromarray.arr
pushc len
word generator.const.gcn.129 1
pushcp generator.const.gcn.129
push global.arg_counter
mov
jc
bg
jz
pop
push maxfromarray.arr
word generator.const.gcn.130 0
pushc generator.const.gcn.130
swp
pushai
peek maxfromarray.r
pop
@generator.for_each.gcn.131.array
@generator.for_each.gcn.131.i
@generator.for_each.gcn.131.to
push maxfromarray.arr
peek generator.for_each.gcn.131.array
alen
peek generator.for_each.gcn.131.to
pop
pushc global.zero
peek generator.for_each.gcn.131.i
pop
generator.for_each.gcn.131.start:
pushcp generator.for_each.gcn.131.end
push generator.for_each.gcn.131.i
push generator.for_each.gcn.131.to
eq
not
jz
pop
push generator.for_each.gcn.131.i
push generator.for_each.gcn.131.array
pushai
@maxfromarray.x
peek maxfromarray.x
pop
pushcp generator.if.gcn.132.else
push maxfromarray.r
push maxfromarray.x
bg
jz
pop
push maxfromarray.x
push maxfromarray.r
mov
generator.if.gcn.132.else:
generator.for_each.gcn.131.continue:
push generator.for_each.gcn.131.i
inc
pop
pushcp generator.for_each.gcn.131.start
jp
generator.for_each.gcn.131.end:
push maxfromarray.r
jr
pushcp generator.if.gcn.127.end
jp
generator.if.gcn.127.else:
push null
jr
generator.if.gcn.127.end:
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
pushcp generator.if.gcn.133.else
word generator.const.gcn.134 0
pushc generator.const.gcn.134
push minfromarray.arr
pushc len
word generator.const.gcn.135 1
pushcp generator.const.gcn.135
push global.arg_counter
mov
jc
bg
jz
pop
push minfromarray.arr
word generator.const.gcn.136 0
pushc generator.const.gcn.136
swp
pushai
peek minfromarray.r
pop
@generator.for_each.gcn.137.array
@generator.for_each.gcn.137.i
@generator.for_each.gcn.137.to
push minfromarray.arr
peek generator.for_each.gcn.137.array
alen
peek generator.for_each.gcn.137.to
pop
pushc global.zero
peek generator.for_each.gcn.137.i
pop
generator.for_each.gcn.137.start:
pushcp generator.for_each.gcn.137.end
push generator.for_each.gcn.137.i
push generator.for_each.gcn.137.to
eq
not
jz
pop
push generator.for_each.gcn.137.i
push generator.for_each.gcn.137.array
pushai
@minfromarray.x
peek minfromarray.x
pop
pushcp generator.if.gcn.138.else
push minfromarray.r
push minfromarray.x
swp
bg
jz
pop
push minfromarray.x
push minfromarray.r
mov
generator.if.gcn.138.else:
generator.for_each.gcn.137.continue:
push generator.for_each.gcn.137.i
inc
pop
pushcp generator.for_each.gcn.137.start
jp
generator.for_each.gcn.137.end:
push minfromarray.r
jr
pushcp generator.if.gcn.133.end
jp
generator.if.gcn.133.else:
push null
jr
generator.if.gcn.133.end:
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
word generator.const.gcn.139 0
pushcp generator.const.gcn.139
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
push max.args
pushc len
word generator.const.gcn.140 1
pushcp generator.const.gcn.140
push global.arg_counter
mov
jc
peek max.l
pop
pushcp generator.if.gcn.141.else
word generator.const.gcn.142 0
pushc generator.const.gcn.142
push max.l
bg
jz
pop
push max.args
word generator.const.gcn.143 0
pushc generator.const.gcn.143
swp
pushai
peek max.first
pop
pushcp generator.if.gcn.144.else
pushc typearray
push max.first
pushcp system_op_is
jc
jz
pop
push max.first
pushc maxfromarray
word generator.const.gcn.145 1
pushcp generator.const.gcn.145
push global.arg_counter
mov
jc
peek max.r
pop
pushcp generator.if.gcn.144.end
jp
generator.if.gcn.144.else:
push max.first
peek max.r
pop
generator.if.gcn.144.end:
word generator.const.gcn.146 1
pushc generator.const.gcn.146
peek max.i
pop
generator.while.gcn.147.start:
pushcp generator.while.gcn.147.end
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
pushcp generator.if.gcn.148.else
pushc typearray
push max.t
pushcp system_op_is
jc
jz
pop
push max.t
pushc maxfromarray
word generator.const.gcn.149 1
pushcp generator.const.gcn.149
push global.arg_counter
mov
jc
peek max._
pop
pushcp generator.if.gcn.150.else
push max.r
push max._
bg
jz
pop
push max._
push max.r
mov
generator.if.gcn.150.else:
pushcp generator.if.gcn.148.end
jp
generator.if.gcn.148.else:
pushcp generator.if.gcn.151.else
push max.r
push max.t
bg
jz
pop
push max.t
push max.r
mov
generator.if.gcn.151.else:
generator.if.gcn.148.end:
push max.i
inc
pop
pushcp generator.while.gcn.147.start
jp
generator.while.gcn.147.end:
push max.r
jr
pushcp generator.if.gcn.141.end
jp
generator.if.gcn.141.else:
push null
jr
generator.if.gcn.141.end:
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
word generator.const.gcn.152 0
pushcp generator.const.gcn.152
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
push min.args
pushc len
word generator.const.gcn.153 1
pushcp generator.const.gcn.153
push global.arg_counter
mov
jc
peek min.l
pop
pushcp generator.if.gcn.154.else
word generator.const.gcn.155 0
pushc generator.const.gcn.155
push min.l
bg
jz
pop
push min.args
word generator.const.gcn.156 0
pushc generator.const.gcn.156
swp
pushai
peek min.first
pop
pushcp generator.if.gcn.157.else
pushc typearray
push min.first
pushcp system_op_is
jc
jz
pop
push min.first
pushc minfromarray
word generator.const.gcn.158 1
pushcp generator.const.gcn.158
push global.arg_counter
mov
jc
peek min.r
pop
pushcp generator.if.gcn.157.end
jp
generator.if.gcn.157.else:
push min.first
peek min.r
pop
generator.if.gcn.157.end:
word generator.const.gcn.159 1
pushc generator.const.gcn.159
peek min.i
pop
push min.args
pushc len
word generator.const.gcn.160 1
pushcp generator.const.gcn.160
push global.arg_counter
mov
jc
peek min.l
pop
generator.while.gcn.161.start:
pushcp generator.while.gcn.161.end
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
pushcp generator.if.gcn.162.else
pushc typearray
push min.t
pushcp system_op_is
jc
jz
pop
push min.t
pushc minfromarray
word generator.const.gcn.163 1
pushcp generator.const.gcn.163
push global.arg_counter
mov
jc
peek min._
pop
pushcp generator.if.gcn.164.else
push min.r
push min._
swp
bg
jz
pop
push min._
push min.r
mov
generator.if.gcn.164.else:
pushcp generator.if.gcn.162.end
jp
generator.if.gcn.162.else:
pushcp generator.if.gcn.165.else
push min.r
push min.t
swp
bg
jz
pop
push min.t
push min.r
mov
generator.if.gcn.165.else:
generator.if.gcn.162.end:
push min.i
inc
pop
pushcp generator.while.gcn.161.start
jp
generator.while.gcn.161.end:
push min.r
jr
pushcp generator.if.gcn.154.end
jp
generator.if.gcn.154.else:
push null
jr
generator.if.gcn.154.end:
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
word generator.const.gcn.166 1
pushcp generator.const.gcn.166
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek append.values
pop
push append.array
pushc len
word generator.const.gcn.167 1
pushcp generator.const.gcn.167
push global.arg_counter
mov
jc
peek append.i
pop
push append.values
pushc len
word generator.const.gcn.168 1
pushcp generator.const.gcn.168
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
word generator.const.gcn.169 2
pushcp generator.const.gcn.169
push global.arg_counter
mov
jc
@generator.for_each.gcn.170.array
@generator.for_each.gcn.170.i
@generator.for_each.gcn.170.to
push append.values
peek generator.for_each.gcn.170.array
alen
peek generator.for_each.gcn.170.to
pop
pushc global.zero
peek generator.for_each.gcn.170.i
pop
generator.for_each.gcn.170.start:
pushcp generator.for_each.gcn.170.end
push generator.for_each.gcn.170.i
push generator.for_each.gcn.170.to
eq
not
jz
pop
push generator.for_each.gcn.170.i
push generator.for_each.gcn.170.array
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
generator.for_each.gcn.170.continue:
push generator.for_each.gcn.170.i
inc
pop
pushcp generator.for_each.gcn.170.start
jp
generator.for_each.gcn.170.end:
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
word generator.const.gcn.171 1
pushcp generator.const.gcn.171
push global.arg_counter
mov
jc
peek reverse.l
pop
word generator.const.gcn.172 2
pushc generator.const.gcn.172
push reverse.l
copy
swp
pop
idiv
peek reverse.hl
pop
word generator.const.gcn.173 0
pushc generator.const.gcn.173
peek reverse.i
pop
generator.while.gcn.174.start:
pushcp generator.while.gcn.174.end
push reverse.hl
push reverse.i
swp
bg
jz
pop
push reverse.array
word generator.const.gcn.175 1
pushc generator.const.gcn.175
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
word generator.const.gcn.176 1
pushc generator.const.gcn.176
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
pushcp generator.while.gcn.174.start
jp
generator.while.gcn.174.end:
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
word generator.const.gcn.177 0
pushc generator.const.gcn.177
peek indexof.i
pop
@generator.for_each.gcn.178.array
@generator.for_each.gcn.178.i
@generator.for_each.gcn.178.to
push indexof.array
peek generator.for_each.gcn.178.array
alen
peek generator.for_each.gcn.178.to
pop
pushc global.zero
peek generator.for_each.gcn.178.i
pop
generator.for_each.gcn.178.start:
pushcp generator.for_each.gcn.178.end
push generator.for_each.gcn.178.i
push generator.for_each.gcn.178.to
eq
not
jz
pop
push generator.for_each.gcn.178.i
push generator.for_each.gcn.178.array
pushai
@indexof.x
peek indexof.x
pop
pushcp generator.if.gcn.179.else
pushc typeclass
push indexof.x
pushcp system_op_is
jc
jz
pop
pushcp generator.if.gcn.180.else
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
generator.if.gcn.180.else:
pushcp generator.if.gcn.179.end
jp
generator.if.gcn.179.else:
pushcp generator.if.gcn.181.else
push indexof.object
push indexof.x
eq
jz
pop
push indexof.i
jr
generator.if.gcn.181.else:
generator.if.gcn.179.end:
push indexof.i
inc
pop
generator.for_each.gcn.178.continue:
push generator.for_each.gcn.178.i
inc
pop
pushcp generator.for_each.gcn.178.start
jp
generator.for_each.gcn.178.end:
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
word generator.const.gcn.182 1
pushcp generator.const.gcn.182
push global.arg_counter
mov
jc
peek insert.l
pop
word generator.const.gcn.184 1
pushc generator.const.gcn.184
push insert.l
copy
swp
pop
add
push insert.array
pushc setlen
word generator.const.gcn.183 2
pushcp generator.const.gcn.183
push global.arg_counter
mov
jc
generator.while.gcn.185.start:
pushcp generator.while.gcn.185.end
push insert.index
push insert.l
bg
jz
pop
push insert.array
word generator.const.gcn.186 1
pushc generator.const.gcn.186
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
pushcp generator.while.gcn.185.start
jp
generator.while.gcn.185.end:
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
word generator.const.gcn.187 1
pushcp generator.const.gcn.187
push global.arg_counter
mov
jc
peek delete.i
pop
word generator.const.gcn.188 1
pushc generator.const.gcn.188
push delete.array
pushc len
word generator.const.gcn.189 1
pushcp generator.const.gcn.189
push global.arg_counter
mov
jc
copy
swp
pop
sub
peek delete.l
pop
generator.while.gcn.190.start:
pushcp generator.while.gcn.190.end
push delete.l
push delete.i
swp
bg
jz
pop
push delete.array
word generator.const.gcn.191 1
pushc generator.const.gcn.191
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
pushcp generator.while.gcn.190.start
jp
generator.while.gcn.190.end:
push delete.i
push delete.array
pushc setlen
word generator.const.gcn.192 2
pushcp generator.const.gcn.192
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
word generator.const.gcn.193 2
pushcp generator.const.gcn.193
push global.arg_counter
mov
jc
peek remove.index
pop
pushcp generator.if.gcn.194.else
push null
push remove.index
eq
not
jz
pop
push remove.index
push remove.array
pushc delete
word generator.const.gcn.195 2
pushcp generator.const.gcn.195
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.194.end
jp
generator.if.gcn.194.else:
push remove.array
jr
generator.if.gcn.194.end:
jr
remove__end:
pushcp clear__end
jp
clear:
@clear.this
@clear.array
peek clear.array
pop
word generator.const.gcn.197 0
pushc generator.const.gcn.197
push clear.array
pushc setlen
word generator.const.gcn.196 2
pushcp generator.const.gcn.196
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
word generator.const.gcn.198 0
pushc generator.const.gcn.198
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.199 1
pushcp generator.const.gcn.199
newa
peek params
pop
word generator.const.gcn.200 0
pushc generator.const.gcn.200
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.201.start:
pushcp generator.while.gcn.201.end
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
pushcp generator.while.gcn.201.start
jp
generator.while.gcn.201.end:
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
str generator.const.gcn.202 "'."
pushc generator.const.gcn.202
push exception__tostring.this
pushc vtable__message
swp
pushai
str generator.const.gcn.203 ">, message: '"
pushc generator.const.gcn.203
push exception__tostring.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.204 "Exception <"
pushc generator.const.gcn.204
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
pushcp generator.if.gcn.205.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.205.end
jp
generator.if.gcn.205.else:
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
generator.if.gcn.205.end:
jr
system_makeexception__end:
pushcp main
jc
word __vtable__size__ 39
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