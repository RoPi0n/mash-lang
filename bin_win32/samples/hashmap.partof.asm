word __addrtsz 50
pushc __addrtsz
gpm
msz
gc


pushc __defc_gen_str_n0
peek 1
pop




pushc __entrypoint
gpm
jc
pushc __haltpoint
gpm
jp
pushcp __gen_free_method_end_block
jp
free:


push 0

peek 13
pop
__gen_while_0:
pushcp __gen_while_0_end


push 13
copy
gpm
swp
pop

pushcp __defc_gen_word_n3
swp
bg
gpm
jz
pop
rem
push 13
dec
pop
pushcp __gen_while_0
jp
__gen_while_0_end:
__gen_free_method_end:
jr
__gen_free_method_end_block:
pushcp __gen___entrypoint_method_end_block
jp
__entrypoint:
peek 22
pop



push 22

pushcp __defc_gen_word_n9
newa

peek 23
pop


pushc __defc_gen_word_n10
gpm

peek 24
pop
__gen_while_3:
pushcp __gen_while_3_end


push 24
copy
gpm
swp
pop

push 22
bg
gpm
jz
pop

push 24
push 23
peekai



push 24
inc
pop
pushcp __gen_while_3
jp
__gen_while_3_end:


pushc __defc_gen_word_n11
gpm

peek 0
pop
pushcp main
jc
gc
__gen___entrypoint_method_end:
jr
__gen___entrypoint_method_end_block:
import _print "crt.lib" "PRINT"
import _println "crt.lib" "PRINTLN"
import inputln "crt.lib" "INPUTLN"
pushcp __gen_println_method_end_block
jp
println:


push 0

peek 27
pop
__gen_while_5:
pushcp __gen_while_5_end


push 27
copy
gpm
swp
pop

pushcp __defc_gen_word_n24
swp
bg
gpm
jz
pop


pushc __defc_gen_word_n25
gpm

peek 0
pop
pushcp _print
invoke
push 27
dec
pop
pushcp __gen_while_5
jp
__gen_while_5_end:


pushc __defc_gen_str_n26
gpm

pushc __defc_gen_word_n27
gpm

peek 0
pop
pushcp _println
invoke
__gen_println_method_end:
jr
__gen_println_method_end_block:


pushcp __gen_testclass__free_method_end_block
jp
testclass__free:
peek 28
pop
push 28


push 29
push 28
pushai


push 30
push 28
pushai

pushc __defc_gen_word_n28
gpm

peek 0
pop
pushcp free
jc
__gen_testclass__free_method_end:
jr
__gen_testclass__free_method_end_block:
pushcp __gen_testclass__hash_method_end_block
jp
testclass__hash:
peek 31
pop
push 33
push 31
pushai


push 34
push 31
pushai
copy
gpm
swp
pop
mul
peek 32
pop

push 32
copy
gpm
swp
pop
peek 32
pop

push 32
copy
gpm
swp
pop


push 34
push 31
pushai
swp
xor
peek 32
pop

push 32
copy
gpm
swp
pop


push 33
push 31
pushai
swp
xor
jr
__gen_testclass__hash_method_end:
jr
__gen_testclass__hash_method_end_block:
pushcp __gen_testclass__sayhello_method_end_block
jp
testclass__sayhello:
peek 35
pop
pushc __defc_gen_str_n29
gpm

pushc __defc_gen_word_n30
gpm

peek 0
pop
pushcp println
jc
__gen_testclass__sayhello_method_end:
jr
__gen_testclass__sayhello_method_end_block:

pushcp __gen_testclass__free_method_end_block
jp
testclass__free:
peek 28
pop
push 28


pushcp __class__child_b
push 28
pushai


pushcp __class__child_a
push 28
pushai

pushc __defc_gen_word_n33
gpm

peek 0
pop
pushcp free
jc
__gen_testclass__free_method_end:
jr
__gen_testclass__free_method_end_block:
pushcp __gen_testclass__hash_method_end_block
jp
testclass__hash:
peek 31
pop
pushcp __class__child_b
push 31
pushai


pushcp __class__child_a
push 31
pushai
copy
gpm
swp
pop
mul
peek 32
pop

push 32
copy
gpm
swp
pop
peek 32
pop

push 32
copy
gpm
swp
pop


pushcp __class__child_a
push 31
pushai
swp
xor
peek 32
pop

push 32
copy
gpm
swp
pop


pushcp __class__child_b
push 31
pushai
swp
xor
jr
__gen_testclass__hash_method_end:
jr
__gen_testclass__hash_method_end_block:








pushcp __gen_main_method_end_block
jp
main:
pushcp __class_testclass_allocator
jc
pcopy


pushc __defc_gen_word_n57
gpm
swp

pushc __defc_gen_word_n58
gpm
swp

pushc __defc_gen_word_n59
gpm

peek 0
pop
pushcp _common_class_constructor
jc

peek 49
pop
pushc __defc_gen_word_n60
gpm

peek 0
pop
pushcp inputln
invoke
__gen_main_method_end:
jr
__gen_main_method_end_block:

_common_class_constructor:
pop
jr
__class_testclass_allocator:

pushcp __defc_gen_word_n61

pushcp __defc_gen_word_n62
newa
pcopy
pushcp testclass
swp
pushcp __class__child_type
swp
peekai
pcopy
pushcp testclass__free
swp
pushcp __class__child_free
swp
peekai
pcopy
pushcp testclass__hash
swp
pushcp __class__child_hash
swp
peekai
pcopy
pushcp testclass__sayhello
swp
pushcp __class__child_sayhello
swp
peekai
pcopy
pushcp _common_class_constructor
swp
pushcp __class__child_create
swp
peekai
__gen___class_testclass_allocator_method_end:

__haltpoint:
gc
