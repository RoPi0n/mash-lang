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
word vtable__name 1
word vtable__items 2
word vtable__size 3
word vtable__locker 4
word vtable__classname 5
word vtable__message 6
word vtable__critical_section 7
word vtable__value 8
word vtable__create 9
word vtable__say 10
word vtable__voice 11
word vtable__add 12
word vtable__insert 13
word vtable__delete 14
word vtable__clear 15
word vtable__get 16
word vtable__indexof 17
word vtable__count 18
word vtable__sort 19
word vtable__find 20
word vtable__nextins 21
word vtable__lock 22
word vtable__unlock 23
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
word vtable__push 55
word vtable__peek 56
word vtable__pop 57
word vtable__tostring 58
word vtable__enter 59
word vtable__leave 60
word vtable__tryenter 61
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
word creature 8
@structure_instance_creature
pushcp __allocator__creature
jc
peek structure_instance_creature
pop
word cow 9
@structure_instance_cow
pushcp __allocator__cow
jc
peek structure_instance_cow
pop
word cat 10
@structure_instance_cat
pushcp __allocator__cat
jc
peek structure_instance_cat
pop
word list 11
@structure_instance_list
pushcp __allocator__list
jc
peek structure_instance_list
pop
word threadlist 12
@structure_instance_threadlist
pushcp __allocator__threadlist
jc
peek structure_instance_threadlist
pop
word crt 13
@structure_instance_crt
pushcp __allocator__crt
jc
peek structure_instance_crt
pop
word stack 14
@structure_instance_stack
pushcp __allocator__stack
jc
peek structure_instance_stack
pop
word exception 15
@structure_instance_exception
pushcp __allocator__exception
jc
peek structure_instance_exception
pop
word criticalsection 16
@structure_instance_criticalsection
pushcp __allocator__criticalsection
jc
peek structure_instance_criticalsection
pop
word atomic 17
@structure_instance_atomic
pushcp __allocator__atomic
jc
peek structure_instance_atomic
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
pushcp creature__create__end
jp
creature__create:
@creature__create.this
@creature__create.name
peek creature__create.name
pop
push global.this
peek creature__create.this
pop
push creature__create.name
push creature__create.this
pushc vtable__name
swp
peekai
jr
creature__create__end:
pushcp creature__say__end
jp
creature__say:
@creature__say.this
@creature__say.msg
peek creature__say.msg
pop
push global.this
peek creature__say.this
pop
push creature__say.msg
str generator.const.gcn.37 ": "
pushc generator.const.gcn.37
push creature__say.this
pushc vtable__name
swp
pushai
pushc println
word generator.const.gcn.36 3
pushcp generator.const.gcn.36
push global.arg_counter
mov
jc
jr
creature__say__end:
pushcp creature__voice__end
jp
creature__voice:
@creature__voice.this
push global.this
peek creature__voice.this
pop
str generator.const.gcn.39 "hrhrhrhrhhr"
pushc generator.const.gcn.39
push creature__voice.this
peek global.this
pushc vtable__say
swp
pushai
word generator.const.gcn.38 1
pushcp generator.const.gcn.38
push global.arg_counter
mov
jc
jr
creature__voice__end:
pushcp cow__voice__end
jp
cow__voice:
@cow__voice.this
push global.this
peek cow__voice.this
pop
str generator.const.gcn.41 "Moooo..."
pushc generator.const.gcn.41
push cow__voice.this
peek global.this
pushc vtable__say
swp
pushai
word generator.const.gcn.40 1
pushcp generator.const.gcn.40
push global.arg_counter
mov
jc
jr
cow__voice__end:
pushcp cat__voice__end
jp
cat__voice:
@cat__voice.this
push global.this
peek cat__voice.this
pop
str generator.const.gcn.43 "mew :3"
pushc generator.const.gcn.43
push cat__voice.this
peek global.this
pushc vtable__say
swp
pushai
word generator.const.gcn.42 1
pushcp generator.const.gcn.42
push global.arg_counter
mov
jc
jr
cat__voice__end:
pushcp main__end
jp
main:
@main.this
@main.lst
pushcp __allocator__list
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.44 0
pushcp generator.const.gcn.44
push global.arg_counter
mov
jc
peek main.lst
pop
pushcp __allocator__cow
jc
pcopy
peek global.this
str generator.const.gcn.47 "Bob"
pushc generator.const.gcn.47
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.46 1
pushcp generator.const.gcn.46
push global.arg_counter
mov
jc
push main.lst
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.45 1
pushcp generator.const.gcn.45
push global.arg_counter
mov
jc
pushcp __allocator__cow
jc
pcopy
peek global.this
str generator.const.gcn.50 "Bill"
pushc generator.const.gcn.50
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.49 1
pushcp generator.const.gcn.49
push global.arg_counter
mov
jc
push main.lst
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.48 1
pushcp generator.const.gcn.48
push global.arg_counter
mov
jc
pushcp __allocator__cat
jc
pcopy
peek global.this
str generator.const.gcn.53 "Joseph"
pushc generator.const.gcn.53
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.52 1
pushcp generator.const.gcn.52
push global.arg_counter
mov
jc
push main.lst
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.51 1
pushcp generator.const.gcn.51
push global.arg_counter
mov
jc
pushcp __allocator__cow
jc
pcopy
peek global.this
str generator.const.gcn.56 "Kail"
pushc generator.const.gcn.56
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.55 1
pushcp generator.const.gcn.55
push global.arg_counter
mov
jc
push main.lst
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.54 1
pushcp generator.const.gcn.54
push global.arg_counter
mov
jc
pushcp __allocator__cat
jc
pcopy
peek global.this
str generator.const.gcn.59 "Robert"
pushc generator.const.gcn.59
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.58 1
pushcp generator.const.gcn.58
push global.arg_counter
mov
jc
push main.lst
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.57 1
pushcp generator.const.gcn.57
push global.arg_counter
mov
jc
@generator.for_each.gcn.60.array
@generator.for_each.gcn.60.i
@generator.for_each.gcn.60.to
push main.lst
pushc vtable__items
swp
pushai
peek generator.for_each.gcn.60.array
alen
peek generator.for_each.gcn.60.to
pop
pushc global.zero
peek generator.for_each.gcn.60.i
pop
generator.for_each.gcn.60.start:
pushcp generator.for_each.gcn.60.end
push generator.for_each.gcn.60.i
push generator.for_each.gcn.60.to
eq
not
jz
pop
push generator.for_each.gcn.60.i
push generator.for_each.gcn.60.array
pushai
@main.a
peek main.a
pop
pushcp generator.if.gcn.61.else
pushc cat
push main.a
pushcp system_op_is
jc
jz
pop
str generator.const.gcn.63 "Yeah, we found cat!"
pushc generator.const.gcn.63
pushc println
word generator.const.gcn.62 1
pushcp generator.const.gcn.62
push global.arg_counter
mov
jc
generator.if.gcn.61.else:
push main.a
peek global.this
pushc vtable__voice
swp
pushai
word generator.const.gcn.64 0
pushcp generator.const.gcn.64
push global.arg_counter
mov
jc
generator.for_each.gcn.60.continue:
push generator.for_each.gcn.60.i
inc
pop
pushcp generator.for_each.gcn.60.start
jp
generator.for_each.gcn.60.end:
jr
main__end:
pushcp list__create__end
jp
list__create:
@list__create.this
push global.this
peek list__create.this
pop
word generator.const.gcn.66 0
pushc generator.const.gcn.66
word generator.const.gcn.65 1
pushcp generator.const.gcn.65
newa
push list__create.this
pushc vtable__items
swp
peekai
word generator.const.gcn.67 0
pushc generator.const.gcn.67
push list__create.this
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
word generator.const.gcn.69 1
pushc generator.const.gcn.69
push list__add.this
pushc vtable__size
swp
pushai
copy
swp
pop
add
push list__add.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.68 2
pushcp generator.const.gcn.68
push global.arg_counter
mov
jc
push list__add.obj
push list__add.this
pushc vtable__items
swp
pushai
push list__add.this
pushc vtable__size
swp
pushai
swp
peekai
push list__add.this
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
pushcp generator.if.gcn.70.else
word generator.const.gcn.71 0
pushc generator.const.gcn.71
push list__insert.index
swp
bg
push list__insert.index
push list__insert.this
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
str generator.const.gcn.73 ") out of bounds."
pushc generator.const.gcn.73
push list__insert.index
str generator.const.gcn.74 "List index ("
pushc generator.const.gcn.74
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
word generator.const.gcn.72 1
pushcp generator.const.gcn.72
push global.arg_counter
mov
jc
pushc global.raised
trr
pushcp generator.if.gcn.70.end
jp
generator.if.gcn.70.else:
push list__insert.this
pushc vtable__size
swp
pushai
inc
pop
push list__insert.this
pushc vtable__size
swp
pushai
push list__insert.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.75 2
pushcp generator.const.gcn.75
push global.arg_counter
mov
jc
word generator.const.gcn.76 1
pushc generator.const.gcn.76
push list__insert.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
peek list__insert.i
pop
generator.while.gcn.77.start:
pushcp generator.while.gcn.77.end
push list__insert.index
push list__insert.i
bg
jz
pop
push list__insert.this
pushc vtable__items
swp
pushai
word generator.const.gcn.78 1
pushc generator.const.gcn.78
push list__insert.i
copy
swp
pop
sub
swp
pushai
push list__insert.this
pushc vtable__items
swp
pushai
push list__insert.i
swp
peekai
push list__insert.i
dec
pop
pushcp generator.while.gcn.77.start
jp
generator.while.gcn.77.end:
push list__insert.obj
push list__insert.this
pushc vtable__items
swp
pushai
push list__insert.index
swp
peekai
generator.if.gcn.70.end:
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
pushcp generator.if.gcn.79.else
word generator.const.gcn.80 0
pushc generator.const.gcn.80
push list__delete.index
swp
bg
push list__delete.index
push list__delete.this
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
str generator.const.gcn.82 ") out of bounds."
pushc generator.const.gcn.82
push list__delete.index
str generator.const.gcn.83 "List index ("
pushc generator.const.gcn.83
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
word generator.const.gcn.81 1
pushcp generator.const.gcn.81
push global.arg_counter
mov
jc
pushc global.raised
trr
pushcp generator.if.gcn.79.end
jp
generator.if.gcn.79.else:
push list__delete.this
pushc vtable__size
swp
pushai
dec
pop
generator.while.gcn.84.start:
pushcp generator.while.gcn.84.end
push list__delete.this
pushc vtable__size
swp
pushai
push list__delete.index
swp
bg
jz
pop
push list__delete.this
pushc vtable__items
swp
pushai
word generator.const.gcn.85 1
pushc generator.const.gcn.85
push list__delete.index
copy
swp
pop
add
swp
pushai
push list__delete.this
pushc vtable__items
swp
pushai
push list__delete.index
swp
peekai
push list__delete.index
inc
pop
pushcp generator.while.gcn.84.start
jp
generator.while.gcn.84.end:
push list__delete.this
pushc vtable__size
swp
pushai
push list__delete.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.86 2
pushcp generator.const.gcn.86
push global.arg_counter
mov
jc
generator.if.gcn.79.end:
jr
list__delete__end:
pushcp list__clear__end
jp
list__clear:
@list__clear.this
push global.this
peek list__clear.this
pop
word generator.const.gcn.88 0
pushc generator.const.gcn.88
push list__clear.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.87 2
pushcp generator.const.gcn.87
push global.arg_counter
mov
jc
word generator.const.gcn.89 0
pushc generator.const.gcn.89
push list__clear.this
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
pushcp generator.if.gcn.90.else
word generator.const.gcn.91 2
pushcp generator.const.gcn.91
word generator.const.gcn.92 1
pushcp generator.const.gcn.92
newa
pcopy
pushc typearray
swp
word generator.const.gcn.93 0
pushcp generator.const.gcn.93
swp
peekai
pcopy
pushc typeclass
swp
word generator.const.gcn.94 1
pushcp generator.const.gcn.94
swp
peekai
push list__indexof.obj
pushc typeof
word generator.const.gcn.95 1
pushcp generator.const.gcn.95
push global.arg_counter
mov
jc
pushcp system_op_in
jc
jz
pop
word generator.const.gcn.96 0
pushc generator.const.gcn.96
peek list__indexof.i
pop
generator.while.gcn.97.start:
pushcp generator.while.gcn.97.end
push list__indexof.this
pushc vtable__size
swp
pushai
push list__indexof.i
swp
bg
jz
pop
pushcp generator.if.gcn.98.else
push list__indexof.this
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
generator.if.gcn.98.else:
push list__indexof.i
inc
pop
pushcp generator.while.gcn.97.start
jp
generator.while.gcn.97.end:
pushcp generator.if.gcn.90.end
jp
generator.if.gcn.90.else:
word generator.const.gcn.99 0
pushc generator.const.gcn.99
peek list__indexof.i
pop
generator.while.gcn.100.start:
pushcp generator.while.gcn.100.end
push list__indexof.this
pushc vtable__size
swp
pushai
push list__indexof.i
swp
bg
jz
pop
pushcp generator.if.gcn.101.else
push list__indexof.this
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
generator.if.gcn.101.else:
push list__indexof.i
inc
pop
pushcp generator.while.gcn.100.start
jp
generator.while.gcn.100.end:
generator.if.gcn.90.end:
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
pushc vtable__size
swp
pushai
pushc copy
word generator.const.gcn.102 1
pushcp generator.const.gcn.102
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
pushc vtable__items
swp
pushai
pushc quicksort
word generator.const.gcn.103 1
pushcp generator.const.gcn.103
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
pushc vtable__items
swp
pushai
pushc binsearch
word generator.const.gcn.104 2
pushcp generator.const.gcn.104
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
pushc vtable__items
swp
pushai
pushc binnext
word generator.const.gcn.105 2
pushcp generator.const.gcn.105
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
word generator.const.gcn.106 2
pushcp generator.const.gcn.106
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
word generator.const.gcn.107 0
pushcp generator.const.gcn.107
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
word generator.const.gcn.108 0
pushcp generator.const.gcn.108
push global.arg_counter
mov
jc
push threadlist__create.this
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
word generator.const.gcn.109 0
pushcp generator.const.gcn.109
push global.arg_counter
mov
jc
push threadlist__add.obj
push threadlist__add.this
peek global.this
pop
pushcp list__add
word generator.const.gcn.110 1
pushcp generator.const.gcn.110
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
word generator.const.gcn.111 0
pushcp generator.const.gcn.111
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
word generator.const.gcn.112 0
pushcp generator.const.gcn.112
push global.arg_counter
mov
jc
push threadlist__insert.index
push threadlist__insert.obj
push threadlist__insert.this
peek global.this
pop
pushcp list__insert
word generator.const.gcn.113 2
pushcp generator.const.gcn.113
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
word generator.const.gcn.114 0
pushcp generator.const.gcn.114
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
word generator.const.gcn.115 0
pushcp generator.const.gcn.115
push global.arg_counter
mov
jc
push threadlist__delete.index
push threadlist__delete.this
peek global.this
pop
pushcp list__delete
word generator.const.gcn.116 1
pushcp generator.const.gcn.116
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
word generator.const.gcn.117 0
pushcp generator.const.gcn.117
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
word generator.const.gcn.118 0
pushcp generator.const.gcn.118
push global.arg_counter
mov
jc
push threadlist__clear.this
peek global.this
pop
pushcp list__clear
word generator.const.gcn.119 0
pushcp generator.const.gcn.119
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
word generator.const.gcn.120 0
pushcp generator.const.gcn.120
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
word generator.const.gcn.121 0
pushcp generator.const.gcn.121
push global.arg_counter
mov
jc
push threadlist__get.index
push threadlist__get.this
peek global.this
pop
pushcp list__get
word generator.const.gcn.122 1
pushcp generator.const.gcn.122
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
word generator.const.gcn.123 0
pushcp generator.const.gcn.123
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
word generator.const.gcn.124 0
pushcp generator.const.gcn.124
push global.arg_counter
mov
jc
push threadlist__indexof.obj
push threadlist__indexof.this
peek global.this
pop
pushcp list__indexof
word generator.const.gcn.125 1
pushcp generator.const.gcn.125
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
word generator.const.gcn.126 0
pushcp generator.const.gcn.126
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
word generator.const.gcn.127 0
pushcp generator.const.gcn.127
push global.arg_counter
mov
jc
push threadlist__sort.this
peek global.this
pop
pushcp list__sort
word generator.const.gcn.128 0
pushcp generator.const.gcn.128
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
word generator.const.gcn.129 0
pushcp generator.const.gcn.129
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
word generator.const.gcn.130 0
pushcp generator.const.gcn.130
push global.arg_counter
mov
jc
push threadlist__nextins.obj
push threadlist__nextins.this
peek global.this
pop
pushcp list__nextins
word generator.const.gcn.131 1
pushcp generator.const.gcn.131
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
word generator.const.gcn.132 0
pushcp generator.const.gcn.132
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
word generator.const.gcn.133 0
pushcp generator.const.gcn.133
push global.arg_counter
mov
jc
push threadlist__find.obj
push threadlist__find.this
peek global.this
pop
pushcp list__find
word generator.const.gcn.134 1
pushcp generator.const.gcn.134
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
word generator.const.gcn.135 0
pushcp generator.const.gcn.135
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
word generator.const.gcn.136 0
pushcp generator.const.gcn.136
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
word generator.const.gcn.137 0
pushcp generator.const.gcn.137
push global.arg_counter
mov
jc
peek threadlist__lock.r
pop
push threadlist__lock.this
pushc vtable__items
swp
pushai
push threadlist__lock.r
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
word generator.const.gcn.138 0
pushcp generator.const.gcn.138
push global.arg_counter
mov
jc
jr
threadlist__unlock__end:
pushcp __printarray__end
jp
__printarray:
@__printarray.this
@__printarray.arr
@__printarray.l
@__printarray.i
peek __printarray.arr
pop
str generator.const.gcn.139 "["
pushc generator.const.gcn.139
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.140 1
pushcp generator.const.gcn.140
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.141 0
pushc generator.const.gcn.141
peek __printarray.i
pop
generator.while.gcn.142.start:
pushcp generator.while.gcn.142.end
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
word generator.const.gcn.143 1
pushcp generator.const.gcn.143
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
pushcp generator.if.gcn.144.else
push __printarray.l
word generator.const.gcn.145 1
pushc generator.const.gcn.145
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.146 ", "
pushc generator.const.gcn.146
pushc _print
invoke
generator.if.gcn.144.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.142.start
jp
generator.while.gcn.142.end:
str generator.const.gcn.147 "]"
pushc generator.const.gcn.147
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
word generator.const.gcn.149 1
pushcp generator.const.gcn.149
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.150.end
swp
jz
str generator.const.gcn.151 "(null)"
pushc generator.const.gcn.151
pushc _print
invoke
pushcp generator.switch.gcn.148.end
jp
generator.case.gcn.150.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.152.end
swp
jz
push __print.obj
peek global.this
pushc vtable__tostring
swp
pushai
word generator.const.gcn.153 0
pushcp generator.const.gcn.153
push global.arg_counter
mov
jc
pushc _print
invoke
pushcp generator.switch.gcn.148.end
jp
generator.case.gcn.152.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.154.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.155 1
pushcp generator.const.gcn.155
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.148.end
jp
generator.case.gcn.154.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.148.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.156 0
pushcp generator.const.gcn.156
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.157.array
@generator.for_each.gcn.157.i
@generator.for_each.gcn.157.to
push print.args
peek generator.for_each.gcn.157.array
alen
peek generator.for_each.gcn.157.to
pop
pushc global.zero
peek generator.for_each.gcn.157.i
pop
generator.for_each.gcn.157.start:
pushcp generator.for_each.gcn.157.end
push generator.for_each.gcn.157.i
push generator.for_each.gcn.157.to
eq
not
jz
pop
push generator.for_each.gcn.157.i
push generator.for_each.gcn.157.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.158 1
pushcp generator.const.gcn.158
push global.arg_counter
mov
jc
generator.for_each.gcn.157.continue:
push generator.for_each.gcn.157.i
inc
pop
pushcp generator.for_each.gcn.157.start
jp
generator.for_each.gcn.157.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.159 0
pushcp generator.const.gcn.159
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.160.array
@generator.for_each.gcn.160.i
@generator.for_each.gcn.160.to
push println.args
peek generator.for_each.gcn.160.array
alen
peek generator.for_each.gcn.160.to
pop
pushc global.zero
peek generator.for_each.gcn.160.i
pop
generator.for_each.gcn.160.start:
pushcp generator.for_each.gcn.160.end
push generator.for_each.gcn.160.i
push generator.for_each.gcn.160.to
eq
not
jz
pop
push generator.for_each.gcn.160.i
push generator.for_each.gcn.160.array
pushai
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.161 1
pushcp generator.const.gcn.161
push global.arg_counter
mov
jc
generator.for_each.gcn.160.continue:
push generator.for_each.gcn.160.i
inc
pop
pushcp generator.for_each.gcn.160.start
jp
generator.for_each.gcn.160.end:
str generator.const.gcn.162 ""
pushc generator.const.gcn.162
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
word generator.const.gcn.163 7
pushc generator.const.gcn.163
pushc crt_textcolor
invoke
word generator.const.gcn.164 0
pushc generator.const.gcn.164
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
word generator.const.gcn.165 256
pushc generator.const.gcn.165
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
word generator.const.gcn.166 256
pushc generator.const.gcn.166
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
pushcp generator.if.gcn.167.else
push system_op_range.isback
jz
pop
word generator.const.gcn.168 1
pushc generator.const.gcn.168
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
pushcp generator.if.gcn.167.end
jp
generator.if.gcn.167.else:
word generator.const.gcn.169 1
pushc generator.const.gcn.169
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
generator.if.gcn.167.end:
push system_op_range.l
word generator.const.gcn.170 1
pushcp generator.const.gcn.170
newa
peek system_op_range.res
pop
word generator.const.gcn.171 0
pushc generator.const.gcn.171
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.172 1
pushcp generator.const.gcn.172
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.173.start:
pushcp generator.while.gcn.173.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.174 1
pushcp generator.const.gcn.174
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
pushcp generator.if.gcn.175.else
push system_op_range.isback
jz
pop
word generator.const.gcn.176 1
pushc generator.const.gcn.176
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.175.end
jp
generator.if.gcn.175.else:
word generator.const.gcn.177 1
pushc generator.const.gcn.177
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.175.end:
pushcp generator.while.gcn.173.start
jp
generator.while.gcn.173.end:
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
@generator.for_each.gcn.178.array
@generator.for_each.gcn.178.i
@generator.for_each.gcn.178.to
push system_op_in.right
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
@system_op_in.x
peek system_op_in.x
pop
pushcp generator.if.gcn.179.else
push system_op_in.left
push system_op_in.x
eq
jz
pop
pushc true
jr
generator.if.gcn.179.else:
generator.for_each.gcn.178.continue:
push generator.for_each.gcn.178.i
inc
pop
pushcp generator.for_each.gcn.178.start
jp
generator.for_each.gcn.178.end:
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
word generator.const.gcn.180 0
pushc generator.const.gcn.180
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.181 1
pushcp generator.const.gcn.181
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.182.start:
pushcp generator.while.gcn.182.end
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
pushcp generator.while.gcn.182.start
jp
generator.while.gcn.182.end:
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
pushcp generator.if.gcn.183.else
word generator.const.gcn.184 255
pushc generator.const.gcn.184
push typeof.t
eq
jz
pop
push null
jr
generator.if.gcn.183.else:
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
word generator.const.gcn.185 1
pushcp generator.const.gcn.185
push global.arg_counter
mov
jc
peek system_op_is.t
pop
pushcp generator.if.gcn.186.else
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
pushcp generator.if.gcn.186.end
jp
generator.if.gcn.186.else:
push system_op_is.right
push system_op_is.t
eq
jr
generator.if.gcn.186.end:
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
word generator.const.gcn.187 1
pushcp generator.const.gcn.187
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.188 1
pushcp generator.const.gcn.188
newa
peek system_copy_array.r
pop
word generator.const.gcn.189 0
pushc generator.const.gcn.189
peek system_copy_array.i
pop
generator.while.gcn.190.start:
pushcp generator.while.gcn.190.end
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
word generator.const.gcn.191 1
pushcp generator.const.gcn.191
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
pushcp generator.while.gcn.190.start
jp
generator.while.gcn.190.end:
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
pushcp generator.if.gcn.192.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.193 1
pushcp generator.const.gcn.193
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.194 1
pushcp generator.const.gcn.194
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.192.end
jp
generator.if.gcn.192.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.195 1
pushcp generator.const.gcn.195
push global.arg_counter
mov
jc
jr
generator.if.gcn.192.end:
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
word generator.const.gcn.196 0
pushcp generator.const.gcn.196
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
pushcp generator.if.gcn.197.else
word generator.const.gcn.198 0
pushc generator.const.gcn.198
push max.args
pushc len
word generator.const.gcn.199 1
pushcp generator.const.gcn.199
push global.arg_counter
mov
jc
bg
jz
pop
push max.args
word generator.const.gcn.200 0
pushc generator.const.gcn.200
swp
pushai
peek max.r
pop
@generator.for_each.gcn.201.array
@generator.for_each.gcn.201.i
@generator.for_each.gcn.201.to
push max.args
peek generator.for_each.gcn.201.array
alen
peek generator.for_each.gcn.201.to
pop
pushc global.zero
peek generator.for_each.gcn.201.i
pop
generator.for_each.gcn.201.start:
pushcp generator.for_each.gcn.201.end
push generator.for_each.gcn.201.i
push generator.for_each.gcn.201.to
eq
not
jz
pop
push generator.for_each.gcn.201.i
push generator.for_each.gcn.201.array
pushai
@max.x
peek max.x
pop
pushcp generator.if.gcn.202.else
push max.r
push max.x
bg
jz
pop
push max.x
push max.r
mov
generator.if.gcn.202.else:
generator.for_each.gcn.201.continue:
push generator.for_each.gcn.201.i
inc
pop
pushcp generator.for_each.gcn.201.start
jp
generator.for_each.gcn.201.end:
push max.r
jr
pushcp generator.if.gcn.197.end
jp
generator.if.gcn.197.else:
push null
jr
generator.if.gcn.197.end:
jr
max__end:
pushcp min__end
jp
min:
@min.this
@min.args
@min.r
word generator.const.gcn.203 0
pushcp generator.const.gcn.203
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
pushcp generator.if.gcn.204.else
word generator.const.gcn.205 0
pushc generator.const.gcn.205
push min.args
pushc len
word generator.const.gcn.206 1
pushcp generator.const.gcn.206
push global.arg_counter
mov
jc
bg
jz
pop
push min.args
word generator.const.gcn.207 0
pushc generator.const.gcn.207
swp
pushai
peek min.r
pop
@generator.for_each.gcn.208.array
@generator.for_each.gcn.208.i
@generator.for_each.gcn.208.to
push min.args
peek generator.for_each.gcn.208.array
alen
peek generator.for_each.gcn.208.to
pop
pushc global.zero
peek generator.for_each.gcn.208.i
pop
generator.for_each.gcn.208.start:
pushcp generator.for_each.gcn.208.end
push generator.for_each.gcn.208.i
push generator.for_each.gcn.208.to
eq
not
jz
pop
push generator.for_each.gcn.208.i
push generator.for_each.gcn.208.array
pushai
@min.x
peek min.x
pop
pushcp generator.if.gcn.209.else
push min.r
push min.x
swp
bg
jz
pop
push min.x
push min.r
mov
generator.if.gcn.209.else:
generator.for_each.gcn.208.continue:
push generator.for_each.gcn.208.i
inc
pop
pushcp generator.for_each.gcn.208.start
jp
generator.for_each.gcn.208.end:
push min.r
jr
pushcp generator.if.gcn.204.end
jp
generator.if.gcn.204.else:
push null
jr
generator.if.gcn.204.end:
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
word generator.const.gcn.210 0
pushcp generator.const.gcn.210
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.211 ""
pushc generator.const.gcn.211
peek chr.r
pop
@generator.for_each.gcn.212.array
@generator.for_each.gcn.212.i
@generator.for_each.gcn.212.to
push chr.chars
peek generator.for_each.gcn.212.array
alen
peek generator.for_each.gcn.212.to
pop
pushc global.zero
peek generator.for_each.gcn.212.i
pop
generator.for_each.gcn.212.start:
pushcp generator.for_each.gcn.212.end
push generator.for_each.gcn.212.i
push generator.for_each.gcn.212.to
eq
not
jz
pop
push generator.for_each.gcn.212.i
push generator.for_each.gcn.212.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.213 1
pushcp generator.const.gcn.213
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.212.continue:
push generator.for_each.gcn.212.i
inc
pop
pushcp generator.for_each.gcn.212.start
jp
generator.for_each.gcn.212.end:
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
word generator.const.gcn.215 1
pushcp generator.const.gcn.215
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.216.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.214.end
jp
generator.case.gcn.216.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.217.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.214.end
jp
generator.case.gcn.217.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.218.end
swp
jz
push str.value
pushc f2s
invoke
jr
pushcp generator.switch.gcn.214.end
jp
generator.case.gcn.218.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.219.end
swp
jz
push str.value
jr
pushcp generator.switch.gcn.214.end
jp
generator.case.gcn.219.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.221 "Invalid type cast via str()."
pushc generator.const.gcn.221
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.220 1
pushcp generator.const.gcn.220
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.214.end:
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
word generator.const.gcn.223 1
pushcp generator.const.gcn.223
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.224.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.222.end
jp
generator.case.gcn.224.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.225.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.222.end
jp
generator.case.gcn.225.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.226.end
swp
jz
word generator.const.gcn.227 1
pushc generator.const.gcn.227
push int.value
copy
swp
pop
idiv
jr
pushcp generator.switch.gcn.222.end
jp
generator.case.gcn.226.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.228.end
swp
jz
push int.value
pushc s2i
invoke
jr
pushcp generator.switch.gcn.222.end
jp
generator.case.gcn.228.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.230 "Invalid type cast via int()."
pushc generator.const.gcn.230
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.229 1
pushcp generator.const.gcn.229
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.222.end:
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
word generator.const.gcn.232 1
pushcp generator.const.gcn.232
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.233.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.231.end
jp
generator.case.gcn.233.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.234.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.231.end
jp
generator.case.gcn.234.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.235.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.231.end
jp
generator.case.gcn.235.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.236.end
swp
jz
push real.value
pushc s2f
invoke
jr
pushcp generator.switch.gcn.231.end
jp
generator.case.gcn.236.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.238 "Invalid type cast via int()."
pushc generator.const.gcn.238
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.237 1
pushcp generator.const.gcn.237
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.231.end:
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
pushcp generator.if.gcn.239.else
push check.cond
jz
pop
push check.rtrue
jr
pushcp generator.if.gcn.239.end
jp
generator.if.gcn.239.else:
push check.rfalse
jr
generator.if.gcn.239.end:
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
word generator.const.gcn.240 0
pushc generator.const.gcn.240
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.241 1
pushcp generator.const.gcn.241
newa
peek params
pop
word generator.const.gcn.242 0
pushc generator.const.gcn.242
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.243.start:
pushcp generator.while.gcn.243.end
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
pushcp generator.while.gcn.243.start
jp
generator.while.gcn.243.end:
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
str generator.const.gcn.244 "'."
pushc generator.const.gcn.244
push exception__tostring.this
pushc vtable__message
swp
pushai
str generator.const.gcn.245 ">, message: '"
pushc generator.const.gcn.245
push exception__tostring.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.246 "Exception <"
pushc generator.const.gcn.246
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
pushcp generator.if.gcn.247.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.247.end
jp
generator.if.gcn.247.else:
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
generator.if.gcn.247.end:
jr
system_makeexception__end:
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
word generator.const.gcn.248 1
pushcp generator.const.gcn.248
push global.arg_counter
mov
jc
peek reversearray.l
pop
word generator.const.gcn.249 0
pushc generator.const.gcn.249
peek reversearray.i
pop
generator.while.gcn.250.start:
pushcp generator.while.gcn.250.end
word generator.const.gcn.251 2
pushc generator.const.gcn.251
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
word generator.const.gcn.252 1
pushc generator.const.gcn.252
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
word generator.const.gcn.253 1
pushc generator.const.gcn.253
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
pushcp generator.while.gcn.250.start
jp
generator.while.gcn.250.end:
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
word generator.const.gcn.254 0
pushc generator.const.gcn.254
swp
pushai
peek getmax.mx
pop
word generator.const.gcn.255 1
pushc generator.const.gcn.255
peek getmax.i
pop
generator.while.gcn.256.start:
pushcp generator.while.gcn.256.end
push getmax.n
push getmax.i
swp
bg
jz
pop
pushcp generator.if.gcn.257.else
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
generator.if.gcn.257.else:
push getmax.i
inc
pop
pushcp generator.while.gcn.256.start
jp
generator.while.gcn.256.end:
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
word generator.const.gcn.258 0
pushc generator.const.gcn.258
swp
pushai
peek getmin.mn
pop
word generator.const.gcn.259 1
pushc generator.const.gcn.259
peek getmin.i
pop
generator.while.gcn.260.start:
pushcp generator.while.gcn.260.end
push getmin.n
push getmin.i
swp
bg
jz
pop
pushcp generator.if.gcn.261.else
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
generator.if.gcn.261.else:
push getmin.i
inc
pop
pushcp generator.while.gcn.260.start
jp
generator.while.gcn.260.end:
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
word generator.const.gcn.262 1
pushc generator.const.gcn.262
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
@generator.for_each.gcn.263.array
@generator.for_each.gcn.263.i
@generator.for_each.gcn.263.to
push partition.high
push partition.low
pushcp system_op_range
jc
peek generator.for_each.gcn.263.array
alen
peek generator.for_each.gcn.263.to
pop
pushc global.zero
peek generator.for_each.gcn.263.i
pop
generator.for_each.gcn.263.start:
pushcp generator.for_each.gcn.263.end
push generator.for_each.gcn.263.i
push generator.for_each.gcn.263.to
eq
not
jz
pop
push generator.for_each.gcn.263.i
push generator.for_each.gcn.263.array
pushai
@partition.j
peek partition.j
pop
pushcp generator.if.gcn.264.else
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
generator.if.gcn.264.else:
generator.for_each.gcn.263.continue:
push generator.for_each.gcn.263.i
inc
pop
pushcp generator.for_each.gcn.263.start
jp
generator.for_each.gcn.263.end:
push partition.arr
word generator.const.gcn.265 1
pushc generator.const.gcn.265
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
word generator.const.gcn.266 1
pushc generator.const.gcn.266
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
word generator.const.gcn.267 1
pushc generator.const.gcn.267
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
pushcp generator.if.gcn.268.else
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
word generator.const.gcn.269 3
pushcp generator.const.gcn.269
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
word generator.const.gcn.271 1
pushc generator.const.gcn.271
push fromtoqsort.pi
copy
swp
pop
sub
push fromtoqsort.low
push fromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.270 3
pushcp generator.const.gcn.270
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
word generator.const.gcn.273 1
pushc generator.const.gcn.273
push fromtoqsort.pi
copy
swp
pop
add
push fromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.272 3
pushcp generator.const.gcn.272
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
generator.if.gcn.268.else:
jr
fromtoqsort__end:
pushcp quicksort__end
jp
quicksort:
@quicksort.this
@quicksort.arr
peek quicksort.arr
pop
word generator.const.gcn.275 1
pushc generator.const.gcn.275
push quicksort.arr
pushc len
word generator.const.gcn.276 1
pushcp generator.const.gcn.276
push global.arg_counter
mov
jc
copy
swp
pop
sub
word generator.const.gcn.277 0
pushc generator.const.gcn.277
push quicksort.arr
pushc fromtoqsort
word generator.const.gcn.274 3
pushcp generator.const.gcn.274
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
generator.while.gcn.278.start:
pushcp generator.while.gcn.278.end
pushc true
jz
pop
word generator.const.gcn.279 2
pushc generator.const.gcn.279
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
pushcp generator.if.gcn.280.else
push fromtobinsearch.arr
push fromtobinsearch.midd
swp
pushai
push fromtobinsearch.key
swp
bg
jz
pop
word generator.const.gcn.281 1
pushc generator.const.gcn.281
push fromtobinsearch.midd
copy
swp
pop
sub
peek fromtobinsearch.right
pop
pushcp generator.if.gcn.280.end
jp
generator.if.gcn.280.else:
pushcp generator.if.gcn.282.else
push fromtobinsearch.arr
push fromtobinsearch.midd
swp
pushai
push fromtobinsearch.key
bg
jz
pop
word generator.const.gcn.283 1
pushc generator.const.gcn.283
push fromtobinsearch.midd
copy
swp
pop
add
peek fromtobinsearch.left
pop
pushcp generator.if.gcn.282.end
jp
generator.if.gcn.282.else:
push fromtobinsearch.midd
jr
generator.if.gcn.282.end:
generator.if.gcn.280.end:
pushcp generator.if.gcn.284.else
push fromtobinsearch.right
push fromtobinsearch.left
bg
jz
pop
push null
jr
generator.if.gcn.284.else:
pushcp generator.while.gcn.278.start
jp
generator.while.gcn.278.end:
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
word generator.const.gcn.285 1
pushcp generator.const.gcn.285
push global.arg_counter
mov
jc
peek binsearch.l
pop
pushcp generator.if.gcn.286.else
word generator.const.gcn.287 0
pushc generator.const.gcn.287
push binsearch.l
bg
jz
pop
push binsearch.key
word generator.const.gcn.289 1
pushc generator.const.gcn.289
push binsearch.l
copy
swp
pop
sub
word generator.const.gcn.290 0
pushc generator.const.gcn.290
push binsearch.arr
pushc fromtobinsearch
word generator.const.gcn.288 4
pushcp generator.const.gcn.288
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.286.end
jp
generator.if.gcn.286.else:
push null
jr
generator.if.gcn.286.end:
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
generator.while.gcn.291.start:
pushcp generator.while.gcn.291.end
pushc true
jz
pop
word generator.const.gcn.292 2
pushc generator.const.gcn.292
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
pushcp generator.if.gcn.293.else
push fromtobinnext.arr
push fromtobinnext.midd
swp
pushai
push fromtobinnext.key
swp
bg
jz
pop
word generator.const.gcn.294 1
pushc generator.const.gcn.294
push fromtobinnext.midd
copy
swp
pop
sub
peek fromtobinnext.right
pop
pushcp generator.if.gcn.293.end
jp
generator.if.gcn.293.else:
pushcp generator.if.gcn.295.else
push fromtobinnext.arr
push fromtobinnext.midd
swp
pushai
push fromtobinnext.key
bg
jz
pop
word generator.const.gcn.296 1
pushc generator.const.gcn.296
push fromtobinnext.midd
copy
swp
pop
add
peek fromtobinnext.left
pop
pushcp generator.if.gcn.295.end
jp
generator.if.gcn.295.else:
push fromtobinnext.midd
jr
generator.if.gcn.295.end:
generator.if.gcn.293.end:
pushcp generator.if.gcn.297.else
push fromtobinnext.right
push fromtobinnext.left
bg
jz
pop
push fromtobinnext.midd
jr
generator.if.gcn.297.else:
pushcp generator.while.gcn.291.start
jp
generator.while.gcn.291.end:
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
word generator.const.gcn.298 1
pushcp generator.const.gcn.298
push global.arg_counter
mov
jc
peek binnext.l
pop
pushcp generator.if.gcn.299.else
word generator.const.gcn.300 0
pushc generator.const.gcn.300
push binnext.l
bg
jz
pop
push binnext.key
word generator.const.gcn.302 1
pushc generator.const.gcn.302
push binnext.l
copy
swp
pop
sub
word generator.const.gcn.303 0
pushc generator.const.gcn.303
push binnext.arr
pushc fromtobinnext
word generator.const.gcn.301 4
pushcp generator.const.gcn.301
push global.arg_counter
mov
jc
peek binnext.r
pop
pushcp generator.if.gcn.304.else
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
pushcp generator.if.gcn.304.end
jp
generator.if.gcn.304.else:
word generator.const.gcn.305 1
pushc generator.const.gcn.305
push binnext.r
copy
swp
pop
add
jr
generator.if.gcn.304.end:
pushcp generator.if.gcn.299.end
jp
generator.if.gcn.299.else:
word generator.const.gcn.306 0
pushc generator.const.gcn.306
jr
generator.if.gcn.299.end:
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
word generator.const.gcn.307 0
pushc generator.const.gcn.307
peek fromtointerpolarsearch.pos
pop
pushc false
peek fromtointerpolarsearch.found
pop
generator.while.gcn.308.start:
pushcp generator.while.gcn.308.end
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
pushcp generator.if.gcn.309.else
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.pos
swp
pushai
swp
bg
jz
pop
word generator.const.gcn.310 1
pushc generator.const.gcn.310
push fromtointerpolarsearch.pos
copy
swp
pop
add
push fromtointerpolarsearch.left
mov
pushcp generator.if.gcn.309.end
jp
generator.if.gcn.309.else:
pushcp generator.if.gcn.311.else
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.pos
swp
pushai
bg
jz
pop
word generator.const.gcn.312 1
pushc generator.const.gcn.312
push fromtointerpolarsearch.pos
copy
swp
pop
sub
push fromtointerpolarsearch.right
mov
pushcp generator.if.gcn.311.end
jp
generator.if.gcn.311.else:
pushc true
push fromtointerpolarsearch.found
mov
generator.if.gcn.311.end:
generator.if.gcn.309.end:
pushcp generator.while.gcn.308.start
jp
generator.while.gcn.308.end:
pushcp generator.if.gcn.313.else
push fromtointerpolarsearch.found
jz
pop
push fromtointerpolarsearch.pos
jr
pushcp generator.if.gcn.313.end
jp
generator.if.gcn.313.else:
push null
jr
generator.if.gcn.313.end:
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
word generator.const.gcn.314 1
pushcp generator.const.gcn.314
push global.arg_counter
mov
jc
peek interpolarsearch.l
pop
pushcp generator.if.gcn.315.else
word generator.const.gcn.316 0
pushc generator.const.gcn.316
push interpolarsearch.l
bg
jz
pop
push interpolarsearch.key
word generator.const.gcn.318 1
pushc generator.const.gcn.318
push interpolarsearch.l
copy
swp
pop
sub
word generator.const.gcn.319 0
pushc generator.const.gcn.319
push interpolarsearch.arr
pushc fromtointerpolarsearch
word generator.const.gcn.317 4
pushcp generator.const.gcn.317
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.315.end
jp
generator.if.gcn.315.else:
push null
jr
generator.if.gcn.315.end:
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
word generator.const.gcn.320 0
pushcp generator.const.gcn.320
push global.arg_counter
mov
jc
push atomic__create.this
pushc vtable__locker
swp
pushai
mov
push atomic__create.value
word generator.const.gcn.321 1
pushcp generator.const.gcn.321
push global.arg_counter
mov
jc
push atomic__create.this
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
word generator.const.gcn.322 0
pushcp generator.const.gcn.322
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
word generator.const.gcn.323 0
pushcp generator.const.gcn.323
push global.arg_counter
mov
jc
jr
atomic__unlock__end:
pushcp main
jc
word __vtable__size__ 62
pushcp __allocator__creature__end
jp
__allocator__creature:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc creature
swp
pushcp vtable__type
swp
peekai
pcopy
pushc creature__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc creature__say
swp
pushcp vtable__say
swp
peekai
pcopy
pushc creature__voice
swp
pushcp vtable__voice
swp
peekai
jr
__allocator__creature__end:
pushcp __allocator__cow__end
jp
__allocator__cow:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc cow
swp
pushcp vtable__type
swp
peekai
pcopy
pushc cow__voice
swp
pushcp vtable__voice
swp
peekai
pcopy
pushc creature__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc creature__say
swp
pushcp vtable__say
swp
peekai
jr
__allocator__cow__end:
pushcp __allocator__cat__end
jp
__allocator__cat:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc cat
swp
pushcp vtable__type
swp
peekai
pcopy
pushc cat__voice
swp
pushcp vtable__voice
swp
peekai
pcopy
pushc creature__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc creature__say
swp
pushcp vtable__say
swp
peekai
jr
__allocator__cat__end:
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