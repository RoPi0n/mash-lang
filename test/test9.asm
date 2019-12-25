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
import __critsect_create "sync.lib" "CRITICAL_SECTION_CREATE"
import __critsect_enter "sync.lib" "CRITICAL_SECTION_ENTER"
import __critsect_leave "sync.lib" "CRITICAL_SECTION_LEAVE"
import __critsect_tryenter "sync.lib" "CRITICAL_SECTION_TRYENTER"
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
word vtable__objects 1
word vtable__keys 2
word vtable__classname 3
word vtable__message 4
word vtable__items 5
word vtable__size 6
word vtable__locker 7
word vtable__critical_section 8
word vtable__value 9
word vtable__create 10
word vtable__add 11
word vtable__delete 12
word vtable__deleteat 13
word vtable__clear 14
word vtable__get 15
word vtable__set 16
word vtable__at 17
word vtable__keyat 18
word vtable__indexof 19
word vtable__keyindexof 20
word vtable__insert 21
word vtable__count 22
word vtable__sort 23
word vtable__find 24
word vtable__nextins 25
word vtable__lock 26
word vtable__unlock 27
word vtable__enter 28
word vtable__leave 29
word vtable__tryenter 30
@global.arg_counter
@global.temp
@global.this
word global.zero 0
word global.one 1
str global.raised "ERaisedException"
pushc global.zero
peek global.arg_counter
pop
@sysslash
@null
@params
@eabstractexception
@emathexception
@ecriticalexception
@eunknown
word map 0
@structure_instance_map
pushcp __allocator__map
jc
peek structure_instance_map
pop
word exception 1
@structure_instance_exception
pushcp __allocator__exception
jc
peek structure_instance_exception
pop
word list 2
@structure_instance_list
pushcp __allocator__list
jc
peek structure_instance_list
pop
word threadlist 3
@structure_instance_threadlist
pushcp __allocator__threadlist
jc
peek structure_instance_threadlist
pop
word criticalsection 4
@structure_instance_criticalsection
pushcp __allocator__criticalsection
jc
peek structure_instance_criticalsection
pop
word atomic 5
@structure_instance_atomic
pushcp __allocator__atomic
jc
peek structure_instance_atomic
pop
pushcp __init__
jc
pushcp __init__end__
jp
__init__:
pushc getsystemslash
invoke
peek sysslash
pop
pushc __getvm_null__
word generator.const.gcn.0 0
pushcp generator.const.gcn.0
push global.arg_counter
mov
jc
peek null
pop
push null
peek params
pop
pushc __initproc__
word generator.const.gcn.1 0
pushcp generator.const.gcn.1
push global.arg_counter
mov
jc
jr
__init__end__:
word generator.const.gcn.2 5
pushcp generator.const.gcn.2
word generator.const.gcn.3 1
pushcp generator.const.gcn.3
newa
pcopy
pushc eraisedexception
swp
word generator.const.gcn.4 0
pushcp generator.const.gcn.4
swp
peekai
pcopy
pushc einvalidvmop
swp
word generator.const.gcn.5 1
pushcp generator.const.gcn.5
swp
peekai
pcopy
pushc einvalidtypecast
swp
word generator.const.gcn.6 2
pushcp generator.const.gcn.6
swp
peekai
pcopy
pushc eabstracterror
swp
word generator.const.gcn.7 3
pushcp generator.const.gcn.7
swp
peekai
pcopy
pushc eunknownexception
swp
word generator.const.gcn.8 4
pushcp generator.const.gcn.8
swp
peekai
peek eabstractexception
pop
word generator.const.gcn.9 9
pushcp generator.const.gcn.9
word generator.const.gcn.10 1
pushcp generator.const.gcn.10
newa
pcopy
pushc einterror
swp
word generator.const.gcn.11 0
pushcp generator.const.gcn.11
swp
peekai
pcopy
pushc edivbyzero
swp
word generator.const.gcn.12 1
pushcp generator.const.gcn.12
swp
peekai
pcopy
pushc erangeerror
swp
word generator.const.gcn.13 2
pushcp generator.const.gcn.13
swp
peekai
pcopy
pushc eintoverflow
swp
word generator.const.gcn.14 3
pushcp generator.const.gcn.14
swp
peekai
pcopy
pushc ematherror
swp
word generator.const.gcn.15 4
pushcp generator.const.gcn.15
swp
peekai
pcopy
pushc einvalidop
swp
word generator.const.gcn.16 5
pushcp generator.const.gcn.16
swp
peekai
pcopy
pushc ezerodivide
swp
word generator.const.gcn.17 6
pushcp generator.const.gcn.17
swp
peekai
pcopy
pushc eoverflow
swp
word generator.const.gcn.18 7
pushcp generator.const.gcn.18
swp
peekai
pcopy
pushc eunderflow
swp
word generator.const.gcn.19 8
pushcp generator.const.gcn.19
swp
peekai
peek emathexception
pop
word generator.const.gcn.20 3
pushcp generator.const.gcn.20
word generator.const.gcn.21 1
pushcp generator.const.gcn.21
newa
pcopy
pushc eaccessviolation
swp
word generator.const.gcn.22 0
pushcp generator.const.gcn.22
swp
peekai
pcopy
pushc eoserror
swp
word generator.const.gcn.23 1
pushcp generator.const.gcn.23
swp
peekai
pcopy
pushc enothreadsupport
swp
word generator.const.gcn.24 2
pushcp generator.const.gcn.24
swp
peekai
peek ecriticalexception
pop
str generator.const.gcn.26 "Unknown raised exception."
pushc generator.const.gcn.26
pushc eunknownexception
pushc system_makeexception
word generator.const.gcn.25 2
pushcp generator.const.gcn.25
push global.arg_counter
mov
jc
peek eunknown
pop
pushcp main__end
jp
main:
@main.this
@main.m
pushcp __allocator__map
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.27 0
pushcp generator.const.gcn.27
push global.arg_counter
mov
jc
peek main.m
pop
word generator.const.gcn.29 1
pushc generator.const.gcn.29
str generator.const.gcn.30 "World"
pushc generator.const.gcn.30
push main.m
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.28 2
pushcp generator.const.gcn.28
push global.arg_counter
mov
jc
word generator.const.gcn.32 0
pushc generator.const.gcn.32
str generator.const.gcn.33 "Hello"
pushc generator.const.gcn.33
push main.m
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.31 2
pushcp generator.const.gcn.31
push global.arg_counter
mov
jc
word generator.const.gcn.35 2
pushc generator.const.gcn.35
str generator.const.gcn.36 "!"
pushc generator.const.gcn.36
push main.m
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.34 2
pushcp generator.const.gcn.34
push global.arg_counter
mov
jc
@generator.for_each.gcn.37.array
@generator.for_each.gcn.37.i
@generator.for_each.gcn.37.to
word generator.const.gcn.38 2
pushc generator.const.gcn.38
word generator.const.gcn.39 0
pushc generator.const.gcn.39
pushcp system_op_range
jc
peek generator.for_each.gcn.37.array
alen
peek generator.for_each.gcn.37.to
pop
pushc global.zero
peek generator.for_each.gcn.37.i
pop
generator.for_each.gcn.37.start:
pushcp generator.for_each.gcn.37.end
push generator.for_each.gcn.37.i
push generator.for_each.gcn.37.to
eq
not
jz
pop
push generator.for_each.gcn.37.i
push generator.for_each.gcn.37.array
pushai
@main.i
peek main.i
pop
push main.i
push main.m
peek global.this
pushc vtable__get
swp
pushai
word generator.const.gcn.41 1
pushcp generator.const.gcn.41
push global.arg_counter
mov
jc
pushc println
word generator.const.gcn.40 1
pushcp generator.const.gcn.40
push global.arg_counter
mov
jc
generator.for_each.gcn.37.continue:
push generator.for_each.gcn.37.i
inc
pop
pushcp generator.for_each.gcn.37.start
jp
generator.for_each.gcn.37.end:
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
str generator.const.gcn.42 "["
pushc generator.const.gcn.42
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.43 1
pushcp generator.const.gcn.43
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.44 0
pushc generator.const.gcn.44
peek __printarray.i
pop
generator.while.gcn.45.start:
pushcp generator.while.gcn.45.end
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
word generator.const.gcn.46 1
pushcp generator.const.gcn.46
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
pushcp generator.if.gcn.47.else
push __printarray.l
word generator.const.gcn.48 1
pushc generator.const.gcn.48
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.49 ", "
pushc generator.const.gcn.49
pushc _print
invoke
generator.if.gcn.47.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.45.start
jp
generator.while.gcn.45.end:
str generator.const.gcn.50 "]"
pushc generator.const.gcn.50
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
word generator.const.gcn.52 1
pushcp generator.const.gcn.52
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.53.end
swp
jz
str generator.const.gcn.54 "(null)"
pushc generator.const.gcn.54
pushc _print
invoke
pushcp generator.switch.gcn.51.end
jp
generator.case.gcn.53.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.55.end
swp
jz
pushcp generator.if.gcn.56.else
pushc exception
push __print.obj
peek global.this
pushc vtable__type
swp
pushai
eq
jz
pop
str generator.const.gcn.57 "'."
pushc generator.const.gcn.57
push __print.obj
peek global.this
pushc vtable__message
swp
pushai
str generator.const.gcn.58 "> with message: '"
pushc generator.const.gcn.58
push __print.obj
peek global.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.59 "Exception <"
pushc generator.const.gcn.59
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
pushc _print
invoke
pushcp generator.if.gcn.56.end
jp
generator.if.gcn.56.else:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.61 "I/O exception: invalid object type for output"
pushc generator.const.gcn.61
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.60 1
pushcp generator.const.gcn.60
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.if.gcn.56.end:
pushcp generator.switch.gcn.51.end
jp
generator.case.gcn.55.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.62.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.63 1
pushcp generator.const.gcn.63
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.51.end
jp
generator.case.gcn.62.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.51.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.64 0
pushcp generator.const.gcn.64
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.65.array
@generator.for_each.gcn.65.i
@generator.for_each.gcn.65.to
push print.args
peek generator.for_each.gcn.65.array
alen
peek generator.for_each.gcn.65.to
pop
pushc global.zero
peek generator.for_each.gcn.65.i
pop
generator.for_each.gcn.65.start:
pushcp generator.for_each.gcn.65.end
push generator.for_each.gcn.65.i
push generator.for_each.gcn.65.to
eq
not
jz
pop
push generator.for_each.gcn.65.i
push generator.for_each.gcn.65.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.66 1
pushcp generator.const.gcn.66
push global.arg_counter
mov
jc
generator.for_each.gcn.65.continue:
push generator.for_each.gcn.65.i
inc
pop
pushcp generator.for_each.gcn.65.start
jp
generator.for_each.gcn.65.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.67 0
pushcp generator.const.gcn.67
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.68.array
@generator.for_each.gcn.68.i
@generator.for_each.gcn.68.to
push println.args
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
@println.arg
peek println.arg
pop
push println.arg
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
str generator.const.gcn.70 ""
pushc generator.const.gcn.70
pushc _println
invoke
jr
println__end:
pushcp crt_normvideo__end
jp
crt_normvideo:
@crt_normvideo.this
word generator.const.gcn.71 7
pushc generator.const.gcn.71
pushc crt_textcolor
invoke
word generator.const.gcn.72 0
pushc generator.const.gcn.72
pushc crt_textbackground
invoke
jr
crt_normvideo__end:
pushcp crt_wherex__end
jp
crt_wherex:
@crt_wherex.this
word generator.const.gcn.73 256
pushc generator.const.gcn.73
pushc crt_wherex32
invoke
copy
swp
pop
mod
jr
jr
crt_wherex__end:
pushcp crt_wherey__end
jp
crt_wherey:
@crt_wherey.this
word generator.const.gcn.74 256
pushc generator.const.gcn.74
pushc crt_wherey32
invoke
copy
swp
pop
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
pushcp map__create__end
jp
map__create:
@map__create.this
push global.this
peek map__create.this
pop
pushcp __allocator__list
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.75 0
pushcp generator.const.gcn.75
push global.arg_counter
mov
jc
push map__create.this
peek global.this
pushc vtable__objects
swp
peekai
pushcp __allocator__list
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.76 0
pushcp generator.const.gcn.76
push global.arg_counter
mov
jc
push map__create.this
peek global.this
pushc vtable__keys
swp
peekai
jr
map__create__end:
pushcp map__add__end
jp
map__add:
@map__add.this
@map__add.obj
@map__add.key
peek map__add.obj
pop
peek map__add.key
pop
push global.this
peek map__add.this
pop
push map__add.key
push map__add.this
pushc vtable__keys
swp
pushai
peek global.this
pushc vtable__nextins
swp
pushai
word generator.const.gcn.78 1
pushcp generator.const.gcn.78
push global.arg_counter
mov
jc
push map__add.obj
push map__add.this
pushc vtable__objects
swp
pushai
peek global.this
pushc vtable__insert
swp
pushai
word generator.const.gcn.77 2
pushcp generator.const.gcn.77
push global.arg_counter
mov
jc
jr
map__add__end:
pushcp map__delete__end
jp
map__delete:
@map__delete.this
@map__delete.key
@map__delete.indx
peek map__delete.key
pop
push global.this
peek map__delete.this
pop
push map__delete.key
push map__delete.this
pushc vtable__keys
swp
pushai
peek global.this
pushc vtable__find
swp
pushai
word generator.const.gcn.79 1
pushcp generator.const.gcn.79
push global.arg_counter
mov
jc
peek map__delete.indx
pop
push map__delete.indx
push map__delete.this
pushc vtable__keys
swp
pushai
peek global.this
pushc vtable__delete
swp
pushai
word generator.const.gcn.80 1
pushcp generator.const.gcn.80
push global.arg_counter
mov
jc
push map__delete.indx
push map__delete.this
pushc vtable__objects
swp
pushai
peek global.this
pushc vtable__delete
swp
pushai
word generator.const.gcn.81 1
pushcp generator.const.gcn.81
push global.arg_counter
mov
jc
jr
map__delete__end:
pushcp map__deleteat__end
jp
map__deleteat:
@map__deleteat.this
@map__deleteat.index
peek map__deleteat.index
pop
push global.this
peek map__deleteat.this
pop
push map__deleteat.index
push map__deleteat.this
pushc vtable__keys
swp
pushai
peek global.this
pushc vtable__delete
swp
pushai
word generator.const.gcn.82 1
pushcp generator.const.gcn.82
push global.arg_counter
mov
jc
push map__deleteat.index
push map__deleteat.this
pushc vtable__objects
swp
pushai
peek global.this
pushc vtable__delete
swp
pushai
word generator.const.gcn.83 1
pushcp generator.const.gcn.83
push global.arg_counter
mov
jc
jr
map__deleteat__end:
pushcp map__clear__end
jp
map__clear:
@map__clear.this
push global.this
peek map__clear.this
pop
push map__clear.this
pushc vtable__keys
swp
pushai
peek global.this
pushc vtable__clear
swp
pushai
word generator.const.gcn.84 0
pushcp generator.const.gcn.84
push global.arg_counter
mov
jc
push map__clear.this
pushc vtable__objects
swp
pushai
peek global.this
pushc vtable__clear
swp
pushai
word generator.const.gcn.85 0
pushcp generator.const.gcn.85
push global.arg_counter
mov
jc
jr
map__clear__end:
pushcp map__get__end
jp
map__get:
@map__get.this
@map__get.key
peek map__get.key
pop
push global.this
peek map__get.this
pop
push map__get.this
pushc vtable__objects
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
push map__get.key
push map__get.this
pushc vtable__keys
swp
pushai
peek global.this
pushc vtable__find
swp
pushai
word generator.const.gcn.86 1
pushcp generator.const.gcn.86
push global.arg_counter
mov
jc
swp
pushai
jr
jr
map__get__end:
pushcp map__set__end
jp
map__set:
@map__set.this
@map__set.key
@map__set.object
peek map__set.key
pop
peek map__set.object
pop
push global.this
peek map__set.this
pop
push map__set.object
push map__set.this
pushc vtable__objects
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
push map__set.key
push map__set.this
pushc vtable__keys
swp
pushai
peek global.this
pushc vtable__find
swp
pushai
word generator.const.gcn.87 1
pushcp generator.const.gcn.87
push global.arg_counter
mov
jc
swp
peekai
jr
map__set__end:
pushcp map__at__end
jp
map__at:
@map__at.this
@map__at.index
peek map__at.index
pop
push global.this
peek map__at.this
pop
push map__at.this
pushc vtable__objects
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
push map__at.index
swp
pushai
jr
jr
map__at__end:
pushcp map__keyat__end
jp
map__keyat:
@map__keyat.this
@map__keyat.index
peek map__keyat.index
pop
push global.this
peek map__keyat.this
pop
push map__keyat.this
pushc vtable__keys
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
push map__keyat.index
swp
pushai
jr
jr
map__keyat__end:
pushcp map__indexof__end
jp
map__indexof:
@map__indexof.this
@map__indexof.obj
peek map__indexof.obj
pop
push global.this
peek map__indexof.this
pop
push map__indexof.obj
push map__indexof.this
pushc vtable__objects
swp
pushai
peek global.this
pushc vtable__indexof
swp
pushai
word generator.const.gcn.88 1
pushcp generator.const.gcn.88
push global.arg_counter
mov
jc
jr
jr
map__indexof__end:
pushcp map__keyindexof__end
jp
map__keyindexof:
@map__keyindexof.this
@map__keyindexof.key
peek map__keyindexof.key
pop
push global.this
peek map__keyindexof.this
pop
push map__keyindexof.key
push map__keyindexof.this
pushc vtable__keys
swp
pushai
peek global.this
pushc vtable__find
swp
pushai
word generator.const.gcn.89 1
pushcp generator.const.gcn.89
push global.arg_counter
mov
jc
jr
jr
map__keyindexof__end:
pushcp map__size__end
jp
map__size:
@map__size.this
push global.this
peek map__size.this
pop
push map__size.this
pushc vtable__keys
swp
pushai
peek global.this
pushc vtable__size
swp
pushai
pushc copy
word generator.const.gcn.90 1
pushcp generator.const.gcn.90
push global.arg_counter
mov
jc
jr
jr
map__size__end:
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
pushcp generator.if.gcn.91.else
push system_op_range.isback
jz
pop
word generator.const.gcn.92 1
pushc generator.const.gcn.92
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
pushcp generator.if.gcn.91.end
jp
generator.if.gcn.91.else:
word generator.const.gcn.93 1
pushc generator.const.gcn.93
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
generator.if.gcn.91.end:
push system_op_range.l
word generator.const.gcn.94 1
pushcp generator.const.gcn.94
newa
peek system_op_range.res
pop
word generator.const.gcn.95 0
pushc generator.const.gcn.95
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.96 1
pushcp generator.const.gcn.96
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.97.start:
pushcp generator.while.gcn.97.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.98 1
pushcp generator.const.gcn.98
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
pushcp generator.if.gcn.99.else
push system_op_range.isback
jz
pop
word generator.const.gcn.100 1
pushc generator.const.gcn.100
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.99.end
jp
generator.if.gcn.99.else:
word generator.const.gcn.101 1
pushc generator.const.gcn.101
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.99.end:
pushcp generator.while.gcn.97.start
jp
generator.while.gcn.97.end:
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
@generator.for_each.gcn.102.array
@generator.for_each.gcn.102.i
@generator.for_each.gcn.102.to
push system_op_in.right
peek generator.for_each.gcn.102.array
alen
peek generator.for_each.gcn.102.to
pop
pushc global.zero
peek generator.for_each.gcn.102.i
pop
generator.for_each.gcn.102.start:
pushcp generator.for_each.gcn.102.end
push generator.for_each.gcn.102.i
push generator.for_each.gcn.102.to
eq
not
jz
pop
push generator.for_each.gcn.102.i
push generator.for_each.gcn.102.array
pushai
@system_op_in.x
peek system_op_in.x
pop
pushcp generator.if.gcn.103.else
push system_op_in.left
push system_op_in.x
eq
jz
pop
pushc true
jr
generator.if.gcn.103.else:
generator.for_each.gcn.102.continue:
push generator.for_each.gcn.102.i
inc
pop
pushcp generator.for_each.gcn.102.start
jp
generator.for_each.gcn.102.end:
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
word generator.const.gcn.104 0
pushc generator.const.gcn.104
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.105 1
pushcp generator.const.gcn.105
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.106.start:
pushcp generator.while.gcn.106.end
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
pushcp generator.while.gcn.106.start
jp
generator.while.gcn.106.end:
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
word generator.const.gcn.107 1
pushcp generator.const.gcn.107
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.108 1
pushcp generator.const.gcn.108
newa
peek system_copy_array.r
pop
word generator.const.gcn.109 0
pushc generator.const.gcn.109
peek system_copy_array.i
pop
generator.while.gcn.110.start:
pushcp generator.while.gcn.110.end
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
word generator.const.gcn.111 1
pushcp generator.const.gcn.111
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
pushcp generator.while.gcn.110.start
jp
generator.while.gcn.110.end:
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
pushcp generator.if.gcn.112.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.113 1
pushcp generator.const.gcn.113
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.114 1
pushcp generator.const.gcn.114
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.112.end
jp
generator.if.gcn.112.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.115 1
pushcp generator.const.gcn.115
push global.arg_counter
mov
jc
jr
generator.if.gcn.112.end:
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
word generator.const.gcn.116 0
pushcp generator.const.gcn.116
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
pushcp generator.if.gcn.117.else
word generator.const.gcn.118 0
pushc generator.const.gcn.118
push max.args
pushc len
word generator.const.gcn.119 1
pushcp generator.const.gcn.119
push global.arg_counter
mov
jc
bg
jz
pop
push max.args
word generator.const.gcn.120 0
pushc generator.const.gcn.120
swp
pushai
peek max.r
pop
@generator.for_each.gcn.121.array
@generator.for_each.gcn.121.i
@generator.for_each.gcn.121.to
push max.args
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
@max.x
peek max.x
pop
pushcp generator.if.gcn.122.else
push max.r
push max.x
bg
jz
pop
push max.x
push max.r
mov
generator.if.gcn.122.else:
generator.for_each.gcn.121.continue:
push generator.for_each.gcn.121.i
inc
pop
pushcp generator.for_each.gcn.121.start
jp
generator.for_each.gcn.121.end:
push max.r
jr
pushcp generator.if.gcn.117.end
jp
generator.if.gcn.117.else:
push null
jr
generator.if.gcn.117.end:
jr
max__end:
pushcp min__end
jp
min:
@min.this
@min.args
@min.r
word generator.const.gcn.123 0
pushcp generator.const.gcn.123
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
pushcp generator.if.gcn.124.else
word generator.const.gcn.125 0
pushc generator.const.gcn.125
push min.args
pushc len
word generator.const.gcn.126 1
pushcp generator.const.gcn.126
push global.arg_counter
mov
jc
bg
jz
pop
push min.args
word generator.const.gcn.127 0
pushc generator.const.gcn.127
swp
pushai
peek min.r
pop
@generator.for_each.gcn.128.array
@generator.for_each.gcn.128.i
@generator.for_each.gcn.128.to
push min.args
peek generator.for_each.gcn.128.array
alen
peek generator.for_each.gcn.128.to
pop
pushc global.zero
peek generator.for_each.gcn.128.i
pop
generator.for_each.gcn.128.start:
pushcp generator.for_each.gcn.128.end
push generator.for_each.gcn.128.i
push generator.for_each.gcn.128.to
eq
not
jz
pop
push generator.for_each.gcn.128.i
push generator.for_each.gcn.128.array
pushai
@min.x
peek min.x
pop
pushcp generator.if.gcn.129.else
push min.r
push min.x
swp
bg
jz
pop
push min.x
push min.r
mov
generator.if.gcn.129.else:
generator.for_each.gcn.128.continue:
push generator.for_each.gcn.128.i
inc
pop
pushcp generator.for_each.gcn.128.start
jp
generator.for_each.gcn.128.end:
push min.r
jr
pushcp generator.if.gcn.124.end
jp
generator.if.gcn.124.else:
push null
jr
generator.if.gcn.124.end:
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
word generator.const.gcn.130 0
pushcp generator.const.gcn.130
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.131 ""
pushc generator.const.gcn.131
peek chr.r
pop
@generator.for_each.gcn.132.array
@generator.for_each.gcn.132.i
@generator.for_each.gcn.132.to
push chr.chars
peek generator.for_each.gcn.132.array
alen
peek generator.for_each.gcn.132.to
pop
pushc global.zero
peek generator.for_each.gcn.132.i
pop
generator.for_each.gcn.132.start:
pushcp generator.for_each.gcn.132.end
push generator.for_each.gcn.132.i
push generator.for_each.gcn.132.to
eq
not
jz
pop
push generator.for_each.gcn.132.i
push generator.for_each.gcn.132.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.133 1
pushcp generator.const.gcn.133
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.132.continue:
push generator.for_each.gcn.132.i
inc
pop
pushcp generator.for_each.gcn.132.start
jp
generator.for_each.gcn.132.end:
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
word generator.const.gcn.134 0
pushc generator.const.gcn.134
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.135 1
pushcp generator.const.gcn.135
newa
peek params
pop
word generator.const.gcn.136 0
pushc generator.const.gcn.136
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.137.start:
pushcp generator.while.gcn.137.end
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
pushcp generator.while.gcn.137.start
jp
generator.while.gcn.137.end:
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
pushcp generator.if.gcn.138.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.138.end
jp
generator.if.gcn.138.else:
pushcp __allocator__exception
jc
peek system_makeexception.e
pop
push system_makeexception.classname
push system_makeexception.e
peek global.this
pushc vtable__classname
swp
peekai
push system_makeexception.message
push system_makeexception.e
peek global.this
pushc vtable__message
swp
peekai
push system_makeexception.e
jr
generator.if.gcn.138.end:
jr
system_makeexception__end:
pushcp list__create__end
jp
list__create:
@list__create.this
push global.this
peek list__create.this
pop
word generator.const.gcn.140 0
pushc generator.const.gcn.140
word generator.const.gcn.139 1
pushcp generator.const.gcn.139
newa
push list__create.this
peek global.this
pushc vtable__items
swp
peekai
word generator.const.gcn.141 0
pushc generator.const.gcn.141
push list__create.this
peek global.this
pushc vtable__size
swp
peekai
jr
list__create__end:
pushcp list__add__end
jp
list__add:
@list__add.this
@list__add.obj
peek list__add.obj
pop
push global.this
peek list__add.this
pop
word generator.const.gcn.143 1
pushc generator.const.gcn.143
push list__add.this
peek global.this
pushc vtable__size
swp
pushai
copy
swp
pop
add
push list__add.this
peek global.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.142 2
pushcp generator.const.gcn.142
push global.arg_counter
mov
jc
push list__add.obj
push list__add.this
peek global.this
pushc vtable__items
swp
pushai
push list__add.this
peek global.this
pushc vtable__size
swp
pushai
swp
peekai
push list__add.this
peek global.this
pushc vtable__size
swp
pushai
inc
pop
jr
list__add__end:
pushcp list__insert__end
jp
list__insert:
@list__insert.this
@list__insert.obj
@list__insert.index
@list__insert.i
peek list__insert.obj
pop
peek list__insert.index
pop
push global.this
peek list__insert.this
pop
pushcp generator.if.gcn.144.else
word generator.const.gcn.145 0
pushc generator.const.gcn.145
push list__insert.index
swp
bg
push list__insert.index
push list__insert.this
peek global.this
pushc vtable__size
swp
pushai
swp
bg
copy
swp
pop
or
jz
pop
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.147 ") out of bounds."
pushc generator.const.gcn.147
push list__insert.index
str generator.const.gcn.148 "List index ("
pushc generator.const.gcn.148
copy
swp
pop
add
copy
swp
pop
add
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.146 1
pushcp generator.const.gcn.146
push global.arg_counter
mov
jc
pushc global.raised
trr
pushcp generator.if.gcn.144.end
jp
generator.if.gcn.144.else:
push list__insert.this
peek global.this
pushc vtable__size
swp
pushai
inc
pop
push list__insert.this
peek global.this
pushc vtable__size
swp
pushai
push list__insert.this
peek global.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.149 2
pushcp generator.const.gcn.149
push global.arg_counter
mov
jc
word generator.const.gcn.150 1
pushc generator.const.gcn.150
push list__insert.this
peek global.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
peek list__insert.i
pop
generator.while.gcn.151.start:
pushcp generator.while.gcn.151.end
push list__insert.index
push list__insert.i
bg
jz
pop
push list__insert.this
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.152 1
pushc generator.const.gcn.152
push list__insert.i
copy
swp
pop
sub
swp
pushai
push list__insert.this
peek global.this
pushc vtable__items
swp
pushai
push list__insert.i
swp
peekai
push list__insert.i
dec
pop
pushcp generator.while.gcn.151.start
jp
generator.while.gcn.151.end:
push list__insert.obj
push list__insert.this
peek global.this
pushc vtable__items
swp
pushai
push list__insert.index
swp
peekai
generator.if.gcn.144.end:
jr
list__insert__end:
pushcp list__delete__end
jp
list__delete:
@list__delete.this
@list__delete.index
peek list__delete.index
pop
push global.this
peek list__delete.this
pop
pushcp generator.if.gcn.153.else
word generator.const.gcn.154 0
pushc generator.const.gcn.154
push list__delete.index
swp
bg
push list__delete.index
push list__delete.this
peek global.this
pushc vtable__size
swp
pushai
swp
bg
copy
swp
pop
or
jz
pop
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.156 ") out of bounds."
pushc generator.const.gcn.156
push list__delete.index
str generator.const.gcn.157 "List index ("
pushc generator.const.gcn.157
copy
swp
pop
add
copy
swp
pop
add
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.155 1
pushcp generator.const.gcn.155
push global.arg_counter
mov
jc
pushc global.raised
trr
pushcp generator.if.gcn.153.end
jp
generator.if.gcn.153.else:
push list__delete.this
peek global.this
pushc vtable__size
swp
pushai
dec
pop
generator.while.gcn.158.start:
pushcp generator.while.gcn.158.end
push list__delete.this
peek global.this
pushc vtable__size
swp
pushai
push list__delete.index
swp
bg
jz
pop
push list__delete.this
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.159 1
pushc generator.const.gcn.159
push list__delete.index
copy
swp
pop
add
swp
pushai
push list__delete.this
peek global.this
pushc vtable__items
swp
pushai
push list__delete.index
swp
peekai
push list__delete.index
inc
pop
pushcp generator.while.gcn.158.start
jp
generator.while.gcn.158.end:
push list__delete.this
peek global.this
pushc vtable__size
swp
pushai
push list__delete.this
peek global.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.160 2
pushcp generator.const.gcn.160
push global.arg_counter
mov
jc
generator.if.gcn.153.end:
jr
list__delete__end:
pushcp list__clear__end
jp
list__clear:
@list__clear.this
push global.this
peek list__clear.this
pop
word generator.const.gcn.162 0
pushc generator.const.gcn.162
push list__clear.this
peek global.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.161 2
pushcp generator.const.gcn.161
push global.arg_counter
mov
jc
word generator.const.gcn.163 0
pushc generator.const.gcn.163
push list__clear.this
peek global.this
pushc vtable__size
swp
pushai
mov
jr
list__clear__end:
pushcp list__get__end
jp
list__get:
@list__get.this
@list__get.index
peek list__get.index
pop
push global.this
peek list__get.this
pop
push list__get.this
peek global.this
pushc vtable__items
swp
pushai
push list__get.index
swp
pushai
jr
jr
list__get__end:
pushcp list__indexof__end
jp
list__indexof:
@list__indexof.this
@list__indexof.obj
@list__indexof.i
peek list__indexof.obj
pop
push global.this
peek list__indexof.this
pop
pushcp generator.if.gcn.164.else
word generator.const.gcn.165 2
pushcp generator.const.gcn.165
word generator.const.gcn.166 1
pushcp generator.const.gcn.166
newa
pcopy
pushc typearray
swp
word generator.const.gcn.167 0
pushcp generator.const.gcn.167
swp
peekai
pcopy
pushc typeclass
swp
word generator.const.gcn.168 1
pushcp generator.const.gcn.168
swp
peekai
push list__indexof.obj
pushc typeof
word generator.const.gcn.169 1
pushcp generator.const.gcn.169
push global.arg_counter
mov
jc
pushcp system_op_in
jc
jz
pop
word generator.const.gcn.170 0
pushc generator.const.gcn.170
peek list__indexof.i
pop
generator.while.gcn.171.start:
pushcp generator.while.gcn.171.end
push list__indexof.this
peek global.this
pushc vtable__size
swp
pushai
push list__indexof.i
swp
bg
jz
pop
pushcp generator.if.gcn.172.else
push list__indexof.this
peek global.this
pushc vtable__items
swp
pushai
push list__indexof.i
swp
pushai
new
peek global.temp
movp
push global.temp
push list__indexof.obj
new
peek global.temp
movp
push global.temp
eq
jz
pop
push list__indexof.i
jr
generator.if.gcn.172.else:
push list__indexof.i
inc
pop
pushcp generator.while.gcn.171.start
jp
generator.while.gcn.171.end:
pushcp generator.if.gcn.164.end
jp
generator.if.gcn.164.else:
word generator.const.gcn.173 0
pushc generator.const.gcn.173
peek list__indexof.i
pop
generator.while.gcn.174.start:
pushcp generator.while.gcn.174.end
push list__indexof.this
peek global.this
pushc vtable__size
swp
pushai
push list__indexof.i
swp
bg
jz
pop
pushcp generator.if.gcn.175.else
push list__indexof.this
peek global.this
pushc vtable__items
swp
pushai
push list__indexof.i
swp
pushai
push list__indexof.obj
eq
jz
pop
push list__indexof.i
jr
generator.if.gcn.175.else:
push list__indexof.i
inc
pop
pushcp generator.while.gcn.174.start
jp
generator.while.gcn.174.end:
generator.if.gcn.164.end:
push null
jr
jr
list__indexof__end:
pushcp list__count__end
jp
list__count:
@list__count.this
push global.this
peek list__count.this
pop
push list__count.this
peek global.this
pushc vtable__size
swp
pushai
pushc copy
word generator.const.gcn.176 1
pushcp generator.const.gcn.176
push global.arg_counter
mov
jc
jr
jr
list__count__end:
pushcp list__sort__end
jp
list__sort:
@list__sort.this
push global.this
peek list__sort.this
pop
push list__sort.this
peek global.this
pushc vtable__items
swp
pushai
pushc quicksort
word generator.const.gcn.177 1
pushcp generator.const.gcn.177
push global.arg_counter
mov
jc
jr
list__sort__end:
pushcp list__find__end
jp
list__find:
@list__find.this
@list__find.obj
peek list__find.obj
pop
push global.this
peek list__find.this
pop
push list__find.obj
push list__find.this
peek global.this
pushc vtable__items
swp
pushai
pushc binsearch
word generator.const.gcn.178 2
pushcp generator.const.gcn.178
push global.arg_counter
mov
jc
jr
jr
list__find__end:
pushcp list__nextins__end
jp
list__nextins:
@list__nextins.this
@list__nextins.obj
@list__nextins.indx
peek list__nextins.obj
pop
push global.this
peek list__nextins.this
pop
push list__nextins.obj
push list__nextins.this
peek global.this
pushc vtable__items
swp
pushai
pushc binnext
word generator.const.gcn.179 2
pushcp generator.const.gcn.179
push global.arg_counter
mov
jc
peek list__nextins.indx
pop
push list__nextins.indx
push list__nextins.obj
push list__nextins.this
peek global.this
pushc vtable__insert
swp
pushai
word generator.const.gcn.180 2
pushcp generator.const.gcn.180
push global.arg_counter
mov
jc
push list__nextins.indx
jr
jr
list__nextins__end:
pushcp threadlist__create__end
jp
threadlist__create:
@threadlist__create.this
push global.this
peek threadlist__create.this
pop
push threadlist__create.this
peek global.this
pop
pushcp list__create
word generator.const.gcn.181 0
pushcp generator.const.gcn.181
push global.arg_counter
mov
jc
pushcp __allocator__criticalsection
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.182 0
pushcp generator.const.gcn.182
push global.arg_counter
mov
jc
push threadlist__create.this
peek global.this
pushc vtable__locker
swp
peekai
jr
threadlist__create__end:
pushcp threadlist__add__end
jp
threadlist__add:
@threadlist__add.this
@threadlist__add.obj
peek threadlist__add.obj
pop
push global.this
peek threadlist__add.this
pop
push threadlist__add.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.183 0
pushcp generator.const.gcn.183
push global.arg_counter
mov
jc
push threadlist__add.obj
push threadlist__add.this
peek global.this
pop
pushcp list__add
word generator.const.gcn.184 1
pushcp generator.const.gcn.184
push global.arg_counter
mov
jc
push threadlist__add.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.185 0
pushcp generator.const.gcn.185
push global.arg_counter
mov
jc
jr
threadlist__add__end:
pushcp threadlist__insert__end
jp
threadlist__insert:
@threadlist__insert.this
@threadlist__insert.obj
@threadlist__insert.index
peek threadlist__insert.obj
pop
peek threadlist__insert.index
pop
push global.this
peek threadlist__insert.this
pop
push threadlist__insert.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.186 0
pushcp generator.const.gcn.186
push global.arg_counter
mov
jc
push threadlist__insert.index
push threadlist__insert.obj
push threadlist__insert.this
peek global.this
pop
pushcp list__insert
word generator.const.gcn.187 2
pushcp generator.const.gcn.187
push global.arg_counter
mov
jc
push threadlist__insert.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.188 0
pushcp generator.const.gcn.188
push global.arg_counter
mov
jc
jr
threadlist__insert__end:
pushcp threadlist__delete__end
jp
threadlist__delete:
@threadlist__delete.this
@threadlist__delete.index
peek threadlist__delete.index
pop
push global.this
peek threadlist__delete.this
pop
push threadlist__delete.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.189 0
pushcp generator.const.gcn.189
push global.arg_counter
mov
jc
push threadlist__delete.index
push threadlist__delete.this
peek global.this
pop
pushcp list__delete
word generator.const.gcn.190 1
pushcp generator.const.gcn.190
push global.arg_counter
mov
jc
push threadlist__delete.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.191 0
pushcp generator.const.gcn.191
push global.arg_counter
mov
jc
jr
threadlist__delete__end:
pushcp threadlist__clear__end
jp
threadlist__clear:
@threadlist__clear.this
push global.this
peek threadlist__clear.this
pop
push threadlist__clear.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.192 0
pushcp generator.const.gcn.192
push global.arg_counter
mov
jc
push threadlist__clear.this
peek global.this
pop
pushcp list__clear
word generator.const.gcn.193 0
pushcp generator.const.gcn.193
push global.arg_counter
mov
jc
push threadlist__clear.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.194 0
pushcp generator.const.gcn.194
push global.arg_counter
mov
jc
jr
threadlist__clear__end:
pushcp threadlist__get__end
jp
threadlist__get:
@threadlist__get.this
@threadlist__get.index
@threadlist__get.r
peek threadlist__get.index
pop
push global.this
peek threadlist__get.this
pop
push threadlist__get.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.195 0
pushcp generator.const.gcn.195
push global.arg_counter
mov
jc
push threadlist__get.index
push threadlist__get.this
peek global.this
pop
pushcp list__get
word generator.const.gcn.196 1
pushcp generator.const.gcn.196
push global.arg_counter
mov
jc
peek threadlist__get.r
pop
push threadlist__get.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.197 0
pushcp generator.const.gcn.197
push global.arg_counter
mov
jc
push threadlist__get.r
jr
jr
threadlist__get__end:
pushcp threadlist__indexof__end
jp
threadlist__indexof:
@threadlist__indexof.this
@threadlist__indexof.obj
@threadlist__indexof.r
peek threadlist__indexof.obj
pop
push global.this
peek threadlist__indexof.this
pop
push threadlist__indexof.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.198 0
pushcp generator.const.gcn.198
push global.arg_counter
mov
jc
push threadlist__indexof.obj
push threadlist__indexof.this
peek global.this
pop
pushcp list__indexof
word generator.const.gcn.199 1
pushcp generator.const.gcn.199
push global.arg_counter
mov
jc
peek threadlist__indexof.r
pop
push threadlist__indexof.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.200 0
pushcp generator.const.gcn.200
push global.arg_counter
mov
jc
push threadlist__indexof.r
jr
jr
threadlist__indexof__end:
pushcp threadlist__sort__end
jp
threadlist__sort:
@threadlist__sort.this
push global.this
peek threadlist__sort.this
pop
push threadlist__sort.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.201 0
pushcp generator.const.gcn.201
push global.arg_counter
mov
jc
push threadlist__sort.this
peek global.this
pop
pushcp list__sort
word generator.const.gcn.202 0
pushcp generator.const.gcn.202
push global.arg_counter
mov
jc
push threadlist__sort.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.203 0
pushcp generator.const.gcn.203
push global.arg_counter
mov
jc
jr
threadlist__sort__end:
pushcp threadlist__nextins__end
jp
threadlist__nextins:
@threadlist__nextins.this
@threadlist__nextins.obj
@threadlist__nextins.r
peek threadlist__nextins.obj
pop
push global.this
peek threadlist__nextins.this
pop
push threadlist__nextins.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.204 0
pushcp generator.const.gcn.204
push global.arg_counter
mov
jc
push threadlist__nextins.obj
push threadlist__nextins.this
peek global.this
pop
pushcp list__nextins
word generator.const.gcn.205 1
pushcp generator.const.gcn.205
push global.arg_counter
mov
jc
peek threadlist__nextins.r
pop
push threadlist__nextins.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.206 0
pushcp generator.const.gcn.206
push global.arg_counter
mov
jc
push threadlist__nextins.r
jr
jr
threadlist__nextins__end:
pushcp threadlist__find__end
jp
threadlist__find:
@threadlist__find.this
@threadlist__find.obj
@threadlist__find.r
peek threadlist__find.obj
pop
push global.this
peek threadlist__find.this
pop
push threadlist__find.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.207 0
pushcp generator.const.gcn.207
push global.arg_counter
mov
jc
push threadlist__find.obj
push threadlist__find.this
peek global.this
pop
pushcp list__find
word generator.const.gcn.208 1
pushcp generator.const.gcn.208
push global.arg_counter
mov
jc
peek threadlist__find.r
pop
push threadlist__find.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.209 0
pushcp generator.const.gcn.209
push global.arg_counter
mov
jc
push threadlist__find.r
jr
jr
threadlist__find__end:
pushcp threadlist__lock__end
jp
threadlist__lock:
@threadlist__lock.this
@threadlist__lock.r
push global.this
peek threadlist__lock.this
pop
push threadlist__lock.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.210 0
pushcp generator.const.gcn.210
push global.arg_counter
mov
jc
pushcp __allocator__list
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.211 0
pushcp generator.const.gcn.211
push global.arg_counter
mov
jc
peek threadlist__lock.r
pop
push threadlist__lock.this
peek global.this
pushc vtable__items
swp
pushai
push threadlist__lock.r
peek global.this
pushc vtable__items
swp
peekai
jr
threadlist__lock__end:
pushcp threadlist__unlock__end
jp
threadlist__unlock:
@threadlist__unlock.this
push global.this
peek threadlist__unlock.this
pop
push threadlist__unlock.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.212 0
pushcp generator.const.gcn.212
push global.arg_counter
mov
jc
jr
threadlist__unlock__end:
pushcp reversearray__end
jp
reversearray:
@reversearray.this
@reversearray.arr
@reversearray.l
@reversearray.i
@reversearray._
peek reversearray.arr
pop
push reversearray.arr
pushc len
word generator.const.gcn.213 1
pushcp generator.const.gcn.213
push global.arg_counter
mov
jc
peek reversearray.l
pop
word generator.const.gcn.214 0
pushc generator.const.gcn.214
peek reversearray.i
pop
generator.while.gcn.215.start:
pushcp generator.while.gcn.215.end
word generator.const.gcn.216 2
pushc generator.const.gcn.216
push reversearray.l
copy
swp
pop
idiv
push reversearray.i
swp
bg
jz
pop
push reversearray.arr
word generator.const.gcn.217 1
pushc generator.const.gcn.217
push reversearray.i
push reversearray.l
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
peek reversearray._
pop
push reversearray.arr
push reversearray.i
swp
pushai
push reversearray.arr
word generator.const.gcn.218 1
pushc generator.const.gcn.218
push reversearray.i
push reversearray.l
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
push reversearray._
push reversearray.arr
push reversearray.i
swp
peekai
push reversearray.i
inc
pop
pushcp generator.while.gcn.215.start
jp
generator.while.gcn.215.end:
jr
reversearray__end:
pushcp getmax__end
jp
getmax:
@getmax.this
@getmax.arr
@getmax.n
@getmax.mx
@getmax.i
peek getmax.arr
pop
peek getmax.n
pop
push getmax.arr
word generator.const.gcn.219 0
pushc generator.const.gcn.219
swp
pushai
peek getmax.mx
pop
word generator.const.gcn.220 1
pushc generator.const.gcn.220
peek getmax.i
pop
generator.while.gcn.221.start:
pushcp generator.while.gcn.221.end
push getmax.n
push getmax.i
swp
bg
jz
pop
pushcp generator.if.gcn.222.else
push getmax.mx
push getmax.arr
push getmax.i
swp
pushai
bg
jz
pop
push getmax.arr
push getmax.i
swp
pushai
push getmax.mx
mov
generator.if.gcn.222.else:
push getmax.i
inc
pop
pushcp generator.while.gcn.221.start
jp
generator.while.gcn.221.end:
push getmax.mx
jr
jr
getmax__end:
pushcp getmin__end
jp
getmin:
@getmin.this
@getmin.arr
@getmin.n
@getmin.mn
@getmin.i
peek getmin.arr
pop
peek getmin.n
pop
push getmin.arr
word generator.const.gcn.223 0
pushc generator.const.gcn.223
swp
pushai
peek getmin.mn
pop
word generator.const.gcn.224 1
pushc generator.const.gcn.224
peek getmin.i
pop
generator.while.gcn.225.start:
pushcp generator.while.gcn.225.end
push getmin.n
push getmin.i
swp
bg
jz
pop
pushcp generator.if.gcn.226.else
push getmin.mn
push getmin.arr
push getmin.i
swp
pushai
swp
bg
jz
pop
push getmin.arr
push getmin.i
swp
pushai
push getmin.mn
mov
generator.if.gcn.226.else:
push getmin.i
inc
pop
pushcp generator.while.gcn.225.start
jp
generator.while.gcn.225.end:
push getmin.mn
jr
jr
getmin__end:
pushcp partition__end
jp
partition:
@partition.this
@partition.arr
@partition.low
@partition.high
@partition.i
@partition.pivot
@partition._
peek partition.arr
pop
peek partition.low
pop
peek partition.high
pop
word generator.const.gcn.227 1
pushc generator.const.gcn.227
push partition.low
copy
swp
pop
sub
peek partition.i
pop
push partition.arr
push partition.high
swp
pushai
peek partition.pivot
pop
@generator.for_each.gcn.228.array
@generator.for_each.gcn.228.i
@generator.for_each.gcn.228.to
push partition.high
push partition.low
pushcp system_op_range
jc
peek generator.for_each.gcn.228.array
alen
peek generator.for_each.gcn.228.to
pop
pushc global.zero
peek generator.for_each.gcn.228.i
pop
generator.for_each.gcn.228.start:
pushcp generator.for_each.gcn.228.end
push generator.for_each.gcn.228.i
push generator.for_each.gcn.228.to
eq
not
jz
pop
push generator.for_each.gcn.228.i
push generator.for_each.gcn.228.array
pushai
@partition.j
peek partition.j
pop
pushcp generator.if.gcn.229.else
push partition.pivot
push partition.arr
push partition.j
swp
pushai
swp
bg
jz
pop
push partition.i
inc
pop
push partition.arr
push partition.i
swp
pushai
peek partition._
pop
push partition.arr
push partition.j
swp
pushai
push partition.arr
push partition.i
swp
peekai
push partition._
push partition.arr
push partition.j
swp
peekai
generator.if.gcn.229.else:
generator.for_each.gcn.228.continue:
push generator.for_each.gcn.228.i
inc
pop
pushcp generator.for_each.gcn.228.start
jp
generator.for_each.gcn.228.end:
push partition.arr
word generator.const.gcn.230 1
pushc generator.const.gcn.230
push partition.i
copy
swp
pop
add
swp
pushai
peek partition._
pop
push partition.arr
push partition.high
swp
pushai
push partition.arr
word generator.const.gcn.231 1
pushc generator.const.gcn.231
push partition.i
copy
swp
pop
add
swp
peekai
push partition._
push partition.arr
push partition.high
swp
peekai
word generator.const.gcn.232 1
pushc generator.const.gcn.232
push partition.i
copy
swp
pop
add
jr
jr
partition__end:
pushcp fromtoqsort__end
jp
fromtoqsort:
@fromtoqsort.this
@fromtoqsort.arr
@fromtoqsort.low
@fromtoqsort.high
@fromtoqsort.pi
peek fromtoqsort.arr
pop
peek fromtoqsort.low
pop
peek fromtoqsort.high
pop
pushcp generator.if.gcn.233.else
push fromtoqsort.high
push fromtoqsort.low
swp
bg
jz
pop
push fromtoqsort.high
push fromtoqsort.low
push fromtoqsort.arr
pushc partition
word generator.const.gcn.234 3
pushcp generator.const.gcn.234
push global.arg_counter
mov
jc
peek fromtoqsort.pi
pop
push fromtoqsort.this
rst
push fromtoqsort.arr
rst
push fromtoqsort.low
rst
push fromtoqsort.high
rst
push fromtoqsort.pi
rst
word generator.const.gcn.236 1
pushc generator.const.gcn.236
push fromtoqsort.pi
copy
swp
pop
sub
push fromtoqsort.low
push fromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.235 3
pushcp generator.const.gcn.235
push global.arg_counter
mov
jc
rld
peek fromtoqsort.pi
pop
rld
peek fromtoqsort.high
pop
rld
peek fromtoqsort.low
pop
rld
peek fromtoqsort.arr
pop
rld
peek fromtoqsort.this
pop
push fromtoqsort.this
rst
push fromtoqsort.arr
rst
push fromtoqsort.low
rst
push fromtoqsort.high
rst
push fromtoqsort.pi
rst
push fromtoqsort.high
word generator.const.gcn.238 1
pushc generator.const.gcn.238
push fromtoqsort.pi
copy
swp
pop
add
push fromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.237 3
pushcp generator.const.gcn.237
push global.arg_counter
mov
jc
rld
peek fromtoqsort.pi
pop
rld
peek fromtoqsort.high
pop
rld
peek fromtoqsort.low
pop
rld
peek fromtoqsort.arr
pop
rld
peek fromtoqsort.this
pop
generator.if.gcn.233.else:
jr
fromtoqsort__end:
pushcp quicksort__end
jp
quicksort:
@quicksort.this
@quicksort.arr
peek quicksort.arr
pop
word generator.const.gcn.240 1
pushc generator.const.gcn.240
push quicksort.arr
pushc len
word generator.const.gcn.241 1
pushcp generator.const.gcn.241
push global.arg_counter
mov
jc
copy
swp
pop
sub
word generator.const.gcn.242 0
pushc generator.const.gcn.242
push quicksort.arr
pushc fromtoqsort
word generator.const.gcn.239 3
pushcp generator.const.gcn.239
push global.arg_counter
mov
jc
jr
quicksort__end:
pushcp fromtobinsearch__end
jp
fromtobinsearch:
@fromtobinsearch.this
@fromtobinsearch.arr
@fromtobinsearch.left
@fromtobinsearch.right
@fromtobinsearch.key
@fromtobinsearch.midd
peek fromtobinsearch.arr
pop
peek fromtobinsearch.left
pop
peek fromtobinsearch.right
pop
peek fromtobinsearch.key
pop
generator.while.gcn.243.start:
pushcp generator.while.gcn.243.end
pushc true
jz
pop
word generator.const.gcn.244 2
pushc generator.const.gcn.244
push fromtobinsearch.right
push fromtobinsearch.left
copy
swp
pop
add
copy
swp
pop
idiv
peek fromtobinsearch.midd
pop
pushcp generator.if.gcn.245.else
push fromtobinsearch.arr
push fromtobinsearch.midd
swp
pushai
push fromtobinsearch.key
swp
bg
jz
pop
word generator.const.gcn.246 1
pushc generator.const.gcn.246
push fromtobinsearch.midd
copy
swp
pop
sub
peek fromtobinsearch.right
pop
pushcp generator.if.gcn.245.end
jp
generator.if.gcn.245.else:
pushcp generator.if.gcn.247.else
push fromtobinsearch.arr
push fromtobinsearch.midd
swp
pushai
push fromtobinsearch.key
bg
jz
pop
word generator.const.gcn.248 1
pushc generator.const.gcn.248
push fromtobinsearch.midd
copy
swp
pop
add
peek fromtobinsearch.left
pop
pushcp generator.if.gcn.247.end
jp
generator.if.gcn.247.else:
push fromtobinsearch.midd
jr
generator.if.gcn.247.end:
generator.if.gcn.245.end:
pushcp generator.if.gcn.249.else
push fromtobinsearch.right
push fromtobinsearch.left
bg
jz
pop
push null
jr
generator.if.gcn.249.else:
pushcp generator.while.gcn.243.start
jp
generator.while.gcn.243.end:
jr
fromtobinsearch__end:
pushcp binsearch__end
jp
binsearch:
@binsearch.this
@binsearch.arr
@binsearch.key
@binsearch.l
peek binsearch.arr
pop
peek binsearch.key
pop
push binsearch.arr
pushc len
word generator.const.gcn.250 1
pushcp generator.const.gcn.250
push global.arg_counter
mov
jc
peek binsearch.l
pop
pushcp generator.if.gcn.251.else
word generator.const.gcn.252 0
pushc generator.const.gcn.252
push binsearch.l
bg
jz
pop
push binsearch.key
word generator.const.gcn.254 1
pushc generator.const.gcn.254
push binsearch.l
copy
swp
pop
sub
word generator.const.gcn.255 0
pushc generator.const.gcn.255
push binsearch.arr
pushc fromtobinsearch
word generator.const.gcn.253 4
pushcp generator.const.gcn.253
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.251.end
jp
generator.if.gcn.251.else:
push null
jr
generator.if.gcn.251.end:
jr
binsearch__end:
pushcp fromtobinnext__end
jp
fromtobinnext:
@fromtobinnext.this
@fromtobinnext.arr
@fromtobinnext.left
@fromtobinnext.right
@fromtobinnext.key
@fromtobinnext.midd
peek fromtobinnext.arr
pop
peek fromtobinnext.left
pop
peek fromtobinnext.right
pop
peek fromtobinnext.key
pop
generator.while.gcn.256.start:
pushcp generator.while.gcn.256.end
pushc true
jz
pop
word generator.const.gcn.257 2
pushc generator.const.gcn.257
push fromtobinnext.right
push fromtobinnext.left
copy
swp
pop
add
copy
swp
pop
idiv
peek fromtobinnext.midd
pop
pushcp generator.if.gcn.258.else
push fromtobinnext.arr
push fromtobinnext.midd
swp
pushai
push fromtobinnext.key
swp
bg
jz
pop
word generator.const.gcn.259 1
pushc generator.const.gcn.259
push fromtobinnext.midd
copy
swp
pop
sub
peek fromtobinnext.right
pop
pushcp generator.if.gcn.258.end
jp
generator.if.gcn.258.else:
pushcp generator.if.gcn.260.else
push fromtobinnext.arr
push fromtobinnext.midd
swp
pushai
push fromtobinnext.key
bg
jz
pop
word generator.const.gcn.261 1
pushc generator.const.gcn.261
push fromtobinnext.midd
copy
swp
pop
add
peek fromtobinnext.left
pop
pushcp generator.if.gcn.260.end
jp
generator.if.gcn.260.else:
push fromtobinnext.midd
jr
generator.if.gcn.260.end:
generator.if.gcn.258.end:
pushcp generator.if.gcn.262.else
push fromtobinnext.right
push fromtobinnext.left
bg
jz
pop
push fromtobinnext.midd
jr
generator.if.gcn.262.else:
pushcp generator.while.gcn.256.start
jp
generator.while.gcn.256.end:
jr
fromtobinnext__end:
pushcp binnext__end
jp
binnext:
@binnext.this
@binnext.arr
@binnext.key
@binnext.l
@binnext.r
peek binnext.arr
pop
peek binnext.key
pop
push binnext.arr
pushc len
word generator.const.gcn.263 1
pushcp generator.const.gcn.263
push global.arg_counter
mov
jc
peek binnext.l
pop
pushcp generator.if.gcn.264.else
word generator.const.gcn.265 0
pushc generator.const.gcn.265
push binnext.l
bg
jz
pop
push binnext.key
word generator.const.gcn.267 1
pushc generator.const.gcn.267
push binnext.l
copy
swp
pop
sub
word generator.const.gcn.268 0
pushc generator.const.gcn.268
push binnext.arr
pushc fromtobinnext
word generator.const.gcn.266 4
pushcp generator.const.gcn.266
push global.arg_counter
mov
jc
peek binnext.r
pop
pushcp generator.if.gcn.269.else
push binnext.key
push binnext.arr
push binnext.r
swp
pushai
bg
jz
pop
push binnext.r
jr
pushcp generator.if.gcn.269.end
jp
generator.if.gcn.269.else:
word generator.const.gcn.270 1
pushc generator.const.gcn.270
push binnext.r
copy
swp
pop
add
jr
generator.if.gcn.269.end:
pushcp generator.if.gcn.264.end
jp
generator.if.gcn.264.else:
word generator.const.gcn.271 0
pushc generator.const.gcn.271
jr
generator.if.gcn.264.end:
jr
binnext__end:
pushcp fromtointerpolarsearch__end
jp
fromtointerpolarsearch:
@fromtointerpolarsearch.this
@fromtointerpolarsearch.arr
@fromtointerpolarsearch.left
@fromtointerpolarsearch.right
@fromtointerpolarsearch.key
@fromtointerpolarsearch.pos
@fromtointerpolarsearch.found
peek fromtointerpolarsearch.arr
pop
peek fromtointerpolarsearch.left
pop
peek fromtointerpolarsearch.right
pop
peek fromtointerpolarsearch.key
pop
word generator.const.gcn.272 0
pushc generator.const.gcn.272
peek fromtointerpolarsearch.pos
pop
pushc false
peek fromtointerpolarsearch.found
pop
generator.while.gcn.273.start:
pushcp generator.while.gcn.273.end
push fromtointerpolarsearch.found
copy
swp
pop
not
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.right
swp
pushai
bg
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.left
swp
pushai
swp
bg
copy
swp
pop
and
copy
swp
pop
and
jz
pop
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.left
swp
pushai
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.right
swp
pushai
copy
swp
pop
sub
push fromtointerpolarsearch.left
push fromtointerpolarsearch.right
copy
swp
pop
sub
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.left
swp
pushai
push fromtointerpolarsearch.key
copy
swp
pop
sub
copy
swp
pop
mul
copy
swp
pop
div
push fromtointerpolarsearch.left
copy
swp
pop
add
push fromtointerpolarsearch.pos
mov
pushcp generator.if.gcn.274.else
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.pos
swp
pushai
swp
bg
jz
pop
word generator.const.gcn.275 1
pushc generator.const.gcn.275
push fromtointerpolarsearch.pos
copy
swp
pop
add
push fromtointerpolarsearch.left
mov
pushcp generator.if.gcn.274.end
jp
generator.if.gcn.274.else:
pushcp generator.if.gcn.276.else
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.pos
swp
pushai
bg
jz
pop
word generator.const.gcn.277 1
pushc generator.const.gcn.277
push fromtointerpolarsearch.pos
copy
swp
pop
sub
push fromtointerpolarsearch.right
mov
pushcp generator.if.gcn.276.end
jp
generator.if.gcn.276.else:
pushc true
push fromtointerpolarsearch.found
mov
generator.if.gcn.276.end:
generator.if.gcn.274.end:
pushcp generator.while.gcn.273.start
jp
generator.while.gcn.273.end:
pushcp generator.if.gcn.278.else
push fromtointerpolarsearch.found
jz
pop
push fromtointerpolarsearch.pos
jr
pushcp generator.if.gcn.278.end
jp
generator.if.gcn.278.else:
push null
jr
generator.if.gcn.278.end:
jr
fromtointerpolarsearch__end:
pushcp interpolarsearch__end
jp
interpolarsearch:
@interpolarsearch.this
@interpolarsearch.arr
@interpolarsearch.key
@interpolarsearch.l
peek interpolarsearch.arr
pop
peek interpolarsearch.key
pop
push interpolarsearch.arr
pushc len
word generator.const.gcn.279 1
pushcp generator.const.gcn.279
push global.arg_counter
mov
jc
peek interpolarsearch.l
pop
pushcp generator.if.gcn.280.else
word generator.const.gcn.281 0
pushc generator.const.gcn.281
push interpolarsearch.l
bg
jz
pop
push interpolarsearch.key
word generator.const.gcn.283 1
pushc generator.const.gcn.283
push interpolarsearch.l
copy
swp
pop
sub
word generator.const.gcn.284 0
pushc generator.const.gcn.284
push interpolarsearch.arr
pushc fromtointerpolarsearch
word generator.const.gcn.282 4
pushcp generator.const.gcn.282
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.280.end
jp
generator.if.gcn.280.else:
push null
jr
generator.if.gcn.280.end:
jr
interpolarsearch__end:
pushcp criticalsection__create__end
jp
criticalsection__create:
@criticalsection__create.this
push global.this
peek criticalsection__create.this
pop
pushc __critsect_create
invoke
push criticalsection__create.this
peek global.this
pushc vtable__critical_section
swp
peekai
jr
criticalsection__create__end:
pushcp criticalsection__enter__end
jp
criticalsection__enter:
@criticalsection__enter.this
push global.this
peek criticalsection__enter.this
pop
push criticalsection__enter.this
peek global.this
pushc vtable__critical_section
swp
pushai
pushc __critsect_enter
invoke
jr
criticalsection__enter__end:
pushcp criticalsection__leave__end
jp
criticalsection__leave:
@criticalsection__leave.this
push global.this
peek criticalsection__leave.this
pop
push criticalsection__leave.this
peek global.this
pushc vtable__critical_section
swp
pushai
pushc __critsect_leave
invoke
jr
criticalsection__leave__end:
pushcp criticalsection__tryenter__end
jp
criticalsection__tryenter:
@criticalsection__tryenter.this
push global.this
peek criticalsection__tryenter.this
pop
push criticalsection__tryenter.this
peek global.this
pushc vtable__critical_section
swp
pushai
pushc __critsect_tryenter
invoke
jr
jr
criticalsection__tryenter__end:
pushcp atomic__create__end
jp
atomic__create:
@atomic__create.this
@atomic__create.value
peek atomic__create.value
pop
push global.this
peek atomic__create.this
pop
pushcp __allocator__criticalsection
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.285 0
pushcp generator.const.gcn.285
push global.arg_counter
mov
jc
push atomic__create.this
peek global.this
pushc vtable__locker
swp
pushai
mov
push atomic__create.value
word generator.const.gcn.286 1
pushcp generator.const.gcn.286
push global.arg_counter
mov
jc
push atomic__create.this
peek global.this
pushc vtable__value
swp
peekai
jr
atomic__create__end:
pushcp atomic__lock__end
jp
atomic__lock:
@atomic__lock.this
push global.this
peek atomic__lock.this
pop
push atomic__lock.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.287 0
pushcp generator.const.gcn.287
push global.arg_counter
mov
jc
jr
atomic__lock__end:
pushcp atomic__unlock__end
jp
atomic__unlock:
@atomic__unlock.this
push global.this
peek atomic__unlock.this
pop
push atomic__unlock.this
pushc vtable__locker
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.288 0
pushcp generator.const.gcn.288
push global.arg_counter
mov
jc
jr
atomic__unlock__end:
pushcp main
jc
word __vtable__size__ 31
pushcp __allocator__map__end
jp
__allocator__map:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc map
swp
pushcp vtable__type
swp
peekai
pcopy
pushc map__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc map__add
swp
pushcp vtable__add
swp
peekai
pcopy
pushc map__delete
swp
pushcp vtable__delete
swp
peekai
pcopy
pushc map__deleteat
swp
pushcp vtable__deleteat
swp
peekai
pcopy
pushc map__clear
swp
pushcp vtable__clear
swp
peekai
pcopy
pushc map__get
swp
pushcp vtable__get
swp
peekai
pcopy
pushc map__set
swp
pushcp vtable__set
swp
peekai
pcopy
pushc map__at
swp
pushcp vtable__at
swp
peekai
pcopy
pushc map__keyat
swp
pushcp vtable__keyat
swp
peekai
pcopy
pushc map__indexof
swp
pushcp vtable__indexof
swp
peekai
pcopy
pushc map__keyindexof
swp
pushcp vtable__keyindexof
swp
peekai
pcopy
pushc map__size
swp
pushcp vtable__size
swp
peekai
jr
__allocator__map__end:
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
pushcp __allocator__list__end
jp
__allocator__list:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc list
swp
pushcp vtable__type
swp
peekai
pcopy
pushc list__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc list__add
swp
pushcp vtable__add
swp
peekai
pcopy
pushc list__insert
swp
pushcp vtable__insert
swp
peekai
pcopy
pushc list__delete
swp
pushcp vtable__delete
swp
peekai
pcopy
pushc list__clear
swp
pushcp vtable__clear
swp
peekai
pcopy
pushc list__get
swp
pushcp vtable__get
swp
peekai
pcopy
pushc list__indexof
swp
pushcp vtable__indexof
swp
peekai
pcopy
pushc list__count
swp
pushcp vtable__count
swp
peekai
pcopy
pushc list__sort
swp
pushcp vtable__sort
swp
peekai
pcopy
pushc list__find
swp
pushcp vtable__find
swp
peekai
pcopy
pushc list__nextins
swp
pushcp vtable__nextins
swp
peekai
jr
__allocator__list__end:
pushcp __allocator__threadlist__end
jp
__allocator__threadlist:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc threadlist
swp
pushcp vtable__type
swp
peekai
pcopy
pushc threadlist__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc threadlist__add
swp
pushcp vtable__add
swp
peekai
pcopy
pushc threadlist__insert
swp
pushcp vtable__insert
swp
peekai
pcopy
pushc threadlist__delete
swp
pushcp vtable__delete
swp
peekai
pcopy
pushc threadlist__clear
swp
pushcp vtable__clear
swp
peekai
pcopy
pushc threadlist__get
swp
pushcp vtable__get
swp
peekai
pcopy
pushc threadlist__indexof
swp
pushcp vtable__indexof
swp
peekai
pcopy
pushc threadlist__sort
swp
pushcp vtable__sort
swp
peekai
pcopy
pushc threadlist__nextins
swp
pushcp vtable__nextins
swp
peekai
pcopy
pushc threadlist__find
swp
pushcp vtable__find
swp
peekai
pcopy
pushc threadlist__lock
swp
pushcp vtable__lock
swp
peekai
pcopy
pushc threadlist__unlock
swp
pushcp vtable__unlock
swp
peekai
pcopy
pushc list__count
swp
pushcp vtable__count
swp
peekai
jr
__allocator__threadlist__end:
pushcp __allocator__criticalsection__end
jp
__allocator__criticalsection:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc criticalsection
swp
pushcp vtable__type
swp
peekai
pcopy
pushc criticalsection__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc criticalsection__enter
swp
pushcp vtable__enter
swp
peekai
pcopy
pushc criticalsection__leave
swp
pushcp vtable__leave
swp
peekai
pcopy
pushc criticalsection__tryenter
swp
pushcp vtable__tryenter
swp
peekai
jr
__allocator__criticalsection__end:
pushcp __allocator__atomic__end
jp
__allocator__atomic:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc atomic
swp
pushcp vtable__type
swp
peekai
pcopy
pushc atomic__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc atomic__lock
swp
pushcp vtable__lock
swp
peekai
pcopy
pushc atomic__unlock
swp
pushcp vtable__unlock
swp
peekai
jr
__allocator__atomic__end: