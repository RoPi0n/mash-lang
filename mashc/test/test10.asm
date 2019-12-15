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
word typenull 0
word typeword 1
word typeint 2
word typereal 3
word typestr 4
word typearray 5
word typeclass 6
word typeref 7
word typeptr 255
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
word vtable__type 0
word vtable__a 1
word vtable__b 2
word vtable__c 3
word vtable__classname 4
word vtable__message 5
word vtable__create 6
word vtable__summ 7
word vtable__out 8
word vtable__middle 9
@global.arg_counter
@global.temp
@global.this
word global.zero 0
word global.one 1
str global.raised "ERaisedException"
pushc global.zero
peek global.arg_counter
pop
@myenum
@sysslash
@null
@params
@eabstractexception
@emathexception
@ecriticalexception
@eunknown
word myclass 0
@structure_instance_myclass
pushcp __allocator__myclass
jc
peek structure_instance_myclass
pop
word myclass2 1
@structure_instance_myclass2
pushcp __allocator__myclass2
jc
peek structure_instance_myclass2
pop
word exception 2
@structure_instance_exception
pushcp __allocator__exception
jc
peek structure_instance_exception
pop
pushcp __init__
jc
@myenum
word generator.const.gcn.0 3
pushcp generator.const.gcn.0
pushcp global.one
newa
peek myenum
str success "Success"
pcopy
pushc success
swp
word generator.const.gcn.1 0
pushcp generator.const.gcn.1
swp
peekai
word normal 1
pcopy
pushc normal
swp
word generator.const.gcn.2 1
pushcp generator.const.gcn.2
swp
peekai
word fail 2
pcopy
pushc fail
swp
word generator.const.gcn.3 2
pushcp generator.const.gcn.3
swp
peekai
pop
pushcp __init__end__
jp
__init__:
pushc getsystemslash
invoke
peek sysslash
pop
pushc __getvm_null__
word generator.const.gcn.4 0
pushcp generator.const.gcn.4
push global.arg_counter
mov
jc
peek null
pop
push null
peek params
pop
pushc __initproc__
word generator.const.gcn.5 0
pushcp generator.const.gcn.5
push global.arg_counter
mov
jc
jr
__init__end__:
word generator.const.gcn.6 5
pushcp generator.const.gcn.6
word generator.const.gcn.7 1
pushcp generator.const.gcn.7
newa
pcopy
pushc eraisedexception
swp
word generator.const.gcn.8 0
pushcp generator.const.gcn.8
swp
peekai
pcopy
pushc einvalidvmop
swp
word generator.const.gcn.9 1
pushcp generator.const.gcn.9
swp
peekai
pcopy
pushc einvalidtypecast
swp
word generator.const.gcn.10 2
pushcp generator.const.gcn.10
swp
peekai
pcopy
pushc eabstracterror
swp
word generator.const.gcn.11 3
pushcp generator.const.gcn.11
swp
peekai
pcopy
pushc eunknownexception
swp
word generator.const.gcn.12 4
pushcp generator.const.gcn.12
swp
peekai
peek eabstractexception
pop
word generator.const.gcn.13 9
pushcp generator.const.gcn.13
word generator.const.gcn.14 1
pushcp generator.const.gcn.14
newa
pcopy
pushc einterror
swp
word generator.const.gcn.15 0
pushcp generator.const.gcn.15
swp
peekai
pcopy
pushc edivbyzero
swp
word generator.const.gcn.16 1
pushcp generator.const.gcn.16
swp
peekai
pcopy
pushc erangeerror
swp
word generator.const.gcn.17 2
pushcp generator.const.gcn.17
swp
peekai
pcopy
pushc eintoverflow
swp
word generator.const.gcn.18 3
pushcp generator.const.gcn.18
swp
peekai
pcopy
pushc ematherror
swp
word generator.const.gcn.19 4
pushcp generator.const.gcn.19
swp
peekai
pcopy
pushc einvalidop
swp
word generator.const.gcn.20 5
pushcp generator.const.gcn.20
swp
peekai
pcopy
pushc ezerodivide
swp
word generator.const.gcn.21 6
pushcp generator.const.gcn.21
swp
peekai
pcopy
pushc eoverflow
swp
word generator.const.gcn.22 7
pushcp generator.const.gcn.22
swp
peekai
pcopy
pushc eunderflow
swp
word generator.const.gcn.23 8
pushcp generator.const.gcn.23
swp
peekai
peek emathexception
pop
word generator.const.gcn.24 3
pushcp generator.const.gcn.24
word generator.const.gcn.25 1
pushcp generator.const.gcn.25
newa
pcopy
pushc eaccessviolation
swp
word generator.const.gcn.26 0
pushcp generator.const.gcn.26
swp
peekai
pcopy
pushc eoserror
swp
word generator.const.gcn.27 1
pushcp generator.const.gcn.27
swp
peekai
pcopy
pushc enothreadsupport
swp
word generator.const.gcn.28 2
pushcp generator.const.gcn.28
swp
peekai
peek ecriticalexception
pop
str generator.const.gcn.30 "Unknown raised exception."
pushc generator.const.gcn.30
pushc eunknownexception
pushc system_makeexception
word generator.const.gcn.29 2
pushcp generator.const.gcn.29
push global.arg_counter
mov
jc
peek eunknown
pop
pushcp myclass__create__end
jp
myclass__create:
@myclass__create.this
@myclass__create.a
@myclass__create.b
peek myclass__create.a
pop
peek myclass__create.b
pop
push global.this
peek myclass__create.this
pop
push myclass__create.a
copy
swp
pop
push myclass__create.this
peek global.this
pushc vtable__a
swp
peekai
push myclass__create.b
copy
swp
pop
push myclass__create.this
peek global.this
pushc vtable__b
swp
peekai
jr
myclass__create__end:
pushcp myclass__summ__end
jp
myclass__summ:
@myclass__summ.this
push global.this
peek myclass__summ.this
pop
push myclass__summ.this
copy
swp
pop
peek global.this
pushc vtable__b
swp
pushai
push myclass__summ.this
copy
swp
pop
peek global.this
pushc vtable__a
swp
pushai
add
jr
jr
myclass__summ__end:
pushcp myclass__out__end
jp
myclass__out:
@myclass__out.this
@myclass__out.a
peek myclass__out.a
pop
push global.this
peek myclass__out.this
pop
push myclass__out.a
pushc println
word generator.const.gcn.31 1
pushcp generator.const.gcn.31
push global.arg_counter
mov
jc
jr
myclass__out__end:
pushcp myclass__middle__end
jp
myclass__middle:
@myclass__middle.this
push global.this
peek myclass__middle.this
pop
word generator.const.gcn.32 2
pushc generator.const.gcn.32
push myclass__middle.this
copy
swp
pop
peek global.this
pushc vtable__b
swp
pushai
push myclass__middle.this
copy
swp
pop
peek global.this
pushc vtable__a
swp
pushai
add
div
jr
jr
myclass__middle__end:
pushcp myclass2__create__end
jp
myclass2__create:
@myclass2__create.this
@myclass2__create.a
@myclass2__create.b
@myclass2__create.c
peek myclass2__create.a
pop
peek myclass2__create.b
pop
peek myclass2__create.c
pop
push global.this
peek myclass2__create.this
pop
push myclass2__create.b
push myclass2__create.a
push myclass2__create.this
peek global.this
pop
pushcp myclass__create
word generator.const.gcn.33 2
pushcp generator.const.gcn.33
push global.arg_counter
mov
jc
push myclass2__create.c
copy
swp
pop
push myclass2__create.this
peek global.this
pushc vtable__c
swp
peekai
jr
myclass2__create__end:
pushcp myclass2__summ__end
jp
myclass2__summ:
@myclass2__summ.this
push global.this
peek myclass2__summ.this
pop
push myclass2__summ.this
copy
swp
pop
peek global.this
pushc vtable__c
swp
pushai
push myclass2__summ.this
peek global.this
pop
pushcp myclass__summ
word generator.const.gcn.34 0
pushcp generator.const.gcn.34
push global.arg_counter
mov
jc
add
jr
jr
myclass2__summ__end:
pushcp foo__end
jp
foo:
@foo.this
@foo.n
peek foo.n
pop
pushcp generator.if.gcn.35.else
word generator.const.gcn.36 0
pushc generator.const.gcn.36
push foo.n
bg
jz
pop
push foo.this
rst
push foo.n
rst
@foo.k
word generator.const.gcn.38 1
pushc generator.const.gcn.38
push foo.n
copy
swp
pop
sub
pushc foo
word generator.const.gcn.37 1
pushcp generator.const.gcn.37
push global.arg_counter
mov
jc
peek foo.k
pop
rld
peek foo.n
pop
rld
peek foo.this
pop
push foo.k
pushc println
word generator.const.gcn.39 1
pushcp generator.const.gcn.39
push global.arg_counter
mov
jc
generator.if.gcn.35.else:
push foo.n
jr
jr
foo__end:
pushcp main__end
jp
main:
@main.this
@main.m
pushcp __allocator__myclass2
jc
pcopy
peek global.this
word generator.const.gcn.41 30
pushc generator.const.gcn.41
swp
word generator.const.gcn.42 20
pushc generator.const.gcn.42
swp
word generator.const.gcn.43 10
pushc generator.const.gcn.43
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.40 3
pushcp generator.const.gcn.40
push global.arg_counter
mov
jc
peek main.m
pop
push main.m
peek global.this
pushc vtable__summ
swp
pushai
word generator.const.gcn.45 0
pushcp generator.const.gcn.45
push global.arg_counter
mov
jc
push structure_instance_myclass
peek global.this
pushc vtable__out
swp
pushai
word generator.const.gcn.44 1
pushcp generator.const.gcn.44
push global.arg_counter
mov
jc
pushc success
push structure_instance_myclass
peek global.this
pushc vtable__out
swp
pushai
word generator.const.gcn.46 1
pushcp generator.const.gcn.46
push global.arg_counter
mov
jc
word generator.const.gcn.48 10
pushc generator.const.gcn.48
pushc foo
word generator.const.gcn.47 1
pushcp generator.const.gcn.47
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
str generator.const.gcn.49 "["
pushc generator.const.gcn.49
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.50 1
pushcp generator.const.gcn.50
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.51 0
pushc generator.const.gcn.51
peek __printarray.i
pop
generator.while.gcn.52.start:
pushcp generator.while.gcn.52.end
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
word generator.const.gcn.53 1
pushcp generator.const.gcn.53
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
pushcp generator.if.gcn.54.else
push __printarray.l
word generator.const.gcn.55 1
pushc generator.const.gcn.55
push __printarray.i
add
swp
bg
jz
pop
str generator.const.gcn.56 ", "
pushc generator.const.gcn.56
pushc _print
invoke
generator.if.gcn.54.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.52.start
jp
generator.while.gcn.52.end:
str generator.const.gcn.57 "]"
pushc generator.const.gcn.57
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
word generator.const.gcn.59 1
pushcp generator.const.gcn.59
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.60.end
swp
jz
str generator.const.gcn.61 "(null)"
pushc generator.const.gcn.61
pushc _print
invoke
pushcp generator.switch.gcn.58.end
jp
generator.case.gcn.60.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.62.end
swp
jz
pushcp generator.if.gcn.63.else
pushc exception
push __print.obj
peek global.this
pushc vtable__type
swp
pushai
eq
jz
pop
str generator.const.gcn.64 "'."
pushc generator.const.gcn.64
push __print.obj
copy
swp
pop
peek global.this
pushc vtable__message
swp
pushai
str generator.const.gcn.65 "> with message: '"
pushc generator.const.gcn.65
push __print.obj
copy
swp
pop
peek global.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.66 "Exception <"
pushc generator.const.gcn.66
add
add
add
add
pushc _print
invoke
pushcp generator.if.gcn.63.end
jp
generator.if.gcn.63.else:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.68 "I/O exception: invalid object type for output"
pushc generator.const.gcn.68
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.67 1
pushcp generator.const.gcn.67
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.if.gcn.63.end:
pushcp generator.switch.gcn.58.end
jp
generator.case.gcn.62.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.69.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.70 1
pushcp generator.const.gcn.70
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.58.end
jp
generator.case.gcn.69.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.58.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.71 0
pushcp generator.const.gcn.71
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.72.array
@generator.for_each.gcn.72.i
@generator.for_each.gcn.72.to
push print.args
peek generator.for_each.gcn.72.array
alen
peek generator.for_each.gcn.72.to
pop
pushc global.zero
peek generator.for_each.gcn.72.i
pop
generator.for_each.gcn.72.start:
pushcp generator.for_each.gcn.72.end
push generator.for_each.gcn.72.i
push generator.for_each.gcn.72.to
eq
not
jz
pop
push generator.for_each.gcn.72.i
push generator.for_each.gcn.72.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.73 1
pushcp generator.const.gcn.73
push global.arg_counter
mov
jc
generator.for_each.gcn.72.continue:
push generator.for_each.gcn.72.i
inc
pop
pushcp generator.for_each.gcn.72.start
jp
generator.for_each.gcn.72.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.74 0
pushcp generator.const.gcn.74
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.75.array
@generator.for_each.gcn.75.i
@generator.for_each.gcn.75.to
push println.args
peek generator.for_each.gcn.75.array
alen
peek generator.for_each.gcn.75.to
pop
pushc global.zero
peek generator.for_each.gcn.75.i
pop
generator.for_each.gcn.75.start:
pushcp generator.for_each.gcn.75.end
push generator.for_each.gcn.75.i
push generator.for_each.gcn.75.to
eq
not
jz
pop
push generator.for_each.gcn.75.i
push generator.for_each.gcn.75.array
pushai
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.76 1
pushcp generator.const.gcn.76
push global.arg_counter
mov
jc
generator.for_each.gcn.75.continue:
push generator.for_each.gcn.75.i
inc
pop
pushcp generator.for_each.gcn.75.start
jp
generator.for_each.gcn.75.end:
str generator.const.gcn.77 ""
pushc generator.const.gcn.77
pushc _println
invoke
jr
println__end:
pushcp crt_normvideo__end
jp
crt_normvideo:
@crt_normvideo.this
word generator.const.gcn.78 7
pushc generator.const.gcn.78
pushc crt_textcolor
invoke
word generator.const.gcn.79 0
pushc generator.const.gcn.79
pushc crt_textbackground
invoke
jr
crt_normvideo__end:
pushcp crt_wherex__end
jp
crt_wherex:
@crt_wherex.this
word generator.const.gcn.80 256
pushc generator.const.gcn.80
pushc crt_wherex32
invoke
mod
jr
jr
crt_wherex__end:
pushcp crt_wherey__end
jp
crt_wherey:
@crt_wherey.this
word generator.const.gcn.81 256
pushc generator.const.gcn.81
pushc crt_wherey32
invoke
mod
jr
jr
crt_wherey__end:
pushcp crt_pause__end
jp
crt_pause:
@crt_pause.this
@crt_pause.pop
pushc crt_readkey
invoke
push crt_pause.pop
jr
crt_pause__end:
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
pushcp generator.if.gcn.82.else
push system_op_range.isback
jz
pop
word generator.const.gcn.83 1
pushc generator.const.gcn.83
push system_op_range.to
copy
swp
pop
push system_op_range.from
copy
swp
pop
sub
add
peek system_op_range.l
pop
pushcp generator.if.gcn.82.end
jp
generator.if.gcn.82.else:
word generator.const.gcn.84 1
pushc generator.const.gcn.84
push system_op_range.from
copy
swp
pop
push system_op_range.to
copy
swp
pop
sub
add
peek system_op_range.l
pop
generator.if.gcn.82.end:
push system_op_range.l
word generator.const.gcn.85 1
pushcp generator.const.gcn.85
newa
peek system_op_range.res
pop
word generator.const.gcn.86 0
pushc generator.const.gcn.86
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.87 1
pushcp generator.const.gcn.87
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.88.start:
pushcp generator.while.gcn.88.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
copy
swp
pop
push system_op_range.res
push system_op_range.i
swp
peekai
push system_op_range.i
inc
pop
pushcp generator.if.gcn.89.else
push system_op_range.isback
jz
pop
word generator.const.gcn.90 1
pushc generator.const.gcn.90
push system_op_range.j
sub
push system_op_range.j
mov
pushcp generator.if.gcn.89.end
jp
generator.if.gcn.89.else:
word generator.const.gcn.91 1
pushc generator.const.gcn.91
push system_op_range.j
add
push system_op_range.j
mov
generator.if.gcn.89.end:
pushcp generator.while.gcn.88.start
jp
generator.while.gcn.88.end:
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
@generator.for_each.gcn.92.array
@generator.for_each.gcn.92.i
@generator.for_each.gcn.92.to
push system_op_in.right
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
@system_op_in.x
peek system_op_in.x
pop
pushcp generator.if.gcn.93.else
push system_op_in.left
push system_op_in.x
eq
jz
pop
pushc true
jr
generator.if.gcn.93.else:
generator.for_each.gcn.92.continue:
push generator.for_each.gcn.92.i
inc
pop
pushcp generator.for_each.gcn.92.start
jp
generator.for_each.gcn.92.end:
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
word generator.const.gcn.94 0
pushc generator.const.gcn.94
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.95 1
pushcp generator.const.gcn.95
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.96.start:
pushcp generator.while.gcn.96.end
push system_op_argsarr.argcount
push system_op_argsarr.t
swp
bg
jz
pop
peek system_op_argsarr.tmp
pop
push system_op_argsarr.tmp
copy
swp
pop
push system_op_argsarr.argset
push system_op_argsarr.t
swp
peekai
push system_op_argsarr.t
inc
pop
pushcp generator.while.gcn.96.start
jp
generator.while.gcn.96.end:
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
peek typeof.object
pop
push typeof.object
typeof
jr
typeof__end:
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
word generator.const.gcn.97 1
pushcp generator.const.gcn.97
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.98 1
pushcp generator.const.gcn.98
newa
peek system_copy_array.r
pop
word generator.const.gcn.99 0
pushc generator.const.gcn.99
peek system_copy_array.i
pop
generator.while.gcn.100.start:
pushcp generator.while.gcn.100.end
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
copy
swp
pop
push system_copy_array.i
copy
swp
pop
swp
pushai
copy
swp
pop
pushc copy
word generator.const.gcn.101 1
pushcp generator.const.gcn.101
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
pushcp generator.while.gcn.100.start
jp
generator.while.gcn.100.end:
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
pushcp generator.if.gcn.102.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.103 1
pushcp generator.const.gcn.103
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.104 1
pushcp generator.const.gcn.104
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.102.end
jp
generator.if.gcn.102.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.105 1
pushcp generator.const.gcn.105
push global.arg_counter
mov
jc
jr
generator.if.gcn.102.end:
jr
copy__end:
pushcp gc__end
jp
gc:
@gc.this
gc
jr
gc__end:
pushcp fullgc__end
jp
fullgc:
@fullgc.this
stkdrop
gc
jr
fullgc__end:
pushcp max__end
jp
max:
@max.this
@max.args
@max.r
word generator.const.gcn.106 0
pushcp generator.const.gcn.106
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
pushcp generator.if.gcn.107.else
word generator.const.gcn.108 0
pushc generator.const.gcn.108
push max.args
pushc len
word generator.const.gcn.109 1
pushcp generator.const.gcn.109
push global.arg_counter
mov
jc
bg
jz
pop
push max.args
word generator.const.gcn.110 0
pushc generator.const.gcn.110
swp
pushai
peek max.r
pop
@generator.for_each.gcn.111.array
@generator.for_each.gcn.111.i
@generator.for_each.gcn.111.to
push max.args
peek generator.for_each.gcn.111.array
alen
peek generator.for_each.gcn.111.to
pop
pushc global.zero
peek generator.for_each.gcn.111.i
pop
generator.for_each.gcn.111.start:
pushcp generator.for_each.gcn.111.end
push generator.for_each.gcn.111.i
push generator.for_each.gcn.111.to
eq
not
jz
pop
push generator.for_each.gcn.111.i
push generator.for_each.gcn.111.array
pushai
@max.x
peek max.x
pop
pushcp generator.if.gcn.112.else
push max.r
push max.x
bg
jz
pop
push max.x
push max.r
mov
generator.if.gcn.112.else:
generator.for_each.gcn.111.continue:
push generator.for_each.gcn.111.i
inc
pop
pushcp generator.for_each.gcn.111.start
jp
generator.for_each.gcn.111.end:
push max.r
jr
pushcp generator.if.gcn.107.end
jp
generator.if.gcn.107.else:
push null
jr
generator.if.gcn.107.end:
jr
max__end:
pushcp min__end
jp
min:
@min.this
@min.args
@min.r
word generator.const.gcn.113 0
pushcp generator.const.gcn.113
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
pushcp generator.if.gcn.114.else
word generator.const.gcn.115 0
pushc generator.const.gcn.115
push min.args
pushc len
word generator.const.gcn.116 1
pushcp generator.const.gcn.116
push global.arg_counter
mov
jc
bg
jz
pop
push min.args
word generator.const.gcn.117 0
pushc generator.const.gcn.117
swp
pushai
peek min.r
pop
@generator.for_each.gcn.118.array
@generator.for_each.gcn.118.i
@generator.for_each.gcn.118.to
push min.args
peek generator.for_each.gcn.118.array
alen
peek generator.for_each.gcn.118.to
pop
pushc global.zero
peek generator.for_each.gcn.118.i
pop
generator.for_each.gcn.118.start:
pushcp generator.for_each.gcn.118.end
push generator.for_each.gcn.118.i
push generator.for_each.gcn.118.to
eq
not
jz
pop
push generator.for_each.gcn.118.i
push generator.for_each.gcn.118.array
pushai
@min.x
peek min.x
pop
pushcp generator.if.gcn.119.else
push min.r
push min.x
swp
bg
jz
pop
push min.x
push min.r
mov
generator.if.gcn.119.else:
generator.for_each.gcn.118.continue:
push generator.for_each.gcn.118.i
inc
pop
pushcp generator.for_each.gcn.118.start
jp
generator.for_each.gcn.118.end:
push min.r
jr
pushcp generator.if.gcn.114.end
jp
generator.if.gcn.114.else:
push null
jr
generator.if.gcn.114.end:
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
word generator.const.gcn.120 0
pushcp generator.const.gcn.120
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.121 ""
pushc generator.const.gcn.121
peek chr.r
pop
@generator.for_each.gcn.122.array
@generator.for_each.gcn.122.i
@generator.for_each.gcn.122.to
push chr.chars
peek generator.for_each.gcn.122.array
alen
peek generator.for_each.gcn.122.to
pop
pushc global.zero
peek generator.for_each.gcn.122.i
pop
generator.for_each.gcn.122.start:
pushcp generator.for_each.gcn.122.end
push generator.for_each.gcn.122.i
push generator.for_each.gcn.122.to
eq
not
jz
pop
push generator.for_each.gcn.122.i
push generator.for_each.gcn.122.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.123 1
pushcp generator.const.gcn.123
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.122.continue:
push generator.for_each.gcn.122.i
inc
pop
pushcp generator.for_each.gcn.122.start
jp
generator.for_each.gcn.122.end:
push chr.r
jr
jr
chr__end:
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
word generator.const.gcn.124 0
pushc generator.const.gcn.124
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.125 1
pushcp generator.const.gcn.125
newa
peek params
pop
word generator.const.gcn.126 0
pushc generator.const.gcn.126
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.127.start:
pushcp generator.while.gcn.127.end
push __initproc__.argc
push __initproc__.local_i
swp
bg
jz
pop
peek __initproc__.local_a
pop
push __initproc__.local_a
copy
swp
pop
push params
push __initproc__.local_i
swp
peekai
push __initproc__.local_i
inc
pop
pushcp generator.while.gcn.127.start
jp
generator.while.gcn.127.end:
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
peek global.this
pushc vtable__classname
swp
peekai
push exception__create.message
copy
swp
pop
push exception__create.this
peek global.this
pushc vtable__message
swp
peekai
jr
exception__create__end:
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
pushcp generator.if.gcn.128.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.128.end
jp
generator.if.gcn.128.else:
pushcp __allocator__exception
jc
peek system_makeexception.e
pop
push system_makeexception.classname
copy
swp
pop
push system_makeexception.e
peek global.this
pushc vtable__classname
swp
peekai
push system_makeexception.message
copy
swp
pop
push system_makeexception.e
peek global.this
pushc vtable__message
swp
peekai
push system_makeexception.e
jr
generator.if.gcn.128.end:
jr
system_makeexception__end:
pushcp main
jc
word __vtable__size__ 10
pushcp __allocator__myclass__end
jp
__allocator__myclass:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc myclass
swp
pushcp vtable__type
swp
peekai
pcopy
pushc myclass__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc myclass__summ
swp
pushcp vtable__summ
swp
peekai
pcopy
pushc myclass__out
swp
pushcp vtable__out
swp
peekai
pcopy
pushc myclass__middle
swp
pushcp vtable__middle
swp
peekai
jr
__allocator__myclass__end:
pushcp __allocator__myclass2__end
jp
__allocator__myclass2:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc myclass2
swp
pushcp vtable__type
swp
peekai
pcopy
pushc myclass2__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc myclass2__summ
swp
pushcp vtable__summ
swp
peekai
pcopy
pushc myclass__out
swp
pushcp vtable__out
swp
peekai
pcopy
pushc myclass__middle
swp
pushcp vtable__middle
swp
peekai
jr
__allocator__myclass2__end:
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
jr
__allocator__exception__end: