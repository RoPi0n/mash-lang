word __addrtsz 49
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
import _tickcnt "bf.lib" "TICKCNT"
int true -1
int false 0
copy:
peek 5
pop

push 5
copy
gpm
swp
pop
__gen_copy_method_end:
jr
len:
peek 9
pop

push 9
alen
gpm
peek 10
pop

push 10
jr
__gen_len_method_end:
jr
gc:
gc
stkdrop
__gen_gc_method_end:
jr
temp:

pushc __defc_gen_word_n8
gpm
jr
__gen_temp_method_end:
jr
__entrypoint:


pushc __defc_gen_word_n9
gpm

peek 0
pop
pushcp main
jc
gc
jr
tickcnt:


pushc __defc_gen_word_n19
gpm

peek 0
pop
pushcp _tickcnt
invoke
gpm
__gen_tickcnt_method_end:
jr
import _print "crt.lib" "PRINT"
import _println "crt.lib" "PRINTLN"
import inputln "crt.lib" "INPUTLN"
print:


push 0

peek 23
pop
__gen_while_3:
pushcp __gen_while_3_end


push 23
copy
gpm
swp
pop

pushcp __defc_gen_word_n20
swp
bg
gpm
jz
pop


pushc __defc_gen_word_n21
gpm

peek 0
pop
pushcp _print
invoke
push 23
dec
pop
pushcp __gen_while_3
jp
__gen_while_3_end:
__gen_print_method_end:
jr
println:


push 0

peek 24
pop
__gen_while_4:
pushcp __gen_while_4_end


push 24
copy
gpm
swp
pop

pushcp __defc_gen_word_n22
swp
bg
gpm
jz
pop


pushc __defc_gen_word_n23
gpm

peek 0
pop
pushcp _print
invoke
push 24
dec
pop
pushcp __gen_while_4
jp
__gen_while_4_end:


pushc __defc_gen_str_n24
gpm

pushc __defc_gen_word_n25
gpm

peek 0
pop
pushcp _println
invoke
__gen_println_method_end:
jr






qsort:
peek 25
pop
peek 26
pop
peek 27
pop
push 26

peek 28
pop
push 27

peek 29
pop
push 26
copy
gpm
swp
pop

push 27
swp
add
peek 30
pop

pushcp __defc_gen_word_n26

push 30
copy
gpm
swp
pop
idiv
peek 31
pop

push 31
copy
gpm
swp
pop
push 25
pushai

peek 32
pop

__gen_while_5:
pushcp __gen_while_5_end



push 29
copy
gpm
swp
pop

pushcp __defc_gen_word_n27
swp
add
peek 30
pop


push 29
copy
gpm
swp
pop

pushcp __defc_gen_word_n28
swp
add
peek 31
pop

push 28
copy
gpm
swp
pop

push 30
bg
gpm
jz
pop
__gen_while_6:
pushcp __gen_while_6_end



push 28
push 25
pushai
copy
gpm
swp
pop

push 32
bg
gpm
jz
pop
push 28
inc
pop
pushcp __gen_while_6
jp
__gen_while_6_end:

__gen_while_7:
pushcp __gen_while_7_end



push 29
push 25
pushai
copy
gpm
swp
pop

push 32
swp
bg
gpm
jz
pop
push 29
dec
pop
pushcp __gen_while_7
jp
__gen_while_7_end:

pushcp __gen_if_2_end



push 29
copy
gpm
swp
pop

pushcp __defc_gen_word_n29
swp
add
peek 30
pop


push 29
copy
gpm
swp
pop

pushcp __defc_gen_word_n30
swp
add
peek 31
pop

push 28
copy
gpm
swp
pop

push 30
bg
gpm
jz
pop
push 28
push 25
pushai

peek 33
pop
push 29
push 25
pushai


push 28
push 25
peekai
push 33


push 29
push 25
peekai
push 28
inc
pop
push 29
dec
pop
__gen_if_2_end:
pushcp __gen_while_5
jp
__gen_while_5_end:

pushcp __gen_if_3_end


push 26
copy
gpm
swp
pop

push 29
bg
gpm
jz
pop
push 29

push 26

push 25

pushc __defc_gen_word_n31
gpm

peek 0
pop
pushcp qsort
jc
__gen_if_3_end:

pushcp __gen_if_4_end


push 28
copy
gpm
swp
pop

push 27
bg
gpm
jz
pop
push 27

push 28

push 25

pushc __defc_gen_word_n32
gpm

peek 0
pop
pushcp qsort
jc
__gen_if_4_end:
__gen_qsort_method_end:
jr






bsort:
peek 34
pop
pushc true
gpm

peek 35
pop
push 34

pushc __defc_gen_word_n33
gpm

peek 0
pop
pushcp len
jc

peek 36
pop
pushc __defc_gen_word_n34
gpm

peek 0
pop
pushcp temp
jc

peek 37
pop
pushc __defc_gen_word_n35
gpm

peek 38
pop
__gen_for_0:
pushcp __gen_for_0_for_end



push 36
copy
gpm
swp
pop

pushcp __defc_gen_word_n36
swp
sub
peek 39
pop


push 36
copy
gpm
swp
pop

pushcp __defc_gen_word_n37
swp
sub
peek 40
pop

push 38
copy
gpm
swp
pop

push 39
bg
gpm
jz
pop
pushc true
gpm

push 35
mov
pushc __defc_gen_word_n38
gpm

peek 41
pop
__gen_for_1:
pushcp __gen_for_1_for_end



push 36
copy
gpm
swp
pop

pushcp __defc_gen_word_n39
swp
sub
peek 39
pop


push 36
copy
gpm
swp
pop

pushcp __defc_gen_word_n40
swp
sub
peek 40
pop

push 41
copy
gpm
swp
pop

push 39
bg
gpm
jz
pop
pushcp __gen_if_5_end





push 41
copy
gpm
swp
pop

pushcp __defc_gen_word_n41
swp
add
push 34
pushai
copy
gpm
swp
pop


push 41
push 34
pushai
bg
gpm
jz
pop
push 41
copy
gpm
swp
pop

pushcp __defc_gen_word_n42
swp
add
push 34
pushai

push 37
mov
push 41
push 34
pushai




push 41
copy
gpm
swp
pop

pushcp __defc_gen_word_n43
swp
add
push 34
pushai
mov
push 37


push 41
push 34
pushai
mov
pushc false
gpm

push 35
mov
__gen_if_5_end:
push 41
inc
pop
pushcp __gen_for_1
jp
__gen_for_1_for_end:

pushcp __gen_if_6_end

push 35
jz
pop
pushcp __gen_for_0_for_end
jp
__gen_if_6_end:
push 38
inc
pop
pushcp __gen_for_0
jp
__gen_for_0_for_end:
__gen_bsort_method_end:
jr







printarray:
peek 42
pop
pushc __defc_gen_word_n44
gpm

peek 43
pop
__gen_for_2:
pushcp __gen_for_2_for_end


push 43
copy
gpm
swp
pop


push 42

pushc __defc_gen_word_n45
gpm

peek 0
pop
pushcp len
jc
bg
gpm
jz
pop
pushc __defc_gen_str_n46
gpm


push 43
push 42
pushai

pushc __defc_gen_word_n47
gpm

peek 0
pop
pushcp print
jc
push 43
inc
pop
pushcp __gen_for_2
jp
__gen_for_2_for_end:
pushc __defc_gen_str_n48
gpm

pushc __defc_gen_word_n49
gpm

peek 0
pop
pushcp println
jc
__gen_printarray_method_end:
jr



main:
pushcp __defc_gen_word_n50

pushcp __defc_gen_word_n51
newa

peek 44
pop

pushc __defc_gen_word_n52
gpm

peek 45
pop
__gen_for_3:
pushcp __gen_for_3_for_end


push 45
copy
gpm
swp
pop

pushcp __defc_gen_word_n53
bg
gpm
jz
pop
push 45

pushc __defc_gen_word_n54
gpm

peek 0
pop
pushcp copy
jc




pushc __defc_gen_word_n55
gpm

push 45
swp
sub
push 44
peekai
push 45
inc
pop
pushcp __gen_for_3
jp
__gen_for_3_for_end:

pushc __defc_gen_word_n56
gpm

peek 0
pop
pushcp tickcnt
jc

peek 46
pop
pushc __defc_gen_word_n57
gpm

pushc __defc_gen_word_n58
gpm

push 44

pushc __defc_gen_word_n59
gpm

peek 0
pop
pushcp qsort
jc
pushc __defc_gen_word_n60
gpm

peek 0
pop
pushcp tickcnt
jc

push 46
swp
sub

peek 47
pop
pushc __defc_gen_str_n61
gpm

push 47
swp
add

pushcp __defc_gen_str_n62
swp
add

pushc __defc_gen_word_n63
gpm

peek 0
pop
pushcp println
jc

pushcp __defc_gen_word_n64

pushcp __defc_gen_word_n65
newa

peek 48
pop

pushc __defc_gen_word_n66
gpm

peek 45
pop
__gen_for_4:
pushcp __gen_for_4_for_end


push 45
copy
gpm
swp
pop

pushcp __defc_gen_word_n67
bg
gpm
jz
pop
push 45

pushc __defc_gen_word_n68
gpm

peek 0
pop
pushcp copy
jc




pushc __defc_gen_word_n69
gpm

push 45
swp
sub
push 48
peekai
push 45
inc
pop
pushcp __gen_for_4
jp
__gen_for_4_for_end:

push 48

pushc __defc_gen_word_n70
gpm

peek 0
pop
pushcp bsort
jc

push 48

pushc __defc_gen_word_n71
gpm

peek 0
pop
pushcp printarray
jc

pushc __defc_gen_word_n72
gpm

peek 0
pop
pushcp gc
jc
pushc __defc_gen_word_n73
gpm

peek 0
pop
pushcp inputln
invoke
__gen_main_method_end:
jr


__haltpoint:
gc
