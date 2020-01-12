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
word vtable__threadcontext 1
word vtable__resumed 2
word vtable__terminated 3
word vtable__method 4
word vtable__args 5
word vtable__classname 6
word vtable__message 7
word vtable__normvideo 8
word vtable__wherex 9
word vtable__wherey 10
word vtable__pause 11
word vtable__cursorbig 12
word vtable__cursoroff 13
word vtable__cursoron 14
word vtable__delline 15
word vtable__gotoxy 16
word vtable__insline 17
word vtable__keypressed 18
word vtable__readkey 19
word vtable__sound 20
word vtable__window32 21
word vtable__clreol 22
word vtable__clrscr 23
word vtable__getdirectvideo 24
word vtable__getlastmode 25
word vtable__settextattr 26
word vtable__gettextattr 27
word vtable__getwindmax 28
word vtable__getwindmaxx 29
word vtable__getwindmaxy 30
word vtable__getwindmin 31
word vtable__getwindminx 32
word vtable__getwindminy 33
word vtable__getcheckbreak 34
word vtable__getcheckeof 35
word vtable__getchecksnow 36
word vtable__textcolor 37
word vtable__textbackground 38
word vtable__execute 39
word vtable__create 40
word vtable__free 41
word vtable__rejoin 42
word vtable__suspend 43
word vtable__resume 44
word vtable__setpriority 45
word vtable__terminate 46
word vtable__waitfor 47
word vtable__clone 48
word vtable__push 49
word vtable__peek 50
word vtable__pop 51
word vtable__tostring 52
@global.arg_counter
@global.temp
@global.this
word global.zero 0
word global.one 1
str global.raised "ERaisedException"
pushc global.zero
peek global.arg_counter
pop
@threadpriority
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
word tthread 9
@structure_instance_tthread
pushcp __allocator__tthread
jc
peek structure_instance_tthread
pop
word tthreadcall 10
@structure_instance_tthreadcall
pushcp __allocator__tthreadcall
jc
peek structure_instance_tthreadcall
pop
word stack 11
@structure_instance_stack
pushcp __allocator__stack
jc
peek structure_instance_stack
pop
word polymorph 12
@structure_instance_polymorph
pushcp __allocator__polymorph
jc
peek structure_instance_polymorph
pop
word exception 13
@structure_instance_exception
pushcp __allocator__exception
jc
peek structure_instance_exception
pop
pushcp __init__
jc
@threadpriority
word generator.const.gcn.0 7
pushcp generator.const.gcn.0
pushcp global.one
newa
peek threadpriority
word tpidle 0
pcopy
pushc tpidle
swp
word generator.const.gcn.1 0
pushcp generator.const.gcn.1
swp
peekai
word tplowest 1
pcopy
pushc tplowest
swp
word generator.const.gcn.2 1
pushcp generator.const.gcn.2
swp
peekai
word tplower 2
pcopy
pushc tplower
swp
word generator.const.gcn.3 2
pushcp generator.const.gcn.3
swp
peekai
word tpnormal 3
pcopy
pushc tpnormal
swp
word generator.const.gcn.4 3
pushcp generator.const.gcn.4
swp
peekai
word tphigher 4
pcopy
pushc tphigher
swp
word generator.const.gcn.5 4
pushcp generator.const.gcn.5
swp
peekai
word tphighest 5
pcopy
pushc tphighest
swp
word generator.const.gcn.6 5
pushcp generator.const.gcn.6
swp
peekai
word tptimecritical 6
pcopy
pushc tptimecritical
swp
word generator.const.gcn.7 6
pushcp generator.const.gcn.7
swp
peekai
pop
@types
word generator.const.gcn.8 8
pushcp generator.const.gcn.8
pushcp global.one
newa
peek types
word typenull 0
pcopy
pushc typenull
swp
word generator.const.gcn.9 0
pushcp generator.const.gcn.9
swp
peekai
word typeword 1
pcopy
pushc typeword
swp
word generator.const.gcn.10 1
pushcp generator.const.gcn.10
swp
peekai
word typeint 2
pcopy
pushc typeint
swp
word generator.const.gcn.11 2
pushcp generator.const.gcn.11
swp
peekai
word typereal 3
pcopy
pushc typereal
swp
word generator.const.gcn.12 3
pushcp generator.const.gcn.12
swp
peekai
word typestr 4
pcopy
pushc typestr
swp
word generator.const.gcn.13 4
pushcp generator.const.gcn.13
swp
peekai
word typearray 5
pcopy
pushc typearray
swp
word generator.const.gcn.14 5
pushcp generator.const.gcn.14
swp
peekai
word typeclass 6
pcopy
pushc typeclass
swp
word generator.const.gcn.15 6
pushcp generator.const.gcn.15
swp
peekai
word typeref 7
pcopy
pushc typeref
swp
word generator.const.gcn.16 7
pushcp generator.const.gcn.16
swp
peekai
pop
@eabstractexception
word generator.const.gcn.17 5
pushcp generator.const.gcn.17
pushcp global.one
newa
peek eabstractexception
str eraisedexception "ERaisedException"
pcopy
pushc eraisedexception
swp
word generator.const.gcn.18 0
pushcp generator.const.gcn.18
swp
peekai
str einvalidvmop "EInvalidSVMOperation"
pcopy
pushc einvalidvmop
swp
word generator.const.gcn.19 1
pushcp generator.const.gcn.19
swp
peekai
str einvalidtypecast "EInvalidSVMTypeCast"
pcopy
pushc einvalidtypecast
swp
word generator.const.gcn.20 2
pushcp generator.const.gcn.20
swp
peekai
str eabstracterror "EAbstractError"
pcopy
pushc eabstracterror
swp
word generator.const.gcn.21 3
pushcp generator.const.gcn.21
swp
peekai
str eunknownexception "EUnknownException"
pcopy
pushc eunknownexception
swp
word generator.const.gcn.22 4
pushcp generator.const.gcn.22
swp
peekai
pop
@emathexception
word generator.const.gcn.23 9
pushcp generator.const.gcn.23
pushcp global.one
newa
peek emathexception
str einterror "EInterror"
pcopy
pushc einterror
swp
word generator.const.gcn.24 0
pushcp generator.const.gcn.24
swp
peekai
str edivbyzero "EDivByZero"
pcopy
pushc edivbyzero
swp
word generator.const.gcn.25 1
pushcp generator.const.gcn.25
swp
peekai
str erangeerror "ERangeError"
pcopy
pushc erangeerror
swp
word generator.const.gcn.26 2
pushcp generator.const.gcn.26
swp
peekai
str eintoverflow "EIntOverflow"
pcopy
pushc eintoverflow
swp
word generator.const.gcn.27 3
pushcp generator.const.gcn.27
swp
peekai
str ematherror "EMathError"
pcopy
pushc ematherror
swp
word generator.const.gcn.28 4
pushcp generator.const.gcn.28
swp
peekai
str einvalidop "EInvalidOp"
pcopy
pushc einvalidop
swp
word generator.const.gcn.29 5
pushcp generator.const.gcn.29
swp
peekai
str ezerodivide "EZeroDivide"
pcopy
pushc ezerodivide
swp
word generator.const.gcn.30 6
pushcp generator.const.gcn.30
swp
peekai
str eoverflow "EOverflow"
pcopy
pushc eoverflow
swp
word generator.const.gcn.31 7
pushcp generator.const.gcn.31
swp
peekai
str eunderflow "EUnderflow"
pcopy
pushc eunderflow
swp
word generator.const.gcn.32 8
pushcp generator.const.gcn.32
swp
peekai
pop
@ecriticalexception
word generator.const.gcn.33 3
pushcp generator.const.gcn.33
pushcp global.one
newa
peek ecriticalexception
str eaccessviolation "EAccessViolation"
pcopy
pushc eaccessviolation
swp
word generator.const.gcn.34 0
pushcp generator.const.gcn.34
swp
peekai
str eoserror "EOSError"
pcopy
pushc eoserror
swp
word generator.const.gcn.35 1
pushcp generator.const.gcn.35
swp
peekai
str enothreadsupport "ENoThreadSupport"
pcopy
pushc enothreadsupport
swp
word generator.const.gcn.36 2
pushcp generator.const.gcn.36
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
str generator.const.gcn.37 "<null>"
pushc generator.const.gcn.37
peek null
pop
push null
peek params
pop
pushc __initproc__
word generator.const.gcn.38 0
pushcp generator.const.gcn.38
push global.arg_counter
mov
jc
jr
__init__end__:
str generator.const.gcn.40 "Unknown raised exception"
pushc generator.const.gcn.40
pushc eunknownexception
pushc system_makeexception
word generator.const.gcn.39 2
pushcp generator.const.gcn.39
push global.arg_counter
mov
jc
peek eunknown
pop
pushcp foo__end
jp
foo:
@foo.this
@foo.msg
@foo.msg2
@foo.args
peek foo.msg
pop
peek foo.msg2
pop
word generator.const.gcn.41 2
pushcp generator.const.gcn.41
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek foo.args
pop
push foo.args
str generator.const.gcn.43 " "
pushc generator.const.gcn.43
push foo.msg2
push foo.msg
pushc println
word generator.const.gcn.42 4
pushcp generator.const.gcn.42
push global.arg_counter
mov
jc
jr
foo__end:
pushcp main__end
jp
main:
@main.this
@main.t
@main.calls
str generator.const.gcn.45 "This function works asynchronous!"
pushc generator.const.gcn.45
str generator.const.gcn.46 "Hi! "
pushc generator.const.gcn.46
pushc foo
pushc go
word generator.const.gcn.44 3
pushcp generator.const.gcn.44
push global.arg_counter
mov
jc
peek main.t
pop
push main.t
peek global.this
pushc vtable__waitfor
swp
pushai
word generator.const.gcn.47 0
pushcp generator.const.gcn.47
push global.arg_counter
mov
jc
word generator.const.gcn.49 2
pushcp generator.const.gcn.49
word generator.const.gcn.50 1
pushcp generator.const.gcn.50
newa
pcopy
word generator.const.gcn.53 4
pushc generator.const.gcn.53
swp
word generator.const.gcn.51 0
pushcp generator.const.gcn.51
swp
peekai
pcopy
word generator.const.gcn.54 5
pushc generator.const.gcn.54
swp
word generator.const.gcn.52 1
pushcp generator.const.gcn.52
swp
peekai
word generator.const.gcn.55 3
pushc generator.const.gcn.55
word generator.const.gcn.56 2
pushc generator.const.gcn.56
word generator.const.gcn.57 1
pushc generator.const.gcn.57
str generator.const.gcn.58 "This function works asynchronous!"
pushc generator.const.gcn.58
str generator.const.gcn.59 "Hello from new thread! "
pushc generator.const.gcn.59
pushc foo
pushc thread
word generator.const.gcn.48 7
pushcp generator.const.gcn.48
push global.arg_counter
mov
jc
peek main.t
pop
word generator.const.gcn.60 1
pushcp generator.const.gcn.60
word generator.const.gcn.61 1
pushcp generator.const.gcn.61
newa
pcopy
push main.t
swp
word generator.const.gcn.62 0
pushcp generator.const.gcn.62
swp
peekai
peek main.calls
pop
@generator.for_each.gcn.63.array
@generator.for_each.gcn.63.i
@generator.for_each.gcn.63.to
word generator.const.gcn.64 4
pushc generator.const.gcn.64
word generator.const.gcn.65 1
pushc generator.const.gcn.65
pushcp system_op_range
jc
peek generator.for_each.gcn.63.array
alen
peek generator.for_each.gcn.63.to
pop
pushc global.zero
peek generator.for_each.gcn.63.i
pop
generator.for_each.gcn.63.start:
pushcp generator.for_each.gcn.63.end
push generator.for_each.gcn.63.i
push generator.for_each.gcn.63.to
eq
not
jz
pop
push generator.for_each.gcn.63.i
push generator.for_each.gcn.63.array
pushai
@main.i
peek main.i
pop
push main.t
peek global.this
pushc vtable__clone
swp
pushai
word generator.const.gcn.67 0
pushcp generator.const.gcn.67
push global.arg_counter
mov
jc
push main.calls
pushc append
word generator.const.gcn.66 2
pushcp generator.const.gcn.66
push global.arg_counter
mov
jc
generator.for_each.gcn.63.continue:
push generator.for_each.gcn.63.i
inc
pop
pushcp generator.for_each.gcn.63.start
jp
generator.for_each.gcn.63.end:
@generator.for_each.gcn.68.array
@generator.for_each.gcn.68.i
@generator.for_each.gcn.68.to
push main.calls
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
@main.c
peek main.c
pop
push main.c
peek global.this
pushc vtable__resume
swp
pushai
word generator.const.gcn.69 0
pushcp generator.const.gcn.69
push global.arg_counter
mov
jc
push main.c
peek global.this
pushc vtable__waitfor
swp
pushai
word generator.const.gcn.70 0
pushcp generator.const.gcn.70
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
str generator.const.gcn.71 "["
pushc generator.const.gcn.71
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.72 1
pushcp generator.const.gcn.72
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.73 0
pushc generator.const.gcn.73
peek __printarray.i
pop
generator.while.gcn.74.start:
pushcp generator.while.gcn.74.end
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
word generator.const.gcn.75 1
pushcp generator.const.gcn.75
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
pushcp generator.if.gcn.76.else
push __printarray.l
word generator.const.gcn.77 1
pushc generator.const.gcn.77
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.78 ", "
pushc generator.const.gcn.78
pushc _print
invoke
generator.if.gcn.76.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.74.start
jp
generator.while.gcn.74.end:
str generator.const.gcn.79 "]"
pushc generator.const.gcn.79
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
word generator.const.gcn.81 1
pushcp generator.const.gcn.81
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.82.end
swp
jz
str generator.const.gcn.83 "(null)"
pushc generator.const.gcn.83
pushc _print
invoke
pushcp generator.switch.gcn.80.end
jp
generator.case.gcn.82.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.84.end
swp
jz
push __print.obj
peek global.this
pushc vtable__tostring
swp
pushai
word generator.const.gcn.85 0
pushcp generator.const.gcn.85
push global.arg_counter
mov
jc
pushc _print
invoke
pushcp generator.switch.gcn.80.end
jp
generator.case.gcn.84.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.86.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.87 1
pushcp generator.const.gcn.87
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.80.end
jp
generator.case.gcn.86.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.80.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.88 0
pushcp generator.const.gcn.88
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.89.array
@generator.for_each.gcn.89.i
@generator.for_each.gcn.89.to
push print.args
peek generator.for_each.gcn.89.array
alen
peek generator.for_each.gcn.89.to
pop
pushc global.zero
peek generator.for_each.gcn.89.i
pop
generator.for_each.gcn.89.start:
pushcp generator.for_each.gcn.89.end
push generator.for_each.gcn.89.i
push generator.for_each.gcn.89.to
eq
not
jz
pop
push generator.for_each.gcn.89.i
push generator.for_each.gcn.89.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.90 1
pushcp generator.const.gcn.90
push global.arg_counter
mov
jc
generator.for_each.gcn.89.continue:
push generator.for_each.gcn.89.i
inc
pop
pushcp generator.for_each.gcn.89.start
jp
generator.for_each.gcn.89.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.91 0
pushcp generator.const.gcn.91
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.92.array
@generator.for_each.gcn.92.i
@generator.for_each.gcn.92.to
push println.args
peek generator.for_each.gcn.92.array
alen
peek generator.for_each.gcn.92.to
pop
pushc global.zero
peek generator.for_each.gcn.92.i
pop
generator.for_each.gcn.92.start:
pushcp generator.for_each.gcn.92.end
push generator.for_each.gcn.92.i
push generator.for_each.gcn.92.to
eq
not
jz
pop
push generator.for_each.gcn.92.i
push generator.for_each.gcn.92.array
pushai
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.93 1
pushcp generator.const.gcn.93
push global.arg_counter
mov
jc
generator.for_each.gcn.92.continue:
push generator.for_each.gcn.92.i
inc
pop
pushcp generator.for_each.gcn.92.start
jp
generator.for_each.gcn.92.end:
str generator.const.gcn.94 ""
pushc generator.const.gcn.94
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
word generator.const.gcn.95 7
pushc generator.const.gcn.95
pushc crt_textcolor
invoke
word generator.const.gcn.96 0
pushc generator.const.gcn.96
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
word generator.const.gcn.97 256
pushc generator.const.gcn.97
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
word generator.const.gcn.98 256
pushc generator.const.gcn.98
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
pushcp thr_create__end
jp
thr_create:
@thr_create.this
@thr_create.method
@thr_create.arg
peek thr_create.method
pop
peek thr_create.arg
pop
push thr_create.arg
push thr_create.method
cthr
jr
thr_create__end:
pushcp thr_async__end
jp
thr_async:
@thr_async.this
@thr_async.method
@thr_async.arg
peek thr_async.method
pop
peek thr_async.arg
pop
push thr_async.arg
push thr_async.method
cthr
rthr
jr
thr_async__end:
pushcp thr_resume__end
jp
thr_resume:
@thr_resume.this
@thr_resume.thr
peek thr_resume.thr
pop
push thr_resume.thr
rthr
jr
thr_resume__end:
pushcp thr_suspend__end
jp
thr_suspend:
@thr_suspend.this
@thr_suspend.thr
peek thr_suspend.thr
pop
push thr_suspend.thr
sthr
jr
thr_suspend__end:
pushcp thr_terminate__end
jp
thr_terminate:
@thr_terminate.this
@thr_terminate.thr
peek thr_terminate.thr
pop
push thr_terminate.thr
tthr
jr
thr_terminate__end:
pushcp thr_setpriority__end
jp
thr_setpriority:
@thr_setpriority.this
@thr_setpriority.thr
@thr_setpriority.priority
peek thr_setpriority.thr
pop
peek thr_setpriority.priority
pop
push thr_setpriority.priority
push thr_setpriority.thr
thsp
jr
thr_setpriority__end:
pushcp thr_kill__end
jp
thr_kill:
@thr_kill.this
@thr_kill.thr
peek thr_kill.thr
pop
push thr_kill.thr
pushc thr_suspend
word generator.const.gcn.99 1
pushcp generator.const.gcn.99
push global.arg_counter
mov
jc
push thr_kill.thr
pushc thr_terminate
word generator.const.gcn.100 1
pushcp generator.const.gcn.100
push global.arg_counter
mov
jc
jr
thr_kill__end:
pushcp tthread_join__end
jp
tthread_join:
@tthread_join.this
@tthread_join.currentthreadcontext
@tthread_join.threadclass
peek tthread_join.currentthreadcontext
pop
peek tthread_join.threadclass
pop
push tthread_join.threadclass
peek global.this
pushc vtable__execute
swp
pushai
word generator.const.gcn.101 0
pushcp generator.const.gcn.101
push global.arg_counter
mov
jc
push tthread_join.threadclass
peek global.this
pushc vtable__terminate
swp
pushai
word generator.const.gcn.102 0
pushcp generator.const.gcn.102
push global.arg_counter
mov
jc
jr
tthread_join__end:
pushcp tthread__execute__end
jp
tthread__execute:
@tthread__execute.this
push global.this
peek tthread__execute.this
pop
jr
tthread__execute__end:
pushcp tthread__create__end
jp
tthread__create:
@tthread__create.this
@tthread__create.resumed
peek tthread__create.resumed
pop
push global.this
peek tthread__create.this
pop
pushc false
push tthread__create.this
pushc vtable__resumed
swp
peekai
pushc false
push tthread__create.this
pushc vtable__terminated
swp
peekai
push tthread__create.this
pushc tthread_join
pushc thr_create
word generator.const.gcn.103 2
pushcp generator.const.gcn.103
push global.arg_counter
mov
jc
push tthread__create.this
pushc vtable__threadcontext
swp
peekai
pushcp generator.if.gcn.104.else
push tthread__create.resumed
jz
pop
push tthread__create.this
peek global.this
pushc vtable__resume
swp
pushai
word generator.const.gcn.105 0
pushcp generator.const.gcn.105
push global.arg_counter
mov
jc
generator.if.gcn.104.else:
jr
tthread__create__end:
pushcp tthread__free__end
jp
tthread__free:
@tthread__free.this
push global.this
peek tthread__free.this
pop
pushcp generator.if.gcn.106.else
push tthread__free.this
pushc vtable__terminated
swp
pushai
copy
swp
pop
not
jz
pop
push tthread__free.this
peek global.this
pushc vtable__terminate
swp
pushai
word generator.const.gcn.107 0
pushcp generator.const.gcn.107
push global.arg_counter
mov
jc
generator.if.gcn.106.else:
jr
tthread__free__end:
pushcp tthread__rejoin__end
jp
tthread__rejoin:
@tthread__rejoin.this
@tthread__rejoin.resumed
peek tthread__rejoin.resumed
pop
push global.this
peek tthread__rejoin.this
pop
push tthread__rejoin.this
pushc tthread_join
pushc thread
word generator.const.gcn.108 2
pushcp generator.const.gcn.108
push global.arg_counter
mov
jc
push tthread__rejoin.this
pushc vtable__threadcontext
swp
peekai
pushcp generator.if.gcn.109.else
push tthread__rejoin.resumed
jz
pop
push tthread__rejoin.this
peek global.this
pushc vtable__resume
swp
pushai
word generator.const.gcn.110 0
pushcp generator.const.gcn.110
push global.arg_counter
mov
jc
generator.if.gcn.109.else:
jr
tthread__rejoin__end:
pushcp tthread__suspend__end
jp
tthread__suspend:
@tthread__suspend.this
push global.this
peek tthread__suspend.this
pop
push tthread__suspend.this
pushc vtable__threadcontext
swp
pushai
pushc thr_suspend
word generator.const.gcn.111 1
pushcp generator.const.gcn.111
push global.arg_counter
mov
jc
pushc false
push tthread__suspend.this
pushc vtable__resumed
swp
pushai
mov
jr
tthread__suspend__end:
pushcp tthread__resume__end
jp
tthread__resume:
@tthread__resume.this
push global.this
peek tthread__resume.this
pop
push tthread__resume.this
pushc vtable__threadcontext
swp
pushai
pushc thr_resume
word generator.const.gcn.112 1
pushcp generator.const.gcn.112
push global.arg_counter
mov
jc
pushc true
push tthread__resume.this
pushc vtable__resumed
swp
pushai
mov
jr
tthread__resume__end:
pushcp tthread__setpriority__end
jp
tthread__setpriority:
@tthread__setpriority.this
@tthread__setpriority.priority
peek tthread__setpriority.priority
pop
push global.this
peek tthread__setpriority.this
pop
push tthread__setpriority.priority
push tthread__setpriority.this
pushc vtable__threadcontext
swp
pushai
pushc thr_setpriority
word generator.const.gcn.113 2
pushcp generator.const.gcn.113
push global.arg_counter
mov
jc
jr
tthread__setpriority__end:
pushcp tthread__terminate__end
jp
tthread__terminate:
@tthread__terminate.this
push global.this
peek tthread__terminate.this
pop
pushc false
push tthread__terminate.this
pushc vtable__resumed
swp
pushai
mov
pushc true
push tthread__terminate.this
pushc vtable__terminated
swp
pushai
mov
push tthread__terminate.this
pushc vtable__threadcontext
swp
pushai
pushc thr_terminate
word generator.const.gcn.114 1
pushcp generator.const.gcn.114
push global.arg_counter
mov
jc
jr
tthread__terminate__end:
pushcp tthread__waitfor__end
jp
tthread__waitfor:
@tthread__waitfor.this
push global.this
peek tthread__waitfor.this
pop
generator.while.gcn.115.start:
pushcp generator.while.gcn.115.end
push tthread__waitfor.this
pushc vtable__terminated
swp
pushai
copy
swp
pop
not
jz
pop
word generator.const.gcn.116 1
pushc generator.const.gcn.116
pushc sleep
invoke
pushc gc
word generator.const.gcn.117 0
pushcp generator.const.gcn.117
push global.arg_counter
mov
jc
pushcp generator.while.gcn.115.start
jp
generator.while.gcn.115.end:
jr
tthread__waitfor__end:
pushcp tthreadcall__create__end
jp
tthreadcall__create:
@tthreadcall__create.this
@tthreadcall__create.method
@tthreadcall__create.args
@tthreadcall__create.resumed
peek tthreadcall__create.method
pop
peek tthreadcall__create.args
pop
peek tthreadcall__create.resumed
pop
push global.this
peek tthreadcall__create.this
pop
push tthreadcall__create.method
push tthreadcall__create.this
pushc vtable__method
swp
peekai
push tthreadcall__create.args
push tthreadcall__create.this
pushc vtable__args
swp
peekai
push tthreadcall__create.resumed
push tthreadcall__create.this
peek global.this
pop
pushcp tthread__create
word generator.const.gcn.118 1
pushcp generator.const.gcn.118
push global.arg_counter
mov
jc
jr
tthreadcall__create__end:
pushcp tthreadcall__execute__end
jp
tthreadcall__execute:
@tthreadcall__execute.this
@tthreadcall__execute.x
push global.this
peek tthreadcall__execute.this
pop
push tthreadcall__execute.this
pushc vtable__args
swp
pushai
pushc len
word generator.const.gcn.119 1
pushcp generator.const.gcn.119
push global.arg_counter
mov
jc
peek global.arg_counter
pop
@generator.for_each.gcn.120.array
@generator.for_each.gcn.120.i
@generator.for_each.gcn.120.to
push tthreadcall__execute.this
pushc vtable__args
swp
pushai
peek generator.for_each.gcn.120.array
alen
peek generator.for_each.gcn.120.i
dec
pop
pushc global.zero
peek generator.for_each.gcn.120.to
dec
pop
generator.for_each.gcn.120.start:
pushcp generator.for_each.gcn.120.end
push generator.for_each.gcn.120.i
push generator.for_each.gcn.120.to
eq
not
jz
pop
push generator.for_each.gcn.120.i
push generator.for_each.gcn.120.array
pushai
@tthreadcall__execute.arg
peek tthreadcall__execute.arg
pop
push tthreadcall__execute.arg
peek tthreadcall__execute.x
pop
push tthreadcall__execute.x
generator.for_each.gcn.120.continue:
push generator.for_each.gcn.120.i
dec
pop
pushcp generator.for_each.gcn.120.start
jp
generator.for_each.gcn.120.end:
push tthreadcall__execute.this
pushc vtable__method
swp
pushai
jc
jr
tthreadcall__execute__end:
pushcp tthreadcall__clone__end
jp
tthreadcall__clone:
@tthreadcall__clone.this
push global.this
peek tthreadcall__clone.this
pop
pushcp __allocator__tthreadcall
jc
pcopy
peek global.this
pushc false
swp
push tthreadcall__clone.this
pushc vtable__args
swp
pushai
swp
push tthreadcall__clone.this
pushc vtable__method
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.121 3
pushcp generator.const.gcn.121
push global.arg_counter
mov
jc
jr
jr
tthreadcall__clone__end:
pushcp go__end
jp
go:
@go.this
@go.method
@go.args
peek go.method
pop
word generator.const.gcn.122 1
pushcp generator.const.gcn.122
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek go.args
pop
pushcp __allocator__tthreadcall
jc
pcopy
peek global.this
pushc true
swp
push go.args
swp
push go.method
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.123 3
pushcp generator.const.gcn.123
push global.arg_counter
mov
jc
jr
jr
go__end:
pushcp thread__end
jp
thread:
@thread.this
@thread.method
@thread.args
peek thread.method
pop
word generator.const.gcn.124 1
pushcp generator.const.gcn.124
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek thread.args
pop
pushcp __allocator__tthreadcall
jc
pcopy
peek global.this
pushc false
swp
push thread.args
swp
push thread.method
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.125 3
pushcp generator.const.gcn.125
push global.arg_counter
mov
jc
jr
jr
thread__end:
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
pushcp generator.if.gcn.126.else
push system_op_range.isback
jz
pop
word generator.const.gcn.127 1
pushc generator.const.gcn.127
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
pushcp generator.if.gcn.126.end
jp
generator.if.gcn.126.else:
word generator.const.gcn.128 1
pushc generator.const.gcn.128
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
generator.if.gcn.126.end:
push system_op_range.l
word generator.const.gcn.129 1
pushcp generator.const.gcn.129
newa
peek system_op_range.res
pop
word generator.const.gcn.130 0
pushc generator.const.gcn.130
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.131 1
pushcp generator.const.gcn.131
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.132.start:
pushcp generator.while.gcn.132.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.133 1
pushcp generator.const.gcn.133
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
pushcp generator.if.gcn.134.else
push system_op_range.isback
jz
pop
word generator.const.gcn.135 1
pushc generator.const.gcn.135
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.134.end
jp
generator.if.gcn.134.else:
word generator.const.gcn.136 1
pushc generator.const.gcn.136
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.134.end:
pushcp generator.while.gcn.132.start
jp
generator.while.gcn.132.end:
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
word generator.const.gcn.137 2
pushcp generator.const.gcn.137
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
word generator.const.gcn.138 0
pushc generator.const.gcn.138
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.139 1
pushcp generator.const.gcn.139
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.140.start:
pushcp generator.while.gcn.140.end
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
pushcp generator.while.gcn.140.start
jp
generator.while.gcn.140.end:
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
pushcp generator.if.gcn.141.else
word generator.const.gcn.142 255
pushc generator.const.gcn.142
push typeof.t
eq
jz
pop
push null
jr
generator.if.gcn.141.else:
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
word generator.const.gcn.143 1
pushcp generator.const.gcn.143
push global.arg_counter
mov
jc
peek system_op_is.t
pop
pushcp generator.if.gcn.144.else
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
pushcp generator.if.gcn.144.end
jp
generator.if.gcn.144.else:
push system_op_is.right
push system_op_is.t
eq
jr
generator.if.gcn.144.end:
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
word generator.const.gcn.145 1
pushcp generator.const.gcn.145
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.146 1
pushcp generator.const.gcn.146
newa
peek system_copy_array.r
pop
word generator.const.gcn.147 0
pushc generator.const.gcn.147
peek system_copy_array.i
pop
generator.while.gcn.148.start:
pushcp generator.while.gcn.148.end
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
word generator.const.gcn.149 1
pushcp generator.const.gcn.149
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
pushcp generator.while.gcn.148.start
jp
generator.while.gcn.148.end:
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
pushcp generator.if.gcn.150.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.151 1
pushcp generator.const.gcn.151
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.152 1
pushcp generator.const.gcn.152
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.150.end
jp
generator.if.gcn.150.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.153 1
pushcp generator.const.gcn.153
push global.arg_counter
mov
jc
jr
generator.if.gcn.150.end:
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
word generator.const.gcn.154 0
pushcp generator.const.gcn.154
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.155 ""
pushc generator.const.gcn.155
peek chr.r
pop
@generator.for_each.gcn.156.array
@generator.for_each.gcn.156.i
@generator.for_each.gcn.156.to
push chr.chars
peek generator.for_each.gcn.156.array
alen
peek generator.for_each.gcn.156.to
pop
pushc global.zero
peek generator.for_each.gcn.156.i
pop
generator.for_each.gcn.156.start:
pushcp generator.for_each.gcn.156.end
push generator.for_each.gcn.156.i
push generator.for_each.gcn.156.to
eq
not
jz
pop
push generator.for_each.gcn.156.i
push generator.for_each.gcn.156.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.157 1
pushcp generator.const.gcn.157
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.156.continue:
push generator.for_each.gcn.156.i
inc
pop
pushcp generator.for_each.gcn.156.start
jp
generator.for_each.gcn.156.end:
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
word generator.const.gcn.159 1
pushcp generator.const.gcn.159
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.160.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.158.end
jp
generator.case.gcn.160.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.161.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.158.end
jp
generator.case.gcn.161.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.162.end
swp
jz
push str.value
pushc f2s
invoke
jr
pushcp generator.switch.gcn.158.end
jp
generator.case.gcn.162.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.163.end
swp
jz
push str.value
jr
pushcp generator.switch.gcn.158.end
jp
generator.case.gcn.163.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.165 "Invalid type cast via str()."
pushc generator.const.gcn.165
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.164 1
pushcp generator.const.gcn.164
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.158.end:
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
word generator.const.gcn.167 1
pushcp generator.const.gcn.167
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.168.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.166.end
jp
generator.case.gcn.168.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.169.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.166.end
jp
generator.case.gcn.169.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.170.end
swp
jz
word generator.const.gcn.171 1
pushc generator.const.gcn.171
push int.value
copy
swp
pop
idiv
jr
pushcp generator.switch.gcn.166.end
jp
generator.case.gcn.170.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.172.end
swp
jz
push int.value
pushc s2i
invoke
jr
pushcp generator.switch.gcn.166.end
jp
generator.case.gcn.172.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.174 "Invalid type cast via int()."
pushc generator.const.gcn.174
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.173 1
pushcp generator.const.gcn.173
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.166.end:
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
word generator.const.gcn.176 1
pushcp generator.const.gcn.176
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.177.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.175.end
jp
generator.case.gcn.177.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.178.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.175.end
jp
generator.case.gcn.178.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.179.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.175.end
jp
generator.case.gcn.179.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.180.end
swp
jz
push real.value
pushc s2f
invoke
jr
pushcp generator.switch.gcn.175.end
jp
generator.case.gcn.180.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.182 "Invalid type cast via int()."
pushc generator.const.gcn.182
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.181 1
pushcp generator.const.gcn.181
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.175.end:
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
pushcp generator.if.gcn.183.else
push check.cond
jz
pop
push check.rtrue
jr
pushcp generator.if.gcn.183.end
jp
generator.if.gcn.183.else:
push check.rfalse
jr
generator.if.gcn.183.end:
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
pushcp generator.if.gcn.184.else
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
generator.if.gcn.184.else:
word generator.const.gcn.185 2
pushcp generator.const.gcn.185
word generator.const.gcn.186 1
pushcp generator.const.gcn.186
newa
pcopy
push between.left
swp
word generator.const.gcn.187 0
pushcp generator.const.gcn.187
swp
peekai
pcopy
push between.right
swp
word generator.const.gcn.188 1
pushcp generator.const.gcn.188
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
pushcp generator.if.gcn.189.else
word generator.const.gcn.190 0
pushc generator.const.gcn.190
push maxfromarray.arr
pushc len
word generator.const.gcn.191 1
pushcp generator.const.gcn.191
push global.arg_counter
mov
jc
bg
jz
pop
push maxfromarray.arr
word generator.const.gcn.192 0
pushc generator.const.gcn.192
swp
pushai
peek maxfromarray.r
pop
@generator.for_each.gcn.193.array
@generator.for_each.gcn.193.i
@generator.for_each.gcn.193.to
push maxfromarray.arr
peek generator.for_each.gcn.193.array
alen
peek generator.for_each.gcn.193.to
pop
pushc global.zero
peek generator.for_each.gcn.193.i
pop
generator.for_each.gcn.193.start:
pushcp generator.for_each.gcn.193.end
push generator.for_each.gcn.193.i
push generator.for_each.gcn.193.to
eq
not
jz
pop
push generator.for_each.gcn.193.i
push generator.for_each.gcn.193.array
pushai
@maxfromarray.x
peek maxfromarray.x
pop
pushcp generator.if.gcn.194.else
push maxfromarray.r
push maxfromarray.x
bg
jz
pop
push maxfromarray.x
push maxfromarray.r
mov
generator.if.gcn.194.else:
generator.for_each.gcn.193.continue:
push generator.for_each.gcn.193.i
inc
pop
pushcp generator.for_each.gcn.193.start
jp
generator.for_each.gcn.193.end:
push maxfromarray.r
jr
pushcp generator.if.gcn.189.end
jp
generator.if.gcn.189.else:
push null
jr
generator.if.gcn.189.end:
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
pushcp generator.if.gcn.195.else
word generator.const.gcn.196 0
pushc generator.const.gcn.196
push minfromarray.arr
pushc len
word generator.const.gcn.197 1
pushcp generator.const.gcn.197
push global.arg_counter
mov
jc
bg
jz
pop
push minfromarray.arr
word generator.const.gcn.198 0
pushc generator.const.gcn.198
swp
pushai
peek minfromarray.r
pop
@generator.for_each.gcn.199.array
@generator.for_each.gcn.199.i
@generator.for_each.gcn.199.to
push minfromarray.arr
peek generator.for_each.gcn.199.array
alen
peek generator.for_each.gcn.199.to
pop
pushc global.zero
peek generator.for_each.gcn.199.i
pop
generator.for_each.gcn.199.start:
pushcp generator.for_each.gcn.199.end
push generator.for_each.gcn.199.i
push generator.for_each.gcn.199.to
eq
not
jz
pop
push generator.for_each.gcn.199.i
push generator.for_each.gcn.199.array
pushai
@minfromarray.x
peek minfromarray.x
pop
pushcp generator.if.gcn.200.else
push minfromarray.r
push minfromarray.x
swp
bg
jz
pop
push minfromarray.x
push minfromarray.r
mov
generator.if.gcn.200.else:
generator.for_each.gcn.199.continue:
push generator.for_each.gcn.199.i
inc
pop
pushcp generator.for_each.gcn.199.start
jp
generator.for_each.gcn.199.end:
push minfromarray.r
jr
pushcp generator.if.gcn.195.end
jp
generator.if.gcn.195.else:
push null
jr
generator.if.gcn.195.end:
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
word generator.const.gcn.201 0
pushcp generator.const.gcn.201
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
push max.args
pushc len
word generator.const.gcn.202 1
pushcp generator.const.gcn.202
push global.arg_counter
mov
jc
peek max.l
pop
pushcp generator.if.gcn.203.else
word generator.const.gcn.204 0
pushc generator.const.gcn.204
push max.l
bg
jz
pop
push max.args
word generator.const.gcn.205 0
pushc generator.const.gcn.205
swp
pushai
peek max.first
pop
pushcp generator.if.gcn.206.else
pushc typearray
push max.first
pushcp system_op_is
jc
jz
pop
push max.first
pushc maxfromarray
word generator.const.gcn.207 1
pushcp generator.const.gcn.207
push global.arg_counter
mov
jc
peek max.r
pop
pushcp generator.if.gcn.206.end
jp
generator.if.gcn.206.else:
push max.first
peek max.r
pop
generator.if.gcn.206.end:
word generator.const.gcn.208 1
pushc generator.const.gcn.208
peek max.i
pop
generator.while.gcn.209.start:
pushcp generator.while.gcn.209.end
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
pushcp generator.if.gcn.210.else
pushc typearray
push max.t
pushcp system_op_is
jc
jz
pop
push max.t
pushc maxfromarray
word generator.const.gcn.211 1
pushcp generator.const.gcn.211
push global.arg_counter
mov
jc
peek max._
pop
pushcp generator.if.gcn.212.else
push max.r
push max._
bg
jz
pop
push max._
push max.r
mov
generator.if.gcn.212.else:
pushcp generator.if.gcn.210.end
jp
generator.if.gcn.210.else:
pushcp generator.if.gcn.213.else
push max.r
push max.t
bg
jz
pop
push max.t
push max.r
mov
generator.if.gcn.213.else:
generator.if.gcn.210.end:
push max.i
inc
pop
pushcp generator.while.gcn.209.start
jp
generator.while.gcn.209.end:
push max.r
jr
pushcp generator.if.gcn.203.end
jp
generator.if.gcn.203.else:
push null
jr
generator.if.gcn.203.end:
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
word generator.const.gcn.214 0
pushcp generator.const.gcn.214
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
push min.args
pushc len
word generator.const.gcn.215 1
pushcp generator.const.gcn.215
push global.arg_counter
mov
jc
peek min.l
pop
pushcp generator.if.gcn.216.else
word generator.const.gcn.217 0
pushc generator.const.gcn.217
push min.l
bg
jz
pop
push min.args
word generator.const.gcn.218 0
pushc generator.const.gcn.218
swp
pushai
peek min.first
pop
pushcp generator.if.gcn.219.else
pushc typearray
push min.first
pushcp system_op_is
jc
jz
pop
push min.first
pushc minfromarray
word generator.const.gcn.220 1
pushcp generator.const.gcn.220
push global.arg_counter
mov
jc
peek min.r
pop
pushcp generator.if.gcn.219.end
jp
generator.if.gcn.219.else:
push min.first
peek min.r
pop
generator.if.gcn.219.end:
word generator.const.gcn.221 1
pushc generator.const.gcn.221
peek min.i
pop
push min.args
pushc len
word generator.const.gcn.222 1
pushcp generator.const.gcn.222
push global.arg_counter
mov
jc
peek min.l
pop
generator.while.gcn.223.start:
pushcp generator.while.gcn.223.end
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
pushcp generator.if.gcn.224.else
pushc typearray
push min.t
pushcp system_op_is
jc
jz
pop
push min.t
pushc minfromarray
word generator.const.gcn.225 1
pushcp generator.const.gcn.225
push global.arg_counter
mov
jc
peek min._
pop
pushcp generator.if.gcn.226.else
push min.r
push min._
swp
bg
jz
pop
push min._
push min.r
mov
generator.if.gcn.226.else:
pushcp generator.if.gcn.224.end
jp
generator.if.gcn.224.else:
pushcp generator.if.gcn.227.else
push min.r
push min.t
swp
bg
jz
pop
push min.t
push min.r
mov
generator.if.gcn.227.else:
generator.if.gcn.224.end:
push min.i
inc
pop
pushcp generator.while.gcn.223.start
jp
generator.while.gcn.223.end:
push min.r
jr
pushcp generator.if.gcn.216.end
jp
generator.if.gcn.216.else:
push null
jr
generator.if.gcn.216.end:
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
word generator.const.gcn.228 1
pushcp generator.const.gcn.228
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek append.values
pop
push append.array
pushc len
word generator.const.gcn.229 1
pushcp generator.const.gcn.229
push global.arg_counter
mov
jc
peek append.i
pop
push append.values
pushc len
word generator.const.gcn.230 1
pushcp generator.const.gcn.230
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
word generator.const.gcn.231 2
pushcp generator.const.gcn.231
push global.arg_counter
mov
jc
@generator.for_each.gcn.232.array
@generator.for_each.gcn.232.i
@generator.for_each.gcn.232.to
push append.values
peek generator.for_each.gcn.232.array
alen
peek generator.for_each.gcn.232.to
pop
pushc global.zero
peek generator.for_each.gcn.232.i
pop
generator.for_each.gcn.232.start:
pushcp generator.for_each.gcn.232.end
push generator.for_each.gcn.232.i
push generator.for_each.gcn.232.to
eq
not
jz
pop
push generator.for_each.gcn.232.i
push generator.for_each.gcn.232.array
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
generator.for_each.gcn.232.continue:
push generator.for_each.gcn.232.i
inc
pop
pushcp generator.for_each.gcn.232.start
jp
generator.for_each.gcn.232.end:
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
word generator.const.gcn.233 1
pushcp generator.const.gcn.233
push global.arg_counter
mov
jc
peek reverse.l
pop
word generator.const.gcn.234 2
pushc generator.const.gcn.234
push reverse.l
copy
swp
pop
idiv
peek reverse.hl
pop
word generator.const.gcn.235 0
pushc generator.const.gcn.235
peek reverse.i
pop
generator.while.gcn.236.start:
pushcp generator.while.gcn.236.end
push reverse.hl
push reverse.i
swp
bg
jz
pop
push reverse.array
word generator.const.gcn.237 1
pushc generator.const.gcn.237
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
word generator.const.gcn.238 1
pushc generator.const.gcn.238
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
pushcp generator.while.gcn.236.start
jp
generator.while.gcn.236.end:
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
word generator.const.gcn.239 0
pushc generator.const.gcn.239
peek indexof.i
pop
@generator.for_each.gcn.240.array
@generator.for_each.gcn.240.i
@generator.for_each.gcn.240.to
push indexof.array
peek generator.for_each.gcn.240.array
alen
peek generator.for_each.gcn.240.to
pop
pushc global.zero
peek generator.for_each.gcn.240.i
pop
generator.for_each.gcn.240.start:
pushcp generator.for_each.gcn.240.end
push generator.for_each.gcn.240.i
push generator.for_each.gcn.240.to
eq
not
jz
pop
push generator.for_each.gcn.240.i
push generator.for_each.gcn.240.array
pushai
@indexof.x
peek indexof.x
pop
pushcp generator.if.gcn.241.else
pushc typeclass
push indexof.x
pushcp system_op_is
jc
jz
pop
pushcp generator.if.gcn.242.else
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
generator.if.gcn.242.else:
pushcp generator.if.gcn.241.end
jp
generator.if.gcn.241.else:
pushcp generator.if.gcn.243.else
push indexof.object
push indexof.x
eq
jz
pop
push indexof.i
jr
generator.if.gcn.243.else:
generator.if.gcn.241.end:
push indexof.i
inc
pop
generator.for_each.gcn.240.continue:
push generator.for_each.gcn.240.i
inc
pop
pushcp generator.for_each.gcn.240.start
jp
generator.for_each.gcn.240.end:
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
word generator.const.gcn.244 1
pushcp generator.const.gcn.244
push global.arg_counter
mov
jc
peek insert.l
pop
word generator.const.gcn.246 1
pushc generator.const.gcn.246
push insert.l
copy
swp
pop
add
push insert.array
pushc setlen
word generator.const.gcn.245 2
pushcp generator.const.gcn.245
push global.arg_counter
mov
jc
generator.while.gcn.247.start:
pushcp generator.while.gcn.247.end
push insert.index
push insert.l
bg
jz
pop
push insert.array
word generator.const.gcn.248 1
pushc generator.const.gcn.248
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
pushcp generator.while.gcn.247.start
jp
generator.while.gcn.247.end:
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
word generator.const.gcn.249 1
pushcp generator.const.gcn.249
push global.arg_counter
mov
jc
peek delete.i
pop
word generator.const.gcn.250 1
pushc generator.const.gcn.250
push delete.array
pushc len
word generator.const.gcn.251 1
pushcp generator.const.gcn.251
push global.arg_counter
mov
jc
copy
swp
pop
sub
peek delete.l
pop
generator.while.gcn.252.start:
pushcp generator.while.gcn.252.end
push delete.l
push delete.i
swp
bg
jz
pop
push delete.array
word generator.const.gcn.253 1
pushc generator.const.gcn.253
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
pushcp generator.while.gcn.252.start
jp
generator.while.gcn.252.end:
push delete.i
push delete.array
pushc setlen
word generator.const.gcn.254 2
pushcp generator.const.gcn.254
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
word generator.const.gcn.255 2
pushcp generator.const.gcn.255
push global.arg_counter
mov
jc
peek remove.index
pop
pushcp generator.if.gcn.256.else
push null
push remove.index
eq
not
jz
pop
push remove.index
push remove.array
pushc delete
word generator.const.gcn.257 2
pushcp generator.const.gcn.257
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.256.end
jp
generator.if.gcn.256.else:
push remove.array
jr
generator.if.gcn.256.end:
jr
remove__end:
pushcp clear__end
jp
clear:
@clear.this
@clear.array
peek clear.array
pop
word generator.const.gcn.259 0
pushc generator.const.gcn.259
push clear.array
pushc setlen
word generator.const.gcn.258 2
pushcp generator.const.gcn.258
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
word generator.const.gcn.260 0
pushc generator.const.gcn.260
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.261 1
pushcp generator.const.gcn.261
newa
peek params
pop
word generator.const.gcn.262 0
pushc generator.const.gcn.262
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.263.start:
pushcp generator.while.gcn.263.end
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
pushcp generator.while.gcn.263.start
jp
generator.while.gcn.263.end:
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
str generator.const.gcn.264 "'."
pushc generator.const.gcn.264
push exception__tostring.this
pushc vtable__message
swp
pushai
str generator.const.gcn.265 ">, message: '"
pushc generator.const.gcn.265
push exception__tostring.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.266 "Exception <"
pushc generator.const.gcn.266
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
pushcp generator.if.gcn.267.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.267.end
jp
generator.if.gcn.267.else:
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
generator.if.gcn.267.end:
jr
system_makeexception__end:
pushcp main
jc
word __vtable__size__ 53
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
pushcp __allocator__tthread__end
jp
__allocator__tthread:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc tthread
swp
pushcp vtable__type
swp
peekai
pcopy
pushc tthread__execute
swp
pushcp vtable__execute
swp
peekai
pcopy
pushc tthread__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc tthread__free
swp
pushcp vtable__free
swp
peekai
pcopy
pushc tthread__rejoin
swp
pushcp vtable__rejoin
swp
peekai
pcopy
pushc tthread__suspend
swp
pushcp vtable__suspend
swp
peekai
pcopy
pushc tthread__resume
swp
pushcp vtable__resume
swp
peekai
pcopy
pushc tthread__setpriority
swp
pushcp vtable__setpriority
swp
peekai
pcopy
pushc tthread__terminate
swp
pushcp vtable__terminate
swp
peekai
pcopy
pushc tthread__waitfor
swp
pushcp vtable__waitfor
swp
peekai
jr
__allocator__tthread__end:
pushcp __allocator__tthreadcall__end
jp
__allocator__tthreadcall:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc tthreadcall
swp
pushcp vtable__type
swp
peekai
pcopy
pushc tthreadcall__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc tthreadcall__execute
swp
pushcp vtable__execute
swp
peekai
pcopy
pushc tthreadcall__clone
swp
pushcp vtable__clone
swp
peekai
pcopy
pushc tthread__free
swp
pushcp vtable__free
swp
peekai
pcopy
pushc tthread__rejoin
swp
pushcp vtable__rejoin
swp
peekai
pcopy
pushc tthread__suspend
swp
pushcp vtable__suspend
swp
peekai
pcopy
pushc tthread__resume
swp
pushcp vtable__resume
swp
peekai
pcopy
pushc tthread__setpriority
swp
pushcp vtable__setpriority
swp
peekai
pcopy
pushc tthread__terminate
swp
pushcp vtable__terminate
swp
peekai
pcopy
pushc tthread__waitfor
swp
pushcp vtable__waitfor
swp
peekai
jr
__allocator__tthreadcall__end:
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