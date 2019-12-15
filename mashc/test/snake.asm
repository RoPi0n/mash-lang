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
word vtable__body 1
word vtable__movingvector 2
word vtable__items 3
word vtable__size 4
word vtable__x 5
word vtable__y 6
word vtable__z 7
word vtable__classname 8
word vtable__message 9
word vtable__create 10
word vtable__normvideo 11
word vtable__wherex 12
word vtable__wherey 13
word vtable__pause 14
word vtable__cursorbig 15
word vtable__cursoroff 16
word vtable__cursoron 17
word vtable__delline 18
word vtable__gotoxy 19
word vtable__insline 20
word vtable__keypressed 21
word vtable__readkey 22
word vtable__sound 23
word vtable__window32 24
word vtable__clreol 25
word vtable__clrscr 26
word vtable__getdirectvideo 27
word vtable__getlastmode 28
word vtable__settextattr 29
word vtable__gettextattr 30
word vtable__getwindmax 31
word vtable__getwindmaxx 32
word vtable__getwindmaxy 33
word vtable__getwindmin 34
word vtable__getwindminx 35
word vtable__getwindminy 36
word vtable__getcheckbreak 37
word vtable__getcheckeof 38
word vtable__getchecksnow 39
word vtable__textcolor 40
word vtable__textbackground 41
word vtable__push_back 42
word vtable__push_first 43
word vtable__pop_back 44
word vtable__pop_first 45
word vtable__peek_back 46
word vtable__peek_first 47
word vtable__rem_first 48
word vtable__rem_back 49
word vtable__get 50
word vtable__set 51
word vtable__compare 52
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
@vectors
@snk
@food
@score
@sleeptime
@gameover
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
word exception 5
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
word generator.const.gcn.5 4
pushcp generator.const.gcn.5
word generator.const.gcn.6 1
pushcp generator.const.gcn.6
newa
pcopy
word generator.const.gcn.11 2
pushcp generator.const.gcn.11
word generator.const.gcn.12 1
pushcp generator.const.gcn.12
newa
pcopy
word generator.const.gcn.15 1
pushc generator.const.gcn.15
copy
swp
pop
neg
swp
word generator.const.gcn.13 0
pushcp generator.const.gcn.13
swp
peekai
pcopy
word generator.const.gcn.16 0
pushc generator.const.gcn.16
swp
word generator.const.gcn.14 1
pushcp generator.const.gcn.14
swp
peekai
swp
word generator.const.gcn.7 0
pushcp generator.const.gcn.7
swp
peekai
pcopy
word generator.const.gcn.17 2
pushcp generator.const.gcn.17
word generator.const.gcn.18 1
pushcp generator.const.gcn.18
newa
pcopy
word generator.const.gcn.21 1
pushc generator.const.gcn.21
swp
word generator.const.gcn.19 0
pushcp generator.const.gcn.19
swp
peekai
pcopy
word generator.const.gcn.22 0
pushc generator.const.gcn.22
swp
word generator.const.gcn.20 1
pushcp generator.const.gcn.20
swp
peekai
swp
word generator.const.gcn.8 1
pushcp generator.const.gcn.8
swp
peekai
pcopy
word generator.const.gcn.23 2
pushcp generator.const.gcn.23
word generator.const.gcn.24 1
pushcp generator.const.gcn.24
newa
pcopy
word generator.const.gcn.27 0
pushc generator.const.gcn.27
swp
word generator.const.gcn.25 0
pushcp generator.const.gcn.25
swp
peekai
pcopy
word generator.const.gcn.28 1
pushc generator.const.gcn.28
copy
swp
pop
neg
swp
word generator.const.gcn.26 1
pushcp generator.const.gcn.26
swp
peekai
swp
word generator.const.gcn.9 2
pushcp generator.const.gcn.9
swp
peekai
pcopy
word generator.const.gcn.29 2
pushcp generator.const.gcn.29
word generator.const.gcn.30 1
pushcp generator.const.gcn.30
newa
pcopy
word generator.const.gcn.33 0
pushc generator.const.gcn.33
swp
word generator.const.gcn.31 0
pushcp generator.const.gcn.31
swp
peekai
pcopy
word generator.const.gcn.34 1
pushc generator.const.gcn.34
swp
word generator.const.gcn.32 1
pushcp generator.const.gcn.32
swp
peekai
swp
word generator.const.gcn.10 3
pushcp generator.const.gcn.10
swp
peekai
peek vectors
pop
pushcp __allocator__snake
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.35 0
pushcp generator.const.gcn.35
push global.arg_counter
mov
jc
peek snk
pop
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.37 2
pushc generator.const.gcn.37
word generator.const.gcn.38 19
pushc generator.const.gcn.38
pushc randomto
invoke
copy
swp
pop
add
swp
word generator.const.gcn.39 2
pushc generator.const.gcn.39
word generator.const.gcn.40 39
pushc generator.const.gcn.40
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
word generator.const.gcn.36 2
pushcp generator.const.gcn.36
push global.arg_counter
mov
jc
peek food
pop
word generator.const.gcn.41 0
pushc generator.const.gcn.41
peek score
pop
word generator.const.gcn.42 100
pushc generator.const.gcn.42
peek sleeptime
pop
pushc false
peek gameover
pop
pushcp __init__end__
jp
__init__:
pushc getsystemslash
invoke
peek sysslash
pop
pushc __getvm_null__
word generator.const.gcn.43 0
pushcp generator.const.gcn.43
push global.arg_counter
mov
jc
peek null
pop
push null
peek params
pop
pushc __initproc__
word generator.const.gcn.44 0
pushcp generator.const.gcn.44
push global.arg_counter
mov
jc
jr
__init__end__:
word generator.const.gcn.45 5
pushcp generator.const.gcn.45
word generator.const.gcn.46 1
pushcp generator.const.gcn.46
newa
pcopy
pushc eraisedexception
swp
word generator.const.gcn.47 0
pushcp generator.const.gcn.47
swp
peekai
pcopy
pushc einvalidvmop
swp
word generator.const.gcn.48 1
pushcp generator.const.gcn.48
swp
peekai
pcopy
pushc einvalidtypecast
swp
word generator.const.gcn.49 2
pushcp generator.const.gcn.49
swp
peekai
pcopy
pushc eabstracterror
swp
word generator.const.gcn.50 3
pushcp generator.const.gcn.50
swp
peekai
pcopy
pushc eunknownexception
swp
word generator.const.gcn.51 4
pushcp generator.const.gcn.51
swp
peekai
peek eabstractexception
pop
word generator.const.gcn.52 9
pushcp generator.const.gcn.52
word generator.const.gcn.53 1
pushcp generator.const.gcn.53
newa
pcopy
pushc einterror
swp
word generator.const.gcn.54 0
pushcp generator.const.gcn.54
swp
peekai
pcopy
pushc edivbyzero
swp
word generator.const.gcn.55 1
pushcp generator.const.gcn.55
swp
peekai
pcopy
pushc erangeerror
swp
word generator.const.gcn.56 2
pushcp generator.const.gcn.56
swp
peekai
pcopy
pushc eintoverflow
swp
word generator.const.gcn.57 3
pushcp generator.const.gcn.57
swp
peekai
pcopy
pushc ematherror
swp
word generator.const.gcn.58 4
pushcp generator.const.gcn.58
swp
peekai
pcopy
pushc einvalidop
swp
word generator.const.gcn.59 5
pushcp generator.const.gcn.59
swp
peekai
pcopy
pushc ezerodivide
swp
word generator.const.gcn.60 6
pushcp generator.const.gcn.60
swp
peekai
pcopy
pushc eoverflow
swp
word generator.const.gcn.61 7
pushcp generator.const.gcn.61
swp
peekai
pcopy
pushc eunderflow
swp
word generator.const.gcn.62 8
pushcp generator.const.gcn.62
swp
peekai
peek emathexception
pop
word generator.const.gcn.63 3
pushcp generator.const.gcn.63
word generator.const.gcn.64 1
pushcp generator.const.gcn.64
newa
pcopy
pushc eaccessviolation
swp
word generator.const.gcn.65 0
pushcp generator.const.gcn.65
swp
peekai
pcopy
pushc eoserror
swp
word generator.const.gcn.66 1
pushcp generator.const.gcn.66
swp
peekai
pcopy
pushc enothreadsupport
swp
word generator.const.gcn.67 2
pushcp generator.const.gcn.67
swp
peekai
peek ecriticalexception
pop
str generator.const.gcn.69 "Unknown raised exception."
pushc generator.const.gcn.69
pushc eunknownexception
pushc system_makeexception
word generator.const.gcn.68 2
pushcp generator.const.gcn.68
push global.arg_counter
mov
jc
peek eunknown
pop
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
word generator.const.gcn.70 0
pushcp generator.const.gcn.70
push global.arg_counter
mov
jc
push snake__create.this
peek global.this
pushc vtable__body
swp
peekai
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.73 10
pushc generator.const.gcn.73
swp
word generator.const.gcn.74 10
pushc generator.const.gcn.74
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.72 2
pushcp generator.const.gcn.72
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
word generator.const.gcn.71 1
pushcp generator.const.gcn.71
push global.arg_counter
mov
jc
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.77 10
pushc generator.const.gcn.77
swp
word generator.const.gcn.78 11
pushc generator.const.gcn.78
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.76 2
pushcp generator.const.gcn.76
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
word generator.const.gcn.75 1
pushcp generator.const.gcn.75
push global.arg_counter
mov
jc
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.81 10
pushc generator.const.gcn.81
swp
word generator.const.gcn.82 12
pushc generator.const.gcn.82
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.80 2
pushcp generator.const.gcn.80
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
word generator.const.gcn.79 1
pushcp generator.const.gcn.79
push global.arg_counter
mov
jc
pushc smvright
push snake__create.this
peek global.this
pushc vtable__movingvector
swp
peekai
jr
snake__create__end:
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
word generator.const.gcn.83 2
pushcp generator.const.gcn.83
push global.arg_counter
mov
jc
push putch.char
pushc print
word generator.const.gcn.84 1
pushcp generator.const.gcn.84
push global.arg_counter
mov
jc
jr
putch__end:
pushcp drawborders__end
jp
drawborders:
@drawborders.this
@generator.for_each.gcn.85.array
@generator.for_each.gcn.85.i
@generator.for_each.gcn.85.to
word generator.const.gcn.86 22
pushc generator.const.gcn.86
word generator.const.gcn.87 1
pushc generator.const.gcn.87
pushcp system_op_range
jc
peek generator.for_each.gcn.85.array
alen
peek generator.for_each.gcn.85.to
pop
pushc global.zero
peek generator.for_each.gcn.85.i
pop
generator.for_each.gcn.85.start:
pushcp generator.for_each.gcn.85.end
push generator.for_each.gcn.85.i
push generator.for_each.gcn.85.to
eq
not
jz
pop
push generator.for_each.gcn.85.i
push generator.for_each.gcn.85.array
pushai
@drawborders.y
peek drawborders.y
pop
pushc border_char
push drawborders.y
word generator.const.gcn.89 1
pushc generator.const.gcn.89
pushc putch
word generator.const.gcn.88 3
pushcp generator.const.gcn.88
push global.arg_counter
mov
jc
pushc border_char
push drawborders.y
word generator.const.gcn.91 42
pushc generator.const.gcn.91
pushc putch
word generator.const.gcn.90 3
pushcp generator.const.gcn.90
push global.arg_counter
mov
jc
generator.for_each.gcn.85.continue:
push generator.for_each.gcn.85.i
inc
pop
pushcp generator.for_each.gcn.85.start
jp
generator.for_each.gcn.85.end:
@generator.for_each.gcn.92.array
@generator.for_each.gcn.92.i
@generator.for_each.gcn.92.to
word generator.const.gcn.93 42
pushc generator.const.gcn.93
word generator.const.gcn.94 1
pushc generator.const.gcn.94
pushcp system_op_range
jc
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
@drawborders.x
peek drawborders.x
pop
pushc border_char
word generator.const.gcn.96 1
pushc generator.const.gcn.96
push drawborders.x
pushc putch
word generator.const.gcn.95 3
pushcp generator.const.gcn.95
push global.arg_counter
mov
jc
pushc border_char
word generator.const.gcn.98 22
pushc generator.const.gcn.98
push drawborders.x
pushc putch
word generator.const.gcn.97 3
pushcp generator.const.gcn.97
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
jr
drawborders__end:
pushcp randfood__end
jp
randfood:
@randfood.this
@randfood.i
word generator.const.gcn.100 2
pushc generator.const.gcn.100
word generator.const.gcn.101 19
pushc generator.const.gcn.101
pushc randomto
invoke
copy
swp
pop
add
word generator.const.gcn.102 2
pushc generator.const.gcn.102
word generator.const.gcn.103 39
pushc generator.const.gcn.103
pushc randomto
invoke
copy
swp
pop
add
push food
peek global.this
pushc vtable__set
swp
pushai
word generator.const.gcn.99 2
pushcp generator.const.gcn.99
push global.arg_counter
mov
jc
word generator.const.gcn.104 0
pushc generator.const.gcn.104
peek randfood.i
pop
generator.while.gcn.105.start:
pushcp generator.while.gcn.105.end
push snk
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__size
swp
pushai
word generator.const.gcn.106 0
pushcp generator.const.gcn.106
push global.arg_counter
mov
jc
push randfood.i
swp
bg
jz
pop
pushcp generator.if.gcn.107.else
push snk
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
push randfood.i
swp
pushai
peek global.this
pushc vtable__y
swp
pushai
push food
peek global.this
pushc vtable__y
swp
pushai
eq
push snk
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
push randfood.i
swp
pushai
peek global.this
pushc vtable__x
swp
pushai
push food
peek global.this
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
pushc randfood
word generator.const.gcn.108 0
pushcp generator.const.gcn.108
push global.arg_counter
mov
jc
pushcp generator.while.gcn.105.end
jp
generator.if.gcn.107.else:
push randfood.i
inc
pop
pushcp generator.while.gcn.105.start
jp
generator.while.gcn.105.end:
jr
randfood__end:
pushcp movesnake__end
jp
movesnake:
@movesnake.this
@movesnake.x
@movesnake.y
@movesnake.head
@movesnake.newhead
@movesnake.foodeaten
peek movesnake.x
pop
peek movesnake.y
pop
push snk
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__peek_back
swp
pushai
word generator.const.gcn.109 0
pushcp generator.const.gcn.109
push global.arg_counter
mov
jc
peek movesnake.head
pop
pushcp __allocator__point
jc
pcopy
peek global.this
push movesnake.y
push movesnake.head
peek global.this
pushc vtable__y
swp
pushai
copy
swp
pop
add
swp
push movesnake.x
push movesnake.head
peek global.this
pushc vtable__x
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
word generator.const.gcn.110 2
pushcp generator.const.gcn.110
push global.arg_counter
mov
jc
peek movesnake.newhead
pop
word generator.const.gcn.111 0
pushc generator.const.gcn.111
push food
peek global.this
pushc vtable__x
swp
pushai
eq
peek movesnake.foodeaten
pop
jr
movesnake__end:
pushcp gametick__end
jp
gametick:
@gametick.this
push vectors
push snk
peek global.this
pushc vtable__movingvector
swp
pushai
swp
pushai
word generator.const.gcn.113 1
pushc generator.const.gcn.113
swp
pushai
push vectors
push snk
peek global.this
pushc vtable__movingvector
swp
pushai
swp
pushai
word generator.const.gcn.114 0
pushc generator.const.gcn.114
swp
pushai
pushc movesnake
word generator.const.gcn.112 2
pushcp generator.const.gcn.112
push global.arg_counter
mov
jc
jr
gametick__end:
pushcp controlthread__end
jp
controlthread:
@controlthread.this
@controlthread.k
generator.while.gcn.115.start:
pushcp generator.while.gcn.115.end
push gameover
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
word generator.const.gcn.116 0
pushcp generator.const.gcn.116
push global.arg_counter
mov
jc
pushc strupper
invoke
peek controlthread.k
pop
pushcp generator.if.gcn.117.else
word generator.const.gcn.118 2
pushcp generator.const.gcn.118
word generator.const.gcn.119 1
pushcp generator.const.gcn.119
newa
pcopy
pushc smvleft
swp
word generator.const.gcn.120 0
pushcp generator.const.gcn.120
swp
peekai
pcopy
pushc smvright
swp
word generator.const.gcn.121 1
pushcp generator.const.gcn.121
swp
peekai
push snk
peek global.this
pushc vtable__movingvector
swp
pushai
pushcp system_op_in
jc
jz
pop
push controlthread.k
pcopy
str generator.const.gcn.124 "W"
pushc generator.const.gcn.124
eq
pushcp generator.case.gcn.123.end
swp
jz
pushc smvup
push snk
peek global.this
pushc vtable__movingvector
swp
pushai
mov
pushcp generator.switch.gcn.122.end
jp
generator.case.gcn.123.end:
pcopy
str generator.const.gcn.126 "S"
pushc generator.const.gcn.126
eq
pushcp generator.case.gcn.125.end
swp
jz
pushc smvdown
push snk
peek global.this
pushc vtable__movingvector
swp
pushai
mov
pushcp generator.switch.gcn.122.end
jp
generator.case.gcn.125.end:
generator.switch.gcn.122.end:
generator.if.gcn.117.else:
pushcp generator.if.gcn.127.else
word generator.const.gcn.128 2
pushcp generator.const.gcn.128
word generator.const.gcn.129 1
pushcp generator.const.gcn.129
newa
pcopy
pushc smvup
swp
word generator.const.gcn.130 0
pushcp generator.const.gcn.130
swp
peekai
pcopy
pushc smvdown
swp
word generator.const.gcn.131 1
pushcp generator.const.gcn.131
swp
peekai
push snk
peek global.this
pushc vtable__movingvector
swp
pushai
pushcp system_op_in
jc
jz
pop
push controlthread.k
pcopy
str generator.const.gcn.134 "A"
pushc generator.const.gcn.134
eq
pushcp generator.case.gcn.133.end
swp
jz
pushc smvleft
push snk
peek global.this
pushc vtable__movingvector
swp
pushai
mov
pushcp generator.switch.gcn.132.end
jp
generator.case.gcn.133.end:
pcopy
str generator.const.gcn.136 "D"
pushc generator.const.gcn.136
eq
pushcp generator.case.gcn.135.end
swp
jz
pushc smvright
push snk
peek global.this
pushc vtable__movingvector
swp
pushai
mov
pushcp generator.switch.gcn.132.end
jp
generator.case.gcn.135.end:
generator.switch.gcn.132.end:
generator.if.gcn.127.else:
word generator.const.gcn.137 100
pushc generator.const.gcn.137
pushc sleep
invoke
pushc gc
word generator.const.gcn.138 0
pushcp generator.const.gcn.138
push global.arg_counter
mov
jc
pushcp generator.while.gcn.115.start
jp
generator.while.gcn.115.end:
jr
controlthread__end:
pushcp rungame__end
jp
rungame:
@rungame.this
pushc randomize
invoke
pushc false
peek gameover
pop
word generator.const.gcn.139 0
pushc generator.const.gcn.139
peek score
pop
word generator.const.gcn.140 80
pushc generator.const.gcn.140
peek sleeptime
pop
pushc crt_white
push structure_instance_crt
peek global.this
pushc vtable__textbackground
swp
pushai
word generator.const.gcn.141 1
pushcp generator.const.gcn.141
push global.arg_counter
mov
jc
push structure_instance_crt
peek global.this
pushc vtable__clrscr
swp
pushai
word generator.const.gcn.142 0
pushcp generator.const.gcn.142
push global.arg_counter
mov
jc
pushc crt_black
push structure_instance_crt
peek global.this
pushc vtable__textcolor
swp
pushai
word generator.const.gcn.143 1
pushcp generator.const.gcn.143
push global.arg_counter
mov
jc
pushc crt_black
push structure_instance_crt
peek global.this
pushc vtable__textbackground
swp
pushai
word generator.const.gcn.144 1
pushcp generator.const.gcn.144
push global.arg_counter
mov
jc
pushc drawborders
word generator.const.gcn.145 0
pushcp generator.const.gcn.145
push global.arg_counter
mov
jc
pushc crt_white
push structure_instance_crt
peek global.this
pushc vtable__textbackground
swp
pushai
word generator.const.gcn.146 1
pushcp generator.const.gcn.146
push global.arg_counter
mov
jc
pushc snake_char
push snk
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.148 0
pushc generator.const.gcn.148
swp
pushai
peek global.this
pushc vtable__y
swp
pushai
push snk
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.149 0
pushc generator.const.gcn.149
swp
pushai
peek global.this
pushc vtable__x
swp
pushai
pushc putch
word generator.const.gcn.147 3
pushcp generator.const.gcn.147
push global.arg_counter
mov
jc
pushc snake_char
push snk
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.151 1
pushc generator.const.gcn.151
swp
pushai
peek global.this
pushc vtable__y
swp
pushai
push snk
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.152 1
pushc generator.const.gcn.152
swp
pushai
peek global.this
pushc vtable__x
swp
pushai
pushc putch
word generator.const.gcn.150 3
pushcp generator.const.gcn.150
push global.arg_counter
mov
jc
pushc snake_char
push snk
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.154 2
pushc generator.const.gcn.154
swp
pushai
peek global.this
pushc vtable__y
swp
pushai
push snk
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.155 2
pushc generator.const.gcn.155
swp
pushai
peek global.this
pushc vtable__x
swp
pushai
pushc putch
word generator.const.gcn.153 3
pushcp generator.const.gcn.153
push global.arg_counter
mov
jc
pushc food_char
push food
peek global.this
pushc vtable__y
swp
pushai
push food
peek global.this
pushc vtable__x
swp
pushai
pushc putch
word generator.const.gcn.156 3
pushcp generator.const.gcn.156
push global.arg_counter
mov
jc
str generator.const.gcn.158 "[MASH LANG!]"
pushc generator.const.gcn.158
word generator.const.gcn.159 10
pushc generator.const.gcn.159
word generator.const.gcn.160 46
pushc generator.const.gcn.160
pushc putch
word generator.const.gcn.157 3
pushcp generator.const.gcn.157
push global.arg_counter
mov
jc
str generator.const.gcn.162 "[SNAKE]"
pushc generator.const.gcn.162
word generator.const.gcn.163 11
pushc generator.const.gcn.163
word generator.const.gcn.164 46
pushc generator.const.gcn.164
pushc putch
word generator.const.gcn.161 3
pushcp generator.const.gcn.161
push global.arg_counter
mov
jc
str generator.const.gcn.166 "Score: 0"
pushc generator.const.gcn.166
word generator.const.gcn.167 13
pushc generator.const.gcn.167
word generator.const.gcn.168 46
pushc generator.const.gcn.168
pushc putch
word generator.const.gcn.165 3
pushcp generator.const.gcn.165
push global.arg_counter
mov
jc
generator.while.gcn.169.start:
pushcp generator.while.gcn.169.end
push gameover
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
word generator.const.gcn.170 0
pushcp generator.const.gcn.170
push global.arg_counter
mov
jc
push sleeptime
pushc sleep
invoke
pushc gametick
word generator.const.gcn.171 0
pushcp generator.const.gcn.171
push global.arg_counter
mov
jc
pushc gc
word generator.const.gcn.172 0
pushcp generator.const.gcn.172
push global.arg_counter
mov
jc
pushcp generator.while.gcn.169.start
jp
generator.while.gcn.169.end:
pushc crt_white
push structure_instance_crt
peek global.this
pushc vtable__textcolor
swp
pushai
word generator.const.gcn.173 1
pushcp generator.const.gcn.173
push global.arg_counter
mov
jc
pushc crt_black
push structure_instance_crt
peek global.this
pushc vtable__textbackground
swp
pushai
word generator.const.gcn.174 1
pushcp generator.const.gcn.174
push global.arg_counter
mov
jc
push structure_instance_crt
peek global.this
pushc vtable__clrscr
swp
pushai
word generator.const.gcn.175 0
pushcp generator.const.gcn.175
push global.arg_counter
mov
jc
push structure_instance_crt
peek global.this
pushc vtable__cursoron
swp
pushai
word generator.const.gcn.176 0
pushcp generator.const.gcn.176
push global.arg_counter
mov
jc
str generator.const.gcn.178 "Game over!"
pushc generator.const.gcn.178
word generator.const.gcn.179 1
pushc generator.const.gcn.179
word generator.const.gcn.180 1
pushc generator.const.gcn.180
pushc putch
word generator.const.gcn.177 3
pushcp generator.const.gcn.177
push global.arg_counter
mov
jc
str generator.const.gcn.182 ""
pushc generator.const.gcn.182
push score
str generator.const.gcn.183 "Score: "
pushc generator.const.gcn.183
copy
swp
pop
add
copy
swp
pop
add
word generator.const.gcn.184 2
pushc generator.const.gcn.184
word generator.const.gcn.185 1
pushc generator.const.gcn.185
pushc putch
word generator.const.gcn.181 3
pushcp generator.const.gcn.181
push global.arg_counter
mov
jc
push structure_instance_crt
peek global.this
pushc vtable__readkey
swp
pushai
word generator.const.gcn.186 0
pushcp generator.const.gcn.186
push global.arg_counter
mov
jc
jr
rungame__end:
pushcp main__end
jp
main:
@main.this
generator.while.gcn.187.start:
pushcp generator.while.gcn.187.end
pushc true
jz
pop
pushc rungame
word generator.const.gcn.188 0
pushcp generator.const.gcn.188
push global.arg_counter
mov
jc
pushc gc
word generator.const.gcn.189 0
pushcp generator.const.gcn.189
push global.arg_counter
mov
jc
pushcp generator.while.gcn.187.start
jp
generator.while.gcn.187.end:
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
str generator.const.gcn.190 "["
pushc generator.const.gcn.190
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.191 1
pushcp generator.const.gcn.191
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.192 0
pushc generator.const.gcn.192
peek __printarray.i
pop
generator.while.gcn.193.start:
pushcp generator.while.gcn.193.end
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
word generator.const.gcn.194 1
pushcp generator.const.gcn.194
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
pushcp generator.if.gcn.195.else
push __printarray.l
word generator.const.gcn.196 1
pushc generator.const.gcn.196
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.197 ", "
pushc generator.const.gcn.197
pushc _print
invoke
generator.if.gcn.195.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.193.start
jp
generator.while.gcn.193.end:
str generator.const.gcn.198 "]"
pushc generator.const.gcn.198
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
word generator.const.gcn.200 1
pushcp generator.const.gcn.200
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.201.end
swp
jz
str generator.const.gcn.202 "(null)"
pushc generator.const.gcn.202
pushc _print
invoke
pushcp generator.switch.gcn.199.end
jp
generator.case.gcn.201.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.203.end
swp
jz
pushcp generator.if.gcn.204.else
pushc exception
push __print.obj
peek global.this
pushc vtable__type
swp
pushai
eq
jz
pop
str generator.const.gcn.205 "'."
pushc generator.const.gcn.205
push __print.obj
peek global.this
pushc vtable__message
swp
pushai
str generator.const.gcn.206 "> with message: '"
pushc generator.const.gcn.206
push __print.obj
peek global.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.207 "Exception <"
pushc generator.const.gcn.207
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
pushcp generator.if.gcn.204.end
jp
generator.if.gcn.204.else:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.209 "I/O exception: invalid object type for output"
pushc generator.const.gcn.209
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.208 1
pushcp generator.const.gcn.208
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.if.gcn.204.end:
pushcp generator.switch.gcn.199.end
jp
generator.case.gcn.203.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.210.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.211 1
pushcp generator.const.gcn.211
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.199.end
jp
generator.case.gcn.210.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.199.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.212 0
pushcp generator.const.gcn.212
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.213.array
@generator.for_each.gcn.213.i
@generator.for_each.gcn.213.to
push print.args
peek generator.for_each.gcn.213.array
alen
peek generator.for_each.gcn.213.to
pop
pushc global.zero
peek generator.for_each.gcn.213.i
pop
generator.for_each.gcn.213.start:
pushcp generator.for_each.gcn.213.end
push generator.for_each.gcn.213.i
push generator.for_each.gcn.213.to
eq
not
jz
pop
push generator.for_each.gcn.213.i
push generator.for_each.gcn.213.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.214 1
pushcp generator.const.gcn.214
push global.arg_counter
mov
jc
generator.for_each.gcn.213.continue:
push generator.for_each.gcn.213.i
inc
pop
pushcp generator.for_each.gcn.213.start
jp
generator.for_each.gcn.213.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.215 0
pushcp generator.const.gcn.215
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.216.array
@generator.for_each.gcn.216.i
@generator.for_each.gcn.216.to
push println.args
peek generator.for_each.gcn.216.array
alen
peek generator.for_each.gcn.216.to
pop
pushc global.zero
peek generator.for_each.gcn.216.i
pop
generator.for_each.gcn.216.start:
pushcp generator.for_each.gcn.216.end
push generator.for_each.gcn.216.i
push generator.for_each.gcn.216.to
eq
not
jz
pop
push generator.for_each.gcn.216.i
push generator.for_each.gcn.216.array
pushai
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.217 1
pushcp generator.const.gcn.217
push global.arg_counter
mov
jc
generator.for_each.gcn.216.continue:
push generator.for_each.gcn.216.i
inc
pop
pushcp generator.for_each.gcn.216.start
jp
generator.for_each.gcn.216.end:
str generator.const.gcn.218 ""
pushc generator.const.gcn.218
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
word generator.const.gcn.219 7
pushc generator.const.gcn.219
pushc crt_textcolor
invoke
word generator.const.gcn.220 0
pushc generator.const.gcn.220
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
word generator.const.gcn.221 256
pushc generator.const.gcn.221
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
word generator.const.gcn.222 256
pushc generator.const.gcn.222
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
word generator.const.gcn.224 0
pushc generator.const.gcn.224
word generator.const.gcn.223 1
pushcp generator.const.gcn.223
newa
push vector__create.this
peek global.this
pushc vtable__items
swp
peekai
word generator.const.gcn.225 0
pushc generator.const.gcn.225
push vector__create.this
peek global.this
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
word generator.const.gcn.227 1
pushc generator.const.gcn.227
push vector__push_back.this
peek global.this
pushc vtable__size
swp
pushai
copy
swp
pop
add
push vector__push_back.this
peek global.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.226 2
pushcp generator.const.gcn.226
push global.arg_counter
mov
jc
push vector__push_back.object
push vector__push_back.this
peek global.this
pushc vtable__items
swp
pushai
push vector__push_back.this
peek global.this
pushc vtable__size
swp
pushai
swp
peekai
push vector__push_back.this
peek global.this
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
pushcp generator.if.gcn.228.else
word generator.const.gcn.229 0
pushc generator.const.gcn.229
push vector__push_first.this
peek global.this
pushc vtable__size
swp
pushai
bg
jz
pop
word generator.const.gcn.231 1
pushc generator.const.gcn.231
push vector__push_first.this
peek global.this
pushc vtable__size
swp
pushai
copy
swp
pop
add
push vector__push_first.this
peek global.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.230 2
pushcp generator.const.gcn.230
push global.arg_counter
mov
jc
@generator.for_each.gcn.232.array
@generator.for_each.gcn.232.i
@generator.for_each.gcn.232.to
word generator.const.gcn.233 1
pushc generator.const.gcn.233
push vector__push_first.this
peek global.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
word generator.const.gcn.234 0
pushc generator.const.gcn.234
pushcp system_op_range
jc
peek generator.for_each.gcn.232.array
alen
peek generator.for_each.gcn.232.i
dec
pop
pushc global.zero
peek generator.for_each.gcn.232.to
dec
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
@vector__push_first.i
peek vector__push_first.i
pop
push vector__push_first.this
peek global.this
pushc vtable__items
swp
pushai
push vector__push_first.i
swp
pushai
push vector__push_first.this
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.235 1
pushc generator.const.gcn.235
push vector__push_first.i
copy
swp
pop
add
swp
peekai
generator.for_each.gcn.232.continue:
push generator.for_each.gcn.232.i
dec
pop
pushcp generator.for_each.gcn.232.start
jp
generator.for_each.gcn.232.end:
push vector__push_first.this
peek global.this
pushc vtable__size
swp
pushai
inc
pop
push vector__push_first.object
push vector__push_first.this
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.236 0
pushc generator.const.gcn.236
swp
peekai
pushcp generator.if.gcn.228.end
jp
generator.if.gcn.228.else:
push vector__push_first.object
push vector__push_first.this
peek global.this
pushc vtable__push_back
swp
pushai
word generator.const.gcn.237 1
pushcp generator.const.gcn.237
push global.arg_counter
mov
jc
generator.if.gcn.228.end:
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
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.238 1
pushc generator.const.gcn.238
push vector__pop_back.this
peek global.this
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
word generator.const.gcn.240 1
pushc generator.const.gcn.240
push vector__pop_back.this
peek global.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
push vector__pop_back.this
peek global.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.239 2
pushcp generator.const.gcn.239
push global.arg_counter
mov
jc
push vector__pop_back.this
peek global.this
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
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.241 0
pushc generator.const.gcn.241
swp
pushai
peek vector__pop_first.r
pop
push vector__pop_first.this
peek global.this
pushc vtable__rem_first
swp
pushai
word generator.const.gcn.242 0
pushcp generator.const.gcn.242
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
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.243 1
pushc generator.const.gcn.243
push vector__peek_back.this
peek global.this
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
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.244 0
pushc generator.const.gcn.244
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
word generator.const.gcn.245 1
pushc generator.const.gcn.245
peek vector__rem_first.i
pop
generator.while.gcn.246.start:
pushcp generator.while.gcn.246.end
word generator.const.gcn.247 1
pushc generator.const.gcn.247
push vector__rem_first.this
peek global.this
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
peek global.this
pushc vtable__items
swp
pushai
word generator.const.gcn.248 1
pushc generator.const.gcn.248
push vector__rem_first.i
copy
swp
pop
add
swp
pushai
push vector__rem_first.this
peek global.this
pushc vtable__items
swp
pushai
push vector__rem_first.i
swp
peekai
push vector__rem_first.i
inc
pop
pushcp generator.while.gcn.246.start
jp
generator.while.gcn.246.end:
word generator.const.gcn.250 1
pushc generator.const.gcn.250
push vector__rem_first.this
peek global.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
push vector__rem_first.this
peek global.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.249 2
pushcp generator.const.gcn.249
push global.arg_counter
mov
jc
push vector__rem_first.this
peek global.this
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
peek global.this
pushc vtable__size
swp
pushai
dec
pop
push vector__rem_back.this
peek global.this
pushc vtable__size
swp
pushai
push vector__rem_back.this
peek global.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.251 2
pushcp generator.const.gcn.251
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
peek global.this
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
peek global.this
pushc vtable__size
swp
pushai
pushc copy
word generator.const.gcn.252 1
pushcp generator.const.gcn.252
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
push point__create.this
peek global.this
pushc vtable__x
swp
peekai
push point__create.y
push point__create.this
peek global.this
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
peek global.this
pushc vtable__x
swp
pushai
mov
push point__set.y
push point__set.this
peek global.this
pushc vtable__y
swp
pushai
mov
jr
point__set__end:
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
peek global.this
pushc vtable__y
swp
pushai
push point__compare.this
peek global.this
pushc vtable__y
swp
pushai
eq
push point__compare.p
peek global.this
pushc vtable__x
swp
pushai
push point__compare.this
peek global.this
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
peek global.this
pushc vtable__x
swp
peekai
push point3d__create.y
push point3d__create.this
peek global.this
pushc vtable__y
swp
peekai
push point3d__create.z
push point3d__create.this
peek global.this
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
peek global.this
pushc vtable__x
swp
pushai
mov
push point3d__set.y
push point3d__set.this
peek global.this
pushc vtable__y
swp
pushai
mov
push point3d__set.z
push point3d__set.this
peek global.this
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
peek global.this
pushc vtable__z
swp
pushai
push point3d__compare.this
peek global.this
pushc vtable__z
swp
pushai
eq
push point3d__compare.p
peek global.this
pushc vtable__y
swp
pushai
push point3d__compare.this
peek global.this
pushc vtable__y
swp
pushai
eq
push point3d__compare.p
peek global.this
pushc vtable__x
swp
pushai
push point3d__compare.this
peek global.this
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
pushcp generator.if.gcn.253.else
push system_op_range.isback
jz
pop
word generator.const.gcn.254 1
pushc generator.const.gcn.254
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
pushcp generator.if.gcn.253.end
jp
generator.if.gcn.253.else:
word generator.const.gcn.255 1
pushc generator.const.gcn.255
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
generator.if.gcn.253.end:
push system_op_range.l
word generator.const.gcn.256 1
pushcp generator.const.gcn.256
newa
peek system_op_range.res
pop
word generator.const.gcn.257 0
pushc generator.const.gcn.257
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.258 1
pushcp generator.const.gcn.258
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.259.start:
pushcp generator.while.gcn.259.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.260 1
pushcp generator.const.gcn.260
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
pushcp generator.if.gcn.261.else
push system_op_range.isback
jz
pop
word generator.const.gcn.262 1
pushc generator.const.gcn.262
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.261.end
jp
generator.if.gcn.261.else:
word generator.const.gcn.263 1
pushc generator.const.gcn.263
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.261.end:
pushcp generator.while.gcn.259.start
jp
generator.while.gcn.259.end:
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
@generator.for_each.gcn.264.array
@generator.for_each.gcn.264.i
@generator.for_each.gcn.264.to
push system_op_in.right
peek generator.for_each.gcn.264.array
alen
peek generator.for_each.gcn.264.to
pop
pushc global.zero
peek generator.for_each.gcn.264.i
pop
generator.for_each.gcn.264.start:
pushcp generator.for_each.gcn.264.end
push generator.for_each.gcn.264.i
push generator.for_each.gcn.264.to
eq
not
jz
pop
push generator.for_each.gcn.264.i
push generator.for_each.gcn.264.array
pushai
@system_op_in.x
peek system_op_in.x
pop
pushcp generator.if.gcn.265.else
push system_op_in.left
push system_op_in.x
eq
jz
pop
pushc true
jr
generator.if.gcn.265.else:
generator.for_each.gcn.264.continue:
push generator.for_each.gcn.264.i
inc
pop
pushcp generator.for_each.gcn.264.start
jp
generator.for_each.gcn.264.end:
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
word generator.const.gcn.266 0
pushc generator.const.gcn.266
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.267 1
pushcp generator.const.gcn.267
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.268.start:
pushcp generator.while.gcn.268.end
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
pushcp generator.while.gcn.268.start
jp
generator.while.gcn.268.end:
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
word generator.const.gcn.269 1
pushcp generator.const.gcn.269
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.270 1
pushcp generator.const.gcn.270
newa
peek system_copy_array.r
pop
word generator.const.gcn.271 0
pushc generator.const.gcn.271
peek system_copy_array.i
pop
generator.while.gcn.272.start:
pushcp generator.while.gcn.272.end
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
word generator.const.gcn.273 1
pushcp generator.const.gcn.273
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
pushcp generator.while.gcn.272.start
jp
generator.while.gcn.272.end:
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
pushcp generator.if.gcn.274.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.275 1
pushcp generator.const.gcn.275
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.276 1
pushcp generator.const.gcn.276
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.274.end
jp
generator.if.gcn.274.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.277 1
pushcp generator.const.gcn.277
push global.arg_counter
mov
jc
jr
generator.if.gcn.274.end:
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
word generator.const.gcn.278 0
pushcp generator.const.gcn.278
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
pushcp generator.if.gcn.279.else
word generator.const.gcn.280 0
pushc generator.const.gcn.280
push max.args
pushc len
word generator.const.gcn.281 1
pushcp generator.const.gcn.281
push global.arg_counter
mov
jc
bg
jz
pop
push max.args
word generator.const.gcn.282 0
pushc generator.const.gcn.282
swp
pushai
peek max.r
pop
@generator.for_each.gcn.283.array
@generator.for_each.gcn.283.i
@generator.for_each.gcn.283.to
push max.args
peek generator.for_each.gcn.283.array
alen
peek generator.for_each.gcn.283.to
pop
pushc global.zero
peek generator.for_each.gcn.283.i
pop
generator.for_each.gcn.283.start:
pushcp generator.for_each.gcn.283.end
push generator.for_each.gcn.283.i
push generator.for_each.gcn.283.to
eq
not
jz
pop
push generator.for_each.gcn.283.i
push generator.for_each.gcn.283.array
pushai
@max.x
peek max.x
pop
pushcp generator.if.gcn.284.else
push max.r
push max.x
bg
jz
pop
push max.x
push max.r
mov
generator.if.gcn.284.else:
generator.for_each.gcn.283.continue:
push generator.for_each.gcn.283.i
inc
pop
pushcp generator.for_each.gcn.283.start
jp
generator.for_each.gcn.283.end:
push max.r
jr
pushcp generator.if.gcn.279.end
jp
generator.if.gcn.279.else:
push null
jr
generator.if.gcn.279.end:
jr
max__end:
pushcp min__end
jp
min:
@min.this
@min.args
@min.r
word generator.const.gcn.285 0
pushcp generator.const.gcn.285
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
pushcp generator.if.gcn.286.else
word generator.const.gcn.287 0
pushc generator.const.gcn.287
push min.args
pushc len
word generator.const.gcn.288 1
pushcp generator.const.gcn.288
push global.arg_counter
mov
jc
bg
jz
pop
push min.args
word generator.const.gcn.289 0
pushc generator.const.gcn.289
swp
pushai
peek min.r
pop
@generator.for_each.gcn.290.array
@generator.for_each.gcn.290.i
@generator.for_each.gcn.290.to
push min.args
peek generator.for_each.gcn.290.array
alen
peek generator.for_each.gcn.290.to
pop
pushc global.zero
peek generator.for_each.gcn.290.i
pop
generator.for_each.gcn.290.start:
pushcp generator.for_each.gcn.290.end
push generator.for_each.gcn.290.i
push generator.for_each.gcn.290.to
eq
not
jz
pop
push generator.for_each.gcn.290.i
push generator.for_each.gcn.290.array
pushai
@min.x
peek min.x
pop
pushcp generator.if.gcn.291.else
push min.r
push min.x
swp
bg
jz
pop
push min.x
push min.r
mov
generator.if.gcn.291.else:
generator.for_each.gcn.290.continue:
push generator.for_each.gcn.290.i
inc
pop
pushcp generator.for_each.gcn.290.start
jp
generator.for_each.gcn.290.end:
push min.r
jr
pushcp generator.if.gcn.286.end
jp
generator.if.gcn.286.else:
push null
jr
generator.if.gcn.286.end:
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
word generator.const.gcn.292 0
pushcp generator.const.gcn.292
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.293 ""
pushc generator.const.gcn.293
peek chr.r
pop
@generator.for_each.gcn.294.array
@generator.for_each.gcn.294.i
@generator.for_each.gcn.294.to
push chr.chars
peek generator.for_each.gcn.294.array
alen
peek generator.for_each.gcn.294.to
pop
pushc global.zero
peek generator.for_each.gcn.294.i
pop
generator.for_each.gcn.294.start:
pushcp generator.for_each.gcn.294.end
push generator.for_each.gcn.294.i
push generator.for_each.gcn.294.to
eq
not
jz
pop
push generator.for_each.gcn.294.i
push generator.for_each.gcn.294.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.295 1
pushcp generator.const.gcn.295
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.294.continue:
push generator.for_each.gcn.294.i
inc
pop
pushcp generator.for_each.gcn.294.start
jp
generator.for_each.gcn.294.end:
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
word generator.const.gcn.296 0
pushc generator.const.gcn.296
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.297 1
pushcp generator.const.gcn.297
newa
peek params
pop
word generator.const.gcn.298 0
pushc generator.const.gcn.298
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.299.start:
pushcp generator.while.gcn.299.end
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
pushcp generator.while.gcn.299.start
jp
generator.while.gcn.299.end:
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
pushcp generator.if.gcn.300.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.300.end
jp
generator.if.gcn.300.else:
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
generator.if.gcn.300.end:
jr
system_makeexception__end:
pushcp main
jc
word __vtable__size__ 53
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