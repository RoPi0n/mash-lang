import println "crt.lib" "PRINTLN"
@global.arg_counter
@global.temp
@a
word generator.const.gcn.0 0
pushc generator.const.gcn.0
peek a
pop
generator.while.gcn.1.start:
pushcp generator.while.gcn.1.end
word generator.const.gcn.2 10
pushc generator.const.gcn.2
push a
swp
bg
jz
push a
pushc println
invoke
word generator.const.gcn.3 1
pushc generator.const.gcn.3
push a
add
pop
pushcp generator.while.gcn.1.start
jp
generator.while.gcn.1.end: