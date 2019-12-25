import print "crt.lib" "PRINT"
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
pushc getsystemslash
invoke
peek sysslash
pop
pushcp __init__end__
jp
__init__:
word generator.const.gcn.1 1
pushc generator.const.gcn.1
neg
peek true
pop
word generator.const.gcn.2 0
pushc generator.const.gcn.2
peek false
pop
pushc __getvm_null__
word generator.const.gcn.3 0
pushcp generator.const.gcn.3
push global.arg_counter
mov
jc
peek null
pop
word generator.const.gcn.4 0
pushc generator.const.gcn.4
peek argc
pop
push null
peek args
pop
pushc __initproc__
word generator.const.gcn.5 0
pushcp generator.const.gcn.5
push global.arg_counter
mov
jc
jr
__init__end__:
pushcp out__end
jp
out:
@out.a
peek out.a
pop
word generator.const.gcn.6 1
pushc generator.const.gcn.6
push out.a
copy
swp
pop
add
str generator.const.gcn.7 "Next number is a "
pushc generator.const.gcn.7
add
jr
out__end:
pushcp main__end
jp
main:
@main.a
@main.s
@main.b
@main.x
@main.i
word generator.const.gcn.8 0
pushc generator.const.gcn.8
peek main.a
pop
generator.while.gcn.9.start:
pushcp generator.while.gcn.9.end
word generator.const.gcn.10 10
pushc generator.const.gcn.10
push main.a
be
not
jz
pop
push main.a
pushc out
word generator.const.gcn.11 1
pushcp generator.const.gcn.11
push global.arg_counter
mov
jc
pushc println
invoke
push main.a
inc
pop
pushcp generator.while.gcn.9.start
jp
generator.while.gcn.9.end:
str generator.const.gcn.12 "Hello world!"
pushc generator.const.gcn.12
peek main.s
pop
word generator.const.gcn.13 0
pushc generator.const.gcn.13
peek main.i
pop
generator.while.gcn.14.start:
pushcp generator.while.gcn.14.end
push main.s
pushc len
word generator.const.gcn.15 1
pushcp generator.const.gcn.15
push global.arg_counter
mov
jc
push main.i
swp
bg
jz
pop
push main.s
push main.i
swp
pushai
pushc print
invoke
push main.i
inc
pop
pushcp generator.while.gcn.14.start
jp
generator.while.gcn.14.end:
str generator.const.gcn.16 ""
pushc generator.const.gcn.16
pushc println
invoke
@generator.for_each.gcn.17.array
@generator.for_each.gcn.17.i
@generator.for_each.gcn.17.to
push main.s
peek generator.for_each.gcn.17.array
alen
peek generator.for_each.gcn.17.i
dec
pop
pushc global.zero
peek generator.for_each.gcn.17.to
dec
pop
generator.for_each.gcn.17.start:
pushcp generator.for_each.gcn.17.end
push generator.for_each.gcn.17.i
push generator.for_each.gcn.17.to
eq
not
jz
pop
push generator.for_each.gcn.17.i
push generator.for_each.gcn.17.array
pushai
@main.i
peek main.i
pop
push main.i
pushc print
invoke
push generator.for_each.gcn.17.i
dec
pop
pushcp generator.for_each.gcn.17.start
jp
generator.for_each.gcn.17.end:
str generator.const.gcn.18 ""
pushc generator.const.gcn.18
pushc println
invoke
word generator.const.gcn.20 3
pushc generator.const.gcn.20
word generator.const.gcn.19 1
pushcp generator.const.gcn.19
newa
peek main.b
pop
push main.b
pushc len
word generator.const.gcn.21 1
pushcp generator.const.gcn.21
push global.arg_counter
mov
jc
pushc println
invoke
word generator.const.gcn.22 0
pushc generator.const.gcn.22
peek main.x
pop
word generator.const.gcn.23 1
pushc generator.const.gcn.23
push main.x
copy
swp
pop
add
push main.b
word generator.const.gcn.24 0
pushc generator.const.gcn.24
swp
peekai
word generator.const.gcn.25 2
pushc generator.const.gcn.25
push main.x
copy
swp
pop
add
push main.b
word generator.const.gcn.26 1
pushc generator.const.gcn.26
swp
peekai
word generator.const.gcn.27 3
pushc generator.const.gcn.27
push main.x
copy
swp
pop
add
push main.b
word generator.const.gcn.28 2
pushc generator.const.gcn.28
swp
peekai
word generator.const.gcn.29 0
pushc generator.const.gcn.29
peek main.i
pop
generator.while.gcn.30.start:
pushcp generator.while.gcn.30.end
word generator.const.gcn.31 3
pushc generator.const.gcn.31
push main.i
swp
bg
jz
pop
push main.b
push main.i
swp
pushai
pushc println
invoke
push main.i
inc
pop
pushcp generator.while.gcn.30.start
jp
generator.while.gcn.30.end:
push main.x
pushc println
invoke
@generator.for_each.gcn.32.array
@generator.for_each.gcn.32.i
@generator.for_each.gcn.32.to
word generator.const.gcn.33 3
pushcp generator.const.gcn.33
word generator.const.gcn.34 1
pushcp generator.const.gcn.34
newa
pcopy
word generator.const.gcn.38 3
pushcp generator.const.gcn.38
word generator.const.gcn.39 1
pushcp generator.const.gcn.39
newa
pcopy
word generator.const.gcn.43 1
pushc generator.const.gcn.43
swp
word generator.const.gcn.40 0
pushcp generator.const.gcn.40
swp
peekai
pcopy
word generator.const.gcn.44 2
pushc generator.const.gcn.44
swp
word generator.const.gcn.41 1
pushcp generator.const.gcn.41
swp
peekai
pcopy
word generator.const.gcn.45 3
pushc generator.const.gcn.45
swp
word generator.const.gcn.42 2
pushcp generator.const.gcn.42
swp
peekai
swp
word generator.const.gcn.35 0
pushcp generator.const.gcn.35
swp
peekai
pcopy
word generator.const.gcn.46 3
pushcp generator.const.gcn.46
word generator.const.gcn.47 1
pushcp generator.const.gcn.47
newa
pcopy
word generator.const.gcn.51 4
pushc generator.const.gcn.51
swp
word generator.const.gcn.48 0
pushcp generator.const.gcn.48
swp
peekai
pcopy
word generator.const.gcn.52 5
pushc generator.const.gcn.52
swp
word generator.const.gcn.49 1
pushcp generator.const.gcn.49
swp
peekai
pcopy
word generator.const.gcn.53 6
pushc generator.const.gcn.53
swp
word generator.const.gcn.50 2
pushcp generator.const.gcn.50
swp
peekai
swp
word generator.const.gcn.36 1
pushcp generator.const.gcn.36
swp
peekai
pcopy
word generator.const.gcn.54 3
pushcp generator.const.gcn.54
word generator.const.gcn.55 1
pushcp generator.const.gcn.55
newa
pcopy
word generator.const.gcn.59 7
pushc generator.const.gcn.59
swp
word generator.const.gcn.56 0
pushcp generator.const.gcn.56
swp
peekai
pcopy
word generator.const.gcn.60 8
pushc generator.const.gcn.60
swp
word generator.const.gcn.57 1
pushcp generator.const.gcn.57
swp
peekai
pcopy
word generator.const.gcn.61 9
pushc generator.const.gcn.61
swp
word generator.const.gcn.58 2
pushcp generator.const.gcn.58
swp
peekai
swp
word generator.const.gcn.37 2
pushcp generator.const.gcn.37
swp
peekai
peek generator.for_each.gcn.32.array
alen
peek generator.for_each.gcn.32.to
pop
pushc global.zero
peek generator.for_each.gcn.32.i
pop
generator.for_each.gcn.32.start:
pushcp generator.for_each.gcn.32.end
push generator.for_each.gcn.32.i
push generator.for_each.gcn.32.to
eq
not
jz
pop
push generator.for_each.gcn.32.i
push generator.for_each.gcn.32.array
pushai
@main.y
peek main.y
pop
@generator.for_each.gcn.62.array
@generator.for_each.gcn.62.i
@generator.for_each.gcn.62.to
push main.y
peek generator.for_each.gcn.62.array
alen
peek generator.for_each.gcn.62.i
dec
pop
pushc global.zero
peek generator.for_each.gcn.62.to
dec
pop
generator.for_each.gcn.62.start:
pushcp generator.for_each.gcn.62.end
push generator.for_each.gcn.62.i
push generator.for_each.gcn.62.to
eq
not
jz
pop
push generator.for_each.gcn.62.i
push generator.for_each.gcn.62.array
pushai
@main.j
peek main.j
pop
push main.j
pushc print
invoke
str generator.const.gcn.63 " "
pushc generator.const.gcn.63
pushc print
invoke
push generator.for_each.gcn.62.i
dec
pop
pushcp generator.for_each.gcn.62.start
jp
generator.for_each.gcn.62.end:
str generator.const.gcn.64 ""
pushc generator.const.gcn.64
pushc println
invoke
push generator.for_each.gcn.32.i
inc
pop
pushcp generator.for_each.gcn.32.start
jp
generator.for_each.gcn.32.end:
jr
main__end:
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
pushcp generator.if.gcn.65.else
push system_op_range.isback
jz
pop
word generator.const.gcn.66 1
pushc generator.const.gcn.66
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
pushcp generator.if.gcn.65.end
jp
generator.if.gcn.65.else:
word generator.const.gcn.67 1
pushc generator.const.gcn.67
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
generator.if.gcn.65.end:
push system_op_range.l
word generator.const.gcn.68 1
pushcp generator.const.gcn.68
newa
peek system_op_range.res
pop
word generator.const.gcn.69 0
pushc generator.const.gcn.69
peek system_op_range.i
pop
push system_op_range.from
pushc copy
word generator.const.gcn.70 1
pushcp generator.const.gcn.70
push global.arg_counter
mov
jc
peek system_op_range.j
pop
generator.while.gcn.71.start:
pushcp generator.while.gcn.71.end
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
pushcp generator.if.gcn.72.else
push system_op_range.isback
jz
pop
word generator.const.gcn.73 1
pushc generator.const.gcn.73
push system_op_range.j
sub
push system_op_range.j
mov
pushcp generator.if.gcn.72.end
jp
generator.if.gcn.72.else:
word generator.const.gcn.74 1
pushc generator.const.gcn.74
push system_op_range.j
add
push system_op_range.j
mov
generator.if.gcn.72.end:
pushcp generator.while.gcn.71.start
jp
generator.while.gcn.71.end:
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
@generator.for_each.gcn.75.array
@generator.for_each.gcn.75.i
@generator.for_each.gcn.75.to
push system_op_in.right
peek generator.for_each.gcn.75.array
alen
peek generator.for_each.gcn.75.to
pop
pushc global.zero
peek generator.for_each.gcn.75.i
pop
generator.for_each.gcn.75.start:
pushcp generator.for_each.gcn.75.end
push generator.for_each.gcn.75.i
push generator.for_each.gcn.75.to
eq
not
jz
pop
push generator.for_each.gcn.75.i
push generator.for_each.gcn.75.array
pushai
@system_op_in.x
peek system_op_in.x
pop
pushcp generator.if.gcn.76.else
push system_op_in.left
push system_op_in.x
eq
jz
pop
push true
jr
generator.if.gcn.76.else:
push generator.for_each.gcn.75.i
inc
pop
pushcp generator.for_each.gcn.75.start
jp
generator.for_each.gcn.75.end:
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
word generator.const.gcn.77 1
pushcp generator.const.gcn.77
newa
peek args
pop
word generator.const.gcn.78 0
pushc generator.const.gcn.78
peek __initproc__.local_i
pop
push null
peek __initproc__.local_a
pop
generator.while.gcn.79.start:
pushcp generator.while.gcn.79.end
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
pushcp generator.while.gcn.79.start
jp
generator.while.gcn.79.end:
jr
__initproc____end:
pushcp main
jc