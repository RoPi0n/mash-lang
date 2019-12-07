import println "crt.lib" "PRINTLN"
@global.arg_counter
@global.temp
word generator.const.gcn.0 0
pushc generator.const.gcn.0
peek global.arg_counter
pop
@a
@s
@i
@b
@x
word generator.const.gcn.1 0
pushc generator.const.gcn.1
peek a
pop
generator.while.gcn.2.start:
pushcp generator.while.gcn.2.end
word generator.const.gcn.3 10
pushc generator.const.gcn.3
push a
be
not
jz
pop
push a
pushc out
word generator.const.gcn.4 1
pushcp generator.const.gcn.4
push global.arg_counter
mov
jc
pushc println
invoke
push a
inc
pop
pushcp generator.while.gcn.2.start
jp
generator.while.gcn.2.end:
str generator.const.gcn.5 "Hello world!"
pushc generator.const.gcn.5
peek s
pop
word generator.const.gcn.6 0
pushc generator.const.gcn.6
peek i
pop
generator.while.gcn.7.start:
pushcp generator.while.gcn.7.end
push s
pushc len
word generator.const.gcn.8 1
pushcp generator.const.gcn.8
push global.arg_counter
mov
jc
push i
swp
bg
jz
pop
push s
push i
swp
pushai
pushc println
invoke
push i
inc
pop
pushcp generator.while.gcn.7.start
jp
generator.while.gcn.7.end:
word generator.const.gcn.10 3
pushc generator.const.gcn.10
word generator.const.gcn.9 1
pushcp generator.const.gcn.9
newa
peek b
pop
push b
pushc len
word generator.const.gcn.11 1
pushcp generator.const.gcn.11
push global.arg_counter
mov
jc
pushc println
invoke
word generator.const.gcn.12 0
pushc generator.const.gcn.12
peek x
pop
word generator.const.gcn.13 1
pushc generator.const.gcn.13
push x
copy
swp
pop
add
push b
word generator.const.gcn.14 0
pushc generator.const.gcn.14
swp
peekai
word generator.const.gcn.15 2
pushc generator.const.gcn.15
push x
copy
swp
pop
add
push b
word generator.const.gcn.16 1
pushc generator.const.gcn.16
swp
peekai
word generator.const.gcn.17 3
pushc generator.const.gcn.17
push x
copy
swp
pop
add
push b
word generator.const.gcn.18 2
pushc generator.const.gcn.18
swp
peekai
word generator.const.gcn.19 0
pushc generator.const.gcn.19
peek i
pop
generator.while.gcn.20.start:
pushcp generator.while.gcn.20.end
word generator.const.gcn.21 3
pushc generator.const.gcn.21
push i
swp
bg
jz
pop
push b
push i
swp
pushai
pushc println
invoke
push i
inc
pop
pushcp generator.while.gcn.20.start
jp
generator.while.gcn.20.end:
push x
pushc println
invoke
pushcp out__end
jp
out:
@out.a
peek out.a
pop
word generator.const.gcn.22 1
pushc generator.const.gcn.22
push out.a
copy
swp
pop
add
str generator.const.gcn.23 "Next number is a "
pushc generator.const.gcn.23
add
jr
out__end:
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