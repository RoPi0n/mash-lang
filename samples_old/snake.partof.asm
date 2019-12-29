pushcp __addrtsz
msz
pushcp __def_const_gen_word_n0
pushcp __def_const_gen_word_n1
newa
pcopy
pushc eraisedexception
swp
pushc __def_const_gen_word_n2
swp
peekai
pcopy
pushc einvalidvmop
swp
pushc __def_const_gen_word_n3
swp
peekai
pcopy
pushc einvalidtypecast
swp
pushc __def_const_gen_word_n4
swp
peekai
pcopy
pushc eabstracterror
swp
pushc __def_const_gen_word_n5
swp
peekai
pcopy
pushc eunknownexception
swp
pushc __def_const_gen_word_n6
swp
peekai
peek 1
pop
pushcp __def_const_gen_word_n7
pushcp __def_const_gen_word_n8
newa
pcopy
pushc einterror
swp
pushc __def_const_gen_word_n9
swp
peekai
pcopy
pushc edivbyzero
swp
pushc __def_const_gen_word_n10
swp
peekai
pcopy
pushc erangeerror
swp
pushc __def_const_gen_word_n11
swp
peekai
pcopy
pushc eintoverflow
swp
pushc __def_const_gen_word_n12
swp
peekai
pcopy
pushc ematherror
swp
pushc __def_const_gen_word_n13
swp
peekai
pcopy
pushc einvalidop
swp
pushc __def_const_gen_word_n14
swp
peekai
pcopy
pushc ezerodivide
swp
pushc __def_const_gen_word_n15
swp
peekai
pcopy
pushc eoverflow
swp
pushc __def_const_gen_word_n16
swp
peekai
pcopy
pushc eunderflow
swp
pushc __def_const_gen_word_n17
swp
peekai
peek 2
pop
pushcp __def_const_gen_word_n18
pushcp __def_const_gen_word_n19
newa
pcopy
pushc eaccessviolation
swp
pushc __def_const_gen_word_n20
swp
peekai
pcopy
pushc eoserror
swp
pushc __def_const_gen_word_n21
swp
peekai
pcopy
pushc enothreadsupport
swp
pushc __def_const_gen_word_n22
swp
peekai
peek 3
pop
pushc __def_const_gen_str_n23
gpm
pushc eunknownexception
gpm
pushc __def_const_gen_word_n24
gpm
peek 0
pop
pushc __makeexception
gpm
jc
peek 9
pop
pushc __def_const_gen_word_n25
gpm
peek 0
pop
pushc __getvm_null
gpm
jc
peek 10
pop
pushc __def_const_gen_word_n26
gpm
peek 0
pop
pushc getsystemslash
gpm
invoke
peek 11
pop
pushc __def_const_gen_word_n63
gpm
pushc __def_const_gen_word_n64
gpm
pushc __def_const_gen_word_n65
gpm
peek 0
pop
pushc chr
gpm
jc
peek 58
pop
pushcp __def_const_gen_word_n191
pushcp __def_const_gen_word_n192
newa
pcopy
pushcp __def_const_gen_word_n193
pushcp __def_const_gen_word_n194
newa
pcopy
pushc __def_const_gen_word_n195
gpm
pushcp __def_const_gen_word_n196
swp
sub
swp
pushc __def_const_gen_word_n197
swp
peekai
pcopy
pushc __def_const_gen_word_n198
swp
pushc __def_const_gen_word_n199
swp
peekai
swp
pushc __def_const_gen_word_n200
swp
peekai
pcopy
pushcp __def_const_gen_word_n201
pushcp __def_const_gen_word_n202
newa
pcopy
pushc __def_const_gen_word_n203
swp
pushc __def_const_gen_word_n204
swp
peekai
pcopy
pushc __def_const_gen_word_n205
swp
pushc __def_const_gen_word_n206
swp
peekai
swp
pushc __def_const_gen_word_n207
swp
peekai
pcopy
pushcp __def_const_gen_word_n208
pushcp __def_const_gen_word_n209
newa
pcopy
pushc __def_const_gen_word_n210
swp
pushc __def_const_gen_word_n211
swp
peekai
pcopy
pushc __def_const_gen_word_n212
gpm
pushcp __def_const_gen_word_n213
swp
sub
swp
pushc __def_const_gen_word_n214
swp
peekai
swp
pushc __def_const_gen_word_n215
swp
peekai
pcopy
pushcp __def_const_gen_word_n216
pushcp __def_const_gen_word_n217
newa
pcopy
pushc __def_const_gen_word_n218
swp
pushc __def_const_gen_word_n219
swp
peekai
pcopy
pushc __def_const_gen_word_n220
swp
pushc __def_const_gen_word_n221
swp
peekai
swp
pushc __def_const_gen_word_n222
swp
peekai
peek 170
pop
pushcp __gen_exception__create_method_end_block
jp
exception__create:
peek 4
pop
peek 5
pop
pushc eraisedexception
gpm
pushcp __class__child_classname
push 4
peekai
push 5
pushcp __class__child_message
push 4
peekai
pushn
peek 4
peek 5
pop
__gen_exception__create_method_end:
jr
__gen_exception__create_method_end_block:
pushcp __gen___makeexception_method_end_block
jp
__makeexception:
peek 6
pop
peek 7
pop
pushcp __gen_if_0_end
push 6
copy
gpm
swp
pop
pushcp eraisedexception
eq
gpm
jz
pop
push 7
jr
pushcp __gen_if_0_else_end
jp
__gen_if_0_end:
pushcp __class_exception_allocator
jc
peek 8
pop
push 6
pushcp __class__child_classname
push 8
peekai
push 7
pushcp __class__child_message
push 8
peekai
push 8
jr
__gen_if_0_else_end:
pushn
peek 6
peek 7
peek 8
pop
__gen___makeexception_method_end:
jr
__gen___makeexception_method_end_block:
pushcp __gen___getvm_null_method_end_block
jp
__getvm_null:
pushn
pushn
pop
__gen___getvm_null_method_end:
jr
__gen___getvm_null_method_end_block:
pushcp __gen_typeof_method_end_block
jp
typeof:
peek 13
pop
push 13
typeof
pushn
peek 13
pop
__gen_typeof_method_end:
jr
__gen_typeof_method_end_block:
pushcp __gen_new_method_end_block
jp
new:
peek 14
pop
new
peek 15
pop
push 14
push 15
mov
push 15
jr
pushn
peek 14
peek 15
pop
__gen_new_method_end:
jr
__gen_new_method_end_block:
pushcp __gen___copyobject_method_end_block
jp
__copyobject:
peek 16
pop
push 16
copy
swp
pop
pushn
peek 16
pop
__gen___copyobject_method_end:
jr
__gen___copyobject_method_end_block:
pushcp __gen___copyarr_method_end_block
jp
__copyarr:
peek 17
pop
push 17
pushc __def_const_gen_word_n29
gpm
peek 0
pop
pushcp len
jc
peek 18
pop
push 18
pushcp __def_const_gen_word_n30
newa
peek 19
pop
pushc __def_const_gen_word_n31
gpm
peek 20
pop
__gen_for_0:
pushcp __gen_for_0_for_end
push 20
copy
gpm
swp
pop
push 18
bg
gpm
jz
pop
push 17
push 18
push 19
push 20
push 20
push 17
pushai
pushc __def_const_gen_word_n32
gpm
peek 0
pop
pushcp copy
jc
peek 21
pop
peek 20
pop
peek 19
pop
peek 18
pop
peek 17
pop
push 21
push 20
push 19
peekai
push 20
inc
pop
pushcp __gen_for_0
jp
__gen_for_0_for_end:
push 19
jr
pushn
peek 17
peek 18
peek 19
peek 20
peek 21
pop
__gen___copyarr_method_end:
jr
__gen___copyarr_method_end_block:
pushcp __gen_copy_method_end_block
jp
copy:
peek 22
pop
pushcp __gen_if_2_end
push 22
pushc __def_const_gen_word_n33
gpm
peek 0
pop
pushcp typeof
jc
pushcp typearray
eq
gpm
jz
pop
push 22
pushc __def_const_gen_word_n34
gpm
peek 0
pop
pushcp __copyarr
jc
jr
pushcp __gen_if_2_else_end
jp
__gen_if_2_end:
push 22
pushc __def_const_gen_word_n35
gpm
peek 0
pop
pushcp __copyobject
jc
jr
__gen_if_2_else_end:
pushn
peek 22
pop
__gen_copy_method_end:
jr
__gen_copy_method_end_block:
pushcp __gen_len_method_end_block
jp
len:
peek 24
pop
push 24
alen
pushn
peek 24
pop
__gen_len_method_end:
jr
__gen_len_method_end_block:
pushcp __gen_setlen_method_end_block
jp
setlen:
peek 25
pop
peek 26
pop
push 25
push 26
salen
pop
pushn
peek 25
peek 26
pop
__gen_setlen_method_end:
jr
__gen_setlen_method_end_block:
pushcp __gen__op_range_method_end_block
jp
_op_range:
peek 31
pop
peek 32
pop
pushcp __gen_if_3_end
push 31
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
push 31
copy
gpm
swp
pop
push 32
swp
sub
pushcp __def_const_gen_word_n39
swp
add
pushcp __def_const_gen_word_n40
newa
peek 33
pop
push 31
pushc __def_const_gen_word_n41
gpm
peek 0
pop
pushcp copy
jc
peek 34
pop
__gen_for_2:
pushcp __gen_for_2_for_end
push 34
copy
gpm
swp
pop
push 32
swp
be
gpm
jz
pop
push 34
pushc __def_const_gen_word_n42
gpm
peek 0
pop
pushcp copy
jc
push 31
copy
gpm
swp
pop
push 34
swp
sub
push 33
peekai
push 34
dec
pop
pushcp __gen_for_2
jp
__gen_for_2_for_end:
pushcp __gen_if_3_else_end
jp
__gen_if_3_end:
push 32
copy
gpm
swp
pop
push 31
swp
sub
pushcp __def_const_gen_word_n43
swp
add
pushcp __def_const_gen_word_n44
newa
peek 33
pop
push 31
pushc __def_const_gen_word_n45
gpm
peek 0
pop
pushcp copy
jc
peek 34
pop
__gen_for_3:
pushcp __gen_for_3_for_end
push 34
copy
gpm
swp
pop
push 32
be
gpm
jz
pop
push 34
pushc __def_const_gen_word_n46
gpm
peek 0
pop
pushcp copy
jc
push 34
copy
gpm
swp
pop
push 31
swp
sub
push 33
peekai
push 34
inc
pop
pushcp __gen_for_3
jp
__gen_for_3_for_end:
__gen_if_3_else_end:
push 33
jr
pushn
peek 31
peek 32
peek 33
peek 34
pop
__gen__op_range_method_end:
jr
__gen__op_range_method_end_block:
pushcp __gen_gc_method_end_block
jp
gc:
stkdrop
gc
pushn
pop
__gen_gc_method_end:
jr
__gen_gc_method_end_block:
pushcp __gen__op_in_method_end_block
jp
_op_in:
peek 35
pop
peek 36
pop
pushc __def_const_gen_word_n47
gpm
peek 37
pop
push 36
pushc __def_const_gen_word_n48
gpm
peek 0
pop
pushcp len
jc
peek 38
pop
__gen_while_0:
pushcp __gen_while_0_end
push 37
copy
gpm
swp
pop
push 38
bg
gpm
jz
pop
pushcp __gen_if_4_end
push 37
push 36
pushai
copy
gpm
swp
pop
push 35
eq
gpm
jz
pop
pushc true
gpm
jr
__gen_if_4_end:
push 37
inc
pop
pushcp __gen_while_0
jp
__gen_while_0_end:
pushc false
gpm
jr
pushn
peek 35
peek 36
peek 37
peek 38
pop
__gen__op_in_method_end:
jr
__gen__op_in_method_end_block:
pushcp __gen_ptr_method_end_block
jp
ptr:
peek 39
pop
push 39
new
gpm
peek 40
movp
push 40
jr
pushn
peek 39
pop
__gen_ptr_method_end:
jr
__gen_ptr_method_end_block:
pushcp __gen___poprest_method_end_block
jp
__poprest:
peek 44
pop
pushc __def_const_gen_word_n49
gpm
peek 45
pop
push 44
pushcp __def_const_gen_word_n50
newa
peek 46
pop
__gen_while_1:
pushcp __gen_while_1_end
push 45
copy
gpm
swp
pop
push 44
bg
gpm
jz
pop
push 45
push 46
peekai
push 45
inc
pop
pushcp __gen_while_1
jp
__gen_while_1_end:
push 46
jr
pushn
peek 44
peek 45
peek 46
pop
__gen___poprest_method_end:
jr
__gen___poprest_method_end_block:
pushcp __gen_vcall_method_end_block
jp
vcall:
peek 47
pop
push 0
dec
pop
push 47
copy
gpm
swp
pop
jc
pushn
peek 47
pop
__gen_vcall_method_end:
jr
__gen_vcall_method_end_block:
pushcp __gen__chr_method_end_block
jp
_chr:
peek 60
pop
push 60
ordch
pushn
peek 60
pop
__gen__chr_method_end:
jr
__gen__chr_method_end_block:
pushcp __gen_chr_method_end_block
jp
chr:
pushcp __def_const_gen_word_n66
push 0
sub
pushcp __poprest
jc
peek 61
pop
pushc __def_const_gen_str_n67
gpm
peek 62
pop
pushc __def_const_gen_word_n68
gpm
peek 63
pop
__gen_for_6:
pushcp __gen_for_6_for_end
push 63
copy
gpm
swp
pop
push 61
pushc __def_const_gen_word_n69
gpm
peek 0
pop
pushcp len
jc
bg
gpm
jz
pop
push 63
push 61
pushai
pushc __def_const_gen_word_n70
gpm
peek 0
pop
pushcp _chr
jc
push 62
add
pop
push 63
inc
pop
pushcp __gen_for_6
jp
__gen_for_6_for_end:
push 62
jr
pushn
peek 61
peek 62
peek 63
pop
__gen_chr_method_end:
jr
__gen_chr_method_end_block:
pushcp __gen___entrypoint_method_end_block
jp
__entrypoint:
peek 64
pop
push 64
pushcp __def_const_gen_word_n71
newa
peek 65
pop
pushc __def_const_gen_word_n72
gpm
peek 66
pop
__gen_while_2:
pushcp __gen_while_2_end
push 66
copy
gpm
swp
pop
push 64
bg
gpm
jz
pop
push 66
push 65
peekai
push 66
inc
pop
pushcp __gen_while_2
jp
__gen_while_2_end:
pushc __def_const_gen_word_n73
gpm
peek 0
pop
pushcp main
jc
pushn
peek 66
pop
__gen___entrypoint_method_end:
jr
__gen___entrypoint_method_end_block:
pushcp __gen___printarray_method_end_block
jp
__printarray:
peek 67
pop
pushc __def_const_gen_str_n74
gpm
pushc __def_const_gen_word_n75
gpm
peek 0
pop
pushcp _print
invoke
push 67
pushc __def_const_gen_word_n76
gpm
peek 0
pop
pushcp len
jc
peek 68
pop
pushc __def_const_gen_word_n77
gpm
peek 69
pop
__gen_for_7:
pushcp __gen_for_7_for_end
push 69
copy
gpm
swp
pop
push 68
bg
gpm
jz
pop
push 67
push 68
push 69
push 69
push 67
pushai
pushc __def_const_gen_word_n78
gpm
peek 0
pop
pushcp __print
jc
peek 69
pop
peek 68
pop
peek 67
pop
pushcp __gen_if_8_end
push 69
copy
gpm
swp
pop
pushcp __def_const_gen_word_n79
swp
add
push 68
bg
gpm
jz
pop
pushc __def_const_gen_str_n80
gpm
pushc __def_const_gen_word_n81
gpm
peek 0
pop
pushcp _print
invoke
__gen_if_8_end:
push 69
inc
pop
pushcp __gen_for_7
jp
__gen_for_7_for_end:
pushc __def_const_gen_str_n82
gpm
pushc __def_const_gen_word_n83
gpm
peek 0
pop
pushcp _print
invoke
pushn
peek 67
peek 68
peek 69
pop
__gen___printarray_method_end:
jr
__gen___printarray_method_end_block:
pushcp __gen___print_method_end_block
jp
__print:
peek 70
pop
__gen_switch_0:
push 70
pushc __def_const_gen_word_n84
gpm
peek 0
pop
pushcp typeof
jc
__gen_case_0:
pcopy
pushc typenull
gpm
eq
gpm
pushcp __gen_case_0_end
swp
jz
pop
pushc __def_const_gen_str_n85
gpm
pushc __def_const_gen_word_n86
gpm
peek 0
pop
pushcp _print
invoke
pushcp __gen_switch_0_end
jp
__gen_case_0_end:
__gen_case_1:
pcopy
pushc typeclass
gpm
eq
gpm
pushcp __gen_case_1_end
swp
jz
pop
pushcp __gen_if_9_end
pushcp __class__child_type
push 70
pushai
copy
gpm
swp
pop
pushcp exception
eq
gpm
jz
pop
pushc __def_const_gen_str_n87
gpm
pushcp __class__child_classname
push 70
pushai
swp
add
pushcp __def_const_gen_str_n88
swp
add
pushcp __class__child_message
push 70
pushai
swp
add
pushcp __def_const_gen_str_n89
swp
add
pushc __def_const_gen_word_n90
gpm
peek 0
pop
pushcp _print
invoke
pushcp __gen_if_9_else_end
jp
__gen_if_9_end:
pushcp __class_exception_allocator
jc
pcopy
pushc __def_const_gen_str_n91
gpm
swp
pushc __def_const_gen_word_n92
gpm
peek 0
pop
pushcp exception__create
jc
pushc __def_const_gen_str_n93
gpm
trr
__gen_if_9_else_end:
pushcp __gen_switch_0_end
jp
__gen_case_1_end:
__gen_case_2:
pcopy
pushc typearray
gpm
eq
gpm
pushcp __gen_case_2_end
swp
jz
pop
push 70
pushc __def_const_gen_word_n94
gpm
peek 0
pop
pushcp __printarray
jc
pushcp __gen_switch_0_end
jp
__gen_case_2_end:
push 70
pushc __def_const_gen_word_n95
gpm
peek 0
pop
pushcp _print
invoke
__gen_switch_0_end:
pop
pushn
peek 70
pop
__gen___print_method_end:
jr
__gen___print_method_end_block:
pushcp __gen_print_method_end_block
jp
print:
pushcp __def_const_gen_word_n96
push 0
sub
pushcp __poprest
jc
peek 71
pop
push 71
alen
peek 72
pop
pushc __def_const_gen_word_n97
peek 73
pop
__gen_for_each_8:
pushcp __gen_for_each_8_for_end
push 73
push 72
bg
jz
pop
push 73
push 71
pushai
peek 74
push 74
pushc __def_const_gen_word_n98
gpm
peek 0
pop
pushcp __print
jc
push 73
inc
pushcp __gen_for_each_8
jp
__gen_for_each_8_for_end:
pushn
peek 71
peek 72
peek 73
peek 74
pop
__gen_print_method_end:
jr
__gen_print_method_end_block:
pushcp __gen_class__gethash_method_end_block
jp
class__gethash:
peek 81
pop
push 81
pushc __def_const_gen_word_n113
gpm
peek 0
pop
pushcp len
jc
push 81
pushc __def_const_gen_word_n114
gpm
peek 0
pop
pushcp ptr
jc
swp
xor
peek 82
pop
push 82
copy
gpm
swp
pop
pushcp __class__child_type
push 81
pushai
swp
xor
jr
pushn
peek 81
peek 82
pop
__gen_class__gethash_method_end:
jr
__gen_class__gethash_method_end_block:
pushcp __gen_vector__create_method_end_block
jp
vector__create:
peek 84
pop
pushcp __def_const_gen_word_n115
pushcp __def_const_gen_word_n116
newa
pushcp __class__child_items
push 84
peekai
pushc __def_const_gen_word_n117
gpm
pushc __def_const_gen_word_n118
gpm
peek 0
pop
pushcp new
jc
pushcp __def_const_gen_word_n119
pushcp __class__child_items
push 84
pushai
peekai
pushn
peek 84
pop
__gen_vector__create_method_end:
jr
__gen_vector__create_method_end_block:
pushcp __gen_vector__push_back_method_end_block
jp
vector__push_back:
peek 85
pop
peek 86
pop
pushcp __def_const_gen_word_n120
pushcp __class__child_items
push 85
pushai
pushai
copy
gpm
swp
pop
pushcp __def_const_gen_word_n121
swp
add
pushcp __class__child_items
push 85
pushai
pushc __def_const_gen_word_n122
gpm
peek 0
pop
pushcp setlen
jc
pushcp __def_const_gen_word_n123
pushcp __class__child_items
push 85
pushai
pushai
inc
pop
push 86
pushcp __def_const_gen_word_n124
pushcp __class__child_items
push 85
pushai
pushai
pushcp __class__child_items
push 85
pushai
peekai
pushn
peek 85
peek 86
pop
__gen_vector__push_back_method_end:
jr
__gen_vector__push_back_method_end_block:
pushcp __gen_vector__pop_back_method_end_block
jp
vector__pop_back:
peek 87
pop
pushcp __def_const_gen_word_n125
pushcp __class__child_items
push 87
pushai
pushai
pushcp __class__child_items
push 87
pushai
pushai
peek 88
pop
pushcp __def_const_gen_word_n126
pushcp __class__child_items
push 87
pushai
pushai
pushcp __class__child_items
push 87
pushai
pushc __def_const_gen_word_n127
gpm
peek 0
pop
pushcp setlen
jc
pushcp __def_const_gen_word_n128
pushcp __class__child_items
push 87
pushai
pushai
dec
pop
push 88
jr
pushn
peek 87
peek 88
pop
__gen_vector__pop_back_method_end:
jr
__gen_vector__pop_back_method_end_block:
pushcp __gen_vector__pop_first_method_end_block
jp
vector__pop_first:
peek 89
pop
pushcp __def_const_gen_word_n129
pushcp __class__child_items
push 89
pushai
pushai
peek 90
pop
pushc __def_const_gen_word_n130
gpm
peek 91
pop
__gen_for_10:
pushcp __gen_for_10_for_end
push 91
copy
gpm
swp
pop
pushcp __def_const_gen_word_n131
pushcp __class__child_items
push 89
pushai
pushai
bg
gpm
jz
pop
push 91
copy
gpm
swp
pop
pushcp __def_const_gen_word_n132
swp
add
pushcp __class__child_items
push 89
pushai
pushai
push 91
pushcp __class__child_items
push 89
pushai
peekai
push 91
inc
pop
pushcp __gen_for_10
jp
__gen_for_10_for_end:
pushcp __def_const_gen_word_n133
pushcp __class__child_items
push 89
pushai
pushai
pushcp __class__child_items
push 89
pushai
pushc __def_const_gen_word_n134
gpm
peek 0
pop
pushcp setlen
jc
pushcp __def_const_gen_word_n135
pushcp __class__child_items
push 89
pushai
pushai
dec
pop
push 90
jr
pushn
peek 89
peek 90
peek 91
pop
__gen_vector__pop_first_method_end:
jr
__gen_vector__pop_first_method_end_block:
pushcp __gen_vector__peek_back_method_end_block
jp
vector__peek_back:
peek 92
pop
pushcp __def_const_gen_word_n136
pushcp __class__child_items
push 92
pushai
pushai
pushcp __class__child_items
push 92
pushai
pushai
jr
pushn
peek 92
pop
__gen_vector__peek_back_method_end:
jr
__gen_vector__peek_back_method_end_block:
pushcp __gen_vector__peek_first_method_end_block
jp
vector__peek_first:
peek 93
pop
pushcp __def_const_gen_word_n137
pushcp __class__child_items
push 93
pushai
pushai
jr
pushn
peek 93
pop
__gen_vector__peek_first_method_end:
jr
__gen_vector__peek_first_method_end_block:
pushcp __gen_vector__rem_first_method_end_block
jp
vector__rem_first:
peek 94
pop
pushc __def_const_gen_word_n138
gpm
peek 95
pop
__gen_for_11:
pushcp __gen_for_11_for_end
push 95
copy
gpm
swp
pop
pushcp __def_const_gen_word_n139
pushcp __class__child_items
push 94
pushai
pushai
bg
gpm
jz
pop
push 95
copy
gpm
swp
pop
pushcp __def_const_gen_word_n140
swp
add
pushcp __class__child_items
push 94
pushai
pushai
push 95
pushcp __class__child_items
push 94
pushai
peekai
push 95
inc
pop
pushcp __gen_for_11
jp
__gen_for_11_for_end:
pushcp __def_const_gen_word_n141
pushcp __class__child_items
push 94
pushai
pushai
pushcp __class__child_items
push 94
pushai
pushc __def_const_gen_word_n142
gpm
peek 0
pop
pushcp setlen
jc
pushcp __def_const_gen_word_n143
pushcp __class__child_items
push 94
pushai
pushai
dec
pop
pushn
peek 94
peek 95
pop
__gen_vector__rem_first_method_end:
jr
__gen_vector__rem_first_method_end_block:
pushcp __gen_vector__foreach_method_end_block
jp
vector__foreach:
peek 96
pop
peek 97
pop
pushc __def_const_gen_word_n144
gpm
peek 98
pop
__gen_for_12:
pushcp __gen_for_12_for_end
push 98
copy
gpm
swp
pop
pushcp __def_const_gen_word_n145
pushcp __class__child_items
push 96
pushai
pushai
be
gpm
jz
pop
push 98
pushcp __class__child_items
push 96
pushai
pushai
push 97
pushc __def_const_gen_word_n146
gpm
peek 0
pop
pushcp vcall
jc
push 98
inc
pop
pushcp __gen_for_12
jp
__gen_for_12_for_end:
pushn
peek 96
peek 97
peek 98
pop
__gen_vector__foreach_method_end:
jr
__gen_vector__foreach_method_end_block:
pushcp __gen_vector__rem_back_method_end_block
jp
vector__rem_back:
peek 99
pop
pushcp __def_const_gen_word_n147
pushcp __class__child_items
push 99
pushai
pushai
pushcp __class__child_items
push 99
pushai
pushc __def_const_gen_word_n148
gpm
peek 0
pop
pushcp setlen
jc
pushcp __def_const_gen_word_n149
pushcp __class__child_items
push 99
pushai
pushai
dec
pop
pushn
peek 99
pop
__gen_vector__rem_back_method_end:
jr
__gen_vector__rem_back_method_end_block:
pushcp __gen_vector__at_method_end_block
jp
vector__at:
peek 100
pop
peek 101
pop
push 101
copy
gpm
swp
pop
pushcp __def_const_gen_word_n150
swp
sub
pushcp __class__child_items
push 100
pushai
pushai
jr
pushn
peek 100
peek 101
pop
__gen_vector__at_method_end:
jr
__gen_vector__at_method_end_block:
pushcp __gen_vector__size_method_end_block
jp
vector__size:
peek 102
pop
pushcp __def_const_gen_word_n151
pushcp __class__child_items
push 102
pushai
pushai
jr
pushn
peek 102
pop
__gen_vector__size_method_end:
jr
__gen_vector__size_method_end_block:
pushcp __gen_point__create_method_end_block
jp
point__create:
peek 103
pop
peek 104
pop
peek 105
pop
push 104
pushc __def_const_gen_word_n152
gpm
peek 0
pop
pushcp new
jc
pushcp __class__child_x
push 103
peekai
push 105
pushc __def_const_gen_word_n153
gpm
peek 0
pop
pushcp new
jc
pushcp __class__child_y
push 103
peekai
pushn
peek 103
peek 104
peek 105
pop
__gen_point__create_method_end:
jr
__gen_point__create_method_end_block:
pushcp __gen_point__set_method_end_block
jp
point__set:
peek 106
pop
peek 107
pop
peek 108
pop
push 107
pushcp __class__child_x
push 106
pushai
mov
push 108
pushcp __class__child_y
push 106
pushai
mov
pushn
peek 106
peek 107
peek 108
pop
__gen_point__set_method_end:
jr
__gen_point__set_method_end_block:
pushcp __gen_point__compare_method_end_block
jp
point__compare:
peek 109
pop
peek 110
pop
pushcp __class__child_x
push 109
pushai
copy
gpm
swp
pop
pushcp __class__child_x
push 110
pushai
eq
gpm
peek 111
pop
pushcp __class__child_y
push 109
pushai
copy
gpm
swp
pop
pushcp __class__child_y
push 110
pushai
eq
gpm
peek 112
pop
push 111
copy
gpm
swp
pop
push 112
swp
and
jr
pushn
peek 109
peek 110
peek 111
peek 112
pop
__gen_point__compare_method_end:
jr
__gen_point__compare_method_end_block:
pushcp __gen_thr_create_method_end_block
jp
thr_create:
peek 126
pop
peek 127
pop
push 127
push 126
cthr
pushn
peek 126
peek 127
pop
__gen_thr_create_method_end:
jr
__gen_thr_create_method_end_block:
pushcp __gen_thr_resume_method_end_block
jp
thr_resume:
peek 130
pop
push 130
rthr
pushn
peek 130
pop
__gen_thr_resume_method_end:
jr
__gen_thr_resume_method_end_block:
pushcp __gen_thr_suspend_method_end_block
jp
thr_suspend:
peek 131
pop
push 131
sthr
pushn
peek 131
pop
__gen_thr_suspend_method_end:
jr
__gen_thr_suspend_method_end_block:
pushcp __gen_thr_terminate_method_end_block
jp
thr_terminate:
peek 132
pop
push 132
tthr
pushn
peek 132
pop
__gen_thr_terminate_method_end:
jr
__gen_thr_terminate_method_end_block:
pushcp __gen_thr_setpriority_method_end_block
jp
thr_setpriority:
peek 133
pop
peek 134
pop
push 134
push 133
thsp
pushn
peek 133
peek 134
pop
__gen_thr_setpriority_method_end:
jr
__gen_thr_setpriority_method_end_block:
pushcp __gen_tthread_join_method_end_block
jp
tthread_join:
peek 137
pop
peek 138
pop
pushc __def_const_gen_word_n159
gpm
peek 0
pop
push 138
pushcp __class__child_execute
push 138
pushai
jc
pushc __def_const_gen_word_n160
gpm
peek 0
pop
push 138
pushcp __class__child_terminate
push 138
pushai
jc
pushn
peek 137
peek 138
pop
__gen_tthread_join_method_end:
jr
__gen_tthread_join_method_end_block:
pushcp __gen_tthread__create_method_end_block
jp
tthread__create:
peek 139
pop
peek 140
pop
pushc false
gpm
pushcp __class__child_resumed
push 139
peekai
pushc false
gpm
pushcp __class__child_terminated
push 139
peekai
push 139
pushc tthread_join
gpm
pushc __def_const_gen_word_n161
gpm
peek 0
pop
pushcp thr_create
jc
pushcp __class__child_threadcontext
push 139
peekai
pushcp __gen_if_10_end
push 140
jz
pop
pushc __def_const_gen_word_n162
gpm
peek 0
pop
push 139
pushcp __class__child_resume
push 139
pushai
jc
__gen_if_10_end:
pushn
peek 139
peek 140
pop
__gen_tthread__create_method_end:
jr
__gen_tthread__create_method_end_block:
pushcp __gen_tthread__rejoin_method_end_block
jp
tthread__rejoin:
peek 142
pop
peek 143
pop
push 142
pushc tthread_join
gpm
pushc __def_const_gen_word_n164
gpm
peek 0
pop
pushcp thread
jc
pushcp __class__child_threadcontext
push 142
peekai
pushcp __gen_if_12_end
push 143
jz
pop
pushc __def_const_gen_word_n165
gpm
peek 0
pop
push 142
pushcp __class__child_resume
push 142
pushai
jc
__gen_if_12_end:
pushn
peek 142
peek 143
pop
__gen_tthread__rejoin_method_end:
jr
__gen_tthread__rejoin_method_end_block:
pushcp __gen_tthread__suspend_method_end_block
jp
tthread__suspend:
peek 144
pop
pushcp __class__child_threadcontext
push 144
pushai
pushc __def_const_gen_word_n166
gpm
peek 0
pop
pushcp thr_suspend
jc
pushc false
gpm
pushcp __class__child_resumed
push 144
pushai
mov
pushn
peek 144
pop
__gen_tthread__suspend_method_end:
jr
__gen_tthread__suspend_method_end_block:
pushcp __gen_tthread__resume_method_end_block
jp
tthread__resume:
peek 145
pop
pushcp __class__child_threadcontext
push 145
pushai
pushc __def_const_gen_word_n167
gpm
peek 0
pop
pushcp thr_resume
jc
pushc true
gpm
pushcp __class__child_resumed
push 145
pushai
mov
pushn
peek 145
pop
__gen_tthread__resume_method_end:
jr
__gen_tthread__resume_method_end_block:
pushcp __gen_tthread__setpriority_method_end_block
jp
tthread__setpriority:
peek 146
pop
peek 147
pop
push 147
pushcp __class__child_threadcontext
push 146
pushai
pushc __def_const_gen_word_n168
gpm
peek 0
pop
pushcp thr_setpriority
jc
pushn
peek 146
peek 147
pop
__gen_tthread__setpriority_method_end:
jr
__gen_tthread__setpriority_method_end_block:
pushcp __gen_tthread__terminate_method_end_block
jp
tthread__terminate:
peek 148
pop
pushc false
gpm
pushcp __class__child_resumed
push 148
pushai
mov
pushc true
gpm
pushcp __class__child_terminated
push 148
pushai
mov
pushcp __class__child_threadcontext
push 148
pushai
pushc __def_const_gen_word_n169
gpm
peek 0
pop
pushcp thr_terminate
jc
pushn
peek 148
pop
__gen_tthread__terminate_method_end:
jr
__gen_tthread__terminate_method_end_block:
pushcp __gen_tthread__waitfor_method_end_block
jp
tthread__waitfor:
peek 149
pop
__gen_while_3:
pushcp __gen_while_3_end
pushcp __class__child_terminated
push 149
pushai
copy
gpm
swp
pop
not
jz
pop
pushc __def_const_gen_word_n170
gpm
pushc __def_const_gen_word_n171
gpm
peek 0
pop
pushcp sleep
invoke
pushc __def_const_gen_word_n172
gpm
peek 0
pop
pushcp gc
jc
pushcp __gen_while_3
jp
__gen_while_3_end:
pushn
peek 149
pop
__gen_tthread__waitfor_method_end:
jr
__gen_tthread__waitfor_method_end_block:
pushcp __gen_tasynccallthread__create_method_end_block
jp
tasynccallthread__create:
peek 150
pop
peek 151
pop
peek 152
pop
push 151
pushcp __class__child_method
push 150
peekai
push 152
pushcp __class__child_args
push 150
peekai
pushc true
gpm
push 150
pushc __def_const_gen_word_n173
gpm
peek 0
pop
pushcp tthread__create
jc
pushn
peek 150
peek 151
peek 152
pop
__gen_tasynccallthread__create_method_end:
jr
__gen_tasynccallthread__create_method_end_block:
pushcp __gen_tasynccallthread__execute_method_end_block
jp
tasynccallthread__execute:
peek 153
pop
__gen_while_4:
pushcp __gen_while_4_end
pushc __def_const_gen_word_n174
gpm
peek 0
pop
pushcp __class__child_args
push 153
pushai
pushcp __class__child_size
pushcp __class__child_args
push 153
pushai
pushai
jc
pushcp __def_const_gen_word_n175
swp
bg
gpm
jz
pop
pushc __def_const_gen_word_n176
gpm
peek 0
pop
pushcp __class__child_args
push 153
pushai
pushcp __class__child_pop_back
pushcp __class__child_args
push 153
pushai
pushai
jc
pushcp __gen_while_4
jp
__gen_while_4_end:
pushcp __class__child_method
push 153
pushai
copy
gpm
swp
pop
jc
pushn
peek 153
pop
__gen_tasynccallthread__execute_method_end:
jr
__gen_tasynccallthread__execute_method_end_block:
pushcp __gen_async_method_end_block
jp
async:
peek 154
pop
pushcp __def_const_gen_word_n177
push 0
sub
pushcp __poprest
jc
peek 155
pop
pushcp __class_vector_allocator
jc
pcopy
pushc __def_const_gen_word_n178
gpm
peek 0
pop
pushcp vector__create
jc
peek 156
pop
push 155
alen
peek 157
pop
pushc __def_const_gen_word_n179
peek 158
pop
__gen_for_each_13:
pushcp __gen_for_each_13_for_end
push 158
push 157
bg
jz
pop
push 158
push 155
pushai
peek 159
push 159
pushc __def_const_gen_word_n180
gpm
peek 0
pop
push 156
pushcp __class__child_push_back
push 156
pushai
jc
push 158
inc
pushcp __gen_for_each_13
jp
__gen_for_each_13_for_end:
pushcp __class_tasynccallthread_allocator
jc
pcopy
push 156
swp
push 154
swp
pushc __def_const_gen_word_n181
gpm
peek 0
pop
pushcp tasynccallthread__create
jc
jr
pushn
peek 154
peek 155
peek 156
peek 157
peek 158
peek 159
pop
__gen_async_method_end:
jr
__gen_async_method_end_block:
pushcp __gen_tqthreadcallthread__create_method_end_block
jp
tqthreadcallthread__create:
peek 160
pop
peek 161
pop
peek 162
pop
push 161
pushcp __class__child_method
push 160
peekai
push 162
pushcp __class__child_args
push 160
peekai
pushc false
gpm
push 160
pushc __def_const_gen_word_n182
gpm
peek 0
pop
pushcp tthread__create
jc
pushn
peek 160
peek 161
peek 162
pop
__gen_tqthreadcallthread__create_method_end:
jr
__gen_tqthreadcallthread__create_method_end_block:
pushcp __gen_tqthreadcallthread__execute_method_end_block
jp
tqthreadcallthread__execute:
peek 163
pop
__gen_while_5:
pushcp __gen_while_5_end
pushc __def_const_gen_word_n183
gpm
peek 0
pop
pushcp __class__child_args
push 163
pushai
pushcp __class__child_size
pushcp __class__child_args
push 163
pushai
pushai
jc
pushcp __def_const_gen_word_n184
swp
bg
gpm
jz
pop
pushc __def_const_gen_word_n185
gpm
peek 0
pop
pushcp __class__child_args
push 163
pushai
pushcp __class__child_pop_back
pushcp __class__child_args
push 163
pushai
pushai
jc
pushcp __gen_while_5
jp
__gen_while_5_end:
pushcp __class__child_method
push 163
pushai
copy
gpm
swp
pop
jc
pushn
peek 163
pop
__gen_tqthreadcallthread__execute_method_end:
jr
__gen_tqthreadcallthread__execute_method_end_block:
pushcp __gen_thread_method_end_block
jp
thread:
peek 164
pop
pushcp __def_const_gen_word_n186
push 0
sub
pushcp __poprest
jc
peek 165
pop
pushcp __class_vector_allocator
jc
pcopy
pushc __def_const_gen_word_n187
gpm
peek 0
pop
pushcp vector__create
jc
peek 166
pop
push 165
alen
peek 167
pop
pushc __def_const_gen_word_n188
peek 168
pop
__gen_for_each_14:
pushcp __gen_for_each_14_for_end
push 168
push 167
bg
jz
pop
push 168
push 165
pushai
peek 169
push 169
pushc __def_const_gen_word_n189
gpm
peek 0
pop
push 166
pushcp __class__child_push_back
push 166
pushai
jc
push 168
inc
pushcp __gen_for_each_14
jp
__gen_for_each_14_for_end:
pushcp __class_tqthreadcallthread_allocator
jc
pcopy
push 166
swp
push 164
swp
pushc __def_const_gen_word_n190
gpm
peek 0
pop
pushcp tqthreadcallthread__create
jc
jr
pushn
peek 164
peek 165
peek 166
peek 167
peek 168
peek 169
pop
__gen_thread_method_end:
jr
__gen_thread_method_end_block:
pushcp __gen_snake__create_method_end_block
jp
snake__create:
peek 171
pop
pushcp __class_vector_allocator
jc
pcopy
pushc __def_const_gen_word_n223
gpm
peek 0
pop
pushcp vector__create
jc
pushcp __class__child_body
push 171
peekai
pushcp __class_point_allocator
jc
pcopy
pushc __def_const_gen_word_n224
gpm
swp
pushc __def_const_gen_word_n225
gpm
swp
pushc __def_const_gen_word_n226
gpm
peek 0
pop
pushcp point__create
jc
pushc __def_const_gen_word_n227
gpm
peek 0
pop
pushcp __class__child_body
push 171
pushai
pushcp __class__child_push_back
pushcp __class__child_body
push 171
pushai
pushai
jc
pushcp __class_point_allocator
jc
pcopy
pushc __def_const_gen_word_n228
gpm
swp
pushc __def_const_gen_word_n229
gpm
swp
pushc __def_const_gen_word_n230
gpm
peek 0
pop
pushcp point__create
jc
pushc __def_const_gen_word_n231
gpm
peek 0
pop
pushcp __class__child_body
push 171
pushai
pushcp __class__child_push_back
pushcp __class__child_body
push 171
pushai
pushai
jc
pushcp __class_point_allocator
jc
pcopy
pushc __def_const_gen_word_n232
gpm
swp
pushc __def_const_gen_word_n233
gpm
swp
pushc __def_const_gen_word_n234
gpm
peek 0
pop
pushcp point__create
jc
pushc __def_const_gen_word_n235
gpm
peek 0
pop
pushcp __class__child_body
push 171
pushai
pushcp __class__child_push_back
pushcp __class__child_body
push 171
pushai
pushai
jc
pushc smvright
gpm
pushc __def_const_gen_word_n236
gpm
peek 0
pop
pushcp new
jc
pushcp __class__child_movingvector
push 171
peekai
pushn
peek 171
pop
__gen_snake__create_method_end:
jr
__gen_snake__create_method_end_block:
pushcp __gen_putch_method_end_block
jp
putch:
peek 177
pop
peek 178
pop
peek 179
pop
push 178
push 177
pushc __def_const_gen_word_n237
gpm
peek 0
pop
pushcp crt.gotoxy
invoke
push 179
pushc __def_const_gen_word_n238
gpm
peek 0
pop
pushcp print
jc
pushn
peek 177
peek 178
peek 179
pop
__gen_putch_method_end:
jr
__gen_putch_method_end_block:
pushcp __gen_drawborders_method_end_block
jp
drawborders:
pushc __def_const_gen_word_n239
gpm
pushcp __def_const_gen_word_n240
swp
pushcp _op_range
jc
alen
peek 180
pop
pushc __def_const_gen_word_n241
peek 181
pop
__gen_for_each_15:
pushcp __gen_for_each_15_for_end
push 181
push 180
bg
jz
pop
push 181
pushc __def_const_gen_word_n242
gpm
pushcp __def_const_gen_word_n243
swp
pushcp _op_range
jc
pushai
peek 182
pushc __def_const_gen_word_n244
gpm
pushcp __def_const_gen_word_n245
swp
pushcp _op_range
jc
alen
peek 183
pop
pushc __def_const_gen_word_n246
peek 184
pop
__gen_for_each_16:
pushcp __gen_for_each_16_for_end
push 184
push 183
bg
jz
pop
push 184
pushc __def_const_gen_word_n247
gpm
pushcp __def_const_gen_word_n248
swp
pushcp _op_range
jc
pushai
peek 185
pushcp __gen_if_13_end
push 182
copy
gpm
swp
pop
pushcp __def_const_gen_word_n249
pushcp __def_const_gen_word_n250
newa
gpm
pcopy
pushc __def_const_gen_word_n251
gpm
swp
pushc __def_const_gen_word_n252
gpm
swp
peekai
pcopy
pushc __def_const_gen_word_n253
gpm
swp
pushc __def_const_gen_word_n254
gpm
swp
peekai
swp
pushcp _op_in
jc
jz
pop
pushc border_char
gpm
push 182
push 185
pushc __def_const_gen_word_n255
gpm
peek 0
pop
pushcp putch
jc
pushcp __gen_if_13_else_end
jp
__gen_if_13_end:
pushcp __gen_if_14_end
push 185
copy
gpm
swp
pop
pushcp __def_const_gen_word_n256
pushcp __def_const_gen_word_n257
newa
gpm
pcopy
pushc __def_const_gen_word_n258
gpm
swp
pushc __def_const_gen_word_n259
gpm
swp
peekai
pcopy
pushc __def_const_gen_word_n260
gpm
swp
pushc __def_const_gen_word_n261
gpm
swp
peekai
swp
pushcp _op_in
jc
jz
pop
pushc border_char
gpm
push 182
push 185
pushc __def_const_gen_word_n262
gpm
peek 0
pop
pushcp putch
jc
__gen_if_14_end:
__gen_if_13_else_end:
push 184
inc
pushcp __gen_for_each_16
jp
__gen_for_each_16_for_end:
push 181
inc
pushcp __gen_for_each_15
jp
__gen_for_each_15_for_end:
pushn
peek 180
peek 181
peek 182
peek 183
peek 184
peek 185
pop
__gen_drawborders_method_end:
jr
__gen_drawborders_method_end_block:
pushcp __gen_randfood_method_end_block
jp
randfood:
pushc __def_const_gen_word_n263
gpm
pushc __def_const_gen_word_n264
gpm
peek 0
pop
pushcp randomto
invoke
pushcp __def_const_gen_word_n265
swp
add
pushc __def_const_gen_word_n266
gpm
pushc __def_const_gen_word_n267
gpm
peek 0
pop
pushcp randomto
invoke
pushcp __def_const_gen_word_n268
swp
add
pushc __def_const_gen_word_n269
gpm
peek 0
pop
push 173
pushcp __class__child_set
push 173
pushai
jc
pushc __def_const_gen_word_n270
gpm
peek 186
pop
__gen_for_17:
pushcp __gen_for_17_for_end
push 186
copy
gpm
swp
pop
pushc __def_const_gen_word_n271
gpm
peek 0
pop
pushcp __class__child_body
push 172
pushai
pushcp __class__child_size
pushcp __class__child_body
push 172
pushai
pushai
jc
bg
gpm
jz
pop
pushcp __gen_if_15_end
pushcp __class__child_x
push 173
pushai
copy
gpm
swp
pop
pushcp __class__child_x
push 186
pushcp __class__child_items
pushcp __class__child_body
push 172
pushai
pushai
pushai
pushai
eq
gpm
peek 187
pop
pushcp __class__child_y
push 173
pushai
copy
gpm
swp
pop
pushcp __class__child_y
push 186
pushcp __class__child_items
pushcp __class__child_body
push 172
pushai
pushai
pushai
pushai
eq
gpm
peek 188
pop
push 187
copy
gpm
swp
pop
push 188
swp
and
jz
pop
pushc __def_const_gen_word_n272
gpm
peek 0
pop
pushcp randfood
jc
pushcp __gen_for_17_for_end
jp
__gen_if_15_end:
push 186
inc
pop
pushcp __gen_for_17
jp
__gen_for_17_for_end:
pushn
peek 186
peek 187
peek 188
pop
__gen_randfood_method_end:
jr
__gen_randfood_method_end_block:
pushcp __gen_movesnake_method_end_block
jp
movesnake:
peek 189
pop
peek 190
pop
pushc __def_const_gen_word_n273
gpm
peek 0
pop
pushcp __class__child_body
push 172
pushai
pushcp __class__child_peek_back
pushcp __class__child_body
push 172
pushai
pushai
jc
peek 191
pop
pushcp __class_point_allocator
jc
pcopy
pushcp __class__child_y
push 191
pushai
copy
gpm
swp
pop
push 190
swp
add
swp
pushcp __class__child_x
push 191
pushai
copy
gpm
swp
pop
push 189
swp
add
swp
pushc __def_const_gen_word_n274
gpm
peek 0
pop
pushcp point__create
jc
peek 192
pop
pushcp __gen_if_16_end
pushcp __class__child_x
push 192
pushai
copy
gpm
swp
pop
pushcp __class__child_x
push 173
pushai
eq
gpm
peek 193
pop
pushcp __class__child_y
push 192
pushai
copy
gpm
swp
pop
pushcp __class__child_y
push 173
pushai
eq
gpm
peek 194
pop
push 193
copy
gpm
swp
pop
push 194
swp
and
jz
pop
pushc __def_const_gen_word_n275
gpm
peek 0
pop
pushcp randfood
jc
pushc food_char
gpm
pushcp __class__child_y
push 173
pushai
pushcp __class__child_x
push 173
pushai
pushc __def_const_gen_word_n276
gpm
peek 0
pop
pushcp putch
jc
push 174
inc
pop
pushc __def_const_gen_str_n277
gpm
push 174
swp
add
pushcp __def_const_gen_str_n278
swp
add
pushc __def_const_gen_word_n279
gpm
pushc __def_const_gen_word_n280
gpm
pushc __def_const_gen_word_n281
gpm
peek 0
pop
pushcp putch
jc
pushcp __gen_if_16_else_end
jp
__gen_if_16_end:
pushc __def_const_gen_word_n282
gpm
peek 0
pop
pushcp __class__child_body
push 172
pushai
pushcp __class__child_pop_first
pushcp __class__child_body
push 172
pushai
pushai
jc
peek 195
pop
pushc __def_const_gen_str_n283
gpm
pushcp __class__child_y
push 195
pushai
pushcp __class__child_x
push 195
pushai
pushc __def_const_gen_word_n284
gpm
peek 0
pop
pushcp putch
jc
pushc __def_const_gen_word_n285
gpm
peek 196
pop
__gen_for_18:
pushcp __gen_for_18_for_end
push 196
copy
gpm
swp
pop
pushc __def_const_gen_word_n286
gpm
peek 0
pop
pushcp __class__child_body
push 172
pushai
pushcp __class__child_size
pushcp __class__child_body
push 172
pushai
pushai
jc
bg
gpm
jz
pop
pushcp __gen_if_17_end
pushcp __class__child_x
push 192
pushai
copy
gpm
swp
pop
pushcp __class__child_x
push 196
pushcp __class__child_items
pushcp __class__child_body
push 172
pushai
pushai
pushai
pushai
eq
gpm
peek 193
pop
pushcp __class__child_y
push 192
pushai
copy
gpm
swp
pop
pushcp __class__child_y
push 196
pushcp __class__child_items
pushcp __class__child_body
push 172
pushai
pushai
pushai
pushai
eq
gpm
peek 194
pop
push 193
copy
gpm
swp
pop
push 194
swp
and
jz
pop
pushc true
gpm
push 176
mov
__gen_if_17_end:
push 196
inc
pop
pushcp __gen_for_18
jp
__gen_for_18_for_end:
pushcp __gen_if_18_end
pushcp __class__child_x
push 192
pushai
copy
gpm
swp
pop
pushcp __def_const_gen_word_n287
pushcp __def_const_gen_word_n288
newa
gpm
pcopy
pushc __def_const_gen_word_n289
gpm
swp
pushc __def_const_gen_word_n290
gpm
swp
peekai
pcopy
pushc __def_const_gen_word_n291
gpm
swp
pushc __def_const_gen_word_n292
gpm
swp
peekai
swp
pushcp _op_in
jc
peek 193
pop
pushcp __class__child_y
push 192
pushai
copy
gpm
swp
pop
pushcp __def_const_gen_word_n293
pushcp __def_const_gen_word_n294
newa
gpm
pcopy
pushc __def_const_gen_word_n295
gpm
swp
pushc __def_const_gen_word_n296
gpm
swp
peekai
pcopy
pushc __def_const_gen_word_n297
gpm
swp
pushc __def_const_gen_word_n298
gpm
swp
peekai
swp
pushcp _op_in
jc
peek 194
pop
push 193
copy
gpm
swp
pop
push 194
swp
or
jz
pop
pushc true
gpm
push 176
mov
__gen_if_18_end:
__gen_if_16_else_end:
pushc food_char
gpm
pushcp __class__child_y
push 173
pushai
pushcp __class__child_x
push 173
pushai
pushc __def_const_gen_word_n299
gpm
peek 0
pop
pushcp putch
jc
pushc snake_char
gpm
pushcp __class__child_y
push 192
pushai
pushcp __class__child_x
push 192
pushai
pushc __def_const_gen_word_n300
gpm
peek 0
pop
pushcp putch
jc
push 192
pushc __def_const_gen_word_n301
gpm
peek 0
pop
pushcp __class__child_body
push 172
pushai
pushcp __class__child_push_back
pushcp __class__child_body
push 172
pushai
pushai
jc
pushn
peek 189
peek 190
peek 191
peek 192
peek 193
peek 194
peek 195
peek 196
pop
__gen_movesnake_method_end:
jr
__gen_movesnake_method_end_block:
pushcp __gen_gametick_method_end_block
jp
gametick:
pushcp __def_const_gen_word_n302
pushcp __class__child_movingvector
push 172
pushai
push 170
pushai
pushai
pushcp __def_const_gen_word_n303
pushcp __class__child_movingvector
push 172
pushai
push 170
pushai
pushai
pushc __def_const_gen_word_n304
gpm
peek 0
pop
pushcp movesnake
jc
pushn
pop
__gen_gametick_method_end:
jr
__gen_gametick_method_end_block:
pushcp __gen_controlthread_method_end_block
jp
controlthread:
__gen_while_6:
pushcp __gen_while_6_end
push 176
copy
gpm
swp
pop
not
jz
pop
pushc __def_const_gen_word_n305
gpm
peek 0
pop
pushcp crt.readkey
invoke
pushc __def_const_gen_word_n306
gpm
peek 0
pop
pushcp strupper
invoke
peek 197
pop
pushcp __gen_if_19_end
pushcp __class__child_movingvector
push 172
pushai
copy
gpm
swp
pop
pushcp __def_const_gen_word_n307
pushcp __def_const_gen_word_n308
newa
gpm
pcopy
pushc smvleft
gpm
swp
pushc __def_const_gen_word_n309
gpm
swp
peekai
pcopy
pushc smvright
gpm
swp
pushc __def_const_gen_word_n310
gpm
swp
peekai
swp
pushcp _op_in
jc
jz
pop
__gen_switch_1:
push 197
__gen_case_3:
pcopy
pushc __def_const_gen_str_n311
gpm
eq
gpm
pushcp __gen_case_3_end
swp
jz
pop
pushc smvup
gpm
pushcp __class__child_movingvector
push 172
pushai
mov
pushcp __gen_switch_1_end
jp
__gen_case_3_end:
__gen_case_4:
pcopy
pushc __def_const_gen_str_n312
gpm
eq
gpm
pushcp __gen_case_4_end
swp
jz
pop
pushc smvdown
gpm
pushcp __class__child_movingvector
push 172
pushai
mov
pushcp __gen_switch_1_end
jp
__gen_case_4_end:
__gen_switch_1_end:
pop
__gen_if_19_end:
pushcp __gen_if_20_end
pushcp __class__child_movingvector
push 172
pushai
copy
gpm
swp
pop
pushcp __def_const_gen_word_n313
pushcp __def_const_gen_word_n314
newa
gpm
pcopy
pushc smvup
gpm
swp
pushc __def_const_gen_word_n315
gpm
swp
peekai
pcopy
pushc smvdown
gpm
swp
pushc __def_const_gen_word_n316
gpm
swp
peekai
swp
pushcp _op_in
jc
jz
pop
__gen_switch_2:
push 197
__gen_case_5:
pcopy
pushc __def_const_gen_str_n317
gpm
eq
gpm
pushcp __gen_case_5_end
swp
jz
pop
pushc smvleft
gpm
pushcp __class__child_movingvector
push 172
pushai
mov
pushcp __gen_switch_2_end
jp
__gen_case_5_end:
__gen_case_6:
pcopy
pushc __def_const_gen_str_n318
gpm
eq
gpm
pushcp __gen_case_6_end
swp
jz
pop
pushc smvright
gpm
pushcp __class__child_movingvector
push 172
pushai
mov
pushcp __gen_switch_2_end
jp
__gen_case_6_end:
__gen_switch_2_end:
pop
__gen_if_20_end:
pushc __def_const_gen_word_n319
gpm
pushc __def_const_gen_word_n320
gpm
peek 0
pop
pushcp sleep
invoke
pushc __def_const_gen_word_n321
gpm
peek 0
pop
pushcp gc
jc
pushcp __gen_while_6
jp
__gen_while_6_end:
pushn
peek 197
pop
__gen_controlthread_method_end:
jr
__gen_controlthread_method_end_block:
pushcp __gen_rungame_method_end_block
jp
rungame:
pushc __def_const_gen_word_n322
gpm
peek 0
pop
pushcp randomize
invoke
pushcp __class_snake_allocator
jc
pcopy
pushc __def_const_gen_word_n323
gpm
peek 0
pop
pushcp snake__create
jc
peek 172
pop
pushcp __class_point_allocator
jc
pcopy
pushc __def_const_gen_word_n324
gpm
pushc __def_const_gen_word_n325
gpm
peek 0
pop
pushcp randomto
invoke
pushcp __def_const_gen_word_n326
swp
add
swp
pushc __def_const_gen_word_n327
gpm
pushc __def_const_gen_word_n328
gpm
peek 0
pop
pushcp randomto
invoke
pushcp __def_const_gen_word_n329
swp
add
swp
pushc __def_const_gen_word_n330
gpm
peek 0
pop
pushcp point__create
jc
peek 173
pop
pushc false
gpm
peek 176
pop
pushc __def_const_gen_word_n331
gpm
peek 174
pop
pushc __def_const_gen_word_n332
gpm
peek 175
pop
pushc controlthread
gpm
pushc __def_const_gen_word_n333
gpm
peek 0
pop
pushcp async
jc
peek 198
pop
pushc crt.white
gpm
pushc __def_const_gen_word_n334
gpm
peek 0
pop
pushcp crt.textbackground
invoke
pushc __def_const_gen_word_n335
gpm
peek 0
pop
pushcp crt.clrscr
invoke
pushc crt.black
gpm
pushc __def_const_gen_word_n336
gpm
peek 0
pop
pushcp crt.textcolor
invoke
pushc crt.black
gpm
pushc __def_const_gen_word_n337
gpm
peek 0
pop
pushcp crt.textbackground
invoke
pushc __def_const_gen_word_n338
gpm
peek 0
pop
pushcp drawborders
jc
pushc crt.white
gpm
pushc __def_const_gen_word_n339
gpm
peek 0
pop
pushcp crt.textbackground
invoke
pushc snake_char
gpm
pushcp __class__child_y
pushcp __def_const_gen_word_n340
pushcp __class__child_items
pushcp __class__child_body
push 172
pushai
pushai
pushai
pushai
pushcp __class__child_x
pushcp __def_const_gen_word_n341
pushcp __class__child_items
pushcp __class__child_body
push 172
pushai
pushai
pushai
pushai
pushc __def_const_gen_word_n342
gpm
peek 0
pop
pushcp putch
jc
pushc snake_char
gpm
pushcp __class__child_y
pushcp __def_const_gen_word_n343
pushcp __class__child_items
pushcp __class__child_body
push 172
pushai
pushai
pushai
pushai
pushcp __class__child_x
pushcp __def_const_gen_word_n344
pushcp __class__child_items
pushcp __class__child_body
push 172
pushai
pushai
pushai
pushai
pushc __def_const_gen_word_n345
gpm
peek 0
pop
pushcp putch
jc
pushc snake_char
gpm
pushcp __class__child_y
pushcp __def_const_gen_word_n346
pushcp __class__child_items
pushcp __class__child_body
push 172
pushai
pushai
pushai
pushai
pushcp __class__child_x
pushcp __def_const_gen_word_n347
pushcp __class__child_items
pushcp __class__child_body
push 172
pushai
pushai
pushai
pushai
pushc __def_const_gen_word_n348
gpm
peek 0
pop
pushcp putch
jc
pushc food_char
gpm
pushcp __class__child_y
push 173
pushai
pushcp __class__child_x
push 173
pushai
pushc __def_const_gen_word_n349
gpm
peek 0
pop
pushcp putch
jc
pushc __def_const_gen_str_n350
gpm
pushc __def_const_gen_word_n351
gpm
pushc __def_const_gen_word_n352
gpm
pushc __def_const_gen_word_n353
gpm
peek 0
pop
pushcp putch
jc
pushc __def_const_gen_str_n354
gpm
pushc __def_const_gen_word_n355
gpm
pushc __def_const_gen_word_n356
gpm
pushc __def_const_gen_word_n357
gpm
peek 0
pop
pushcp putch
jc
pushc __def_const_gen_str_n358
gpm
pushc __def_const_gen_word_n359
gpm
pushc __def_const_gen_word_n360
gpm
pushc __def_const_gen_word_n361
gpm
peek 0
pop
pushcp putch
jc
__gen_while_7:
pushcp __gen_while_7_end
push 176
copy
gpm
swp
pop
not
jz
pop
pushc __def_const_gen_word_n362
gpm
peek 0
pop
pushcp crt.cursoroff
invoke
push 175
pushc __def_const_gen_word_n363
gpm
peek 0
pop
pushcp sleep
invoke
pushc __def_const_gen_word_n364
gpm
peek 0
pop
pushcp gametick
jc
pushc __def_const_gen_word_n365
gpm
peek 0
pop
pushcp gc
jc
pushcp __gen_while_7
jp
__gen_while_7_end:
pushc crt.white
gpm
pushc __def_const_gen_word_n366
gpm
peek 0
pop
pushcp crt.textcolor
invoke
pushc crt.black
gpm
pushc __def_const_gen_word_n367
gpm
peek 0
pop
pushcp crt.textbackground
invoke
pushc __def_const_gen_word_n368
gpm
peek 0
pop
pushcp crt.clrscr
invoke
pushc __def_const_gen_word_n369
gpm
peek 0
pop
pushcp crt.cursoron
invoke
pushc __def_const_gen_str_n370
gpm
pushc __def_const_gen_word_n371
gpm
pushc __def_const_gen_word_n372
gpm
pushc __def_const_gen_word_n373
gpm
peek 0
pop
pushcp putch
jc
pushc __def_const_gen_str_n374
gpm
push 174
swp
add
pushcp __def_const_gen_str_n375
swp
add
pushc __def_const_gen_word_n376
gpm
pushc __def_const_gen_word_n377
gpm
pushc __def_const_gen_word_n378
gpm
peek 0
pop
pushcp putch
jc
pushc __def_const_gen_word_n379
gpm
peek 0
pop
push 198
pushcp __class__child_waitfor
push 198
pushai
jc
pushc __def_const_gen_word_n380
gpm
peek 0
pop
pushcp crt.readkey
invoke
pushn
peek 198
pop
__gen_rungame_method_end:
jr
__gen_rungame_method_end_block:
pushcp __gen_main_method_end_block
jp
main:
__gen_while_8:
pushcp __gen_while_8_end
pushc true
gpm
jz
pop
pushc __def_const_gen_word_n381
gpm
peek 0
pop
pushcp rungame
jc
pushc __def_const_gen_word_n382
gpm
peek 0
pop
pushcp gc
jc
pushcp __gen_while_8
jp
__gen_while_8_end:
pushn
pop
__gen_main_method_end:
jr
__gen_main_method_end_block:
pushcp __entrypoint
jc
pushcp __haltpoint
jp
_common_class_constructor:
pop
jr
__class_exception_allocator:
pushcp __def_const_gen_word_n383
pushcp __def_const_gen_word_n384
newa
typemarkclass
pcopy
pushcp exception
swp
pushcp __class__child_type
swp
peekai
pcopy
pushcp exception__create
swp
pushcp __class__child_create
swp
peekai
__gen___class_exception_allocator_method_end:
jr
__class_vector_allocator:
pushcp __def_const_gen_word_n385
pushcp __def_const_gen_word_n386
newa
typemarkclass
pcopy
pushcp vector
swp
pushcp __class__child_type
swp
peekai
pcopy
pushcp class__gethash
swp
pushcp __class__child_gethash
swp
peekai
pcopy
pushcp vector__create
swp
pushcp __class__child_create
swp
peekai
pcopy
pushcp vector__push_back
swp
pushcp __class__child_push_back
swp
peekai
pcopy
pushcp vector__rem_back
swp
pushcp __class__child_rem_back
swp
peekai
pcopy
pushcp vector__rem_first
swp
pushcp __class__child_rem_first
swp
peekai
pcopy
pushcp vector__foreach
swp
pushcp __class__child_foreach
swp
peekai
pcopy
pushcp vector__pop_back
swp
pushcp __class__child_pop_back
swp
peekai
pcopy
pushcp vector__pop_first
swp
pushcp __class__child_pop_first
swp
peekai
pcopy
pushcp vector__peek_back
swp
pushcp __class__child_peek_back
swp
peekai
pcopy
pushcp vector__peek_first
swp
pushcp __class__child_peek_first
swp
peekai
pcopy
pushcp vector__at
swp
pushcp __class__child_at
swp
peekai
pcopy
pushcp vector__size
swp
pushcp __class__child_size
swp
peekai
__gen___class_vector_allocator_method_end:
jr
__class_point_allocator:
pushcp __def_const_gen_word_n387
pushcp __def_const_gen_word_n388
newa
typemarkclass
pcopy
pushcp point
swp
pushcp __class__child_type
swp
peekai
pcopy
pushcp class__gethash
swp
pushcp __class__child_gethash
swp
peekai
pcopy
pushcp point__create
swp
pushcp __class__child_create
swp
peekai
pcopy
pushcp point__set
swp
pushcp __class__child_set
swp
peekai
pcopy
pushcp point__compare
swp
pushcp __class__child_compare
swp
peekai
__gen___class_point_allocator_method_end:
jr
__class_tasynccallthread_allocator:
pushcp __def_const_gen_word_n389
pushcp __def_const_gen_word_n390
newa
typemarkclass
pcopy
pushcp tasynccallthread
swp
pushcp __class__child_type
swp
peekai
pcopy
pushcp tasynccallthread__create
swp
pushcp __class__child_create
swp
peekai
pcopy
pushcp tasynccallthread__execute
swp
pushcp __class__child_execute
swp
peekai
pcopy
pushcp tthread__suspend
swp
pushcp __class__child_suspend
swp
peekai
pcopy
pushcp tthread__resume
swp
pushcp __class__child_resume
swp
peekai
pcopy
pushcp tthread__terminate
swp
pushcp __class__child_terminate
swp
peekai
pcopy
pushcp tthread__waitfor
swp
pushcp __class__child_waitfor
swp
peekai
pcopy
pushcp tthread__rejoin
swp
pushcp __class__child_rejoin
swp
peekai
pcopy
pushcp tthread__setpriority
swp
pushcp __class__child_setpriority
swp
peekai
__gen___class_tasynccallthread_allocator_method_end:
jr
__class_tqthreadcallthread_allocator:
pushcp __def_const_gen_word_n391
pushcp __def_const_gen_word_n392
newa
typemarkclass
pcopy
pushcp tqthreadcallthread
swp
pushcp __class__child_type
swp
peekai
pcopy
pushcp tqthreadcallthread__create
swp
pushcp __class__child_create
swp
peekai
pcopy
pushcp tqthreadcallthread__execute
swp
pushcp __class__child_execute
swp
peekai
pcopy
pushcp tthread__suspend
swp
pushcp __class__child_suspend
swp
peekai
pcopy
pushcp tthread__resume
swp
pushcp __class__child_resume
swp
peekai
pcopy
pushcp tthread__terminate
swp
pushcp __class__child_terminate
swp
peekai
pcopy
pushcp tthread__waitfor
swp
pushcp __class__child_waitfor
swp
peekai
pcopy
pushcp tthread__rejoin
swp
pushcp __class__child_rejoin
swp
peekai
pcopy
pushcp tthread__setpriority
swp
pushcp __class__child_setpriority
swp
peekai
__gen___class_tqthreadcallthread_allocator_method_end:
jr
__class_snake_allocator:
pushcp __def_const_gen_word_n393
pushcp __def_const_gen_word_n394
newa
typemarkclass
pcopy
pushcp snake
swp
pushcp __class__child_type
swp
peekai
pcopy
pushcp snake__create
swp
pushcp __class__child_create
swp
peekai
__gen___class_snake_allocator_method_end:
jr
__haltpoint:
stkdrop
gc
