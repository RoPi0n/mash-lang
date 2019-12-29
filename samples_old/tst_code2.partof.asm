word __addrtsz 36
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
int true -1
booltostr:
peek 2
pop
pushcp __gen_if_0_end


push 2
copy
gpm
swp
pop

pushcp true
eq
gpm
jz
pop

pushc __defc_gen_str_n1
gpm
jr
pushcp __gen_if_0_else_end
jp
__gen_if_0_end:

pushc __defc_gen_str_n2
gpm
jr
__gen_if_0_else_end:
__gen_booltostr_method_end:
jr
new:
peek 3
pop


new
peek 4
pop


push 3

push 4
mov

push 4
jr
__gen_new_method_end:
jr
typeof:
peek 8
pop

push 8
typeof
gpm
__gen_typeof_method_end:
jr
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
import _print "crt.lib" "PRINT"
import _println "crt.lib" "PRINTLN"
import inputln "crt.lib" "INPUTLN"
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







myclass__create:
peek 28
pop
peek 29
pop
push 29

pushc __defc_gen_word_n28
gpm

peek 0
pop
pushcp new
jc


pushcp __class__child_a
push 28
peekai
__gen_myclass__create_method_end:
jr

myclass__f:
peek 30
pop
pushcp __defc_gen_word_n29


pushcp __class__child_a
push 30
pushai
copy
gpm
swp
pop
mul
peek 31
pop

push 31
copy
gpm
swp
pop
jr
__gen_myclass__f_method_end:
jr






myclass2__f:
peek 32
pop
pushcp __defc_gen_word_n30


push 32

pushc __defc_gen_word_n31
gpm

peek 0
pop
pushcp myclass__f
jc
mul
peek 33
pop

push 33
copy
gpm
swp
pop
jr
__gen_myclass2__f_method_end:
jr

myclass2__free:
peek 34
pop
pushcp __class__child_a
push 34
pushai

pushc __defc_gen_word_n32
gpm

peek 0
pop
pushcp free
jc
pushc __defc_gen_word_n33
gpm

peek 0
pop

push 34

pushcp __class__child_rem
push 34
pushai
jc
__gen_myclass2__free_method_end:
jr

main:
pushcp __class_myclass2_allocator
jc
pcopy


pushc __defc_gen_word_n34
gpm
swp

pushc __defc_gen_word_n35
gpm

peek 0
pop
pushcp myclass__create
jc
peek 35
pop
pushc __defc_gen_word_n36
gpm

peek 0
pop

push 35

pushcp __class__child_f
push 35
pushai
jc

pushc __defc_gen_word_n37
gpm

peek 0
pop
pushcp println
jc

pushc __defc_gen_word_n38
gpm

pushcp __defc_gen_str_n39
swp
add

pushc __defc_gen_word_n40
gpm

peek 0
pop
pushcp typeof
jc

pushcp typereal
eq
gpm

pushc __defc_gen_word_n41
gpm

peek 0
pop
pushcp booltostr
jc

pushc __defc_gen_word_n42
gpm

peek 0
pop
pushcp println
jc

pushc __defc_gen_word_n43
gpm

peek 0
pop
pushcp inputln
invoke
__gen_main_method_end:
jr

_common_class_constructor:
pop
jr


__class_myclass2_allocator:

pushcp __defc_gen_word_n46

pushcp __defc_gen_word_n47
newa
pcopy
pushc myclass2
swp
pushcp __class__child_type
swp
peekai
pcopy
pushc __class_myclass2_rem
swp
pushcp __class__child_rem
swp
peekai
pcopy
pushc myclass__create
swp
pushcp __class__child_create
swp
peekai
pcopy
pushc myclass2__f
swp
pushcp __class__child_f
swp
peekai
pcopy
pushc myclass2__free
swp
pushcp __class__child_free
swp
peekai
__gen___class_myclass2_allocator_method_end:
jr

__class_myclass2_rem:
pcopy
pushcp __class__child_type
swp
pushai
rem
pcopy
pushcp __class__child_rem
swp
pushai
rem
pcopy
pushcp __class__child_create
swp
pushai
rem
pcopy
pushcp __class__child_f
swp
pushai
rem
pcopy
pushcp __class__child_free
swp
pushai
rem
rem
__gen___class_myclass2_rem_method_end:
jr


__haltpoint:
gc
