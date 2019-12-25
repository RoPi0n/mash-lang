import println "crt.lib" "PRINTLN"
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
word vtable__classname 3
word vtable__message 4
word vtable__create 5
word vtable__out 6
word vtable__summ 7
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
@x
@e
@sysslash
@null
@params
@eabstractexception
@emathexception
@ecriticalexception
@eunknown
word myclassparent 0
@structure_instance_myclassparent
pushcp __allocator__myclassparent
jc
peek structure_instance_myclassparent
pop
word myclass 1
@structure_instance_myclass
pushcp __allocator__myclass
jc
peek structure_instance_myclass
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
word generator.const.gcn.0 1
pushcp generator.const.gcn.0
pushcp global.one
newa
peek myenum
str mehello "Hello"
pcopy
pushc mehello
swp
word generator.const.gcn.1 0
pushcp generator.const.gcn.1
swp
peekai
pop
pushcp __allocator__myclass
jc
pcopy
peek global.this
word generator.const.gcn.3 3
pushc generator.const.gcn.3
swp
word generator.const.gcn.4 2
pushc generator.const.gcn.4
swp
pushcp vtable__create
swp
pushai
word generator.const.gcn.2 2
pushcp generator.const.gcn.2
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
word generator.const.gcn.5 0
pushcp generator.const.gcn.5
push global.arg_counter
mov
jc
pushc println
invoke
pushcp generator.try.gcn.6.finally
pushcp generator.try.gcn.6.catch
tr
word generator.const.gcn.7 0
pushc generator.const.gcn.7
word generator.const.gcn.8 1
pushc generator.const.gcn.8
copy
swp
pop
div
generator.try.gcn.6.break:
trs
generator.try.gcn.6.catch:
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
generator.try.gcn.6.finally:
word generator.const.gcn.10 10
pushc generator.const.gcn.10
pushc buzz
word generator.const.gcn.9 1
pushcp generator.const.gcn.9
push global.arg_counter
mov
jc
pushc mehello
push structure_instance_myclass
peek global.this
pushc vtable__out
swp
pushai
word generator.const.gcn.11 1
pushcp generator.const.gcn.11
push global.arg_counter
mov
jc
pushcp __init__end__
jp
__init__:
pushc getsystemslash
invoke
peek sysslash
pop
pushc __getvm_null__
word generator.const.gcn.12 0
pushcp generator.const.gcn.12
push global.arg_counter
mov
jc
peek null
pop
push null
peek params
pop
pushc __initproc__
word generator.const.gcn.13 0
pushcp generator.const.gcn.13
push global.arg_counter
mov
jc
jr
__init__end__:
word generator.const.gcn.14 5
pushcp generator.const.gcn.14
word generator.const.gcn.15 1
pushcp generator.const.gcn.15
newa
pcopy
pushc eraisedexception
swp
word generator.const.gcn.16 0
pushcp generator.const.gcn.16
swp
peekai
pcopy
pushc einvalidvmop
swp
word generator.const.gcn.17 1
pushcp generator.const.gcn.17
swp
peekai
pcopy
pushc einvalidtypecast
swp
word generator.const.gcn.18 2
pushcp generator.const.gcn.18
swp
peekai
pcopy
pushc eabstracterror
swp
word generator.const.gcn.19 3
pushcp generator.const.gcn.19
swp
peekai
pcopy
pushc eunknownexception
swp
word generator.const.gcn.20 4
pushcp generator.const.gcn.20
swp
peekai
peek eabstractexception
pop
word generator.const.gcn.21 9
pushcp generator.const.gcn.21
word generator.const.gcn.22 1
pushcp generator.const.gcn.22
newa
pcopy
pushc einterror
swp
word generator.const.gcn.23 0
pushcp generator.const.gcn.23
swp
peekai
pcopy
pushc edivbyzero
swp
word generator.const.gcn.24 1
pushcp generator.const.gcn.24
swp
peekai
pcopy
pushc erangeerror
swp
word generator.const.gcn.25 2
pushcp generator.const.gcn.25
swp
peekai
pcopy
pushc eintoverflow
swp
word generator.const.gcn.26 3
pushcp generator.const.gcn.26
swp
peekai
pcopy
pushc ematherror
swp
word generator.const.gcn.27 4
pushcp generator.const.gcn.27
swp
peekai
pcopy
pushc einvalidop
swp
word generator.const.gcn.28 5
pushcp generator.const.gcn.28
swp
peekai
pcopy
pushc ezerodivide
swp
word generator.const.gcn.29 6
pushcp generator.const.gcn.29
swp
peekai
pcopy
pushc eoverflow
swp
word generator.const.gcn.30 7
pushcp generator.const.gcn.30
swp
peekai
pcopy
pushc eunderflow
swp
word generator.const.gcn.31 8
pushcp generator.const.gcn.31
swp
peekai
peek emathexception
pop
word generator.const.gcn.32 3
pushcp generator.const.gcn.32
word generator.const.gcn.33 1
pushcp generator.const.gcn.33
newa
pcopy
pushc eaccessviolation
swp
word generator.const.gcn.34 0
pushcp generator.const.gcn.34
swp
peekai
pcopy
pushc eoserror
swp
word generator.const.gcn.35 1
pushcp generator.const.gcn.35
swp
peekai
pcopy
pushc enothreadsupport
swp
word generator.const.gcn.36 2
pushcp generator.const.gcn.36
swp
peekai
peek ecriticalexception
pop
str generator.const.gcn.38 "Unknown raised exception."
pushc generator.const.gcn.38
pushc eunknownexception
pushc system_makeexception
word generator.const.gcn.37 2
pushcp generator.const.gcn.37
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
str generator.const.gcn.39 "Hello from parent!"
pushc generator.const.gcn.39
pushc println
invoke
push myclassparent__create.a
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
word generator.const.gcn.40 1
pushcp generator.const.gcn.40
push global.arg_counter
mov
jc
push myclass__create.b
push myclass__create.this
peek global.this
pushc vtable__b
swp
peekai
jr
myclass__create__end:
pushcp myclass__out__end
jp
myclass__out:
@myclass__out.this
@myclass__out.xxx
peek myclass__out.xxx
pop
push global.this
peek myclass__out.this
pop
push myclass__out.xxx
pushc println
invoke
jr
myclass__out__end:
pushcp myclass__summ__end
jp
myclass__summ:
@myclass__summ.this
push global.this
peek myclass__summ.this
pop
push myclass__summ.this
peek global.this
pushc vtable__b
swp
pushai
push myclass__summ.this
peek global.this
pushc vtable__a
swp
pushai
copy
swp
pop
add
jr
jr
myclass__summ__end:
pushcp buzz__end
jp
buzz:
@buzz.this
@buzz.k
peek buzz.k
pop
pushcp generator.if.gcn.41.else
word generator.const.gcn.42 1
pushc generator.const.gcn.42
push buzz.k
bg
jz
pop
push buzz.this
rst
push buzz.k
rst
@buzz.j
word generator.const.gcn.44 1
pushc generator.const.gcn.44
push buzz.k
copy
swp
pop
sub
pushc buzz
word generator.const.gcn.43 1
pushcp generator.const.gcn.43
push global.arg_counter
mov
jc
peek buzz.j
pop
rld
peek buzz.k
pop
rld
peek buzz.this
pop
push buzz.j
pushc println
invoke
generator.if.gcn.41.else:
push buzz.k
jr
jr
buzz__end:
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
pushcp generator.if.gcn.45.else
push system_op_range.isback
jz
pop
word generator.const.gcn.46 1
pushc generator.const.gcn.46
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
pushcp generator.if.gcn.45.end
jp
generator.if.gcn.45.else:
word generator.const.gcn.47 1
pushc generator.const.gcn.47
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
generator.if.gcn.45.end:
push system_op_range.l
word generator.const.gcn.48 1
pushcp generator.const.gcn.48
newa
peek system_op_range.res
pop
word generator.const.gcn.49 0
pushc generator.const.gcn.49
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.50 1
pushcp generator.const.gcn.50
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.51.start:
pushcp generator.while.gcn.51.end
push system_op_range.l
push system_op_range.i
swp
bg
jz
pop
push system_op_range.j
push system_op_range.res
push system_op_range.i
swp
peekai
push system_op_range.i
inc
pop
pushcp generator.if.gcn.52.else
push system_op_range.isback
jz
pop
word generator.const.gcn.53 1
pushc generator.const.gcn.53
push system_op_range.j
copy
swp
pop
sub
push system_op_range.j
mov
pushcp generator.if.gcn.52.end
jp
generator.if.gcn.52.else:
word generator.const.gcn.54 1
pushc generator.const.gcn.54
push system_op_range.j
copy
swp
pop
add
push system_op_range.j
mov
generator.if.gcn.52.end:
pushcp generator.while.gcn.51.start
jp
generator.while.gcn.51.end:
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
@generator.for_each.gcn.55.array
@generator.for_each.gcn.55.i
@generator.for_each.gcn.55.to
push system_op_in.right
peek generator.for_each.gcn.55.array
alen
peek generator.for_each.gcn.55.to
pop
pushc global.zero
peek generator.for_each.gcn.55.i
pop
generator.for_each.gcn.55.start:
pushcp generator.for_each.gcn.55.end
push generator.for_each.gcn.55.i
push generator.for_each.gcn.55.to
eq
not
jz
pop
push generator.for_each.gcn.55.i
push generator.for_each.gcn.55.array
pushai
@system_op_in.x
peek system_op_in.x
pop
pushcp generator.if.gcn.56.else
push system_op_in.left
push x
eq
jz
pop
pushc true
jr
generator.if.gcn.56.else:
generator.for_each.gcn.55.continue:
push generator.for_each.gcn.55.i
inc
pop
pushcp generator.for_each.gcn.55.start
jp
generator.for_each.gcn.55.end:
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
word generator.const.gcn.57 0
pushc generator.const.gcn.57
peek system_op_argsarr.t
pop
push system_op_argsarr.argcount
word generator.const.gcn.58 1
pushcp generator.const.gcn.58
newa
peek system_op_argsarr.argset
pop
generator.while.gcn.59.start:
pushcp generator.while.gcn.59.end
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
pushcp generator.while.gcn.59.start
jp
generator.while.gcn.59.end:
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
word generator.const.gcn.60 1
pushcp generator.const.gcn.60
push global.arg_counter
mov
jc
peek system_copy_array.l
pop
push system_copy_array.l
word generator.const.gcn.61 1
pushcp generator.const.gcn.61
newa
peek system_copy_array.r
pop
word generator.const.gcn.62 0
pushc generator.const.gcn.62
peek system_copy_array.i
pop
generator.while.gcn.63.start:
pushcp generator.while.gcn.63.end
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
word generator.const.gcn.64 1
pushcp generator.const.gcn.64
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
pushcp generator.while.gcn.63.start
jp
generator.while.gcn.63.end:
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
pushcp generator.if.gcn.65.else
pushc typearray
push copy.object
pushc typeof
word generator.const.gcn.66 1
pushcp generator.const.gcn.66
push global.arg_counter
mov
jc
eq
jz
pop
push copy.object
pushc system_copy_array
word generator.const.gcn.67 1
pushcp generator.const.gcn.67
push global.arg_counter
mov
jc
jr
pushcp generator.if.gcn.65.end
jp
generator.if.gcn.65.else:
push copy.object
pushc system_copy_object
word generator.const.gcn.68 1
pushcp generator.const.gcn.68
push global.arg_counter
mov
jc
jr
generator.if.gcn.65.end:
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
word generator.const.gcn.69 0
pushcp generator.const.gcn.69
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek max.args
pop
pushcp generator.if.gcn.70.else
word generator.const.gcn.71 0
pushc generator.const.gcn.71
push max.args
pushc len
word generator.const.gcn.72 1
pushcp generator.const.gcn.72
push global.arg_counter
mov
jc
bg
jz
pop
push max.args
word generator.const.gcn.73 0
pushc generator.const.gcn.73
swp
pushai
peek max.r
pop
@generator.for_each.gcn.74.array
@generator.for_each.gcn.74.i
@generator.for_each.gcn.74.to
push max.args
peek generator.for_each.gcn.74.array
alen
peek generator.for_each.gcn.74.to
pop
pushc global.zero
peek generator.for_each.gcn.74.i
pop
generator.for_each.gcn.74.start:
pushcp generator.for_each.gcn.74.end
push generator.for_each.gcn.74.i
push generator.for_each.gcn.74.to
eq
not
jz
pop
push generator.for_each.gcn.74.i
push generator.for_each.gcn.74.array
pushai
@max.x
peek max.x
pop
pushcp generator.if.gcn.75.else
push max.r
push x
bg
jz
pop
push x
push max.r
mov
generator.if.gcn.75.else:
generator.for_each.gcn.74.continue:
push generator.for_each.gcn.74.i
inc
pop
pushcp generator.for_each.gcn.74.start
jp
generator.for_each.gcn.74.end:
push max.r
jr
pushcp generator.if.gcn.70.end
jp
generator.if.gcn.70.else:
push null
jr
generator.if.gcn.70.end:
jr
max__end:
pushcp min__end
jp
min:
@min.this
@min.args
@min.r
word generator.const.gcn.76 0
pushcp generator.const.gcn.76
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek min.args
pop
pushcp generator.if.gcn.77.else
word generator.const.gcn.78 0
pushc generator.const.gcn.78
push min.args
pushc len
word generator.const.gcn.79 1
pushcp generator.const.gcn.79
push global.arg_counter
mov
jc
bg
jz
pop
push min.args
word generator.const.gcn.80 0
pushc generator.const.gcn.80
swp
pushai
peek min.r
pop
@generator.for_each.gcn.81.array
@generator.for_each.gcn.81.i
@generator.for_each.gcn.81.to
push min.args
peek generator.for_each.gcn.81.array
alen
peek generator.for_each.gcn.81.to
pop
pushc global.zero
peek generator.for_each.gcn.81.i
pop
generator.for_each.gcn.81.start:
pushcp generator.for_each.gcn.81.end
push generator.for_each.gcn.81.i
push generator.for_each.gcn.81.to
eq
not
jz
pop
push generator.for_each.gcn.81.i
push generator.for_each.gcn.81.array
pushai
@min.x
peek min.x
pop
pushcp generator.if.gcn.82.else
push min.r
push x
swp
bg
jz
pop
push x
push min.r
mov
generator.if.gcn.82.else:
generator.for_each.gcn.81.continue:
push generator.for_each.gcn.81.i
inc
pop
pushcp generator.for_each.gcn.81.start
jp
generator.for_each.gcn.81.end:
push min.r
jr
pushcp generator.if.gcn.77.end
jp
generator.if.gcn.77.else:
push null
jr
generator.if.gcn.77.end:
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
word generator.const.gcn.83 0
pushcp generator.const.gcn.83
push global.arg_counter
sub
pushcp system_op_argsarr
jc
peek chr.chars
pop
str generator.const.gcn.84 ""
pushc generator.const.gcn.84
peek chr.r
pop
@generator.for_each.gcn.85.array
@generator.for_each.gcn.85.i
@generator.for_each.gcn.85.to
push chr.chars
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
@chr.ch
peek chr.ch
pop
push chr.ch
pushc _chr
word generator.const.gcn.86 1
pushcp generator.const.gcn.86
push global.arg_counter
mov
jc
push chr.r
add
pop
generator.for_each.gcn.85.continue:
push generator.for_each.gcn.85.i
inc
pop
pushcp generator.for_each.gcn.85.start
jp
generator.for_each.gcn.85.end:
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
word generator.const.gcn.87 0
pushc generator.const.gcn.87
peek __initproc__.argc
pop
peek __initproc__.argc
pop
push __initproc__.argc
word generator.const.gcn.88 1
pushcp generator.const.gcn.88
newa
peek params
pop
word generator.const.gcn.89 0
pushc generator.const.gcn.89
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.90.start:
pushcp generator.while.gcn.90.end
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
pushcp generator.while.gcn.90.start
jp
generator.while.gcn.90.end:
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
peek system_makeexception.classname
pop
peek system_makeexception.message
pop
pushcp generator.if.gcn.91.else
pushc eraisedexception
push system_makeexception.classname
eq
jz
pop
push system_makeexception.message
jr
pushcp generator.if.gcn.91.end
jp
generator.if.gcn.91.else:
pushcp __allocator__exception
jc
peek e
pop
push system_makeexception.classname
push e
peek global.this
pushc vtable__classname
swp
peekai
push system_makeexception.message
push e
peek global.this
pushc vtable__message
swp
peekai
push e
jr
generator.if.gcn.91.end:
jr
system_makeexception__end:
word __vtable__size__ 8
pushcp __allocator__myclassparent__end
jp
__allocator__myclassparent:
pushcp __vtable__size__
pushcp global.one
newa
typemarkclass
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
pushc myclass__out
swp
pushcp vtable__out
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