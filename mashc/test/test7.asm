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
@global.arg_counter
@global.temp
word global.zero 0
word global.one 1
word generator.const.gcn.0 0
pushc generator.const.gcn.0
peek global.arg_counter
pop
@sysslash
@true
@false
@null
@argc
@args
pushcp __init__
jc
@a
pushc global.zero
peek a
pop a
pushn
pushcp generator.async.gcn.1.start
cthr
rthr
pushcp generator.async.gcn.1.end
jp
generator.async.gcn.1.start:
pop
@generator.for_each.gcn.2.array
@generator.for_each.gcn.2.i
@generator.for_each.gcn.2.to
word generator.const.gcn.3 10
pushc generator.const.gcn.3
word generator.const.gcn.4 1
pushc generator.const.gcn.4
pushcp system_op_range
jc
peek generator.for_each.gcn.2.array
alen
peek generator.for_each.gcn.2.to
pop
pushc global.zero
peek generator.for_each.gcn.2.i
pop
generator.for_each.gcn.2.start:
pushcp generator.for_each.gcn.2.end
push generator.for_each.gcn.2.i
push generator.for_each.gcn.2.to
eq
not
jz
pop
push generator.for_each.gcn.2.i
push generator.for_each.gcn.2.array
pushai
@i
peek i
pop
word generator.const.gcn.5 100
pushc generator.const.gcn.5
pushc randomto
invoke
word generator.const.gcn.6 100
pushc generator.const.gcn.6
add
pushc sleep
invoke
push i
copy
swp
pop
str generator.const.gcn.7 "First: "
pushc generator.const.gcn.7
add
pushc println
invoke
push generator.for_each.gcn.2.i
inc
pop
pushcp generator.for_each.gcn.2.start
jp
generator.for_each.gcn.2.end:
push a
inc
pop
jr
generator.async.gcn.1.end:
@b
pushc global.zero
peek b
pop b
pushn
pushcp generator.async.gcn.8.start
cthr
rthr
pushcp generator.async.gcn.8.end
jp
generator.async.gcn.8.start:
pop
@generator.for_each.gcn.9.array
@generator.for_each.gcn.9.i
@generator.for_each.gcn.9.to
word generator.const.gcn.10 10
pushc generator.const.gcn.10
word generator.const.gcn.11 1
pushc generator.const.gcn.11
pushcp system_op_range
jc
peek generator.for_each.gcn.9.array
alen
peek generator.for_each.gcn.9.to
pop
pushc global.zero
peek generator.for_each.gcn.9.i
pop
generator.for_each.gcn.9.start:
pushcp generator.for_each.gcn.9.end
push generator.for_each.gcn.9.i
push generator.for_each.gcn.9.to
eq
not
jz
pop
push generator.for_each.gcn.9.i
push generator.for_each.gcn.9.array
pushai
@i
peek i
pop
word generator.const.gcn.12 100
pushc generator.const.gcn.12
pushc randomto
invoke
word generator.const.gcn.13 100
pushc generator.const.gcn.13
add
pushc sleep
invoke
push i
copy
swp
pop
str generator.const.gcn.14 "Second: "
pushc generator.const.gcn.14
add
pushc println
invoke
push generator.for_each.gcn.9.i
inc
pop
pushcp generator.for_each.gcn.9.start
jp
generator.for_each.gcn.9.end:
push b
inc
pop
jr
generator.async.gcn.8.end:
push a
pushcp generator.wait.gcn.15.check
jp
generator.wait.gcn.15.start:
pushcp global.one
pushcp sleep
invoke
generator.wait.gcn.15.check:
pcopy
pushcp generator.wait.gcn.15.start
swp
jz
pop
pop
push b
pushcp generator.wait.gcn.16.check
jp
generator.wait.gcn.16.start:
pushcp global.one
pushcp sleep
invoke
generator.wait.gcn.16.check:
pcopy
pushcp generator.wait.gcn.16.start
swp
jz
pop
pop
str generator.const.gcn.17 "The end"
pushc generator.const.gcn.17
pushc println
invoke
pushc getsystemslash
invoke
peek sysslash
pop
pushcp __init__end__
jp
__init__:
word generator.const.gcn.18 1
pushc generator.const.gcn.18
neg
peek true
pop
word generator.const.gcn.19 0
pushc generator.const.gcn.19
peek false
pop
pushc __getvm_null__
word generator.const.gcn.20 0
pushcp generator.const.gcn.20
push global.arg_counter
mov
jc
peek null
pop
word generator.const.gcn.21 0
pushc generator.const.gcn.21
peek argc
pop
push null
peek args
pop
pushc __initproc__
word generator.const.gcn.22 0
pushcp generator.const.gcn.22
push global.arg_counter
mov
jc
jr
__init__end__:
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
pushcp generator.if.gcn.23.else
push system_op_range.isback
jz
pop
word generator.const.gcn.24 1
pushc generator.const.gcn.24
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
pushcp generator.if.gcn.23.end
jp
generator.if.gcn.23.else:
word generator.const.gcn.25 1
pushc generator.const.gcn.25
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
generator.if.gcn.23.end:
push system_op_range.l
word generator.const.gcn.26 1
pushcp generator.const.gcn.26
newa
peek system_op_range.res
pop
word generator.const.gcn.27 0
pushc generator.const.gcn.27
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.28 1
pushcp generator.const.gcn.28
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.29.start:
pushcp generator.while.gcn.29.end
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
pushcp generator.if.gcn.30.else
push system_op_range.isback
jz
pop
word generator.const.gcn.31 1
pushc generator.const.gcn.31
push system_op_range.j
sub
push system_op_range.j
mov
pushcp generator.if.gcn.30.end
jp
generator.if.gcn.30.else:
word generator.const.gcn.32 1
pushc generator.const.gcn.32
push system_op_range.j
add
push system_op_range.j
mov
generator.if.gcn.30.end:
pushcp generator.while.gcn.29.start
jp
generator.while.gcn.29.end:
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
@generator.for_each.gcn.33.array
@generator.for_each.gcn.33.i
@generator.for_each.gcn.33.to
push system_op_in.right
peek generator.for_each.gcn.33.array
alen
peek generator.for_each.gcn.33.to
pop
pushc global.zero
peek generator.for_each.gcn.33.i
pop
generator.for_each.gcn.33.start:
pushcp generator.for_each.gcn.33.end
push generator.for_each.gcn.33.i
push generator.for_each.gcn.33.to
eq
not
jz
pop
push generator.for_each.gcn.33.i
push generator.for_each.gcn.33.array
pushai
@system_op_in.x
peek system_op_in.x
pop
pushcp generator.if.gcn.34.else
push system_op_in.left
push system_op_in.x
eq
jz
pop
push true
jr
generator.if.gcn.34.else:
push generator.for_each.gcn.33.i
inc
pop
pushcp generator.for_each.gcn.33.start
jp
generator.for_each.gcn.33.end:
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
word generator.const.gcn.35 1
pushcp generator.const.gcn.35
newa
peek args
pop
word generator.const.gcn.36 0
pushc generator.const.gcn.36
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.37.start:
pushcp generator.while.gcn.37.end
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
pushcp generator.while.gcn.37.start
jp
generator.while.gcn.37.end:
jr
__initproc____end: