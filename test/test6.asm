import print "crt.lib" "PRINT"
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
word vtable__type 0
@global.arg_counter
@global.temp
word global.zero 0
word global.one 1
word generator.const.gcn.0 0
pushc generator.const.gcn.0
peek global.arg_counter
pop
@m
@sysslash
@true
@false
@null
@argc
@args
pushcp __init__
jc
@generator.for_each.gcn.1.array
@generator.for_each.gcn.1.i
@generator.for_each.gcn.1.to
word generator.const.gcn.2 10
pushc generator.const.gcn.2
word generator.const.gcn.3 15
pushc generator.const.gcn.3
pushcp system_op_range
jc
peek generator.for_each.gcn.1.array
alen
peek generator.for_each.gcn.1.i
dec
pop
pushc global.zero
peek generator.for_each.gcn.1.to
dec
pop
generator.for_each.gcn.1.start:
pushcp generator.for_each.gcn.1.end
push generator.for_each.gcn.1.i
push generator.for_each.gcn.1.to
eq
not
jz
pop
push generator.for_each.gcn.1.i
push generator.for_each.gcn.1.array
pushai
@i
peek i
pop
push i
pushc println
invoke
push generator.for_each.gcn.1.i
dec
pop
pushcp generator.for_each.gcn.1.start
jp
generator.for_each.gcn.1.end:
pushcp generator.if.gcn.4.else
word generator.const.gcn.5 11
pushc generator.const.gcn.5
word generator.const.gcn.6 9
pushc generator.const.gcn.6
pushcp system_op_range
jc
word generator.const.gcn.7 10
pushc generator.const.gcn.7
pushcp system_op_in
jc
jz
pop
str generator.const.gcn.8 "Hehe"
pushc generator.const.gcn.8
pushc println
invoke
generator.if.gcn.4.else:
word generator.const.gcn.9 1
pushc generator.const.gcn.9
word generator.const.gcn.10 9
pushc generator.const.gcn.10
add
peek m
pop
push m
pushc factorial
word generator.const.gcn.11 1
pushcp generator.const.gcn.11
push global.arg_counter
mov
jc
pushc println
invoke
word generator.const.gcn.13 2
pushc generator.const.gcn.13
pcopy
word generator.const.gcn.15 1
pushc generator.const.gcn.15
eq
pushcp generator.case.gcn.14.end
swp
jz
word generator.const.gcn.16 1
pushc generator.const.gcn.16
pushc println
invoke
pushcp generator.switch.gcn.12.end
jp
generator.case.gcn.14.end:
pcopy
word generator.const.gcn.18 2
pushc generator.const.gcn.18
eq
pushcp generator.case.gcn.17.end
swp
jz
word generator.const.gcn.19 2
pushc generator.const.gcn.19
pushc println
invoke
pushcp generator.switch.gcn.12.end
jp
generator.case.gcn.17.end:
str generator.const.gcn.20 "default"
pushc generator.const.gcn.20
pushc println
invoke
generator.switch.gcn.12.end:
@generator.for_each.gcn.21.array
@generator.for_each.gcn.21.i
@generator.for_each.gcn.21.to
word generator.const.gcn.22 10
pushc generator.const.gcn.22
word generator.const.gcn.23 1
pushc generator.const.gcn.23
pushcp system_op_range
jc
peek generator.for_each.gcn.21.array
alen
peek generator.for_each.gcn.21.to
pop
pushc global.zero
peek generator.for_each.gcn.21.i
pop
generator.for_each.gcn.21.start:
pushcp generator.for_each.gcn.21.end
push generator.for_each.gcn.21.i
push generator.for_each.gcn.21.to
eq
not
jz
pop
push generator.for_each.gcn.21.i
push generator.for_each.gcn.21.array
pushai
@i
peek i
pop
pushn
pushcp generator.launch.gcn.24.start
cthr
rthr
pushcp generator.launch.gcn.24.end
jp
generator.launch.gcn.24.start:
pop
word generator.const.gcn.25 100
pushc generator.const.gcn.25
pushc randomto
invoke
word generator.const.gcn.26 10
pushc generator.const.gcn.26
add
pushc sleep
invoke
push i
pushc println
invoke
jr
generator.launch.gcn.24.end:
push generator.for_each.gcn.21.i
inc
pop
pushcp generator.for_each.gcn.21.start
jp
generator.for_each.gcn.21.end:
word generator.const.gcn.27 500
pushc generator.const.gcn.27
pushc sleep
invoke
pushc inputln
invoke
pushc getsystemslash
invoke
peek sysslash
pop
pushcp __init__end__
jp
__init__:
word generator.const.gcn.28 1
pushc generator.const.gcn.28
neg
peek true
pop
word generator.const.gcn.29 0
pushc generator.const.gcn.29
peek false
pop
pushc __getvm_null__
word generator.const.gcn.30 0
pushcp generator.const.gcn.30
push global.arg_counter
mov
jc
peek null
pop
word generator.const.gcn.31 0
pushc generator.const.gcn.31
peek argc
pop
push null
peek args
pop
pushc __initproc__
word generator.const.gcn.32 0
pushcp generator.const.gcn.32
push global.arg_counter
mov
jc
jr
__init__end__:
pushcp factorial__end
jp
factorial:
@factorial.n
@factorial.r
peek factorial.n
pop
word generator.const.gcn.33 1
pushc generator.const.gcn.33
peek factorial.r
pop
@generator.for_each.gcn.34.array
@generator.for_each.gcn.34.i
@generator.for_each.gcn.34.to
push factorial.n
word generator.const.gcn.35 1
pushc generator.const.gcn.35
pushcp system_op_range
jc
peek generator.for_each.gcn.34.array
alen
peek generator.for_each.gcn.34.to
pop
pushc global.zero
peek generator.for_each.gcn.34.i
pop
generator.for_each.gcn.34.start:
pushcp generator.for_each.gcn.34.end
push generator.for_each.gcn.34.i
push generator.for_each.gcn.34.to
eq
not
jz
pop
push generator.for_each.gcn.34.i
push generator.for_each.gcn.34.array
pushai
@factorial.i
peek factorial.i
pop
push factorial.i
push factorial.r
mul
pop
push generator.for_each.gcn.34.i
inc
pop
pushcp generator.for_each.gcn.34.start
jp
generator.for_each.gcn.34.end:
push factorial.r
jr
jr
factorial__end:
pushcp len__end
jp
len:
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
pushcp generator.if.gcn.36.else
push system_op_range.isback
jz
pop
word generator.const.gcn.37 1
pushc generator.const.gcn.37
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
pushcp generator.if.gcn.36.end
jp
generator.if.gcn.36.else:
word generator.const.gcn.38 1
pushc generator.const.gcn.38
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
generator.if.gcn.36.end:
push system_op_range.l
word generator.const.gcn.39 1
pushcp generator.const.gcn.39
newa
peek system_op_range.res
pop
word generator.const.gcn.40 0
pushc generator.const.gcn.40
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.41 1
pushcp generator.const.gcn.41
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.42.start:
pushcp generator.while.gcn.42.end
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
pushcp generator.if.gcn.43.else
push system_op_range.isback
jz
pop
word generator.const.gcn.44 1
pushc generator.const.gcn.44
push system_op_range.j
sub
push system_op_range.j
mov
pushcp generator.if.gcn.43.end
jp
generator.if.gcn.43.else:
word generator.const.gcn.45 1
pushc generator.const.gcn.45
push system_op_range.j
add
push system_op_range.j
mov
generator.if.gcn.43.end:
pushcp generator.while.gcn.42.start
jp
generator.while.gcn.42.end:
push system_op_range.res
jr
jr
system_op_range__end:
pushcp system_op_in__end
jp
system_op_in:
@system_op_in.left
@system_op_in.right
peek system_op_in.left
pop
peek system_op_in.right
pop
@generator.for_each.gcn.46.array
@generator.for_each.gcn.46.i
@generator.for_each.gcn.46.to
push system_op_in.right
peek generator.for_each.gcn.46.array
alen
peek generator.for_each.gcn.46.to
pop
pushc global.zero
peek generator.for_each.gcn.46.i
pop
generator.for_each.gcn.46.start:
pushcp generator.for_each.gcn.46.end
push generator.for_each.gcn.46.i
push generator.for_each.gcn.46.to
eq
not
jz
pop
push generator.for_each.gcn.46.i
push generator.for_each.gcn.46.array
pushai
@system_op_in.x
peek system_op_in.x
pop
pushcp generator.if.gcn.47.else
push system_op_in.left
push system_op_in.x
eq
jz
pop
push true
jr
generator.if.gcn.47.else:
push generator.for_each.gcn.46.i
inc
pop
pushcp generator.for_each.gcn.46.start
jp
generator.for_each.gcn.46.end:
push false
jr
jr
system_op_in__end:
pushcp __getvm_null____end
jp
__getvm_null__:
pushn
jr
__getvm_null____end:
pushcp __initproc____end
jp
__initproc__:
@__initproc__.local_i
@__initproc__.local_a
peek argc
pop
push argc
word generator.const.gcn.48 1
pushcp generator.const.gcn.48
newa
peek args
pop
word generator.const.gcn.49 0
pushc generator.const.gcn.49
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.50.start:
pushcp generator.while.gcn.50.end
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
pushcp generator.while.gcn.50.start
jp
generator.while.gcn.50.end:
jr
__initproc____end: