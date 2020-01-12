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
real m_pi 3.14159265358979
real m_e 2.71828182845904
word vtable__type 0
word vtable__classname 1
word vtable__message 2
word vtable__re 3
word vtable__im 4
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
word vtable__push 36
word vtable__peek 37
word vtable__pop 38
word vtable__create 39
word vtable__tostring 40
word vtable__set 41
word vtable__clone 42
word vtable__compareto 43
word vtable__module 44
word vtable__angle 45
word vtable__conjugate 46
word vtable__unite 47
word vtable__uniteim 48
word vtable__uniteviaexp 49
word vtable__add 50
word vtable__sub 51
word vtable__mul 52
word vtable__div 53
word vtable__power 54
word vtable__ln 55
word vtable__logn 56
word vtable__sin 57
word vtable__cos 58
word vtable__tg 59
word vtable__ctg 60
word vtable__sec 61
word vtable__cosec 62
@global.arg_counter
@global.temp
@global.this
word global.zero 0
word global.one 1
str global.raised "ERaisedException"
pushc global.zero
peek global.arg_counter
pop
@s_replaceflags
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
word complex 12
@structure_instance_complex
pushcp __allocator__complex
jc
peek structure_instance_complex
pop
word cmath 13
@structure_instance_cmath
pushcp __allocator__cmath
jc
peek structure_instance_cmath
pop
pushcp __init__
jc
@s_replaceflags
word generator.const.gcn.0 2
pushcp generator.const.gcn.0
pushcp global.one
newa
peek s_replaceflags
word srfreplaceall 0
pcopy
pushc srfreplaceall
swp
word generator.const.gcn.1 0
pushcp generator.const.gcn.1
swp
peekai
word srfignorecase 1
pcopy
pushc srfignorecase
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
pushcp main__end
jp
main:
@main.this
@main.s
str generator.const.gcn.38 "ok"
pushc generator.const.gcn.38
str generator.const.gcn.39 "fail"
pushc generator.const.gcn.39
push null
word generator.const.gcn.41 7
pushc generator.const.gcn.41
word generator.const.gcn.43 6
pushc generator.const.gcn.43
word generator.const.gcn.44 5
pushc generator.const.gcn.44
word generator.const.gcn.45 4
pushc generator.const.gcn.45
word generator.const.gcn.46 3
pushcp generator.const.gcn.46
word generator.const.gcn.47 1
pushcp generator.const.gcn.47
newa
pcopy
word generator.const.gcn.51 1
pushc generator.const.gcn.51
swp
word generator.const.gcn.48 0
pushcp generator.const.gcn.48
swp
peekai
pcopy
word generator.const.gcn.52 2
pushc generator.const.gcn.52
swp
word generator.const.gcn.49 1
pushcp generator.const.gcn.49
swp
peekai
pcopy
word generator.const.gcn.53 3
pushc generator.const.gcn.53
swp
word generator.const.gcn.50 2
pushcp generator.const.gcn.50
swp
peekai
pushc append
word generator.const.gcn.42 4
pushcp generator.const.gcn.42
push global.arg_counter
mov
jc
pushc indexof
word generator.const.gcn.40 2
pushcp generator.const.gcn.40
push global.arg_counter
mov
jc
eq
not
pushc check
word generator.const.gcn.37 3
pushcp generator.const.gcn.37
push global.arg_counter
mov
jc
pushc println
word generator.const.gcn.36 1
pushcp generator.const.gcn.36
push global.arg_counter
mov
jc
word generator.const.gcn.57 9
pushcp generator.const.gcn.57
word generator.const.gcn.58 1
pushcp generator.const.gcn.58
newa
pcopy
word generator.const.gcn.68 9
pushc generator.const.gcn.68
swp
word generator.const.gcn.59 0
pushcp generator.const.gcn.59
swp
peekai
pcopy
word generator.const.gcn.69 8
pushc generator.const.gcn.69
swp
word generator.const.gcn.60 1
pushcp generator.const.gcn.60
swp
peekai
pcopy
word generator.const.gcn.70 4
pushc generator.const.gcn.70
swp
word generator.const.gcn.61 2
pushcp generator.const.gcn.61
swp
peekai
pcopy
word generator.const.gcn.71 5
pushc generator.const.gcn.71
swp
word generator.const.gcn.62 3
pushcp generator.const.gcn.62
swp
peekai
pcopy
word generator.const.gcn.72 2
pushc generator.const.gcn.72
swp
word generator.const.gcn.63 4
pushcp generator.const.gcn.63
swp
peekai
pcopy
word generator.const.gcn.73 7
pushc generator.const.gcn.73
swp
word generator.const.gcn.64 5
pushcp generator.const.gcn.64
swp
peekai
pcopy
word generator.const.gcn.74 1
pushc generator.const.gcn.74
swp
word generator.const.gcn.65 6
pushcp generator.const.gcn.65
swp
peekai
pcopy
word generator.const.gcn.75 6
pushc generator.const.gcn.75
swp
word generator.const.gcn.66 7
pushcp generator.const.gcn.66
swp
peekai
pcopy
word generator.const.gcn.76 3
pushc generator.const.gcn.76
swp
word generator.const.gcn.67 8
pushcp generator.const.gcn.67
swp
peekai
pushc quicksort
word generator.const.gcn.56 1
pushcp generator.const.gcn.56
push global.arg_counter
mov
jc
pushc reverse
word generator.const.gcn.55 1
pushcp generator.const.gcn.55
push global.arg_counter
mov
jc
pushc println
word generator.const.gcn.54 1
pushcp generator.const.gcn.54
push global.arg_counter
mov
jc
real generator.const.gcn.78 3.14
pushc generator.const.gcn.78
pushc println
word generator.const.gcn.77 1
pushcp generator.const.gcn.77
push global.arg_counter
mov
jc
word generator.const.gcn.81 4
pushc generator.const.gcn.81
pushc sqrt
word generator.const.gcn.80 1
pushcp generator.const.gcn.80
push global.arg_counter
mov
jc
pushc println
word generator.const.gcn.79 1
pushcp generator.const.gcn.79
push global.arg_counter
mov
jc
word generator.const.gcn.84 201
pushc generator.const.gcn.84
word generator.const.gcn.85 3
pushcp generator.const.gcn.85
word generator.const.gcn.86 1
pushcp generator.const.gcn.86
newa
pcopy
word generator.const.gcn.90 10
pushc generator.const.gcn.90
swp
word generator.const.gcn.87 0
pushcp generator.const.gcn.87
swp
peekai
pcopy
word generator.const.gcn.91 15
pushc generator.const.gcn.91
swp
word generator.const.gcn.88 1
pushcp generator.const.gcn.88
swp
peekai
pcopy
word generator.const.gcn.92 202
pushc generator.const.gcn.92
swp
word generator.const.gcn.89 2
pushcp generator.const.gcn.89
swp
peekai
word generator.const.gcn.95 100
pushc generator.const.gcn.95
word generator.const.gcn.98 3
pushc generator.const.gcn.98
word generator.const.gcn.100 6
pushc generator.const.gcn.100
word generator.const.gcn.101 9
pushc generator.const.gcn.101
word generator.const.gcn.102 1
pushc generator.const.gcn.102
word generator.const.gcn.103 0
pushcp generator.const.gcn.103
word generator.const.gcn.104 1
pushcp generator.const.gcn.104
newa
pushc append
word generator.const.gcn.99 4
pushcp generator.const.gcn.99
push global.arg_counter
mov
jc
pushc append
word generator.const.gcn.97 2
pushcp generator.const.gcn.97
push global.arg_counter
mov
jc
pushc quicksort
word generator.const.gcn.96 1
pushcp generator.const.gcn.96
push global.arg_counter
mov
jc
pushc append
word generator.const.gcn.94 2
pushcp generator.const.gcn.94
push global.arg_counter
mov
jc
pushc reverse
word generator.const.gcn.93 1
pushcp generator.const.gcn.93
push global.arg_counter
mov
jc
pushc max
word generator.const.gcn.83 3
pushcp generator.const.gcn.83
push global.arg_counter
mov
jc
pushc println
word generator.const.gcn.82 1
pushcp generator.const.gcn.82
push global.arg_counter
mov
jc
real generator.const.gcn.106 3.14
pushc generator.const.gcn.106
pushc println
word generator.const.gcn.105 1
pushcp generator.const.gcn.105
push global.arg_counter
mov
jc
word generator.const.gcn.109 0
pushc generator.const.gcn.109
str generator.const.gcn.110 "hi"
pushc generator.const.gcn.110
word generator.const.gcn.112 1
pushc generator.const.gcn.112
word generator.const.gcn.114 1
pushc generator.const.gcn.114
word generator.const.gcn.116 1
pushc generator.const.gcn.116
word generator.const.gcn.117 3
pushc generator.const.gcn.117
word generator.const.gcn.118 2
pushc generator.const.gcn.118
word generator.const.gcn.120 1
pushcp generator.const.gcn.120
word generator.const.gcn.121 1
pushcp generator.const.gcn.121
newa
pcopy
word generator.const.gcn.123 10
pushc generator.const.gcn.123
swp
word generator.const.gcn.122 0
pushcp generator.const.gcn.122
swp
peekai
pushc clear
word generator.const.gcn.119 1
pushcp generator.const.gcn.119
push global.arg_counter
mov
jc
pushc append
word generator.const.gcn.115 4
pushcp generator.const.gcn.115
push global.arg_counter
mov
jc
pushc remove
word generator.const.gcn.113 2
pushcp generator.const.gcn.113
push global.arg_counter
mov
jc
pushc delete
word generator.const.gcn.111 2
pushcp generator.const.gcn.111
push global.arg_counter
mov
jc
pushc insert
word generator.const.gcn.108 3
pushcp generator.const.gcn.108
push global.arg_counter
mov
jc
pushc println
word generator.const.gcn.107 1
pushcp generator.const.gcn.107
push global.arg_counter
mov
jc
str generator.const.gcn.124 "ne Moscow never sleep!"
pushc generator.const.gcn.124
peek main.s
pop
word generator.const.gcn.127 5
pushc generator.const.gcn.127
word generator.const.gcn.129 2
pushc generator.const.gcn.129
str generator.const.gcn.130 "ne"
pushc generator.const.gcn.130
push main.s
pushc subposex
word generator.const.gcn.128 3
pushcp generator.const.gcn.128
push global.arg_counter
mov
jc
push main.s
pushc substr
word generator.const.gcn.126 3
pushcp generator.const.gcn.126
push global.arg_counter
mov
jc
pushc println
word generator.const.gcn.125 1
pushcp generator.const.gcn.125
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
str generator.const.gcn.131 "["
pushc generator.const.gcn.131
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.132 1
pushcp generator.const.gcn.132
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.133 0
pushc generator.const.gcn.133
peek __printarray.i
pop
generator.while.gcn.134.start:
pushcp generator.while.gcn.134.end
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
word generator.const.gcn.135 1
pushcp generator.const.gcn.135
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
pushcp generator.if.gcn.136.else
push __printarray.l
word generator.const.gcn.137 1
pushc generator.const.gcn.137
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.138 ", "
pushc generator.const.gcn.138
pushc _print
invoke
generator.if.gcn.136.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.134.start
jp
generator.while.gcn.134.end:
str generator.const.gcn.139 "]"
pushc generator.const.gcn.139
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
word generator.const.gcn.141 1
pushcp generator.const.gcn.141
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.142.end
swp
jz
str generator.const.gcn.143 "(null)"
pushc generator.const.gcn.143
pushc _print
invoke
pushcp generator.switch.gcn.140.end
jp
generator.case.gcn.142.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.144.end
swp
jz
push __print.obj
peek global.this
pushc vtable__tostring
swp
pushai
word generator.const.gcn.145 0
pushcp generator.const.gcn.145
push global.arg_counter
mov
jc
pushc _print
invoke
pushcp generator.switch.gcn.140.end
jp
generator.case.gcn.144.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.146.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.147 1
pushcp generator.const.gcn.147
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.140.end
jp
generator.case.gcn.146.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.140.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.148 0
pushcp generator.const.gcn.148
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.149.array
@generator.for_each.gcn.149.i
@generator.for_each.gcn.149.to
push print.args
peek generator.for_each.gcn.149.array
alen
peek generator.for_each.gcn.149.to
pop
pushc global.zero
peek generator.for_each.gcn.149.i
pop
generator.for_each.gcn.149.start:
pushcp generator.for_each.gcn.149.end
push generator.for_each.gcn.149.i
push generator.for_each.gcn.149.to
eq
not
jz
pop
push generator.for_each.gcn.149.i
push generator.for_each.gcn.149.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.150 1
pushcp generator.const.gcn.150
push global.arg_counter
mov
jc
generator.for_each.gcn.149.continue:
push generator.for_each.gcn.149.i
inc
pop
pushcp generator.for_each.gcn.149.start
jp
generator.for_each.gcn.149.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.151 0
pushcp generator.const.gcn.151
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.152.array
@generator.for_each.gcn.152.i
@generator.for_each.gcn.152.to
push println.args
peek generator.for_each.gcn.152.array
alen
peek generator.for_each.gcn.152.to
pop
pushc global.zero
peek generator.for_each.gcn.152.i
pop
generator.for_each.gcn.152.start:
pushcp generator.for_each.gcn.152.end
push generator.for_each.gcn.152.i
push generator.for_each.gcn.152.to
eq
not
jz
pop
push generator.for_each.gcn.152.i
push generator.for_each.gcn.152.array
pushai
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.153 1
pushcp generator.const.gcn.153
push global.arg_counter
mov
jc
generator.for_each.gcn.152.continue:
push generator.for_each.gcn.152.i
inc
pop
pushcp generator.for_each.gcn.152.start
jp
generator.for_each.gcn.152.end:
str generator.const.gcn.154 ""
pushc generator.const.gcn.154
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
word generator.const.gcn.155 7
pushc generator.const.gcn.155
pushc crt_textcolor
invoke
word generator.const.gcn.156 0
pushc generator.const.gcn.156
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
word generator.const.gcn.157 256
pushc generator.const.gcn.157
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
word generator.const.gcn.158 256
pushc generator.const.gcn.158
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
word generator.const.gcn.159 1
pushcp generator.const.gcn.159
push global.arg_counter
mov
jc
peek reversearray.l
pop
word generator.const.gcn.160 0
pushc generator.const.gcn.160
peek reversearray.i
pop
generator.while.gcn.161.start:
pushcp generator.while.gcn.161.end
word generator.const.gcn.162 2
pushc generator.const.gcn.162
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
word generator.const.gcn.163 1
pushc generator.const.gcn.163
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
word generator.const.gcn.164 1
pushc generator.const.gcn.164
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
pushcp generator.while.gcn.161.start
jp
generator.while.gcn.161.end:
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
word generator.const.gcn.165 0
pushc generator.const.gcn.165
swp
pushai
peek getmax.mx
pop
word generator.const.gcn.166 1
pushc generator.const.gcn.166
peek getmax.i
pop
generator.while.gcn.167.start:
pushcp generator.while.gcn.167.end
push getmax.n
push getmax.i
swp
bg
jz
pop
pushcp generator.if.gcn.168.else
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
generator.if.gcn.168.else:
push getmax.i
inc
pop
pushcp generator.while.gcn.167.start
jp
generator.while.gcn.167.end:
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
word generator.const.gcn.169 0
pushc generator.const.gcn.169
swp
pushai
peek getmin.mn
pop
word generator.const.gcn.170 1
pushc generator.const.gcn.170
peek getmin.i
pop
generator.while.gcn.171.start:
pushcp generator.while.gcn.171.end
push getmin.n
push getmin.i
swp
bg
jz
pop
pushcp generator.if.gcn.172.else
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
generator.if.gcn.172.else:
push getmin.i
inc
pop
pushcp generator.while.gcn.171.start
jp
generator.while.gcn.171.end:
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
word generator.const.gcn.173 1
pushc generator.const.gcn.173
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
@generator.for_each.gcn.174.array
@generator.for_each.gcn.174.i
@generator.for_each.gcn.174.to
push partition.high
push partition.low
pushcp system_op_range
jc
peek generator.for_each.gcn.174.array
alen
peek generator.for_each.gcn.174.to
pop
pushc global.zero
peek generator.for_each.gcn.174.i
pop
generator.for_each.gcn.174.start:
pushcp generator.for_each.gcn.174.end
push generator.for_each.gcn.174.i
push generator.for_each.gcn.174.to
eq
not
jz
pop
push generator.for_each.gcn.174.i
push generator.for_each.gcn.174.array
pushai
@partition.j
peek partition.j
pop
pushcp generator.if.gcn.175.else
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
generator.if.gcn.175.else:
generator.for_each.gcn.174.continue:
push generator.for_each.gcn.174.i
inc
pop
pushcp generator.for_each.gcn.174.start
jp
generator.for_each.gcn.174.end:
push partition.arr
word generator.const.gcn.176 1
pushc generator.const.gcn.176
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
word generator.const.gcn.177 1
pushc generator.const.gcn.177
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
word generator.const.gcn.178 1
pushc generator.const.gcn.178
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
pushcp generator.if.gcn.179.else
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
word generator.const.gcn.180 3
pushcp generator.const.gcn.180
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
word generator.const.gcn.182 1
pushc generator.const.gcn.182
push fromtoqsort.pi
copy
swp
pop
sub
push fromtoqsort.low
push fromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.181 3
pushcp generator.const.gcn.181
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
word generator.const.gcn.184 1
pushc generator.const.gcn.184
push fromtoqsort.pi
copy
swp
pop
add
push fromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.183 3
pushcp generator.const.gcn.183
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
generator.if.gcn.179.else:
jr
fromtoqsort__end:
pushcp quicksort__end
jp
quicksort:
@quicksort.this
@quicksort.arr
peek quicksort.arr
pop
word generator.const.gcn.186 1
pushc generator.const.gcn.186
push quicksort.arr
pushc len
word generator.const.gcn.187 1
pushcp generator.const.gcn.187
push global.arg_counter
mov
jc
copy
swp
pop
sub
word generator.const.gcn.188 0
pushc generator.const.gcn.188
push quicksort.arr
pushc fromtoqsort
word generator.const.gcn.185 3
pushcp generator.const.gcn.185
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
generator.while.gcn.189.start:
pushcp generator.while.gcn.189.end
pushc true
jz
pop
word generator.const.gcn.190 2
pushc generator.const.gcn.190
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
pushcp generator.if.gcn.191.else
push fromtobinsearch.arr
push fromtobinsearch.midd
swp
pushai
push fromtobinsearch.key
swp
bg
jz
pop
word generator.const.gcn.192 1
pushc generator.const.gcn.192
push fromtobinsearch.midd
copy
swp
pop
sub
peek fromtobinsearch.right
pop
pushcp generator.if.gcn.191.end
jp
generator.if.gcn.191.else:
pushcp generator.if.gcn.193.else
push fromtobinsearch.arr
push fromtobinsearch.midd
swp
pushai
push fromtobinsearch.key
bg
jz
pop
word generator.const.gcn.194 1
pushc generator.const.gcn.194
push fromtobinsearch.midd
copy
swp
pop
add
peek fromtobinsearch.left
pop
pushcp generator.if.gcn.193.end
jp
generator.if.gcn.193.else:
push fromtobinsearch.midd
jr
generator.if.gcn.193.end:
generator.if.gcn.191.end:
pushcp generator.if.gcn.195.else
push fromtobinsearch.right
push fromtobinsearch.left
bg
jz
pop
push null
jr
generator.if.gcn.195.else:
pushcp generator.while.gcn.189.start
jp
generator.while.gcn.189.end:
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
word generator.const.gcn.196 1
pushcp generator.const.gcn.196
push global.arg_counter
mov
jc
peek binsearch.l
pop
pushcp generator.if.gcn.197.else
word generator.const.gcn.198 0
pushc generator.const.gcn.198
push binsearch.l
bg
jz
pop
push binsearch.key
word generator.const.gcn.200 1
pushc generator.const.gcn.200
push binsearch.l
copy
swp
pop
sub
word generator.const.gcn.201 0
pushc generator.const.gcn.201
push binsearch.arr
pushc fromtobinsearch
word generator.const.gcn.199 4
pushcp generator.const.gcn.199
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.197.end
jp
generator.if.gcn.197.else:
push null
jr
generator.if.gcn.197.end:
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
generator.while.gcn.202.start:
pushcp generator.while.gcn.202.end
pushc true
jz
pop
word generator.const.gcn.203 2
pushc generator.const.gcn.203
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
pushcp generator.if.gcn.204.else
push fromtobinnext.arr
push fromtobinnext.midd
swp
pushai
push fromtobinnext.key
swp
bg
jz
pop
word generator.const.gcn.205 1
pushc generator.const.gcn.205
push fromtobinnext.midd
copy
swp
pop
sub
peek fromtobinnext.right
pop
pushcp generator.if.gcn.204.end
jp
generator.if.gcn.204.else:
pushcp generator.if.gcn.206.else
push fromtobinnext.arr
push fromtobinnext.midd
swp
pushai
push fromtobinnext.key
bg
jz
pop
word generator.const.gcn.207 1
pushc generator.const.gcn.207
push fromtobinnext.midd
copy
swp
pop
add
peek fromtobinnext.left
pop
pushcp generator.if.gcn.206.end
jp
generator.if.gcn.206.else:
push fromtobinnext.midd
jr
generator.if.gcn.206.end:
generator.if.gcn.204.end:
pushcp generator.if.gcn.208.else
push fromtobinnext.right
push fromtobinnext.left
bg
jz
pop
push fromtobinnext.midd
jr
generator.if.gcn.208.else:
pushcp generator.while.gcn.202.start
jp
generator.while.gcn.202.end:
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
word generator.const.gcn.209 1
pushcp generator.const.gcn.209
push global.arg_counter
mov
jc
peek binnext.l
pop
pushcp generator.if.gcn.210.else
word generator.const.gcn.211 0
pushc generator.const.gcn.211
push binnext.l
bg
jz
pop
push binnext.key
word generator.const.gcn.213 1
pushc generator.const.gcn.213
push binnext.l
copy
swp
pop
sub
word generator.const.gcn.214 0
pushc generator.const.gcn.214
push binnext.arr
pushc fromtobinnext
word generator.const.gcn.212 4
pushcp generator.const.gcn.212
push global.arg_counter
mov
jc
peek binnext.r
pop
pushcp generator.if.gcn.215.else
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
pushcp generator.if.gcn.215.end
jp
generator.if.gcn.215.else:
word generator.const.gcn.216 1
pushc generator.const.gcn.216
push binnext.r
copy
swp
pop
add
jr
generator.if.gcn.215.end:
pushcp generator.if.gcn.210.end
jp
generator.if.gcn.210.else:
word generator.const.gcn.217 0
pushc generator.const.gcn.217
jr
generator.if.gcn.210.end:
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
word generator.const.gcn.218 0
pushc generator.const.gcn.218
peek fromtointerpolarsearch.pos
pop
pushc false
peek fromtointerpolarsearch.found
pop
generator.while.gcn.219.start:
pushcp generator.while.gcn.219.end
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
pushcp generator.if.gcn.220.else
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.pos
swp
pushai
swp
bg
jz
pop
word generator.const.gcn.221 1
pushc generator.const.gcn.221
push fromtointerpolarsearch.pos
copy
swp
pop
add
push fromtointerpolarsearch.left
mov
pushcp generator.if.gcn.220.end
jp
generator.if.gcn.220.else:
pushcp generator.if.gcn.222.else
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.pos
swp
pushai
bg
jz
pop
word generator.const.gcn.223 1
pushc generator.const.gcn.223
push fromtointerpolarsearch.pos
copy
swp
pop
sub
push fromtointerpolarsearch.right
mov
pushcp generator.if.gcn.222.end
jp
generator.if.gcn.222.else:
pushc true
push fromtointerpolarsearch.found
mov
generator.if.gcn.222.end:
generator.if.gcn.220.end:
pushcp generator.while.gcn.219.start
jp
generator.while.gcn.219.end:
pushcp generator.if.gcn.224.else
push fromtointerpolarsearch.found
jz
pop
push fromtointerpolarsearch.pos
jr
pushcp generator.if.gcn.224.end
jp
generator.if.gcn.224.else:
push null
jr
generator.if.gcn.224.end:
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
word generator.const.gcn.225 1
pushcp generator.const.gcn.225
push global.arg_counter
mov
jc
peek interpolarsearch.l
pop
pushcp generator.if.gcn.226.else
word generator.const.gcn.227 0
pushc generator.const.gcn.227
push interpolarsearch.l
bg
jz
pop
push interpolarsearch.key
word generator.const.gcn.229 1
pushc generator.const.gcn.229
push interpolarsearch.l
copy
swp
pop
sub
word generator.const.gcn.230 0
pushc generator.const.gcn.230
push interpolarsearch.arr
pushc fromtointerpolarsearch
word generator.const.gcn.228 4
pushcp generator.const.gcn.228
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.226.end
jp
generator.if.gcn.226.else:
push null
jr
generator.if.gcn.226.end:
jr
interpolarsearch__end:
pushcp cut__end
jp
cut:
@cut.this
@cut.s
@cut.from
@cut.count
peek cut.s
pop
peek cut.from
pop
peek cut.count
pop
push cut.from
push cut.count
push cut.s
strd
push cut.s
jr
jr
cut__end:
pushcp substr__end
jp
substr:
@substr.this
@substr.s
@substr.from
@substr.count
@substr.l
@substr.r
peek substr.s
pop
peek substr.from
pop
peek substr.count
pop
push substr.s
pushc len
word generator.const.gcn.231 1
pushcp generator.const.gcn.231
push global.arg_counter
mov
jc
peek substr.l
pop
push substr.l
push substr.count
push substr.from
copy
swp
pop
add
push substr.s
pushc copy
word generator.const.gcn.233 1
pushcp generator.const.gcn.233
push global.arg_counter
mov
jc
pushc cut
word generator.const.gcn.232 3
pushcp generator.const.gcn.232
push global.arg_counter
mov
jc
peek substr.r
pop
pushcp generator.if.gcn.234.else
word generator.const.gcn.235 0
pushc generator.const.gcn.235
push substr.from
bg
jz
pop
push substr.from
word generator.const.gcn.237 0
pushc generator.const.gcn.237
push substr.r
pushc cut
word generator.const.gcn.236 3
pushcp generator.const.gcn.236
push global.arg_counter
mov
jc
generator.if.gcn.234.else:
push substr.r
jr
jr
substr__end:
pushcp leftstr__end
jp
leftstr:
@leftstr.this
@leftstr.s
@leftstr.count
peek leftstr.s
pop
peek leftstr.count
pop
push leftstr.count
word generator.const.gcn.239 0
pushc generator.const.gcn.239
push leftstr.s
pushc substr
word generator.const.gcn.238 3
pushcp generator.const.gcn.238
push global.arg_counter
mov
jc
jr
jr
leftstr__end:
pushcp rightstr__end
jp
rightstr:
@rightstr.this
@rightstr.s
@rightstr.count
peek rightstr.s
pop
peek rightstr.count
pop
push rightstr.count
push rightstr.count
push rightstr.s
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
push rightstr.s
pushc substr
word generator.const.gcn.240 3
pushcp generator.const.gcn.240
push global.arg_counter
mov
jc
jr
jr
rightstr__end:
pushcp subpos__end
jp
subpos:
@subpos.this
@subpos.s
@subpos.sb
@subpos.len_s
@subpos.len_sb
@subpos.founded
@subpos.p
@subpos.t
peek subpos.s
pop
peek subpos.sb
pop
push subpos.s
pushc len
word generator.const.gcn.242 1
pushcp generator.const.gcn.242
push global.arg_counter
mov
jc
peek subpos.len_s
pop
push subpos.sb
pushc len
word generator.const.gcn.243 1
pushcp generator.const.gcn.243
push global.arg_counter
mov
jc
peek subpos.len_sb
pop
pushc false
peek subpos.founded
pop
word generator.const.gcn.244 0
pushc generator.const.gcn.244
peek subpos.p
pop
generator.while.gcn.245.start:
pushcp generator.while.gcn.245.end
push subpos.len_s
push subpos.p
swp
bg
jz
pop
pushcp generator.if.gcn.246.else
push subpos.sb
word generator.const.gcn.247 0
pushc generator.const.gcn.247
swp
pushai
push subpos.s
push subpos.p
swp
pushai
eq
jz
pop
pushc true
push subpos.founded
mov
push subpos.p
pushc copy
word generator.const.gcn.248 1
pushcp generator.const.gcn.248
push global.arg_counter
mov
jc
peek subpos.t
pop
@generator.for_each.gcn.249.array
@generator.for_each.gcn.249.i
@generator.for_each.gcn.249.to
push subpos.sb
peek generator.for_each.gcn.249.array
alen
peek generator.for_each.gcn.249.to
pop
pushc global.zero
peek generator.for_each.gcn.249.i
pop
generator.for_each.gcn.249.start:
pushcp generator.for_each.gcn.249.end
push generator.for_each.gcn.249.i
push generator.for_each.gcn.249.to
eq
not
jz
pop
push generator.for_each.gcn.249.i
push generator.for_each.gcn.249.array
pushai
@subpos.c
peek subpos.c
pop
pushcp generator.if.gcn.250.else
push subpos.c
push subpos.s
push subpos.t
swp
pushai
eq
not
jz
pop
pushc false
push subpos.founded
mov
pushcp generator.for_each.gcn.249.end
jp
generator.if.gcn.250.else:
push subpos.t
inc
pop
generator.for_each.gcn.249.continue:
push generator.for_each.gcn.249.i
inc
pop
pushcp generator.for_each.gcn.249.start
jp
generator.for_each.gcn.249.end:
generator.if.gcn.246.else:
pushcp generator.if.gcn.251.else
push subpos.founded
jz
pop
push subpos.p
jr
generator.if.gcn.251.else:
push subpos.p
inc
pop
pushcp generator.while.gcn.245.start
jp
generator.while.gcn.245.end:
push null
jr
jr
subpos__end:
pushcp subposex__end
jp
subposex:
@subposex.this
@subposex.s
@subposex.sb
@subposex.num
@subposex.len_s
@subposex.len_sb
@subposex.founded
@subposex.p
@subposex.t
peek subposex.s
pop
peek subposex.sb
pop
peek subposex.num
pop
push subposex.s
pushc len
word generator.const.gcn.252 1
pushcp generator.const.gcn.252
push global.arg_counter
mov
jc
peek subposex.len_s
pop
push subposex.sb
pushc len
word generator.const.gcn.253 1
pushcp generator.const.gcn.253
push global.arg_counter
mov
jc
peek subposex.len_sb
pop
pushc false
peek subposex.founded
pop
word generator.const.gcn.254 0
pushc generator.const.gcn.254
peek subposex.p
pop
generator.while.gcn.255.start:
pushcp generator.while.gcn.255.end
push subposex.len_s
push subposex.p
swp
bg
jz
pop
pushcp generator.if.gcn.256.else
push subposex.sb
word generator.const.gcn.257 0
pushc generator.const.gcn.257
swp
pushai
push subposex.s
push subposex.p
swp
pushai
eq
jz
pop
pushc true
push subposex.founded
mov
push subposex.p
pushc copy
word generator.const.gcn.258 1
pushcp generator.const.gcn.258
push global.arg_counter
mov
jc
peek subposex.t
pop
@generator.for_each.gcn.259.array
@generator.for_each.gcn.259.i
@generator.for_each.gcn.259.to
push subposex.sb
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
@subposex.c
peek subposex.c
pop
pushcp generator.if.gcn.260.else
push subposex.c
push subposex.s
push subposex.t
swp
pushai
eq
not
jz
pop
pushc false
push subposex.founded
mov
pushcp generator.for_each.gcn.259.end
jp
generator.if.gcn.260.else:
push subposex.t
inc
pop
generator.for_each.gcn.259.continue:
push generator.for_each.gcn.259.i
inc
pop
pushcp generator.for_each.gcn.259.start
jp
generator.for_each.gcn.259.end:
generator.if.gcn.256.else:
pushcp generator.if.gcn.261.else
push subposex.founded
jz
pop
pushcp generator.if.gcn.262.else
word generator.const.gcn.263 1
pushc generator.const.gcn.263
push subposex.num
bg
jz
pop
push subposex.num
dec
pop
pushc false
push subposex.founded
mov
pushcp generator.if.gcn.262.end
jp
generator.if.gcn.262.else:
push subposex.p
jr
generator.if.gcn.262.end:
generator.if.gcn.261.else:
push subposex.p
inc
pop
pushcp generator.while.gcn.255.start
jp
generator.while.gcn.255.end:
push null
jr
jr
subposex__end:
pushcp s_trimleft__end
jp
s_trimleft:
@s_trimleft.this
@s_trimleft.s
@s_trimleft.r
peek s_trimleft.s
pop
push s_trimleft.s
pushc copy
word generator.const.gcn.264 1
pushcp generator.const.gcn.264
push global.arg_counter
mov
jc
peek s_trimleft.r
pop
generator.while.gcn.265.start:
pushcp generator.while.gcn.265.end
word generator.const.gcn.266 0
pushc generator.const.gcn.266
push s_trimleft.r
pushc len
word generator.const.gcn.267 1
pushcp generator.const.gcn.267
push global.arg_counter
mov
jc
bg
jz
pop
pushcp generator.if.gcn.268.else
str generator.const.gcn.269 " "
pushc generator.const.gcn.269
push s_trimleft.r
word generator.const.gcn.270 0
pushc generator.const.gcn.270
swp
pushai
eq
jz
pop
word generator.const.gcn.272 1
pushc generator.const.gcn.272
word generator.const.gcn.273 0
pushc generator.const.gcn.273
push s_trimleft.r
pushc cut
word generator.const.gcn.271 3
pushcp generator.const.gcn.271
push global.arg_counter
mov
jc
pushcp generator.if.gcn.268.end
jp
generator.if.gcn.268.else:
pushcp generator.while.gcn.265.end
jp
generator.if.gcn.268.end:
pushcp generator.while.gcn.265.start
jp
generator.while.gcn.265.end:
push s_trimleft.r
jr
jr
s_trimleft__end:
pushcp s_trimright__end
jp
s_trimright:
@s_trimright.this
@s_trimright.s
@s_trimright.r
@s_trimright.l
peek s_trimright.s
pop
push s_trimright.s
pushc copy
word generator.const.gcn.274 1
pushcp generator.const.gcn.274
push global.arg_counter
mov
jc
peek s_trimright.r
pop
push s_trimright.r
pushc len
word generator.const.gcn.275 1
pushcp generator.const.gcn.275
push global.arg_counter
mov
jc
peek s_trimright.l
pop
generator.while.gcn.276.start:
pushcp generator.while.gcn.276.end
word generator.const.gcn.277 0
pushc generator.const.gcn.277
push s_trimright.l
bg
jz
pop
pushcp generator.if.gcn.278.else
str generator.const.gcn.279 " "
pushc generator.const.gcn.279
push s_trimright.r
word generator.const.gcn.280 1
pushc generator.const.gcn.280
push s_trimright.l
copy
swp
pop
sub
swp
pushai
eq
jz
pop
word generator.const.gcn.282 1
pushc generator.const.gcn.282
word generator.const.gcn.283 1
pushc generator.const.gcn.283
push s_trimright.l
copy
swp
pop
sub
push s_trimright.r
pushc cut
word generator.const.gcn.281 3
pushcp generator.const.gcn.281
push global.arg_counter
mov
jc
push s_trimright.l
dec
pop
pushcp generator.if.gcn.278.end
jp
generator.if.gcn.278.else:
pushcp generator.while.gcn.276.end
jp
generator.if.gcn.278.end:
pushcp generator.while.gcn.276.start
jp
generator.while.gcn.276.end:
push s_trimright.r
jr
jr
s_trimright__end:
pushcp trim__end
jp
trim:
@trim.this
@trim.s
@trim.r
peek trim.s
pop
push trim.s
pushc copy
word generator.const.gcn.284 1
pushcp generator.const.gcn.284
push global.arg_counter
mov
jc
peek trim.r
pop
push trim.r
pushc s_trimright
word generator.const.gcn.285 1
pushcp generator.const.gcn.285
push global.arg_counter
mov
jc
push trim.r
mov
push trim.r
pushc s_trimleft
word generator.const.gcn.286 1
pushcp generator.const.gcn.286
push global.arg_counter
mov
jc
push trim.r
mov
push trim.r
jr
jr
trim__end:
pushcp replace__end
jp
replace:
@replace.this
@replace.s
@replace.from
@replace.to
@replace.flags
@replace.r
@replace.p
peek replace.s
pop
peek replace.from
pop
peek replace.to
pop
peek replace.flags
pop
push replace.s
pushc copy
word generator.const.gcn.287 1
pushcp generator.const.gcn.287
push global.arg_counter
mov
jc
peek replace.r
pop
word generator.const.gcn.288 0
pushc generator.const.gcn.288
peek replace.p
pop
generator.while.gcn.289.start:
pushcp generator.while.gcn.289.end
push null
push replace.p
eq
not
jz
pop
pushcp generator.if.gcn.290.else
push replace.flags
pushc srfignorecase
pushcp system_op_in
jc
jz
pop
push replace.from
pushc strupper
invoke
push replace.r
pushc strupper
invoke
pushc subpos
word generator.const.gcn.291 2
pushcp generator.const.gcn.291
push global.arg_counter
mov
jc
peek replace.p
pop
pushcp generator.if.gcn.290.end
jp
generator.if.gcn.290.else:
push replace.from
push replace.r
pushc subpos
word generator.const.gcn.292 2
pushcp generator.const.gcn.292
push global.arg_counter
mov
jc
peek replace.p
pop
generator.if.gcn.290.end:
pushcp generator.if.gcn.293.else
push null
push replace.p
eq
not
jz
pop
push replace.r
pushc len
word generator.const.gcn.295 1
pushcp generator.const.gcn.295
push global.arg_counter
mov
jc
push replace.from
pushc len
word generator.const.gcn.296 1
pushcp generator.const.gcn.296
push global.arg_counter
mov
jc
push replace.p
copy
swp
pop
add
push replace.r
pushc substr
word generator.const.gcn.294 3
pushcp generator.const.gcn.294
push global.arg_counter
mov
jc
push replace.to
push replace.p
word generator.const.gcn.298 0
pushc generator.const.gcn.298
push replace.r
pushc substr
word generator.const.gcn.297 3
pushcp generator.const.gcn.297
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
push replace.r
mov
pushcp generator.if.gcn.299.else
push replace.flags
pushc srfreplaceall
pushcp system_op_in
jc
copy
swp
pop
not
jz
pop
pushcp generator.while.gcn.289.end
jp
generator.if.gcn.299.else:
generator.if.gcn.293.else:
pushcp generator.while.gcn.289.start
jp
generator.while.gcn.289.end:
push replace.r
jr
jr
replace__end:
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
pushcp generator.if.gcn.300.else
push system_op_range.isback
jz
pop
word generator.const.gcn.301 1
pushc generator.const.gcn.301
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
pushcp generator.if.gcn.300.end
jp
generator.if.gcn.300.else:
word generator.const.gcn.302 1
pushc generator.const.gcn.302
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
generator.if.gcn.300.end:
push system_op_range.l
word generator.const.gcn.303 1
pushcp generator.const.gcn.303
newa
peek system_op_range.res
pop
word generator.const.gcn.304 0
pushc generator.const.gcn.304
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.305 1
pushcp generator.const.gcn.305
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.306.start:
pushcp generator.while.gcn.306.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.307 1
pushcp generator.const.gcn.307
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
pushcp generator.if.gcn.308.else
push system_op_range.isback
jz
pop
word generator.const.gcn.309 1
pushc generator.const.gcn.309
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.308.end
jp
generator.if.gcn.308.else:
word generator.const.gcn.310 1
pushc generator.const.gcn.310
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.308.end:
pushcp generator.while.gcn.306.start
jp
generator.while.gcn.306.end:
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
word generator.const.gcn.311 2
pushcp generator.const.gcn.311
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
word generator.const.gcn.312 0
pushc generator.const.gcn.312
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.313 1
pushcp generator.const.gcn.313
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.314.start:
pushcp generator.while.gcn.314.end
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
pushcp generator.while.gcn.314.start
jp
generator.while.gcn.314.end:
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
pushcp generator.if.gcn.315.else
word generator.const.gcn.316 255
pushc generator.const.gcn.316
push typeof.t
eq
jz
pop
push null
jr
generator.if.gcn.315.else:
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
word generator.const.gcn.317 1
pushcp generator.const.gcn.317
push global.arg_counter
mov
jc
peek system_op_is.t
pop
pushcp generator.if.gcn.318.else
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
pushcp generator.if.gcn.318.end
jp
generator.if.gcn.318.else:
push system_op_is.right
push system_op_is.t
eq
jr
generator.if.gcn.318.end:
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
word generator.const.gcn.319 1
pushcp generator.const.gcn.319
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.320 1
pushcp generator.const.gcn.320
newa
peek system_copy_array.r
pop
word generator.const.gcn.321 0
pushc generator.const.gcn.321
peek system_copy_array.i
pop
generator.while.gcn.322.start:
pushcp generator.while.gcn.322.end
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
word generator.const.gcn.323 1
pushcp generator.const.gcn.323
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
pushcp generator.while.gcn.322.start
jp
generator.while.gcn.322.end:
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
pushcp generator.if.gcn.324.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.325 1
pushcp generator.const.gcn.325
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.326 1
pushcp generator.const.gcn.326
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.324.end
jp
generator.if.gcn.324.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.327 1
pushcp generator.const.gcn.327
push global.arg_counter
mov
jc
jr
generator.if.gcn.324.end:
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
word generator.const.gcn.328 0
pushcp generator.const.gcn.328
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.329 ""
pushc generator.const.gcn.329
peek chr.r
pop
@generator.for_each.gcn.330.array
@generator.for_each.gcn.330.i
@generator.for_each.gcn.330.to
push chr.chars
peek generator.for_each.gcn.330.array
alen
peek generator.for_each.gcn.330.to
pop
pushc global.zero
peek generator.for_each.gcn.330.i
pop
generator.for_each.gcn.330.start:
pushcp generator.for_each.gcn.330.end
push generator.for_each.gcn.330.i
push generator.for_each.gcn.330.to
eq
not
jz
pop
push generator.for_each.gcn.330.i
push generator.for_each.gcn.330.array
pushai
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.331 1
pushcp generator.const.gcn.331
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.330.continue:
push generator.for_each.gcn.330.i
inc
pop
pushcp generator.for_each.gcn.330.start
jp
generator.for_each.gcn.330.end:
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
word generator.const.gcn.333 1
pushcp generator.const.gcn.333
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.334.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.332.end
jp
generator.case.gcn.334.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.335.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.332.end
jp
generator.case.gcn.335.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.336.end
swp
jz
push str.value
pushc f2s
invoke
jr
pushcp generator.switch.gcn.332.end
jp
generator.case.gcn.336.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.337.end
swp
jz
push str.value
jr
pushcp generator.switch.gcn.332.end
jp
generator.case.gcn.337.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.339 "Invalid type cast via str()."
pushc generator.const.gcn.339
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.338 1
pushcp generator.const.gcn.338
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.332.end:
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
word generator.const.gcn.341 1
pushcp generator.const.gcn.341
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.342.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.340.end
jp
generator.case.gcn.342.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.343.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.340.end
jp
generator.case.gcn.343.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.344.end
swp
jz
word generator.const.gcn.345 1
pushc generator.const.gcn.345
push int.value
copy
swp
pop
idiv
jr
pushcp generator.switch.gcn.340.end
jp
generator.case.gcn.344.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.346.end
swp
jz
push int.value
pushc s2i
invoke
jr
pushcp generator.switch.gcn.340.end
jp
generator.case.gcn.346.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.348 "Invalid type cast via int()."
pushc generator.const.gcn.348
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.347 1
pushcp generator.const.gcn.347
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.340.end:
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
push real.value
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
push real.value
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
push real.value
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
push real.value
pushc s2f
invoke
jr
pushcp generator.switch.gcn.349.end
jp
generator.case.gcn.354.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.356 "Invalid type cast via int()."
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
pushcp generator.if.gcn.357.else
push check.cond
jz
pop
push check.rtrue
jr
pushcp generator.if.gcn.357.end
jp
generator.if.gcn.357.else:
push check.rfalse
jr
generator.if.gcn.357.end:
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
pushcp generator.if.gcn.358.else
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
generator.if.gcn.358.else:
word generator.const.gcn.359 2
pushcp generator.const.gcn.359
word generator.const.gcn.360 1
pushcp generator.const.gcn.360
newa
pcopy
push between.left
swp
word generator.const.gcn.361 0
pushcp generator.const.gcn.361
swp
peekai
pcopy
push between.right
swp
word generator.const.gcn.362 1
pushcp generator.const.gcn.362
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
pushcp generator.if.gcn.363.else
word generator.const.gcn.364 0
pushc generator.const.gcn.364
push maxfromarray.arr
pushc len
word generator.const.gcn.365 1
pushcp generator.const.gcn.365
push global.arg_counter
mov
jc
bg
jz
pop
push maxfromarray.arr
word generator.const.gcn.366 0
pushc generator.const.gcn.366
swp
pushai
peek maxfromarray.r
pop
@generator.for_each.gcn.367.array
@generator.for_each.gcn.367.i
@generator.for_each.gcn.367.to
push maxfromarray.arr
peek generator.for_each.gcn.367.array
alen
peek generator.for_each.gcn.367.to
pop
pushc global.zero
peek generator.for_each.gcn.367.i
pop
generator.for_each.gcn.367.start:
pushcp generator.for_each.gcn.367.end
push generator.for_each.gcn.367.i
push generator.for_each.gcn.367.to
eq
not
jz
pop
push generator.for_each.gcn.367.i
push generator.for_each.gcn.367.array
pushai
@maxfromarray.x
peek maxfromarray.x
pop
pushcp generator.if.gcn.368.else
push maxfromarray.r
push maxfromarray.x
bg
jz
pop
push maxfromarray.x
push maxfromarray.r
mov
generator.if.gcn.368.else:
generator.for_each.gcn.367.continue:
push generator.for_each.gcn.367.i
inc
pop
pushcp generator.for_each.gcn.367.start
jp
generator.for_each.gcn.367.end:
push maxfromarray.r
jr
pushcp generator.if.gcn.363.end
jp
generator.if.gcn.363.else:
push null
jr
generator.if.gcn.363.end:
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
pushcp generator.if.gcn.369.else
word generator.const.gcn.370 0
pushc generator.const.gcn.370
push minfromarray.arr
pushc len
word generator.const.gcn.371 1
pushcp generator.const.gcn.371
push global.arg_counter
mov
jc
bg
jz
pop
push minfromarray.arr
word generator.const.gcn.372 0
pushc generator.const.gcn.372
swp
pushai
peek minfromarray.r
pop
@generator.for_each.gcn.373.array
@generator.for_each.gcn.373.i
@generator.for_each.gcn.373.to
push minfromarray.arr
peek generator.for_each.gcn.373.array
alen
peek generator.for_each.gcn.373.to
pop
pushc global.zero
peek generator.for_each.gcn.373.i
pop
generator.for_each.gcn.373.start:
pushcp generator.for_each.gcn.373.end
push generator.for_each.gcn.373.i
push generator.for_each.gcn.373.to
eq
not
jz
pop
push generator.for_each.gcn.373.i
push generator.for_each.gcn.373.array
pushai
@minfromarray.x
peek minfromarray.x
pop
pushcp generator.if.gcn.374.else
push minfromarray.r
push minfromarray.x
swp
bg
jz
pop
push minfromarray.x
push minfromarray.r
mov
generator.if.gcn.374.else:
generator.for_each.gcn.373.continue:
push generator.for_each.gcn.373.i
inc
pop
pushcp generator.for_each.gcn.373.start
jp
generator.for_each.gcn.373.end:
push minfromarray.r
jr
pushcp generator.if.gcn.369.end
jp
generator.if.gcn.369.else:
push null
jr
generator.if.gcn.369.end:
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
word generator.const.gcn.375 0
pushcp generator.const.gcn.375
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
push max.args
pushc len
word generator.const.gcn.376 1
pushcp generator.const.gcn.376
push global.arg_counter
mov
jc
peek max.l
pop
pushcp generator.if.gcn.377.else
word generator.const.gcn.378 0
pushc generator.const.gcn.378
push max.l
bg
jz
pop
push max.args
word generator.const.gcn.379 0
pushc generator.const.gcn.379
swp
pushai
peek max.first
pop
pushcp generator.if.gcn.380.else
pushc typearray
push max.first
pushcp system_op_is
jc
jz
pop
push max.first
pushc maxfromarray
word generator.const.gcn.381 1
pushcp generator.const.gcn.381
push global.arg_counter
mov
jc
peek max.r
pop
pushcp generator.if.gcn.380.end
jp
generator.if.gcn.380.else:
push max.first
peek max.r
pop
generator.if.gcn.380.end:
word generator.const.gcn.382 1
pushc generator.const.gcn.382
peek max.i
pop
generator.while.gcn.383.start:
pushcp generator.while.gcn.383.end
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
pushcp generator.if.gcn.384.else
pushc typearray
push max.t
pushcp system_op_is
jc
jz
pop
push max.t
pushc maxfromarray
word generator.const.gcn.385 1
pushcp generator.const.gcn.385
push global.arg_counter
mov
jc
peek max._
pop
pushcp generator.if.gcn.386.else
push max.r
push max._
bg
jz
pop
push max._
push max.r
mov
generator.if.gcn.386.else:
pushcp generator.if.gcn.384.end
jp
generator.if.gcn.384.else:
pushcp generator.if.gcn.387.else
push max.r
push max.t
bg
jz
pop
push max.t
push max.r
mov
generator.if.gcn.387.else:
generator.if.gcn.384.end:
push max.i
inc
pop
pushcp generator.while.gcn.383.start
jp
generator.while.gcn.383.end:
push max.r
jr
pushcp generator.if.gcn.377.end
jp
generator.if.gcn.377.else:
push null
jr
generator.if.gcn.377.end:
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
word generator.const.gcn.388 0
pushcp generator.const.gcn.388
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
push min.args
pushc len
word generator.const.gcn.389 1
pushcp generator.const.gcn.389
push global.arg_counter
mov
jc
peek min.l
pop
pushcp generator.if.gcn.390.else
word generator.const.gcn.391 0
pushc generator.const.gcn.391
push min.l
bg
jz
pop
push min.args
word generator.const.gcn.392 0
pushc generator.const.gcn.392
swp
pushai
peek min.first
pop
pushcp generator.if.gcn.393.else
pushc typearray
push min.first
pushcp system_op_is
jc
jz
pop
push min.first
pushc minfromarray
word generator.const.gcn.394 1
pushcp generator.const.gcn.394
push global.arg_counter
mov
jc
peek min.r
pop
pushcp generator.if.gcn.393.end
jp
generator.if.gcn.393.else:
push min.first
peek min.r
pop
generator.if.gcn.393.end:
word generator.const.gcn.395 1
pushc generator.const.gcn.395
peek min.i
pop
push min.args
pushc len
word generator.const.gcn.396 1
pushcp generator.const.gcn.396
push global.arg_counter
mov
jc
peek min.l
pop
generator.while.gcn.397.start:
pushcp generator.while.gcn.397.end
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
pushcp generator.if.gcn.398.else
pushc typearray
push min.t
pushcp system_op_is
jc
jz
pop
push min.t
pushc minfromarray
word generator.const.gcn.399 1
pushcp generator.const.gcn.399
push global.arg_counter
mov
jc
peek min._
pop
pushcp generator.if.gcn.400.else
push min.r
push min._
swp
bg
jz
pop
push min._
push min.r
mov
generator.if.gcn.400.else:
pushcp generator.if.gcn.398.end
jp
generator.if.gcn.398.else:
pushcp generator.if.gcn.401.else
push min.r
push min.t
swp
bg
jz
pop
push min.t
push min.r
mov
generator.if.gcn.401.else:
generator.if.gcn.398.end:
push min.i
inc
pop
pushcp generator.while.gcn.397.start
jp
generator.while.gcn.397.end:
push min.r
jr
pushcp generator.if.gcn.390.end
jp
generator.if.gcn.390.else:
push null
jr
generator.if.gcn.390.end:
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
word generator.const.gcn.402 1
pushcp generator.const.gcn.402
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek append.values
pop
push append.array
pushc len
word generator.const.gcn.403 1
pushcp generator.const.gcn.403
push global.arg_counter
mov
jc
peek append.i
pop
push append.values
pushc len
word generator.const.gcn.404 1
pushcp generator.const.gcn.404
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
word generator.const.gcn.405 2
pushcp generator.const.gcn.405
push global.arg_counter
mov
jc
@generator.for_each.gcn.406.array
@generator.for_each.gcn.406.i
@generator.for_each.gcn.406.to
push append.values
peek generator.for_each.gcn.406.array
alen
peek generator.for_each.gcn.406.to
pop
pushc global.zero
peek generator.for_each.gcn.406.i
pop
generator.for_each.gcn.406.start:
pushcp generator.for_each.gcn.406.end
push generator.for_each.gcn.406.i
push generator.for_each.gcn.406.to
eq
not
jz
pop
push generator.for_each.gcn.406.i
push generator.for_each.gcn.406.array
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
generator.for_each.gcn.406.continue:
push generator.for_each.gcn.406.i
inc
pop
pushcp generator.for_each.gcn.406.start
jp
generator.for_each.gcn.406.end:
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
word generator.const.gcn.407 1
pushcp generator.const.gcn.407
push global.arg_counter
mov
jc
peek reverse.l
pop
word generator.const.gcn.408 2
pushc generator.const.gcn.408
push reverse.l
copy
swp
pop
idiv
peek reverse.hl
pop
word generator.const.gcn.409 0
pushc generator.const.gcn.409
peek reverse.i
pop
generator.while.gcn.410.start:
pushcp generator.while.gcn.410.end
push reverse.hl
push reverse.i
swp
bg
jz
pop
push reverse.array
word generator.const.gcn.411 1
pushc generator.const.gcn.411
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
word generator.const.gcn.412 1
pushc generator.const.gcn.412
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
pushcp generator.while.gcn.410.start
jp
generator.while.gcn.410.end:
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
word generator.const.gcn.413 0
pushc generator.const.gcn.413
peek indexof.i
pop
@generator.for_each.gcn.414.array
@generator.for_each.gcn.414.i
@generator.for_each.gcn.414.to
push indexof.array
peek generator.for_each.gcn.414.array
alen
peek generator.for_each.gcn.414.to
pop
pushc global.zero
peek generator.for_each.gcn.414.i
pop
generator.for_each.gcn.414.start:
pushcp generator.for_each.gcn.414.end
push generator.for_each.gcn.414.i
push generator.for_each.gcn.414.to
eq
not
jz
pop
push generator.for_each.gcn.414.i
push generator.for_each.gcn.414.array
pushai
@indexof.x
peek indexof.x
pop
pushcp generator.if.gcn.415.else
pushc typeclass
push indexof.x
pushcp system_op_is
jc
jz
pop
pushcp generator.if.gcn.416.else
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
generator.if.gcn.416.else:
pushcp generator.if.gcn.415.end
jp
generator.if.gcn.415.else:
pushcp generator.if.gcn.417.else
push indexof.object
push indexof.x
eq
jz
pop
push indexof.i
jr
generator.if.gcn.417.else:
generator.if.gcn.415.end:
push indexof.i
inc
pop
generator.for_each.gcn.414.continue:
push generator.for_each.gcn.414.i
inc
pop
pushcp generator.for_each.gcn.414.start
jp
generator.for_each.gcn.414.end:
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
word generator.const.gcn.418 1
pushcp generator.const.gcn.418
push global.arg_counter
mov
jc
peek insert.l
pop
word generator.const.gcn.420 1
pushc generator.const.gcn.420
push insert.l
copy
swp
pop
add
push insert.array
pushc setlen
word generator.const.gcn.419 2
pushcp generator.const.gcn.419
push global.arg_counter
mov
jc
generator.while.gcn.421.start:
pushcp generator.while.gcn.421.end
push insert.index
push insert.l
bg
jz
pop
push insert.array
word generator.const.gcn.422 1
pushc generator.const.gcn.422
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
pushcp generator.while.gcn.421.start
jp
generator.while.gcn.421.end:
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
word generator.const.gcn.423 1
pushcp generator.const.gcn.423
push global.arg_counter
mov
jc
peek delete.i
pop
word generator.const.gcn.424 1
pushc generator.const.gcn.424
push delete.array
pushc len
word generator.const.gcn.425 1
pushcp generator.const.gcn.425
push global.arg_counter
mov
jc
copy
swp
pop
sub
peek delete.l
pop
generator.while.gcn.426.start:
pushcp generator.while.gcn.426.end
push delete.l
push delete.i
swp
bg
jz
pop
push delete.array
word generator.const.gcn.427 1
pushc generator.const.gcn.427
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
pushcp generator.while.gcn.426.start
jp
generator.while.gcn.426.end:
push delete.i
push delete.array
pushc setlen
word generator.const.gcn.428 2
pushcp generator.const.gcn.428
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
word generator.const.gcn.429 2
pushcp generator.const.gcn.429
push global.arg_counter
mov
jc
peek remove.index
pop
pushcp generator.if.gcn.430.else
push null
push remove.index
eq
not
jz
pop
push remove.index
push remove.array
pushc delete
word generator.const.gcn.431 2
pushcp generator.const.gcn.431
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.430.end
jp
generator.if.gcn.430.else:
push remove.array
jr
generator.if.gcn.430.end:
jr
remove__end:
pushcp clear__end
jp
clear:
@clear.this
@clear.array
peek clear.array
pop
word generator.const.gcn.433 0
pushc generator.const.gcn.433
push clear.array
pushc setlen
word generator.const.gcn.432 2
pushcp generator.const.gcn.432
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
word generator.const.gcn.434 0
pushc generator.const.gcn.434
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.435 1
pushcp generator.const.gcn.435
newa
peek params
pop
word generator.const.gcn.436 0
pushc generator.const.gcn.436
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.437.start:
pushcp generator.while.gcn.437.end
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
pushcp generator.while.gcn.437.start
jp
generator.while.gcn.437.end:
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
str generator.const.gcn.438 "'."
pushc generator.const.gcn.438
push exception__tostring.this
pushc vtable__message
swp
pushai
str generator.const.gcn.439 ">, message: '"
pushc generator.const.gcn.439
push exception__tostring.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.440 "Exception <"
pushc generator.const.gcn.440
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
pushcp generator.if.gcn.441.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.441.end
jp
generator.if.gcn.441.else:
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
generator.if.gcn.441.end:
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
word generator.const.gcn.442 1
pushc generator.const.gcn.442
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
word generator.const.gcn.443 1
pushc generator.const.gcn.443
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
real generator.const.gcn.445 0.5
pushc generator.const.gcn.445
push round.a
copy
swp
pop
add
pushc trunc
word generator.const.gcn.444 1
pushcp generator.const.gcn.444
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
real generator.const.gcn.447 0.999999
pushc generator.const.gcn.447
push ceil.a
copy
swp
pop
add
pushc trunc
word generator.const.gcn.446 1
pushcp generator.const.gcn.446
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
pushcp generator.if.gcn.448.else
word generator.const.gcn.449 0
pushc generator.const.gcn.449
push abs.a
bg
jz
pop
push abs.a
pushcp generator.if.gcn.448.end
jp
generator.if.gcn.448.else:
push abs.a
copy
swp
pop
neg
generator.if.gcn.448.end:
jr
abs__end:
pushcp sgn__end
jp
sgn:
@sgn.this
@sgn.a
peek sgn.a
pop
pushcp generator.if.gcn.450.else
word generator.const.gcn.451 0
pushc generator.const.gcn.451
push sgn.a
eq
jz
pop
word generator.const.gcn.452 0
pushc generator.const.gcn.452
jr
generator.if.gcn.450.else:
pushcp generator.if.gcn.453.else
word generator.const.gcn.454 0
pushc generator.const.gcn.454
push sgn.a
swp
bg
jz
pop
word generator.const.gcn.455 1
pushc generator.const.gcn.455
copy
swp
pop
neg
jr
pushcp generator.if.gcn.453.end
jp
generator.if.gcn.453.else:
word generator.const.gcn.456 1
pushc generator.const.gcn.456
jr
generator.if.gcn.453.end:
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
word generator.const.gcn.457 2
pushcp generator.const.gcn.457
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
pushcp generator.if.gcn.458.else
word generator.const.gcn.459 0
pushc generator.const.gcn.459
push power.n
eq
jz
pop
word generator.const.gcn.460 1
pushc generator.const.gcn.460
jr
pushcp generator.if.gcn.458.end
jp
generator.if.gcn.458.else:
pushcp generator.if.gcn.461.else
word generator.const.gcn.462 0
pushc generator.const.gcn.462
push power.a
eq
jz
pop
word generator.const.gcn.463 0
pushc generator.const.gcn.463
jr
pushcp generator.if.gcn.461.end
jp
generator.if.gcn.461.else:
push power.n
push power.a
pushc log
word generator.const.gcn.465 1
pushcp generator.const.gcn.465
push global.arg_counter
mov
jc
copy
swp
pop
mul
pushc exp
word generator.const.gcn.464 1
pushcp generator.const.gcn.464
push global.arg_counter
mov
jc
jr
generator.if.gcn.461.end:
generator.if.gcn.458.end:
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
word generator.const.gcn.467 2
pushcp generator.const.gcn.467
push global.arg_counter
mov
jc
pushc round
word generator.const.gcn.466 1
pushcp generator.const.gcn.466
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
pushcp generator.if.gcn.468.else
word generator.const.gcn.469 0
pushc generator.const.gcn.469
push sqrt.a
be
jz
pop
real generator.const.gcn.471 0.5
pushc generator.const.gcn.471
push sqrt.a
pushc power
word generator.const.gcn.470 2
pushcp generator.const.gcn.470
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.468.end
jp
generator.if.gcn.468.else:
push null
jr
generator.if.gcn.468.end:
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
word generator.const.gcn.472 1
pushc generator.const.gcn.472
peek factorial.r
pop
word generator.const.gcn.473 0
pushc generator.const.gcn.473
peek factorial.i
pop
generator.while.gcn.474.start:
pushcp generator.while.gcn.474.end
push factorial.a
push factorial.i
swp
bg
jz
pop
word generator.const.gcn.475 1
pushc generator.const.gcn.475
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
pushcp generator.while.gcn.474.start
jp
generator.while.gcn.474.end:
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
word generator.const.gcn.476 1
pushcp generator.const.gcn.476
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
word generator.const.gcn.477 180
pushc generator.const.gcn.477
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
word generator.const.gcn.478 180
pushc generator.const.gcn.478
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
word generator.const.gcn.479 2
pushc generator.const.gcn.479
push sinh.a
copy
swp
pop
neg
pushc m_e
pushc power
word generator.const.gcn.480 2
pushcp generator.const.gcn.480
push global.arg_counter
mov
jc
push sinh.a
pushc m_e
pushc power
word generator.const.gcn.481 2
pushcp generator.const.gcn.481
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
word generator.const.gcn.482 2
pushc generator.const.gcn.482
push cosh.a
copy
swp
pop
neg
pushc m_e
pushc power
word generator.const.gcn.483 2
pushcp generator.const.gcn.483
push global.arg_counter
mov
jc
push cosh.a
pushc m_e
pushc power
word generator.const.gcn.484 2
pushcp generator.const.gcn.484
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
word generator.const.gcn.485 1
pushcp generator.const.gcn.485
push global.arg_counter
mov
jc
word generator.const.gcn.486 1
pushc generator.const.gcn.486
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
word generator.const.gcn.487 1
pushcp generator.const.gcn.487
push global.arg_counter
mov
jc
word generator.const.gcn.488 1
pushc generator.const.gcn.488
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
word generator.const.gcn.489 1
pushcp generator.const.gcn.489
push global.arg_counter
mov
jc
push tgh.a
pushc sinh
word generator.const.gcn.490 1
pushcp generator.const.gcn.490
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
word generator.const.gcn.491 1
pushcp generator.const.gcn.491
push global.arg_counter
mov
jc
word generator.const.gcn.492 1
pushc generator.const.gcn.492
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
word generator.const.gcn.495 1
pushc generator.const.gcn.495
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
word generator.const.gcn.494 1
pushcp generator.const.gcn.494
push global.arg_counter
mov
jc
push arcsinh.a
copy
swp
pop
add
pushc log
word generator.const.gcn.493 1
pushcp generator.const.gcn.493
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
word generator.const.gcn.498 1
pushc generator.const.gcn.498
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
word generator.const.gcn.497 1
pushcp generator.const.gcn.497
push global.arg_counter
mov
jc
push arccosh.a
copy
swp
pop
add
pushc log
word generator.const.gcn.496 1
pushcp generator.const.gcn.496
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
word generator.const.gcn.499 2
pushc generator.const.gcn.499
push arctgh.a
word generator.const.gcn.501 1
pushc generator.const.gcn.501
copy
swp
pop
sub
push arctgh.a
word generator.const.gcn.502 1
pushc generator.const.gcn.502
copy
swp
pop
add
copy
swp
pop
div
pushc log
word generator.const.gcn.500 1
pushcp generator.const.gcn.500
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
word generator.const.gcn.503 2
pushc generator.const.gcn.503
word generator.const.gcn.505 1
pushc generator.const.gcn.505
push arcctgh.a
copy
swp
pop
sub
word generator.const.gcn.506 1
pushc generator.const.gcn.506
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
word generator.const.gcn.504 1
pushcp generator.const.gcn.504
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
str generator.const.gcn.508 ""
pushc generator.const.gcn.508
str generator.const.gcn.509 "0"
pushc generator.const.gcn.509
word generator.const.gcn.510 0
pushc generator.const.gcn.510
push complex__tostring.this
pushc vtable__im
swp
pushai
eq
word generator.const.gcn.511 0
pushc generator.const.gcn.511
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
word generator.const.gcn.507 3
pushcp generator.const.gcn.507
push global.arg_counter
mov
jc
str generator.const.gcn.513 ""
pushc generator.const.gcn.513
str generator.const.gcn.515 "i"
pushc generator.const.gcn.515
push complex__tostring.this
pushc vtable__im
swp
pushai
str generator.const.gcn.516 ""
pushc generator.const.gcn.516
copy
swp
pop
add
copy
swp
pop
add
str generator.const.gcn.518 "-i"
pushc generator.const.gcn.518
str generator.const.gcn.519 "i"
pushc generator.const.gcn.519
word generator.const.gcn.520 0
pushc generator.const.gcn.520
push complex__tostring.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.517 3
pushcp generator.const.gcn.517
push global.arg_counter
mov
jc
word generator.const.gcn.521 1
pushc generator.const.gcn.521
push complex__tostring.this
pushc vtable__im
swp
pushai
pushc abs
word generator.const.gcn.522 1
pushcp generator.const.gcn.522
push global.arg_counter
mov
jc
eq
pushc check
word generator.const.gcn.514 3
pushcp generator.const.gcn.514
push global.arg_counter
mov
jc
str generator.const.gcn.524 ""
pushc generator.const.gcn.524
str generator.const.gcn.526 ""
pushc generator.const.gcn.526
str generator.const.gcn.527 "+"
pushc generator.const.gcn.527
word generator.const.gcn.528 0
pushc generator.const.gcn.528
push complex__tostring.this
pushc vtable__re
swp
pushai
eq
not
pushc check
word generator.const.gcn.525 3
pushcp generator.const.gcn.525
push global.arg_counter
mov
jc
word generator.const.gcn.529 0
pushc generator.const.gcn.529
push complex__tostring.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.523 3
pushcp generator.const.gcn.523
push global.arg_counter
mov
jc
copy
swp
pop
add
word generator.const.gcn.530 0
pushc generator.const.gcn.530
push complex__tostring.this
pushc vtable__im
swp
pushai
eq
not
pushc check
word generator.const.gcn.512 3
pushcp generator.const.gcn.512
push global.arg_counter
mov
jc
str generator.const.gcn.532 ""
pushc generator.const.gcn.532
push complex__tostring.this
pushc vtable__re
swp
pushai
str generator.const.gcn.533 ""
pushc generator.const.gcn.533
copy
swp
pop
add
word generator.const.gcn.534 0
pushc generator.const.gcn.534
push complex__tostring.this
pushc vtable__re
swp
pushai
eq
not
pushc check
word generator.const.gcn.531 3
pushcp generator.const.gcn.531
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
word generator.const.gcn.535 2
pushcp generator.const.gcn.535
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
pushcp generator.if.gcn.536.else
word generator.const.gcn.537 0
pushc generator.const.gcn.537
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
generator.if.gcn.536.else:
pushcp generator.if.gcn.538.else
word generator.const.gcn.539 0
pushc generator.const.gcn.539
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
generator.if.gcn.538.else:
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
word generator.const.gcn.540 1
pushcp generator.const.gcn.540
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
pushcp generator.if.gcn.541.else
word generator.const.gcn.542 0
pushc generator.const.gcn.542
push complex__angle.this
pushc vtable__re
swp
pushai
eq
jz
pop
word generator.const.gcn.544 2
pushc generator.const.gcn.544
pushc m_pi
copy
swp
pop
neg
copy
swp
pop
div
word generator.const.gcn.545 2
pushc generator.const.gcn.545
pushc m_pi
copy
swp
pop
div
word generator.const.gcn.546 0
pushc generator.const.gcn.546
push complex__angle.this
pushc vtable__im
swp
pushai
bg
pushc check
word generator.const.gcn.543 3
pushcp generator.const.gcn.543
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.541.end
jp
generator.if.gcn.541.else:
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
word generator.const.gcn.547 1
pushcp generator.const.gcn.547
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
word generator.const.gcn.550 0
pushc generator.const.gcn.550
push complex__angle.this
pushc vtable__im
swp
pushai
be
pushc check
word generator.const.gcn.549 3
pushcp generator.const.gcn.549
push global.arg_counter
mov
jc
push complex__angle.fival
word generator.const.gcn.551 0
pushc generator.const.gcn.551
push complex__angle.this
pushc vtable__re
swp
pushai
bg
pushc check
word generator.const.gcn.548 3
pushcp generator.const.gcn.548
push global.arg_counter
mov
jc
jr
generator.if.gcn.541.end:
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
word generator.const.gcn.552 2
pushcp generator.const.gcn.552
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
word generator.const.gcn.553 0
pushcp generator.const.gcn.553
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
word generator.const.gcn.555 1
pushcp generator.const.gcn.555
push global.arg_counter
mov
jc
pcopy
word generator.const.gcn.557 0
pushc generator.const.gcn.557
eq
pushcp generator.case.gcn.556.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
word generator.const.gcn.559 0
pushc generator.const.gcn.559
swp
word generator.const.gcn.560 0
pushc generator.const.gcn.560
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.558 2
pushcp generator.const.gcn.558
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.554.end
jp
generator.case.gcn.556.end:
pcopy
word generator.const.gcn.562 1
pushc generator.const.gcn.562
eq
pushcp generator.case.gcn.561.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
word generator.const.gcn.564 0
pushc generator.const.gcn.564
swp
push cmath__unite.args
word generator.const.gcn.565 0
pushc generator.const.gcn.565
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.563 2
pushcp generator.const.gcn.563
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.554.end
jp
generator.case.gcn.561.end:
pcopy
word generator.const.gcn.567 2
pushc generator.const.gcn.567
eq
pushcp generator.case.gcn.566.end
swp
jz
pushcp __allocator__complex
jc
pcopy
peek global.this
push cmath__unite.args
word generator.const.gcn.569 1
pushc generator.const.gcn.569
swp
pushai
swp
push cmath__unite.args
word generator.const.gcn.570 0
pushc generator.const.gcn.570
swp
pushai
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.568 2
pushcp generator.const.gcn.568
push global.arg_counter
mov
jc
jr
pushcp generator.switch.gcn.554.end
jp
generator.case.gcn.566.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.572 "CMath.Unite: Invalid args."
pushc generator.const.gcn.572
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.571 1
pushcp generator.const.gcn.571
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.554.end:
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
word generator.const.gcn.574 0
pushc generator.const.gcn.574
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.573 2
pushcp generator.const.gcn.573
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
word generator.const.gcn.576 1
pushcp generator.const.gcn.576
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
word generator.const.gcn.577 1
pushcp generator.const.gcn.577
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
word generator.const.gcn.575 2
pushcp generator.const.gcn.575
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
word generator.const.gcn.578 2
pushcp generator.const.gcn.578
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
word generator.const.gcn.579 2
pushcp generator.const.gcn.579
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
word generator.const.gcn.580 2
pushcp generator.const.gcn.580
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
word generator.const.gcn.582 0
pushcp generator.const.gcn.582
push global.arg_counter
mov
jc
push cmath__div.z1
push structure_instance_cmath
peek global.this
pushc vtable__mul
swp
pushai
word generator.const.gcn.581 2
pushcp generator.const.gcn.581
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
word generator.const.gcn.584 0
pushcp generator.const.gcn.584
push global.arg_counter
mov
jc
push cmath__div.z2
push structure_instance_cmath
peek global.this
pushc vtable__mul
swp
pushai
word generator.const.gcn.583 2
pushcp generator.const.gcn.583
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
word generator.const.gcn.585 2
pushcp generator.const.gcn.585
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
word generator.const.gcn.587 0
pushcp generator.const.gcn.587
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.586 2
pushcp generator.const.gcn.586
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
word generator.const.gcn.588 0
pushcp generator.const.gcn.588
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
word generator.const.gcn.590 1
pushcp generator.const.gcn.590
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
word generator.const.gcn.591 1
pushcp generator.const.gcn.591
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
word generator.const.gcn.589 2
pushcp generator.const.gcn.589
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
word generator.const.gcn.593 0
pushcp generator.const.gcn.593
push global.arg_counter
mov
jc
swp
push cmath__ln.z
peek global.this
pushc vtable__module
swp
pushai
word generator.const.gcn.595 0
pushcp generator.const.gcn.595
push global.arg_counter
mov
jc
pushc log
word generator.const.gcn.594 1
pushcp generator.const.gcn.594
push global.arg_counter
mov
jc
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.592 2
pushcp generator.const.gcn.592
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
word generator.const.gcn.597 2
pushcp generator.const.gcn.597
push global.arg_counter
mov
jc
push cmath__logn.z
peek global.this
pushc vtable__angle
swp
pushai
word generator.const.gcn.598 0
pushcp generator.const.gcn.598
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
word generator.const.gcn.600 0
pushcp generator.const.gcn.600
push global.arg_counter
mov
jc
push cmath__logn.n
pushc logn
word generator.const.gcn.599 2
pushcp generator.const.gcn.599
push global.arg_counter
mov
jc
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.596 2
pushcp generator.const.gcn.596
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
word generator.const.gcn.602 1
pushcp generator.const.gcn.602
push global.arg_counter
mov
jc
push cmath__sin.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.603 1
pushcp generator.const.gcn.603
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
word generator.const.gcn.604 1
pushcp generator.const.gcn.604
push global.arg_counter
mov
jc
push cmath__sin.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.605 1
pushcp generator.const.gcn.605
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
word generator.const.gcn.601 2
pushcp generator.const.gcn.601
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
word generator.const.gcn.607 1
pushcp generator.const.gcn.607
push global.arg_counter
mov
jc
push cmath__cos.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.608 1
pushcp generator.const.gcn.608
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
word generator.const.gcn.609 1
pushcp generator.const.gcn.609
push global.arg_counter
mov
jc
push cmath__cos.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.610 1
pushcp generator.const.gcn.610
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
word generator.const.gcn.606 2
pushcp generator.const.gcn.606
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
word generator.const.gcn.612 2
pushc generator.const.gcn.612
copy
swp
pop
mul
pushc cosh
word generator.const.gcn.611 1
pushcp generator.const.gcn.611
push global.arg_counter
mov
jc
push cmath__tg.z
pushc vtable__re
swp
pushai
word generator.const.gcn.614 2
pushc generator.const.gcn.614
copy
swp
pop
mul
pushc cos
word generator.const.gcn.613 1
pushcp generator.const.gcn.613
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
word generator.const.gcn.617 2
pushc generator.const.gcn.617
copy
swp
pop
mul
pushc sinh
word generator.const.gcn.616 1
pushcp generator.const.gcn.616
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
word generator.const.gcn.619 2
pushc generator.const.gcn.619
copy
swp
pop
mul
pushc sin
word generator.const.gcn.618 1
pushcp generator.const.gcn.618
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
word generator.const.gcn.615 2
pushcp generator.const.gcn.615
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
word generator.const.gcn.621 2
pushc generator.const.gcn.621
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.622 1
pushcp generator.const.gcn.622
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.620 2
pushcp generator.const.gcn.620
push global.arg_counter
mov
jc
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.623 1
pushcp generator.const.gcn.623
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
word generator.const.gcn.624 1
pushcp generator.const.gcn.624
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
word generator.const.gcn.626 2
pushc generator.const.gcn.626
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.627 1
pushcp generator.const.gcn.627
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.625 2
pushcp generator.const.gcn.625
push global.arg_counter
mov
jc
word generator.const.gcn.629 2
pushc generator.const.gcn.629
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.630 1
pushcp generator.const.gcn.630
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.628 2
pushcp generator.const.gcn.628
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
word generator.const.gcn.631 1
pushcp generator.const.gcn.631
push global.arg_counter
mov
jc
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.632 1
pushcp generator.const.gcn.632
push global.arg_counter
mov
jc
word generator.const.gcn.634 2
pushc generator.const.gcn.634
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.635 1
pushcp generator.const.gcn.635
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.633 2
pushcp generator.const.gcn.633
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
word generator.const.gcn.637 2
pushc generator.const.gcn.637
push cmath__ctg.z
pushc vtable__im
swp
pushai
pushc ctgh
word generator.const.gcn.638 1
pushcp generator.const.gcn.638
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.636 2
pushcp generator.const.gcn.636
push global.arg_counter
mov
jc
word generator.const.gcn.640 2
pushc generator.const.gcn.640
push cmath__ctg.z
pushc vtable__re
swp
pushai
pushc ctg
word generator.const.gcn.641 1
pushcp generator.const.gcn.641
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.639 2
pushcp generator.const.gcn.639
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
word generator.const.gcn.642 2
pushcp generator.const.gcn.642
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
word generator.const.gcn.644 2
pushc generator.const.gcn.644
push cmath__sec.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.645 1
pushcp generator.const.gcn.645
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.643 2
pushcp generator.const.gcn.643
push global.arg_counter
mov
jc
word generator.const.gcn.647 2
pushc generator.const.gcn.647
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.648 1
pushcp generator.const.gcn.648
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.646 2
pushcp generator.const.gcn.646
push global.arg_counter
mov
jc
copy
swp
pop
mul
peek cmath__sec.k
pop
word generator.const.gcn.650 2
pushc generator.const.gcn.650
push cmath__sec.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.651 1
pushcp generator.const.gcn.651
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.649 2
pushcp generator.const.gcn.649
push global.arg_counter
mov
jc
word generator.const.gcn.653 2
pushc generator.const.gcn.653
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.654 1
pushcp generator.const.gcn.654
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.652 2
pushcp generator.const.gcn.652
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
word generator.const.gcn.656 1
pushcp generator.const.gcn.656
push global.arg_counter
mov
jc
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.657 1
pushcp generator.const.gcn.657
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
word generator.const.gcn.658 1
pushcp generator.const.gcn.658
push global.arg_counter
mov
jc
push cmath__sec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.659 1
pushcp generator.const.gcn.659
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
word generator.const.gcn.655 2
pushcp generator.const.gcn.655
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
word generator.const.gcn.661 2
pushc generator.const.gcn.661
push cmath__cosec.z
pushc vtable__im
swp
pushai
pushc cosh
word generator.const.gcn.662 1
pushcp generator.const.gcn.662
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.660 2
pushcp generator.const.gcn.660
push global.arg_counter
mov
jc
word generator.const.gcn.664 2
pushc generator.const.gcn.664
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.665 1
pushcp generator.const.gcn.665
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.663 2
pushcp generator.const.gcn.663
push global.arg_counter
mov
jc
copy
swp
pop
mul
peek cmath__cosec.k
pop
word generator.const.gcn.667 2
pushc generator.const.gcn.667
push cmath__cosec.z
pushc vtable__im
swp
pushai
pushc sinh
word generator.const.gcn.668 1
pushcp generator.const.gcn.668
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.666 2
pushcp generator.const.gcn.666
push global.arg_counter
mov
jc
word generator.const.gcn.670 2
pushc generator.const.gcn.670
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.671 1
pushcp generator.const.gcn.671
push global.arg_counter
mov
jc
pushc power
word generator.const.gcn.669 2
pushcp generator.const.gcn.669
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
word generator.const.gcn.673 1
pushcp generator.const.gcn.673
push global.arg_counter
mov
jc
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc cos
word generator.const.gcn.674 1
pushcp generator.const.gcn.674
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
word generator.const.gcn.675 1
pushcp generator.const.gcn.675
push global.arg_counter
mov
jc
push cmath__cosec.z
pushc vtable__re
swp
pushai
pushc sin
word generator.const.gcn.676 1
pushcp generator.const.gcn.676
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
word generator.const.gcn.672 2
pushcp generator.const.gcn.672
push global.arg_counter
mov
jc
jr
jr
cmath__cosec__end:
pushcp stgamma__end
jp
stgamma:
@stgamma.this
@stgamma.a
peek stgamma.a
pop
push stgamma.a
pushc m_e
push stgamma.a
copy
swp
pop
div
pushc power
word generator.const.gcn.677 2
pushcp generator.const.gcn.677
push global.arg_counter
mov
jc
push stgamma.a
pushc m_pi
word generator.const.gcn.679 2
pushc generator.const.gcn.679
copy
swp
pop
mul
copy
swp
pop
div
pushc sqrt
word generator.const.gcn.678 1
pushcp generator.const.gcn.678
push global.arg_counter
mov
jc
copy
swp
pop
mul
jr
stgamma__end:
pushcp spgamma__end
jp
spgamma:
@spgamma.this
@spgamma.a
@spgamma.b
@spgamma.c
@spgamma.k1_factrl
@spgamma.k
@spgamma.accm
peek spgamma.a
pop
word generator.const.gcn.680 12
pushc generator.const.gcn.680
peek spgamma.b
pop
word generator.const.gcn.682 12
pushc generator.const.gcn.682
word generator.const.gcn.681 1
pushcp generator.const.gcn.681
newa
peek spgamma.c
pop
word generator.const.gcn.683 1
pushc generator.const.gcn.683
peek spgamma.k1_factrl
pop
pushc m_pi
word generator.const.gcn.685 2
pushc generator.const.gcn.685
copy
swp
pop
mul
pushc sqrt
word generator.const.gcn.684 1
pushcp generator.const.gcn.684
push global.arg_counter
mov
jc
push spgamma.c
word generator.const.gcn.686 0
pushc generator.const.gcn.686
swp
peekai
word generator.const.gcn.687 1
pushc generator.const.gcn.687
peek spgamma.k
pop
generator.while.gcn.688.start:
pushcp generator.while.gcn.688.end
push spgamma.b
push spgamma.k
swp
bg
jz
pop
push spgamma.k1_factrl
real generator.const.gcn.690 0.5
pushc generator.const.gcn.690
push spgamma.k
copy
swp
pop
sub
push spgamma.k
push spgamma.b
copy
swp
pop
sub
pushc power
word generator.const.gcn.689 2
pushcp generator.const.gcn.689
push global.arg_counter
mov
jc
push spgamma.k
push spgamma.b
copy
swp
pop
sub
pushc exp
word generator.const.gcn.691 1
pushcp generator.const.gcn.691
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
push spgamma.c
push spgamma.k
swp
peekai
push spgamma.k
copy
swp
pop
neg
push spgamma.k1_factrl
mul
pop
push spgamma.k
inc
pop
pushcp generator.while.gcn.688.start
jp
generator.while.gcn.688.end:
push spgamma.c
word generator.const.gcn.692 0
pushc generator.const.gcn.692
swp
pushai
peek spgamma.accm
pop
word generator.const.gcn.693 1
pushc generator.const.gcn.693
peek spgamma.k
pop
generator.while.gcn.694.start:
pushcp generator.while.gcn.694.end
push spgamma.b
push spgamma.k
swp
bg
jz
pop
push spgamma.k
push spgamma.a
copy
swp
pop
add
push spgamma.c
push spgamma.k
swp
pushai
copy
swp
pop
div
push spgamma.accm
add
pop
push spgamma.k
inc
pop
pushcp generator.while.gcn.694.start
jp
generator.while.gcn.694.end:
real generator.const.gcn.696 0.5
pushc generator.const.gcn.696
push spgamma.a
copy
swp
pop
add
push spgamma.b
push spgamma.a
copy
swp
pop
add
pushc power
word generator.const.gcn.695 2
pushcp generator.const.gcn.695
push global.arg_counter
mov
jc
push spgamma.b
push spgamma.a
copy
swp
pop
add
copy
swp
pop
neg
pushc exp
word generator.const.gcn.697 1
pushcp generator.const.gcn.697
push global.arg_counter
mov
jc
copy
swp
pop
mul
push spgamma.accm
mul
pop
push spgamma.a
push spgamma.accm
copy
swp
pop
div
jr
jr
spgamma__end:
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