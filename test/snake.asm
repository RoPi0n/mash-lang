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
str snake_char "@"
str food_char "&"
str border_char "#"
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
word vtable__body 1
word vtable__movingvector 2
word vtable__food 3
word vtable__score 4
word vtable__gameover 5
word vtable__items 6
word vtable__size 7
word vtable__x 8
word vtable__y 9
word vtable__z 10
word vtable__threadcontext 11
word vtable__resumed 12
word vtable__terminated 13
word vtable__method 14
word vtable__args 15
word vtable__classname 16
word vtable__message 17
word vtable__create 18
word vtable__randfood 19
word vtable__movesnake 20
word vtable__gametick 21
word vtable__normvideo 22
word vtable__wherex 23
word vtable__wherey 24
word vtable__pause 25
word vtable__cursorbig 26
word vtable__cursoroff 27
word vtable__cursoron 28
word vtable__delline 29
word vtable__gotoxy 30
word vtable__insline 31
word vtable__keypressed 32
word vtable__readkey 33
word vtable__sound 34
word vtable__window32 35
word vtable__clreol 36
word vtable__clrscr 37
word vtable__getdirectvideo 38
word vtable__getlastmode 39
word vtable__settextattr 40
word vtable__gettextattr 41
word vtable__getwindmax 42
word vtable__getwindmaxx 43
word vtable__getwindmaxy 44
word vtable__getwindmin 45
word vtable__getwindminx 46
word vtable__getwindminy 47
word vtable__getcheckbreak 48
word vtable__getcheckeof 49
word vtable__getchecksnow 50
word vtable__textcolor 51
word vtable__textbackground 52
word vtable__push_back 53
word vtable__push_first 54
word vtable__pop_back 55
word vtable__pop_first 56
word vtable__peek_back 57
word vtable__peek_first 58
word vtable__rem_first 59
word vtable__rem_back 60
word vtable__get 61
word vtable__set 62
word vtable__clone 63
word vtable__compare 64
word vtable__execute 65
word vtable__free 66
word vtable__rejoin 67
word vtable__suspend 68
word vtable__resume 69
word vtable__setpriority 70
word vtable__terminate 71
word vtable__waitfor 72
word vtable__push 73
word vtable__peek 74
word vtable__pop 75
@global.arg_counter
@global.temp
@global.this
word global.zero 0
word global.one 1
str global.raised "ERaisedException"
pushc global.zero
peek global.arg_counter
pop
@snakemovingvector
@threadpriority
@types
@vectors
@sysslash
@null
@params
@eabstractexception
@emathexception
@ecriticalexception
@eunknown
word snake 0
@structure_instance_snake
pushcp __allocator__snake
jc
peek structure_instance_snake
pop
word crt 1
@structure_instance_crt
pushcp __allocator__crt
jc
peek structure_instance_crt
pop
word vector 2
@structure_instance_vector
pushcp __allocator__vector
jc
peek structure_instance_vector
pop
word point 3
@structure_instance_point
pushcp __allocator__point
jc
peek structure_instance_point
pop
word point3d 4
@structure_instance_point3d
pushcp __allocator__point3d
jc
peek structure_instance_point3d
pop
word tthread 5
@structure_instance_tthread
pushcp __allocator__tthread
jc
peek structure_instance_tthread
pop
word tthreadcall 6
@structure_instance_tthreadcall
pushcp __allocator__tthreadcall
jc
peek structure_instance_tthreadcall
pop
word stack 7
@structure_instance_stack
pushcp __allocator__stack
jc
peek structure_instance_stack
pop
word exception 8
@structure_instance_exception
pushcp __allocator__exception
jc
peek structure_instance_exception
pop
pushcp __init__
jc
@snakemovingvector
word generator.const.gcn.0 4
pushcp generator.const.gcn.0
pushcp global.one
newa
peek snakemovingvector
word smvleft 0
pcopy
pushc smvleft
swp
word generator.const.gcn.1 0
pushcp generator.const.gcn.1
swp
peekai
word smvright 1
pcopy
pushc smvright
swp
word generator.const.gcn.2 1
pushcp generator.const.gcn.2
swp
peekai
word smvup 2
pcopy
pushc smvup
swp
word generator.const.gcn.3 2
pushcp generator.const.gcn.3
swp
peekai
word smvdown 3
pcopy
pushc smvdown
swp
word generator.const.gcn.4 3
pushcp generator.const.gcn.4
swp
peekai
pop
@threadpriority
word generator.const.gcn.5 7
pushcp generator.const.gcn.5
pushcp global.one
newa
peek threadpriority
word tpidle 0
pcopy
pushc tpidle
swp
word generator.const.gcn.6 0
pushcp generator.const.gcn.6
swp
peekai
word tplowest 1
pcopy
pushc tplowest
swp
word generator.const.gcn.7 1
pushcp generator.const.gcn.7
swp
peekai
word tplower 2
pcopy
pushc tplower
swp
word generator.const.gcn.8 2
pushcp generator.const.gcn.8
swp
peekai
word tpnormal 3
pcopy
pushc tpnormal
swp
word generator.const.gcn.9 3
pushcp generator.const.gcn.9
swp
peekai
word tphigher 4
pcopy
pushc tphigher
swp
word generator.const.gcn.10 4
pushcp generator.const.gcn.10
swp
peekai
word tphighest 5
pcopy
pushc tphighest
swp
word generator.const.gcn.11 5
pushcp generator.const.gcn.11
swp
peekai
word tptimecritical 6
pcopy
pushc tptimecritical
swp
word generator.const.gcn.12 6
pushcp generator.const.gcn.12
swp
peekai
pop
@types
word generator.const.gcn.13 9
pushcp generator.const.gcn.13
pushcp global.one
newa
peek types
word typenull 0
pcopy
pushc typenull
swp
word generator.const.gcn.14 0
pushcp generator.const.gcn.14
swp
peekai
word typeword 1
pcopy
pushc typeword
swp
word generator.const.gcn.15 1
pushcp generator.const.gcn.15
swp
peekai
word typeint 2
pcopy
pushc typeint
swp
word generator.const.gcn.16 2
pushcp generator.const.gcn.16
swp
peekai
word typereal 3
pcopy
pushc typereal
swp
word generator.const.gcn.17 3
pushcp generator.const.gcn.17
swp
peekai
word typestr 4
pcopy
pushc typestr
swp
word generator.const.gcn.18 4
pushcp generator.const.gcn.18
swp
peekai
word typearray 5
pcopy
pushc typearray
swp
word generator.const.gcn.19 5
pushcp generator.const.gcn.19
swp
peekai
word typeclass 6
pcopy
pushc typeclass
swp
word generator.const.gcn.20 6
pushcp generator.const.gcn.20
swp
peekai
word typeref 7
pcopy
pushc typeref
swp
word generator.const.gcn.21 7
pushcp generator.const.gcn.21
swp
peekai
word typeptr 255
pcopy
pushc typeptr
swp
word generator.const.gcn.22 8
pushcp generator.const.gcn.22
swp
peekai
pop
word generator.const.gcn.23 4
pushcp generator.const.gcn.23
word generator.const.gcn.24 1
pushcp generator.const.gcn.24
newa
pcopy
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.30 0
pushc generator.const.gcn.30
swp
word generator.const.gcn.31 1
pushc generator.const.gcn.31
copy
swp
pop
neg
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.29 2
pushcp generator.const.gcn.29
push global.arg_counter
mov
jc
swp
word generator.const.gcn.25 0
pushcp generator.const.gcn.25
swp
peekai
pcopy
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.33 0
pushc generator.const.gcn.33
swp
word generator.const.gcn.34 1
pushc generator.const.gcn.34
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.32 2
pushcp generator.const.gcn.32
push global.arg_counter
mov
jc
swp
word generator.const.gcn.26 1
pushcp generator.const.gcn.26
swp
peekai
pcopy
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.36 1
pushc generator.const.gcn.36
copy
swp
pop
neg
swp
word generator.const.gcn.37 0
pushc generator.const.gcn.37
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.35 2
pushcp generator.const.gcn.35
push global.arg_counter
mov
jc
swp
word generator.const.gcn.27 2
pushcp generator.const.gcn.27
swp
peekai
pcopy
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.39 1
pushc generator.const.gcn.39
swp
word generator.const.gcn.40 0
pushc generator.const.gcn.40
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.38 2
pushcp generator.const.gcn.38
push global.arg_counter
mov
jc
swp
word generator.const.gcn.28 3
pushcp generator.const.gcn.28
swp
peekai
peek vectors
pop
pushcp __init__end__
jp
__init__:
pushc getsystemslash
invoke
peek sysslash
pop
pushc __getvm_null__
word generator.const.gcn.41 0
pushcp generator.const.gcn.41
push global.arg_counter
mov
jc
peek null
pop
push null
peek params
pop
pushc __initproc__
word generator.const.gcn.42 0
pushcp generator.const.gcn.42
push global.arg_counter
mov
jc
jr
__init__end__:
word generator.const.gcn.43 5
pushcp generator.const.gcn.43
word generator.const.gcn.44 1
pushcp generator.const.gcn.44
newa
pcopy
pushc eraisedexception
swp
word generator.const.gcn.45 0
pushcp generator.const.gcn.45
swp
peekai
pcopy
pushc einvalidvmop
swp
word generator.const.gcn.46 1
pushcp generator.const.gcn.46
swp
peekai
pcopy
pushc einvalidtypecast
swp
word generator.const.gcn.47 2
pushcp generator.const.gcn.47
swp
peekai
pcopy
pushc eabstracterror
swp
word generator.const.gcn.48 3
pushcp generator.const.gcn.48
swp
peekai
pcopy
pushc eunknownexception
swp
word generator.const.gcn.49 4
pushcp generator.const.gcn.49
swp
peekai
peek eabstractexception
pop
word generator.const.gcn.50 9
pushcp generator.const.gcn.50
word generator.const.gcn.51 1
pushcp generator.const.gcn.51
newa
pcopy
pushc einterror
swp
word generator.const.gcn.52 0
pushcp generator.const.gcn.52
swp
peekai
pcopy
pushc edivbyzero
swp
word generator.const.gcn.53 1
pushcp generator.const.gcn.53
swp
peekai
pcopy
pushc erangeerror
swp
word generator.const.gcn.54 2
pushcp generator.const.gcn.54
swp
peekai
pcopy
pushc eintoverflow
swp
word generator.const.gcn.55 3
pushcp generator.const.gcn.55
swp
peekai
pcopy
pushc ematherror
swp
word generator.const.gcn.56 4
pushcp generator.const.gcn.56
swp
peekai
pcopy
pushc einvalidop
swp
word generator.const.gcn.57 5
pushcp generator.const.gcn.57
swp
peekai
pcopy
pushc ezerodivide
swp
word generator.const.gcn.58 6
pushcp generator.const.gcn.58
swp
peekai
pcopy
pushc eoverflow
swp
word generator.const.gcn.59 7
pushcp generator.const.gcn.59
swp
peekai
pcopy
pushc eunderflow
swp
word generator.const.gcn.60 8
pushcp generator.const.gcn.60
swp
peekai
peek emathexception
pop
word generator.const.gcn.61 3
pushcp generator.const.gcn.61
word generator.const.gcn.62 1
pushcp generator.const.gcn.62
newa
pcopy
pushc eaccessviolation
swp
word generator.const.gcn.63 0
pushcp generator.const.gcn.63
swp
peekai
pcopy
pushc eoserror
swp
word generator.const.gcn.64 1
pushcp generator.const.gcn.64
swp
peekai
pcopy
pushc enothreadsupport
swp
word generator.const.gcn.65 2
pushcp generator.const.gcn.65
swp
peekai
peek ecriticalexception
pop
str generator.const.gcn.67 "Unknown raised exception."
pushc generator.const.gcn.67
pushc eunknownexception
pushc system_makeexception
word generator.const.gcn.66 2
pushcp generator.const.gcn.66
push global.arg_counter
mov
jc
peek eunknown
pop
pushcp putch__end
jp
putch:
@putch.this
@putch.x
@putch.y
@putch.char
peek putch.x
pop
peek putch.y
pop
peek putch.char
pop
push putch.y
push putch.x
push structure_instance_crt
peek global.this
pushc vtable__gotoxy
swp
pushai
word generator.const.gcn.68 2
pushcp generator.const.gcn.68
push global.arg_counter
mov
jc
push putch.char
pushc print
word generator.const.gcn.69 1
pushcp generator.const.gcn.69
push global.arg_counter
mov
jc
jr
putch__end:
pushcp drawborders__end
jp
drawborders:
@drawborders.this
@generator.for_each.gcn.70.array
@generator.for_each.gcn.70.i
@generator.for_each.gcn.70.to
word generator.const.gcn.71 22
pushc generator.const.gcn.71
word generator.const.gcn.72 1
pushc generator.const.gcn.72
pushcp system_op_range
jc
peek generator.for_each.gcn.70.array
alen
peek generator.for_each.gcn.70.to
pop
pushc global.zero
peek generator.for_each.gcn.70.i
pop
generator.for_each.gcn.70.start:
pushcp generator.for_each.gcn.70.end
push generator.for_each.gcn.70.i
push generator.for_each.gcn.70.to
eq
not
jz
pop
push generator.for_each.gcn.70.i
push generator.for_each.gcn.70.array
pushai
@drawborders.y
peek drawborders.y
pop
pushc border_char
push drawborders.y
word generator.const.gcn.74 1
pushc generator.const.gcn.74
pushc putch
word generator.const.gcn.73 3
pushcp generator.const.gcn.73
push global.arg_counter
mov
jc
pushc border_char
push drawborders.y
word generator.const.gcn.76 42
pushc generator.const.gcn.76
pushc putch
word generator.const.gcn.75 3
pushcp generator.const.gcn.75
push global.arg_counter
mov
jc
generator.for_each.gcn.70.continue:
push generator.for_each.gcn.70.i
inc
pop
pushcp generator.for_each.gcn.70.start
jp
generator.for_each.gcn.70.end:
@generator.for_each.gcn.77.array
@generator.for_each.gcn.77.i
@generator.for_each.gcn.77.to
word generator.const.gcn.78 42
pushc generator.const.gcn.78
word generator.const.gcn.79 1
pushc generator.const.gcn.79
pushcp system_op_range
jc
peek generator.for_each.gcn.77.array
alen
peek generator.for_each.gcn.77.to
pop
pushc global.zero
peek generator.for_each.gcn.77.i
pop
generator.for_each.gcn.77.start:
pushcp generator.for_each.gcn.77.end
push generator.for_each.gcn.77.i
push generator.for_each.gcn.77.to
eq
not
jz
pop
push generator.for_each.gcn.77.i
push generator.for_each.gcn.77.array
pushai
@drawborders.x
peek drawborders.x
pop
pushc border_char
word generator.const.gcn.81 1
pushc generator.const.gcn.81
push drawborders.x
pushc putch
word generator.const.gcn.80 3
pushcp generator.const.gcn.80
push global.arg_counter
mov
jc
pushc border_char
word generator.const.gcn.83 22
pushc generator.const.gcn.83
push drawborders.x
pushc putch
word generator.const.gcn.82 3
pushcp generator.const.gcn.82
push global.arg_counter
mov
jc
generator.for_each.gcn.77.continue:
push generator.for_each.gcn.77.i
inc
pop
pushcp generator.for_each.gcn.77.start
jp
generator.for_each.gcn.77.end:
jr
drawborders__end:
pushcp snake__create__end
jp
snake__create:
@snake__create.this
push global.this
peek snake__create.this
pop
pushcp __allocator__vector
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.84 0
pushcp generator.const.gcn.84
push global.arg_counter
mov
jc
push snake__create.this
pushc vtable__body
swp
peekai
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.87 10
pushc generator.const.gcn.87
swp
word generator.const.gcn.88 10
pushc generator.const.gcn.88
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.86 2
pushcp generator.const.gcn.86
push global.arg_counter
mov
jc
push snake__create.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__push_back
swp
pushai
word generator.const.gcn.85 1
pushcp generator.const.gcn.85
push global.arg_counter
mov
jc
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.91 10
pushc generator.const.gcn.91
swp
word generator.const.gcn.92 11
pushc generator.const.gcn.92
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.90 2
pushcp generator.const.gcn.90
push global.arg_counter
mov
jc
push snake__create.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__push_back
swp
pushai
word generator.const.gcn.89 1
pushcp generator.const.gcn.89
push global.arg_counter
mov
jc
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.95 10
pushc generator.const.gcn.95
swp
word generator.const.gcn.96 12
pushc generator.const.gcn.96
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.94 2
pushcp generator.const.gcn.94
push global.arg_counter
mov
jc
push snake__create.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__push_back
swp
pushai
word generator.const.gcn.93 1
pushcp generator.const.gcn.93
push global.arg_counter
mov
jc
pushc smvright
push snake__create.this
pushc vtable__movingvector
swp
peekai
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.98 2
pushc generator.const.gcn.98
word generator.const.gcn.99 19
pushc generator.const.gcn.99
pushc randomto
invoke
copy
swp
pop
add
swp
word generator.const.gcn.100 2
pushc generator.const.gcn.100
word generator.const.gcn.101 39
pushc generator.const.gcn.101
pushc randomto
invoke
copy
swp
pop
add
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.97 2
pushcp generator.const.gcn.97
push global.arg_counter
mov
jc
push snake__create.this
pushc vtable__food
swp
peekai
word generator.const.gcn.102 0
pushc generator.const.gcn.102
push snake__create.this
pushc vtable__score
swp
peekai
pushc false
push snake__create.this
pushc vtable__gameover
swp
peekai
jr
snake__create__end:
pushcp snake__randfood__end
jp
snake__randfood:
@snake__randfood.this
push global.this
peek snake__randfood.this
pop
word generator.const.gcn.104 2
pushc generator.const.gcn.104
word generator.const.gcn.105 19
pushc generator.const.gcn.105
pushc randomto
invoke
copy
swp
pop
add
word generator.const.gcn.106 2
pushc generator.const.gcn.106
word generator.const.gcn.107 39
pushc generator.const.gcn.107
pushc randomto
invoke
copy
swp
pop
add
push snake__randfood.this
pushc vtable__food
swp
pushai
peek global.this
pushc vtable__set
swp
pushai
word generator.const.gcn.103 2
pushcp generator.const.gcn.103
push global.arg_counter
mov
jc
@generator.for_each.gcn.108.array
@generator.for_each.gcn.108.i
@generator.for_each.gcn.108.to
push snake__randfood.this
pushc vtable__body
swp
pushai
pushc vtable__items
swp
pushai
peek generator.for_each.gcn.108.array
alen
peek generator.for_each.gcn.108.to
pop
pushc global.zero
peek generator.for_each.gcn.108.i
pop
generator.for_each.gcn.108.start:
pushcp generator.for_each.gcn.108.end
push generator.for_each.gcn.108.i
push generator.for_each.gcn.108.to
eq
not
jz
pop
push generator.for_each.gcn.108.i
push generator.for_each.gcn.108.array
pushai
@snake__randfood.i
peek snake__randfood.i
pop
pushcp generator.if.gcn.109.else
push snake__randfood.this
pushc vtable__food
swp
pushai
push snake__randfood.i
peek global.this
pushc vtable__compare
swp
pushai
word generator.const.gcn.110 1
pushcp generator.const.gcn.110
push global.arg_counter
mov
jc
jz
pop
push snake__randfood.this
peek global.this
pushc vtable__randfood
swp
pushai
word generator.const.gcn.111 0
pushcp generator.const.gcn.111
push global.arg_counter
mov
jc
pushcp generator.for_each.gcn.108.end
jp
generator.if.gcn.109.else:
generator.for_each.gcn.108.continue:
push generator.for_each.gcn.108.i
inc
pop
pushcp generator.for_each.gcn.108.start
jp
generator.for_each.gcn.108.end:
jr
snake__randfood__end:
pushcp snake__movesnake__end
jp
snake__movesnake:
@snake__movesnake.this
@snake__movesnake.x
@snake__movesnake.y
@snake__movesnake.head
@snake__movesnake.newx
@snake__movesnake.newy
@snake__movesnake.newhead
@snake__movesnake.f
peek snake__movesnake.x
pop
peek snake__movesnake.y
pop
push global.this
peek snake__movesnake.this
pop
push snake__movesnake.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__peek_back
swp
pushai
word generator.const.gcn.112 0
pushcp generator.const.gcn.112
push global.arg_counter
mov
jc
peek snake__movesnake.head
pop
push snake__movesnake.x
push snake__movesnake.head
pushc vtable__x
swp
pushai
copy
swp
pop
add
peek snake__movesnake.newx
pop
push snake__movesnake.y
push snake__movesnake.head
pushc vtable__y
swp
pushai
copy
swp
pop
add
peek snake__movesnake.newy
pop
pushcp __allocator__point
jc
pcopy
peek global.this
push snake__movesnake.newy
swp
push snake__movesnake.newx
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.113 2
pushcp generator.const.gcn.113
push global.arg_counter
mov
jc
peek snake__movesnake.newhead
pop
pushc snake_char
push snake__movesnake.newy
push snake__movesnake.newx
pushc putch
word generator.const.gcn.114 3
pushcp generator.const.gcn.114
push global.arg_counter
mov
jc
push snake__movesnake.newhead
push snake__movesnake.this
pushc vtable__body
swp
pushai
peek global.this
push vtable__add
swp
pushai
word generator.const.gcn.115 1
pushcp generator.const.gcn.115
push global.arg_counter
mov
jc
pushcp generator.if.gcn.116.else
push snake__movesnake.newy
push snake__movesnake.this
pushc vtable__food
swp
pushai
pushc vtable__y
swp
pushai
eq
push snake__movesnake.newx
push snake__movesnake.this
pushc vtable__food
swp
pushai
pushc vtable__x
swp
pushai
eq
copy
swp
pop
and
jz
pop
push snake__movesnake.this
peek global.this
pushc vtable__randfood
swp
pushai
word generator.const.gcn.117 0
pushcp generator.const.gcn.117
push global.arg_counter
mov
jc
pushc food_char
push snake__movesnake.this
pushc vtable__food
swp
pushai
pushc vtable__y
swp
pushai
push snake__movesnake.this
pushc vtable__food
swp
pushai
pushc vtable__x
swp
pushai
pushc putch
word generator.const.gcn.118 3
pushcp generator.const.gcn.118
push global.arg_counter
mov
jc
push snake__movesnake.this
pushc vtable__score
swp
pushai
inc
pop
str generator.const.gcn.120 ""
pushc generator.const.gcn.120
push snake__movesnake.this
pushc vtable__score
swp
pushai
str generator.const.gcn.121 "Score: "
pushc generator.const.gcn.121
copy
swp
pop
add
copy
swp
pop
add
word generator.const.gcn.122 13
pushc generator.const.gcn.122
word generator.const.gcn.123 46
pushc generator.const.gcn.123
pushc putch
word generator.const.gcn.119 3
pushcp generator.const.gcn.119
push global.arg_counter
mov
jc
pushcp generator.if.gcn.116.end
jp
generator.if.gcn.116.else:
push snake__movesnake.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__pop_first
swp
pushai
word generator.const.gcn.124 0
pushcp generator.const.gcn.124
push global.arg_counter
mov
jc
peek snake__movesnake.f
pop
str generator.const.gcn.126 " "
pushc generator.const.gcn.126
push snake__movesnake.f
pushc vtable__y
swp
pushai
push snake__movesnake.f
pushc vtable__x
swp
pushai
pushc putch
word generator.const.gcn.125 3
pushcp generator.const.gcn.125
push global.arg_counter
mov
jc
@generator.for_each.gcn.127.array
@generator.for_each.gcn.127.i
@generator.for_each.gcn.127.to
push snake__movesnake.this
pushc vtable__body
swp
pushai
pushc vtable__items
swp
pushai
peek generator.for_each.gcn.127.array
alen
peek generator.for_each.gcn.127.to
pop
pushc global.zero
peek generator.for_each.gcn.127.i
pop
generator.for_each.gcn.127.start:
pushcp generator.for_each.gcn.127.end
push generator.for_each.gcn.127.i
push generator.for_each.gcn.127.to
eq
not
jz
pop
push generator.for_each.gcn.127.i
push generator.for_each.gcn.127.array
pushai
@snake__movesnake.i
peek snake__movesnake.i
pop
pushcp generator.if.gcn.128.else
push snake__movesnake.newhead
push snake__movesnake.i
peek global.this
pushc vtable__compare
swp
pushai
word generator.const.gcn.129 1
pushcp generator.const.gcn.129
push global.arg_counter
mov
jc
jz
pop
pushc true
push snake__movesnake.this
pushc vtable__gameover
swp
pushai
mov
pushcp generator.for_each.gcn.127.end
jp
generator.if.gcn.128.else:
generator.for_each.gcn.127.continue:
push generator.for_each.gcn.127.i
inc
pop
pushcp generator.for_each.gcn.127.start
jp
generator.for_each.gcn.127.end:
pushcp generator.if.gcn.130.else
word generator.const.gcn.131 2
pushcp generator.const.gcn.131
word generator.const.gcn.132 1
pushcp generator.const.gcn.132
newa
pcopy
word generator.const.gcn.135 1
pushc generator.const.gcn.135
swp
word generator.const.gcn.133 0
pushcp generator.const.gcn.133
swp
peekai
pcopy
word generator.const.gcn.136 22
pushc generator.const.gcn.136
swp
word generator.const.gcn.134 1
pushcp generator.const.gcn.134
swp
peekai
push snake__movesnake.newhead
pushc vtable__y
swp
pushai
pushcp system_op_in
jc
word generator.const.gcn.137 2
pushcp generator.const.gcn.137
word generator.const.gcn.138 1
pushcp generator.const.gcn.138
newa
pcopy
word generator.const.gcn.141 1
pushc generator.const.gcn.141
swp
word generator.const.gcn.139 0
pushcp generator.const.gcn.139
swp
peekai
pcopy
word generator.const.gcn.142 42
pushc generator.const.gcn.142
swp
word generator.const.gcn.140 1
pushcp generator.const.gcn.140
swp
peekai
push snake__movesnake.newhead
pushc vtable__x
swp
pushai
pushcp system_op_in
jc
copy
swp
pop
or
jz
pop
pushc true
push snake__movesnake.this
pushc vtable__gameover
swp
pushai
mov
generator.if.gcn.130.else:
generator.if.gcn.116.end:
pushc food_char
push snake__movesnake.this
pushc vtable__food
swp
pushai
pushc vtable__y
swp
pushai
push snake__movesnake.this
pushc vtable__food
swp
pushai
pushc vtable__x
swp
pushai
pushc putch
word generator.const.gcn.143 3
pushcp generator.const.gcn.143
push global.arg_counter
mov
jc
jr
snake__movesnake__end:
pushcp snake__gametick__end
jp
snake__gametick:
@snake__gametick.this
push global.this
peek snake__gametick.this
pop
push vectors
push snake__gametick.this
pushc vtable__movingvector
swp
pushai
swp
pushai
pushc vtable__y
swp
pushai
push vectors
push snake__gametick.this
pushc vtable__movingvector
swp
pushai
swp
pushai
pushc vtable__x
swp
pushai
push snake__gametick.this
peek global.this
pushc vtable__movesnake
swp
pushai
word generator.const.gcn.144 2
pushcp generator.const.gcn.144
push global.arg_counter
mov
jc
jr
snake__gametick__end:
pushcp controlthread__end
jp
controlthread:
@controlthread.this
@controlthread.snk
@controlthread.k
peek controlthread.snk
pop
generator.while.gcn.145.start:
pushcp generator.while.gcn.145.end
push controlthread.snk
pushc vtable__gameover
swp
pushai
copy
swp
pop
not
jz
pop
push structure_instance_crt
peek global.this
pushc vtable__readkey
swp
pushai
word generator.const.gcn.146 0
pushcp generator.const.gcn.146
push global.arg_counter
mov
jc
pushc strupper
invoke
peek controlthread.k
pop
pushcp generator.if.gcn.147.else
word generator.const.gcn.148 2
pushcp generator.const.gcn.148
word generator.const.gcn.149 1
pushcp generator.const.gcn.149
newa
pcopy
pushc smvleft
swp
word generator.const.gcn.150 0
pushcp generator.const.gcn.150
swp
peekai
pcopy
pushc smvright
swp
word generator.const.gcn.151 1
pushcp generator.const.gcn.151
swp
peekai
push controlthread.snk
pushc vtable__movingvector
swp
pushai
pushcp system_op_in
jc
jz
pop
push controlthread.k
pcopy
str generator.const.gcn.154 "W"
pushc generator.const.gcn.154
eq
pushcp generator.case.gcn.153.end
swp
jz
pushc smvup
push controlthread.snk
pushc vtable__movingvector
swp
peekai
pushcp generator.switch.gcn.152.end
jp
generator.case.gcn.153.end:
pcopy
str generator.const.gcn.156 "S"
pushc generator.const.gcn.156
eq
pushcp generator.case.gcn.155.end
swp
jz
pushc smvdown
push controlthread.snk
pushc vtable__movingvector
swp
peekai
pushcp generator.switch.gcn.152.end
jp
generator.case.gcn.155.end:
generator.switch.gcn.152.end:
generator.if.gcn.147.else:
pushcp generator.if.gcn.157.else
word generator.const.gcn.158 2
pushcp generator.const.gcn.158
word generator.const.gcn.159 1
pushcp generator.const.gcn.159
newa
pcopy
pushc smvup
swp
word generator.const.gcn.160 0
pushcp generator.const.gcn.160
swp
peekai
pcopy
pushc smvdown
swp
word generator.const.gcn.161 1
pushcp generator.const.gcn.161
swp
peekai
push controlthread.snk
pushc vtable__movingvector
swp
pushai
pushcp system_op_in
jc
jz
pop
push controlthread.k
pcopy
str generator.const.gcn.164 "A"
pushc generator.const.gcn.164
eq
pushcp generator.case.gcn.163.end
swp
jz
pushc smvleft
push controlthread.snk
pushc vtable__movingvector
swp
peekai
pushcp generator.switch.gcn.162.end
jp
generator.case.gcn.163.end:
pcopy
str generator.const.gcn.166 "D"
pushc generator.const.gcn.166
eq
pushcp generator.case.gcn.165.end
swp
jz
pushc smvright
push controlthread.snk
pushc vtable__movingvector
swp
peekai
pushcp generator.switch.gcn.162.end
jp
generator.case.gcn.165.end:
generator.switch.gcn.162.end:
generator.if.gcn.157.else:
word generator.const.gcn.167 100
pushc generator.const.gcn.167
pushc sleep
invoke
pushc gc
word generator.const.gcn.168 0
pushcp generator.const.gcn.168
push global.arg_counter
mov
jc
pushcp generator.while.gcn.145.start
jp
generator.while.gcn.145.end:
jr
controlthread__end:
pushcp main__end
jp
main:
@main.this
@main.snk
@main.inpthr
generator.while.gcn.169.start:
pushcp generator.while.gcn.169.end
pushc true
jz
pop
pushc randomize
invoke
pushcp __allocator__snake
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.170 0
pushcp generator.const.gcn.170
push global.arg_counter
mov
jc
peek main.snk
pop
push main.snk
pushc controlthread
pushc thread
word generator.const.gcn.171 2
pushcp generator.const.gcn.171
push global.arg_counter
mov
jc
peek main.inpthr
pop
push main.inpthr
peek global.this
pushc vtable__resume
swp
pushai
word generator.const.gcn.172 0
pushcp generator.const.gcn.172
push global.arg_counter
mov
jc
pushc crt_white
push structure_instance_crt
peek global.this
pushc vtable__textbackground
swp
pushai
word generator.const.gcn.173 1
pushcp generator.const.gcn.173
push global.arg_counter
mov
jc
push structure_instance_crt
peek global.this
pushc vtable__clrscr
swp
pushai
word generator.const.gcn.174 0
pushcp generator.const.gcn.174
push global.arg_counter
mov
jc
pushc crt_black
push structure_instance_crt
peek global.this
pushc vtable__textcolor
swp
pushai
word generator.const.gcn.175 1
pushcp generator.const.gcn.175
push global.arg_counter
mov
jc
pushc crt_black
push structure_instance_crt
peek global.this
pushc vtable__textbackground
swp
pushai
word generator.const.gcn.176 1
pushcp generator.const.gcn.176
push global.arg_counter
mov
jc
pushc drawborders
word generator.const.gcn.177 0
pushcp generator.const.gcn.177
push global.arg_counter
mov
jc
pushc crt_white
push structure_instance_crt
peek global.this
pushc vtable__textbackground
swp
pushai
word generator.const.gcn.178 1
pushcp generator.const.gcn.178
push global.arg_counter
mov
jc
@generator.for_each.gcn.179.array
@generator.for_each.gcn.179.i
@generator.for_each.gcn.179.to
push main.snk
pushc vtable__body
swp
pushai
pushc vtable__items
swp
pushai
peek generator.for_each.gcn.179.array
alen
peek generator.for_each.gcn.179.to
pop
pushc global.zero
peek generator.for_each.gcn.179.i
pop
generator.for_each.gcn.179.start:
pushcp generator.for_each.gcn.179.end
push generator.for_each.gcn.179.i
push generator.for_each.gcn.179.to
eq
not
jz
pop
push generator.for_each.gcn.179.i
push generator.for_each.gcn.179.array
pushai
@main.i
peek main.i
pop
pushc snake_char
push main.i
pushc vtable__y
swp
pushai
push main.i
pushc vtable__x
swp
pushai
pushc putch
word generator.const.gcn.180 3
pushcp generator.const.gcn.180
push global.arg_counter
mov
jc
generator.for_each.gcn.179.continue:
push generator.for_each.gcn.179.i
inc
pop
pushcp generator.for_each.gcn.179.start
jp
generator.for_each.gcn.179.end:
str generator.const.gcn.182 "[MASH LANG!]"
pushc generator.const.gcn.182
word generator.const.gcn.183 10
pushc generator.const.gcn.183
word generator.const.gcn.184 46
pushc generator.const.gcn.184
pushc putch
word generator.const.gcn.181 3
pushcp generator.const.gcn.181
push global.arg_counter
mov
jc
str generator.const.gcn.186 "[SNAKE]"
pushc generator.const.gcn.186
word generator.const.gcn.187 11
pushc generator.const.gcn.187
word generator.const.gcn.188 46
pushc generator.const.gcn.188
pushc putch
word generator.const.gcn.185 3
pushcp generator.const.gcn.185
push global.arg_counter
mov
jc
str generator.const.gcn.190 "Score: 0"
pushc generator.const.gcn.190
word generator.const.gcn.191 13
pushc generator.const.gcn.191
word generator.const.gcn.192 46
pushc generator.const.gcn.192
pushc putch
word generator.const.gcn.189 3
pushcp generator.const.gcn.189
push global.arg_counter
mov
jc
generator.while.gcn.193.start:
pushcp generator.while.gcn.193.end
push main.snk
pushc vtable__gameover
swp
pushai
copy
swp
pop
not
jz
pop
push structure_instance_crt
peek global.this
pushc vtable__cursoroff
swp
pushai
word generator.const.gcn.194 0
pushcp generator.const.gcn.194
push global.arg_counter
mov
jc
word generator.const.gcn.195 100
pushc generator.const.gcn.195
pushc sleep
invoke
push main.snk
peek global.this
pushc vtable__gametick
swp
pushai
word generator.const.gcn.196 0
pushcp generator.const.gcn.196
push global.arg_counter
mov
jc
pushc gc
word generator.const.gcn.197 0
pushcp generator.const.gcn.197
push global.arg_counter
mov
jc
pushcp generator.while.gcn.193.start
jp
generator.while.gcn.193.end:
pushc crt_white
push structure_instance_crt
peek global.this
pushc vtable__textcolor
swp
pushai
word generator.const.gcn.198 1
pushcp generator.const.gcn.198
push global.arg_counter
mov
jc
pushc crt_black
push structure_instance_crt
peek global.this
pushc vtable__textbackground
swp
pushai
word generator.const.gcn.199 1
pushcp generator.const.gcn.199
push global.arg_counter
mov
jc
push structure_instance_crt
peek global.this
pushc vtable__clrscr
swp
pushai
word generator.const.gcn.200 0
pushcp generator.const.gcn.200
push global.arg_counter
mov
jc
push structure_instance_crt
peek global.this
pushc vtable__cursoron
swp
pushai
word generator.const.gcn.201 0
pushcp generator.const.gcn.201
push global.arg_counter
mov
jc
str generator.const.gcn.203 "Game over!"
pushc generator.const.gcn.203
word generator.const.gcn.204 1
pushc generator.const.gcn.204
word generator.const.gcn.205 1
pushc generator.const.gcn.205
pushc putch
word generator.const.gcn.202 3
pushcp generator.const.gcn.202
push global.arg_counter
mov
jc
str generator.const.gcn.207 ""
pushc generator.const.gcn.207
push main.snk
pushc vtable__score
swp
pushai
str generator.const.gcn.208 "Score: "
pushc generator.const.gcn.208
copy
swp
pop
add
copy
swp
pop
add
word generator.const.gcn.209 2
pushc generator.const.gcn.209
word generator.const.gcn.210 1
pushc generator.const.gcn.210
pushc putch
word generator.const.gcn.206 3
pushcp generator.const.gcn.206
push global.arg_counter
mov
jc
push main.inpthr
peek global.this
pushc vtable__waitfor
swp
pushai
word generator.const.gcn.211 0
pushcp generator.const.gcn.211
push global.arg_counter
mov
jc
push structure_instance_crt
peek global.this
pushc vtable__readkey
swp
pushai
word generator.const.gcn.212 0
pushcp generator.const.gcn.212
push global.arg_counter
mov
jc
pushc gc
word generator.const.gcn.213 0
pushcp generator.const.gcn.213
push global.arg_counter
mov
jc
pushcp generator.while.gcn.169.start
jp
generator.while.gcn.169.end:
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
str generator.const.gcn.214 "["
pushc generator.const.gcn.214
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.215 1
pushcp generator.const.gcn.215
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.216 0
pushc generator.const.gcn.216
peek __printarray.i
pop
generator.while.gcn.217.start:
pushcp generator.while.gcn.217.end
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
word generator.const.gcn.218 1
pushcp generator.const.gcn.218
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
pushcp generator.if.gcn.219.else
push __printarray.l
word generator.const.gcn.220 1
pushc generator.const.gcn.220
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.221 ", "
pushc generator.const.gcn.221
pushc _print
invoke
generator.if.gcn.219.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.217.start
jp
generator.while.gcn.217.end:
str generator.const.gcn.222 "]"
pushc generator.const.gcn.222
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
word generator.const.gcn.224 1
pushcp generator.const.gcn.224
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.225.end
swp
jz
str generator.const.gcn.226 "(null)"
pushc generator.const.gcn.226
pushc _print
invoke
pushcp generator.switch.gcn.223.end
jp
generator.case.gcn.225.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.227.end
swp
jz
pushcp generator.if.gcn.228.else
pushc exception
push __print.obj
pushc vtable__type
swp
pushai
eq
jz
pop
str generator.const.gcn.229 "'."
pushc generator.const.gcn.229
push __print.obj
pushc vtable__message
swp
pushai
str generator.const.gcn.230 "> with message: '"
pushc generator.const.gcn.230
push __print.obj
pushc vtable__classname
swp
pushai
str generator.const.gcn.231 "Exception <"
pushc generator.const.gcn.231
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
pushcp generator.if.gcn.228.end
jp
generator.if.gcn.228.else:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.233 "I/O exception: invalid object type for output"
pushc generator.const.gcn.233
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.232 1
pushcp generator.const.gcn.232
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.if.gcn.228.end:
pushcp generator.switch.gcn.223.end
jp
generator.case.gcn.227.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.234.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.235 1
pushcp generator.const.gcn.235
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.223.end
jp
generator.case.gcn.234.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.223.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.236 0
pushcp generator.const.gcn.236
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.237.array
@generator.for_each.gcn.237.i
@generator.for_each.gcn.237.to
push print.args
peek generator.for_each.gcn.237.array
alen
peek generator.for_each.gcn.237.to
pop
pushc global.zero
peek generator.for_each.gcn.237.i
pop
generator.for_each.gcn.237.start:
pushcp generator.for_each.gcn.237.end
push generator.for_each.gcn.237.i
push generator.for_each.gcn.237.to
eq
not
jz
pop
push generator.for_each.gcn.237.i
push generator.for_each.gcn.237.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.238 1
pushcp generator.const.gcn.238
push global.arg_counter
mov
jc
generator.for_each.gcn.237.continue:
push generator.for_each.gcn.237.i
inc
pop
pushcp generator.for_each.gcn.237.start
jp
generator.for_each.gcn.237.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.239 0
pushcp generator.const.gcn.239
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.240.array
@generator.for_each.gcn.240.i
@generator.for_each.gcn.240.to
push println.args
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
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.241 1
pushcp generator.const.gcn.241
push global.arg_counter
mov
jc
generator.for_each.gcn.240.continue:
push generator.for_each.gcn.240.i
inc
pop
pushcp generator.for_each.gcn.240.start
jp
generator.for_each.gcn.240.end:
str generator.const.gcn.242 ""
pushc generator.const.gcn.242
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
word generator.const.gcn.243 7
pushc generator.const.gcn.243
pushc crt_textcolor
invoke
word generator.const.gcn.244 0
pushc generator.const.gcn.244
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
word generator.const.gcn.245 256
pushc generator.const.gcn.245
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
word generator.const.gcn.246 256
pushc generator.const.gcn.246
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
pushcp vector__create__end
jp
vector__create:
@vector__create.this
push global.this
peek vector__create.this
pop
word generator.const.gcn.248 0
pushc generator.const.gcn.248
word generator.const.gcn.247 1
pushcp generator.const.gcn.247
newa
push vector__create.this
pushc vtable__items
swp
peekai
word generator.const.gcn.249 0
pushc generator.const.gcn.249
push vector__create.this
pushc vtable__size
swp
peekai
jr
vector__create__end:
pushcp vector__push_back__end
jp
vector__push_back:
@vector__push_back.this
@vector__push_back.object
peek vector__push_back.object
pop
push global.this
peek vector__push_back.this
pop
word generator.const.gcn.251 1
pushc generator.const.gcn.251
push vector__push_back.this
pushc vtable__size
swp
pushai
copy
swp
pop
add
push vector__push_back.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.250 2
pushcp generator.const.gcn.250
push global.arg_counter
mov
jc
push vector__push_back.object
push vector__push_back.this
pushc vtable__items
swp
pushai
push vector__push_back.this
pushc vtable__size
swp
pushai
swp
peekai
push vector__push_back.this
pushc vtable__size
swp
pushai
inc
pop
jr
vector__push_back__end:
pushcp vector__push_first__end
jp
vector__push_first:
@vector__push_first.this
@vector__push_first.object
peek vector__push_first.object
pop
push global.this
peek vector__push_first.this
pop
pushcp generator.if.gcn.252.else
word generator.const.gcn.253 0
pushc generator.const.gcn.253
push vector__push_first.this
pushc vtable__size
swp
pushai
bg
jz
pop
word generator.const.gcn.255 1
pushc generator.const.gcn.255
push vector__push_first.this
pushc vtable__size
swp
pushai
copy
swp
pop
add
push vector__push_first.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.254 2
pushcp generator.const.gcn.254
push global.arg_counter
mov
jc
@generator.for_each.gcn.256.array
@generator.for_each.gcn.256.i
@generator.for_each.gcn.256.to
word generator.const.gcn.257 1
pushc generator.const.gcn.257
push vector__push_first.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
word generator.const.gcn.258 0
pushc generator.const.gcn.258
pushcp system_op_range
jc
peek generator.for_each.gcn.256.array
alen
peek generator.for_each.gcn.256.i
dec
pop
pushc global.zero
peek generator.for_each.gcn.256.to
dec
pop
generator.for_each.gcn.256.start:
pushcp generator.for_each.gcn.256.end
push generator.for_each.gcn.256.i
push generator.for_each.gcn.256.to
eq
not
jz
pop
push generator.for_each.gcn.256.i
push generator.for_each.gcn.256.array
pushai
@vector__push_first.i
peek vector__push_first.i
pop
push vector__push_first.this
pushc vtable__items
swp
pushai
push vector__push_first.i
swp
pushai
push vector__push_first.this
pushc vtable__items
swp
pushai
word generator.const.gcn.259 1
pushc generator.const.gcn.259
push vector__push_first.i
copy
swp
pop
add
swp
peekai
generator.for_each.gcn.256.continue:
push generator.for_each.gcn.256.i
dec
pop
pushcp generator.for_each.gcn.256.start
jp
generator.for_each.gcn.256.end:
push vector__push_first.this
pushc vtable__size
swp
pushai
inc
pop
push vector__push_first.object
push vector__push_first.this
pushc vtable__items
swp
pushai
word generator.const.gcn.260 0
pushc generator.const.gcn.260
swp
peekai
pushcp generator.if.gcn.252.end
jp
generator.if.gcn.252.else:
push vector__push_first.object
push vector__push_first.this
peek global.this
pushc vtable__push_back
swp
pushai
word generator.const.gcn.261 1
pushcp generator.const.gcn.261
push global.arg_counter
mov
jc
generator.if.gcn.252.end:
jr
vector__push_first__end:
pushcp vector__pop_back__end
jp
vector__pop_back:
@vector__pop_back.this
@vector__pop_back.r
push global.this
peek vector__pop_back.this
pop
push vector__pop_back.this
pushc vtable__items
swp
pushai
word generator.const.gcn.262 1
pushc generator.const.gcn.262
push vector__pop_back.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
swp
pushai
peek vector__pop_back.r
pop
word generator.const.gcn.264 1
pushc generator.const.gcn.264
push vector__pop_back.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
push vector__pop_back.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.263 2
pushcp generator.const.gcn.263
push global.arg_counter
mov
jc
push vector__pop_back.this
pushc vtable__size
swp
pushai
dec
pop
push vector__pop_back.r
jr
jr
vector__pop_back__end:
pushcp vector__pop_first__end
jp
vector__pop_first:
@vector__pop_first.this
@vector__pop_first.r
push global.this
peek vector__pop_first.this
pop
push vector__pop_first.this
pushc vtable__items
swp
pushai
word generator.const.gcn.265 0
pushc generator.const.gcn.265
swp
pushai
peek vector__pop_first.r
pop
push vector__pop_first.this
peek global.this
pushc vtable__rem_first
swp
pushai
word generator.const.gcn.266 0
pushcp generator.const.gcn.266
push global.arg_counter
mov
jc
push vector__pop_first.r
jr
jr
vector__pop_first__end:
pushcp vector__peek_back__end
jp
vector__peek_back:
@vector__peek_back.this
push global.this
peek vector__peek_back.this
pop
push vector__peek_back.this
pushc vtable__items
swp
pushai
word generator.const.gcn.267 1
pushc generator.const.gcn.267
push vector__peek_back.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
swp
pushai
jr
jr
vector__peek_back__end:
pushcp vector__peek_first__end
jp
vector__peek_first:
@vector__peek_first.this
push global.this
peek vector__peek_first.this
pop
push vector__peek_first.this
pushc vtable__items
swp
pushai
word generator.const.gcn.268 0
pushc generator.const.gcn.268
swp
pushai
jr
jr
vector__peek_first__end:
pushcp vector__rem_first__end
jp
vector__rem_first:
@vector__rem_first.this
@vector__rem_first.i
push global.this
peek vector__rem_first.this
pop
word generator.const.gcn.269 1
pushc generator.const.gcn.269
peek vector__rem_first.i
pop
generator.while.gcn.270.start:
pushcp generator.while.gcn.270.end
word generator.const.gcn.271 1
pushc generator.const.gcn.271
push vector__rem_first.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
push vector__rem_first.i
swp
bg
jz
pop
push vector__rem_first.this
pushc vtable__items
swp
pushai
word generator.const.gcn.272 1
pushc generator.const.gcn.272
push vector__rem_first.i
copy
swp
pop
add
swp
pushai
push vector__rem_first.this
pushc vtable__items
swp
pushai
push vector__rem_first.i
swp
peekai
push vector__rem_first.i
inc
pop
pushcp generator.while.gcn.270.start
jp
generator.while.gcn.270.end:
word generator.const.gcn.274 1
pushc generator.const.gcn.274
push vector__rem_first.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
push vector__rem_first.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.273 2
pushcp generator.const.gcn.273
push global.arg_counter
mov
jc
push vector__rem_first.this
pushc vtable__size
swp
pushai
dec
pop
jr
vector__rem_first__end:
pushcp vector__rem_back__end
jp
vector__rem_back:
@vector__rem_back.this
push global.this
peek vector__rem_back.this
pop
push vector__rem_back.this
pushc vtable__size
swp
pushai
dec
pop
push vector__rem_back.this
pushc vtable__size
swp
pushai
push vector__rem_back.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.275 2
pushcp generator.const.gcn.275
push global.arg_counter
mov
jc
jr
vector__rem_back__end:
pushcp vector__get__end
jp
vector__get:
@vector__get.this
@vector__get.index
peek vector__get.index
pop
push global.this
peek vector__get.this
pop
push vector__get.this
pushc vtable__items
swp
pushai
push vector__get.index
swp
pushai
jr
jr
vector__get__end:
pushcp vector__size__end
jp
vector__size:
@vector__size.this
push global.this
peek vector__size.this
pop
push vector__size.this
pushc vtable__size
swp
pushai
pushc copy
word generator.const.gcn.276 1
pushcp generator.const.gcn.276
push global.arg_counter
mov
jc
jr
jr
vector__size__end:
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
word generator.const.gcn.277 1
pushcp generator.const.gcn.277
push global.arg_counter
mov
jc
push point__create.this
pushc vtable__x
swp
peekai
push point__create.y
pushc copy
word generator.const.gcn.278 1
pushcp generator.const.gcn.278
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
word generator.const.gcn.279 2
pushcp generator.const.gcn.279
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
word generator.const.gcn.280 1
pushcp generator.const.gcn.280
push global.arg_counter
mov
jc
push thr_kill.thr
pushc thr_terminate
word generator.const.gcn.281 1
pushcp generator.const.gcn.281
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
word generator.const.gcn.282 0
pushcp generator.const.gcn.282
push global.arg_counter
mov
jc
push tthread_join.threadclass
peek global.this
pushc vtable__terminate
swp
pushai
word generator.const.gcn.283 0
pushcp generator.const.gcn.283
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
word generator.const.gcn.284 2
pushcp generator.const.gcn.284
push global.arg_counter
mov
jc
push tthread__create.this
pushc vtable__threadcontext
swp
peekai
pushcp generator.if.gcn.285.else
push tthread__create.resumed
jz
pop
push tthread__create.this
peek global.this
pushc vtable__resume
swp
pushai
word generator.const.gcn.286 0
pushcp generator.const.gcn.286
push global.arg_counter
mov
jc
generator.if.gcn.285.else:
jr
tthread__create__end:
pushcp tthread__free__end
jp
tthread__free:
@tthread__free.this
push global.this
peek tthread__free.this
pop
pushcp generator.if.gcn.287.else
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
word generator.const.gcn.288 0
pushcp generator.const.gcn.288
push global.arg_counter
mov
jc
generator.if.gcn.287.else:
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
word generator.const.gcn.289 2
pushcp generator.const.gcn.289
push global.arg_counter
mov
jc
push tthread__rejoin.this
pushc vtable__threadcontext
swp
peekai
pushcp generator.if.gcn.290.else
push tthread__rejoin.resumed
jz
pop
push tthread__rejoin.this
peek global.this
pushc vtable__resume
swp
pushai
word generator.const.gcn.291 0
pushcp generator.const.gcn.291
push global.arg_counter
mov
jc
generator.if.gcn.290.else:
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
word generator.const.gcn.292 1
pushcp generator.const.gcn.292
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
word generator.const.gcn.293 1
pushcp generator.const.gcn.293
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
word generator.const.gcn.294 2
pushcp generator.const.gcn.294
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
word generator.const.gcn.295 1
pushcp generator.const.gcn.295
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
generator.while.gcn.296.start:
pushcp generator.while.gcn.296.end
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
word generator.const.gcn.297 1
pushc generator.const.gcn.297
pushc sleep
invoke
pushc gc
word generator.const.gcn.298 0
pushcp generator.const.gcn.298
push global.arg_counter
mov
jc
pushcp generator.while.gcn.296.start
jp
generator.while.gcn.296.end:
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
word generator.const.gcn.299 1
pushcp generator.const.gcn.299
push global.arg_counter
mov
jc
jr
tthreadcall__create__end:
pushcp tthreadcall__execute__end
jp
tthreadcall__execute:
@tthreadcall__execute.this
push global.this
peek tthreadcall__execute.this
pop
generator.while.gcn.300.start:
pushcp generator.while.gcn.300.end
word generator.const.gcn.301 0
pushc generator.const.gcn.301
push tthreadcall__execute.this
pushc vtable__args
swp
pushai
peek global.this
pushc vtable__size
swp
pushai
word generator.const.gcn.302 0
pushcp generator.const.gcn.302
push global.arg_counter
mov
jc
bg
jz
pop
push tthreadcall__execute.this
pushc vtable__args
swp
pushai
peek global.this
pushc vtable__pop_back
swp
pushai
word generator.const.gcn.303 0
pushcp generator.const.gcn.303
push global.arg_counter
mov
jc
pushcp generator.while.gcn.300.start
jp
generator.while.gcn.300.end:
push tthreadcall__execute.this
peek global.this
pushc vtable__method
swp
pushai
word generator.const.gcn.304 0
pushcp generator.const.gcn.304
push global.arg_counter
mov
jc
jr
tthreadcall__execute__end:
pushcp go__end
jp
go:
@go.this
@go.method
@go.args
@go.args_vect
peek go.method
pop
word generator.const.gcn.305 1
pushcp generator.const.gcn.305
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek go.args
pop
pushcp __allocator__vector
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.306 0
pushcp generator.const.gcn.306
push global.arg_counter
mov
jc
peek go.args_vect
pop
@generator.for_each.gcn.307.array
@generator.for_each.gcn.307.i
@generator.for_each.gcn.307.to
push go.args
peek generator.for_each.gcn.307.array
alen
peek generator.for_each.gcn.307.to
pop
pushc global.zero
peek generator.for_each.gcn.307.i
pop
generator.for_each.gcn.307.start:
pushcp generator.for_each.gcn.307.end
push generator.for_each.gcn.307.i
push generator.for_each.gcn.307.to
eq
not
jz
pop
push generator.for_each.gcn.307.i
push generator.for_each.gcn.307.array
pushai
@go.arg
peek go.arg
pop
push go.arg
push go.args_vect
peek global.this
pushc vtable__push_back
swp
pushai
word generator.const.gcn.308 1
pushcp generator.const.gcn.308
push global.arg_counter
mov
jc
generator.for_each.gcn.307.continue:
push generator.for_each.gcn.307.i
inc
pop
pushcp generator.for_each.gcn.307.start
jp
generator.for_each.gcn.307.end:
pushcp __allocator__tthreadcall
jc
pcopy
peek global.this
pushc true
swp
push go.args_vect
swp
push go.method
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.309 3
pushcp generator.const.gcn.309
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
@thread.args_vect
peek thread.method
pop
word generator.const.gcn.310 1
pushcp generator.const.gcn.310
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek thread.args
pop
pushcp __allocator__vector
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.311 0
pushcp generator.const.gcn.311
push global.arg_counter
mov
jc
peek thread.args_vect
pop
@generator.for_each.gcn.312.array
@generator.for_each.gcn.312.i
@generator.for_each.gcn.312.to
push thread.args
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
@thread.arg
peek thread.arg
pop
push thread.arg
push thread.args_vect
peek global.this
pushc vtable__push_back
swp
pushai
word generator.const.gcn.313 1
pushcp generator.const.gcn.313
push global.arg_counter
mov
jc
generator.for_each.gcn.312.continue:
push generator.for_each.gcn.312.i
inc
pop
pushcp generator.for_each.gcn.312.start
jp
generator.for_each.gcn.312.end:
pushcp __allocator__tthreadcall
jc
pcopy
peek global.this
pushc false
swp
push thread.args_vect
swp
push thread.method
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.314 3
pushcp generator.const.gcn.314
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
pushcp generator.if.gcn.315.else
push system_op_range.isback
jz
pop
word generator.const.gcn.316 1
pushc generator.const.gcn.316
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
pushcp generator.if.gcn.315.end
jp
generator.if.gcn.315.else:
word generator.const.gcn.317 1
pushc generator.const.gcn.317
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
generator.if.gcn.315.end:
push system_op_range.l
word generator.const.gcn.318 1
pushcp generator.const.gcn.318
newa
peek system_op_range.res
pop
word generator.const.gcn.319 0
pushc generator.const.gcn.319
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.320 1
pushcp generator.const.gcn.320
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.321.start:
pushcp generator.while.gcn.321.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.322 1
pushcp generator.const.gcn.322
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
pushcp generator.if.gcn.323.else
push system_op_range.isback
jz
pop
word generator.const.gcn.324 1
pushc generator.const.gcn.324
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.323.end
jp
generator.if.gcn.323.else:
word generator.const.gcn.325 1
pushc generator.const.gcn.325
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.323.end:
pushcp generator.while.gcn.321.start
jp
generator.while.gcn.321.end:
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
@generator.for_each.gcn.326.array
@generator.for_each.gcn.326.i
@generator.for_each.gcn.326.to
push system_op_in.right
peek generator.for_each.gcn.326.array
alen
peek generator.for_each.gcn.326.to
pop
pushc global.zero
peek generator.for_each.gcn.326.i
pop
generator.for_each.gcn.326.start:
pushcp generator.for_each.gcn.326.end
push generator.for_each.gcn.326.i
push generator.for_each.gcn.326.to
eq
not
jz
pop
push generator.for_each.gcn.326.i
push generator.for_each.gcn.326.array
pushai
@system_op_in.x
peek system_op_in.x
pop
pushcp generator.if.gcn.327.else
push system_op_in.left
push system_op_in.x
eq
jz
pop
pushc true
jr
generator.if.gcn.327.else:
generator.for_each.gcn.326.continue:
push generator.for_each.gcn.326.i
inc
pop
pushcp generator.for_each.gcn.326.start
jp
generator.for_each.gcn.326.end:
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
word generator.const.gcn.328 0
pushc generator.const.gcn.328
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.329 1
pushcp generator.const.gcn.329
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.330.start:
pushcp generator.while.gcn.330.end
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
pushcp generator.while.gcn.330.start
jp
generator.while.gcn.330.end:
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
word generator.const.gcn.331 1
pushcp generator.const.gcn.331
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.332 1
pushcp generator.const.gcn.332
newa
peek system_copy_array.r
pop
word generator.const.gcn.333 0
pushc generator.const.gcn.333
peek system_copy_array.i
pop
generator.while.gcn.334.start:
pushcp generator.while.gcn.334.end
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
word generator.const.gcn.335 1
pushcp generator.const.gcn.335
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
pushcp generator.while.gcn.334.start
jp
generator.while.gcn.334.end:
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
pushcp generator.if.gcn.336.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.337 1
pushcp generator.const.gcn.337
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.338 1
pushcp generator.const.gcn.338
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.336.end
jp
generator.if.gcn.336.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.339 1
pushcp generator.const.gcn.339
push global.arg_counter
mov
jc
jr
generator.if.gcn.336.end:
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
word generator.const.gcn.340 0
pushcp generator.const.gcn.340
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
pushcp generator.if.gcn.341.else
word generator.const.gcn.342 0
pushc generator.const.gcn.342
push max.args
pushc len
word generator.const.gcn.343 1
pushcp generator.const.gcn.343
push global.arg_counter
mov
jc
bg
jz
pop
push max.args
word generator.const.gcn.344 0
pushc generator.const.gcn.344
swp
pushai
peek max.r
pop
@generator.for_each.gcn.345.array
@generator.for_each.gcn.345.i
@generator.for_each.gcn.345.to
push max.args
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
@max.x
peek max.x
pop
pushcp generator.if.gcn.346.else
push max.r
push max.x
bg
jz
pop
push max.x
push max.r
mov
generator.if.gcn.346.else:
generator.for_each.gcn.345.continue:
push generator.for_each.gcn.345.i
inc
pop
pushcp generator.for_each.gcn.345.start
jp
generator.for_each.gcn.345.end:
push max.r
jr
pushcp generator.if.gcn.341.end
jp
generator.if.gcn.341.else:
push null
jr
generator.if.gcn.341.end:
jr
max__end:
pushcp min__end
jp
min:
@min.this
@min.args
@min.r
word generator.const.gcn.347 0
pushcp generator.const.gcn.347
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
pushcp generator.if.gcn.348.else
word generator.const.gcn.349 0
pushc generator.const.gcn.349
push min.args
pushc len
word generator.const.gcn.350 1
pushcp generator.const.gcn.350
push global.arg_counter
mov
jc
bg
jz
pop
push min.args
word generator.const.gcn.351 0
pushc generator.const.gcn.351
swp
pushai
peek min.r
pop
@generator.for_each.gcn.352.array
@generator.for_each.gcn.352.i
@generator.for_each.gcn.352.to
push min.args
peek generator.for_each.gcn.352.array
alen
peek generator.for_each.gcn.352.to
pop
pushc global.zero
peek generator.for_each.gcn.352.i
pop
generator.for_each.gcn.352.start:
pushcp generator.for_each.gcn.352.end
push generator.for_each.gcn.352.i
push generator.for_each.gcn.352.to
eq
not
jz
pop
push generator.for_each.gcn.352.i
push generator.for_each.gcn.352.array
pushai
@min.x
peek min.x
pop
pushcp generator.if.gcn.353.else
push min.r
push min.x
swp
bg
jz
pop
push min.x
push min.r
mov
generator.if.gcn.353.else:
generator.for_each.gcn.352.continue:
push generator.for_each.gcn.352.i
inc
pop
pushcp generator.for_each.gcn.352.start
jp
generator.for_each.gcn.352.end:
push min.r
jr
pushcp generator.if.gcn.348.end
jp
generator.if.gcn.348.else:
push null
jr
generator.if.gcn.348.end:
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
word generator.const.gcn.354 0
pushcp generator.const.gcn.354
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.355 ""
pushc generator.const.gcn.355
peek chr.r
pop
@generator.for_each.gcn.356.array
@generator.for_each.gcn.356.i
@generator.for_each.gcn.356.to
push chr.chars
peek generator.for_each.gcn.356.array
alen
peek generator.for_each.gcn.356.to
pop
pushc global.zero
peek generator.for_each.gcn.356.i
pop
generator.for_each.gcn.356.start:
pushcp generator.for_each.gcn.356.end
push generator.for_each.gcn.356.i
push generator.for_each.gcn.356.to
eq
not
jz
pop
push generator.for_each.gcn.356.i
push generator.for_each.gcn.356.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.357 1
pushcp generator.const.gcn.357
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.356.continue:
push generator.for_each.gcn.356.i
inc
pop
pushcp generator.for_each.gcn.356.start
jp
generator.for_each.gcn.356.end:
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
word generator.const.gcn.359 1
pushcp generator.const.gcn.359
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.360.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.358.end
jp
generator.case.gcn.360.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.361.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.358.end
jp
generator.case.gcn.361.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.362.end
swp
jz
push str.value
pushc f2s
invoke
jr
pushcp generator.switch.gcn.358.end
jp
generator.case.gcn.362.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.363.end
swp
jz
push str.value
jr
pushcp generator.switch.gcn.358.end
jp
generator.case.gcn.363.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.365 "Invalid type cast via str()."
pushc generator.const.gcn.365
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.364 1
pushcp generator.const.gcn.364
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.358.end:
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
word generator.const.gcn.367 1
pushcp generator.const.gcn.367
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.368.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.366.end
jp
generator.case.gcn.368.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.369.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.366.end
jp
generator.case.gcn.369.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.370.end
swp
jz
word generator.const.gcn.371 1
pushc generator.const.gcn.371
push int.value
copy
swp
pop
idiv
jr
pushcp generator.switch.gcn.366.end
jp
generator.case.gcn.370.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.372.end
swp
jz
push int.value
pushc s2i
invoke
jr
pushcp generator.switch.gcn.366.end
jp
generator.case.gcn.372.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.374 "Invalid type cast via int()."
pushc generator.const.gcn.374
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.373 1
pushcp generator.const.gcn.373
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.366.end:
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
word generator.const.gcn.376 1
pushcp generator.const.gcn.376
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.377.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.375.end
jp
generator.case.gcn.377.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.378.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.375.end
jp
generator.case.gcn.378.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.379.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.375.end
jp
generator.case.gcn.379.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.380.end
swp
jz
push real.value
pushc s2f
invoke
jr
pushcp generator.switch.gcn.375.end
jp
generator.case.gcn.380.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.382 "Invalid type cast via int()."
pushc generator.const.gcn.382
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.381 1
pushcp generator.const.gcn.381
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.375.end:
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
pushcp generator.if.gcn.383.else
push check.cond
jz
pop
push check.rtrue
jr
pushcp generator.if.gcn.383.end
jp
generator.if.gcn.383.else:
push check.rfalse
jr
generator.if.gcn.383.end:
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
word generator.const.gcn.384 0
pushc generator.const.gcn.384
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.385 1
pushcp generator.const.gcn.385
newa
peek params
pop
word generator.const.gcn.386 0
pushc generator.const.gcn.386
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.387.start:
pushcp generator.while.gcn.387.end
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
pushcp generator.while.gcn.387.start
jp
generator.while.gcn.387.end:
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
pushcp generator.if.gcn.388.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.388.end
jp
generator.if.gcn.388.else:
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
generator.if.gcn.388.end:
jr
system_makeexception__end:
pushcp main
jc
word __vtable__size__ 76
pushcp __allocator__snake__end
jp
__allocator__snake:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc snake
swp
pushcp vtable__type
swp
peekai
pcopy
pushc snake__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc snake__randfood
swp
pushcp vtable__randfood
swp
peekai
pcopy
pushc snake__movesnake
swp
pushcp vtable__movesnake
swp
peekai
pcopy
pushc snake__gametick
swp
pushcp vtable__gametick
swp
peekai
jr
__allocator__snake__end:
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
pushcp __allocator__vector__end
jp
__allocator__vector:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc vector
swp
pushcp vtable__type
swp
peekai
pcopy
pushc vector__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc vector__push_back
swp
pushcp vtable__push_back
swp
peekai
pcopy
pushc vector__push_first
swp
pushcp vtable__push_first
swp
peekai
pcopy
pushc vector__pop_back
swp
pushcp vtable__pop_back
swp
peekai
pcopy
pushc vector__pop_first
swp
pushcp vtable__pop_first
swp
peekai
pcopy
pushc vector__peek_back
swp
pushcp vtable__peek_back
swp
peekai
pcopy
pushc vector__peek_first
swp
pushcp vtable__peek_first
swp
peekai
pcopy
pushc vector__rem_first
swp
pushcp vtable__rem_first
swp
peekai
pcopy
pushc vector__rem_back
swp
pushcp vtable__rem_back
swp
peekai
pcopy
pushc vector__get
swp
pushcp vtable__get
swp
peekai
pcopy
pushc vector__size
swp
pushcp vtable__size
swp
peekai
jr
__allocator__vector__end:
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