import println "crt.lib" "PRINTLN"
@global.arg_counter
@global.temp
@a
@b
pushcp generator.if.gcn.0.else
word generator.const.gcn.1 1
pushc generator.const.gcn.1
word generator.const.gcn.2 2
pushc generator.const.gcn.2
bg
word generator.const.gcn.3 1
pushc generator.const.gcn.3
word generator.const.gcn.4 2
pushc generator.const.gcn.4
add
word generator.const.gcn.5 2
pushc generator.const.gcn.5
word generator.const.gcn.6 2
pushc generator.const.gcn.6
mul
eq
and
jz
str generator.const.gcn.7 "true"
pushc generator.const.gcn.7
pushc println
invoke
pushcp generator.if.gcn.0.end
jp
generator.if.gcn.0.else:
str generator.const.gcn.8 "false"
pushc generator.const.gcn.8
pushc println
invoke
generator.if.gcn.0.end:
str generator.const.gcn.9 "(2 + 2) * 2 / 3 ="
pushc generator.const.gcn.9
pushc println
invoke
word generator.const.gcn.10 3
pushc generator.const.gcn.10
word generator.const.gcn.11 2
pushc generator.const.gcn.11
div
word generator.const.gcn.12 2
pushc generator.const.gcn.12
word generator.const.gcn.13 2
pushc generator.const.gcn.13
add
mul
pushc println
invoke
word generator.const.gcn.14 10
pushc generator.const.gcn.14
peek a
pop
push a
pushc println
invoke
word generator.const.gcn.15 1
pushc generator.const.gcn.15
push a
copy
swp
pop
add
word generator.const.gcn.16 1
pushc generator.const.gcn.16
add
peek b
pop
push a
pushc println
invoke
push b
pushc println
invoke
push a
peek b
pop
word generator.const.gcn.17 10
pushc generator.const.gcn.17
push a
add
pop
push a
pushc println
invoke
push b
pushc println
invoke