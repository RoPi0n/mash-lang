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
import __critsect_create "sync.lib" "CRITICAL_SECTION_CREATE"
import __critsect_enter "sync.lib" "CRITICAL_SECTION_ENTER"
import __critsect_leave "sync.lib" "CRITICAL_SECTION_LEAVE"
import __critsect_tryenter "sync.lib" "CRITICAL_SECTION_TRYENTER"
int true -1
word false 0
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
word vtable__type 0
word vtable__state 1
word vtable__body 2
word vtable__food 3
word vtable__score 4
word vtable__gameover 5
word vtable__moving 6
word vtable__lastindx 7
word vtable__indx 8
word vtable__cs 9
word vtable__items 10
word vtable__size 11
word vtable__locker 12
word vtable__classname 13
word vtable__message 14
word vtable__x 15
word vtable__y 16
word vtable__z 17
word vtable__threadcontext 18
word vtable__resumed 19
word vtable__terminated 20
word vtable__method 21
word vtable__args 22
word vtable__critical_section 23
word vtable__value 24
word vtable__create 25
word vtable__randfood 26
word vtable__drawfood 27
word vtable__draw 28
word vtable__tick 29
word vtable__printxy 30
word vtable__drawwindow 31
word vtable__move 32
word vtable__getmoving 33
word vtable__execute 34
word vtable__add 35
word vtable__insert 36
word vtable__delete 37
word vtable__clear 38
word vtable__get 39
word vtable__indexof 40
word vtable__count 41
word vtable__sort 42
word vtable__find 43
word vtable__nextins 44
word vtable__lock 45
word vtable__unlock 46
word vtable__push 47
word vtable__peek 48
word vtable__pop 49
word vtable__tostring 50
word vtable__normvideo 51
word vtable__wherex 52
word vtable__wherey 53
word vtable__pause 54
word vtable__cursorbig 55
word vtable__cursoroff 56
word vtable__cursoron 57
word vtable__delline 58
word vtable__gotoxy 59
word vtable__insline 60
word vtable__keypressed 61
word vtable__readkey 62
word vtable__sound 63
word vtable__window32 64
word vtable__clreol 65
word vtable__clrscr 66
word vtable__getdirectvideo 67
word vtable__getlastmode 68
word vtable__settextattr 69
word vtable__gettextattr 70
word vtable__getwindmax 71
word vtable__getwindmaxx 72
word vtable__getwindmaxy 73
word vtable__getwindmin 74
word vtable__getwindminx 75
word vtable__getwindminy 76
word vtable__getcheckbreak 77
word vtable__getcheckeof 78
word vtable__getchecksnow 79
word vtable__textcolor 80
word vtable__textbackground 81
word vtable__set 82
word vtable__clone 83
word vtable__compare 84
word vtable__free 85
word vtable__rejoin 86
word vtable__suspend 87
word vtable__resume 88
word vtable__setpriority 89
word vtable__terminate 90
word vtable__waitfor 91
word vtable__enter 92
word vtable__leave 93
word vtable__tryenter 94
word vtable__push_back 95
word vtable__push_first 96
word vtable__pop_back 97
word vtable__pop_first 98
word vtable__peek_back 99
word vtable__peek_first 100
word vtable__rem_first 101
word vtable__rem_back 102
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
@threadpriority
@move_vectors
@typeptr
@sysslash
@null
@params
@eunknown
word game_snake 8
@structure_instance_game_snake
pushcp __allocator__game_snake
jc
peek structure_instance_game_snake
pop
word game_io 9
@structure_instance_game_io
pushcp __allocator__game_io
jc
peek structure_instance_game_io
pop
word game_state 10
@structure_instance_game_state
pushcp __allocator__game_state
jc
peek structure_instance_game_state
pop
word game_input 11
@structure_instance_game_input
pushcp __allocator__game_input
jc
peek structure_instance_game_input
pop
word list 12
@structure_instance_list
pushcp __allocator__list
jc
peek structure_instance_list
pop
word threadlist 13
@structure_instance_threadlist
pushcp __allocator__threadlist
jc
peek structure_instance_threadlist
pop
word stack 14
@structure_instance_stack
pushcp __allocator__stack
jc
peek structure_instance_stack
pop
word polymorph 15
@structure_instance_polymorph
pushcp __allocator__polymorph
jc
peek structure_instance_polymorph
pop
word exception 16
@structure_instance_exception
pushcp __allocator__exception
jc
peek structure_instance_exception
pop
word crt 17
@structure_instance_crt
pushcp __allocator__crt
jc
peek structure_instance_crt
pop
word point 18
@structure_instance_point
pushcp __allocator__point
jc
peek structure_instance_point
pop
word point3d 19
@structure_instance_point3d
pushcp __allocator__point3d
jc
peek structure_instance_point3d
pop
word tthread 20
@structure_instance_tthread
pushcp __allocator__tthread
jc
peek structure_instance_tthread
pop
word tthreadcall 21
@structure_instance_tthreadcall
pushcp __allocator__tthreadcall
jc
peek structure_instance_tthreadcall
pop
word criticalsection 22
@structure_instance_criticalsection
pushcp __allocator__criticalsection
jc
peek structure_instance_criticalsection
pop
word atomic 23
@structure_instance_atomic
pushcp __allocator__atomic
jc
peek structure_instance_atomic
pop
word vector 24
@structure_instance_vector
pushcp __allocator__vector
jc
peek structure_instance_vector
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
@threadpriority
word generator.const.gcn.29 7
pushcp generator.const.gcn.29
pushcp global.one
newa
peek threadpriority
word tpidle 0
pcopy
pushc tpidle
swp
word generator.const.gcn.30 0
pushcp generator.const.gcn.30
swp
peekai
word tplowest 1
pcopy
pushc tplowest
swp
word generator.const.gcn.31 1
pushcp generator.const.gcn.31
swp
peekai
word tplower 2
pcopy
pushc tplower
swp
word generator.const.gcn.32 2
pushcp generator.const.gcn.32
swp
peekai
word tpnormal 3
pcopy
pushc tpnormal
swp
word generator.const.gcn.33 3
pushcp generator.const.gcn.33
swp
peekai
word tphigher 4
pcopy
pushc tphigher
swp
word generator.const.gcn.34 4
pushcp generator.const.gcn.34
swp
peekai
word tphighest 5
pcopy
pushc tphighest
swp
word generator.const.gcn.35 5
pushcp generator.const.gcn.35
swp
peekai
word tptimecritical 6
pcopy
pushc tptimecritical
swp
word generator.const.gcn.36 6
pushcp generator.const.gcn.36
swp
peekai
pop
word generator.const.gcn.37 4
pushcp generator.const.gcn.37
word generator.const.gcn.38 1
pushcp generator.const.gcn.38
newa
pcopy
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.44 1
pushc generator.const.gcn.44
copy
swp
pop
neg
swp
word generator.const.gcn.45 0
pushc generator.const.gcn.45
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.43 2
pushcp generator.const.gcn.43
push global.arg_counter
mov
jc
swp
word generator.const.gcn.39 0
pushcp generator.const.gcn.39
swp
peekai
pcopy
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.47 0
pushc generator.const.gcn.47
swp
word generator.const.gcn.48 1
pushc generator.const.gcn.48
copy
swp
pop
neg
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.46 2
pushcp generator.const.gcn.46
push global.arg_counter
mov
jc
swp
word generator.const.gcn.40 1
pushcp generator.const.gcn.40
swp
peekai
pcopy
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.50 1
pushc generator.const.gcn.50
swp
word generator.const.gcn.51 0
pushc generator.const.gcn.51
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.49 2
pushcp generator.const.gcn.49
push global.arg_counter
mov
jc
swp
word generator.const.gcn.41 2
pushcp generator.const.gcn.41
swp
peekai
pcopy
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.53 0
pushc generator.const.gcn.53
swp
word generator.const.gcn.54 1
pushc generator.const.gcn.54
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.52 2
pushcp generator.const.gcn.52
push global.arg_counter
mov
jc
swp
word generator.const.gcn.42 3
pushcp generator.const.gcn.42
swp
peekai
peek move_vectors
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
str generator.const.gcn.55 "<null>"
pushc generator.const.gcn.55
peek null
pop
push null
peek params
pop
pushc __initproc__
word generator.const.gcn.56 0
pushcp generator.const.gcn.56
push global.arg_counter
mov
jc
jr
__init__end__:
str generator.const.gcn.58 "Unknown raised exception"
pushc generator.const.gcn.58
pushc eunknownexception
pushc system_makeexception
word generator.const.gcn.57 2
pushcp generator.const.gcn.57
push global.arg_counter
mov
jc
peek eunknown
pop
pushcp game_snake__create__end
jp
game_snake__create:
@game_snake__create.this
@game_snake__create.state
peek game_snake__create.state
pop
push global.this
peek game_snake__create.this
pop
push game_snake__create.state
push game_snake__create.this
pushc vtable__state
swp
peekai
pushcp __allocator__list
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.59 0
pushcp generator.const.gcn.59
push global.arg_counter
mov
jc
push game_snake__create.this
pushc vtable__body
swp
peekai
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.62 10
pushc generator.const.gcn.62
swp
word generator.const.gcn.63 5
pushc generator.const.gcn.63
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.61 2
pushcp generator.const.gcn.61
push global.arg_counter
mov
jc
push game_snake__create.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.60 1
pushcp generator.const.gcn.60
push global.arg_counter
mov
jc
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.66 10
pushc generator.const.gcn.66
swp
word generator.const.gcn.67 6
pushc generator.const.gcn.67
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.65 2
pushcp generator.const.gcn.65
push global.arg_counter
mov
jc
push game_snake__create.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.64 1
pushcp generator.const.gcn.64
push global.arg_counter
mov
jc
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.70 10
pushc generator.const.gcn.70
swp
word generator.const.gcn.71 7
pushc generator.const.gcn.71
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.69 2
pushcp generator.const.gcn.69
push global.arg_counter
mov
jc
push game_snake__create.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.68 1
pushcp generator.const.gcn.68
push global.arg_counter
mov
jc
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.73 0
pushc generator.const.gcn.73
swp
word generator.const.gcn.74 0
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
push game_snake__create.this
pushc vtable__food
swp
peekai
push game_snake__create.this
peek global.this
pushc vtable__randfood
swp
pushai
word generator.const.gcn.75 0
pushcp generator.const.gcn.75
push global.arg_counter
mov
jc
word generator.const.gcn.76 0
pushc generator.const.gcn.76
push game_snake__create.this
pushc vtable__score
swp
peekai
pushc false
push game_snake__create.this
pushc vtable__gameover
swp
peekai
jr
game_snake__create__end:
pushcp game_snake__randfood__end
jp
game_snake__randfood:
@game_snake__randfood.this
push global.this
peek game_snake__randfood.this
pop
word generator.const.gcn.78 2
pushc generator.const.gcn.78
word generator.const.gcn.79 16
pushc generator.const.gcn.79
pushc randomto
invoke
copy
swp
pop
add
word generator.const.gcn.80 2
pushc generator.const.gcn.80
word generator.const.gcn.81 36
pushc generator.const.gcn.81
pushc randomto
invoke
copy
swp
pop
add
push game_snake__randfood.this
pushc vtable__food
swp
pushai
peek global.this
pushc vtable__set
swp
pushai
word generator.const.gcn.77 2
pushcp generator.const.gcn.77
push global.arg_counter
mov
jc
jr
game_snake__randfood__end:
pushcp game_snake__drawfood__end
jp
game_snake__drawfood:
@game_snake__drawfood.this
push global.this
peek game_snake__drawfood.this
pop
str generator.const.gcn.83 "&"
pushc generator.const.gcn.83
push game_snake__drawfood.this
pushc vtable__food
swp
pushai
pushc vtable__y
swp
pushai
push game_snake__drawfood.this
pushc vtable__food
swp
pushai
pushc vtable__x
swp
pushai
push structure_instance_game_io
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.82 3
pushcp generator.const.gcn.82
push global.arg_counter
mov
jc
jr
game_snake__drawfood__end:
pushcp game_snake__draw__end
jp
game_snake__draw:
@game_snake__draw.this
push global.this
peek game_snake__draw.this
pop
@generator.for_each.gcn.84.array
@generator.for_each.gcn.84.i
@generator.for_each.gcn.84.to
push game_snake__draw.this
pushc vtable__body
swp
pushai
pushc vtable__items
swp
pushai
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
@game_snake__draw.i
peek game_snake__draw.i
pop
str generator.const.gcn.86 "@"
pushc generator.const.gcn.86
push game_snake__draw.i
pushc vtable__y
swp
pushai
push game_snake__draw.i
pushc vtable__x
swp
pushai
push structure_instance_game_io
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.85 3
pushcp generator.const.gcn.85
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
jr
game_snake__draw__end:
pushcp game_snake__tick__end
jp
game_snake__tick:
@game_snake__tick.this
@game_snake__tick.head
@game_snake__tick.moving
@game_snake__tick.ass
push global.this
peek game_snake__tick.this
pop
word generator.const.gcn.89 1
pushc generator.const.gcn.89
push game_snake__tick.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__count
swp
pushai
word generator.const.gcn.90 0
pushcp generator.const.gcn.90
push global.arg_counter
mov
jc
copy
swp
pop
sub
push game_snake__tick.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__get
swp
pushai
word generator.const.gcn.88 1
pushcp generator.const.gcn.88
push global.arg_counter
mov
jc
peek global.this
pushc vtable__clone
swp
pushai
word generator.const.gcn.87 0
pushcp generator.const.gcn.87
push global.arg_counter
mov
jc
peek game_snake__tick.head
pop
push game_snake__tick.this
pushc vtable__state
swp
pushai
peek global.this
pushc vtable__getmoving
swp
pushai
word generator.const.gcn.91 0
pushcp generator.const.gcn.91
push global.arg_counter
mov
jc
peek game_snake__tick.moving
pop
push game_snake__tick.moving
pushc vtable__x
swp
pushai
push game_snake__tick.head
pushc vtable__x
swp
pushai
add
pop
push game_snake__tick.moving
pushc vtable__y
swp
pushai
push game_snake__tick.head
pushc vtable__y
swp
pushai
add
pop
pushcp generator.if.gcn.92.else
push game_snake__tick.this
pushc vtable__food
swp
pushai
push game_snake__tick.head
peek global.this
pushc vtable__compare
swp
pushai
word generator.const.gcn.93 1
pushcp generator.const.gcn.93
push global.arg_counter
mov
jc
copy
swp
pop
not
jz
pop
word generator.const.gcn.95 0
pushc generator.const.gcn.95
push game_snake__tick.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__get
swp
pushai
word generator.const.gcn.94 1
pushcp generator.const.gcn.94
push global.arg_counter
mov
jc
peek game_snake__tick.ass
pop
str generator.const.gcn.97 " "
pushc generator.const.gcn.97
push game_snake__tick.ass
pushc vtable__y
swp
pushai
push game_snake__tick.ass
pushc vtable__x
swp
pushai
push structure_instance_game_io
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.96 3
pushcp generator.const.gcn.96
push global.arg_counter
mov
jc
word generator.const.gcn.99 0
pushc generator.const.gcn.99
push game_snake__tick.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__delete
swp
pushai
word generator.const.gcn.98 1
pushcp generator.const.gcn.98
push global.arg_counter
mov
jc
pushcp generator.if.gcn.92.end
jp
generator.if.gcn.92.else:
push game_snake__tick.this
pushc vtable__score
swp
pushai
inc
pop
push game_snake__tick.this
pushc vtable__score
swp
pushai
str generator.const.gcn.101 "Score: "
pushc generator.const.gcn.101
copy
swp
pop
add
word generator.const.gcn.102 5
pushc generator.const.gcn.102
word generator.const.gcn.103 44
pushc generator.const.gcn.103
push structure_instance_game_io
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.100 3
pushcp generator.const.gcn.100
push global.arg_counter
mov
jc
push game_snake__tick.this
peek global.this
pushc vtable__randfood
swp
pushai
word generator.const.gcn.104 0
pushcp generator.const.gcn.104
push global.arg_counter
mov
jc
generator.if.gcn.92.end:
pushcp generator.if.gcn.105.else
word generator.const.gcn.106 2
pushcp generator.const.gcn.106
word generator.const.gcn.107 1
pushcp generator.const.gcn.107
newa
pcopy
word generator.const.gcn.110 1
pushc generator.const.gcn.110
swp
word generator.const.gcn.108 0
pushcp generator.const.gcn.108
swp
peekai
pcopy
word generator.const.gcn.111 20
pushc generator.const.gcn.111
swp
word generator.const.gcn.109 1
pushcp generator.const.gcn.109
swp
peekai
push game_snake__tick.head
pushc vtable__y
swp
pushai
pushcp system_op_in
jc
word generator.const.gcn.112 2
pushcp generator.const.gcn.112
word generator.const.gcn.113 1
pushcp generator.const.gcn.113
newa
pcopy
word generator.const.gcn.116 1
pushc generator.const.gcn.116
swp
word generator.const.gcn.114 0
pushcp generator.const.gcn.114
swp
peekai
pcopy
word generator.const.gcn.117 40
pushc generator.const.gcn.117
swp
word generator.const.gcn.115 1
pushcp generator.const.gcn.115
swp
peekai
push game_snake__tick.head
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
push game_snake__tick.this
pushc vtable__gameover
swp
pushai
mov
generator.if.gcn.105.else:
@generator.for_each.gcn.118.array
@generator.for_each.gcn.118.i
@generator.for_each.gcn.118.to
push game_snake__tick.this
pushc vtable__body
swp
pushai
pushc vtable__items
swp
pushai
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
@game_snake__tick.i
peek game_snake__tick.i
pop
pushcp generator.if.gcn.119.else
push game_snake__tick.head
push game_snake__tick.i
peek global.this
pushc vtable__compare
swp
pushai
word generator.const.gcn.120 1
pushcp generator.const.gcn.120
push global.arg_counter
mov
jc
jz
pop
pushc true
push game_snake__tick.this
pushc vtable__gameover
swp
pushai
mov
pushcp generator.for_each.gcn.118.end
jp
generator.if.gcn.119.else:
generator.for_each.gcn.118.continue:
push generator.for_each.gcn.118.i
inc
pop
pushcp generator.for_each.gcn.118.start
jp
generator.for_each.gcn.118.end:
push game_snake__tick.head
push game_snake__tick.this
pushc vtable__body
swp
pushai
peek global.this
pushc vtable__add
swp
pushai
word generator.const.gcn.121 1
pushcp generator.const.gcn.121
push global.arg_counter
mov
jc
str generator.const.gcn.123 "@"
pushc generator.const.gcn.123
push game_snake__tick.head
pushc vtable__y
swp
pushai
push game_snake__tick.head
pushc vtable__x
swp
pushai
push structure_instance_game_io
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.122 3
pushcp generator.const.gcn.122
push global.arg_counter
mov
jc
push game_snake__tick.this
peek global.this
pushc vtable__drawfood
swp
pushai
word generator.const.gcn.124 0
pushcp generator.const.gcn.124
push global.arg_counter
mov
jc
jr
game_snake__tick__end:
pushcp game__end
jp
game:
@game.this
@game.state
@game.snk
@game.inp
push structure_instance_game_io
peek global.this
pushc vtable__drawwindow
swp
pushai
word generator.const.gcn.125 0
pushcp generator.const.gcn.125
push global.arg_counter
mov
jc
pushcp __allocator__game_state
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.126 0
pushcp generator.const.gcn.126
push global.arg_counter
mov
jc
peek game.state
pop
pushcp __allocator__game_snake
jc
pcopy
peek global.this
push game.state
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.127 1
pushcp generator.const.gcn.127
push global.arg_counter
mov
jc
peek game.snk
pop
push game.snk
peek global.this
pushc vtable__draw
swp
pushai
word generator.const.gcn.128 0
pushcp generator.const.gcn.128
push global.arg_counter
mov
jc
pushcp __allocator__game_input
jc
pcopy
peek global.this
push game.state
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.129 1
pushcp generator.const.gcn.129
push global.arg_counter
mov
jc
peek game.inp
pop
generator.while.gcn.130.start:
pushcp generator.while.gcn.130.end
push game.snk
pushc vtable__gameover
swp
pushai
copy
swp
pop
not
jz
pop
word generator.const.gcn.131 80
pushc generator.const.gcn.131
pushc sleep
invoke
push game.snk
peek global.this
pushc vtable__tick
swp
pushai
word generator.const.gcn.132 0
pushcp generator.const.gcn.132
push global.arg_counter
mov
jc
pushc gc
word generator.const.gcn.133 0
pushcp generator.const.gcn.133
push global.arg_counter
mov
jc
pushcp generator.while.gcn.130.start
jp
generator.while.gcn.130.end:
push game.inp
peek global.this
pushc vtable__terminate
swp
pushai
word generator.const.gcn.134 0
pushcp generator.const.gcn.134
push global.arg_counter
mov
jc
push game.snk
pushc vtable__score
swp
pushai
push structure_instance_game_io
peek global.this
pushc vtable__gameover
swp
pushai
word generator.const.gcn.135 1
pushcp generator.const.gcn.135
push global.arg_counter
mov
jc
jr
game__end:
pushcp main__end
jp
main:
@main.this
generator.while.gcn.136.start:
pushcp generator.while.gcn.136.end
pushc true
jz
pop
push structure_instance_crt
peek global.this
pushc vtable__cursoroff
swp
pushai
word generator.const.gcn.137 0
pushcp generator.const.gcn.137
push global.arg_counter
mov
jc
pushc game
word generator.const.gcn.138 0
pushcp generator.const.gcn.138
push global.arg_counter
mov
jc
pushcp generator.if.gcn.139.else
str generator.const.gcn.140 "Y"
pushc generator.const.gcn.140
push structure_instance_crt
peek global.this
pushc vtable__readkey
swp
pushai
word generator.const.gcn.141 0
pushcp generator.const.gcn.141
push global.arg_counter
mov
jc
pushc strupper
invoke
eq
not
jz
pop
pushcp generator.while.gcn.136.end
jp
generator.if.gcn.139.else:
pushcp generator.while.gcn.136.start
jp
generator.while.gcn.136.end:
jr
main__end:
pushcp game_io__printxy__end
jp
game_io__printxy:
@game_io__printxy.this
@game_io__printxy.x
@game_io__printxy.y
@game_io__printxy.c
peek game_io__printxy.x
pop
peek game_io__printxy.y
pop
peek game_io__printxy.c
pop
push global.this
peek game_io__printxy.this
pop
push game_io__printxy.y
push game_io__printxy.x
push structure_instance_crt
peek global.this
pushc vtable__gotoxy
swp
pushai
word generator.const.gcn.142 2
pushcp generator.const.gcn.142
push global.arg_counter
mov
jc
push game_io__printxy.c
pushc print
word generator.const.gcn.143 1
pushcp generator.const.gcn.143
push global.arg_counter
mov
jc
jr
game_io__printxy__end:
pushcp game_io__drawwindow__end
jp
game_io__drawwindow:
@game_io__drawwindow.this
push global.this
peek game_io__drawwindow.this
pop
push structure_instance_crt
peek global.this
pushc vtable__clrscr
swp
pushai
word generator.const.gcn.144 0
pushcp generator.const.gcn.144
push global.arg_counter
mov
jc
@generator.for_each.gcn.145.array
@generator.for_each.gcn.145.i
@generator.for_each.gcn.145.to
word generator.const.gcn.146 40
pushc generator.const.gcn.146
word generator.const.gcn.147 1
pushc generator.const.gcn.147
pushcp system_op_range
jc
peek generator.for_each.gcn.145.array
alen
peek generator.for_each.gcn.145.to
pop
pushc global.zero
peek generator.for_each.gcn.145.i
pop
generator.for_each.gcn.145.start:
pushcp generator.for_each.gcn.145.end
push generator.for_each.gcn.145.i
push generator.for_each.gcn.145.to
eq
not
jz
pop
push generator.for_each.gcn.145.i
push generator.for_each.gcn.145.array
pushai
@game_io__drawwindow.i
peek game_io__drawwindow.i
pop
str generator.const.gcn.149 "#"
pushc generator.const.gcn.149
word generator.const.gcn.150 1
pushc generator.const.gcn.150
push game_io__drawwindow.i
push game_io__drawwindow.this
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.148 3
pushcp generator.const.gcn.148
push global.arg_counter
mov
jc
str generator.const.gcn.152 "#"
pushc generator.const.gcn.152
word generator.const.gcn.153 20
pushc generator.const.gcn.153
push game_io__drawwindow.i
push game_io__drawwindow.this
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.151 3
pushcp generator.const.gcn.151
push global.arg_counter
mov
jc
generator.for_each.gcn.145.continue:
push generator.for_each.gcn.145.i
inc
pop
pushcp generator.for_each.gcn.145.start
jp
generator.for_each.gcn.145.end:
@generator.for_each.gcn.154.array
@generator.for_each.gcn.154.i
@generator.for_each.gcn.154.to
word generator.const.gcn.155 19
pushc generator.const.gcn.155
word generator.const.gcn.156 2
pushc generator.const.gcn.156
pushcp system_op_range
jc
peek generator.for_each.gcn.154.array
alen
peek generator.for_each.gcn.154.to
pop
pushc global.zero
peek generator.for_each.gcn.154.i
pop
generator.for_each.gcn.154.start:
pushcp generator.for_each.gcn.154.end
push generator.for_each.gcn.154.i
push generator.for_each.gcn.154.to
eq
not
jz
pop
push generator.for_each.gcn.154.i
push generator.for_each.gcn.154.array
pushai
@game_io__drawwindow.i
peek game_io__drawwindow.i
pop
str generator.const.gcn.158 "#"
pushc generator.const.gcn.158
push game_io__drawwindow.i
word generator.const.gcn.159 1
pushc generator.const.gcn.159
push game_io__drawwindow.this
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.157 3
pushcp generator.const.gcn.157
push global.arg_counter
mov
jc
str generator.const.gcn.161 "#"
pushc generator.const.gcn.161
push game_io__drawwindow.i
word generator.const.gcn.162 40
pushc generator.const.gcn.162
push game_io__drawwindow.this
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.160 3
pushcp generator.const.gcn.160
push global.arg_counter
mov
jc
generator.for_each.gcn.154.continue:
push generator.for_each.gcn.154.i
inc
pop
pushcp generator.for_each.gcn.154.start
jp
generator.for_each.gcn.154.end:
str generator.const.gcn.164 "Snake, written in Mash 1.2!"
pushc generator.const.gcn.164
word generator.const.gcn.165 4
pushc generator.const.gcn.165
word generator.const.gcn.166 44
pushc generator.const.gcn.166
push game_io__drawwindow.this
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.163 3
pushcp generator.const.gcn.163
push global.arg_counter
mov
jc
str generator.const.gcn.168 "Score: 0"
pushc generator.const.gcn.168
word generator.const.gcn.169 5
pushc generator.const.gcn.169
word generator.const.gcn.170 44
pushc generator.const.gcn.170
push game_io__drawwindow.this
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.167 3
pushcp generator.const.gcn.167
push global.arg_counter
mov
jc
jr
game_io__drawwindow__end:
pushcp game_io__gameover__end
jp
game_io__gameover:
@game_io__gameover.this
@game_io__gameover.score
peek game_io__gameover.score
pop
push global.this
peek game_io__gameover.this
pop
push structure_instance_crt
peek global.this
pushc vtable__clrscr
swp
pushai
word generator.const.gcn.171 0
pushcp generator.const.gcn.171
push global.arg_counter
mov
jc
str generator.const.gcn.173 "Game over!"
pushc generator.const.gcn.173
word generator.const.gcn.174 1
pushc generator.const.gcn.174
word generator.const.gcn.175 1
pushc generator.const.gcn.175
push game_io__gameover.this
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.172 3
pushcp generator.const.gcn.172
push global.arg_counter
mov
jc
push game_io__gameover.score
str generator.const.gcn.177 "Your score: "
pushc generator.const.gcn.177
copy
swp
pop
add
word generator.const.gcn.178 2
pushc generator.const.gcn.178
word generator.const.gcn.179 1
pushc generator.const.gcn.179
push game_io__gameover.this
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.176 3
pushcp generator.const.gcn.176
push global.arg_counter
mov
jc
str generator.const.gcn.181 "Want play again? (Y/N): "
pushc generator.const.gcn.181
word generator.const.gcn.182 4
pushc generator.const.gcn.182
word generator.const.gcn.183 1
pushc generator.const.gcn.183
push game_io__gameover.this
peek global.this
pushc vtable__printxy
swp
pushai
word generator.const.gcn.180 3
pushcp generator.const.gcn.180
push global.arg_counter
mov
jc
push structure_instance_crt
peek global.this
pushc vtable__cursoron
swp
pushai
word generator.const.gcn.184 0
pushcp generator.const.gcn.184
push global.arg_counter
mov
jc
jr
game_io__gameover__end:
pushcp game_state__create__end
jp
game_state__create:
@game_state__create.this
push global.this
peek game_state__create.this
pop
pushcp __allocator__criticalsection
jc
pcopy
peek global.this
pushcp vtable__create
swp
pushai
word generator.const.gcn.185 0
pushcp generator.const.gcn.185
push global.arg_counter
mov
jc
push game_state__create.this
pushc vtable__cs
swp
peekai
word generator.const.gcn.186 3
pushc generator.const.gcn.186
push game_state__create.this
pushc vtable__lastindx
swp
peekai
word generator.const.gcn.187 3
pushc generator.const.gcn.187
push game_state__create.this
pushc vtable__indx
swp
peekai
pushcp __allocator__point
jc
pcopy
peek global.this
word generator.const.gcn.189 0
pushc generator.const.gcn.189
swp
word generator.const.gcn.190 1
pushc generator.const.gcn.190
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.188 2
pushcp generator.const.gcn.188
push global.arg_counter
mov
jc
push game_state__create.this
pushc vtable__moving
swp
peekai
jr
game_state__create__end:
pushcp game_state__move__end
jp
game_state__move:
@game_state__move.this
@game_state__move.indx
peek game_state__move.indx
pop
push global.this
peek game_state__move.this
pop
push game_state__move.this
pushc vtable__cs
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.191 0
pushcp generator.const.gcn.191
push global.arg_counter
mov
jc
push game_state__move.indx
push game_state__move.this
pushc vtable__indx
swp
peekai
push game_state__move.this
pushc vtable__cs
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.192 0
pushcp generator.const.gcn.192
push global.arg_counter
mov
jc
jr
game_state__move__end:
pushcp game_state__getmoving__end
jp
game_state__getmoving:
@game_state__getmoving.this
@game_state__getmoving.r
push global.this
peek game_state__getmoving.this
pop
push game_state__getmoving.this
pushc vtable__cs
swp
pushai
peek global.this
pushc vtable__enter
swp
pushai
word generator.const.gcn.193 0
pushcp generator.const.gcn.193
push global.arg_counter
mov
jc
pushcp generator.if.gcn.194.else
word generator.const.gcn.195 2
pushcp generator.const.gcn.195
word generator.const.gcn.196 1
pushcp generator.const.gcn.196
newa
pcopy
word generator.const.gcn.199 1
pushc generator.const.gcn.199
swp
word generator.const.gcn.197 0
pushcp generator.const.gcn.197
swp
peekai
pcopy
word generator.const.gcn.200 3
pushc generator.const.gcn.200
swp
word generator.const.gcn.198 1
pushcp generator.const.gcn.198
swp
peekai
push game_state__getmoving.this
pushc vtable__indx
swp
pushai
pushcp system_op_in
jc
word generator.const.gcn.201 2
pushcp generator.const.gcn.201
word generator.const.gcn.202 1
pushcp generator.const.gcn.202
newa
pcopy
word generator.const.gcn.205 1
pushc generator.const.gcn.205
swp
word generator.const.gcn.203 0
pushcp generator.const.gcn.203
swp
peekai
pcopy
word generator.const.gcn.206 3
pushc generator.const.gcn.206
swp
word generator.const.gcn.204 1
pushcp generator.const.gcn.204
swp
peekai
push game_state__getmoving.this
pushc vtable__lastindx
swp
pushai
pushcp system_op_in
jc
copy
swp
pop
and
copy
swp
pop
not
word generator.const.gcn.207 2
pushcp generator.const.gcn.207
word generator.const.gcn.208 1
pushcp generator.const.gcn.208
newa
pcopy
word generator.const.gcn.211 0
pushc generator.const.gcn.211
swp
word generator.const.gcn.209 0
pushcp generator.const.gcn.209
swp
peekai
pcopy
word generator.const.gcn.212 2
pushc generator.const.gcn.212
swp
word generator.const.gcn.210 1
pushcp generator.const.gcn.210
swp
peekai
push game_state__getmoving.this
pushc vtable__indx
swp
pushai
pushcp system_op_in
jc
word generator.const.gcn.213 2
pushcp generator.const.gcn.213
word generator.const.gcn.214 1
pushcp generator.const.gcn.214
newa
pcopy
word generator.const.gcn.217 0
pushc generator.const.gcn.217
swp
word generator.const.gcn.215 0
pushcp generator.const.gcn.215
swp
peekai
pcopy
word generator.const.gcn.218 2
pushc generator.const.gcn.218
swp
word generator.const.gcn.216 1
pushcp generator.const.gcn.216
swp
peekai
push game_state__getmoving.this
pushc vtable__lastindx
swp
pushai
pushcp system_op_in
jc
copy
swp
pop
and
copy
swp
pop
not
copy
swp
pop
and
jz
pop
push move_vectors
push game_state__getmoving.this
pushc vtable__indx
swp
pushai
swp
pushai
pushc vtable__x
swp
pushai
push game_state__getmoving.this
pushc vtable__moving
swp
pushai
pushc vtable__x
swp
pushai
mov
push move_vectors
push game_state__getmoving.this
pushc vtable__indx
swp
pushai
swp
pushai
pushc vtable__y
swp
pushai
push game_state__getmoving.this
pushc vtable__moving
swp
pushai
pushc vtable__y
swp
pushai
mov
generator.if.gcn.194.else:
push game_state__getmoving.this
pushc vtable__indx
swp
pushai
push game_state__getmoving.this
pushc vtable__lastindx
swp
pushai
mov
push game_state__getmoving.this
pushc vtable__moving
swp
pushai
peek global.this
pushc vtable__clone
swp
pushai
word generator.const.gcn.219 0
pushcp generator.const.gcn.219
push global.arg_counter
mov
jc
peek game_state__getmoving.r
pop
push game_state__getmoving.this
pushc vtable__cs
swp
pushai
peek global.this
pushc vtable__leave
swp
pushai
word generator.const.gcn.220 0
pushcp generator.const.gcn.220
push global.arg_counter
mov
jc
push game_state__getmoving.r
jr
jr
game_state__getmoving__end:
pushcp game_input__create__end
jp
game_input__create:
@game_input__create.this
@game_input__create.state
peek game_input__create.state
pop
push global.this
peek game_input__create.this
pop
push game_input__create.state
push game_input__create.this
pushc vtable__state
swp
peekai
pushc true
push game_input__create.this
peek global.this
pop
pushcp tthread__create
word generator.const.gcn.221 1
pushcp generator.const.gcn.221
push global.arg_counter
mov
jc
jr
game_input__create__end:
pushcp game_input__execute__end
jp
game_input__execute:
@game_input__execute.this
@game_input__execute.k
push global.this
peek game_input__execute.this
pop
generator.while.gcn.222.start:
pushcp generator.while.gcn.222.end
push game_input__execute.this
pushc vtable__terminated
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
word generator.const.gcn.223 0
pushcp generator.const.gcn.223
push global.arg_counter
mov
jc
pushc strupper
invoke
peek game_input__execute.k
pop
push game_input__execute.k
pcopy
str generator.const.gcn.226 "W"
pushc generator.const.gcn.226
eq
pushcp generator.case.gcn.225.end
swp
jz
word generator.const.gcn.228 0
pushc generator.const.gcn.228
push game_input__execute.this
pushc vtable__state
swp
pushai
peek global.this
pushc vtable__move
swp
pushai
word generator.const.gcn.227 1
pushcp generator.const.gcn.227
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.224.end
jp
generator.case.gcn.225.end:
pcopy
str generator.const.gcn.230 "A"
pushc generator.const.gcn.230
eq
pushcp generator.case.gcn.229.end
swp
jz
word generator.const.gcn.232 1
pushc generator.const.gcn.232
push game_input__execute.this
pushc vtable__state
swp
pushai
peek global.this
pushc vtable__move
swp
pushai
word generator.const.gcn.231 1
pushcp generator.const.gcn.231
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.224.end
jp
generator.case.gcn.229.end:
pcopy
str generator.const.gcn.234 "S"
pushc generator.const.gcn.234
eq
pushcp generator.case.gcn.233.end
swp
jz
word generator.const.gcn.236 2
pushc generator.const.gcn.236
push game_input__execute.this
pushc vtable__state
swp
pushai
peek global.this
pushc vtable__move
swp
pushai
word generator.const.gcn.235 1
pushcp generator.const.gcn.235
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.224.end
jp
generator.case.gcn.233.end:
pcopy
str generator.const.gcn.238 "D"
pushc generator.const.gcn.238
eq
pushcp generator.case.gcn.237.end
swp
jz
word generator.const.gcn.240 3
pushc generator.const.gcn.240
push game_input__execute.this
pushc vtable__state
swp
pushai
peek global.this
pushc vtable__move
swp
pushai
word generator.const.gcn.239 1
pushcp generator.const.gcn.239
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.224.end
jp
generator.case.gcn.237.end:
generator.switch.gcn.224.end:
pushc gc
word generator.const.gcn.241 0
pushcp generator.const.gcn.241
push global.arg_counter
mov
jc
word generator.const.gcn.242 10
pushc generator.const.gcn.242
pushc sleep
invoke
pushcp generator.while.gcn.222.start
jp
generator.while.gcn.222.end:
jr
game_input__execute__end:
pushcp list__create__end
jp
list__create:
@list__create.this
push global.this
peek list__create.this
pop
word generator.const.gcn.244 0
pushc generator.const.gcn.244
word generator.const.gcn.243 1
pushcp generator.const.gcn.243
newa
push list__create.this
pushc vtable__items
swp
peekai
word generator.const.gcn.245 0
pushc generator.const.gcn.245
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
word generator.const.gcn.247 1
pushc generator.const.gcn.247
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
word generator.const.gcn.246 2
pushcp generator.const.gcn.246
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
pushcp generator.if.gcn.248.else
word generator.const.gcn.249 0
pushc generator.const.gcn.249
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
str generator.const.gcn.251 ") out of bounds."
pushc generator.const.gcn.251
push list__insert.index
str generator.const.gcn.252 "List index ("
pushc generator.const.gcn.252
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
word generator.const.gcn.250 1
pushcp generator.const.gcn.250
push global.arg_counter
mov
jc
pushc global.raised
trr
pushcp generator.if.gcn.248.end
jp
generator.if.gcn.248.else:
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
word generator.const.gcn.253 2
pushcp generator.const.gcn.253
push global.arg_counter
mov
jc
word generator.const.gcn.254 1
pushc generator.const.gcn.254
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
generator.while.gcn.255.start:
pushcp generator.while.gcn.255.end
push list__insert.index
push list__insert.i
bg
jz
pop
push list__insert.this
pushc vtable__items
swp
pushai
word generator.const.gcn.256 1
pushc generator.const.gcn.256
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
pushcp generator.while.gcn.255.start
jp
generator.while.gcn.255.end:
push list__insert.obj
push list__insert.this
pushc vtable__items
swp
pushai
push list__insert.index
swp
peekai
generator.if.gcn.248.end:
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
pushcp generator.if.gcn.257.else
word generator.const.gcn.258 0
pushc generator.const.gcn.258
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
str generator.const.gcn.260 ") out of bounds."
pushc generator.const.gcn.260
push list__delete.index
str generator.const.gcn.261 "List index ("
pushc generator.const.gcn.261
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
word generator.const.gcn.259 1
pushcp generator.const.gcn.259
push global.arg_counter
mov
jc
pushc global.raised
trr
pushcp generator.if.gcn.257.end
jp
generator.if.gcn.257.else:
push list__delete.this
pushc vtable__size
swp
pushai
dec
pop
generator.while.gcn.262.start:
pushcp generator.while.gcn.262.end
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
word generator.const.gcn.263 1
pushc generator.const.gcn.263
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
pushcp generator.while.gcn.262.start
jp
generator.while.gcn.262.end:
push list__delete.this
pushc vtable__size
swp
pushai
push list__delete.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.264 2
pushcp generator.const.gcn.264
push global.arg_counter
mov
jc
generator.if.gcn.257.end:
jr
list__delete__end:
pushcp list__clear__end
jp
list__clear:
@list__clear.this
push global.this
peek list__clear.this
pop
word generator.const.gcn.266 0
pushc generator.const.gcn.266
push list__clear.this
pushc vtable__items
swp
pushai
pushc setlen
word generator.const.gcn.265 2
pushcp generator.const.gcn.265
push global.arg_counter
mov
jc
word generator.const.gcn.267 0
pushc generator.const.gcn.267
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
pushcp generator.if.gcn.268.else
word generator.const.gcn.269 2
pushcp generator.const.gcn.269
word generator.const.gcn.270 1
pushcp generator.const.gcn.270
newa
pcopy
pushc typearray
swp
word generator.const.gcn.271 0
pushcp generator.const.gcn.271
swp
peekai
pcopy
pushc typeclass
swp
word generator.const.gcn.272 1
pushcp generator.const.gcn.272
swp
peekai
push list__indexof.obj
pushc typeof
word generator.const.gcn.273 1
pushcp generator.const.gcn.273
push global.arg_counter
mov
jc
pushcp system_op_in
jc
jz
pop
word generator.const.gcn.274 0
pushc generator.const.gcn.274
peek list__indexof.i
pop
generator.while.gcn.275.start:
pushcp generator.while.gcn.275.end
push list__indexof.this
pushc vtable__size
swp
pushai
push list__indexof.i
swp
bg
jz
pop
pushcp generator.if.gcn.276.else
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
generator.if.gcn.276.else:
push list__indexof.i
inc
pop
pushcp generator.while.gcn.275.start
jp
generator.while.gcn.275.end:
pushcp generator.if.gcn.268.end
jp
generator.if.gcn.268.else:
word generator.const.gcn.277 0
pushc generator.const.gcn.277
peek list__indexof.i
pop
generator.while.gcn.278.start:
pushcp generator.while.gcn.278.end
push list__indexof.this
pushc vtable__size
swp
pushai
push list__indexof.i
swp
bg
jz
pop
pushcp generator.if.gcn.279.else
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
generator.if.gcn.279.else:
push list__indexof.i
inc
pop
pushcp generator.while.gcn.278.start
jp
generator.while.gcn.278.end:
generator.if.gcn.268.end:
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
word generator.const.gcn.280 1
pushcp generator.const.gcn.280
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
word generator.const.gcn.281 1
pushcp generator.const.gcn.281
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
word generator.const.gcn.282 2
pushcp generator.const.gcn.282
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
word generator.const.gcn.283 2
pushcp generator.const.gcn.283
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
word generator.const.gcn.284 2
pushcp generator.const.gcn.284
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
word generator.const.gcn.285 0
pushcp generator.const.gcn.285
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
word generator.const.gcn.286 0
pushcp generator.const.gcn.286
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
word generator.const.gcn.287 0
pushcp generator.const.gcn.287
push global.arg_counter
mov
jc
push threadlist__add.obj
push threadlist__add.this
peek global.this
pop
pushcp list__add
word generator.const.gcn.288 1
pushcp generator.const.gcn.288
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
word generator.const.gcn.289 0
pushcp generator.const.gcn.289
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
word generator.const.gcn.290 0
pushcp generator.const.gcn.290
push global.arg_counter
mov
jc
push threadlist__insert.index
push threadlist__insert.obj
push threadlist__insert.this
peek global.this
pop
pushcp list__insert
word generator.const.gcn.291 2
pushcp generator.const.gcn.291
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
word generator.const.gcn.292 0
pushcp generator.const.gcn.292
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
word generator.const.gcn.293 0
pushcp generator.const.gcn.293
push global.arg_counter
mov
jc
push threadlist__delete.index
push threadlist__delete.this
peek global.this
pop
pushcp list__delete
word generator.const.gcn.294 1
pushcp generator.const.gcn.294
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
word generator.const.gcn.295 0
pushcp generator.const.gcn.295
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
word generator.const.gcn.296 0
pushcp generator.const.gcn.296
push global.arg_counter
mov
jc
push threadlist__clear.this
peek global.this
pop
pushcp list__clear
word generator.const.gcn.297 0
pushcp generator.const.gcn.297
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
word generator.const.gcn.298 0
pushcp generator.const.gcn.298
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
word generator.const.gcn.299 0
pushcp generator.const.gcn.299
push global.arg_counter
mov
jc
push threadlist__get.index
push threadlist__get.this
peek global.this
pop
pushcp list__get
word generator.const.gcn.300 1
pushcp generator.const.gcn.300
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
word generator.const.gcn.301 0
pushcp generator.const.gcn.301
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
word generator.const.gcn.302 0
pushcp generator.const.gcn.302
push global.arg_counter
mov
jc
push threadlist__indexof.obj
push threadlist__indexof.this
peek global.this
pop
pushcp list__indexof
word generator.const.gcn.303 1
pushcp generator.const.gcn.303
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
word generator.const.gcn.304 0
pushcp generator.const.gcn.304
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
word generator.const.gcn.305 0
pushcp generator.const.gcn.305
push global.arg_counter
mov
jc
push threadlist__sort.this
peek global.this
pop
pushcp list__sort
word generator.const.gcn.306 0
pushcp generator.const.gcn.306
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
word generator.const.gcn.307 0
pushcp generator.const.gcn.307
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
word generator.const.gcn.308 0
pushcp generator.const.gcn.308
push global.arg_counter
mov
jc
push threadlist__nextins.obj
push threadlist__nextins.this
peek global.this
pop
pushcp list__nextins
word generator.const.gcn.309 1
pushcp generator.const.gcn.309
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
word generator.const.gcn.310 0
pushcp generator.const.gcn.310
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
word generator.const.gcn.311 0
pushcp generator.const.gcn.311
push global.arg_counter
mov
jc
push threadlist__find.obj
push threadlist__find.this
peek global.this
pop
pushcp list__find
word generator.const.gcn.312 1
pushcp generator.const.gcn.312
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
word generator.const.gcn.313 0
pushcp generator.const.gcn.313
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
word generator.const.gcn.314 0
pushcp generator.const.gcn.314
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
word generator.const.gcn.315 0
pushcp generator.const.gcn.315
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
word generator.const.gcn.316 0
pushcp generator.const.gcn.316
push global.arg_counter
mov
jc
jr
threadlist__unlock__end:
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
pushcp generator.if.gcn.317.else
push system_op_range.isback
jz
pop
word generator.const.gcn.318 1
pushc generator.const.gcn.318
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
pushcp generator.if.gcn.317.end
jp
generator.if.gcn.317.else:
word generator.const.gcn.319 1
pushc generator.const.gcn.319
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
generator.if.gcn.317.end:
push system_op_range.l
word generator.const.gcn.320 1
pushcp generator.const.gcn.320
newa
peek system_op_range.res
pop
word generator.const.gcn.321 0
pushc generator.const.gcn.321
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.322 1
pushcp generator.const.gcn.322
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.323.start:
pushcp generator.while.gcn.323.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.324 1
pushcp generator.const.gcn.324
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
pushcp generator.if.gcn.325.else
push system_op_range.isback
jz
pop
word generator.const.gcn.326 1
pushc generator.const.gcn.326
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.325.end
jp
generator.if.gcn.325.else:
word generator.const.gcn.327 1
pushc generator.const.gcn.327
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.325.end:
pushcp generator.while.gcn.323.start
jp
generator.while.gcn.323.end:
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
word generator.const.gcn.328 2
pushcp generator.const.gcn.328
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
word generator.const.gcn.329 0
pushc generator.const.gcn.329
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.330 1
pushcp generator.const.gcn.330
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.331.start:
pushcp generator.while.gcn.331.end
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
pushcp generator.while.gcn.331.start
jp
generator.while.gcn.331.end:
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
pushcp generator.if.gcn.332.else
word generator.const.gcn.333 255
pushc generator.const.gcn.333
push typeof.t
eq
jz
pop
push null
jr
generator.if.gcn.332.else:
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
word generator.const.gcn.334 1
pushcp generator.const.gcn.334
push global.arg_counter
mov
jc
peek system_op_is.t
pop
pushcp generator.if.gcn.335.else
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
pushcp generator.if.gcn.335.end
jp
generator.if.gcn.335.else:
push system_op_is.right
push system_op_is.t
eq
jr
generator.if.gcn.335.end:
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
word generator.const.gcn.336 1
pushcp generator.const.gcn.336
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.337 1
pushcp generator.const.gcn.337
newa
peek system_copy_array.r
pop
word generator.const.gcn.338 0
pushc generator.const.gcn.338
peek system_copy_array.i
pop
generator.while.gcn.339.start:
pushcp generator.while.gcn.339.end
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
word generator.const.gcn.340 1
pushcp generator.const.gcn.340
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
pushcp generator.while.gcn.339.start
jp
generator.while.gcn.339.end:
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
pushcp generator.if.gcn.341.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.342 1
pushcp generator.const.gcn.342
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.343 1
pushcp generator.const.gcn.343
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.341.end
jp
generator.if.gcn.341.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.344 1
pushcp generator.const.gcn.344
push global.arg_counter
mov
jc
jr
generator.if.gcn.341.end:
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
word generator.const.gcn.345 0
pushcp generator.const.gcn.345
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.346 ""
pushc generator.const.gcn.346
peek chr.r
pop
@generator.for_each.gcn.347.array
@generator.for_each.gcn.347.i
@generator.for_each.gcn.347.to
push chr.chars
peek generator.for_each.gcn.347.array
alen
peek generator.for_each.gcn.347.to
pop
pushc global.zero
peek generator.for_each.gcn.347.i
pop
generator.for_each.gcn.347.start:
pushcp generator.for_each.gcn.347.end
push generator.for_each.gcn.347.i
push generator.for_each.gcn.347.to
eq
not
jz
pop
push generator.for_each.gcn.347.i
push generator.for_each.gcn.347.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.348 1
pushcp generator.const.gcn.348
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.347.continue:
push generator.for_each.gcn.347.i
inc
pop
pushcp generator.for_each.gcn.347.start
jp
generator.for_each.gcn.347.end:
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
word generator.const.gcn.350 1
pushcp generator.const.gcn.350
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.351.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.349.end
jp
generator.case.gcn.351.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.352.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.349.end
jp
generator.case.gcn.352.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.353.end
swp
jz
push str.value
pushc f2s
invoke
jr
pushcp generator.switch.gcn.349.end
jp
generator.case.gcn.353.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.354.end
swp
jz
push str.value
jr
pushcp generator.switch.gcn.349.end
jp
generator.case.gcn.354.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.356 "Invalid type cast via str()."
pushc generator.const.gcn.356
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.355 1
pushcp generator.const.gcn.355
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.349.end:
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
word generator.const.gcn.358 1
pushcp generator.const.gcn.358
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.359.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.357.end
jp
generator.case.gcn.359.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.360.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.357.end
jp
generator.case.gcn.360.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.361.end
swp
jz
word generator.const.gcn.362 1
pushc generator.const.gcn.362
push int.value
copy
swp
pop
idiv
jr
pushcp generator.switch.gcn.357.end
jp
generator.case.gcn.361.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.363.end
swp
jz
push int.value
pushc s2i
invoke
jr
pushcp generator.switch.gcn.357.end
jp
generator.case.gcn.363.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.365 "Invalid type cast via int()."
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
generator.switch.gcn.357.end:
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
push real.value
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
push real.value
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
push real.value
jr
pushcp generator.switch.gcn.366.end
jp
generator.case.gcn.370.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.371.end
swp
jz
push real.value
pushc s2f
invoke
jr
pushcp generator.switch.gcn.366.end
jp
generator.case.gcn.371.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.373 "Invalid type cast via int()."
pushc generator.const.gcn.373
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.372 1
pushcp generator.const.gcn.372
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.366.end:
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
pushcp generator.if.gcn.374.else
push check.cond
jz
pop
push check.rtrue
jr
pushcp generator.if.gcn.374.end
jp
generator.if.gcn.374.else:
push check.rfalse
jr
generator.if.gcn.374.end:
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
pushcp generator.if.gcn.375.else
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
generator.if.gcn.375.else:
word generator.const.gcn.376 2
pushcp generator.const.gcn.376
word generator.const.gcn.377 1
pushcp generator.const.gcn.377
newa
pcopy
push between.left
swp
word generator.const.gcn.378 0
pushcp generator.const.gcn.378
swp
peekai
pcopy
push between.right
swp
word generator.const.gcn.379 1
pushcp generator.const.gcn.379
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
pushcp generator.if.gcn.380.else
word generator.const.gcn.381 0
pushc generator.const.gcn.381
push maxfromarray.arr
pushc len
word generator.const.gcn.382 1
pushcp generator.const.gcn.382
push global.arg_counter
mov
jc
bg
jz
pop
push maxfromarray.arr
word generator.const.gcn.383 0
pushc generator.const.gcn.383
swp
pushai
peek maxfromarray.r
pop
@generator.for_each.gcn.384.array
@generator.for_each.gcn.384.i
@generator.for_each.gcn.384.to
push maxfromarray.arr
peek generator.for_each.gcn.384.array
alen
peek generator.for_each.gcn.384.to
pop
pushc global.zero
peek generator.for_each.gcn.384.i
pop
generator.for_each.gcn.384.start:
pushcp generator.for_each.gcn.384.end
push generator.for_each.gcn.384.i
push generator.for_each.gcn.384.to
eq
not
jz
pop
push generator.for_each.gcn.384.i
push generator.for_each.gcn.384.array
pushai
@maxfromarray.x
peek maxfromarray.x
pop
pushcp generator.if.gcn.385.else
push maxfromarray.r
push maxfromarray.x
bg
jz
pop
push maxfromarray.x
push maxfromarray.r
mov
generator.if.gcn.385.else:
generator.for_each.gcn.384.continue:
push generator.for_each.gcn.384.i
inc
pop
pushcp generator.for_each.gcn.384.start
jp
generator.for_each.gcn.384.end:
push maxfromarray.r
jr
pushcp generator.if.gcn.380.end
jp
generator.if.gcn.380.else:
push null
jr
generator.if.gcn.380.end:
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
pushcp generator.if.gcn.386.else
word generator.const.gcn.387 0
pushc generator.const.gcn.387
push minfromarray.arr
pushc len
word generator.const.gcn.388 1
pushcp generator.const.gcn.388
push global.arg_counter
mov
jc
bg
jz
pop
push minfromarray.arr
word generator.const.gcn.389 0
pushc generator.const.gcn.389
swp
pushai
peek minfromarray.r
pop
@generator.for_each.gcn.390.array
@generator.for_each.gcn.390.i
@generator.for_each.gcn.390.to
push minfromarray.arr
peek generator.for_each.gcn.390.array
alen
peek generator.for_each.gcn.390.to
pop
pushc global.zero
peek generator.for_each.gcn.390.i
pop
generator.for_each.gcn.390.start:
pushcp generator.for_each.gcn.390.end
push generator.for_each.gcn.390.i
push generator.for_each.gcn.390.to
eq
not
jz
pop
push generator.for_each.gcn.390.i
push generator.for_each.gcn.390.array
pushai
@minfromarray.x
peek minfromarray.x
pop
pushcp generator.if.gcn.391.else
push minfromarray.r
push minfromarray.x
swp
bg
jz
pop
push minfromarray.x
push minfromarray.r
mov
generator.if.gcn.391.else:
generator.for_each.gcn.390.continue:
push generator.for_each.gcn.390.i
inc
pop
pushcp generator.for_each.gcn.390.start
jp
generator.for_each.gcn.390.end:
push minfromarray.r
jr
pushcp generator.if.gcn.386.end
jp
generator.if.gcn.386.else:
push null
jr
generator.if.gcn.386.end:
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
word generator.const.gcn.392 0
pushcp generator.const.gcn.392
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
push max.args
pushc len
word generator.const.gcn.393 1
pushcp generator.const.gcn.393
push global.arg_counter
mov
jc
peek max.l
pop
pushcp generator.if.gcn.394.else
word generator.const.gcn.395 0
pushc generator.const.gcn.395
push max.l
bg
jz
pop
push max.args
word generator.const.gcn.396 0
pushc generator.const.gcn.396
swp
pushai
peek max.first
pop
pushcp generator.if.gcn.397.else
pushc typearray
push max.first
pushcp system_op_is
jc
jz
pop
push max.first
pushc maxfromarray
word generator.const.gcn.398 1
pushcp generator.const.gcn.398
push global.arg_counter
mov
jc
peek max.r
pop
pushcp generator.if.gcn.397.end
jp
generator.if.gcn.397.else:
push max.first
peek max.r
pop
generator.if.gcn.397.end:
word generator.const.gcn.399 1
pushc generator.const.gcn.399
peek max.i
pop
generator.while.gcn.400.start:
pushcp generator.while.gcn.400.end
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
pushcp generator.if.gcn.401.else
pushc typearray
push max.t
pushcp system_op_is
jc
jz
pop
push max.t
pushc maxfromarray
word generator.const.gcn.402 1
pushcp generator.const.gcn.402
push global.arg_counter
mov
jc
peek max._
pop
pushcp generator.if.gcn.403.else
push max.r
push max._
bg
jz
pop
push max._
push max.r
mov
generator.if.gcn.403.else:
pushcp generator.if.gcn.401.end
jp
generator.if.gcn.401.else:
pushcp generator.if.gcn.404.else
push max.r
push max.t
bg
jz
pop
push max.t
push max.r
mov
generator.if.gcn.404.else:
generator.if.gcn.401.end:
push max.i
inc
pop
pushcp generator.while.gcn.400.start
jp
generator.while.gcn.400.end:
push max.r
jr
pushcp generator.if.gcn.394.end
jp
generator.if.gcn.394.else:
push null
jr
generator.if.gcn.394.end:
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
word generator.const.gcn.405 0
pushcp generator.const.gcn.405
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
push min.args
pushc len
word generator.const.gcn.406 1
pushcp generator.const.gcn.406
push global.arg_counter
mov
jc
peek min.l
pop
pushcp generator.if.gcn.407.else
word generator.const.gcn.408 0
pushc generator.const.gcn.408
push min.l
bg
jz
pop
push min.args
word generator.const.gcn.409 0
pushc generator.const.gcn.409
swp
pushai
peek min.first
pop
pushcp generator.if.gcn.410.else
pushc typearray
push min.first
pushcp system_op_is
jc
jz
pop
push min.first
pushc minfromarray
word generator.const.gcn.411 1
pushcp generator.const.gcn.411
push global.arg_counter
mov
jc
peek min.r
pop
pushcp generator.if.gcn.410.end
jp
generator.if.gcn.410.else:
push min.first
peek min.r
pop
generator.if.gcn.410.end:
word generator.const.gcn.412 1
pushc generator.const.gcn.412
peek min.i
pop
push min.args
pushc len
word generator.const.gcn.413 1
pushcp generator.const.gcn.413
push global.arg_counter
mov
jc
peek min.l
pop
generator.while.gcn.414.start:
pushcp generator.while.gcn.414.end
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
pushcp generator.if.gcn.415.else
pushc typearray
push min.t
pushcp system_op_is
jc
jz
pop
push min.t
pushc minfromarray
word generator.const.gcn.416 1
pushcp generator.const.gcn.416
push global.arg_counter
mov
jc
peek min._
pop
pushcp generator.if.gcn.417.else
push min.r
push min._
swp
bg
jz
pop
push min._
push min.r
mov
generator.if.gcn.417.else:
pushcp generator.if.gcn.415.end
jp
generator.if.gcn.415.else:
pushcp generator.if.gcn.418.else
push min.r
push min.t
swp
bg
jz
pop
push min.t
push min.r
mov
generator.if.gcn.418.else:
generator.if.gcn.415.end:
push min.i
inc
pop
pushcp generator.while.gcn.414.start
jp
generator.while.gcn.414.end:
push min.r
jr
pushcp generator.if.gcn.407.end
jp
generator.if.gcn.407.else:
push null
jr
generator.if.gcn.407.end:
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
word generator.const.gcn.419 1
pushcp generator.const.gcn.419
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek append.values
pop
push append.array
pushc len
word generator.const.gcn.420 1
pushcp generator.const.gcn.420
push global.arg_counter
mov
jc
peek append.i
pop
push append.values
pushc len
word generator.const.gcn.421 1
pushcp generator.const.gcn.421
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
word generator.const.gcn.422 2
pushcp generator.const.gcn.422
push global.arg_counter
mov
jc
@generator.for_each.gcn.423.array
@generator.for_each.gcn.423.i
@generator.for_each.gcn.423.to
push append.values
peek generator.for_each.gcn.423.array
alen
peek generator.for_each.gcn.423.to
pop
pushc global.zero
peek generator.for_each.gcn.423.i
pop
generator.for_each.gcn.423.start:
pushcp generator.for_each.gcn.423.end
push generator.for_each.gcn.423.i
push generator.for_each.gcn.423.to
eq
not
jz
pop
push generator.for_each.gcn.423.i
push generator.for_each.gcn.423.array
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
generator.for_each.gcn.423.continue:
push generator.for_each.gcn.423.i
inc
pop
pushcp generator.for_each.gcn.423.start
jp
generator.for_each.gcn.423.end:
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
word generator.const.gcn.424 1
pushcp generator.const.gcn.424
push global.arg_counter
mov
jc
peek reverse.l
pop
word generator.const.gcn.425 2
pushc generator.const.gcn.425
push reverse.l
copy
swp
pop
idiv
peek reverse.hl
pop
word generator.const.gcn.426 0
pushc generator.const.gcn.426
peek reverse.i
pop
generator.while.gcn.427.start:
pushcp generator.while.gcn.427.end
push reverse.hl
push reverse.i
swp
bg
jz
pop
push reverse.array
word generator.const.gcn.428 1
pushc generator.const.gcn.428
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
word generator.const.gcn.429 1
pushc generator.const.gcn.429
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
pushcp generator.while.gcn.427.start
jp
generator.while.gcn.427.end:
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
word generator.const.gcn.430 0
pushc generator.const.gcn.430
peek indexof.i
pop
@generator.for_each.gcn.431.array
@generator.for_each.gcn.431.i
@generator.for_each.gcn.431.to
push indexof.array
peek generator.for_each.gcn.431.array
alen
peek generator.for_each.gcn.431.to
pop
pushc global.zero
peek generator.for_each.gcn.431.i
pop
generator.for_each.gcn.431.start:
pushcp generator.for_each.gcn.431.end
push generator.for_each.gcn.431.i
push generator.for_each.gcn.431.to
eq
not
jz
pop
push generator.for_each.gcn.431.i
push generator.for_each.gcn.431.array
pushai
@indexof.x
peek indexof.x
pop
pushcp generator.if.gcn.432.else
pushc typeclass
push indexof.x
pushcp system_op_is
jc
jz
pop
pushcp generator.if.gcn.433.else
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
generator.if.gcn.433.else:
pushcp generator.if.gcn.432.end
jp
generator.if.gcn.432.else:
pushcp generator.if.gcn.434.else
push indexof.object
push indexof.x
eq
jz
pop
push indexof.i
jr
generator.if.gcn.434.else:
generator.if.gcn.432.end:
push indexof.i
inc
pop
generator.for_each.gcn.431.continue:
push generator.for_each.gcn.431.i
inc
pop
pushcp generator.for_each.gcn.431.start
jp
generator.for_each.gcn.431.end:
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
word generator.const.gcn.435 1
pushcp generator.const.gcn.435
push global.arg_counter
mov
jc
peek insert.l
pop
word generator.const.gcn.437 1
pushc generator.const.gcn.437
push insert.l
copy
swp
pop
add
push insert.array
pushc setlen
word generator.const.gcn.436 2
pushcp generator.const.gcn.436
push global.arg_counter
mov
jc
generator.while.gcn.438.start:
pushcp generator.while.gcn.438.end
push insert.index
push insert.l
bg
jz
pop
push insert.array
word generator.const.gcn.439 1
pushc generator.const.gcn.439
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
pushcp generator.while.gcn.438.start
jp
generator.while.gcn.438.end:
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
word generator.const.gcn.440 1
pushcp generator.const.gcn.440
push global.arg_counter
mov
jc
peek delete.i
pop
word generator.const.gcn.441 1
pushc generator.const.gcn.441
push delete.array
pushc len
word generator.const.gcn.442 1
pushcp generator.const.gcn.442
push global.arg_counter
mov
jc
copy
swp
pop
sub
peek delete.l
pop
generator.while.gcn.443.start:
pushcp generator.while.gcn.443.end
push delete.l
push delete.i
swp
bg
jz
pop
push delete.array
word generator.const.gcn.444 1
pushc generator.const.gcn.444
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
pushcp generator.while.gcn.443.start
jp
generator.while.gcn.443.end:
push delete.i
push delete.array
pushc setlen
word generator.const.gcn.445 2
pushcp generator.const.gcn.445
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
word generator.const.gcn.446 2
pushcp generator.const.gcn.446
push global.arg_counter
mov
jc
peek remove.index
pop
pushcp generator.if.gcn.447.else
push null
push remove.index
eq
not
jz
pop
push remove.index
push remove.array
pushc delete
word generator.const.gcn.448 2
pushcp generator.const.gcn.448
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.447.end
jp
generator.if.gcn.447.else:
push remove.array
jr
generator.if.gcn.447.end:
jr
remove__end:
pushcp clear__end
jp
clear:
@clear.this
@clear.array
peek clear.array
pop
word generator.const.gcn.450 0
pushc generator.const.gcn.450
push clear.array
pushc setlen
word generator.const.gcn.449 2
pushcp generator.const.gcn.449
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
word generator.const.gcn.451 0
pushc generator.const.gcn.451
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.452 1
pushcp generator.const.gcn.452
newa
peek params
pop
word generator.const.gcn.453 0
pushc generator.const.gcn.453
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.454.start:
pushcp generator.while.gcn.454.end
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
pushcp generator.while.gcn.454.start
jp
generator.while.gcn.454.end:
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
str generator.const.gcn.455 "'."
pushc generator.const.gcn.455
push exception__tostring.this
pushc vtable__message
swp
pushai
str generator.const.gcn.456 ">, message: '"
pushc generator.const.gcn.456
push exception__tostring.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.457 "Exception <"
pushc generator.const.gcn.457
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
pushcp generator.if.gcn.458.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.458.end
jp
generator.if.gcn.458.else:
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
generator.if.gcn.458.end:
jr
system_makeexception__end:
pushcp __printarray__end
jp
__printarray:
@__printarray.this
@__printarray.arr
@__printarray.l
@__printarray.i
peek __printarray.arr
pop
str generator.const.gcn.459 "["
pushc generator.const.gcn.459
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.460 1
pushcp generator.const.gcn.460
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.461 0
pushc generator.const.gcn.461
peek __printarray.i
pop
generator.while.gcn.462.start:
pushcp generator.while.gcn.462.end
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
word generator.const.gcn.463 1
pushcp generator.const.gcn.463
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
pushcp generator.if.gcn.464.else
push __printarray.l
word generator.const.gcn.465 1
pushc generator.const.gcn.465
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.466 ", "
pushc generator.const.gcn.466
pushc _print
invoke
generator.if.gcn.464.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.462.start
jp
generator.while.gcn.462.end:
str generator.const.gcn.467 "]"
pushc generator.const.gcn.467
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
word generator.const.gcn.469 1
pushcp generator.const.gcn.469
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.470.end
swp
jz
str generator.const.gcn.471 "(null)"
pushc generator.const.gcn.471
pushc _print
invoke
pushcp generator.switch.gcn.468.end
jp
generator.case.gcn.470.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.472.end
swp
jz
push __print.obj
peek global.this
pushc vtable__tostring
swp
pushai
word generator.const.gcn.473 0
pushcp generator.const.gcn.473
push global.arg_counter
mov
jc
pushc _print
invoke
pushcp generator.switch.gcn.468.end
jp
generator.case.gcn.472.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.474.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.475 1
pushcp generator.const.gcn.475
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.468.end
jp
generator.case.gcn.474.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.468.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.476 0
pushcp generator.const.gcn.476
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.477.array
@generator.for_each.gcn.477.i
@generator.for_each.gcn.477.to
push print.args
peek generator.for_each.gcn.477.array
alen
peek generator.for_each.gcn.477.to
pop
pushc global.zero
peek generator.for_each.gcn.477.i
pop
generator.for_each.gcn.477.start:
pushcp generator.for_each.gcn.477.end
push generator.for_each.gcn.477.i
push generator.for_each.gcn.477.to
eq
not
jz
pop
push generator.for_each.gcn.477.i
push generator.for_each.gcn.477.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.478 1
pushcp generator.const.gcn.478
push global.arg_counter
mov
jc
generator.for_each.gcn.477.continue:
push generator.for_each.gcn.477.i
inc
pop
pushcp generator.for_each.gcn.477.start
jp
generator.for_each.gcn.477.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.479 0
pushcp generator.const.gcn.479
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.480.array
@generator.for_each.gcn.480.i
@generator.for_each.gcn.480.to
push println.args
peek generator.for_each.gcn.480.array
alen
peek generator.for_each.gcn.480.to
pop
pushc global.zero
peek generator.for_each.gcn.480.i
pop
generator.for_each.gcn.480.start:
pushcp generator.for_each.gcn.480.end
push generator.for_each.gcn.480.i
push generator.for_each.gcn.480.to
eq
not
jz
pop
push generator.for_each.gcn.480.i
push generator.for_each.gcn.480.array
pushai
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.481 1
pushcp generator.const.gcn.481
push global.arg_counter
mov
jc
generator.for_each.gcn.480.continue:
push generator.for_each.gcn.480.i
inc
pop
pushcp generator.for_each.gcn.480.start
jp
generator.for_each.gcn.480.end:
str generator.const.gcn.482 ""
pushc generator.const.gcn.482
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
word generator.const.gcn.483 7
pushc generator.const.gcn.483
pushc crt_textcolor
invoke
word generator.const.gcn.484 0
pushc generator.const.gcn.484
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
word generator.const.gcn.485 256
pushc generator.const.gcn.485
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
word generator.const.gcn.486 256
pushc generator.const.gcn.486
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
word generator.const.gcn.487 1
pushcp generator.const.gcn.487
push global.arg_counter
mov
jc
push point__create.this
pushc vtable__x
swp
peekai
push point__create.y
pushc copy
word generator.const.gcn.488 1
pushcp generator.const.gcn.488
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
word generator.const.gcn.489 2
pushcp generator.const.gcn.489
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
word generator.const.gcn.490 1
pushcp generator.const.gcn.490
push global.arg_counter
mov
jc
push thr_kill.thr
pushc thr_terminate
word generator.const.gcn.491 1
pushcp generator.const.gcn.491
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
word generator.const.gcn.492 0
pushcp generator.const.gcn.492
push global.arg_counter
mov
jc
push tthread_join.threadclass
peek global.this
pushc vtable__terminate
swp
pushai
word generator.const.gcn.493 0
pushcp generator.const.gcn.493
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
word generator.const.gcn.494 2
pushcp generator.const.gcn.494
push global.arg_counter
mov
jc
push tthread__create.this
pushc vtable__threadcontext
swp
peekai
pushcp generator.if.gcn.495.else
push tthread__create.resumed
jz
pop
push tthread__create.this
peek global.this
pushc vtable__resume
swp
pushai
word generator.const.gcn.496 0
pushcp generator.const.gcn.496
push global.arg_counter
mov
jc
generator.if.gcn.495.else:
jr
tthread__create__end:
pushcp tthread__free__end
jp
tthread__free:
@tthread__free.this
push global.this
peek tthread__free.this
pop
pushcp generator.if.gcn.497.else
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
word generator.const.gcn.498 0
pushcp generator.const.gcn.498
push global.arg_counter
mov
jc
generator.if.gcn.497.else:
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
word generator.const.gcn.499 2
pushcp generator.const.gcn.499
push global.arg_counter
mov
jc
push tthread__rejoin.this
pushc vtable__threadcontext
swp
peekai
pushcp generator.if.gcn.500.else
push tthread__rejoin.resumed
jz
pop
push tthread__rejoin.this
peek global.this
pushc vtable__resume
swp
pushai
word generator.const.gcn.501 0
pushcp generator.const.gcn.501
push global.arg_counter
mov
jc
generator.if.gcn.500.else:
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
word generator.const.gcn.502 1
pushcp generator.const.gcn.502
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
word generator.const.gcn.503 1
pushcp generator.const.gcn.503
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
word generator.const.gcn.504 2
pushcp generator.const.gcn.504
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
word generator.const.gcn.505 1
pushcp generator.const.gcn.505
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
generator.while.gcn.506.start:
pushcp generator.while.gcn.506.end
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
word generator.const.gcn.507 1
pushc generator.const.gcn.507
pushc sleep
invoke
pushc gc
word generator.const.gcn.508 0
pushcp generator.const.gcn.508
push global.arg_counter
mov
jc
pushcp generator.while.gcn.506.start
jp
generator.while.gcn.506.end:
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
word generator.const.gcn.509 1
pushcp generator.const.gcn.509
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
generator.while.gcn.510.start:
pushcp generator.while.gcn.510.end
word generator.const.gcn.511 0
pushc generator.const.gcn.511
push tthreadcall__execute.this
pushc vtable__args
swp
pushai
peek global.this
pushc vtable__size
swp
pushai
word generator.const.gcn.512 0
pushcp generator.const.gcn.512
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
word generator.const.gcn.513 0
pushcp generator.const.gcn.513
push global.arg_counter
mov
jc
pushcp generator.while.gcn.510.start
jp
generator.while.gcn.510.end:
push tthreadcall__execute.this
peek global.this
pushc vtable__method
swp
pushai
word generator.const.gcn.514 0
pushcp generator.const.gcn.514
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
word generator.const.gcn.515 1
pushcp generator.const.gcn.515
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
word generator.const.gcn.516 0
pushcp generator.const.gcn.516
push global.arg_counter
mov
jc
peek go.args_vect
pop
@generator.for_each.gcn.517.array
@generator.for_each.gcn.517.i
@generator.for_each.gcn.517.to
push go.args
peek generator.for_each.gcn.517.array
alen
peek generator.for_each.gcn.517.to
pop
pushc global.zero
peek generator.for_each.gcn.517.i
pop
generator.for_each.gcn.517.start:
pushcp generator.for_each.gcn.517.end
push generator.for_each.gcn.517.i
push generator.for_each.gcn.517.to
eq
not
jz
pop
push generator.for_each.gcn.517.i
push generator.for_each.gcn.517.array
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
word generator.const.gcn.518 1
pushcp generator.const.gcn.518
push global.arg_counter
mov
jc
generator.for_each.gcn.517.continue:
push generator.for_each.gcn.517.i
inc
pop
pushcp generator.for_each.gcn.517.start
jp
generator.for_each.gcn.517.end:
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
word generator.const.gcn.519 3
pushcp generator.const.gcn.519
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
word generator.const.gcn.520 1
pushcp generator.const.gcn.520
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
word generator.const.gcn.521 0
pushcp generator.const.gcn.521
push global.arg_counter
mov
jc
peek thread.args_vect
pop
@generator.for_each.gcn.522.array
@generator.for_each.gcn.522.i
@generator.for_each.gcn.522.to
push thread.args
peek generator.for_each.gcn.522.array
alen
peek generator.for_each.gcn.522.to
pop
pushc global.zero
peek generator.for_each.gcn.522.i
pop
generator.for_each.gcn.522.start:
pushcp generator.for_each.gcn.522.end
push generator.for_each.gcn.522.i
push generator.for_each.gcn.522.to
eq
not
jz
pop
push generator.for_each.gcn.522.i
push generator.for_each.gcn.522.array
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
word generator.const.gcn.523 1
pushcp generator.const.gcn.523
push global.arg_counter
mov
jc
generator.for_each.gcn.522.continue:
push generator.for_each.gcn.522.i
inc
pop
pushcp generator.for_each.gcn.522.start
jp
generator.for_each.gcn.522.end:
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
word generator.const.gcn.524 3
pushcp generator.const.gcn.524
push global.arg_counter
mov
jc
jr
jr
thread__end:
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
word generator.const.gcn.525 0
pushcp generator.const.gcn.525
push global.arg_counter
mov
jc
push atomic__create.this
pushc vtable__locker
swp
pushai
mov
push atomic__create.value
word generator.const.gcn.526 1
pushcp generator.const.gcn.526
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
word generator.const.gcn.527 0
pushcp generator.const.gcn.527
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
word generator.const.gcn.528 0
pushcp generator.const.gcn.528
push global.arg_counter
mov
jc
jr
atomic__unlock__end:
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
word generator.const.gcn.529 1
pushcp generator.const.gcn.529
push global.arg_counter
mov
jc
peek reversearray.l
pop
word generator.const.gcn.530 0
pushc generator.const.gcn.530
peek reversearray.i
pop
generator.while.gcn.531.start:
pushcp generator.while.gcn.531.end
word generator.const.gcn.532 2
pushc generator.const.gcn.532
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
word generator.const.gcn.533 1
pushc generator.const.gcn.533
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
word generator.const.gcn.534 1
pushc generator.const.gcn.534
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
pushcp generator.while.gcn.531.start
jp
generator.while.gcn.531.end:
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
word generator.const.gcn.535 0
pushc generator.const.gcn.535
swp
pushai
peek getmax.mx
pop
word generator.const.gcn.536 1
pushc generator.const.gcn.536
peek getmax.i
pop
generator.while.gcn.537.start:
pushcp generator.while.gcn.537.end
push getmax.n
push getmax.i
swp
bg
jz
pop
pushcp generator.if.gcn.538.else
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
generator.if.gcn.538.else:
push getmax.i
inc
pop
pushcp generator.while.gcn.537.start
jp
generator.while.gcn.537.end:
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
word generator.const.gcn.539 0
pushc generator.const.gcn.539
swp
pushai
peek getmin.mn
pop
word generator.const.gcn.540 1
pushc generator.const.gcn.540
peek getmin.i
pop
generator.while.gcn.541.start:
pushcp generator.while.gcn.541.end
push getmin.n
push getmin.i
swp
bg
jz
pop
pushcp generator.if.gcn.542.else
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
generator.if.gcn.542.else:
push getmin.i
inc
pop
pushcp generator.while.gcn.541.start
jp
generator.while.gcn.541.end:
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
word generator.const.gcn.543 1
pushc generator.const.gcn.543
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
@generator.for_each.gcn.544.array
@generator.for_each.gcn.544.i
@generator.for_each.gcn.544.to
push partition.high
push partition.low
pushcp system_op_range
jc
peek generator.for_each.gcn.544.array
alen
peek generator.for_each.gcn.544.to
pop
pushc global.zero
peek generator.for_each.gcn.544.i
pop
generator.for_each.gcn.544.start:
pushcp generator.for_each.gcn.544.end
push generator.for_each.gcn.544.i
push generator.for_each.gcn.544.to
eq
not
jz
pop
push generator.for_each.gcn.544.i
push generator.for_each.gcn.544.array
pushai
@partition.j
peek partition.j
pop
pushcp generator.if.gcn.545.else
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
generator.if.gcn.545.else:
generator.for_each.gcn.544.continue:
push generator.for_each.gcn.544.i
inc
pop
pushcp generator.for_each.gcn.544.start
jp
generator.for_each.gcn.544.end:
push partition.arr
word generator.const.gcn.546 1
pushc generator.const.gcn.546
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
word generator.const.gcn.547 1
pushc generator.const.gcn.547
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
word generator.const.gcn.548 1
pushc generator.const.gcn.548
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
pushcp generator.if.gcn.549.else
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
word generator.const.gcn.550 3
pushcp generator.const.gcn.550
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
word generator.const.gcn.552 1
pushc generator.const.gcn.552
push fromtoqsort.pi
copy
swp
pop
sub
push fromtoqsort.low
push fromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.551 3
pushcp generator.const.gcn.551
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
word generator.const.gcn.554 1
pushc generator.const.gcn.554
push fromtoqsort.pi
copy
swp
pop
add
push fromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.553 3
pushcp generator.const.gcn.553
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
generator.if.gcn.549.else:
jr
fromtoqsort__end:
pushcp quicksort__end
jp
quicksort:
@quicksort.this
@quicksort.arr
peek quicksort.arr
pop
word generator.const.gcn.556 1
pushc generator.const.gcn.556
push quicksort.arr
pushc len
word generator.const.gcn.557 1
pushcp generator.const.gcn.557
push global.arg_counter
mov
jc
copy
swp
pop
sub
word generator.const.gcn.558 0
pushc generator.const.gcn.558
push quicksort.arr
pushc fromtoqsort
word generator.const.gcn.555 3
pushcp generator.const.gcn.555
push global.arg_counter
mov
jc
push quicksort.arr
jr
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
generator.while.gcn.559.start:
pushcp generator.while.gcn.559.end
pushc true
jz
pop
word generator.const.gcn.560 2
pushc generator.const.gcn.560
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
pushcp generator.if.gcn.561.else
push fromtobinsearch.arr
push fromtobinsearch.midd
swp
pushai
push fromtobinsearch.key
swp
bg
jz
pop
word generator.const.gcn.562 1
pushc generator.const.gcn.562
push fromtobinsearch.midd
copy
swp
pop
sub
peek fromtobinsearch.right
pop
pushcp generator.if.gcn.561.end
jp
generator.if.gcn.561.else:
pushcp generator.if.gcn.563.else
push fromtobinsearch.arr
push fromtobinsearch.midd
swp
pushai
push fromtobinsearch.key
bg
jz
pop
word generator.const.gcn.564 1
pushc generator.const.gcn.564
push fromtobinsearch.midd
copy
swp
pop
add
peek fromtobinsearch.left
pop
pushcp generator.if.gcn.563.end
jp
generator.if.gcn.563.else:
push fromtobinsearch.midd
jr
generator.if.gcn.563.end:
generator.if.gcn.561.end:
pushcp generator.if.gcn.565.else
push fromtobinsearch.right
push fromtobinsearch.left
bg
jz
pop
push null
jr
generator.if.gcn.565.else:
pushcp generator.while.gcn.559.start
jp
generator.while.gcn.559.end:
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
word generator.const.gcn.566 1
pushcp generator.const.gcn.566
push global.arg_counter
mov
jc
peek binsearch.l
pop
pushcp generator.if.gcn.567.else
word generator.const.gcn.568 0
pushc generator.const.gcn.568
push binsearch.l
bg
jz
pop
push binsearch.key
word generator.const.gcn.570 1
pushc generator.const.gcn.570
push binsearch.l
copy
swp
pop
sub
word generator.const.gcn.571 0
pushc generator.const.gcn.571
push binsearch.arr
pushc fromtobinsearch
word generator.const.gcn.569 4
pushcp generator.const.gcn.569
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.567.end
jp
generator.if.gcn.567.else:
push null
jr
generator.if.gcn.567.end:
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
generator.while.gcn.572.start:
pushcp generator.while.gcn.572.end
pushc true
jz
pop
word generator.const.gcn.573 2
pushc generator.const.gcn.573
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
pushcp generator.if.gcn.574.else
push fromtobinnext.arr
push fromtobinnext.midd
swp
pushai
push fromtobinnext.key
swp
bg
jz
pop
word generator.const.gcn.575 1
pushc generator.const.gcn.575
push fromtobinnext.midd
copy
swp
pop
sub
peek fromtobinnext.right
pop
pushcp generator.if.gcn.574.end
jp
generator.if.gcn.574.else:
pushcp generator.if.gcn.576.else
push fromtobinnext.arr
push fromtobinnext.midd
swp
pushai
push fromtobinnext.key
bg
jz
pop
word generator.const.gcn.577 1
pushc generator.const.gcn.577
push fromtobinnext.midd
copy
swp
pop
add
peek fromtobinnext.left
pop
pushcp generator.if.gcn.576.end
jp
generator.if.gcn.576.else:
push fromtobinnext.midd
jr
generator.if.gcn.576.end:
generator.if.gcn.574.end:
pushcp generator.if.gcn.578.else
push fromtobinnext.right
push fromtobinnext.left
bg
jz
pop
push fromtobinnext.midd
jr
generator.if.gcn.578.else:
pushcp generator.while.gcn.572.start
jp
generator.while.gcn.572.end:
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
word generator.const.gcn.579 1
pushcp generator.const.gcn.579
push global.arg_counter
mov
jc
peek binnext.l
pop
pushcp generator.if.gcn.580.else
word generator.const.gcn.581 0
pushc generator.const.gcn.581
push binnext.l
bg
jz
pop
push binnext.key
word generator.const.gcn.583 1
pushc generator.const.gcn.583
push binnext.l
copy
swp
pop
sub
word generator.const.gcn.584 0
pushc generator.const.gcn.584
push binnext.arr
pushc fromtobinnext
word generator.const.gcn.582 4
pushcp generator.const.gcn.582
push global.arg_counter
mov
jc
peek binnext.r
pop
pushcp generator.if.gcn.585.else
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
pushcp generator.if.gcn.585.end
jp
generator.if.gcn.585.else:
word generator.const.gcn.586 1
pushc generator.const.gcn.586
push binnext.r
copy
swp
pop
add
jr
generator.if.gcn.585.end:
pushcp generator.if.gcn.580.end
jp
generator.if.gcn.580.else:
word generator.const.gcn.587 0
pushc generator.const.gcn.587
jr
generator.if.gcn.580.end:
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
word generator.const.gcn.588 0
pushc generator.const.gcn.588
peek fromtointerpolarsearch.pos
pop
pushc false
peek fromtointerpolarsearch.found
pop
generator.while.gcn.589.start:
pushcp generator.while.gcn.589.end
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
pushcp generator.if.gcn.590.else
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.pos
swp
pushai
swp
bg
jz
pop
word generator.const.gcn.591 1
pushc generator.const.gcn.591
push fromtointerpolarsearch.pos
copy
swp
pop
add
push fromtointerpolarsearch.left
mov
pushcp generator.if.gcn.590.end
jp
generator.if.gcn.590.else:
pushcp generator.if.gcn.592.else
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.pos
swp
pushai
bg
jz
pop
word generator.const.gcn.593 1
pushc generator.const.gcn.593
push fromtointerpolarsearch.pos
copy
swp
pop
sub
push fromtointerpolarsearch.right
mov
pushcp generator.if.gcn.592.end
jp
generator.if.gcn.592.else:
pushc true
push fromtointerpolarsearch.found
mov
generator.if.gcn.592.end:
generator.if.gcn.590.end:
pushcp generator.while.gcn.589.start
jp
generator.while.gcn.589.end:
pushcp generator.if.gcn.594.else
push fromtointerpolarsearch.found
jz
pop
push fromtointerpolarsearch.pos
jr
pushcp generator.if.gcn.594.end
jp
generator.if.gcn.594.else:
push null
jr
generator.if.gcn.594.end:
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
word generator.const.gcn.595 1
pushcp generator.const.gcn.595
push global.arg_counter
mov
jc
peek interpolarsearch.l
pop
pushcp generator.if.gcn.596.else
word generator.const.gcn.597 0
pushc generator.const.gcn.597
push interpolarsearch.l
bg
jz
pop
push interpolarsearch.key
word generator.const.gcn.599 1
pushc generator.const.gcn.599
push interpolarsearch.l
copy
swp
pop
sub
word generator.const.gcn.600 0
pushc generator.const.gcn.600
push interpolarsearch.arr
pushc fromtointerpolarsearch
word generator.const.gcn.598 4
pushcp generator.const.gcn.598
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.596.end
jp
generator.if.gcn.596.else:
push null
jr
generator.if.gcn.596.end:
jr
interpolarsearch__end:
pushcp vector__create__end
jp
vector__create:
@vector__create.this
push global.this
peek vector__create.this
pop
word generator.const.gcn.602 0
pushc generator.const.gcn.602
word generator.const.gcn.601 1
pushcp generator.const.gcn.601
newa
push vector__create.this
pushc vtable__items
swp
peekai
word generator.const.gcn.603 0
pushc generator.const.gcn.603
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
word generator.const.gcn.605 1
pushc generator.const.gcn.605
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
word generator.const.gcn.604 2
pushcp generator.const.gcn.604
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
pushcp generator.if.gcn.606.else
word generator.const.gcn.607 0
pushc generator.const.gcn.607
push vector__push_first.this
pushc vtable__size
swp
pushai
bg
jz
pop
word generator.const.gcn.609 1
pushc generator.const.gcn.609
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
word generator.const.gcn.608 2
pushcp generator.const.gcn.608
push global.arg_counter
mov
jc
@generator.for_each.gcn.610.array
@generator.for_each.gcn.610.i
@generator.for_each.gcn.610.to
word generator.const.gcn.611 1
pushc generator.const.gcn.611
push vector__push_first.this
pushc vtable__size
swp
pushai
copy
swp
pop
sub
word generator.const.gcn.612 0
pushc generator.const.gcn.612
pushcp system_op_range
jc
peek generator.for_each.gcn.610.array
alen
peek generator.for_each.gcn.610.i
dec
pop
pushc global.zero
peek generator.for_each.gcn.610.to
dec
pop
generator.for_each.gcn.610.start:
pushcp generator.for_each.gcn.610.end
push generator.for_each.gcn.610.i
push generator.for_each.gcn.610.to
eq
not
jz
pop
push generator.for_each.gcn.610.i
push generator.for_each.gcn.610.array
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
word generator.const.gcn.613 1
pushc generator.const.gcn.613
push vector__push_first.i
copy
swp
pop
add
swp
peekai
generator.for_each.gcn.610.continue:
push generator.for_each.gcn.610.i
dec
pop
pushcp generator.for_each.gcn.610.start
jp
generator.for_each.gcn.610.end:
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
word generator.const.gcn.614 0
pushc generator.const.gcn.614
swp
peekai
pushcp generator.if.gcn.606.end
jp
generator.if.gcn.606.else:
push vector__push_first.object
push vector__push_first.this
peek global.this
pushc vtable__push_back
swp
pushai
word generator.const.gcn.615 1
pushcp generator.const.gcn.615
push global.arg_counter
mov
jc
generator.if.gcn.606.end:
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
word generator.const.gcn.616 1
pushc generator.const.gcn.616
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
word generator.const.gcn.618 1
pushc generator.const.gcn.618
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
word generator.const.gcn.617 2
pushcp generator.const.gcn.617
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
word generator.const.gcn.619 0
pushc generator.const.gcn.619
swp
pushai
peek vector__pop_first.r
pop
push vector__pop_first.this
peek global.this
pushc vtable__rem_first
swp
pushai
word generator.const.gcn.620 0
pushcp generator.const.gcn.620
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
word generator.const.gcn.621 1
pushc generator.const.gcn.621
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
word generator.const.gcn.622 0
pushc generator.const.gcn.622
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
word generator.const.gcn.623 1
pushc generator.const.gcn.623
peek vector__rem_first.i
pop
generator.while.gcn.624.start:
pushcp generator.while.gcn.624.end
word generator.const.gcn.625 1
pushc generator.const.gcn.625
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
word generator.const.gcn.626 1
pushc generator.const.gcn.626
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
pushcp generator.while.gcn.624.start
jp
generator.while.gcn.624.end:
word generator.const.gcn.628 1
pushc generator.const.gcn.628
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
word generator.const.gcn.627 2
pushcp generator.const.gcn.627
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
word generator.const.gcn.629 2
pushcp generator.const.gcn.629
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
word generator.const.gcn.630 1
pushcp generator.const.gcn.630
push global.arg_counter
mov
jc
jr
jr
vector__size__end:
pushcp main
jc
word __vtable__size__ 103
pushcp __allocator__game_snake__end
jp
__allocator__game_snake:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc game_snake
swp
pushcp vtable__type
swp
peekai
pcopy
pushc game_snake__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc game_snake__randfood
swp
pushcp vtable__randfood
swp
peekai
pcopy
pushc game_snake__drawfood
swp
pushcp vtable__drawfood
swp
peekai
pcopy
pushc game_snake__draw
swp
pushcp vtable__draw
swp
peekai
pcopy
pushc game_snake__tick
swp
pushcp vtable__tick
swp
peekai
jr
__allocator__game_snake__end:
pushcp __allocator__game_io__end
jp
__allocator__game_io:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc game_io
swp
pushcp vtable__type
swp
peekai
pcopy
pushc game_io__printxy
swp
pushcp vtable__printxy
swp
peekai
pcopy
pushc game_io__drawwindow
swp
pushcp vtable__drawwindow
swp
peekai
pcopy
pushc game_io__gameover
swp
pushcp vtable__gameover
swp
peekai
jr
__allocator__game_io__end:
pushcp __allocator__game_state__end
jp
__allocator__game_state:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc game_state
swp
pushcp vtable__type
swp
peekai
pcopy
pushc game_state__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc game_state__move
swp
pushcp vtable__move
swp
peekai
pcopy
pushc game_state__getmoving
swp
pushcp vtable__getmoving
swp
peekai
jr
__allocator__game_state__end:
pushcp __allocator__game_input__end
jp
__allocator__game_input:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
pcopy
pushc game_input
swp
pushcp vtable__type
swp
peekai
pcopy
pushc game_input__create
swp
pushcp vtable__create
swp
peekai
pcopy
pushc game_input__execute
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
__allocator__game_input__end:
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