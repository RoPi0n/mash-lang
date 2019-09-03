pushc __addrtsz
gpm
msz
gc
pushc __def_const_gen_word_n0
gpm
peek 0
pop
pushc __getvm_null
gpm
jc
peek 1
pop
pushcp __gen___getvm_null_method_end_block
jp
__getvm_null:
pushn
__gen___getvm_null_method_end:
jr
__gen___getvm_null_method_end_block:
pushcp __gen_isnull_method_end_block
jp
isnull:
peek 2
pop
push 2
pushn
peq
gpm
__gen_isnull_method_end:
jr
__gen_isnull_method_end_block:
pushcp __gen_b2s_method_end_block
jp
b2s:
peek 3
pop
pushcp __gen_if_0_end
push 3
copy
gpm
swp
pop
pushcp true
eq
gpm
jz
pop
pushc __def_const_gen_str_n1
gpm
jr
pushcp __gen_if_0_else_end
jp
__gen_if_0_end:
pushc __def_const_gen_str_n2
gpm
jr
__gen_if_0_else_end:
__gen_b2s_method_end:
jr
__gen_b2s_method_end_block:
pushcp __gen_exitthread_method_end_block
jp
exitthread:
threxit
__gen_exitthread_method_end:
jr
__gen_exitthread_method_end_block:
pushcp __gen_new_method_end_block
jp
new:
peek 4
pop
new
peek 5
pop
push 4
push 5
mov
push 5
jr
__gen_new_method_end:
jr
__gen_new_method_end_block:
pushcp __gen_copy_method_end_block
jp
copy:
peek 6
pop
push 6
copy
gpm
swp
pop
__gen_copy_method_end:
jr
__gen_copy_method_end_block:
pushcp __gen_gpmx_method_end_block
jp
gpmx:
peek 7
pop
push 7
gpm
pop
push 7
jr
__gen_gpmx_method_end:
jr
__gen_gpmx_method_end_block:
pushcp __gen_typeof_method_end_block
jp
typeof:
peek 8
pop
push 8
typeof
gpm
__gen_typeof_method_end:
jr
__gen_typeof_method_end_block:
pushcp __gen_sizeof_method_end_block
jp
sizeof:
peek 9
pop
push 9
sizeof
gpm
__gen_sizeof_method_end:
jr
__gen_sizeof_method_end_block:
pushcp __gen_len_method_end_block
jp
len:
peek 10
pop
push 10
alen
gpm
peek 11
pop
push 11
jr
__gen_len_method_end:
jr
__gen_len_method_end_block:
pushcp __gen_setlen_method_end_block
jp
setlen:
peek 12
pop
peek 13
pop
push 12
push 13
salen
pop
__gen_setlen_method_end:
jr
__gen_setlen_method_end_block:
pushcp __gen_fill_method_end_block
jp
fill:
peek 14
pop
peek 15
pop
push 14
pushc __def_const_gen_word_n3
gpm
peek 0
pop
pushcp len
jc
peek 16
pop
pushc __def_const_gen_word_n4
gpm
peek 17
pop
__gen_for_0:
pushcp __gen_for_0_for_end
push 17
copy
gpm
swp
pop
push 16
bg
gpm
jz
pop
push 15
pushc __def_const_gen_word_n5
gpm
peek 0
pop
pushcp copy
jc
push 17
push 14
peekai
push 17
inc
pop
pushcp __gen_for_0
jp
__gen_for_0_for_end:
__gen_fill_method_end:
jr
__gen_fill_method_end_block:
pushcp __gen__op_range_method_end_block
jp
_op_range:
peek 18
pop
peek 19
pop
pushcp __gen_if_1_end
push 18
copy
gpm
swp
pop
push 19
swp
bg
gpm
jz
pop
push 18
copy
gpm
swp
pop
push 19
swp
sub
pushcp __def_const_gen_word_n6
swp
add
pushcp __def_const_gen_word_n7
newa
peek 20
pop
push 18
pushc __def_const_gen_word_n8
gpm
peek 0
pop
pushcp copy
jc
peek 21
pop
__gen_for_1:
pushcp __gen_for_1_for_end
push 21
copy
gpm
swp
pop
push 19
swp
be
gpm
jz
pop
push 21
pushc __def_const_gen_word_n9
gpm
peek 0
pop
pushcp copy
jc
push 18
copy
gpm
swp
pop
push 21
swp
sub
push 20
peekai
push 21
dec
pop
pushcp __gen_for_1
jp
__gen_for_1_for_end:
pushcp __gen_if_1_else_end
jp
__gen_if_1_end:
push 19
copy
gpm
swp
pop
push 18
swp
sub
pushcp __def_const_gen_word_n10
swp
add
pushcp __def_const_gen_word_n11
newa
peek 20
pop
push 18
pushc __def_const_gen_word_n12
gpm
peek 0
pop
pushcp copy
jc
peek 21
pop
__gen_for_2:
pushcp __gen_for_2_for_end
push 21
copy
gpm
swp
pop
push 19
be
gpm
jz
pop
push 21
pushc __def_const_gen_word_n13
gpm
peek 0
pop
pushcp copy
jc
push 21
copy
gpm
swp
pop
push 18
swp
sub
push 20
peekai
push 21
inc
pop
pushcp __gen_for_2
jp
__gen_for_2_for_end:
__gen_if_1_else_end:
push 20
pushc __def_const_gen_word_n14
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen__op_range_method_end:
jr
__gen__op_range_method_end_block:
pushcp __gen_gc_method_end_block
jp
gc:
gc
stkdrop
__gen_gc_method_end:
jr
__gen_gc_method_end_block:
pushcp __gen_free_method_end_block
jp
free:
push 0
peek 22
pop
__gen_while_0:
pushcp __gen_while_0_end
push 22
copy
gpm
swp
pop
pushcp __def_const_gen_word_n15
swp
bg
gpm
jz
pop
rem
push 22
dec
pop
pushcp __gen_while_0
jp
__gen_while_0_end:
__gen_free_method_end:
jr
__gen_free_method_end_block:
pushcp __gen_opx_method_end_block
jp
opx:
pushcp __def_const_gen_word_n16
push 0
copy
gpm
swp
pop
idiv
peek 23
pop
push 23
copy
gpm
swp
pop
peek 24
pop
__gen_while_1:
pushcp __gen_while_1_end
push 24
copy
gpm
swp
pop
pushcp __def_const_gen_word_n17
swp
bg
gpm
jz
pop
peek 25
pop
peek 26
pop
push 25
copy
gpm
swp
pop
push 26
swp
add
push 25
mov
push 24
dec
pop
pushcp __gen_while_1
jp
__gen_while_1_end:
__gen_opx_method_end:
jr
__gen_opx_method_end_block:
pushcp __gen__op_in_method_end_block
jp
_op_in:
peek 27
pop
peek 28
pop
pushc __def_const_gen_word_n18
gpm
peek 29
pop
push 28
pushc __def_const_gen_word_n19
gpm
peek 0
pop
pushcp len
jc
peek 30
pop
__gen_while_2:
pushcp __gen_while_2_end
push 29
copy
gpm
swp
pop
push 30
bg
gpm
jz
pop
pushcp __gen_if_2_end
push 29
push 28
pushai
copy
gpm
swp
pop
push 27
eq
gpm
jz
pop
pushc true
gpm
jr
__gen_if_2_end:
push 29
inc
pop
pushcp __gen_while_2
jp
__gen_while_2_end:
pushc false
gpm
jr
__gen__op_in_method_end:
jr
__gen__op_in_method_end_block:
pushcp __gen_ptr_method_end_block
jp
ptr:
peek 31
pop
push 31
new
gpm
peek 32
movp
push 32
jr
__gen_ptr_method_end:
jr
__gen_ptr_method_end_block:
pushcp __gen_temp_method_end_block
jp
temp:
pushc __def_const_gen_word_n20
gpm
jr
__gen_temp_method_end:
jr
__gen_temp_method_end_block:
pushcp __gen_if_method_end_block
jp
if:
peek 33
pop
peek 34
pop
peek 35
pop
pushcp __gen_if_3_end
push 33
jz
pop
push 34
jr
pushcp __gen_if_3_else_end
jp
__gen_if_3_end:
push 35
jr
__gen_if_3_else_end:
__gen_if_method_end:
jr
__gen_if_method_end_block:
pushcp __gen_geterror_method_end_block
jp
geterror:
__gen_geterror_method_end:
jr
__gen_geterror_method_end_block:
pushcp __gen___entrypoint_method_end_block
jp
__entrypoint:
peek 36
pop
push 36
pushcp __def_const_gen_word_n21
newa
peek 37
pop
pushc __def_const_gen_word_n22
gpm
peek 38
pop
__gen_while_3:
pushcp __gen_while_3_end
push 38
copy
gpm
swp
pop
push 36
bg
gpm
jz
pop
push 38
push 37
peekai
push 38
inc
pop
pushcp __gen_while_3
jp
__gen_while_3_end:
pushc __def_const_gen_word_n23
gpm
peek 0
pop
pushcp main
jc
pushc __def_const_gen_word_n24
gpm
peek 0
pop
pushcp gc
jc
__gen___entrypoint_method_end:
jr
__gen___entrypoint_method_end_block:
pushcp __gen_gpm_method_end_block
jp
gpm:
peek 39
pop
push 39
gpm
pop
__gen_gpm_method_end:
jr
__gen_gpm_method_end_block:
pushcp __gen_i2s_method_end_block
jp
i2s:
pushc __def_const_gen_word_n25
gpm
peek 0
pop
pushcp _i2s
invoke
gpm
__gen_i2s_method_end:
jr
__gen_i2s_method_end_block:
pushcp __gen_f2s_method_end_block
jp
f2s:
pushc __def_const_gen_word_n26
gpm
peek 0
pop
pushcp _f2s
invoke
gpm
__gen_f2s_method_end:
jr
__gen_f2s_method_end_block:
pushcp __gen_s2i_method_end_block
jp
s2i:
pushc __def_const_gen_word_n27
gpm
peek 0
pop
pushcp _s2i
invoke
gpm
__gen_s2i_method_end:
jr
__gen_s2i_method_end_block:
pushcp __gen_s2f_method_end_block
jp
s2f:
pushc __def_const_gen_word_n28
gpm
peek 0
pop
pushcp _s2f
invoke
gpm
__gen_s2f_method_end:
jr
__gen_s2f_method_end_block:
pushcp __gen_strupper_method_end_block
jp
strupper:
pushc __def_const_gen_word_n29
gpm
peek 0
pop
pushcp _strupper
invoke
gpm
__gen_strupper_method_end:
jr
__gen_strupper_method_end_block:
pushcp __gen_strlower_method_end_block
jp
strlower:
pushc __def_const_gen_word_n30
gpm
peek 0
pop
pushcp _strlower
invoke
gpm
__gen_strlower_method_end:
jr
__gen_strlower_method_end_block:
pushcp __gen_now_method_end_block
jp
now:
pushc __def_const_gen_word_n31
gpm
peek 0
pop
pushcp _now
invoke
gpm
__gen_now_method_end:
jr
__gen_now_method_end_block:
pushcp __gen_random_method_end_block
jp
random:
pushc __def_const_gen_word_n32
gpm
peek 0
pop
pushcp _random
invoke
gpm
__gen_random_method_end:
jr
__gen_random_method_end_block:
pushcp __gen_randomb_method_end_block
jp
randomb:
pushc __def_const_gen_word_n33
gpm
peek 0
pop
pushcp _randomb
invoke
gpm
__gen_randomb_method_end:
jr
__gen_randomb_method_end_block:
pushcp __gen_tickcnt_method_end_block
jp
tickcnt:
pushc __def_const_gen_word_n34
gpm
peek 0
pop
pushcp _tickcnt
invoke
gpm
__gen_tickcnt_method_end:
jr
__gen_tickcnt_method_end_block:
pushcp __gen_vcall_method_end_block
jp
vcall:
peek 40
pop
push 0
dec
pop
push 40
copy
gpm
swp
pop
jc
__gen_vcall_method_end:
jr
__gen_vcall_method_end_block:
pushcp __gen_print_method_end_block
jp
print:
push 0
peek 41
pop
__gen_while_4:
pushcp __gen_while_4_end
push 41
copy
gpm
swp
pop
pushcp __def_const_gen_word_n35
swp
bg
gpm
jz
pop
pushc __def_const_gen_word_n36
gpm
peek 0
pop
pushcp _print
invoke
push 41
dec
pop
pushcp __gen_while_4
jp
__gen_while_4_end:
__gen_print_method_end:
jr
__gen_print_method_end_block:
pushcp __gen_println_method_end_block
jp
println:
push 0
peek 42
pop
__gen_while_5:
pushcp __gen_while_5_end
push 42
copy
gpm
swp
pop
pushcp __def_const_gen_word_n37
swp
bg
gpm
jz
pop
pushc __def_const_gen_word_n38
gpm
peek 0
pop
pushcp _print
invoke
push 42
dec
pop
pushcp __gen_while_5
jp
__gen_while_5_end:
pushc __def_const_gen_str_n39
gpm
pushc __def_const_gen_word_n40
gpm
peek 0
pop
pushcp _println
invoke
__gen_println_method_end:
jr
__gen_println_method_end_block:
pushcp __gen_crt.keypressed_method_end_block
jp
crt.keypressed:
pushc __def_const_gen_word_n41
gpm
peek 0
pop
pushcp _crt.keypressed
invoke
pushc __def_const_gen_word_n42
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.keypressed_method_end:
jr
__gen_crt.keypressed_method_end_block:
pushcp __gen_crt.readkey_method_end_block
jp
crt.readkey:
pushc __def_const_gen_word_n43
gpm
peek 0
pop
pushcp _crt.readkey
invoke
pushc __def_const_gen_word_n44
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.readkey_method_end:
jr
__gen_crt.readkey_method_end_block:
pushcp __gen_crt.wherex32_method_end_block
jp
crt.wherex32:
pushc __def_const_gen_word_n45
gpm
peek 0
pop
pushcp _crt.wherex32
invoke
pushc __def_const_gen_word_n46
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.wherex32_method_end:
jr
__gen_crt.wherex32_method_end_block:
pushcp __gen_crt.wherey32_method_end_block
jp
crt.wherey32:
pushc __def_const_gen_word_n47
gpm
peek 0
pop
pushcp _crt.wherey32
invoke
pushc __def_const_gen_word_n48
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.wherey32_method_end:
jr
__gen_crt.wherey32_method_end_block:
pushcp __gen_crt.getdirectvideo_method_end_block
jp
crt.getdirectvideo:
pushc __def_const_gen_word_n49
gpm
peek 0
pop
pushcp _crt.getdirectvideo
invoke
pushc __def_const_gen_word_n50
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.getdirectvideo_method_end:
jr
__gen_crt.getdirectvideo_method_end_block:
pushcp __gen_crt.getlastmode_method_end_block
jp
crt.getlastmode:
pushc __def_const_gen_word_n51
gpm
peek 0
pop
pushcp _crt.getlastmode
invoke
pushc __def_const_gen_word_n52
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.getlastmode_method_end:
jr
__gen_crt.getlastmode_method_end_block:
pushcp __gen_crt.gettextattr_method_end_block
jp
crt.gettextattr:
pushc __def_const_gen_word_n53
gpm
peek 0
pop
pushcp _crt.gettextattr
invoke
pushc __def_const_gen_word_n54
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.gettextattr_method_end:
jr
__gen_crt.gettextattr_method_end_block:
pushcp __gen_crt.getwindmax_method_end_block
jp
crt.getwindmax:
pushc __def_const_gen_word_n55
gpm
peek 0
pop
pushcp _crt.getwindmax
invoke
pushc __def_const_gen_word_n56
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.getwindmax_method_end:
jr
__gen_crt.getwindmax_method_end_block:
pushcp __gen_crt.getwindmaxx_method_end_block
jp
crt.getwindmaxx:
pushc __def_const_gen_word_n57
gpm
peek 0
pop
pushcp _crt.getwindmaxx
invoke
pushc __def_const_gen_word_n58
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.getwindmaxx_method_end:
jr
__gen_crt.getwindmaxx_method_end_block:
pushcp __gen_crt.getwindmaxy_method_end_block
jp
crt.getwindmaxy:
pushc __def_const_gen_word_n59
gpm
peek 0
pop
pushcp _crt.getwindmaxy
invoke
pushc __def_const_gen_word_n60
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.getwindmaxy_method_end:
jr
__gen_crt.getwindmaxy_method_end_block:
pushcp __gen_crt.getwindmin_method_end_block
jp
crt.getwindmin:
pushc __def_const_gen_word_n61
gpm
peek 0
pop
pushcp _crt.getwindmin
invoke
pushc __def_const_gen_word_n62
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.getwindmin_method_end:
jr
__gen_crt.getwindmin_method_end_block:
pushcp __gen_crt.getwindminx_method_end_block
jp
crt.getwindminx:
pushc __def_const_gen_word_n63
gpm
peek 0
pop
pushcp _crt.getwindminx
invoke
pushc __def_const_gen_word_n64
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.getwindminx_method_end:
jr
__gen_crt.getwindminx_method_end_block:
pushcp __gen_crt.getwindminy_method_end_block
jp
crt.getwindminy:
pushc __def_const_gen_word_n65
gpm
peek 0
pop
pushcp _crt.getwindminy
invoke
pushc __def_const_gen_word_n66
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.getwindminy_method_end:
jr
__gen_crt.getwindminy_method_end_block:
pushcp __gen_crt.getcheckbreak_method_end_block
jp
crt.getcheckbreak:
pushc __def_const_gen_word_n67
gpm
peek 0
pop
pushcp _crt.getcheckbreak
invoke
pushc __def_const_gen_word_n68
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.getcheckbreak_method_end:
jr
__gen_crt.getcheckbreak_method_end_block:
pushcp __gen_crt.getcheckeof_method_end_block
jp
crt.getcheckeof:
pushc __def_const_gen_word_n69
gpm
peek 0
pop
pushcp _crt.getcheckeof
invoke
pushc __def_const_gen_word_n70
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.getcheckeof_method_end:
jr
__gen_crt.getcheckeof_method_end_block:
pushcp __gen_crt.getchecksnow_method_end_block
jp
crt.getchecksnow:
pushc __def_const_gen_word_n71
gpm
peek 0
pop
pushcp _crt.getchecksnow
invoke
pushc __def_const_gen_word_n72
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_crt.getchecksnow_method_end:
jr
__gen_crt.getchecksnow_method_end_block:
pushcp __gen_input_method_end_block
jp
input:
pushc __def_const_gen_word_n73
gpm
peek 0
pop
pushcp _input
invoke
pushc __def_const_gen_word_n74
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_input_method_end:
jr
__gen_input_method_end_block:
pushcp __gen_inputln_method_end_block
jp
inputln:
pushc __def_const_gen_word_n75
gpm
peek 0
pop
pushcp _inputln
invoke
pushc __def_const_gen_word_n76
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_inputln_method_end:
jr
__gen_inputln_method_end_block:
pushcp __gen_crt.normvideo_method_end_block
jp
crt.normvideo:
pushc __def_const_gen_word_n77
gpm
pushc __def_const_gen_word_n78
gpm
peek 0
pop
pushcp crt.textcolor
invoke
pushc __def_const_gen_word_n79
gpm
pushc __def_const_gen_word_n80
gpm
peek 0
pop
pushcp crt.textbackground
invoke
__gen_crt.normvideo_method_end:
jr
__gen_crt.normvideo_method_end_block:
pushcp __gen_crt.wherex_method_end_block
jp
crt.wherex:
pushcp __def_const_gen_word_n81
pushc __def_const_gen_word_n82
gpm
peek 0
pop
pushcp crt.wherex32
jc
mod
peek 43
pop
push 43
copy
gpm
swp
pop
jr
__gen_crt.wherex_method_end:
jr
__gen_crt.wherex_method_end_block:
pushcp __gen_crt.wherey_method_end_block
jp
crt.wherey:
pushcp __def_const_gen_word_n83
pushc __def_const_gen_word_n84
gpm
peek 0
pop
pushcp crt.wherey32
jc
mod
peek 44
pop
push 44
copy
gpm
swp
pop
jr
__gen_crt.wherey_method_end:
jr
__gen_crt.wherey_method_end_block:
pushcp __gen_crt.pause_method_end_block
jp
crt.pause:
pushc __def_const_gen_word_n85
gpm
peek 0
pop
pushcp crt.readkey
jc
__gen_crt.pause_method_end:
jr
__gen_crt.pause_method_end_block:
pushcp __gen_crt.gotoxy_method_end_block
jp
crt.gotoxy:
peek 45
pop
peek 46
pop
push 45
push 46
pushc __def_const_gen_word_n86
gpm
peek 0
pop
pushcp _crt.gotoxy32
invoke
__gen_crt.gotoxy_method_end:
jr
__gen_crt.gotoxy_method_end_block:
pushcp __gen_reversearray_method_end_block
jp
reversearray:
peek 47
pop
push 47
pushc __def_const_gen_word_n87
gpm
peek 0
pop
pushcp len
jc
peek 48
pop
pushc __def_const_gen_word_n88
gpm
peek 49
pop
__gen_for_3:
pushcp __gen_for_3_for_end
pushcp __def_const_gen_word_n89
pushc len
gpm
idiv
peek 50
pop
push 49
copy
gpm
swp
pop
push 50
bg
gpm
jz
pop
push 48
copy
gpm
swp
pop
push 49
swp
sub
pushcp __def_const_gen_word_n90
swp
sub
push 47
pushai
peek 51
pop
push 49
push 47
pushai
push 48
copy
gpm
swp
pop
push 49
swp
sub
pushcp __def_const_gen_word_n91
swp
sub
push 47
peekai
push 51
push 49
push 47
peekai
push 49
inc
pop
pushcp __gen_for_3
jp
__gen_for_3_for_end:
__gen_reversearray_method_end:
jr
__gen_reversearray_method_end_block:
pushcp __gen_getmax_method_end_block
jp
getmax:
peek 52
pop
peek 53
pop
pushcp __def_const_gen_word_n92
push 52
pushai
peek 54
pop
pushc __def_const_gen_word_n93
gpm
peek 55
pop
__gen_for_4:
pushcp __gen_for_4_for_end
push 55
copy
gpm
swp
pop
push 53
bg
gpm
jz
pop
pushcp __gen_if_4_end
push 55
push 52
pushai
copy
gpm
swp
pop
push 54
swp
bg
gpm
jz
pop
push 55
push 52
pushai
push 54
mov
__gen_if_4_end:
push 55
inc
pop
pushcp __gen_for_4
jp
__gen_for_4_for_end:
push 54
jr
__gen_getmax_method_end:
jr
__gen_getmax_method_end_block:
pushcp __gen_fromtoqsort_method_end_block
jp
fromtoqsort:
peek 56
pop
peek 57
pop
peek 58
pop
push 57
peek 59
pop
push 58
peek 60
pop
push 57
copy
gpm
swp
pop
push 58
swp
add
peek 61
pop
pushcp __def_const_gen_word_n94
push 61
copy
gpm
swp
pop
idiv
peek 62
pop
push 62
copy
gpm
swp
pop
push 56
pushai
peek 63
pop
__gen_while_6:
pushcp __gen_while_6_end
push 60
copy
gpm
swp
pop
pushcp __def_const_gen_word_n95
swp
add
peek 61
pop
push 60
copy
gpm
swp
pop
pushcp __def_const_gen_word_n96
swp
add
peek 62
pop
push 59
copy
gpm
swp
pop
push 61
bg
gpm
jz
pop
__gen_while_7:
pushcp __gen_while_7_end
push 59
push 56
pushai
copy
gpm
swp
pop
push 63
bg
gpm
jz
pop
push 59
inc
pop
pushcp __gen_while_7
jp
__gen_while_7_end:
__gen_while_8:
pushcp __gen_while_8_end
push 60
push 56
pushai
copy
gpm
swp
pop
push 63
swp
bg
gpm
jz
pop
push 60
dec
pop
pushcp __gen_while_8
jp
__gen_while_8_end:
pushcp __gen_if_5_end
push 60
copy
gpm
swp
pop
pushcp __def_const_gen_word_n97
swp
add
peek 61
pop
push 60
copy
gpm
swp
pop
pushcp __def_const_gen_word_n98
swp
add
peek 62
pop
push 59
copy
gpm
swp
pop
push 61
bg
gpm
jz
pop
push 59
push 56
pushai
peek 64
pop
push 60
push 56
pushai
push 59
push 56
peekai
push 64
push 60
push 56
peekai
push 59
inc
pop
push 60
dec
pop
__gen_if_5_end:
pushcp __gen_while_6
jp
__gen_while_6_end:
pushcp __gen_if_6_end
push 57
copy
gpm
swp
pop
push 60
bg
gpm
jz
pop
push 60
push 57
push 56
pushc __def_const_gen_word_n99
gpm
peek 0
pop
pushcp fromtoqsort
jc
__gen_if_6_end:
pushcp __gen_if_7_end
push 59
copy
gpm
swp
pop
push 58
bg
gpm
jz
pop
push 58
push 59
push 56
pushc __def_const_gen_word_n100
gpm
peek 0
pop
pushcp fromtoqsort
jc
__gen_if_7_end:
__gen_fromtoqsort_method_end:
jr
__gen_fromtoqsort_method_end_block:
pushcp __gen_quicksort_method_end_block
jp
quicksort:
peek 65
pop
push 65
pushc __def_const_gen_word_n101
gpm
peek 0
pop
pushcp len
jc
pushcp __def_const_gen_word_n102
swp
sub
pushc __def_const_gen_word_n103
gpm
push 65
pushc __def_const_gen_word_n104
gpm
peek 0
pop
pushcp fromtoqsort
jc
__gen_quicksort_method_end:
jr
__gen_quicksort_method_end_block:
pushcp __gen_fromtothrqsort_method_end_block
jp
fromtothrqsort:
peek 66
pop
peek 67
pop
peek 68
pop
peek 69
pop
peek 70
pop
push 67
peek 71
pop
push 68
peek 72
pop
push 67
copy
gpm
swp
pop
push 68
swp
add
peek 73
pop
pushcp __def_const_gen_word_n105
push 73
copy
gpm
swp
pop
idiv
peek 74
pop
push 74
copy
gpm
swp
pop
push 66
pushai
peek 75
pop
__gen_while_9:
pushcp __gen_while_9_end
push 72
copy
gpm
swp
pop
pushcp __def_const_gen_word_n106
swp
add
peek 73
pop
push 72
copy
gpm
swp
pop
pushcp __def_const_gen_word_n107
swp
add
peek 74
pop
push 71
copy
gpm
swp
pop
push 73
bg
gpm
jz
pop
__gen_while_10:
pushcp __gen_while_10_end
push 71
push 66
pushai
copy
gpm
swp
pop
push 75
bg
gpm
jz
pop
push 71
inc
pop
pushcp __gen_while_10
jp
__gen_while_10_end:
__gen_while_11:
pushcp __gen_while_11_end
push 72
push 66
pushai
copy
gpm
swp
pop
push 75
swp
bg
gpm
jz
pop
push 72
dec
pop
pushcp __gen_while_11
jp
__gen_while_11_end:
pushcp __gen_if_8_end
push 72
copy
gpm
swp
pop
pushcp __def_const_gen_word_n108
swp
add
peek 73
pop
push 72
copy
gpm
swp
pop
pushcp __def_const_gen_word_n109
swp
add
peek 74
pop
push 71
copy
gpm
swp
pop
push 73
bg
gpm
jz
pop
push 71
push 66
pushai
peek 76
pop
push 72
push 66
pushai
push 71
push 66
peekai
push 76
push 72
push 66
peekai
push 71
inc
pop
push 72
dec
pop
__gen_if_8_end:
pushcp __gen_while_9
jp
__gen_while_9_end:
pushcp __gen_if_9_end
push 69
copy
gpm
swp
pop
push 70
bg
gpm
jz
pop
push 66
copy
peek 66
pop
push 67
copy
peek 67
pop
push 68
copy
peek 68
pop
push 69
copy
peek 69
pop
push 70
copy
peek 70
pop
push 71
copy
peek 71
pop
push 72
copy
peek 72
pop
push 73
copy
peek 73
pop
push 74
copy
peek 74
pop
push 75
copy
peek 75
pop
push 76
copy
peek 76
pop
pushc __def_const_gen_word_n110
gpm
peek 77
pushcp __gen_async_0_entry
cthr
rthr
peek 76
pop
peek 75
pop
peek 74
pop
peek 73
pop
peek 72
pop
peek 71
pop
peek 70
pop
peek 69
pop
peek 68
pop
peek 67
pop
peek 66
pop
pushcp __gen_async_0_end
jp
__gen_async_0_entry:
pop
push 66
gpm
pop 
push 67
gpm
pop 
push 68
gpm
pop 
push 69
gpm
pop 
push 70
gpm
pop 
push 71
gpm
pop 
push 72
gpm
pop 
push 73
gpm
pop 
push 74
gpm
pop 
push 75
gpm
pop 
push 76
gpm
pop 
pushcp __gen_if_10_end
push 67
copy
gpm
swp
pop
push 72
bg
gpm
jz
pop
push 70
push 69
copy
gpm
swp
pop
pushcp __def_const_gen_word_n112
swp
add
push 72
pushc __def_const_gen_word_n113
gpm
peek 0
pop
pushcp copy
jc
push 67
pushc __def_const_gen_word_n114
gpm
peek 0
pop
pushcp copy
jc
push 66
pushc __def_const_gen_word_n115
gpm
peek 0
pop
pushcp fromtothrqsort
jc
__gen_if_10_end:
__gen_async_0_exit:
pushc __def_const_gen_word_n111
gpm
push 77
mov
threxit
__gen_async_0_end:
push 66
copy
peek 66
pop
push 67
copy
peek 67
pop
push 68
copy
peek 68
pop
push 69
copy
peek 69
pop
push 70
copy
peek 70
pop
push 71
copy
peek 71
pop
push 72
copy
peek 72
pop
push 73
copy
peek 73
pop
push 74
copy
peek 74
pop
push 75
copy
peek 75
pop
push 76
copy
peek 76
pop
push 77
copy
peek 77
pop
pushc __def_const_gen_word_n116
gpm
peek 78
pushcp __gen_async_1_entry
cthr
rthr
peek 77
pop
peek 76
pop
peek 75
pop
peek 74
pop
peek 73
pop
peek 72
pop
peek 71
pop
peek 70
pop
peek 69
pop
peek 68
pop
peek 67
pop
peek 66
pop
pushcp __gen_async_1_end
jp
__gen_async_1_entry:
pop
push 66
gpm
pop 
push 67
gpm
pop 
push 68
gpm
pop 
push 69
gpm
pop 
push 70
gpm
pop 
push 71
gpm
pop 
push 72
gpm
pop 
push 73
gpm
pop 
push 74
gpm
pop 
push 75
gpm
pop 
push 76
gpm
pop 
push 77
gpm
pop 
pushcp __gen_if_11_end
push 71
copy
gpm
swp
pop
push 68
bg
gpm
jz
pop
push 70
push 69
copy
gpm
swp
pop
pushcp __def_const_gen_word_n118
swp
add
push 68
pushc __def_const_gen_word_n119
gpm
peek 0
pop
pushcp copy
jc
push 71
pushc __def_const_gen_word_n120
gpm
peek 0
pop
pushcp copy
jc
push 66
pushc __def_const_gen_word_n121
gpm
peek 0
pop
pushcp fromtothrqsort
jc
__gen_if_11_end:
__gen_async_1_exit:
pushc __def_const_gen_word_n117
gpm
push 78
mov
threxit
__gen_async_1_end:
__async_await_loop_for_flag_thrl:
pushcp __def_const_gen_word_n122
pushcp sleep
invoke
pushcp __async_await_loop_for_flag_thrl
push 77
jn
pop
__async_await_loop_for_flag_thrr:
pushcp __def_const_gen_word_n123
pushcp sleep
invoke
pushcp __async_await_loop_for_flag_thrr
push 78
jn
pop
pushcp __gen_if_9_else_end
jp
__gen_if_9_end:
pushcp __gen_if_12_end
push 67
copy
gpm
swp
pop
push 72
bg
gpm
jz
pop
push 70
push 69
push 72
push 67
push 66
pushc __def_const_gen_word_n124
gpm
peek 0
pop
pushcp fromtothrqsort
jc
__gen_if_12_end:
pushcp __gen_if_13_end
push 71
copy
gpm
swp
pop
push 68
bg
gpm
jz
pop
push 70
push 69
push 68
push 71
push 66
pushc __def_const_gen_word_n125
gpm
peek 0
pop
pushcp fromtothrqsort
jc
__gen_if_13_end:
__gen_if_9_else_end:
__gen_fromtothrqsort_method_end:
jr
__gen_fromtothrqsort_method_end_block:
pushcp __gen_thrquicksort_method_end_block
jp
thrquicksort:
peek 79
pop
peek 80
pop
pushcp __def_const_gen_word_n126
push 80
copy
gpm
swp
pop
idiv
peek 81
pop
push 81
copy
gpm
swp
pop
pushc __def_const_gen_word_n127
gpm
push 79
pushc __def_const_gen_word_n128
gpm
peek 0
pop
pushcp len
jc
pushcp __def_const_gen_word_n129
swp
sub
pushc __def_const_gen_word_n130
gpm
push 79
pushc __def_const_gen_word_n131
gpm
peek 0
pop
pushcp fromtothrqsort
jc
__gen_thrquicksort_method_end:
jr
__gen_thrquicksort_method_end_block:
pushcp __gen_heapsortto_method_end_block
jp
heapsortto:
peek 82
pop
peek 83
pop
pushcp __def_const_gen_word_n132
push 83
copy
gpm
swp
pop
div
peek 84
pop
push 84
copy
gpm
swp
pop
peek 85
pop
__gen_while_12:
pushcp __gen_while_12_end
pushc true
gpm
jz
pop
pushcp __gen_if_14_end
push 85
copy
gpm
swp
pop
pushcp __def_const_gen_word_n133
swp
bg
gpm
jz
pop
push 85
dec
pop
push 85
push 82
pushai
peek 86
pop
pushcp __gen_if_14_else_end
jp
__gen_if_14_end:
push 83
dec
pop
pushcp __gen_if_15_end
push 83
copy
gpm
swp
pop
pushcp __def_const_gen_word_n134
eq
gpm
jz
pop
jr
__gen_if_15_end:
push 83
push 82
pushai
peek 86
pop
pushcp __def_const_gen_word_n135
push 82
pushai
push 83
push 82
peekai
__gen_if_14_else_end:
push 85
peek 87
pop
pushcp __def_const_gen_word_n136
push 85
copy
gpm
swp
pop
mul
peek 84
pop
push 84
copy
gpm
swp
pop
pushcp __def_const_gen_word_n137
swp
add
peek 88
pop
__gen_while_13:
pushcp __gen_while_13_end
push 88
copy
gpm
swp
pop
push 83
bg
gpm
jz
pop
pushcp __gen_if_16_end
push 88
copy
gpm
swp
pop
pushcp __def_const_gen_word_n138
swp
add
push 83
bg
gpm
peek 84
pop
push 88
copy
gpm
swp
pop
pushcp __def_const_gen_word_n139
swp
add
push 82
pushai
copy
gpm
swp
pop
push 88
push 82
pushai
swp
bg
gpm
peek 89
pop
push 84
copy
gpm
swp
pop
push 89
swp
and
jz
pop
push 88
inc
pop
__gen_if_16_end:
pushcp __gen_if_17_end
push 88
push 82
pushai
copy
gpm
swp
pop
push 86
swp
bg
gpm
jz
pop
push 88
push 82
pushai
push 87
push 82
peekai
push 88
peek 87
pop
pushcp __def_const_gen_word_n140
push 87
copy
gpm
swp
pop
mul
peek 84
pop
push 84
copy
gpm
swp
pop
pushcp __def_const_gen_word_n141
swp
add
peek 88
pop
pushcp __gen_if_17_else_end
jp
__gen_if_17_end:
pushcp __gen_while_13_end
jp
__gen_if_17_else_end:
pushcp __gen_while_13
jp
__gen_while_13_end:
push 86
push 87
push 82
peekai
pushcp __gen_while_12
jp
__gen_while_12_end:
__gen_heapsortto_method_end:
jr
__gen_heapsortto_method_end_block:
pushcp __gen_heapsort_method_end_block
jp
heapsort:
peek 90
pop
push 90
pushc __def_const_gen_word_n142
gpm
peek 0
pop
pushcp len
jc
pushcp __def_const_gen_word_n143
swp
sub
push 90
pushc __def_const_gen_word_n144
gpm
peek 0
pop
pushcp heapsortto
jc
push 90
pushc __def_const_gen_word_n145
gpm
peek 0
pop
pushcp len
jc
pushcp __def_const_gen_word_n146
swp
sub
peek 91
pop
push 91
push 90
pushai
peek 92
pop
push 91
peek 93
pop
__gen_for_5:
pushcp __gen_for_5_for_end
push 93
copy
gpm
swp
pop
pushcp __def_const_gen_word_n147
swp
bg
gpm
jz
pop
push 93
copy
gpm
swp
pop
pushcp __def_const_gen_word_n148
swp
sub
push 90
pushai
push 93
push 90
peekai
push 93
dec
pop
pushcp __gen_for_5
jp
__gen_for_5_for_end:
push 92
pushcp __def_const_gen_word_n149
push 90
peekai
__gen_heapsort_method_end:
jr
__gen_heapsort_method_end_block:
pushcp __gen_countsort_method_end_block
jp
countsort:
peek 94
pop
peek 95
pop
peek 96
pop
push 95
pushcp __def_const_gen_word_n150
newa
peek 97
pop
pushcp __def_const_gen_word_n151
pushcp __def_const_gen_word_n152
newa
peek 98
pop
pushc __def_const_gen_word_n153
gpm
peek 99
pop
__gen_for_6:
pushcp __gen_for_6_for_end
push 99
copy
gpm
swp
pop
pushcp __def_const_gen_word_n154
bg
gpm
jz
pop
pushc __def_const_gen_word_n155
gpm
push 99
push 98
peekai
push 99
inc
pop
pushcp __gen_for_6
jp
__gen_for_6_for_end:
pushc __def_const_gen_word_n156
gpm
push 99
mov
__gen_for_7:
pushcp __gen_for_7_for_end
push 99
copy
gpm
swp
pop
push 95
bg
gpm
jz
pop
push 96
push 99
push 94
pushai
copy
gpm
swp
pop
idiv
peek 100
pop
push 100
copy
gpm
swp
pop
peek 100
pop
pushcp __def_const_gen_word_n157
push 100
copy
gpm
swp
pop
mod
peek 101
pop
push 101
copy
gpm
swp
pop
push 98
pushai
inc
pop
push 99
inc
pop
pushcp __gen_for_7
jp
__gen_for_7_for_end:
pushc __def_const_gen_word_n158
gpm
peek 99
pop
__gen_for_8:
pushcp __gen_for_8_for_end
push 99
copy
gpm
swp
pop
pushcp __def_const_gen_word_n159
bg
gpm
jz
pop
push 99
copy
gpm
swp
pop
pushcp __def_const_gen_word_n160
swp
sub
push 98
pushai
push 99
push 98
pushai
add
pop
push 99
inc
pop
pushcp __gen_for_8
jp
__gen_for_8_for_end:
push 95
copy
gpm
swp
pop
pushcp __def_const_gen_word_n161
swp
sub
peek 99
pop
__gen_for_9:
pushcp __gen_for_9_for_end
push 99
copy
gpm
swp
pop
pushcp __def_const_gen_word_n162
swp
be
gpm
jz
pop
push 99
push 94
pushai
push 96
push 99
push 94
pushai
copy
gpm
swp
pop
idiv
peek 100
pop
push 100
copy
gpm
swp
pop
peek 100
pop
pushcp __def_const_gen_word_n163
push 100
copy
gpm
swp
pop
mod
peek 101
pop
push 101
copy
gpm
swp
pop
push 98
pushai
copy
gpm
swp
pop
pushcp __def_const_gen_word_n164
swp
sub
push 97
peekai
push 96
push 99
push 94
pushai
copy
gpm
swp
pop
idiv
peek 100
pop
push 100
copy
gpm
swp
pop
peek 100
pop
pushcp __def_const_gen_word_n165
push 100
copy
gpm
swp
pop
mod
peek 101
pop
push 101
copy
gpm
swp
pop
push 98
pushai
dec
pop
push 99
dec
pop
pushcp __gen_for_9
jp
__gen_for_9_for_end:
pushc __def_const_gen_word_n166
gpm
peek 99
pop
__gen_for_10:
pushcp __gen_for_10_for_end
push 99
copy
gpm
swp
pop
push 95
bg
gpm
jz
pop
push 99
push 97
pushai
push 99
push 94
peekai
push 99
inc
pop
pushcp __gen_for_10
jp
__gen_for_10_for_end:
push 98
push 97
pushc __def_const_gen_word_n167
gpm
peek 0
pop
pushcp free
jc
__gen_countsort_method_end:
jr
__gen_countsort_method_end_block:
pushcp __gen_radixsort_method_end_block
jp
radixsort:
peek 102
pop
push 102
pushc __def_const_gen_word_n168
gpm
peek 0
pop
pushcp len
jc
peek 103
pop
push 103
push 102
pushc __def_const_gen_word_n169
gpm
peek 0
pop
pushcp getmax
jc
peek 104
pop
pushc __def_const_gen_word_n170
gpm
peek 105
pop
__gen_for_11:
pushcp __gen_for_11_for_end
push 105
push 104
copy
gpm
swp
pop
idiv
peek 106
pop
push 106
copy
gpm
swp
pop
pushcp __def_const_gen_word_n171
swp
bg
gpm
jz
pop
push 105
push 103
push 102
pushc __def_const_gen_word_n173
gpm
peek 0
pop
pushcp countsort
jc
pushc __def_const_gen_word_n172
gpm
push 105
mul
pop
pushcp __gen_for_11
jp
__gen_for_11_for_end:
__gen_radixsort_method_end:
jr
__gen_radixsort_method_end_block:
pushcp __gen_fromtobinsearch_method_end_block
jp
fromtobinsearch:
peek 107
pop
peek 108
pop
peek 109
pop
peek 110
pop
__gen_while_14:
pushcp __gen_while_14_end
pushc true
gpm
jz
pop
push 108
copy
gpm
swp
pop
push 109
swp
add
peek 111
pop
pushcp __def_const_gen_word_n174
push 111
copy
gpm
swp
pop
idiv
peek 112
pop
push 112
copy
gpm
swp
pop
peek 113
pop
pushcp __gen_if_18_end
push 110
copy
gpm
swp
pop
push 113
push 107
pushai
bg
gpm
jz
pop
push 113
copy
gpm
swp
pop
pushcp __def_const_gen_word_n175
swp
sub
peek 109
pop
pushcp __gen_if_18_else_end
jp
__gen_if_18_end:
pushcp __gen_if_19_end
push 110
copy
gpm
swp
pop
push 113
push 107
pushai
swp
bg
gpm
jz
pop
push 113
copy
gpm
swp
pop
pushcp __def_const_gen_word_n176
swp
add
peek 108
pop
pushcp __gen_if_19_else_end
jp
__gen_if_19_end:
push 113
jr
__gen_if_19_else_end:
__gen_if_18_else_end:
pushcp __gen_if_20_end
push 108
copy
gpm
swp
pop
push 109
swp
bg
gpm
jz
pop
pushc __def_const_gen_word_n177
gpm
pushcp __def_const_gen_word_n178
swp
sub
jr
__gen_if_20_end:
pushcp __gen_while_14
jp
__gen_while_14_end:
__gen_fromtobinsearch_method_end:
jr
__gen_fromtobinsearch_method_end_block:
pushcp __gen_binsearch_method_end_block
jp
binsearch:
peek 114
pop
peek 115
pop
push 114
pushc __def_const_gen_word_n179
gpm
peek 0
pop
pushcp len
jc
peek 116
pop
pushcp __gen_if_21_end
push 116
copy
gpm
swp
pop
pushcp __def_const_gen_word_n180
swp
bg
gpm
jz
pop
push 115
push 116
copy
gpm
swp
pop
pushcp __def_const_gen_word_n181
swp
sub
pushc __def_const_gen_word_n182
gpm
push 114
pushc __def_const_gen_word_n183
gpm
peek 0
pop
pushcp fromtobinsearch
jc
jr
pushcp __gen_if_21_else_end
jp
__gen_if_21_end:
pushc __def_const_gen_word_n184
gpm
pushcp __def_const_gen_word_n185
swp
sub
jr
__gen_if_21_else_end:
__gen_binsearch_method_end:
jr
__gen_binsearch_method_end_block:
pushcp __gen_fromtobinnext_method_end_block
jp
fromtobinnext:
peek 117
pop
peek 118
pop
peek 119
pop
peek 120
pop
__gen_while_15:
pushcp __gen_while_15_end
pushc true
gpm
jz
pop
push 118
copy
gpm
swp
pop
push 119
swp
add
peek 121
pop
pushcp __def_const_gen_word_n186
push 121
copy
gpm
swp
pop
idiv
peek 122
pop
push 122
copy
gpm
swp
pop
peek 123
pop
pushcp __gen_if_22_end
push 120
copy
gpm
swp
pop
push 123
push 117
pushai
bg
gpm
jz
pop
push 123
copy
gpm
swp
pop
pushcp __def_const_gen_word_n187
swp
sub
peek 119
pop
pushcp __gen_if_22_else_end
jp
__gen_if_22_end:
pushcp __gen_if_23_end
push 120
copy
gpm
swp
pop
push 123
push 117
pushai
swp
bg
gpm
jz
pop
push 123
copy
gpm
swp
pop
pushcp __def_const_gen_word_n188
swp
add
peek 118
pop
pushcp __gen_if_23_else_end
jp
__gen_if_23_end:
push 123
jr
__gen_if_23_else_end:
__gen_if_22_else_end:
pushcp __gen_if_24_end
push 118
copy
gpm
swp
pop
push 119
swp
bg
gpm
jz
pop
push 123
jr
__gen_if_24_end:
pushcp __gen_while_15
jp
__gen_while_15_end:
__gen_fromtobinnext_method_end:
jr
__gen_fromtobinnext_method_end_block:
pushcp __gen_binnext_method_end_block
jp
binnext:
peek 124
pop
peek 125
pop
push 124
pushc __def_const_gen_word_n189
gpm
peek 0
pop
pushcp len
jc
peek 126
pop
pushcp __gen_if_25_end
push 126
copy
gpm
swp
pop
pushcp __def_const_gen_word_n190
swp
bg
gpm
jz
pop
push 125
push 126
copy
gpm
swp
pop
pushcp __def_const_gen_word_n191
swp
sub
pushc __def_const_gen_word_n192
gpm
push 124
pushc __def_const_gen_word_n193
gpm
peek 0
pop
pushcp fromtobinnext
jc
peek 127
pop
pushcp __gen_if_26_end
push 127
push 124
pushai
copy
gpm
swp
pop
push 125
swp
bg
gpm
jz
pop
push 127
jr
pushcp __gen_if_26_else_end
jp
__gen_if_26_end:
push 127
copy
gpm
swp
pop
pushcp __def_const_gen_word_n194
swp
add
jr
__gen_if_26_else_end:
pushcp __gen_if_25_else_end
jp
__gen_if_25_end:
pushc __def_const_gen_word_n195
gpm
jr
__gen_if_25_else_end:
__gen_binnext_method_end:
jr
__gen_binnext_method_end_block:
pushcp __gen_fromtointerpolarsearch_method_end_block
jp
fromtointerpolarsearch:
peek 128
pop
peek 129
pop
peek 130
pop
peek 131
pop
pushc __def_const_gen_word_n196
gpm
peek 132
pop
pushc false
gpm
peek 133
pop
__gen_while_16:
pushcp __gen_while_16_end
push 129
push 128
pushai
copy
gpm
swp
pop
push 131
bg
gpm
peek 134
pop
push 130
push 128
pushai
copy
gpm
swp
pop
push 131
swp
bg
gpm
peek 135
pop
push 133
copy
gpm
swp
pop
not
peek 136
pop
push 133
copy
gpm
swp
pop
not
peek 137
pop
push 134
copy
gpm
swp
pop
push 135
swp
and
push 136
swp
and
jz
pop
push 131
copy
gpm
swp
pop
push 129
push 128
pushai
swp
sub
peek 134
pop
push 130
copy
gpm
swp
pop
push 129
swp
sub
peek 135
pop
push 135
push 134
copy
gpm
swp
pop
mul
peek 136
pop
push 136
copy
gpm
swp
pop
peek 134
pop
push 130
push 128
pushai
copy
gpm
swp
pop
push 129
push 128
pushai
swp
sub
peek 135
pop
push 135
push 134
copy
gpm
swp
pop
div
peek 136
pop
push 129
copy
gpm
swp
pop
push 136
swp
add
push 132
mov
pushcp __gen_if_27_end
push 132
push 128
pushai
copy
gpm
swp
pop
push 131
bg
gpm
jz
pop
push 132
copy
gpm
swp
pop
pushcp __def_const_gen_word_n197
swp
add
push 129
mov
pushcp __gen_if_27_else_end
jp
__gen_if_27_end:
pushcp __gen_if_28_end
push 132
push 128
pushai
copy
gpm
swp
pop
push 131
swp
bg
gpm
jz
pop
push 132
copy
gpm
swp
pop
pushcp __def_const_gen_word_n198
swp
sub
push 130
mov
pushcp __gen_if_28_else_end
jp
__gen_if_28_end:
pushc true
gpm
push 133
mov
__gen_if_28_else_end:
__gen_if_27_else_end:
pushcp __gen_while_16
jp
__gen_while_16_end:
pushcp __gen_if_29_end
push 133
jz
pop
push 132
jr
pushcp __gen_if_29_else_end
jp
__gen_if_29_end:
pushc __def_const_gen_word_n199
gpm
pushcp __def_const_gen_word_n200
swp
sub
jr
__gen_if_29_else_end:
__gen_fromtointerpolarsearch_method_end:
jr
__gen_fromtointerpolarsearch_method_end_block:
pushcp __gen_interpolarsearch_method_end_block
jp
interpolarsearch:
peek 138
pop
peek 139
pop
push 138
pushc __def_const_gen_word_n201
gpm
peek 0
pop
pushcp len
jc
peek 140
pop
pushcp __gen_if_30_end
push 140
copy
gpm
swp
pop
pushcp __def_const_gen_word_n202
swp
bg
gpm
jz
pop
push 139
push 140
copy
gpm
swp
pop
pushcp __def_const_gen_word_n203
swp
sub
pushc __def_const_gen_word_n204
gpm
push 138
pushc __def_const_gen_word_n205
gpm
peek 0
pop
pushcp fromtointerpolarsearch
jc
jr
pushcp __gen_if_30_else_end
jp
__gen_if_30_end:
pushc __def_const_gen_word_n206
gpm
pushcp __def_const_gen_word_n207
swp
sub
jr
__gen_if_30_else_end:
__gen_interpolarsearch_method_end:
jr
__gen_interpolarsearch_method_end_block:
pushcp __gen_sin_method_end_block
jp
sin:
peek 141
pop
push 141
pushc __def_const_gen_word_n208
gpm
peek 0
pop
pushcp _sin
invoke
pushc __def_const_gen_word_n209
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_sin_method_end:
jr
__gen_sin_method_end_block:
pushcp __gen_cos_method_end_block
jp
cos:
peek 142
pop
push 142
pushc __def_const_gen_word_n210
gpm
peek 0
pop
pushcp _cos
invoke
pushc __def_const_gen_word_n211
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_cos_method_end:
jr
__gen_cos_method_end_block:
pushcp __gen_tg_method_end_block
jp
tg:
peek 143
pop
push 143
pushc __def_const_gen_word_n212
gpm
peek 0
pop
pushcp _tg
invoke
pushc __def_const_gen_word_n213
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_tg_method_end:
jr
__gen_tg_method_end_block:
pushcp __gen_ctg_method_end_block
jp
ctg:
peek 144
pop
push 144
pushc __def_const_gen_word_n214
gpm
peek 0
pop
pushcp _ctg
invoke
pushc __def_const_gen_word_n215
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_ctg_method_end:
jr
__gen_ctg_method_end_block:
pushcp __gen_arcsin_method_end_block
jp
arcsin:
peek 145
pop
push 145
pushc __def_const_gen_word_n216
gpm
peek 0
pop
pushcp _arcsin
invoke
pushc __def_const_gen_word_n217
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_arcsin_method_end:
jr
__gen_arcsin_method_end_block:
pushcp __gen_arccos_method_end_block
jp
arccos:
peek 146
pop
push 146
pushc __def_const_gen_word_n218
gpm
peek 0
pop
pushcp _arccos
invoke
pushc __def_const_gen_word_n219
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_arccos_method_end:
jr
__gen_arccos_method_end_block:
pushcp __gen_log10_method_end_block
jp
log10:
peek 147
pop
push 147
pushc __def_const_gen_word_n220
gpm
peek 0
pop
pushcp _log10
invoke
pushc __def_const_gen_word_n221
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_log10_method_end:
jr
__gen_log10_method_end_block:
pushcp __gen_log2_method_end_block
jp
log2:
peek 148
pop
push 148
pushc __def_const_gen_word_n222
gpm
peek 0
pop
pushcp _log2
invoke
pushc __def_const_gen_word_n223
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_log2_method_end:
jr
__gen_log2_method_end_block:
pushcp __gen_logn_method_end_block
jp
logn:
peek 149
pop
peek 150
pop
push 150
push 149
pushc __def_const_gen_word_n224
gpm
peek 0
pop
pushcp _logn
invoke
pushc __def_const_gen_word_n225
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_logn_method_end:
jr
__gen_logn_method_end_block:
pushcp __gen_lnxp1_method_end_block
jp
lnxp1:
peek 151
pop
push 151
pushc __def_const_gen_word_n226
gpm
peek 0
pop
pushcp _lnxp1
invoke
pushc __def_const_gen_word_n227
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_lnxp1_method_end:
jr
__gen_lnxp1_method_end_block:
pushcp __gen_exp_method_end_block
jp
exp:
peek 152
pop
push 152
pushc __def_const_gen_word_n228
gpm
peek 0
pop
pushcp _exp
invoke
pushc __def_const_gen_word_n229
gpm
peek 0
pop
pushcp gpmx
jc
jr
__gen_exp_method_end:
jr
__gen_exp_method_end_block:
pushcp __gen_trunc_method_end_block
jp
trunc:
peek 153
pop
pushcp __def_const_gen_word_n230
push 153
copy
gpm
swp
pop
idiv
peek 154
pop
push 154
copy
gpm
swp
pop
jr
__gen_trunc_method_end:
jr
__gen_trunc_method_end_block:
pushcp __gen_frac_method_end_block
jp
frac:
peek 155
pop
pushcp __def_const_gen_word_n231
push 155
copy
gpm
swp
pop
idiv
peek 156
pop
push 155
copy
gpm
swp
pop
push 156
swp
sub
jr
__gen_frac_method_end:
jr
__gen_frac_method_end_block:
pushcp __gen_round_method_end_block
jp
round:
peek 157
pop
push 157
copy
gpm
swp
pop
pushcp __def_const_gen_real_n232
swp
add
pushc __def_const_gen_word_n233
gpm
peek 0
pop
pushcp trunc
jc
jr
__gen_round_method_end:
jr
__gen_round_method_end_block:
pushcp __gen_ceil_method_end_block
jp
ceil:
peek 158
pop
push 158
copy
gpm
swp
pop
pushcp __def_const_gen_real_n234
swp
add
pushc __def_const_gen_word_n235
gpm
peek 0
pop
pushcp trunc
jc
jr
__gen_ceil_method_end:
jr
__gen_ceil_method_end_block:
pushcp __gen_abs_method_end_block
jp
abs:
peek 159
pop
pushcp __gen_if_31_end
push 159
copy
gpm
swp
pop
pushcp __def_const_gen_word_n236
swp
bg
gpm
jz
pop
push 159
jr
pushcp __gen_if_31_else_end
jp
__gen_if_31_end:
pushc __def_const_gen_word_n237
gpm
push 159
swp
sub
jr
__gen_if_31_else_end:
__gen_abs_method_end:
jr
__gen_abs_method_end_block:
pushcp __gen_min_method_end_block
jp
min:
peek 160
pop
peek 161
pop
pushcp __gen_if_32_end
push 160
copy
gpm
swp
pop
push 161
bg
gpm
jz
pop
push 160
jr
pushcp __gen_if_32_else_end
jp
__gen_if_32_end:
push 161
jr
__gen_if_32_else_end:
__gen_min_method_end:
jr
__gen_min_method_end_block:
pushcp __gen_max_method_end_block
jp
max:
peek 162
pop
peek 163
pop
pushcp __gen_if_33_end
push 162
copy
gpm
swp
pop
push 163
bg
gpm
jz
pop
push 162
jr
pushcp __gen_if_33_else_end
jp
__gen_if_33_end:
push 163
jr
__gen_if_33_else_end:
__gen_max_method_end:
jr
__gen_max_method_end_block:
pushcp __gen_log_method_end_block
jp
log:
peek 164
pop
push 164
pushc m_e
gpm
pushc __def_const_gen_word_n238
gpm
peek 0
pop
pushcp logn
jc
jr
__gen_log_method_end:
jr
__gen_log_method_end_block:
pushcp __gen_power_method_end_block
jp
power:
peek 165
pop
peek 166
pop
push 166
push 165
pushc __def_const_gen_word_n239
gpm
peek 0
pop
pushcp log
jc
mul
peek 167
pop
push 167
copy
gpm
swp
pop
pushc __def_const_gen_word_n240
gpm
peek 0
pop
pushcp exp
jc
jr
__gen_power_method_end:
jr
__gen_power_method_end_block:
pushcp __gen_intpower_method_end_block
jp
intpower:
peek 168
pop
peek 169
pop
push 169
push 168
pushc __def_const_gen_word_n241
gpm
peek 0
pop
pushcp power
jc
pushc __def_const_gen_word_n242
gpm
peek 0
pop
pushcp round
jc
jr
__gen_intpower_method_end:
jr
__gen_intpower_method_end_block:
pushcp __gen_sqrt_method_end_block
jp
sqrt:
peek 170
pop
pushc __def_const_gen_real_n243
gpm
push 170
pushc __def_const_gen_word_n244
gpm
peek 0
pop
pushcp power
jc
jr
__gen_sqrt_method_end:
jr
__gen_sqrt_method_end_block:
pushcp __gen_stgamma_method_end_block
jp
stgamma:
peek 171
pop
push 171
pushcp m_e
push 171
copy
gpm
swp
pop
div
peek 172
pop
push 172
copy
gpm
swp
pop
pushc __def_const_gen_word_n245
gpm
peek 0
pop
pushcp power
jc
pushcp m_pi
pushc __def_const_gen_word_n246
gpm
mul
peek 172
pop
push 171
push 172
copy
gpm
swp
pop
div
peek 173
pop
push 173
copy
gpm
swp
pop
pushc __def_const_gen_word_n247
gpm
peek 0
pop
pushcp sqrt
jc
mul
peek 172
pop
push 172
copy
gpm
swp
pop
jr
__gen_stgamma_method_end:
jr
__gen_stgamma_method_end_block:
pushcp __gen_spgamma_method_end_block
jp
spgamma:
peek 174
pop
pushc __def_const_gen_word_n248
gpm
peek 175
pop
pushcp __def_const_gen_word_n249
pushcp __def_const_gen_word_n250
newa
peek 176
pop
pushc __def_const_gen_word_n251
gpm
peek 177
pop
pushcp m_pi
pushc __def_const_gen_word_n252
gpm
mul
peek 178
pop
push 178
copy
gpm
swp
pop
pushc __def_const_gen_word_n253
gpm
peek 0
pop
pushcp sqrt
jc
pushcp __def_const_gen_word_n254
push 176
peekai
pushc __def_const_gen_word_n255
gpm
peek 179
pop
__gen_for_12:
pushcp __gen_for_12_for_end
push 179
copy
gpm
swp
pop
push 175
bg
gpm
jz
pop
push 179
copy
gpm
swp
pop
pushcp __def_const_gen_real_n256
swp
sub
push 175
copy
gpm
swp
pop
push 179
swp
sub
pushc __def_const_gen_word_n257
gpm
peek 0
pop
pushcp power
jc
push 175
copy
gpm
swp
pop
push 179
swp
sub
pushc __def_const_gen_word_n258
gpm
peek 0
pop
pushcp exp
jc
mul
peek 178
pop
push 177
push 178
copy
gpm
swp
pop
div
peek 180
pop
push 180
copy
gpm
swp
pop
push 179
push 176
peekai
pushc __def_const_gen_word_n259
gpm
push 179
swp
sub
push 177
mul
pop
push 179
inc
pop
pushcp __gen_for_12
jp
__gen_for_12_for_end:
pushcp __def_const_gen_word_n260
push 176
pushai
peek 181
pop
pushc __def_const_gen_word_n261
gpm
peek 179
pop
__gen_for_13:
pushcp __gen_for_13_for_end
push 179
copy
gpm
swp
pop
push 175
bg
gpm
jz
pop
push 174
copy
gpm
swp
pop
push 179
swp
add
peek 178
pop
push 174
copy
gpm
swp
pop
push 179
swp
add
peek 180
pop
push 178
push 179
push 176
pushai
copy
gpm
swp
pop
div
peek 182
pop
push 182
copy
gpm
swp
pop
push 181
add
pop
push 179
inc
pop
pushcp __gen_for_13
jp
__gen_for_13_for_end:
push 174
copy
gpm
swp
pop
pushcp __def_const_gen_real_n262
swp
add
push 174
copy
gpm
swp
pop
push 175
swp
add
pushc __def_const_gen_word_n263
gpm
peek 0
pop
pushcp power
jc
push 174
copy
gpm
swp
pop
push 175
swp
add
peek 178
pop
push 174
copy
gpm
swp
pop
push 175
swp
add
peek 180
pop
pushc __def_const_gen_word_n264
gpm
push 178
swp
sub
pushc __def_const_gen_word_n265
gpm
peek 0
pop
pushcp exp
jc
mul
peek 178
pop
push 178
copy
gpm
swp
pop
push 181
mul
pop
push 176
pushc __def_const_gen_word_n266
gpm
peek 0
pop
pushcp free
jc
push 174
push 181
copy
gpm
swp
pop
div
peek 178
pop
push 178
copy
gpm
swp
pop
jr
__gen_spgamma_method_end:
jr
__gen_spgamma_method_end_block:
pushcp __gen_hypot_method_end_block
jp
hypot:
peek 183
pop
peek 184
pop
push 183
push 183
copy
gpm
swp
pop
mul
peek 185
pop
push 184
push 184
copy
gpm
swp
pop
mul
peek 186
pop
push 185
copy
gpm
swp
pop
push 186
swp
add
pushc __def_const_gen_word_n267
gpm
peek 0
pop
pushcp sqrt
jc
jr
__gen_hypot_method_end:
jr
__gen_hypot_method_end_block:
pushcp __gen_radians_method_end_block
jp
radians:
peek 187
pop
pushcp m_pi
pushc __def_const_gen_word_n268
gpm
div
peek 188
pop
push 188
copy
gpm
swp
pop
peek 188
pop
pushcp m_pi
pushc __def_const_gen_word_n269
gpm
div
peek 188
pop
push 188
copy
gpm
swp
pop
peek 189
pop
push 188
push 187
copy
gpm
swp
pop
mul
peek 190
pop
push 190
copy
gpm
swp
pop
jr
__gen_radians_method_end:
jr
__gen_radians_method_end_block:
pushcp __gen_degrees_method_end_block
jp
degrees:
peek 191
pop
pushcp __def_const_gen_word_n270
pushc m_pi
gpm
div
peek 192
pop
push 192
copy
gpm
swp
pop
peek 192
pop
pushcp __def_const_gen_word_n271
pushc m_pi
gpm
div
peek 192
pop
push 192
copy
gpm
swp
pop
peek 193
pop
push 192
push 191
copy
gpm
swp
pop
mul
peek 194
pop
push 194
copy
gpm
swp
pop
jr
__gen_degrees_method_end:
jr
__gen_degrees_method_end_block:
pushcp __gen_bsort_method_end_block
jp
bsort:
peek 195
pop
push 195
pushc __def_const_gen_word_n272
gpm
peek 0
pop
pushcp len
jc
peek 196
pop
pushc __def_const_gen_word_n273
gpm
peek 197
pop
__gen_for_14:
pushcp __gen_for_14_for_end
push 196
copy
gpm
swp
pop
pushcp __def_const_gen_word_n274
swp
sub
peek 198
pop
push 196
copy
gpm
swp
pop
pushcp __def_const_gen_word_n275
swp
sub
peek 199
pop
push 197
copy
gpm
swp
pop
push 198
bg
gpm
jz
pop
pushc true
gpm
peek 200
pop
pushc __def_const_gen_word_n276
gpm
peek 201
pop
__gen_for_15:
pushcp __gen_for_15_for_end
push 196
copy
gpm
swp
pop
pushcp __def_const_gen_word_n277
swp
sub
peek 198
pop
push 196
copy
gpm
swp
pop
pushcp __def_const_gen_word_n278
swp
sub
peek 199
pop
push 201
copy
gpm
swp
pop
push 198
bg
gpm
jz
pop
pushcp __gen_if_34_end
push 201
copy
gpm
swp
pop
pushcp __def_const_gen_word_n279
swp
add
push 195
pushai
copy
gpm
swp
pop
push 201
push 195
pushai
bg
gpm
jz
pop
push 201
copy
gpm
swp
pop
pushcp __def_const_gen_word_n280
swp
add
push 195
pushai
peek 202
pop
push 201
push 195
pushai
push 201
copy
gpm
swp
pop
pushcp __def_const_gen_word_n281
swp
add
push 195
peekai
push 202
push 201
push 195
peekai
pushc false
gpm
peek 200
pop
__gen_if_34_end:
push 201
inc
pop
pushcp __gen_for_15
jp
__gen_for_15_for_end:
pushcp __gen_if_35_end
push 200
jz
pop
pushcp __gen_for_14_for_end
jp
__gen_if_35_end:
push 197
inc
pop
pushcp __gen_for_14
jp
__gen_for_14_for_end:
__gen_bsort_method_end:
jr
__gen_bsort_method_end_block:
pushcp __gen_printarray_method_end_block
jp
printarray:
peek 203
pop
pushc __def_const_gen_word_n282
gpm
peek 204
pop
__gen_for_16:
pushcp __gen_for_16_for_end
push 204
copy
gpm
swp
pop
push 203
pushc __def_const_gen_word_n283
gpm
peek 0
pop
pushcp len
jc
bg
gpm
jz
pop
pushc __def_const_gen_str_n284
gpm
push 204
push 203
pushai
pushc __def_const_gen_word_n285
gpm
peek 0
pop
pushcp print
jc
push 204
inc
pop
pushcp __gen_for_16
jp
__gen_for_16_for_end:
pushc __def_const_gen_str_n286
gpm
pushc __def_const_gen_word_n287
gpm
peek 0
pop
pushcp println
jc
__gen_printarray_method_end:
jr
__gen_printarray_method_end_block:
pushcp __gen_main_method_end_block
jp
main:
pushcp __def_const_gen_word_n288
pushcp __def_const_gen_word_n289
newa
peek 205
pop
pushcp __def_const_gen_word_n290
pushcp __def_const_gen_word_n291
newa
peek 206
pop
pushc __def_const_gen_word_n292
gpm
peek 0
pop
pushcp randomize
invoke
pushc __def_const_gen_word_n293
gpm
peek 207
pop
__gen_for_17:
pushcp __gen_for_17_for_end
push 207
copy
gpm
swp
pop
pushcp __def_const_gen_word_n294
bg
gpm
jz
pop
pushc __def_const_gen_word_n295
gpm
peek 0
pop
pushcp random
jc
pushc __def_const_gen_word_n296
gpm
peek 0
pop
pushcp new
jc
pushc __def_const_gen_word_n297
gpm
push 207
swp
sub
push 205
peekai
push 207
inc
pop
pushcp __gen_for_17
jp
__gen_for_17_for_end:
pushc __def_const_gen_word_n298
gpm
peek 207
pop
__gen_for_18:
pushcp __gen_for_18_for_end
push 207
copy
gpm
swp
pop
pushcp __def_const_gen_word_n299
bg
gpm
jz
pop
push 207
push 205
pushai
pushc __def_const_gen_word_n300
gpm
peek 0
pop
pushcp copy
jc
pushc __def_const_gen_word_n301
gpm
push 207
swp
sub
push 206
peekai
push 207
inc
pop
pushcp __gen_for_18
jp
__gen_for_18_for_end:
pushc __def_const_gen_word_n302
gpm
peek 0
pop
pushcp tickcnt
jc
peek 208
pop
push 206
pushc __def_const_gen_word_n303
gpm
peek 0
pop
pushcp quicksort
jc
pushc __def_const_gen_word_n304
gpm
peek 0
pop
pushcp tickcnt
jc
push 208
swp
sub
peek 208
pop
pushc __def_const_gen_str_n305
gpm
push 208
swp
add
pushcp __def_const_gen_str_n306
swp
add
pushc __def_const_gen_word_n307
gpm
peek 0
pop
pushcp println
jc
pushc __def_const_gen_word_n308
gpm
peek 0
pop
pushcp gc
jc
pushc __def_const_gen_word_n309
gpm
peek 207
pop
__gen_for_19:
pushcp __gen_for_19_for_end
push 207
copy
gpm
swp
pop
pushcp __def_const_gen_word_n310
bg
gpm
jz
pop
push 207
push 205
pushai
pushc __def_const_gen_word_n311
gpm
peek 0
pop
pushcp copy
jc
pushc __def_const_gen_word_n312
gpm
push 207
swp
sub
push 206
peekai
push 207
inc
pop
pushcp __gen_for_19
jp
__gen_for_19_for_end:
pushc __def_const_gen_word_n313
gpm
peek 0
pop
pushcp tickcnt
jc
peek 208
pop
pushc __def_const_gen_word_n314
gpm
push 206
pushc __def_const_gen_word_n315
gpm
peek 0
pop
pushcp thrquicksort
jc
pushc __def_const_gen_word_n316
gpm
peek 0
pop
pushcp tickcnt
jc
push 208
swp
sub
peek 208
pop
pushc __def_const_gen_str_n317
gpm
push 208
swp
add
pushcp __def_const_gen_str_n318
swp
add
pushc __def_const_gen_word_n319
gpm
peek 0
pop
pushcp println
jc
pushc __def_const_gen_word_n320
gpm
peek 0
pop
pushcp gc
jc
pushc __def_const_gen_word_n321
gpm
peek 207
pop
__gen_for_20:
pushcp __gen_for_20_for_end
push 207
copy
gpm
swp
pop
pushcp __def_const_gen_word_n322
bg
gpm
jz
pop
push 207
push 205
pushai
pushc __def_const_gen_word_n323
gpm
peek 0
pop
pushcp copy
jc
pushc __def_const_gen_word_n324
gpm
push 207
swp
sub
push 206
peekai
push 207
inc
pop
pushcp __gen_for_20
jp
__gen_for_20_for_end:
pushc __def_const_gen_word_n325
gpm
peek 0
pop
pushcp tickcnt
jc
peek 208
pop
push 206
pushc __def_const_gen_word_n326
gpm
peek 0
pop
pushcp radixsort
jc
pushc __def_const_gen_word_n327
gpm
peek 0
pop
pushcp tickcnt
jc
push 208
swp
sub
peek 208
pop
pushc __def_const_gen_str_n328
gpm
push 208
swp
add
pushcp __def_const_gen_str_n329
swp
add
pushc __def_const_gen_word_n330
gpm
peek 0
pop
pushcp println
jc
pushc __def_const_gen_word_n331
gpm
peek 207
pop
__gen_for_21:
pushcp __gen_for_21_for_end
push 207
copy
gpm
swp
pop
pushcp __def_const_gen_word_n332
bg
gpm
jz
pop
pushc __def_const_gen_word_n333
gpm
push 207
swp
sub
push 205
pushai
rem
push 207
inc
pop
pushcp __gen_for_21
jp
__gen_for_21_for_end:
push 205
rem
push 206
rem
pushc __def_const_gen_word_n334
gpm
peek 0
pop
pushcp gc
jc
pushc __def_const_gen_word_n335
gpm
peek 0
pop
pushcp inputln
jc
__gen_main_method_end:
jr
__gen_main_method_end_block:
pushc __entrypoint
gpm
jc
pushc __haltpoint
gpm
jp
__haltpoint:
gc
