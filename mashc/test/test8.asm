import println "crt.lib" "PRINTLN"
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
word vtable__a 1
word vtable__b 2
word vtable__classname 3
word vtable__message 4
word vtable__create 5
word vtable__summ 6
word myclassparent 0
word myclass 1
word exception 2
@global.arg_counter
@global.temp
@global.this
word global.zero 0
word global.one 1
str global.raised "ERaisedException"
word generator.const.gcn.0 0
pushc generator.const.gcn.0
peek global.arg_counter
pop
@x
@e
@sysslash
@null
@argc
@args
@eabstractexception
@emathexception
@ecriticalexception
@eunknown
pushcp __init__
jc
pushcp __allocator__myclass
jc
pcopy
peek global.this
word generator.const.gcn.2 3
pushc generator.const.gcn.2
swp
word generator.const.gcn.3 2
pushc generator.const.gcn.3
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.1 2
pushcp generator.const.gcn.1
push global.arg_counter
mov
jc
peek x
pop
push x
peek global.this
pushc vtable__summ
swp
pushai
word generator.const.gcn.4 0
pushcp generator.const.gcn.4
push global.arg_counter
mov
jc
pushc println
invoke
pushcp generator.try.gcn.5.finally
pushcp generator.try.gcn.5.catch
tr
word generator.const.gcn.6 0
pushc generator.const.gcn.6
word generator.const.gcn.7 1
pushc generator.const.gcn.7
div
generator.try.gcn.5.break:
trs
generator.try.gcn.5.catch:
pushcp system_makeexception
jc
@e
peek e
pop
push e
peek global.this
pushc vtable__message
swp
pushai
pushc println
invoke
generator.try.gcn.5.finally:
pushc getsystemslash
invoke
peek sysslash
pop
pushcp __init__end__
jp
__init__:
pushc __getvm_null__
word generator.const.gcn.8 0
pushcp generator.const.gcn.8
push global.arg_counter
mov
jc
peek null
pop
word generator.const.gcn.9 0
pushc generator.const.gcn.9
peek argc
pop
push null
peek args
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
pushcp myclassparent__create__end
jp
myclassparent__create:
@myclassparent__create.this
@myclassparent__create.a
peek myclassparent__create.a
pop
push global.this
peek myclassparent__create.this
pop
str generator.const.gcn.36 "Hello from parent!"
pushc generator.const.gcn.36
pushc println
invoke
push myclassparent__create.a
copy
swp
pop
push myclassparent__create.this
peek global.this
pushc vtable__a
swp
peekai
jr
myclassparent__create__end:
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
push myclass__create.this
peek global.this
pop
pushcp myclassparent__create
word generator.const.gcn.37 1
pushcp generator.const.gcn.37
push global.arg_counter
mov
jc
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
pushcp len__end
jp
len:
@len.this
@len.a
peek len.a
pop
push len.a
alen
jr
len__end:
pushcp copy__end
jp
copy:
@copy.this
@copy.obj
peek copy.obj
pop
push copy.obj
copy
jr
copy__end:
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
pushcp generator.if.gcn.38.else
push system_op_range.isback
jz
pop
word generator.const.gcn.39 1
pushc generator.const.gcn.39
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
pushcp generator.if.gcn.38.end
jp
generator.if.gcn.38.else:
word generator.const.gcn.40 1
pushc generator.const.gcn.40
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
generator.if.gcn.38.end:
push system_op_range.l
word generator.const.gcn.41 1
pushcp generator.const.gcn.41
newa
peek system_op_range.res
pop
word generator.const.gcn.42 0
pushc generator.const.gcn.42
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.43 1
pushcp generator.const.gcn.43
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.44.start:
pushcp generator.while.gcn.44.end
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
pushcp generator.if.gcn.45.else
push system_op_range.isback
jz
pop
word generator.const.gcn.46 1
pushc generator.const.gcn.46
push system_op_range.j
sub
push system_op_range.j
mov
pushcp generator.if.gcn.45.end
jp
generator.if.gcn.45.else:
word generator.const.gcn.47 1
pushc generator.const.gcn.47
push system_op_range.j
add
push system_op_range.j
mov
generator.if.gcn.45.end:
pushcp generator.while.gcn.44.start
jp
generator.while.gcn.44.end:
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
@generator.for_each.gcn.48.array
@generator.for_each.gcn.48.i
@generator.for_each.gcn.48.to
push system_op_in.right
peek generator.for_each.gcn.48.array
alen
peek generator.for_each.gcn.48.to
pop
pushc global.zero
peek generator.for_each.gcn.48.i
pop
generator.for_each.gcn.48.start:
pushcp generator.for_each.gcn.48.end
push generator.for_each.gcn.48.i
push generator.for_each.gcn.48.to
eq
not
jz
pop
push generator.for_each.gcn.48.i
push generator.for_each.gcn.48.array
pushai
@system_op_in.x
peek system_op_in.x
pop
pushcp generator.if.gcn.49.else
push system_op_in.left
push x
eq
jz
pop
pushc true
jr
generator.if.gcn.49.else:
push generator.for_each.gcn.48.i
inc
pop
pushcp generator.for_each.gcn.48.start
jp
generator.for_each.gcn.48.end:
pushc false
jr
jr
system_op_in__end:
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
@__initproc__.local_i
@__initproc__.local_a
peek argc
pop
push argc
word generator.const.gcn.50 1
pushcp generator.const.gcn.50
newa
peek args
pop
word generator.const.gcn.51 0
pushc generator.const.gcn.51
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.52.start:
pushcp generator.while.gcn.52.end
push argc
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
push args
push __initproc__.local_i
swp
peekai
push __initproc__.local_i
inc
pop
pushcp generator.while.gcn.52.start
jp
generator.while.gcn.52.end:
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
peek system_makeexception.classname
pop
peek system_makeexception.message
pop
pushcp generator.if.gcn.53.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.53.end
jp
generator.if.gcn.53.else:
pushcp __allocator__exception
jc
peek e
pop
push system_makeexception.classname
copy
swp
pop
push e
peek global.this
pushc vtable__classname
swp
peekai
push system_makeexception.message
copy
swp
pop
push e
peek global.this
pushc vtable__message
swp
peekai
push e
jr
generator.if.gcn.53.end:
jr
system_makeexception__end:
word __vtable__size__ 7
pushcp __allocator__myclassparent__end
jp
__allocator__myclassparent:
pushcp __vtable__size__
pushcp global.one
newa
pcopy
pushc myclassparent
swp
pushcp vtable__type
swp
peekai
pcopy
pushc myclassparent__create
swp
pushcp vtable__create
swp
peekai
jr
__allocator__myclassparent__end:
pushcp __allocator__myclass__end
jp
__allocator__myclass:
pushcp __vtable__size__
pushcp global.one
newa
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
jr
__allocator__myclass__end:
pushcp __allocator__exception__end
jp
__allocator__exception:
pushcp __vtable__size__
pushcp global.one
newa
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