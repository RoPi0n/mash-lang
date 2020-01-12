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
word vtable__threadcontext 3
word vtable__resumed 4
word vtable__terminated 5
word vtable__method 6
word vtable__args 7
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
word vtable__push 39
word vtable__peek 40
word vtable__pop 41
word vtable__create 42
word vtable__tostring 43
word vtable__execute 44
word vtable__free 45
word vtable__rejoin 46
word vtable__suspend 47
word vtable__resume 48
word vtable__setpriority 49
word vtable__terminate 50
word vtable__waitfor 51
word vtable__clone 52
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
word tthread 12
@structure_instance_tthread
pushcp __allocator__tthread
jc
peek structure_instance_tthread
pop
word tthreadcall 13
@structure_instance_tthreadcall
pushcp __allocator__tthreadcall
jc
peek structure_instance_tthreadcall
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
pushcp main__end
jp
main:
@main.this
@main.arr
@main.i
@main.l
@main.first
@main.second
@main.t
word generator.const.gcn.42 100000
pushc generator.const.gcn.42
word generator.const.gcn.41 1
pushcp generator.const.gcn.41
newa
peek main.arr
pop
word generator.const.gcn.43 0
pushc generator.const.gcn.43
peek main.i
pop
push main.arr
pushc len
word generator.const.gcn.44 1
pushcp generator.const.gcn.44
push global.arg_counter
mov
jc
peek main.l
pop
generator.while.gcn.45.start:
pushcp generator.while.gcn.45.end
push main.l
push main.i
swp
bg
jz
pop
pushc random
invoke
push main.arr
push main.i
swp
peekai
push main.i
inc
pop
pushcp generator.while.gcn.45.start
jp
generator.while.gcn.45.end:
push main.arr
pushc copy
word generator.const.gcn.46 1
pushcp generator.const.gcn.46
push global.arg_counter
mov
jc
peek main.first
pop
push main.arr
pushc copy
word generator.const.gcn.47 1
pushcp generator.const.gcn.47
push global.arg_counter
mov
jc
peek main.second
pop
pushc tickcnt
invoke
peek main.t
pop
push main.first
pushc quicksort
word generator.const.gcn.48 1
pushcp generator.const.gcn.48
push global.arg_counter
mov
jc
str generator.const.gcn.50 " ms."
pushc generator.const.gcn.50
push main.t
pushc tickcnt
invoke
copy
swp
pop
sub
pushc println
word generator.const.gcn.49 2
pushcp generator.const.gcn.49
push global.arg_counter
mov
jc
pushc tickcnt
invoke
pushc copy
word generator.const.gcn.51 1
pushcp generator.const.gcn.51
push global.arg_counter
mov
jc
peek main.t
pop
word generator.const.gcn.53 16
pushc generator.const.gcn.53
push main.second
pushc threadedquicksort
word generator.const.gcn.52 2
pushcp generator.const.gcn.52
push global.arg_counter
mov
jc
str generator.const.gcn.55 " ms."
pushc generator.const.gcn.55
push main.t
pushc tickcnt
invoke
copy
swp
pop
sub
pushc println
word generator.const.gcn.54 2
pushcp generator.const.gcn.54
push global.arg_counter
mov
jc
jr
main__end:
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
word generator.const.gcn.56 1
pushcp generator.const.gcn.56
push global.arg_counter
mov
jc
peek reversearray.l
pop
word generator.const.gcn.57 0
pushc generator.const.gcn.57
peek reversearray.i
pop
generator.while.gcn.58.start:
pushcp generator.while.gcn.58.end
word generator.const.gcn.59 2
pushc generator.const.gcn.59
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
word generator.const.gcn.60 1
pushc generator.const.gcn.60
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
word generator.const.gcn.61 1
pushc generator.const.gcn.61
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
pushcp generator.while.gcn.58.start
jp
generator.while.gcn.58.end:
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
word generator.const.gcn.62 0
pushc generator.const.gcn.62
swp
pushai
peek getmax.mx
pop
word generator.const.gcn.63 1
pushc generator.const.gcn.63
peek getmax.i
pop
generator.while.gcn.64.start:
pushcp generator.while.gcn.64.end
push getmax.n
push getmax.i
swp
bg
jz
pop
pushcp generator.if.gcn.65.else
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
generator.if.gcn.65.else:
push getmax.i
inc
pop
pushcp generator.while.gcn.64.start
jp
generator.while.gcn.64.end:
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
word generator.const.gcn.66 0
pushc generator.const.gcn.66
swp
pushai
peek getmin.mn
pop
word generator.const.gcn.67 1
pushc generator.const.gcn.67
peek getmin.i
pop
generator.while.gcn.68.start:
pushcp generator.while.gcn.68.end
push getmin.n
push getmin.i
swp
bg
jz
pop
pushcp generator.if.gcn.69.else
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
generator.if.gcn.69.else:
push getmin.i
inc
pop
pushcp generator.while.gcn.68.start
jp
generator.while.gcn.68.end:
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
@partition.j
@partition._
peek partition.arr
pop
peek partition.low
pop
peek partition.high
pop
word generator.const.gcn.70 1
pushc generator.const.gcn.70
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
push partition.low
pushc copy
word generator.const.gcn.71 1
pushcp generator.const.gcn.71
push global.arg_counter
mov
jc
peek partition.j
pop
generator.while.gcn.72.start:
pushcp generator.while.gcn.72.end
push partition.high
push partition.j
swp
bg
jz
pop
pushcp generator.if.gcn.73.else
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
generator.if.gcn.73.else:
push partition.j
inc
pop
pushcp generator.while.gcn.72.start
jp
generator.while.gcn.72.end:
push partition.arr
word generator.const.gcn.74 1
pushc generator.const.gcn.74
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
word generator.const.gcn.75 1
pushc generator.const.gcn.75
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
word generator.const.gcn.76 1
pushc generator.const.gcn.76
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
pushcp generator.if.gcn.77.else
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
word generator.const.gcn.78 3
pushcp generator.const.gcn.78
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
word generator.const.gcn.80 1
pushc generator.const.gcn.80
push fromtoqsort.pi
copy
swp
pop
sub
push fromtoqsort.low
push fromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.79 3
pushcp generator.const.gcn.79
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
word generator.const.gcn.82 1
pushc generator.const.gcn.82
push fromtoqsort.pi
copy
swp
pop
add
push fromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.81 3
pushcp generator.const.gcn.81
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
generator.if.gcn.77.else:
jr
fromtoqsort__end:
pushcp quicksort__end
jp
quicksort:
@quicksort.this
@quicksort.arr
peek quicksort.arr
pop
word generator.const.gcn.84 1
pushc generator.const.gcn.84
push quicksort.arr
pushc len
word generator.const.gcn.85 1
pushcp generator.const.gcn.85
push global.arg_counter
mov
jc
copy
swp
pop
sub
word generator.const.gcn.86 0
pushc generator.const.gcn.86
push quicksort.arr
pushc fromtoqsort
word generator.const.gcn.83 3
pushcp generator.const.gcn.83
push global.arg_counter
mov
jc
push quicksort.arr
jr
jr
quicksort__end:
pushcp threadedfromtoqsort__end
jp
threadedfromtoqsort:
@threadedfromtoqsort.this
@threadedfromtoqsort.arr
@threadedfromtoqsort.low
@threadedfromtoqsort.high
@threadedfromtoqsort.lvl
@threadedfromtoqsort.pi
@threadedfromtoqsort.l
@threadedfromtoqsort.r
peek threadedfromtoqsort.arr
pop
peek threadedfromtoqsort.low
pop
peek threadedfromtoqsort.high
pop
peek threadedfromtoqsort.lvl
pop
pushcp generator.if.gcn.87.else
push threadedfromtoqsort.high
push threadedfromtoqsort.low
swp
bg
jz
pop
push threadedfromtoqsort.high
push threadedfromtoqsort.low
push threadedfromtoqsort.arr
pushc partition
word generator.const.gcn.88 3
pushcp generator.const.gcn.88
push global.arg_counter
mov
jc
peek threadedfromtoqsort.pi
pop
pushcp generator.if.gcn.89.else
word generator.const.gcn.90 0
pushc generator.const.gcn.90
push threadedfromtoqsort.lvl
bg
jz
pop
word generator.const.gcn.92 1
pushc generator.const.gcn.92
push threadedfromtoqsort.lvl
copy
swp
pop
sub
word generator.const.gcn.93 1
pushc generator.const.gcn.93
push threadedfromtoqsort.pi
copy
swp
pop
sub
push threadedfromtoqsort.low
push threadedfromtoqsort.arr
pushc threadedfromtoqsort
pushc go
word generator.const.gcn.91 5
pushcp generator.const.gcn.91
push global.arg_counter
mov
jc
peek threadedfromtoqsort.l
pop
word generator.const.gcn.95 1
pushc generator.const.gcn.95
push threadedfromtoqsort.lvl
copy
swp
pop
sub
push threadedfromtoqsort.high
word generator.const.gcn.96 1
pushc generator.const.gcn.96
push threadedfromtoqsort.pi
copy
swp
pop
add
push threadedfromtoqsort.arr
pushc threadedfromtoqsort
pushc go
word generator.const.gcn.94 5
pushcp generator.const.gcn.94
push global.arg_counter
mov
jc
peek threadedfromtoqsort.r
pop
push threadedfromtoqsort.l
peek global.this
pushc vtable__waitfor
swp
pushai
word generator.const.gcn.97 0
pushcp generator.const.gcn.97
push global.arg_counter
mov
jc
push threadedfromtoqsort.r
peek global.this
pushc vtable__waitfor
swp
pushai
word generator.const.gcn.98 0
pushcp generator.const.gcn.98
push global.arg_counter
mov
jc
pushcp generator.if.gcn.89.end
jp
generator.if.gcn.89.else:
push threadedfromtoqsort.this
rst
push threadedfromtoqsort.arr
rst
push threadedfromtoqsort.low
rst
push threadedfromtoqsort.high
rst
push threadedfromtoqsort.lvl
rst
push threadedfromtoqsort.pi
rst
push threadedfromtoqsort.l
rst
push threadedfromtoqsort.r
rst
word generator.const.gcn.100 1
pushc generator.const.gcn.100
push threadedfromtoqsort.pi
copy
swp
pop
sub
push threadedfromtoqsort.low
push threadedfromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.99 3
pushcp generator.const.gcn.99
push global.arg_counter
mov
jc
rld
peek threadedfromtoqsort.r
pop
rld
peek threadedfromtoqsort.l
pop
rld
peek threadedfromtoqsort.pi
pop
rld
peek threadedfromtoqsort.lvl
pop
rld
peek threadedfromtoqsort.high
pop
rld
peek threadedfromtoqsort.low
pop
rld
peek threadedfromtoqsort.arr
pop
rld
peek threadedfromtoqsort.this
pop
push threadedfromtoqsort.this
rst
push threadedfromtoqsort.arr
rst
push threadedfromtoqsort.low
rst
push threadedfromtoqsort.high
rst
push threadedfromtoqsort.lvl
rst
push threadedfromtoqsort.pi
rst
push threadedfromtoqsort.l
rst
push threadedfromtoqsort.r
rst
push threadedfromtoqsort.high
word generator.const.gcn.102 1
pushc generator.const.gcn.102
push threadedfromtoqsort.pi
copy
swp
pop
add
push threadedfromtoqsort.arr
pushc fromtoqsort
word generator.const.gcn.101 3
pushcp generator.const.gcn.101
push global.arg_counter
mov
jc
rld
peek threadedfromtoqsort.r
pop
rld
peek threadedfromtoqsort.l
pop
rld
peek threadedfromtoqsort.pi
pop
rld
peek threadedfromtoqsort.lvl
pop
rld
peek threadedfromtoqsort.high
pop
rld
peek threadedfromtoqsort.low
pop
rld
peek threadedfromtoqsort.arr
pop
rld
peek threadedfromtoqsort.this
pop
generator.if.gcn.89.end:
generator.if.gcn.87.else:
jr
threadedfromtoqsort__end:
pushcp threadedquicksort__end
jp
threadedquicksort:
@threadedquicksort.this
@threadedquicksort.arr
@threadedquicksort.threads
peek threadedquicksort.arr
pop
peek threadedquicksort.threads
pop
word generator.const.gcn.104 2
pushc generator.const.gcn.104
push threadedquicksort.threads
copy
swp
pop
idiv
word generator.const.gcn.105 1
pushc generator.const.gcn.105
push threadedquicksort.arr
pushc len
word generator.const.gcn.106 1
pushcp generator.const.gcn.106
push global.arg_counter
mov
jc
copy
swp
pop
sub
word generator.const.gcn.107 0
pushc generator.const.gcn.107
push threadedquicksort.arr
pushc threadedfromtoqsort
word generator.const.gcn.103 4
pushcp generator.const.gcn.103
push global.arg_counter
mov
jc
push threadedquicksort.arr
jr
jr
threadedquicksort__end:
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
generator.while.gcn.108.start:
pushcp generator.while.gcn.108.end
pushc true
jz
pop
word generator.const.gcn.109 2
pushc generator.const.gcn.109
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
pushcp generator.if.gcn.110.else
push fromtobinsearch.arr
push fromtobinsearch.midd
swp
pushai
push fromtobinsearch.key
swp
bg
jz
pop
word generator.const.gcn.111 1
pushc generator.const.gcn.111
push fromtobinsearch.midd
copy
swp
pop
sub
peek fromtobinsearch.right
pop
pushcp generator.if.gcn.110.end
jp
generator.if.gcn.110.else:
pushcp generator.if.gcn.112.else
push fromtobinsearch.arr
push fromtobinsearch.midd
swp
pushai
push fromtobinsearch.key
bg
jz
pop
word generator.const.gcn.113 1
pushc generator.const.gcn.113
push fromtobinsearch.midd
copy
swp
pop
add
peek fromtobinsearch.left
pop
pushcp generator.if.gcn.112.end
jp
generator.if.gcn.112.else:
push fromtobinsearch.midd
jr
generator.if.gcn.112.end:
generator.if.gcn.110.end:
pushcp generator.if.gcn.114.else
push fromtobinsearch.right
push fromtobinsearch.left
bg
jz
pop
push null
jr
generator.if.gcn.114.else:
pushcp generator.while.gcn.108.start
jp
generator.while.gcn.108.end:
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
word generator.const.gcn.115 1
pushcp generator.const.gcn.115
push global.arg_counter
mov
jc
peek binsearch.l
pop
pushcp generator.if.gcn.116.else
word generator.const.gcn.117 0
pushc generator.const.gcn.117
push binsearch.l
bg
jz
pop
push binsearch.key
word generator.const.gcn.119 1
pushc generator.const.gcn.119
push binsearch.l
copy
swp
pop
sub
word generator.const.gcn.120 0
pushc generator.const.gcn.120
push binsearch.arr
pushc fromtobinsearch
word generator.const.gcn.118 4
pushcp generator.const.gcn.118
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.116.end
jp
generator.if.gcn.116.else:
push null
jr
generator.if.gcn.116.end:
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
generator.while.gcn.121.start:
pushcp generator.while.gcn.121.end
pushc true
jz
pop
word generator.const.gcn.122 2
pushc generator.const.gcn.122
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
pushcp generator.if.gcn.123.else
push fromtobinnext.arr
push fromtobinnext.midd
swp
pushai
push fromtobinnext.key
swp
bg
jz
pop
word generator.const.gcn.124 1
pushc generator.const.gcn.124
push fromtobinnext.midd
copy
swp
pop
sub
peek fromtobinnext.right
pop
pushcp generator.if.gcn.123.end
jp
generator.if.gcn.123.else:
pushcp generator.if.gcn.125.else
push fromtobinnext.arr
push fromtobinnext.midd
swp
pushai
push fromtobinnext.key
bg
jz
pop
word generator.const.gcn.126 1
pushc generator.const.gcn.126
push fromtobinnext.midd
copy
swp
pop
add
peek fromtobinnext.left
pop
pushcp generator.if.gcn.125.end
jp
generator.if.gcn.125.else:
push fromtobinnext.midd
jr
generator.if.gcn.125.end:
generator.if.gcn.123.end:
pushcp generator.if.gcn.127.else
push fromtobinnext.right
push fromtobinnext.left
bg
jz
pop
push fromtobinnext.midd
jr
generator.if.gcn.127.else:
pushcp generator.while.gcn.121.start
jp
generator.while.gcn.121.end:
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
word generator.const.gcn.128 1
pushcp generator.const.gcn.128
push global.arg_counter
mov
jc
peek binnext.l
pop
pushcp generator.if.gcn.129.else
word generator.const.gcn.130 0
pushc generator.const.gcn.130
push binnext.l
bg
jz
pop
push binnext.key
word generator.const.gcn.132 1
pushc generator.const.gcn.132
push binnext.l
copy
swp
pop
sub
word generator.const.gcn.133 0
pushc generator.const.gcn.133
push binnext.arr
pushc fromtobinnext
word generator.const.gcn.131 4
pushcp generator.const.gcn.131
push global.arg_counter
mov
jc
peek binnext.r
pop
pushcp generator.if.gcn.134.else
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
pushcp generator.if.gcn.134.end
jp
generator.if.gcn.134.else:
word generator.const.gcn.135 1
pushc generator.const.gcn.135
push binnext.r
copy
swp
pop
add
jr
generator.if.gcn.134.end:
pushcp generator.if.gcn.129.end
jp
generator.if.gcn.129.else:
word generator.const.gcn.136 0
pushc generator.const.gcn.136
jr
generator.if.gcn.129.end:
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
word generator.const.gcn.137 0
pushc generator.const.gcn.137
peek fromtointerpolarsearch.pos
pop
pushc false
peek fromtointerpolarsearch.found
pop
generator.while.gcn.138.start:
pushcp generator.while.gcn.138.end
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
pushcp generator.if.gcn.139.else
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.pos
swp
pushai
swp
bg
jz
pop
word generator.const.gcn.140 1
pushc generator.const.gcn.140
push fromtointerpolarsearch.pos
copy
swp
pop
add
push fromtointerpolarsearch.left
mov
pushcp generator.if.gcn.139.end
jp
generator.if.gcn.139.else:
pushcp generator.if.gcn.141.else
push fromtointerpolarsearch.key
push fromtointerpolarsearch.arr
push fromtointerpolarsearch.pos
swp
pushai
bg
jz
pop
word generator.const.gcn.142 1
pushc generator.const.gcn.142
push fromtointerpolarsearch.pos
copy
swp
pop
sub
push fromtointerpolarsearch.right
mov
pushcp generator.if.gcn.141.end
jp
generator.if.gcn.141.else:
pushc true
push fromtointerpolarsearch.found
mov
generator.if.gcn.141.end:
generator.if.gcn.139.end:
pushcp generator.while.gcn.138.start
jp
generator.while.gcn.138.end:
pushcp generator.if.gcn.143.else
push fromtointerpolarsearch.found
jz
pop
push fromtointerpolarsearch.pos
jr
pushcp generator.if.gcn.143.end
jp
generator.if.gcn.143.else:
push null
jr
generator.if.gcn.143.end:
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
word generator.const.gcn.144 1
pushcp generator.const.gcn.144
push global.arg_counter
mov
jc
peek interpolarsearch.l
pop
pushcp generator.if.gcn.145.else
word generator.const.gcn.146 0
pushc generator.const.gcn.146
push interpolarsearch.l
bg
jz
pop
push interpolarsearch.key
word generator.const.gcn.148 1
pushc generator.const.gcn.148
push interpolarsearch.l
copy
swp
pop
sub
word generator.const.gcn.149 0
pushc generator.const.gcn.149
push interpolarsearch.arr
pushc fromtointerpolarsearch
word generator.const.gcn.147 4
pushcp generator.const.gcn.147
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.145.end
jp
generator.if.gcn.145.else:
push null
jr
generator.if.gcn.145.end:
jr
interpolarsearch__end:
pushcp __printarray__end
jp
__printarray:
@__printarray.this
@__printarray.arr
@__printarray.l
@__printarray.i
peek __printarray.arr
pop
str generator.const.gcn.150 "["
pushc generator.const.gcn.150
pushc _print
invoke
push __printarray.arr
pushc len
word generator.const.gcn.151 1
pushcp generator.const.gcn.151
push global.arg_counter
mov
jc
peek __printarray.l
pop
word generator.const.gcn.152 0
pushc generator.const.gcn.152
peek __printarray.i
pop
generator.while.gcn.153.start:
pushcp generator.while.gcn.153.end
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
word generator.const.gcn.154 1
pushcp generator.const.gcn.154
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
pushcp generator.if.gcn.155.else
push __printarray.l
word generator.const.gcn.156 1
pushc generator.const.gcn.156
push __printarray.i
copy
swp
pop
add
swp
bg
jz
pop
str generator.const.gcn.157 ", "
pushc generator.const.gcn.157
pushc _print
invoke
generator.if.gcn.155.else:
push __printarray.i
inc
pop
pushcp generator.while.gcn.153.start
jp
generator.while.gcn.153.end:
str generator.const.gcn.158 "]"
pushc generator.const.gcn.158
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
word generator.const.gcn.160 1
pushcp generator.const.gcn.160
push global.arg_counter
mov
jc
pcopy
pushc typenull
eq
pushcp generator.case.gcn.161.end
swp
jz
str generator.const.gcn.162 "(null)"
pushc generator.const.gcn.162
pushc _print
invoke
pushcp generator.switch.gcn.159.end
jp
generator.case.gcn.161.end:
pcopy
pushc typeclass
eq
pushcp generator.case.gcn.163.end
swp
jz
push __print.obj
peek global.this
pushc vtable__tostring
swp
pushai
word generator.const.gcn.164 0
pushcp generator.const.gcn.164
push global.arg_counter
mov
jc
pushc _print
invoke
pushcp generator.switch.gcn.159.end
jp
generator.case.gcn.163.end:
pcopy
pushc typearray
eq
pushcp generator.case.gcn.165.end
swp
jz
push __print.obj
pushc __printarray
word generator.const.gcn.166 1
pushcp generator.const.gcn.166
push global.arg_counter
mov
jc
pushcp generator.switch.gcn.159.end
jp
generator.case.gcn.165.end:
push __print.obj
pushc _print
invoke
generator.switch.gcn.159.end:
jr
__print__end:
pushcp print__end
jp
print:
@print.this
@print.args
word generator.const.gcn.167 0
pushcp generator.const.gcn.167
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek print.args
pop
@generator.for_each.gcn.168.array
@generator.for_each.gcn.168.i
@generator.for_each.gcn.168.to
push print.args
peek generator.for_each.gcn.168.array
alen
peek generator.for_each.gcn.168.to
pop
pushc global.zero
peek generator.for_each.gcn.168.i
pop
generator.for_each.gcn.168.start:
pushcp generator.for_each.gcn.168.end
push generator.for_each.gcn.168.i
push generator.for_each.gcn.168.to
eq
not
jz
pop
push generator.for_each.gcn.168.i
push generator.for_each.gcn.168.array
pushai
@print.arg
peek print.arg
pop
push print.arg
pushc __print
word generator.const.gcn.169 1
pushcp generator.const.gcn.169
push global.arg_counter
mov
jc
generator.for_each.gcn.168.continue:
push generator.for_each.gcn.168.i
inc
pop
pushcp generator.for_each.gcn.168.start
jp
generator.for_each.gcn.168.end:
jr
print__end:
pushcp println__end
jp
println:
@println.this
@println.args
word generator.const.gcn.170 0
pushcp generator.const.gcn.170
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek println.args
pop
@generator.for_each.gcn.171.array
@generator.for_each.gcn.171.i
@generator.for_each.gcn.171.to
push println.args
peek generator.for_each.gcn.171.array
alen
peek generator.for_each.gcn.171.to
pop
pushc global.zero
peek generator.for_each.gcn.171.i
pop
generator.for_each.gcn.171.start:
pushcp generator.for_each.gcn.171.end
push generator.for_each.gcn.171.i
push generator.for_each.gcn.171.to
eq
not
jz
pop
push generator.for_each.gcn.171.i
push generator.for_each.gcn.171.array
pushai
@println.arg
peek println.arg
pop
push println.arg
pushc __print
word generator.const.gcn.172 1
pushcp generator.const.gcn.172
push global.arg_counter
mov
jc
generator.for_each.gcn.171.continue:
push generator.for_each.gcn.171.i
inc
pop
pushcp generator.for_each.gcn.171.start
jp
generator.for_each.gcn.171.end:
str generator.const.gcn.173 ""
pushc generator.const.gcn.173
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
word generator.const.gcn.174 7
pushc generator.const.gcn.174
pushc crt_textcolor
invoke
word generator.const.gcn.175 0
pushc generator.const.gcn.175
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
word generator.const.gcn.176 256
pushc generator.const.gcn.176
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
word generator.const.gcn.177 256
pushc generator.const.gcn.177
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
pushcp generator.if.gcn.178.else
push system_op_range.isback
jz
pop
word generator.const.gcn.179 1
pushc generator.const.gcn.179
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
pushcp generator.if.gcn.178.end
jp
generator.if.gcn.178.else:
word generator.const.gcn.180 1
pushc generator.const.gcn.180
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
generator.if.gcn.178.end:
push system_op_range.l
word generator.const.gcn.181 1
pushcp generator.const.gcn.181
newa
peek system_op_range.res
pop
word generator.const.gcn.182 0
pushc generator.const.gcn.182
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.183 1
pushcp generator.const.gcn.183
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.184.start:
pushcp generator.while.gcn.184.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
pushc copy
word generator.const.gcn.185 1
pushcp generator.const.gcn.185
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
pushcp generator.if.gcn.186.else
push system_op_range.isback
jz
pop
word generator.const.gcn.187 1
pushc generator.const.gcn.187
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.186.end
jp
generator.if.gcn.186.else:
word generator.const.gcn.188 1
pushc generator.const.gcn.188
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.186.end:
pushcp generator.while.gcn.184.start
jp
generator.while.gcn.184.end:
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
word generator.const.gcn.189 2
pushcp generator.const.gcn.189
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
word generator.const.gcn.190 0
pushc generator.const.gcn.190
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.191 1
pushcp generator.const.gcn.191
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.192.start:
pushcp generator.while.gcn.192.end
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
pushcp generator.while.gcn.192.start
jp
generator.while.gcn.192.end:
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
pushcp generator.if.gcn.193.else
word generator.const.gcn.194 255
pushc generator.const.gcn.194
push typeof.t
eq
jz
pop
push null
jr
generator.if.gcn.193.else:
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
word generator.const.gcn.195 1
pushcp generator.const.gcn.195
push global.arg_counter
mov
jc
peek system_op_is.t
pop
pushcp generator.if.gcn.196.else
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
pushcp generator.if.gcn.196.end
jp
generator.if.gcn.196.else:
push system_op_is.right
push system_op_is.t
eq
jr
generator.if.gcn.196.end:
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
word generator.const.gcn.197 1
pushcp generator.const.gcn.197
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.198 1
pushcp generator.const.gcn.198
newa
peek system_copy_array.r
pop
word generator.const.gcn.199 0
pushc generator.const.gcn.199
peek system_copy_array.i
pop
generator.while.gcn.200.start:
pushcp generator.while.gcn.200.end
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
word generator.const.gcn.201 1
pushcp generator.const.gcn.201
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
pushcp generator.while.gcn.200.start
jp
generator.while.gcn.200.end:
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
pushcp generator.if.gcn.202.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.203 1
pushcp generator.const.gcn.203
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.204 1
pushcp generator.const.gcn.204
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.202.end
jp
generator.if.gcn.202.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.205 1
pushcp generator.const.gcn.205
push global.arg_counter
mov
jc
jr
generator.if.gcn.202.end:
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
word generator.const.gcn.206 0
pushcp generator.const.gcn.206
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.207 ""
pushc generator.const.gcn.207
peek chr.r
pop
@generator.for_each.gcn.208.array
@generator.for_each.gcn.208.i
@generator.for_each.gcn.208.to
push chr.chars
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
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.209 1
pushcp generator.const.gcn.209
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.208.continue:
push generator.for_each.gcn.208.i
inc
pop
pushcp generator.for_each.gcn.208.start
jp
generator.for_each.gcn.208.end:
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
word generator.const.gcn.211 1
pushcp generator.const.gcn.211
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.212.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.210.end
jp
generator.case.gcn.212.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.213.end
swp
jz
push str.value
pushc i2s
invoke
jr
pushcp generator.switch.gcn.210.end
jp
generator.case.gcn.213.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.214.end
swp
jz
push str.value
pushc f2s
invoke
jr
pushcp generator.switch.gcn.210.end
jp
generator.case.gcn.214.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.215.end
swp
jz
push str.value
jr
pushcp generator.switch.gcn.210.end
jp
generator.case.gcn.215.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.217 "Invalid type cast via str()."
pushc generator.const.gcn.217
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.216 1
pushcp generator.const.gcn.216
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.210.end:
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
word generator.const.gcn.219 1
pushcp generator.const.gcn.219
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.220.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.218.end
jp
generator.case.gcn.220.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.221.end
swp
jz
push int.value
jr
pushcp generator.switch.gcn.218.end
jp
generator.case.gcn.221.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.222.end
swp
jz
word generator.const.gcn.223 1
pushc generator.const.gcn.223
push int.value
copy
swp
pop
idiv
jr
pushcp generator.switch.gcn.218.end
jp
generator.case.gcn.222.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.224.end
swp
jz
push int.value
pushc s2i
invoke
jr
pushcp generator.switch.gcn.218.end
jp
generator.case.gcn.224.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.226 "Invalid type cast via int()."
pushc generator.const.gcn.226
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.225 1
pushcp generator.const.gcn.225
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.218.end:
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
word generator.const.gcn.228 1
pushcp generator.const.gcn.228
push global.arg_counter
mov
jc
pcopy
pushc typeword
eq
pushcp generator.case.gcn.229.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.227.end
jp
generator.case.gcn.229.end:
pcopy
pushc typeint
eq
pushcp generator.case.gcn.230.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.227.end
jp
generator.case.gcn.230.end:
pcopy
pushc typereal
eq
pushcp generator.case.gcn.231.end
swp
jz
push real.value
jr
pushcp generator.switch.gcn.227.end
jp
generator.case.gcn.231.end:
pcopy
pushc typestr
eq
pushcp generator.case.gcn.232.end
swp
jz
push real.value
pushc s2f
invoke
jr
pushcp generator.switch.gcn.227.end
jp
generator.case.gcn.232.end:
pushcp __allocator__exception
jc
pcopy
peek global.this
str generator.const.gcn.234 "Invalid type cast via int()."
pushc generator.const.gcn.234
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.233 1
pushcp generator.const.gcn.233
push global.arg_counter
mov
jc
pushc global.raised
trr
generator.switch.gcn.227.end:
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
pushcp generator.if.gcn.235.else
push check.cond
jz
pop
push check.rtrue
jr
pushcp generator.if.gcn.235.end
jp
generator.if.gcn.235.else:
push check.rfalse
jr
generator.if.gcn.235.end:
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
pushcp generator.if.gcn.236.else
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
generator.if.gcn.236.else:
word generator.const.gcn.237 2
pushcp generator.const.gcn.237
word generator.const.gcn.238 1
pushcp generator.const.gcn.238
newa
pcopy
push between.left
swp
word generator.const.gcn.239 0
pushcp generator.const.gcn.239
swp
peekai
pcopy
push between.right
swp
word generator.const.gcn.240 1
pushcp generator.const.gcn.240
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
pushcp generator.if.gcn.241.else
word generator.const.gcn.242 0
pushc generator.const.gcn.242
push maxfromarray.arr
pushc len
word generator.const.gcn.243 1
pushcp generator.const.gcn.243
push global.arg_counter
mov
jc
bg
jz
pop
push maxfromarray.arr
word generator.const.gcn.244 0
pushc generator.const.gcn.244
swp
pushai
peek maxfromarray.r
pop
@generator.for_each.gcn.245.array
@generator.for_each.gcn.245.i
@generator.for_each.gcn.245.to
push maxfromarray.arr
peek generator.for_each.gcn.245.array
alen
peek generator.for_each.gcn.245.to
pop
pushc global.zero
peek generator.for_each.gcn.245.i
pop
generator.for_each.gcn.245.start:
pushcp generator.for_each.gcn.245.end
push generator.for_each.gcn.245.i
push generator.for_each.gcn.245.to
eq
not
jz
pop
push generator.for_each.gcn.245.i
push generator.for_each.gcn.245.array
pushai
@maxfromarray.x
peek maxfromarray.x
pop
pushcp generator.if.gcn.246.else
push maxfromarray.r
push maxfromarray.x
bg
jz
pop
push maxfromarray.x
push maxfromarray.r
mov
generator.if.gcn.246.else:
generator.for_each.gcn.245.continue:
push generator.for_each.gcn.245.i
inc
pop
pushcp generator.for_each.gcn.245.start
jp
generator.for_each.gcn.245.end:
push maxfromarray.r
jr
pushcp generator.if.gcn.241.end
jp
generator.if.gcn.241.else:
push null
jr
generator.if.gcn.241.end:
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
pushcp generator.if.gcn.247.else
word generator.const.gcn.248 0
pushc generator.const.gcn.248
push minfromarray.arr
pushc len
word generator.const.gcn.249 1
pushcp generator.const.gcn.249
push global.arg_counter
mov
jc
bg
jz
pop
push minfromarray.arr
word generator.const.gcn.250 0
pushc generator.const.gcn.250
swp
pushai
peek minfromarray.r
pop
@generator.for_each.gcn.251.array
@generator.for_each.gcn.251.i
@generator.for_each.gcn.251.to
push minfromarray.arr
peek generator.for_each.gcn.251.array
alen
peek generator.for_each.gcn.251.to
pop
pushc global.zero
peek generator.for_each.gcn.251.i
pop
generator.for_each.gcn.251.start:
pushcp generator.for_each.gcn.251.end
push generator.for_each.gcn.251.i
push generator.for_each.gcn.251.to
eq
not
jz
pop
push generator.for_each.gcn.251.i
push generator.for_each.gcn.251.array
pushai
@minfromarray.x
peek minfromarray.x
pop
pushcp generator.if.gcn.252.else
push minfromarray.r
push minfromarray.x
swp
bg
jz
pop
push minfromarray.x
push minfromarray.r
mov
generator.if.gcn.252.else:
generator.for_each.gcn.251.continue:
push generator.for_each.gcn.251.i
inc
pop
pushcp generator.for_each.gcn.251.start
jp
generator.for_each.gcn.251.end:
push minfromarray.r
jr
pushcp generator.if.gcn.247.end
jp
generator.if.gcn.247.else:
push null
jr
generator.if.gcn.247.end:
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
word generator.const.gcn.253 0
pushcp generator.const.gcn.253
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
push max.args
pushc len
word generator.const.gcn.254 1
pushcp generator.const.gcn.254
push global.arg_counter
mov
jc
peek max.l
pop
pushcp generator.if.gcn.255.else
word generator.const.gcn.256 0
pushc generator.const.gcn.256
push max.l
bg
jz
pop
push max.args
word generator.const.gcn.257 0
pushc generator.const.gcn.257
swp
pushai
peek max.first
pop
pushcp generator.if.gcn.258.else
pushc typearray
push max.first
pushcp system_op_is
jc
jz
pop
push max.first
pushc maxfromarray
word generator.const.gcn.259 1
pushcp generator.const.gcn.259
push global.arg_counter
mov
jc
peek max.r
pop
pushcp generator.if.gcn.258.end
jp
generator.if.gcn.258.else:
push max.first
peek max.r
pop
generator.if.gcn.258.end:
word generator.const.gcn.260 1
pushc generator.const.gcn.260
peek max.i
pop
generator.while.gcn.261.start:
pushcp generator.while.gcn.261.end
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
pushcp generator.if.gcn.262.else
pushc typearray
push max.t
pushcp system_op_is
jc
jz
pop
push max.t
pushc maxfromarray
word generator.const.gcn.263 1
pushcp generator.const.gcn.263
push global.arg_counter
mov
jc
peek max._
pop
pushcp generator.if.gcn.264.else
push max.r
push max._
bg
jz
pop
push max._
push max.r
mov
generator.if.gcn.264.else:
pushcp generator.if.gcn.262.end
jp
generator.if.gcn.262.else:
pushcp generator.if.gcn.265.else
push max.r
push max.t
bg
jz
pop
push max.t
push max.r
mov
generator.if.gcn.265.else:
generator.if.gcn.262.end:
push max.i
inc
pop
pushcp generator.while.gcn.261.start
jp
generator.while.gcn.261.end:
push max.r
jr
pushcp generator.if.gcn.255.end
jp
generator.if.gcn.255.else:
push null
jr
generator.if.gcn.255.end:
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
word generator.const.gcn.266 0
pushcp generator.const.gcn.266
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
push min.args
pushc len
word generator.const.gcn.267 1
pushcp generator.const.gcn.267
push global.arg_counter
mov
jc
peek min.l
pop
pushcp generator.if.gcn.268.else
word generator.const.gcn.269 0
pushc generator.const.gcn.269
push min.l
bg
jz
pop
push min.args
word generator.const.gcn.270 0
pushc generator.const.gcn.270
swp
pushai
peek min.first
pop
pushcp generator.if.gcn.271.else
pushc typearray
push min.first
pushcp system_op_is
jc
jz
pop
push min.first
pushc minfromarray
word generator.const.gcn.272 1
pushcp generator.const.gcn.272
push global.arg_counter
mov
jc
peek min.r
pop
pushcp generator.if.gcn.271.end
jp
generator.if.gcn.271.else:
push min.first
peek min.r
pop
generator.if.gcn.271.end:
word generator.const.gcn.273 1
pushc generator.const.gcn.273
peek min.i
pop
push min.args
pushc len
word generator.const.gcn.274 1
pushcp generator.const.gcn.274
push global.arg_counter
mov
jc
peek min.l
pop
generator.while.gcn.275.start:
pushcp generator.while.gcn.275.end
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
pushcp generator.if.gcn.276.else
pushc typearray
push min.t
pushcp system_op_is
jc
jz
pop
push min.t
pushc minfromarray
word generator.const.gcn.277 1
pushcp generator.const.gcn.277
push global.arg_counter
mov
jc
peek min._
pop
pushcp generator.if.gcn.278.else
push min.r
push min._
swp
bg
jz
pop
push min._
push min.r
mov
generator.if.gcn.278.else:
pushcp generator.if.gcn.276.end
jp
generator.if.gcn.276.else:
pushcp generator.if.gcn.279.else
push min.r
push min.t
swp
bg
jz
pop
push min.t
push min.r
mov
generator.if.gcn.279.else:
generator.if.gcn.276.end:
push min.i
inc
pop
pushcp generator.while.gcn.275.start
jp
generator.while.gcn.275.end:
push min.r
jr
pushcp generator.if.gcn.268.end
jp
generator.if.gcn.268.else:
push null
jr
generator.if.gcn.268.end:
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
word generator.const.gcn.280 1
pushcp generator.const.gcn.280
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek append.values
pop
push append.array
pushc len
word generator.const.gcn.281 1
pushcp generator.const.gcn.281
push global.arg_counter
mov
jc
peek append.i
pop
push append.values
pushc len
word generator.const.gcn.282 1
pushcp generator.const.gcn.282
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
word generator.const.gcn.283 2
pushcp generator.const.gcn.283
push global.arg_counter
mov
jc
@generator.for_each.gcn.284.array
@generator.for_each.gcn.284.i
@generator.for_each.gcn.284.to
push append.values
peek generator.for_each.gcn.284.array
alen
peek generator.for_each.gcn.284.to
pop
pushc global.zero
peek generator.for_each.gcn.284.i
pop
generator.for_each.gcn.284.start:
pushcp generator.for_each.gcn.284.end
push generator.for_each.gcn.284.i
push generator.for_each.gcn.284.to
eq
not
jz
pop
push generator.for_each.gcn.284.i
push generator.for_each.gcn.284.array
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
generator.for_each.gcn.284.continue:
push generator.for_each.gcn.284.i
inc
pop
pushcp generator.for_each.gcn.284.start
jp
generator.for_each.gcn.284.end:
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
word generator.const.gcn.285 1
pushcp generator.const.gcn.285
push global.arg_counter
mov
jc
peek reverse.l
pop
word generator.const.gcn.286 2
pushc generator.const.gcn.286
push reverse.l
copy
swp
pop
idiv
peek reverse.hl
pop
word generator.const.gcn.287 0
pushc generator.const.gcn.287
peek reverse.i
pop
generator.while.gcn.288.start:
pushcp generator.while.gcn.288.end
push reverse.hl
push reverse.i
swp
bg
jz
pop
push reverse.array
word generator.const.gcn.289 1
pushc generator.const.gcn.289
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
word generator.const.gcn.290 1
pushc generator.const.gcn.290
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
pushcp generator.while.gcn.288.start
jp
generator.while.gcn.288.end:
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
word generator.const.gcn.291 0
pushc generator.const.gcn.291
peek indexof.i
pop
@generator.for_each.gcn.292.array
@generator.for_each.gcn.292.i
@generator.for_each.gcn.292.to
push indexof.array
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
@indexof.x
peek indexof.x
pop
pushcp generator.if.gcn.293.else
pushc typeclass
push indexof.x
pushcp system_op_is
jc
jz
pop
pushcp generator.if.gcn.294.else
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
generator.if.gcn.294.else:
pushcp generator.if.gcn.293.end
jp
generator.if.gcn.293.else:
pushcp generator.if.gcn.295.else
push indexof.object
push indexof.x
eq
jz
pop
push indexof.i
jr
generator.if.gcn.295.else:
generator.if.gcn.293.end:
push indexof.i
inc
pop
generator.for_each.gcn.292.continue:
push generator.for_each.gcn.292.i
inc
pop
pushcp generator.for_each.gcn.292.start
jp
generator.for_each.gcn.292.end:
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
word generator.const.gcn.296 1
pushcp generator.const.gcn.296
push global.arg_counter
mov
jc
peek insert.l
pop
word generator.const.gcn.298 1
pushc generator.const.gcn.298
push insert.l
copy
swp
pop
add
push insert.array
pushc setlen
word generator.const.gcn.297 2
pushcp generator.const.gcn.297
push global.arg_counter
mov
jc
generator.while.gcn.299.start:
pushcp generator.while.gcn.299.end
push insert.index
push insert.l
bg
jz
pop
push insert.array
word generator.const.gcn.300 1
pushc generator.const.gcn.300
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
pushcp generator.while.gcn.299.start
jp
generator.while.gcn.299.end:
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
word generator.const.gcn.301 1
pushcp generator.const.gcn.301
push global.arg_counter
mov
jc
peek delete.i
pop
word generator.const.gcn.302 1
pushc generator.const.gcn.302
push delete.array
pushc len
word generator.const.gcn.303 1
pushcp generator.const.gcn.303
push global.arg_counter
mov
jc
copy
swp
pop
sub
peek delete.l
pop
generator.while.gcn.304.start:
pushcp generator.while.gcn.304.end
push delete.l
push delete.i
swp
bg
jz
pop
push delete.array
word generator.const.gcn.305 1
pushc generator.const.gcn.305
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
pushcp generator.while.gcn.304.start
jp
generator.while.gcn.304.end:
push delete.i
push delete.array
pushc setlen
word generator.const.gcn.306 2
pushcp generator.const.gcn.306
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
word generator.const.gcn.307 2
pushcp generator.const.gcn.307
push global.arg_counter
mov
jc
peek remove.index
pop
pushcp generator.if.gcn.308.else
push null
push remove.index
eq
not
jz
pop
push remove.index
push remove.array
pushc delete
word generator.const.gcn.309 2
pushcp generator.const.gcn.309
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.308.end
jp
generator.if.gcn.308.else:
push remove.array
jr
generator.if.gcn.308.end:
jr
remove__end:
pushcp clear__end
jp
clear:
@clear.this
@clear.array
peek clear.array
pop
word generator.const.gcn.311 0
pushc generator.const.gcn.311
push clear.array
pushc setlen
word generator.const.gcn.310 2
pushcp generator.const.gcn.310
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
word generator.const.gcn.312 0
pushc generator.const.gcn.312
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.313 1
pushcp generator.const.gcn.313
newa
peek params
pop
word generator.const.gcn.314 0
pushc generator.const.gcn.314
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.315.start:
pushcp generator.while.gcn.315.end
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
pushcp generator.while.gcn.315.start
jp
generator.while.gcn.315.end:
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
str generator.const.gcn.316 "'."
pushc generator.const.gcn.316
push exception__tostring.this
pushc vtable__message
swp
pushai
str generator.const.gcn.317 ">, message: '"
pushc generator.const.gcn.317
push exception__tostring.this
pushc vtable__classname
swp
pushai
str generator.const.gcn.318 "Exception <"
pushc generator.const.gcn.318
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
pushcp generator.if.gcn.319.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.319.end
jp
generator.if.gcn.319.else:
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
generator.if.gcn.319.end:
jr
system_makeexception__end:
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
word generator.const.gcn.320 1
pushcp generator.const.gcn.320
push global.arg_counter
mov
jc
push thr_kill.thr
pushc thr_terminate
word generator.const.gcn.321 1
pushcp generator.const.gcn.321
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
word generator.const.gcn.322 0
pushcp generator.const.gcn.322
push global.arg_counter
mov
jc
push tthread_join.threadclass
peek global.this
pushc vtable__terminate
swp
pushai
word generator.const.gcn.323 0
pushcp generator.const.gcn.323
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
word generator.const.gcn.324 2
pushcp generator.const.gcn.324
push global.arg_counter
mov
jc
push tthread__create.this
pushc vtable__threadcontext
swp
peekai
pushcp generator.if.gcn.325.else
push tthread__create.resumed
jz
pop
push tthread__create.this
peek global.this
pushc vtable__resume
swp
pushai
word generator.const.gcn.326 0
pushcp generator.const.gcn.326
push global.arg_counter
mov
jc
generator.if.gcn.325.else:
jr
tthread__create__end:
pushcp tthread__free__end
jp
tthread__free:
@tthread__free.this
push global.this
peek tthread__free.this
pop
pushcp generator.if.gcn.327.else
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
word generator.const.gcn.328 0
pushcp generator.const.gcn.328
push global.arg_counter
mov
jc
generator.if.gcn.327.else:
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
word generator.const.gcn.329 2
pushcp generator.const.gcn.329
push global.arg_counter
mov
jc
push tthread__rejoin.this
pushc vtable__threadcontext
swp
peekai
pushcp generator.if.gcn.330.else
push tthread__rejoin.resumed
jz
pop
push tthread__rejoin.this
peek global.this
pushc vtable__resume
swp
pushai
word generator.const.gcn.331 0
pushcp generator.const.gcn.331
push global.arg_counter
mov
jc
generator.if.gcn.330.else:
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
word generator.const.gcn.332 1
pushcp generator.const.gcn.332
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
word generator.const.gcn.333 1
pushcp generator.const.gcn.333
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
word generator.const.gcn.334 2
pushcp generator.const.gcn.334
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
word generator.const.gcn.335 1
pushcp generator.const.gcn.335
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
generator.while.gcn.336.start:
pushcp generator.while.gcn.336.end
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
word generator.const.gcn.337 1
pushc generator.const.gcn.337
pushc sleep
invoke
pushc gc
word generator.const.gcn.338 0
pushcp generator.const.gcn.338
push global.arg_counter
mov
jc
pushcp generator.while.gcn.336.start
jp
generator.while.gcn.336.end:
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
word generator.const.gcn.339 1
pushcp generator.const.gcn.339
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
word generator.const.gcn.340 1
pushcp generator.const.gcn.340
push global.arg_counter
mov
jc
peek global.arg_counter
pop
@generator.for_each.gcn.341.array
@generator.for_each.gcn.341.i
@generator.for_each.gcn.341.to
push tthreadcall__execute.this
pushc vtable__args
swp
pushai
peek generator.for_each.gcn.341.array
alen
peek generator.for_each.gcn.341.i
dec
pop
pushc global.zero
peek generator.for_each.gcn.341.to
dec
pop
generator.for_each.gcn.341.start:
pushcp generator.for_each.gcn.341.end
push generator.for_each.gcn.341.i
push generator.for_each.gcn.341.to
eq
not
jz
pop
push generator.for_each.gcn.341.i
push generator.for_each.gcn.341.array
pushai
@tthreadcall__execute.arg
peek tthreadcall__execute.arg
pop
push tthreadcall__execute.arg
peek tthreadcall__execute.x
pop
push tthreadcall__execute.x
generator.for_each.gcn.341.continue:
push generator.for_each.gcn.341.i
dec
pop
pushcp generator.for_each.gcn.341.start
jp
generator.for_each.gcn.341.end:
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
word generator.const.gcn.342 3
pushcp generator.const.gcn.342
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
word generator.const.gcn.343 1
pushcp generator.const.gcn.343
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
word generator.const.gcn.344 3
pushcp generator.const.gcn.344
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
word generator.const.gcn.345 1
pushcp generator.const.gcn.345
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
word generator.const.gcn.346 3
pushcp generator.const.gcn.346
push global.arg_counter
mov
jc
jr
jr
thread__end:
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