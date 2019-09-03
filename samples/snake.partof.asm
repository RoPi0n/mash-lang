word __addrtsz 504
pushc __addrtsz
gpm
msz
gc



pushc __defc_gen_word_n0
gpm

peek 0
pop
pushc __getvm_null
gpm
jc
peek 1
pop








pushc __defc_gen_word_n377
gpm

pushc __defc_gen_word_n378
gpm

peek 0
pop
pushcp c_chr
jc


pushc __defc_gen_word_n379
gpm

pushc __defc_gen_word_n380
gpm

peek 0
pop
pushcp c_chr
jc
swp
add

pushc __defc_gen_word_n381
gpm

peek 0
pop
pushc new
gpm
jc
peek 306
pop




pushc __defc_gen_word_n626
peek 474
pop

pushc __defc_gen_word_n627
peek 475
pop


pushcp __class_tcriticalsection_allocator
jc
pcopy


pushc __defc_gen_word_n628
gpm

peek 0
pop
pushcp tcriticalsection__create
jc
peek 477
pop

pushc false
peek 478
pop

pushc false
peek 479
pop

import _i2s "bf.lib" "INTTOSTR"
import _f2s "bf.lib" "FLOATTOSTR"
import _s2i "bf.lib" "STRTOINT"
import _s2f "bf.lib" "STRTOFLOAT"
import halt "bf.lib" "HALT"
import sleep "bf.lib" "SLEEP"
import _strupper "bf.lib" "STRUPPER"
import _strlower "bf.lib" "STRLOWER"
import _now "bf.lib" "CURRENTDATETIME"
import randomize "bf.lib" "RANDOMIZE"
import _random "bf.lib" "RANDOM"
import _randomb "bf.lib" "RANDOMB"
import _tickcnt "bf.lib" "TICKCNT"
int true -1
int false 0
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
word typeptr 255
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

pushc __defc_gen_word_n3
gpm

peek 0
pop
pushcp len
jc

peek 16
pop

pushc __defc_gen_word_n4
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

pushc __defc_gen_word_n5
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

pushcp __defc_gen_word_n6
swp
add

pushcp __defc_gen_word_n7
newa

peek 20
pop

push 18

pushc __defc_gen_word_n8
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

pushc __defc_gen_word_n9
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

pushcp __defc_gen_word_n10
swp
add

pushcp __defc_gen_word_n11
newa

peek 20
pop

push 18

pushc __defc_gen_word_n12
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

pushc __defc_gen_word_n13
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

pushc __defc_gen_word_n14
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

pushcp __defc_gen_word_n15
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



pushcp __defc_gen_word_n16

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

pushcp __defc_gen_word_n17
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


pushc __defc_gen_word_n18
gpm

peek 29
pop



push 28

pushc __defc_gen_word_n19
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

pushc __defc_gen_word_n20
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

pushcp __defc_gen_word_n21
newa

peek 37
pop


pushc __defc_gen_word_n22
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


pushc __defc_gen_word_n23
gpm

peek 0
pop
pushcp main
jc


pushc __defc_gen_word_n24
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


pushc __defc_gen_word_n25
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


pushc __defc_gen_word_n26
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


pushc __defc_gen_word_n27
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


pushc __defc_gen_word_n28
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


pushc __defc_gen_word_n29
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


pushc __defc_gen_word_n30
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


pushc __defc_gen_word_n31
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


pushc __defc_gen_word_n32
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


pushc __defc_gen_word_n33
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


pushc __defc_gen_word_n34
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
import crt.cursorbig "crt.lib" "CURSORBIG"
import crt.cursoroff "crt.lib" "CURSOROFF"
import crt.cursoron "crt.lib" "CURSORON"
import crt.delline "crt.lib" "DELLINE"
import _crt.gotoxy32 "crt.lib" "GOTOXY32"
import crt.insline "crt.lib" "INSLINE"
import _crt.keypressed "crt.lib" "KEYPRESSED"
import _crt.readkey "crt.lib" "READKEY"
import crt.sound "crt.lib" "SOUND"
import _crt.wherex32 "crt.lib" "WHEREX32"
import _crt.wherey32 "crt.lib" "WHEREY32"
import crt.window32 "crt.lib" "WINDOW32"
import crt.clreol "crt.lib" "CLREOL"
import crt.clrscr "crt.lib" "CLRSCR"
import _crt.getdirectvideo "crt.lib" "GETDIRECTVIDEO"
import _crt.getlastmode "crt.lib" "GETLASTMODE"
import crt.settextattr "crt.lib" "SETTEXTATTR"
import _crt.gettextattr "crt.lib" "GETTEXTATTR"
import _crt.getwindmax "crt.lib" "GETWINDMAX"
import _crt.getwindmaxx "crt.lib" "GETWINDMAXX"
import _crt.getwindmaxy "crt.lib" "GETWINDMAXY"
import _crt.getwindmin "crt.lib" "GETWINDMIN"
import _crt.getwindminx "crt.lib" "GETWINDMINX"
import _crt.getwindminy "crt.lib" "GETWINDMINY"
import _crt.getcheckbreak "crt.lib" "GETCHECKBREAK"
import _crt.getcheckeof "crt.lib" "GETCHECKEOF"
import _crt.getchecksnow "crt.lib" "GETCHECKSNOW"
import crt.textcolor "crt.lib" "SETTEXTCOLOR"
import crt.textbackground "crt.lib" "SETTEXTBACKGROUND"
import _print "crt.lib" "PRINT"
import _println "crt.lib" "PRINTLN"
import _input "crt.lib" "INPUT"
import _inputln "crt.lib" "INPUTLN"
word crt.bw40 0
word crt.co40 1
word crt.bw80 2
word crt.co80 3
word crt.mono 7
word crt.font8x8 256
word crt.black 0
word crt.blue 1
word crt.green 2
word crt.cyan 3
word crt.red 4
word crt.magenta 5
word crt.brown 6
word crt.lightgray 7
word crt.darkgray 8
word crt.lightblue 9
word crt.lightgreen 10
word crt.lightcyan 11
word crt.lightred 12
word crt.lightmagenta 13
word crt.yellow 14
word crt.white 15
word crt.blink 128
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

pushcp __defc_gen_word_n35
swp
bg
gpm
jz
pop


pushc __defc_gen_word_n36
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

pushcp __defc_gen_word_n37
swp
bg
gpm
jz
pop


pushc __defc_gen_word_n38
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


pushc __defc_gen_str_n39
gpm

pushc __defc_gen_word_n40
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



pushc __defc_gen_word_n41
gpm

peek 0
pop
pushcp _crt.keypressed
invoke

pushc __defc_gen_word_n42
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



pushc __defc_gen_word_n43
gpm

peek 0
pop
pushcp _crt.readkey
invoke

pushc __defc_gen_word_n44
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



pushc __defc_gen_word_n45
gpm

peek 0
pop
pushcp _crt.wherex32
invoke

pushc __defc_gen_word_n46
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



pushc __defc_gen_word_n47
gpm

peek 0
pop
pushcp _crt.wherey32
invoke

pushc __defc_gen_word_n48
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



pushc __defc_gen_word_n49
gpm

peek 0
pop
pushcp _crt.getdirectvideo
invoke

pushc __defc_gen_word_n50
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



pushc __defc_gen_word_n51
gpm

peek 0
pop
pushcp _crt.getlastmode
invoke

pushc __defc_gen_word_n52
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



pushc __defc_gen_word_n53
gpm

peek 0
pop
pushcp _crt.gettextattr
invoke

pushc __defc_gen_word_n54
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



pushc __defc_gen_word_n55
gpm

peek 0
pop
pushcp _crt.getwindmax
invoke

pushc __defc_gen_word_n56
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



pushc __defc_gen_word_n57
gpm

peek 0
pop
pushcp _crt.getwindmaxx
invoke

pushc __defc_gen_word_n58
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



pushc __defc_gen_word_n59
gpm

peek 0
pop
pushcp _crt.getwindmaxy
invoke

pushc __defc_gen_word_n60
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



pushc __defc_gen_word_n61
gpm

peek 0
pop
pushcp _crt.getwindmin
invoke

pushc __defc_gen_word_n62
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



pushc __defc_gen_word_n63
gpm

peek 0
pop
pushcp _crt.getwindminx
invoke

pushc __defc_gen_word_n64
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



pushc __defc_gen_word_n65
gpm

peek 0
pop
pushcp _crt.getwindminy
invoke

pushc __defc_gen_word_n66
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



pushc __defc_gen_word_n67
gpm

peek 0
pop
pushcp _crt.getcheckbreak
invoke

pushc __defc_gen_word_n68
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



pushc __defc_gen_word_n69
gpm

peek 0
pop
pushcp _crt.getcheckeof
invoke

pushc __defc_gen_word_n70
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



pushc __defc_gen_word_n71
gpm

peek 0
pop
pushcp _crt.getchecksnow
invoke

pushc __defc_gen_word_n72
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



pushc __defc_gen_word_n73
gpm

peek 0
pop
pushcp _input
invoke

pushc __defc_gen_word_n74
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



pushc __defc_gen_word_n75
gpm

peek 0
pop
pushcp _inputln
invoke

pushc __defc_gen_word_n76
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


pushc __defc_gen_word_n77
gpm

pushc __defc_gen_word_n78
gpm

peek 0
pop
pushcp crt.textcolor
invoke


pushc __defc_gen_word_n79
gpm

pushc __defc_gen_word_n80
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


pushcp __defc_gen_word_n81


pushc __defc_gen_word_n82
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


pushcp __defc_gen_word_n83


pushc __defc_gen_word_n84
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


pushc __defc_gen_word_n85
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

pushc __defc_gen_word_n86
gpm

peek 0
pop
pushcp _crt.gotoxy32
invoke
__gen_crt.gotoxy_method_end:
jr
__gen_crt.gotoxy_method_end_block:
pushcp __gen_class__gethash_method_end_block
jp
class__gethash:
peek 47
pop




push 47

pushc __defc_gen_word_n87
gpm

peek 0
pop
pushcp len
jc


push 47

pushc __defc_gen_word_n88
gpm

peek 0
pop
pushcp ptr
jc
swp
xor
peek 48
pop


pushcp __class__child_type
push 47
pushai

push 48
copy
gpm
swp
pop
mul
peek 49
pop

push 49
copy
gpm
swp
pop
jr
__gen_class__gethash_method_end:
jr
__gen_class__gethash_method_end_block:


pushcp __gen_point__create_method_end_block
jp
point__create:
peek 50
pop
peek 51
pop
peek 52
pop



push 51

pushc __defc_gen_word_n89
gpm

peek 0
pop
pushcp new
jc


pushcp __class__child_x
push 50
peekai



push 52

pushc __defc_gen_word_n90
gpm

peek 0
pop
pushcp new
jc


pushcp __class__child_y
push 50
peekai
__gen_point__create_method_end:
jr
__gen_point__create_method_end_block:
pushcp __gen_point__free_method_end_block
jp
point__free:
peek 53
pop


push 53


pushcp __class__child_y
push 53
pushai


pushcp __class__child_x
push 53
pushai

pushc __defc_gen_word_n91
gpm

peek 0
pop
pushcp free
jc
__gen_point__free_method_end:
jr
__gen_point__free_method_end_block:
pushcp __gen_point__set_method_end_block
jp
point__set:
peek 54
pop
peek 55
pop
peek 56
pop


push 55


pushcp __class__child_x
push 54
pushai
mov


push 56


pushcp __class__child_y
push 54
pushai
mov
__gen_point__set_method_end:
jr
__gen_point__set_method_end_block:
pushcp __gen_point__compare_method_end_block
jp
point__compare:
peek 57
pop
peek 58
pop




pushcp __class__child_x
push 57
pushai
copy
gpm
swp
pop


pushcp __class__child_x
push 58
pushai
eq
gpm
peek 59
pop



pushcp __class__child_y
push 57
pushai
copy
gpm
swp
pop


pushcp __class__child_y
push 58
pushai
eq
gpm
peek 60
pop

push 59
copy
gpm
swp
pop

push 60
swp
and
jr
__gen_point__compare_method_end:
jr
__gen_point__compare_method_end_block:
pushcp __gen_point3__create_method_end_block
jp
point3__create:
peek 61
pop
peek 62
pop
peek 63
pop
peek 64
pop


push 63

push 62

push 61

pushc __defc_gen_word_n92
gpm

peek 0
pop
pushcp point__create
jc



push 64

pushc __defc_gen_word_n93
gpm

peek 0
pop
pushcp new
jc


pushcp __class__child_z
push 61
peekai
__gen_point3__create_method_end:
jr
__gen_point3__create_method_end_block:
pushcp __gen_point3__free_method_end_block
jp
point3__free:
peek 65
pop



pushcp __class__child_z
push 65
pushai

pushc __defc_gen_word_n94
gpm

peek 0
pop
pushcp free
jc


push 65

pushc __defc_gen_word_n95
gpm

peek 0
pop
pushcp point__free
jc
__gen_point3__free_method_end:
jr
__gen_point3__free_method_end_block:
pushcp __gen_point3__compare_method_end_block
jp
point3__compare:
peek 66
pop
peek 67
pop




pushcp __class__child_z
push 66
pushai
copy
gpm
swp
pop


pushcp __class__child_z
push 67
pushai
eq
gpm
peek 68
pop

push 68
copy
gpm
swp
pop


push 67

push 66

pushc __defc_gen_word_n96
gpm

peek 0
pop
pushcp point__compare
jc
swp
and
jr
__gen_point3__compare_method_end:
jr
__gen_point3__compare_method_end_block:


pushcp __gen_vector__create_method_end_block
jp
vector__create:
peek 69
pop



pushcp __defc_gen_word_n97

pushcp __defc_gen_word_n98
newa


pushcp __class__child_items
push 69
peekai



pushc __defc_gen_word_n99
gpm

pushc __defc_gen_word_n100
gpm

peek 0
pop
pushcp new
jc


pushcp __defc_gen_word_n101
pushcp __class__child_items
push 69
pushai
peekai
__gen_vector__create_method_end:
jr
__gen_vector__create_method_end_block:
pushcp __gen_vector__push_back_method_end_block
jp
vector__push_back:
peek 70
pop
peek 71
pop




pushcp __defc_gen_word_n102
pushcp __class__child_items
push 70
pushai
pushai
copy
gpm
swp
pop

pushcp __defc_gen_word_n103
swp
add


pushcp __class__child_items
push 70
pushai

pushc __defc_gen_word_n104
gpm

peek 0
pop
pushcp setlen
jc




pushcp __defc_gen_word_n105
pushcp __class__child_items
push 70
pushai
pushai
inc
pop


push 71



pushcp __defc_gen_word_n106
pushcp __class__child_items
push 70
pushai
pushai
pushcp __class__child_items
push 70
pushai
peekai
__gen_vector__push_back_method_end:
jr
__gen_vector__push_back_method_end_block:
pushcp __gen_vector__pop_back_method_end_block
jp
vector__pop_back:
peek 72
pop




pushcp __defc_gen_word_n107
pushcp __class__child_items
push 72
pushai
pushai
pushcp __class__child_items
push 72
pushai
pushai

peek 73
pop



pushcp __defc_gen_word_n108
pushcp __class__child_items
push 72
pushai
pushai


pushcp __class__child_items
push 72
pushai

pushc __defc_gen_word_n109
gpm

peek 0
pop
pushcp setlen
jc




pushcp __defc_gen_word_n110
pushcp __class__child_items
push 72
pushai
pushai
dec
pop

push 73
jr
__gen_vector__pop_back_method_end:
jr
__gen_vector__pop_back_method_end_block:
pushcp __gen_vector__pop_first_method_end_block
jp
vector__pop_first:
peek 74
pop



pushcp __defc_gen_word_n111
pushcp __class__child_items
push 74
pushai
pushai

peek 75
pop

pushc __defc_gen_word_n112
gpm

peek 76
pop
__gen_for_3:
pushcp __gen_for_3_for_end


push 76
copy
gpm
swp
pop


pushcp __defc_gen_word_n113
pushcp __class__child_items
push 74
pushai
pushai
bg
gpm
jz
pop






push 76
copy
gpm
swp
pop

pushcp __defc_gen_word_n114
swp
add
pushcp __class__child_items
push 74
pushai
pushai


push 76
pushcp __class__child_items
push 74
pushai
peekai

push 76
inc
pop
pushcp __gen_for_3
jp
__gen_for_3_for_end:




pushcp __defc_gen_word_n115
pushcp __class__child_items
push 74
pushai
pushai


pushcp __class__child_items
push 74
pushai

pushc __defc_gen_word_n116
gpm

peek 0
pop
pushcp setlen
jc




pushcp __defc_gen_word_n117
pushcp __class__child_items
push 74
pushai
pushai
dec
pop

push 75
jr
__gen_vector__pop_first_method_end:
jr
__gen_vector__pop_first_method_end_block:
pushcp __gen_vector__peek_back_method_end_block
jp
vector__peek_back:
peek 77
pop



pushcp __defc_gen_word_n118
pushcp __class__child_items
push 77
pushai
pushai
pushcp __class__child_items
push 77
pushai
pushai
jr
__gen_vector__peek_back_method_end:
jr
__gen_vector__peek_back_method_end_block:
pushcp __gen_vector__peek_first_method_end_block
jp
vector__peek_first:
peek 78
pop


pushcp __defc_gen_word_n119
pushcp __class__child_items
push 78
pushai
pushai
jr
__gen_vector__peek_first_method_end:
jr
__gen_vector__peek_first_method_end_block:
pushcp __gen_vector__rem_first_method_end_block
jp
vector__rem_first:
peek 79
pop

pushc __defc_gen_word_n120
gpm

peek 80
pop
__gen_for_4:
pushcp __gen_for_4_for_end


push 80
copy
gpm
swp
pop


pushcp __defc_gen_word_n121
pushcp __class__child_items
push 79
pushai
pushai
bg
gpm
jz
pop






push 80
copy
gpm
swp
pop

pushcp __defc_gen_word_n122
swp
add
pushcp __class__child_items
push 79
pushai
pushai


push 80
pushcp __class__child_items
push 79
pushai
peekai

push 80
inc
pop
pushcp __gen_for_4
jp
__gen_for_4_for_end:




pushcp __defc_gen_word_n123
pushcp __class__child_items
push 79
pushai
pushai


pushcp __class__child_items
push 79
pushai

pushc __defc_gen_word_n124
gpm

peek 0
pop
pushcp setlen
jc




pushcp __defc_gen_word_n125
pushcp __class__child_items
push 79
pushai
pushai
dec
pop
__gen_vector__rem_first_method_end:
jr
__gen_vector__rem_first_method_end_block:
pushcp __gen_vector__foreach_method_end_block
jp
vector__foreach:
peek 81
pop
peek 82
pop

pushc __defc_gen_word_n126
gpm

peek 83
pop
__gen_for_5:
pushcp __gen_for_5_for_end


push 83
copy
gpm
swp
pop


pushcp __defc_gen_word_n127
pushcp __class__child_items
push 81
pushai
pushai
be
gpm
jz
pop




push 83
pushcp __class__child_items
push 81
pushai
pushai

push 82

pushc __defc_gen_word_n128
gpm

peek 0
pop
pushcp vcall
jc

push 83
inc
pop
pushcp __gen_for_5
jp
__gen_for_5_for_end:

__gen_vector__foreach_method_end:
jr
__gen_vector__foreach_method_end_block:
pushcp __gen_vector__rem_back_method_end_block
jp
vector__rem_back:
peek 84
pop



pushcp __defc_gen_word_n129
pushcp __class__child_items
push 84
pushai
pushai


pushcp __class__child_items
push 84
pushai

pushc __defc_gen_word_n130
gpm

peek 0
pop
pushcp setlen
jc




pushcp __defc_gen_word_n131
pushcp __class__child_items
push 84
pushai
pushai
dec
pop
__gen_vector__rem_back_method_end:
jr
__gen_vector__rem_back_method_end_block:
pushcp __gen_vector__at_method_end_block
jp
vector__at:
peek 85
pop
peek 86
pop




push 86
copy
gpm
swp
pop

pushcp __defc_gen_word_n132
swp
sub
pushcp __class__child_items
push 85
pushai
pushai
jr
__gen_vector__at_method_end:
jr
__gen_vector__at_method_end_block:
pushcp __gen_vector__size_method_end_block
jp
vector__size:
peek 87
pop


pushcp __defc_gen_word_n133
pushcp __class__child_items
push 87
pushai
pushai
jr
__gen_vector__size_method_end:
jr
__gen_vector__size_method_end_block:
pushcp __gen_vector__free_method_end_block
jp
vector__free:
peek 88
pop


push 88


pushcp __class__child_items
push 88
pushai


pushcp __defc_gen_word_n134
pushcp __class__child_items
push 88
pushai
pushai

pushc __defc_gen_word_n135
gpm

peek 0
pop
pushcp free
jc
__gen_vector__free_method_end:
jr
__gen_vector__free_method_end_block:


pushcp __gen_reversearray_method_end_block
jp
reversearray:
peek 89
pop



push 89

pushc __defc_gen_word_n136
gpm

peek 0
pop
pushcp len
jc

peek 90
pop

pushc __defc_gen_word_n137
gpm

peek 91
pop
__gen_for_6:
pushcp __gen_for_6_for_end


pushcp __defc_gen_word_n138

pushc len
gpm
idiv
peek 92
pop

push 91
copy
gpm
swp
pop

push 92
bg
gpm
jz
pop






push 90
copy
gpm
swp
pop

push 91
swp
sub

pushcp __defc_gen_word_n139
swp
sub
push 89
pushai

peek 93
pop



push 91
push 89
pushai




push 90
copy
gpm
swp
pop

push 91
swp
sub

pushcp __defc_gen_word_n140
swp
sub
push 89
peekai


push 93


push 91
push 89
peekai

push 91
inc
pop
pushcp __gen_for_6
jp
__gen_for_6_for_end:

__gen_reversearray_method_end:
jr
__gen_reversearray_method_end_block:
pushcp __gen_getmax_method_end_block
jp
getmax:
peek 94
pop
peek 95
pop



pushcp __defc_gen_word_n141
push 94
pushai

peek 96
pop

pushc __defc_gen_word_n142
gpm

peek 97
pop
__gen_for_7:
pushcp __gen_for_7_for_end


push 97
copy
gpm
swp
pop

push 95
bg
gpm
jz
pop

pushcp __gen_if_4_end



push 97
push 94
pushai
copy
gpm
swp
pop

push 96
swp
bg
gpm
jz
pop



push 97
push 94
pushai

push 96
mov
__gen_if_4_end:

push 97
inc
pop
pushcp __gen_for_7
jp
__gen_for_7_for_end:


push 96
jr
__gen_getmax_method_end:
jr
__gen_getmax_method_end_block:
pushcp __gen_fromtoqsort_method_end_block
jp
fromtoqsort:
peek 98
pop
peek 99
pop
peek 100
pop


push 99

peek 101
pop


push 100

peek 102
pop






push 99
copy
gpm
swp
pop

push 100
swp
add
peek 103
pop

pushcp __defc_gen_word_n143

push 103
copy
gpm
swp
pop
idiv
peek 104
pop

push 104
copy
gpm
swp
pop
push 98
pushai

peek 105
pop
__gen_while_6:
pushcp __gen_while_6_end



push 102
copy
gpm
swp
pop

pushcp __defc_gen_word_n144
swp
add
peek 103
pop


push 102
copy
gpm
swp
pop

pushcp __defc_gen_word_n145
swp
add
peek 104
pop

push 101
copy
gpm
swp
pop

push 103
bg
gpm
jz
pop
__gen_while_7:
pushcp __gen_while_7_end



push 101
push 98
pushai
copy
gpm
swp
pop

push 105
bg
gpm
jz
pop



push 101
inc
pop
pushcp __gen_while_7
jp
__gen_while_7_end:
__gen_while_8:
pushcp __gen_while_8_end



push 102
push 98
pushai
copy
gpm
swp
pop

push 105
swp
bg
gpm
jz
pop



push 102
dec
pop
pushcp __gen_while_8
jp
__gen_while_8_end:
pushcp __gen_if_5_end



push 102
copy
gpm
swp
pop

pushcp __defc_gen_word_n146
swp
add
peek 103
pop


push 102
copy
gpm
swp
pop

pushcp __defc_gen_word_n147
swp
add
peek 104
pop

push 101
copy
gpm
swp
pop

push 103
bg
gpm
jz
pop



push 101
push 98
pushai

peek 106
pop



push 102
push 98
pushai


push 101
push 98
peekai


push 106


push 102
push 98
peekai



push 101
inc
pop



push 102
dec
pop
__gen_if_5_end:
pushcp __gen_while_6
jp
__gen_while_6_end:
pushcp __gen_if_6_end


push 99
copy
gpm
swp
pop

push 102
bg
gpm
jz
pop


push 102

push 99

push 98

pushc __defc_gen_word_n148
gpm

peek 0
pop
pushcp fromtoqsort
jc
__gen_if_6_end:
pushcp __gen_if_7_end


push 101
copy
gpm
swp
pop

push 100
bg
gpm
jz
pop


push 100

push 101

push 98

pushc __defc_gen_word_n149
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
peek 107
pop




push 107

pushc __defc_gen_word_n150
gpm

peek 0
pop
pushcp len
jc

pushcp __defc_gen_word_n151
swp
sub

pushc __defc_gen_word_n152
gpm

push 107

pushc __defc_gen_word_n153
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
peek 108
pop
peek 109
pop
peek 110
pop
peek 111
pop
peek 112
pop


push 109

peek 113
pop


push 110

peek 114
pop






push 109
copy
gpm
swp
pop

push 110
swp
add
peek 115
pop

pushcp __defc_gen_word_n154

push 115
copy
gpm
swp
pop
idiv
peek 116
pop

push 116
copy
gpm
swp
pop
push 108
pushai

peek 117
pop
__gen_while_9:
pushcp __gen_while_9_end



push 114
copy
gpm
swp
pop

pushcp __defc_gen_word_n155
swp
add
peek 115
pop


push 114
copy
gpm
swp
pop

pushcp __defc_gen_word_n156
swp
add
peek 116
pop

push 113
copy
gpm
swp
pop

push 115
bg
gpm
jz
pop
__gen_while_10:
pushcp __gen_while_10_end



push 113
push 108
pushai
copy
gpm
swp
pop

push 117
bg
gpm
jz
pop



push 113
inc
pop
pushcp __gen_while_10
jp
__gen_while_10_end:
__gen_while_11:
pushcp __gen_while_11_end



push 114
push 108
pushai
copy
gpm
swp
pop

push 117
swp
bg
gpm
jz
pop



push 114
dec
pop
pushcp __gen_while_11
jp
__gen_while_11_end:
pushcp __gen_if_8_end



push 114
copy
gpm
swp
pop

pushcp __defc_gen_word_n157
swp
add
peek 115
pop


push 114
copy
gpm
swp
pop

pushcp __defc_gen_word_n158
swp
add
peek 116
pop

push 113
copy
gpm
swp
pop

push 115
bg
gpm
jz
pop



push 113
push 108
pushai

peek 118
pop



push 114
push 108
pushai


push 113
push 108
peekai


push 118


push 114
push 108
peekai



push 113
inc
pop



push 114
dec
pop
__gen_if_8_end:
pushcp __gen_while_9
jp
__gen_while_9_end:
pushcp __gen_if_9_end


push 111
copy
gpm
swp
pop

push 112
bg
gpm
jz
pop



push 108
copy
peek 108
pop
push 109
copy
peek 109
pop
push 110
copy
peek 110
pop
push 111
copy
peek 111
pop
push 112
copy
peek 112
pop
push 113
copy
peek 113
pop
push 114
copy
peek 114
pop
push 115
copy
peek 115
pop
push 116
copy
peek 116
pop
push 117
copy
peek 117
pop
push 118
copy
peek 118
pop
pushc __defc_gen_word_n159
gpm
peek 119
pushcp __gen_async_0_entry
cthr
rthr


peek 118
pop

peek 117
pop

peek 116
pop

peek 115
pop

peek 114
pop

peek 113
pop

peek 112
pop

peek 111
pop

peek 110
pop

peek 109
pop

peek 108
pop

pushcp __gen_async_0_end
jp
__gen_async_0_entry:
pop


push 108
gpm
pop 
push 109
gpm
pop 
push 110
gpm
pop 
push 111
gpm
pop 
push 112
gpm
pop 
push 113
gpm
pop 
push 114
gpm
pop 
push 115
gpm
pop 
push 116
gpm
pop 
push 117
gpm
pop 
push 118
gpm
pop 
pushcp __gen_if_10_end


push 109
copy
gpm
swp
pop

push 114
bg
gpm
jz
pop


push 112


push 111
copy
gpm
swp
pop

pushcp __defc_gen_word_n161
swp
add


push 114

pushc __defc_gen_word_n162
gpm

peek 0
pop
pushcp copy
jc


push 109

pushc __defc_gen_word_n163
gpm

peek 0
pop
pushcp copy
jc

push 108

pushc __defc_gen_word_n164
gpm

peek 0
pop
pushcp fromtothrqsort
jc
__gen_if_10_end:
__gen_async_0_exit:
pushc __defc_gen_word_n160
gpm
push 119
mov
threxit
__gen_async_0_end:



push 108
copy
peek 108
pop
push 109
copy
peek 109
pop
push 110
copy
peek 110
pop
push 111
copy
peek 111
pop
push 112
copy
peek 112
pop
push 113
copy
peek 113
pop
push 114
copy
peek 114
pop
push 115
copy
peek 115
pop
push 116
copy
peek 116
pop
push 117
copy
peek 117
pop
push 118
copy
peek 118
pop
push 119
copy
peek 119
pop
pushc __defc_gen_word_n165
gpm
peek 120
pushcp __gen_async_1_entry
cthr
rthr


peek 119
pop

peek 118
pop

peek 117
pop

peek 116
pop

peek 115
pop

peek 114
pop

peek 113
pop

peek 112
pop

peek 111
pop

peek 110
pop

peek 109
pop

peek 108
pop

pushcp __gen_async_1_end
jp
__gen_async_1_entry:
pop


push 108
gpm
pop 
push 109
gpm
pop 
push 110
gpm
pop 
push 111
gpm
pop 
push 112
gpm
pop 
push 113
gpm
pop 
push 114
gpm
pop 
push 115
gpm
pop 
push 116
gpm
pop 
push 117
gpm
pop 
push 118
gpm
pop 
push 119
gpm
pop 
pushcp __gen_if_11_end


push 113
copy
gpm
swp
pop

push 110
bg
gpm
jz
pop


push 112


push 111
copy
gpm
swp
pop

pushcp __defc_gen_word_n167
swp
add


push 110

pushc __defc_gen_word_n168
gpm

peek 0
pop
pushcp copy
jc


push 113

pushc __defc_gen_word_n169
gpm

peek 0
pop
pushcp copy
jc

push 108

pushc __defc_gen_word_n170
gpm

peek 0
pop
pushcp fromtothrqsort
jc
__gen_if_11_end:
__gen_async_1_exit:
pushc __defc_gen_word_n166
gpm
push 120
mov
threxit
__gen_async_1_end:

__async_await_loop_for_flag_thrl:
pushcp __defc_gen_word_n171
pushcp sleep
invoke
pushcp __async_await_loop_for_flag_thrl
push 119
jn
pop

__async_await_loop_for_flag_thrr:
pushcp __defc_gen_word_n172
pushcp sleep
invoke
pushcp __async_await_loop_for_flag_thrr
push 120
jn
pop

pushcp __gen_if_9_else_end
jp
__gen_if_9_end:
pushcp __gen_if_12_end


push 109
copy
gpm
swp
pop

push 114
bg
gpm
jz
pop


push 112

push 111

push 114

push 109

push 108

pushc __defc_gen_word_n173
gpm

peek 0
pop
pushcp fromtothrqsort
jc
__gen_if_12_end:
pushcp __gen_if_13_end


push 113
copy
gpm
swp
pop

push 110
bg
gpm
jz
pop


push 112

push 111

push 110

push 113

push 108

pushc __defc_gen_word_n174
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
peek 121
pop
peek 122
pop



pushcp __defc_gen_word_n175

push 122
copy
gpm
swp
pop
idiv
peek 123
pop

push 123
copy
gpm
swp
pop

pushc __defc_gen_word_n176
gpm



push 121

pushc __defc_gen_word_n177
gpm

peek 0
pop
pushcp len
jc

pushcp __defc_gen_word_n178
swp
sub

pushc __defc_gen_word_n179
gpm

push 121

pushc __defc_gen_word_n180
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
peek 124
pop
peek 125
pop



pushcp __defc_gen_word_n181

push 125
copy
gpm
swp
pop
div
peek 126
pop

push 126
copy
gpm
swp
pop

peek 127
pop
__gen_while_12:
pushcp __gen_while_12_end

pushc true
gpm
jz
pop
pushcp __gen_if_14_end


push 127
copy
gpm
swp
pop

pushcp __defc_gen_word_n182
swp
bg
gpm
jz
pop



push 127
dec
pop



push 127
push 124
pushai

peek 128
pop
pushcp __gen_if_14_else_end
jp
__gen_if_14_end:



push 125
dec
pop
pushcp __gen_if_15_end


push 125
copy
gpm
swp
pop

pushcp __defc_gen_word_n183
eq
gpm
jz
pop
jr
__gen_if_15_end:



push 125
push 124
pushai

peek 128
pop



pushcp __defc_gen_word_n184
push 124
pushai


push 125
push 124
peekai
__gen_if_14_else_end:


push 127

peek 129
pop



pushcp __defc_gen_word_n185

push 127
copy
gpm
swp
pop
mul
peek 126
pop

push 126
copy
gpm
swp
pop

pushcp __defc_gen_word_n186
swp
add

peek 130
pop
__gen_while_13:
pushcp __gen_while_13_end


push 130
copy
gpm
swp
pop

push 125
bg
gpm
jz
pop
pushcp __gen_if_16_end



push 130
copy
gpm
swp
pop

pushcp __defc_gen_word_n187
swp
add

push 125
bg
gpm
peek 126
pop





push 130
copy
gpm
swp
pop

pushcp __defc_gen_word_n188
swp
add
push 124
pushai
copy
gpm
swp
pop


push 130
push 124
pushai
swp
bg
gpm
peek 131
pop

push 126
copy
gpm
swp
pop

push 131
swp
and
jz
pop



push 130
inc
pop
__gen_if_16_end:
pushcp __gen_if_17_end



push 130
push 124
pushai
copy
gpm
swp
pop

push 128
swp
bg
gpm
jz
pop



push 130
push 124
pushai


push 129
push 124
peekai


push 130

peek 129
pop



pushcp __defc_gen_word_n189

push 129
copy
gpm
swp
pop
mul
peek 126
pop

push 126
copy
gpm
swp
pop

pushcp __defc_gen_word_n190
swp
add

peek 130
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


push 128


push 129
push 124
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
peek 132
pop




push 132

pushc __defc_gen_word_n191
gpm

peek 0
pop
pushcp len
jc

pushcp __defc_gen_word_n192
swp
sub

push 132

pushc __defc_gen_word_n193
gpm

peek 0
pop
pushcp heapsortto
jc




push 132

pushc __defc_gen_word_n194
gpm

peek 0
pop
pushcp len
jc

pushcp __defc_gen_word_n195
swp
sub

peek 133
pop



push 133
push 132
pushai

peek 134
pop

push 133

peek 135
pop
__gen_for_8:
pushcp __gen_for_8_for_end


push 135
copy
gpm
swp
pop

pushcp __defc_gen_word_n196
swp
bg
gpm
jz
pop






push 135
copy
gpm
swp
pop

pushcp __defc_gen_word_n197
swp
sub
push 132
pushai


push 135
push 132
peekai

push 135
dec
pop
pushcp __gen_for_8
jp
__gen_for_8_for_end:



push 134


pushcp __defc_gen_word_n198
push 132
peekai
__gen_heapsort_method_end:
jr
__gen_heapsort_method_end_block:
pushcp __gen_countsort_method_end_block
jp
countsort:
peek 136
pop
peek 137
pop
peek 138
pop



push 137

pushcp __defc_gen_word_n199
newa

peek 139
pop



pushcp __defc_gen_word_n200

pushcp __defc_gen_word_n201
newa

peek 140
pop

pushc __defc_gen_word_n202
gpm

peek 141
pop
__gen_for_9:
pushcp __gen_for_9_for_end


push 141
copy
gpm
swp
pop

pushcp __defc_gen_word_n203
bg
gpm
jz
pop



pushc __defc_gen_word_n204
gpm


push 141
push 140
peekai

push 141
inc
pop
pushcp __gen_for_9
jp
__gen_for_9_for_end:


pushc __defc_gen_word_n205
gpm

push 141
mov
__gen_for_10:
pushcp __gen_for_10_for_end


push 141
copy
gpm
swp
pop

push 137
bg
gpm
jz
pop








push 138


push 141
push 136
pushai
copy
gpm
swp
pop
idiv
peek 142
pop

push 142
copy
gpm
swp
pop
peek 142
pop

pushcp __defc_gen_word_n206

push 142
copy
gpm
swp
pop
mod
peek 143
pop

push 143
copy
gpm
swp
pop
push 140
pushai
inc
pop

push 141
inc
pop
pushcp __gen_for_10
jp
__gen_for_10_for_end:


pushc __defc_gen_word_n207
gpm

peek 141
pop
__gen_for_11:
pushcp __gen_for_11_for_end


push 141
copy
gpm
swp
pop

pushcp __defc_gen_word_n208
bg
gpm
jz
pop







push 141
copy
gpm
swp
pop

pushcp __defc_gen_word_n209
swp
sub
push 140
pushai


push 141
push 140
pushai
add
pop

push 141
inc
pop
pushcp __gen_for_11
jp
__gen_for_11_for_end:


push 137
copy
gpm
swp
pop

pushcp __defc_gen_word_n210
swp
sub

peek 141
pop
__gen_for_12:
pushcp __gen_for_12_for_end


push 141
copy
gpm
swp
pop

pushcp __defc_gen_word_n211
swp
be
gpm
jz
pop




push 141
push 136
pushai








push 138


push 141
push 136
pushai
copy
gpm
swp
pop
idiv
peek 142
pop

push 142
copy
gpm
swp
pop
peek 142
pop

pushcp __defc_gen_word_n212

push 142
copy
gpm
swp
pop
mod
peek 143
pop

push 143
copy
gpm
swp
pop
push 140
pushai
copy
gpm
swp
pop

pushcp __defc_gen_word_n213
swp
sub
push 139
peekai







push 138


push 141
push 136
pushai
copy
gpm
swp
pop
idiv
peek 142
pop

push 142
copy
gpm
swp
pop
peek 142
pop

pushcp __defc_gen_word_n214

push 142
copy
gpm
swp
pop
mod
peek 143
pop

push 143
copy
gpm
swp
pop
push 140
pushai
dec
pop

push 141
dec
pop
pushcp __gen_for_12
jp
__gen_for_12_for_end:


pushc __defc_gen_word_n215
gpm

peek 141
pop
__gen_for_13:
pushcp __gen_for_13_for_end


push 141
copy
gpm
swp
pop

push 137
bg
gpm
jz
pop




push 141
push 139
pushai


push 141
push 136
peekai

push 141
inc
pop
pushcp __gen_for_13
jp
__gen_for_13_for_end:



push 140

push 139

pushc __defc_gen_word_n216
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
peek 144
pop



push 144

pushc __defc_gen_word_n217
gpm

peek 0
pop
pushcp len
jc

peek 145
pop



push 145

push 144

pushc __defc_gen_word_n218
gpm

peek 0
pop
pushcp getmax
jc

peek 146
pop

pushc __defc_gen_word_n219
gpm

peek 147
pop
__gen_for_14:
pushcp __gen_for_14_for_end


push 147

push 146
copy
gpm
swp
pop
idiv
peek 148
pop

push 148
copy
gpm
swp
pop

pushcp __defc_gen_word_n220
swp
bg
gpm
jz
pop



push 147

push 145

push 144

pushc __defc_gen_word_n222
gpm

peek 0
pop
pushcp countsort
jc

pushc __defc_gen_word_n221
gpm

push 147
mul
pop
pushcp __gen_for_14
jp
__gen_for_14_for_end:

__gen_radixsort_method_end:
jr
__gen_radixsort_method_end_block:
pushcp __gen_fromtobinsearch_method_end_block
jp
fromtobinsearch:
peek 149
pop
peek 150
pop
peek 151
pop
peek 152
pop
__gen_while_14:
pushcp __gen_while_14_end

pushc true
gpm
jz
pop




push 150
copy
gpm
swp
pop

push 151
swp
add
peek 153
pop

pushcp __defc_gen_word_n223

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

peek 155
pop
pushcp __gen_if_18_end


push 152
copy
gpm
swp
pop


push 155
push 149
pushai
bg
gpm
jz
pop



push 155
copy
gpm
swp
pop

pushcp __defc_gen_word_n224
swp
sub

peek 151
pop
pushcp __gen_if_18_else_end
jp
__gen_if_18_end:
pushcp __gen_if_19_end


push 152
copy
gpm
swp
pop


push 155
push 149
pushai
swp
bg
gpm
jz
pop



push 155
copy
gpm
swp
pop

pushcp __defc_gen_word_n225
swp
add

peek 150
pop
pushcp __gen_if_19_else_end
jp
__gen_if_19_end:

push 155
jr
__gen_if_19_else_end:
__gen_if_18_else_end:
pushcp __gen_if_20_end


push 150
copy
gpm
swp
pop

push 151
swp
bg
gpm
jz
pop


pushc __defc_gen_word_n226
gpm

pushcp __defc_gen_word_n227
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
peek 156
pop
peek 157
pop



push 156

pushc __defc_gen_word_n228
gpm

peek 0
pop
pushcp len
jc

peek 158
pop
pushcp __gen_if_21_end


push 158
copy
gpm
swp
pop

pushcp __defc_gen_word_n229
swp
bg
gpm
jz
pop


push 157


push 158
copy
gpm
swp
pop

pushcp __defc_gen_word_n230
swp
sub

pushc __defc_gen_word_n231
gpm

push 156

pushc __defc_gen_word_n232
gpm

peek 0
pop
pushcp fromtobinsearch
jc
jr
pushcp __gen_if_21_else_end
jp
__gen_if_21_end:


pushc __defc_gen_word_n233
gpm

pushcp __defc_gen_word_n234
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
peek 159
pop
peek 160
pop
peek 161
pop
peek 162
pop
__gen_while_15:
pushcp __gen_while_15_end

pushc true
gpm
jz
pop




push 160
copy
gpm
swp
pop

push 161
swp
add
peek 163
pop

pushcp __defc_gen_word_n235

push 163
copy
gpm
swp
pop
idiv
peek 164
pop

push 164
copy
gpm
swp
pop

peek 165
pop
pushcp __gen_if_22_end


push 162
copy
gpm
swp
pop


push 165
push 159
pushai
bg
gpm
jz
pop



push 165
copy
gpm
swp
pop

pushcp __defc_gen_word_n236
swp
sub

peek 161
pop
pushcp __gen_if_22_else_end
jp
__gen_if_22_end:
pushcp __gen_if_23_end


push 162
copy
gpm
swp
pop


push 165
push 159
pushai
swp
bg
gpm
jz
pop



push 165
copy
gpm
swp
pop

pushcp __defc_gen_word_n237
swp
add

peek 160
pop
pushcp __gen_if_23_else_end
jp
__gen_if_23_end:

push 165
jr
__gen_if_23_else_end:
__gen_if_22_else_end:
pushcp __gen_if_24_end


push 160
copy
gpm
swp
pop

push 161
swp
bg
gpm
jz
pop

push 165
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
peek 166
pop
peek 167
pop



push 166

pushc __defc_gen_word_n238
gpm

peek 0
pop
pushcp len
jc

peek 168
pop
pushcp __gen_if_25_end


push 168
copy
gpm
swp
pop

pushcp __defc_gen_word_n239
swp
bg
gpm
jz
pop



push 167


push 168
copy
gpm
swp
pop

pushcp __defc_gen_word_n240
swp
sub

pushc __defc_gen_word_n241
gpm

push 166

pushc __defc_gen_word_n242
gpm

peek 0
pop
pushcp fromtobinnext
jc

peek 169
pop
pushcp __gen_if_26_end



push 169
push 166
pushai
copy
gpm
swp
pop

push 167
swp
bg
gpm
jz
pop

push 169
jr
pushcp __gen_if_26_else_end
jp
__gen_if_26_end:


push 169
copy
gpm
swp
pop

pushcp __defc_gen_word_n243
swp
add
jr
__gen_if_26_else_end:
pushcp __gen_if_25_else_end
jp
__gen_if_25_end:

pushc __defc_gen_word_n244
gpm
jr
__gen_if_25_else_end:
__gen_binnext_method_end:
jr
__gen_binnext_method_end_block:
pushcp __gen_fromtointerpolarsearch_method_end_block
jp
fromtointerpolarsearch:
peek 170
pop
peek 171
pop
peek 172
pop
peek 173
pop


pushc __defc_gen_word_n245
gpm

peek 174
pop


pushc false
gpm

peek 175
pop
__gen_while_16:
pushcp __gen_while_16_end




push 171
push 170
pushai
copy
gpm
swp
pop

push 173
bg
gpm
peek 176
pop



push 172
push 170
pushai
copy
gpm
swp
pop

push 173
swp
bg
gpm
peek 177
pop


push 175
copy
gpm
swp
pop
not
peek 178
pop


push 175
copy
gpm
swp
pop
not
peek 179
pop

push 176
copy
gpm
swp
pop

push 177
swp
and

push 178
swp
and
jz
pop





push 173
copy
gpm
swp
pop


push 171
push 170
pushai
swp
sub
peek 176
pop


push 172
copy
gpm
swp
pop

push 171
swp
sub
peek 177
pop

push 177

push 176
copy
gpm
swp
pop
mul
peek 178
pop

push 178
copy
gpm
swp
pop
peek 176
pop



push 172
push 170
pushai
copy
gpm
swp
pop


push 171
push 170
pushai
swp
sub
peek 177
pop

push 177

push 176
copy
gpm
swp
pop
div
peek 178
pop

push 171
copy
gpm
swp
pop

push 178
swp
add

push 174
mov
pushcp __gen_if_27_end



push 174
push 170
pushai
copy
gpm
swp
pop

push 173
bg
gpm
jz
pop



push 174
copy
gpm
swp
pop

pushcp __defc_gen_word_n246
swp
add

push 171
mov
pushcp __gen_if_27_else_end
jp
__gen_if_27_end:
pushcp __gen_if_28_end



push 174
push 170
pushai
copy
gpm
swp
pop

push 173
swp
bg
gpm
jz
pop



push 174
copy
gpm
swp
pop

pushcp __defc_gen_word_n247
swp
sub

push 172
mov
pushcp __gen_if_28_else_end
jp
__gen_if_28_end:


pushc true
gpm

push 175
mov
__gen_if_28_else_end:
__gen_if_27_else_end:
pushcp __gen_while_16
jp
__gen_while_16_end:
pushcp __gen_if_29_end

push 175
jz
pop

push 174
jr
pushcp __gen_if_29_else_end
jp
__gen_if_29_end:


pushc __defc_gen_word_n248
gpm

pushcp __defc_gen_word_n249
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
peek 180
pop
peek 181
pop



push 180

pushc __defc_gen_word_n250
gpm

peek 0
pop
pushcp len
jc

peek 182
pop
pushcp __gen_if_30_end


push 182
copy
gpm
swp
pop

pushcp __defc_gen_word_n251
swp
bg
gpm
jz
pop


push 181


push 182
copy
gpm
swp
pop

pushcp __defc_gen_word_n252
swp
sub

pushc __defc_gen_word_n253
gpm

push 180

pushc __defc_gen_word_n254
gpm

peek 0
pop
pushcp fromtointerpolarsearch
jc
jr
pushcp __gen_if_30_else_end
jp
__gen_if_30_end:


pushc __defc_gen_word_n255
gpm

pushcp __defc_gen_word_n256
swp
sub
jr
__gen_if_30_else_end:
__gen_interpolarsearch_method_end:
jr
__gen_interpolarsearch_method_end_block:


import __critsect_create "thrlib.lib" "CRITICAL_SECTION_CREATE"
import __critsect_free "thrlib.lib" "CRITICAL_SECTION_FREE"
import __critsect_enter "thrlib.lib" "CRITICAL_SECTION_ENTER"
import __critsect_leave "thrlib.lib" "CRITICAL_SECTION_LEAVE"
import __critsect_tryenter "thrlib.lib" "CRITICAL_SECTION_TRYENTER"
pushcp __gen_tcriticalsection__create_method_end_block
jp
tcriticalsection__create:
peek 183
pop



pushc __defc_gen_word_n257
gpm

peek 0
pop
pushcp __critsect_create
invoke


pushcp __class__child_critical_section_controller
push 183
peekai
__gen_tcriticalsection__create_method_end:
jr
__gen_tcriticalsection__create_method_end_block:
pushcp __gen_tcriticalsection__free_method_end_block
jp
tcriticalsection__free:
peek 184
pop



pushcp __class__child_critical_section_controller
push 184
pushai

pushc __defc_gen_word_n258
gpm

peek 0
pop
pushcp __critsect_free
invoke


push 184

pushc __defc_gen_word_n259
gpm

peek 0
pop
pushcp free
jc
__gen_tcriticalsection__free_method_end:
jr
__gen_tcriticalsection__free_method_end_block:
pushcp __gen_tcriticalsection__enter_method_end_block
jp
tcriticalsection__enter:
peek 185
pop



pushcp __class__child_critical_section_controller
push 185
pushai

pushc __defc_gen_word_n260
gpm

peek 0
pop
pushcp __critsect_enter
invoke
__gen_tcriticalsection__enter_method_end:
jr
__gen_tcriticalsection__enter_method_end_block:
pushcp __gen_tcriticalsection__leave_method_end_block
jp
tcriticalsection__leave:
peek 186
pop



pushcp __class__child_critical_section_controller
push 186
pushai

pushc __defc_gen_word_n261
gpm

peek 0
pop
pushcp __critsect_leave
invoke
__gen_tcriticalsection__leave_method_end:
jr
__gen_tcriticalsection__leave_method_end_block:
pushcp __gen_tcriticalsection__tryenter_method_end_block
jp
tcriticalsection__tryenter:
peek 187
pop




pushcp __class__child_critical_section_controller
push 187
pushai

pushc __defc_gen_word_n262
gpm

peek 0
pop
pushcp __critsect_tryenter
invoke

pushc __defc_gen_word_n263
gpm

peek 0
pop
pushcp gpmx
jc
jr
__gen_tcriticalsection__tryenter_method_end:
jr
__gen_tcriticalsection__tryenter_method_end_block:
pushcp __gen_tatomic__create_method_end_block
jp
tatomic__create:
peek 188
pop
peek 189
pop

pushcp __class_tcriticalsection_allocator
jc
pcopy


pushc __defc_gen_word_n264
gpm

peek 0
pop
pushcp tcriticalsection__create
jc


pushcp __class__child_locker
push 188
peekai



push 189

pushc __defc_gen_word_n265
gpm

peek 0
pop
pushcp new
jc


pushcp __class__child_value
push 188
peekai
__gen_tatomic__create_method_end:
jr
__gen_tatomic__create_method_end_block:
pushcp __gen_tatomic__free_method_end_block
jp
tatomic__free:
peek 190
pop


pushc __defc_gen_word_n266
gpm

peek 0
pop


pushcp __class__child_locker
push 190
pushai

pushcp __class__child_free
pushcp __class__child_locker
push 190
pushai
pushai
jc


push 190


pushcp __class__child_value
push 190
pushai

pushc __defc_gen_word_n267
gpm

peek 0
pop
pushcp free
jc
__gen_tatomic__free_method_end:
jr
__gen_tatomic__free_method_end_block:
pushcp __gen_tatomic__lock_method_end_block
jp
tatomic__lock:
peek 191
pop


pushc __defc_gen_word_n268
gpm

peek 0
pop


pushcp __class__child_locker
push 191
pushai

pushcp __class__child_enter
pushcp __class__child_locker
push 191
pushai
pushai
jc
__gen_tatomic__lock_method_end:
jr
__gen_tatomic__lock_method_end_block:
pushcp __gen_tatomic__unlock_method_end_block
jp
tatomic__unlock:
peek 192
pop


pushc __defc_gen_word_n269
gpm

peek 0
pop


pushcp __class__child_locker
push 192
pushai

pushcp __class__child_leave
pushcp __class__child_locker
push 192
pushai
pushai
jc
__gen_tatomic__unlock_method_end:
jr
__gen_tatomic__unlock_method_end_block:


pushcp __gen_list__create_method_end_block
jp
list__create:
peek 193
pop



pushcp __defc_gen_word_n270

pushcp __defc_gen_word_n271
newa


pushcp __class__child_items
push 193
peekai



pushc __defc_gen_word_n272
gpm

pushc __defc_gen_word_n273
gpm

peek 0
pop
pushcp new
jc


pushcp __class__child_size
push 193
peekai
__gen_list__create_method_end:
jr
__gen_list__create_method_end_block:
pushcp __gen_list__free_method_end_block
jp
list__free:
peek 194
pop


push 194


pushcp __class__child_size
push 194
pushai


pushcp __class__child_items
push 194
pushai

pushc __defc_gen_word_n274
gpm

peek 0
pop
pushcp free
jc
__gen_list__free_method_end:
jr
__gen_list__free_method_end_block:
pushcp __gen_list__add_method_end_block
jp
list__add:
peek 195
pop
peek 196
pop




pushcp __class__child_size
push 195
pushai
copy
gpm
swp
pop

pushcp __defc_gen_word_n275
swp
add


pushcp __class__child_items
push 195
pushai

pushc __defc_gen_word_n276
gpm

peek 0
pop
pushcp setlen
jc


push 196



pushcp __class__child_size
push 195
pushai
pushcp __class__child_items
push 195
pushai
peekai




pushcp __class__child_size
push 195
pushai
inc
pop
__gen_list__add_method_end:
jr
__gen_list__add_method_end_block:
pushcp __gen_list__insert_method_end_block
jp
list__insert:
peek 197
pop
peek 198
pop
peek 199
pop
pushcp __gen_if_31_end




pushcp __class__child_size
push 197
pushai
copy
gpm
swp
pop

push 199
bg
gpm
peek 200
pop


push 199
copy
gpm
swp
pop

pushcp __defc_gen_word_n277
bg
gpm
peek 201
pop

push 200
copy
gpm
swp
pop

push 201
swp
or
jz
pop


pushc __defc_gen_str_n278
gpm

push 199
swp
add

pushcp __defc_gen_str_n279
swp
add
trr
pushcp __gen_if_31_else_end
jp
__gen_if_31_end:




pushcp __class__child_size
push 197
pushai
inc
pop



pushcp __class__child_size
push 197
pushai


pushcp __class__child_items
push 197
pushai

pushc __defc_gen_word_n280
gpm

peek 0
pop
pushcp setlen
jc

pushcp __class__child_size
push 197
pushai
copy
gpm
swp
pop

pushcp __defc_gen_word_n281
swp
sub

peek 202
pop
__gen_for_15:
pushcp __gen_for_15_for_end


push 202
copy
gpm
swp
pop

push 199
swp
bg
gpm
jz
pop






push 202
copy
gpm
swp
pop

pushcp __defc_gen_word_n282
swp
sub
pushcp __class__child_items
push 197
pushai
pushai


push 202
pushcp __class__child_items
push 197
pushai
peekai

push 202
dec
pop
pushcp __gen_for_15
jp
__gen_for_15_for_end:



push 198


push 199
pushcp __class__child_items
push 197
pushai
peekai
__gen_if_31_else_end:
__gen_list__insert_method_end:
jr
__gen_list__insert_method_end_block:
pushcp __gen_list__delete_method_end_block
jp
list__delete:
peek 203
pop
peek 204
pop
pushcp __gen_if_32_end




pushcp __class__child_size
push 203
pushai
copy
gpm
swp
pop

push 204
be
gpm
peek 205
pop


push 204
copy
gpm
swp
pop

pushcp __defc_gen_word_n283
bg
gpm
peek 206
pop

push 205
copy
gpm
swp
pop

push 206
swp
or
jz
pop


pushc __defc_gen_str_n284
gpm

push 204
swp
add

pushcp __defc_gen_str_n285
swp
add
trr
pushcp __gen_if_32_else_end
jp
__gen_if_32_end:




pushcp __class__child_size
push 203
pushai
dec
pop


__gen_for_16:
pushcp __gen_for_16_for_end


push 204
copy
gpm
swp
pop


pushcp __class__child_size
push 203
pushai
bg
gpm
jz
pop






push 204
copy
gpm
swp
pop

pushcp __defc_gen_word_n286
swp
add
pushcp __class__child_items
push 203
pushai
pushai


push 204
pushcp __class__child_items
push 203
pushai
peekai

push 204
inc
pop
pushcp __gen_for_16
jp
__gen_for_16_for_end:




pushcp __class__child_size
push 203
pushai


pushcp __class__child_items
push 203
pushai

pushc __defc_gen_word_n287
gpm

peek 0
pop
pushcp setlen
jc
__gen_if_32_else_end:
__gen_list__delete_method_end:
jr
__gen_list__delete_method_end_block:
pushcp __gen_list__clear_method_end_block
jp
list__clear:
peek 207
pop


pushc __defc_gen_word_n288
gpm


pushcp __class__child_items
push 207
pushai

pushc __defc_gen_word_n289
gpm

peek 0
pop
pushcp setlen
jc


pushc __defc_gen_word_n290
gpm


pushcp __class__child_size
push 207
pushai
mov
__gen_list__clear_method_end:
jr
__gen_list__clear_method_end_block:
pushcp __gen_list__foreach_method_end_block
jp
list__foreach:
peek 208
pop
peek 209
pop


pushc __defc_gen_word_n291
gpm

peek 210
pop
__gen_while_17:
pushcp __gen_while_17_end


push 210
copy
gpm
swp
pop


pushcp __class__child_size
push 208
pushai
bg
gpm
jz
pop



push 210
pushcp __class__child_items
push 208
pushai
pushai

push 209

pushc __defc_gen_word_n292
gpm

peek 0
pop
pushcp vcall
jc



push 210
inc
pop
pushcp __gen_while_17
jp
__gen_while_17_end:
__gen_list__foreach_method_end:
jr
__gen_list__foreach_method_end_block:
pushcp __gen_list__get_method_end_block
jp
list__get:
peek 211
pop
peek 212
pop


push 212
pushcp __class__child_items
push 211
pushai
pushai
jr
__gen_list__get_method_end:
jr
__gen_list__get_method_end_block:
pushcp __gen_list__indexof_method_end_block
jp
list__indexof:
peek 213
pop
peek 214
pop
pushcp __gen_if_33_end



push 214

pushc __defc_gen_word_n293
gpm

peek 0
pop
pushcp typeof
jc


pushcp __defc_gen_word_n294

pushcp __defc_gen_word_n295
newa
gpm
pcopy

pushc typearray
gpm
swp

pushc __defc_gen_word_n296
gpm
swp
peekai
pcopy

pushc typeclass
gpm
swp

pushc __defc_gen_word_n297
gpm
swp
peekai
swp
pushcp _op_in
jc
jz
pop


push 214
new
gpm
peek 32
movp
push 32

peek 215
pop

pushc __defc_gen_word_n298
gpm

peek 216
pop
__gen_for_17:
pushcp __gen_for_17_for_end


push 216
copy
gpm
swp
pop


pushcp __class__child_size
push 213
pushai
bg
gpm
jz
pop

pushcp __gen_if_34_end


push 215
copy
gpm
swp
pop


push 216
pushcp __class__child_items
push 213
pushai
pushai
new
gpm
peek 32
movp
push 32
eq
gpm
jz
pop

push 216
jr
__gen_if_34_end:

push 216
inc
pop
pushcp __gen_for_17
jp
__gen_for_17_for_end:

pushcp __gen_if_33_else_end
jp
__gen_if_33_end:

pushc __defc_gen_word_n299
gpm

peek 216
pop
__gen_for_18:
pushcp __gen_for_18_for_end


push 216
copy
gpm
swp
pop


pushcp __class__child_size
push 213
pushai
bg
gpm
jz
pop

pushcp __gen_if_35_end


push 214
copy
gpm
swp
pop


push 216
pushcp __class__child_items
push 213
pushai
pushai
eq
gpm
jz
pop

push 216
jr
__gen_if_35_end:

push 216
inc
pop
pushcp __gen_for_18
jp
__gen_for_18_for_end:

__gen_if_33_else_end:
__gen_list__indexof_method_end:
jr
__gen_list__indexof_method_end_block:
pushcp __gen_list__sort_method_end_block
jp
list__sort:
peek 217
pop



pushcp __class__child_items
push 217
pushai

pushc __defc_gen_word_n300
gpm

peek 0
pop
pushcp radixsort
jc
__gen_list__sort_method_end:
jr
__gen_list__sort_method_end_block:
pushcp __gen_list__nextins_method_end_block
jp
list__nextins:
peek 218
pop
peek 219
pop



push 219


pushcp __class__child_items
push 218
pushai

pushc __defc_gen_word_n301
gpm

peek 0
pop
pushcp binnext
jc

peek 220
pop


push 220

push 219

pushc __defc_gen_word_n302
gpm

peek 0
pop

push 218

pushcp __class__child_insert
push 218
pushai
jc

push 220
jr
__gen_list__nextins_method_end:
jr
__gen_list__nextins_method_end_block:
pushcp __gen_list__find_method_end_block
jp
list__find:
peek 221
pop
peek 222
pop


push 222


pushcp __class__child_items
push 221
pushai

pushc __defc_gen_word_n303
gpm

peek 0
pop
pushcp binsearch
jc
jr
__gen_list__find_method_end:
jr
__gen_list__find_method_end_block:
pushcp __gen_threadlist__create_method_end_block
jp
threadlist__create:
peek 223
pop


push 223

pushc __defc_gen_word_n304
gpm

peek 0
pop
pushcp list__create
jc

pushcp __class_tcriticalsection_allocator
jc
pcopy


pushc __defc_gen_word_n305
gpm

peek 0
pop
pushcp tcriticalsection__create
jc


pushcp __class__child_locker
push 223
peekai
__gen_threadlist__create_method_end:
jr
__gen_threadlist__create_method_end_block:
pushcp __gen_threadlist__free_method_end_block
jp
threadlist__free:
peek 224
pop


pushc __defc_gen_word_n306
gpm

peek 0
pop


pushcp __class__child_locker
push 224
pushai

pushcp __class__child_free
pushcp __class__child_locker
push 224
pushai
pushai
jc


push 224

pushc __defc_gen_word_n307
gpm

peek 0
pop
pushcp list__free
jc
__gen_threadlist__free_method_end:
jr
__gen_threadlist__free_method_end_block:
pushcp __gen_threadlist__add_method_end_block
jp
threadlist__add:
peek 225
pop
peek 226
pop


pushc __defc_gen_word_n308
gpm

peek 0
pop


pushcp __class__child_locker
push 225
pushai

pushcp __class__child_enter
pushcp __class__child_locker
push 225
pushai
pushai
jc


push 226

push 225

pushc __defc_gen_word_n309
gpm

peek 0
pop
pushcp list__add
jc


pushc __defc_gen_word_n310
gpm

peek 0
pop


pushcp __class__child_locker
push 225
pushai

pushcp __class__child_leave
pushcp __class__child_locker
push 225
pushai
pushai
jc
__gen_threadlist__add_method_end:
jr
__gen_threadlist__add_method_end_block:
pushcp __gen_threadlist__insert_method_end_block
jp
threadlist__insert:
peek 227
pop
peek 228
pop
peek 229
pop


pushc __defc_gen_word_n311
gpm

peek 0
pop


pushcp __class__child_locker
push 227
pushai

pushcp __class__child_enter
pushcp __class__child_locker
push 227
pushai
pushai
jc


push 229

push 228

push 227

pushc __defc_gen_word_n312
gpm

peek 0
pop
pushcp list__insert
jc


pushc __defc_gen_word_n313
gpm

peek 0
pop


pushcp __class__child_locker
push 227
pushai

pushcp __class__child_leave
pushcp __class__child_locker
push 227
pushai
pushai
jc
__gen_threadlist__insert_method_end:
jr
__gen_threadlist__insert_method_end_block:
pushcp __gen_threadlist__delete_method_end_block
jp
threadlist__delete:
peek 230
pop
peek 231
pop


pushc __defc_gen_word_n314
gpm

peek 0
pop


pushcp __class__child_locker
push 230
pushai

pushcp __class__child_enter
pushcp __class__child_locker
push 230
pushai
pushai
jc


push 231

push 230

pushc __defc_gen_word_n315
gpm

peek 0
pop
pushcp list__delete
jc


pushc __defc_gen_word_n316
gpm

peek 0
pop


pushcp __class__child_locker
push 230
pushai

pushcp __class__child_leave
pushcp __class__child_locker
push 230
pushai
pushai
jc
__gen_threadlist__delete_method_end:
jr
__gen_threadlist__delete_method_end_block:
pushcp __gen_threadlist__clear_method_end_block
jp
threadlist__clear:
peek 232
pop


pushc __defc_gen_word_n317
gpm

peek 0
pop


pushcp __class__child_locker
push 232
pushai

pushcp __class__child_enter
pushcp __class__child_locker
push 232
pushai
pushai
jc


push 232

pushc __defc_gen_word_n318
gpm

peek 0
pop
pushcp list__clear
jc


pushc __defc_gen_word_n319
gpm

peek 0
pop


pushcp __class__child_locker
push 232
pushai

pushcp __class__child_leave
pushcp __class__child_locker
push 232
pushai
pushai
jc
__gen_threadlist__clear_method_end:
jr
__gen_threadlist__clear_method_end_block:
pushcp __gen_threadlist__foreach_method_end_block
jp
threadlist__foreach:
peek 233
pop
peek 234
pop


pushc __defc_gen_word_n320
gpm

peek 0
pop


pushcp __class__child_locker
push 233
pushai

pushcp __class__child_enter
pushcp __class__child_locker
push 233
pushai
pushai
jc


push 234

push 233

pushc __defc_gen_word_n321
gpm

peek 0
pop
pushcp list__foreach
jc


pushc __defc_gen_word_n322
gpm

peek 0
pop


pushcp __class__child_locker
push 233
pushai

pushcp __class__child_leave
pushcp __class__child_locker
push 233
pushai
pushai
jc
__gen_threadlist__foreach_method_end:
jr
__gen_threadlist__foreach_method_end_block:
pushcp __gen_threadlist__get_method_end_block
jp
threadlist__get:
peek 235
pop
peek 236
pop


pushc __defc_gen_word_n323
gpm

peek 0
pop


pushcp __class__child_locker
push 235
pushai

pushcp __class__child_enter
pushcp __class__child_locker
push 235
pushai
pushai
jc



push 236

push 235

pushc __defc_gen_word_n324
gpm

peek 0
pop
pushcp list__get
jc

peek 237
pop


pushc __defc_gen_word_n325
gpm

peek 0
pop


pushcp __class__child_locker
push 235
pushai

pushcp __class__child_leave
pushcp __class__child_locker
push 235
pushai
pushai
jc

push 237
jr
__gen_threadlist__get_method_end:
jr
__gen_threadlist__get_method_end_block:
pushcp __gen_threadlist__indexof_method_end_block
jp
threadlist__indexof:
peek 238
pop
peek 239
pop


pushc __defc_gen_word_n326
gpm

peek 0
pop


pushcp __class__child_locker
push 238
pushai

pushcp __class__child_enter
pushcp __class__child_locker
push 238
pushai
pushai
jc



push 239

push 238

pushc __defc_gen_word_n327
gpm

peek 0
pop
pushcp list__indexof
jc

peek 240
pop


pushc __defc_gen_word_n328
gpm

peek 0
pop


pushcp __class__child_locker
push 238
pushai

pushcp __class__child_leave
pushcp __class__child_locker
push 238
pushai
pushai
jc

push 240
jr
__gen_threadlist__indexof_method_end:
jr
__gen_threadlist__indexof_method_end_block:
pushcp __gen_threadlist__sort_method_end_block
jp
threadlist__sort:
peek 241
pop


pushc __defc_gen_word_n329
gpm

peek 0
pop


pushcp __class__child_locker
push 241
pushai

pushcp __class__child_enter
pushcp __class__child_locker
push 241
pushai
pushai
jc


push 241

pushc __defc_gen_word_n330
gpm

peek 0
pop
pushcp list__sort
jc


pushc __defc_gen_word_n331
gpm

peek 0
pop


pushcp __class__child_locker
push 241
pushai

pushcp __class__child_leave
pushcp __class__child_locker
push 241
pushai
pushai
jc
__gen_threadlist__sort_method_end:
jr
__gen_threadlist__sort_method_end_block:
pushcp __gen_threadlist__nextins_method_end_block
jp
threadlist__nextins:
peek 242
pop
peek 243
pop


pushc __defc_gen_word_n332
gpm

peek 0
pop


pushcp __class__child_locker
push 242
pushai

pushcp __class__child_enter
pushcp __class__child_locker
push 242
pushai
pushai
jc



push 243

push 242

pushc __defc_gen_word_n333
gpm

peek 0
pop
pushcp list__nextins
jc

peek 244
pop


pushc __defc_gen_word_n334
gpm

peek 0
pop


pushcp __class__child_locker
push 242
pushai

pushcp __class__child_leave
pushcp __class__child_locker
push 242
pushai
pushai
jc

push 244
jr
__gen_threadlist__nextins_method_end:
jr
__gen_threadlist__nextins_method_end_block:
pushcp __gen_threadlist__find_method_end_block
jp
threadlist__find:
peek 245
pop
peek 246
pop


pushc __defc_gen_word_n335
gpm

peek 0
pop


pushcp __class__child_locker
push 245
pushai

pushcp __class__child_enter
pushcp __class__child_locker
push 245
pushai
pushai
jc



push 246

push 245

pushc __defc_gen_word_n336
gpm

peek 0
pop
pushcp list__find
jc

peek 247
pop


pushc __defc_gen_word_n337
gpm

peek 0
pop


pushcp __class__child_locker
push 245
pushai

pushcp __class__child_leave
pushcp __class__child_locker
push 245
pushai
pushai
jc

push 247
jr
__gen_threadlist__find_method_end:
jr
__gen_threadlist__find_method_end_block:


import _stream_create "streams.lib" "_Stream_Create"
import _stream_seek "streams.lib" "_Stream_Seek"
import _stream_getcaretpos "streams.lib" "_Stream_GetCaretPos"
import _stream_writefrommemorystream "streams.lib" "_Stream_WriteFromStream"
import _stream_readfrommemorystream "streams.lib" "_Stream_ReadFromStream"
import _stream_copyfromstream "streams.lib" "_Stream_CopyFromStream"
import _stream_writebyte "streams.lib" "_Stream_WriteByte"
import _stream_writeword "streams.lib" "_Stream_WriteWord"
import _stream_writeint "streams.lib" "_Stream_WriteInt"
import _stream_writefloat "streams.lib" "_Stream_WriteFloat"
import _stream_writestr "streams.lib" "_Stream_WriteStr"
import _stream_readbyte "streams.lib" "_Stream_ReadByte"
import _stream_readword "streams.lib" "_Stream_ReadWord"
import _stream_readint "streams.lib" "_Stream_ReadInt"
import _stream_readfloat "streams.lib" "_Stream_ReadFloat"
import _stream_readstr "streams.lib" "_Stream_ReadStr"
import _stream_getsize "streams.lib" "_Stream_GetSize"
import _stream_clear "streams.lib" "_Stream_Clear"
import _stream_free "streams.lib" "_Stream_Free"
import _memorystream_create "streams.lib" "_MemoryStream_Create"
import _memorystream_free "streams.lib" "_MemoryStream_Free"
import _memorystream_loadfromstream "streams.lib" "_MemoryStream_LoadFromStream"
import _memorystream_storetostream "streams.lib" "_MemoryStream_StoreToStream"
import _memorystream_loadfromfile "streams.lib" "_MemoryStream_LoadFromFile"
import _memorystream_savetofile "streams.lib" "_MemoryStream_SaveToFile"
import _filestream_create "streams.lib" "_FileStream_Create"
import _filestream_free "streams.lib" "_FileStream_Free"
pushcp __gen_tstream__create_method_end_block
jp
tstream__create:
peek 248
pop
pushcp __gen_if_36_end


push 0
copy
gpm
swp
pop

pushcp __defc_gen_word_n338
swp
bg
gpm
jz
pop
peek 249
pop


push 249
gvbp


pushcp __class__child_streamptr
push 248
peekai
pushcp __gen_if_36_else_end
jp
__gen_if_36_end:



pushc __defc_gen_word_n339
gpm

peek 0
pop
pushcp _stream_create
invoke


pushcp __class__child_streamptr
push 248
peekai
__gen_if_36_else_end:
__gen_tstream__create_method_end:
jr
__gen_tstream__create_method_end_block:
pushcp __gen_tstream__free_method_end_block
jp
tstream__free:
peek 250
pop


push 250


pushcp __class__child_streamptr
push 250
pushai

pushc __defc_gen_word_n340
gpm

peek 0
pop
pushcp _stream_free
invoke
__gen_tstream__free_method_end:
jr
__gen_tstream__free_method_end_block:
pushcp __gen_tstream__seek_method_end_block
jp
tstream__seek:
peek 251
pop
peek 252
pop
peek 253
pop


push 253

push 252


pushcp __class__child_streamptr
push 251
pushai

pushc __defc_gen_word_n341
gpm

peek 0
pop
pushcp _stream_seek
invoke
__gen_tstream__seek_method_end:
jr
__gen_tstream__seek_method_end_block:
pushcp __gen_tstream__clear_method_end_block
jp
tstream__clear:
peek 254
pop



pushcp __class__child_streamptr
push 254
pushai

pushc __defc_gen_word_n342
gpm

peek 0
pop
pushcp _stream_clear
invoke
__gen_tstream__clear_method_end:
jr
__gen_tstream__clear_method_end_block:
pushcp __gen_tstream__getcaretpos_method_end_block
jp
tstream__getcaretpos:
peek 255
pop




pushcp __class__child_streamptr
push 255
pushai

pushc __defc_gen_word_n343
gpm

peek 0
pop
pushcp _stream_getcaretpos
invoke

pushc __defc_gen_word_n344
gpm

peek 0
pop
pushcp gpmx
jc
jr
__gen_tstream__getcaretpos_method_end:
jr
__gen_tstream__getcaretpos_method_end_block:
pushcp __gen_tstream__getsize_method_end_block
jp
tstream__getsize:
peek 256
pop




pushcp __class__child_streamptr
push 256
pushai

pushc __defc_gen_word_n345
gpm

peek 0
pop
pushcp _stream_getsize
invoke

pushc __defc_gen_word_n346
gpm

peek 0
pop
pushcp gpmx
jc
jr
__gen_tstream__getsize_method_end:
jr
__gen_tstream__getsize_method_end_block:
pushcp __gen_tstream__writefrommemorystream_method_end_block
jp
tstream__writefrommemorystream:
peek 257
pop
peek 258
pop
peek 259
pop


push 259

push 258


pushcp __class__child_streamptr
push 257
pushai

pushc __defc_gen_word_n347
gpm

peek 0
pop
pushcp _stream_writefrommemorystream
invoke
__gen_tstream__writefrommemorystream_method_end:
jr
__gen_tstream__writefrommemorystream_method_end_block:
pushcp __gen_tstream__readfrommemorystream_method_end_block
jp
tstream__readfrommemorystream:
peek 260
pop
peek 261
pop
peek 262
pop


push 262

push 261


pushcp __class__child_streamptr
push 260
pushai

pushc __defc_gen_word_n348
gpm

peek 0
pop
pushcp _stream_readfrommemorystream
invoke
__gen_tstream__readfrommemorystream_method_end:
jr
__gen_tstream__readfrommemorystream_method_end_block:
pushcp __gen_tstream__copyfromstream_method_end_block
jp
tstream__copyfromstream:
peek 263
pop
peek 264
pop
peek 265
pop


push 265

push 264


pushcp __class__child_streamptr
push 263
pushai

pushc __defc_gen_word_n349
gpm

peek 0
pop
pushcp _stream_readfrommemorystream
invoke
__gen_tstream__copyfromstream_method_end:
jr
__gen_tstream__copyfromstream_method_end_block:
pushcp __gen_tstream__write_method_end_block
jp
tstream__write:
peek 266
pop


push 0

peek 267
pop
__gen_while_18:
pushcp __gen_while_18_end


push 267
copy
gpm
swp
pop

pushcp __defc_gen_word_n350
swp
bg
gpm
jz
pop


pushc __defc_gen_word_n351
gpm

peek 0
pop

push 266

pushcp __class__child_writeu
push 266
pushai
jc
push 267
dec
pop
pushcp __gen_while_18
jp
__gen_while_18_end:
__gen_tstream__write_method_end:
jr
__gen_tstream__write_method_end_block:
pushcp __gen_tstream__writeu_method_end_block
jp
tstream__writeu:
peek 268
pop
peek 269
pop
__gen_switch_0:


push 269

pushc __defc_gen_word_n352
gpm

peek 0
pop
pushcp typeof
jc
__gen_case_0:
pcopy

pushc typeword
gpm
eq
gpm
pushcp __gen_case_0_end
swp
jz
pop


push 269

pushc __defc_gen_word_n353
gpm

peek 0
pop

push 268

pushcp __class__child_writeword
push 268
pushai
jc
pushcp __gen_switch_0_end
jp
pushcp __gen_switch_0_end
jp
__gen_case_0_end:
__gen_case_1:
pcopy

pushc typeint
gpm
eq
gpm
pushcp __gen_case_1_end
swp
jz
pop


push 269

pushc __defc_gen_word_n354
gpm

peek 0
pop

push 268

pushcp __class__child_writeint
push 268
pushai
jc
pushcp __gen_switch_0_end
jp
pushcp __gen_switch_0_end
jp
__gen_case_1_end:
__gen_case_2:
pcopy

pushc typereal
gpm
eq
gpm
pushcp __gen_case_2_end
swp
jz
pop


push 269

pushc __defc_gen_word_n355
gpm

peek 0
pop

push 268

pushcp __class__child_writefloat
push 268
pushai
jc
pushcp __gen_switch_0_end
jp
pushcp __gen_switch_0_end
jp
__gen_case_2_end:
__gen_case_3:
pcopy

pushc typestr
gpm
eq
gpm
pushcp __gen_case_3_end
swp
jz
pop


push 269

pushc __defc_gen_word_n356
gpm

peek 0
pop

push 268

pushcp __class__child_writestr
push 268
pushai
jc
pushcp __gen_switch_0_end
jp
pushcp __gen_switch_0_end
jp
__gen_case_3_end:

pushc __defc_gen_str_n357
gpm
trr
__gen_switch_0_end:
pop
__gen_tstream__writeu_method_end:
jr
__gen_tstream__writeu_method_end_block:
pushcp __gen_tstream__writebyte_method_end_block
jp
tstream__writebyte:
peek 270
pop
peek 271
pop


push 271


pushcp __class__child_streamptr
push 270
pushai

pushc __defc_gen_word_n358
gpm

peek 0
pop
pushcp _stream_writebyte
invoke
__gen_tstream__writebyte_method_end:
jr
__gen_tstream__writebyte_method_end_block:
pushcp __gen_tstream__writeword_method_end_block
jp
tstream__writeword:
peek 272
pop
peek 273
pop


push 273


pushcp __class__child_streamptr
push 272
pushai

pushc __defc_gen_word_n359
gpm

peek 0
pop
pushcp _stream_writeword
invoke
__gen_tstream__writeword_method_end:
jr
__gen_tstream__writeword_method_end_block:
pushcp __gen_tstream__writeint_method_end_block
jp
tstream__writeint:
peek 274
pop
peek 275
pop


push 275


pushcp __class__child_streamptr
push 274
pushai

pushc __defc_gen_word_n360
gpm

peek 0
pop
pushcp _stream_writeint
invoke
__gen_tstream__writeint_method_end:
jr
__gen_tstream__writeint_method_end_block:
pushcp __gen_tstream__writefloat_method_end_block
jp
tstream__writefloat:
peek 276
pop
peek 277
pop


push 277


pushcp __class__child_streamptr
push 276
pushai

pushc __defc_gen_word_n361
gpm

peek 0
pop
pushcp _stream_writefloat
invoke
__gen_tstream__writefloat_method_end:
jr
__gen_tstream__writefloat_method_end_block:
pushcp __gen_tstream__writestr_method_end_block
jp
tstream__writestr:
peek 278
pop
peek 279
pop


push 279


pushcp __class__child_streamptr
push 278
pushai

pushc __defc_gen_word_n362
gpm

peek 0
pop
pushcp _stream_writestr
invoke
__gen_tstream__writestr_method_end:
jr
__gen_tstream__writestr_method_end_block:
pushcp __gen_tstream__readbyte_method_end_block
jp
tstream__readbyte:
peek 280
pop
peek 281
pop


push 281


pushcp __class__child_streamptr
push 280
pushai

pushc __defc_gen_word_n363
gpm

peek 0
pop
pushcp _stream_readbyte
invoke
__gen_tstream__readbyte_method_end:
jr
__gen_tstream__readbyte_method_end_block:
pushcp __gen_tstream__readword_method_end_block
jp
tstream__readword:
peek 282
pop
peek 283
pop


push 283


pushcp __class__child_streamptr
push 282
pushai

pushc __defc_gen_word_n364
gpm

peek 0
pop
pushcp _stream_readword
invoke
__gen_tstream__readword_method_end:
jr
__gen_tstream__readword_method_end_block:
pushcp __gen_tstream__readint_method_end_block
jp
tstream__readint:
peek 284
pop
peek 285
pop


push 285


pushcp __class__child_streamptr
push 284
pushai

pushc __defc_gen_word_n365
gpm

peek 0
pop
pushcp _stream_readint
invoke
__gen_tstream__readint_method_end:
jr
__gen_tstream__readint_method_end_block:
pushcp __gen_tstream__readfloat_method_end_block
jp
tstream__readfloat:
peek 286
pop
peek 287
pop


push 287


pushcp __class__child_streamptr
push 286
pushai

pushc __defc_gen_word_n366
gpm

peek 0
pop
pushcp _stream_readfloat
invoke
__gen_tstream__readfloat_method_end:
jr
__gen_tstream__readfloat_method_end_block:
pushcp __gen_tstream__readstr_method_end_block
jp
tstream__readstr:
peek 288
pop
peek 289
pop
peek 290
pop


push 290

push 289


pushcp __class__child_streamptr
push 288
pushai

pushc __defc_gen_word_n367
gpm

peek 0
pop
pushcp _stream_readstr
invoke
__gen_tstream__readstr_method_end:
jr
__gen_tstream__readstr_method_end_block:
pushcp __gen_tmemorystream__create_method_end_block
jp
tmemorystream__create:
peek 291
pop
pushcp __gen_if_37_end


push 0
copy
gpm
swp
pop

pushcp __defc_gen_word_n368
swp
bg
gpm
jz
pop
peek 292
pop


push 292
gvbp


pushcp __class__child_streamptr
push 291
peekai
pushcp __gen_if_37_else_end
jp
__gen_if_37_end:



pushc __defc_gen_word_n369
gpm

peek 0
pop
pushcp _memorystream_create
invoke


pushcp __class__child_streamptr
push 291
peekai
__gen_if_37_else_end:
__gen_tmemorystream__create_method_end:
jr
__gen_tmemorystream__create_method_end_block:
pushcp __gen_tmemorystream__free_method_end_block
jp
tmemorystream__free:
peek 293
pop


push 293


pushcp __class__child_streamptr
push 293
pushai

pushc __defc_gen_word_n370
gpm

peek 0
pop
pushcp _memorystream_free
invoke
__gen_tmemorystream__free_method_end:
jr
__gen_tmemorystream__free_method_end_block:
pushcp __gen_tmemorystream__loadfromstream_method_end_block
jp
tmemorystream__loadfromstream:
peek 294
pop
peek 295
pop


push 295


pushcp __class__child_streamptr
push 294
pushai

pushc __defc_gen_word_n371
gpm

peek 0
pop
pushcp _memorystream_loadfromstream
invoke
__gen_tmemorystream__loadfromstream_method_end:
jr
__gen_tmemorystream__loadfromstream_method_end_block:
pushcp __gen_tmemorystream__storetostream_method_end_block
jp
tmemorystream__storetostream:
peek 296
pop
peek 297
pop


push 297


pushcp __class__child_streamptr
push 296
pushai

pushc __defc_gen_word_n372
gpm

peek 0
pop
pushcp _memorystream_storetostream
invoke
__gen_tmemorystream__storetostream_method_end:
jr
__gen_tmemorystream__storetostream_method_end_block:
pushcp __gen_tmemorystream__loadfromfile_method_end_block
jp
tmemorystream__loadfromfile:
peek 298
pop
peek 299
pop


push 299


pushcp __class__child_streamptr
push 298
pushai

pushc __defc_gen_word_n373
gpm

peek 0
pop
pushcp _memorystream_loadfromfile
invoke
__gen_tmemorystream__loadfromfile_method_end:
jr
__gen_tmemorystream__loadfromfile_method_end_block:
pushcp __gen_tmemorystream__savetofile_method_end_block
jp
tmemorystream__savetofile:
peek 300
pop
peek 301
pop


push 301


pushcp __class__child_streamptr
push 300
pushai

pushc __defc_gen_word_n374
gpm

peek 0
pop
pushcp _memorystream_savetofile
invoke
__gen_tmemorystream__savetofile_method_end:
jr
__gen_tmemorystream__savetofile_method_end_block:
word fmcreate 0xff00
word fmopenread 0x0000
word fmopenwrite 0x0001
word fmopenreadwrite 0x0002
word fmsharecompat 0x0000
word fmshareexclusive 0x0010
word fmsharedenywrite 0x0020
word fmsharedenyread 0x0030
word fmsharedenynone 0x0040
pushcp __gen_tfilestream__create_method_end_block
jp
tfilestream__create:
peek 302
pop
peek 303
pop
peek 304
pop



push 304

push 303

pushc __defc_gen_word_n375
gpm

peek 0
pop
pushcp _filestream_create
invoke


pushcp __class__child_streamptr
push 302
peekai
__gen_tfilestream__create_method_end:
jr
__gen_tfilestream__create_method_end_block:
pushcp __gen_tfilestream__free_method_end_block
jp
tfilestream__free:
peek 305
pop


push 305


pushcp __class__child_streamptr
push 305
pushai

pushc __defc_gen_word_n376
gpm

peek 0
pop
pushcp _filestream_free
invoke
__gen_tfilestream__free_method_end:
jr
__gen_tfilestream__free_method_end_block:


pushcp __gen_c_ord_method_end_block
jp
c_ord:
peek 307
pop

push 307
chord
gpm
__gen_c_ord_method_end:
jr
__gen_c_ord_method_end_block:
pushcp __gen_c_chr_method_end_block
jp
c_chr:
peek 308
pop

push 308
ordch
gpm
__gen_c_chr_method_end:
jr
__gen_c_chr_method_end_block:
pushcp __gen_s_len_method_end_block
jp
s_len:
peek 309
pop

push 309
alen
gpm
__gen_s_len_method_end:
jr
__gen_s_len_method_end_block:
pushcp __gen_s_del_method_end_block
jp
s_del:
peek 310
pop
peek 311
pop
peek 312
pop

push 311

push 312

push 310
strd
__gen_s_del_method_end:
jr
__gen_s_del_method_end_block:
pushcp __gen_s_copy_method_end_block
jp
s_copy:
peek 313
pop
peek 314
pop
peek 315
pop



push 313

pushc __defc_gen_word_n382
gpm

peek 0
pop
pushc copy
gpm
jc
peek 316
pop



push 316

pushc __defc_gen_word_n383
gpm

peek 0
pop
pushcp s_len
jc


push 314
copy
gpm
swp
pop

push 315
swp
add

pushcp __defc_gen_word_n384
swp
add

push 316

pushc __defc_gen_word_n385
gpm

peek 0
pop
pushcp s_del
jc



push 314
copy
gpm
swp
pop

pushcp __defc_gen_word_n386
swp
sub

pushc __defc_gen_word_n387
gpm

push 316

pushc __defc_gen_word_n388
gpm

peek 0
pop
pushcp s_del
jc

push 316
jr
__gen_s_copy_method_end:
jr
__gen_s_copy_method_end_block:
pushcp __gen_s_reverse_method_end_block
jp
s_reverse:
peek 317
pop



push 317

pushc __defc_gen_word_n389
gpm

peek 0
pop
pushcp s_len
jc

peek 319
pop
pushcp __gen_if_38_end


push 319
copy
gpm
swp
pop

pushcp __defc_gen_word_n390
swp
bg
gpm
jz
pop
pushcp __gen_if_39_end



pushcp __defc_gen_word_n391

push 319
copy
gpm
swp
pop
mod
peek 324
pop

push 324
copy
gpm
swp
pop
peek 324
pop

push 324
copy
gpm
swp
pop

pushcp __defc_gen_word_n392
eq
not
gpm
jz
pop



pushcp __defc_gen_word_n393
push 317
pushai

peek 320
pop



push 317

pushc __defc_gen_word_n394
gpm

peek 0
pop
pushcp copy
jc

peek 317
pop


pushc __defc_gen_word_n395
gpm

pushc __defc_gen_word_n396
gpm

push 317

pushc __defc_gen_word_n397
gpm

peek 0
pop
pushcp s_del
jc
pushcp __gen_if_39_else_end
jp
__gen_if_39_end:


pushc __defc_gen_str_n398
gpm

peek 320
pop
__gen_if_39_else_end:




pushcp __defc_gen_word_n399

push 319
copy
gpm
swp
pop
idiv
peek 324
pop

push 324
copy
gpm
swp
pop

pushcp __defc_gen_word_n400
swp
sub

pushc __defc_gen_word_n401
gpm

push 317

pushc __defc_gen_word_n402
gpm

peek 0
pop
pushcp s_copy
jc

peek 322
pop



push 319


pushcp __defc_gen_word_n403

push 319
copy
gpm
swp
pop
idiv
peek 324
pop

push 324
copy
gpm
swp
pop

pushcp __defc_gen_word_n404
swp
add

push 317

pushc __defc_gen_word_n405
gpm

peek 0
pop
pushcp s_copy
jc

peek 323
pop



push 322

pushc __defc_gen_word_n406
gpm

peek 0
pop
pushcp s_len
jc

push 319
mov


pushc __defc_gen_word_n407
gpm

peek 318
pop
__gen_while_19:
pushcp __gen_while_19_end


push 318
copy
gpm
swp
pop

push 319
bg
gpm
jz
pop





push 318
copy
gpm
swp
pop

pushcp __defc_gen_word_n408
swp
add
push 322
pushai

peek 321
pop





push 319
copy
gpm
swp
pop

push 318
swp
sub
push 323
pushai




push 318
copy
gpm
swp
pop

pushcp __defc_gen_word_n409
swp
add
push 322
peekai


push 321




push 319
copy
gpm
swp
pop

push 318
swp
sub
push 323
peekai
push 318
inc
pop
pushcp __gen_while_19
jp
__gen_while_19_end:



push 322
copy
gpm
swp
pop

push 323
swp
add

push 320
swp
add

peek 321
pop

push 321
jr
pushcp __gen_if_38_else_end
jp
__gen_if_38_end:

pushc __defc_gen_str_n410
gpm
jr
__gen_if_38_else_end:
__gen_s_reverse_method_end:
jr
__gen_s_reverse_method_end_block:
pushcp __gen_s_leftstr_method_end_block
jp
s_leftstr:
peek 325
pop
peek 326
pop


push 326

pushc __defc_gen_word_n411
gpm

push 325

pushc __defc_gen_word_n412
gpm

peek 0
pop
pushcp s_copy
jc
jr
__gen_s_leftstr_method_end:
jr
__gen_s_leftstr_method_end_block:
pushcp __gen_s_rightstr_method_end_block
jp
s_rightstr:
peek 327
pop
peek 328
pop


push 328



push 327

pushc __defc_gen_word_n413
gpm

peek 0
pop
pushcp s_len
jc

push 328
swp
sub

pushcp __defc_gen_word_n414
swp
add

push 327

pushc __defc_gen_word_n415
gpm

peek 0
pop
pushcp s_copy
jc
jr
__gen_s_rightstr_method_end:
jr
__gen_s_rightstr_method_end_block:
pushcp __gen_s_pos_method_end_block
jp
s_pos:
peek 329
pop
peek 330
pop




push 330

pushc __defc_gen_word_n416
gpm

peek 0
pop
pushcp s_len
jc

pushcp __defc_gen_word_n417
swp
add

peek 334
pop



push 329

pushc __defc_gen_word_n418
gpm

peek 0
pop
pushcp s_len
jc

peek 335
pop


pushc false
gpm

peek 336
pop


pushc __defc_gen_word_n419
gpm

peek 331
pop
__gen_while_20:
pushcp __gen_while_20_end


push 331
copy
gpm
swp
pop

push 334
bg
gpm
jz
pop
pushcp __gen_if_40_end

push 336
jz
pop


push 331
copy
gpm
swp
pop

pushcp __defc_gen_word_n420
swp
sub
jr
__gen_if_40_end:


pushc false
gpm

push 336
mov
pushcp __gen_if_41_end



pushcp __defc_gen_word_n421
push 329
pushai
copy
gpm
swp
pop


push 331
push 330
pushai
eq
gpm
jz
pop


pushc true
gpm

push 336
mov
pushcp __gen_if_42_end



push 329

pushc __defc_gen_word_n422
gpm

peek 0
pop
pushcp len
jc

pushcp __defc_gen_word_n423
swp
bg
gpm
jz
pop



push 331

pushc __defc_gen_word_n424
gpm

peek 0
pop
pushcp copy
jc

peek 333
pop

pushc __defc_gen_word_n425
gpm

peek 332
pop
__gen_for_19:
pushcp __gen_for_19_for_end


push 332
copy
gpm
swp
pop

push 335
bg
gpm
jz
pop

push 333
inc
pop
pushcp __gen_if_43_end



push 332
push 329
pushai
copy
gpm
swp
pop


push 333
push 330
pushai
eq
not
gpm
jz
pop


pushc false
gpm

push 336
mov
pushcp __gen_for_19_for_end
jp
__gen_if_43_end:

push 332
inc
pop
pushcp __gen_for_19
jp
__gen_for_19_for_end:

pushcp __gen_if_44_end


push 336
copy
gpm
swp
pop

pushcp false
eq
gpm
jz
pop


push 333

push 331
mov
__gen_if_44_end:
__gen_if_42_end:
__gen_if_41_end:
push 331
inc
pop
pushcp __gen_while_20
jp
__gen_while_20_end:

pushc __defc_gen_word_n426
gpm
jr
__gen_s_pos_method_end:
jr
__gen_s_pos_method_end_block:
pushcp __gen_s_posex_method_end_block
jp
s_posex:
peek 337
pop
peek 338
pop
peek 339
pop




push 338

pushc __defc_gen_word_n427
gpm

peek 0
pop
pushcp s_len
jc

pushcp __defc_gen_word_n428
swp
add

peek 343
pop



push 337

pushc __defc_gen_word_n429
gpm

peek 0
pop
pushcp s_len
jc

peek 344
pop


pushc false
gpm

peek 345
pop


pushc __defc_gen_word_n430
gpm

peek 340
pop
__gen_while_21:
pushcp __gen_while_21_end


push 340
copy
gpm
swp
pop

push 343
bg
gpm
jz
pop
pushcp __gen_if_45_end

push 345
jz
pop
pushcp __gen_if_46_end


push 339
copy
gpm
swp
pop

pushcp __defc_gen_word_n431
swp
bg
gpm
jz
pop
push 339
dec
pop
pushcp __gen_if_46_else_end
jp
__gen_if_46_end:


push 340
copy
gpm
swp
pop

pushcp __defc_gen_word_n432
swp
sub
jr
__gen_if_46_else_end:
__gen_if_45_end:


pushc false
gpm

push 345
mov
pushcp __gen_if_47_end



pushcp __defc_gen_word_n433
push 337
pushai
copy
gpm
swp
pop


push 340
push 338
pushai
eq
gpm
jz
pop


pushc true
gpm

push 345
mov
pushcp __gen_if_48_end



push 337

pushc __defc_gen_word_n434
gpm

peek 0
pop
pushcp len
jc

pushcp __defc_gen_word_n435
swp
bg
gpm
jz
pop


pushc true
gpm

push 345
mov



push 340

pushc __defc_gen_word_n436
gpm

peek 0
pop
pushcp copy
jc

peek 342
pop

pushc __defc_gen_word_n437
gpm

peek 341
pop
__gen_for_20:
pushcp __gen_for_20_for_end


push 341
copy
gpm
swp
pop

push 344
bg
gpm
jz
pop

push 342
inc
pop
pushcp __gen_if_49_end



push 341
push 337
pushai
copy
gpm
swp
pop


push 342
push 338
pushai
eq
not
gpm
jz
pop


pushc false
gpm

push 345
mov
pushcp __gen_for_20_for_end
jp
__gen_if_49_end:

push 341
inc
pop
pushcp __gen_for_20
jp
__gen_for_20_for_end:

pushcp __gen_if_50_end


push 345
copy
gpm
swp
pop

pushcp false
eq
gpm
jz
pop


push 342

push 340
mov
__gen_if_50_end:
__gen_if_48_end:
__gen_if_47_end:
push 340
inc
pop
pushcp __gen_while_21
jp
__gen_while_21_end:

pushc __defc_gen_word_n438
gpm
jr
__gen_s_posex_method_end:
jr
__gen_s_posex_method_end_block:
pushcp __gen_s_trimleft_method_end_block
jp
s_trimleft:
peek 346
pop



push 346

pushc __defc_gen_word_n439
gpm

peek 0
pop
pushc copy
gpm
jc
peek 347
pop
__gen_while_22:
pushcp __gen_while_22_end



push 347

pushc __defc_gen_word_n440
gpm

peek 0
pop
pushcp s_len
jc

pushcp __defc_gen_word_n441
swp
bg
gpm
jz
pop
pushcp __gen_if_51_end



pushcp __defc_gen_word_n442
push 347
pushai
copy
gpm
swp
pop

pushcp __defc_gen_str_n443
eq
gpm
jz
pop


pushc __defc_gen_word_n444
gpm

pushc __defc_gen_word_n445
gpm

push 347

pushc __defc_gen_word_n446
gpm

peek 0
pop
pushcp s_del
jc
pushcp __gen_if_51_else_end
jp
__gen_if_51_end:
pushcp __gen_while_22_end
jp
__gen_if_51_else_end:
pushcp __gen_while_22
jp
__gen_while_22_end:

push 347
jr
__gen_s_trimleft_method_end:
jr
__gen_s_trimleft_method_end_block:
pushcp __gen_s_trimright_method_end_block
jp
s_trimright:
peek 348
pop



push 348

pushc __defc_gen_word_n447
gpm

peek 0
pop
pushc copy
gpm
jc
peek 349
pop
__gen_while_23:
pushcp __gen_while_23_end



push 349

pushc __defc_gen_word_n448
gpm

peek 0
pop
pushcp s_len
jc

pushcp __defc_gen_word_n449
swp
bg
gpm
jz
pop
pushcp __gen_if_52_end




push 349

pushc __defc_gen_word_n450
gpm

peek 0
pop
pushcp s_len
jc
push 349
pushai
copy
gpm
swp
pop

pushcp __defc_gen_str_n451
eq
gpm
jz
pop


pushc __defc_gen_word_n452
gpm


push 349

pushc __defc_gen_word_n453
gpm

peek 0
pop
pushcp s_len
jc

push 349

pushc __defc_gen_word_n454
gpm

peek 0
pop
pushcp s_del
jc
pushcp __gen_if_52_else_end
jp
__gen_if_52_end:
pushcp __gen_while_23_end
jp
__gen_if_52_else_end:
pushcp __gen_while_23
jp
__gen_while_23_end:

push 349
jr
__gen_s_trimright_method_end:
jr
__gen_s_trimright_method_end_block:
pushcp __gen_s_trim_method_end_block
jp
s_trim:
peek 350
pop



push 350

pushc __defc_gen_word_n455
gpm

peek 0
pop
pushc copy
gpm
jc
peek 351
pop



push 351

pushc __defc_gen_word_n456
gpm

peek 0
pop
pushcp s_trimright
jc

push 351
mov



push 351

pushc __defc_gen_word_n457
gpm

peek 0
pop
pushcp s_trimleft
jc

push 351
mov

push 351
jr
__gen_s_trim_method_end:
jr
__gen_s_trim_method_end_block:
pushcp __gen_s_replace_method_end_block
jp
s_replace:
peek 352
pop
peek 353
pop
peek 354
pop
peek 355
pop



push 352

pushc __defc_gen_word_n458
gpm

peek 0
pop
pushc copy
gpm
jc
peek 356
pop

pushcp __gen_if_53_end


pushc srfignorecase
gpm

push 355
swp
pushcp _op_in
jc
jz
pop




push 356

pushc __defc_gen_word_n459
gpm

peek 0
pop
pushcp strupper
jc


push 353

pushc __defc_gen_word_n460
gpm

peek 0
pop
pushcp strupper
jc

pushc __defc_gen_word_n461
gpm

peek 0
pop
pushcp s_pos
jc

peek 357
pop
pushcp __gen_if_53_else_end
jp
__gen_if_53_end:



push 356

push 353

pushc __defc_gen_word_n462
gpm

peek 0
pop
pushcp s_pos
jc

peek 357
pop
__gen_if_53_else_end:
__gen_while_24:
pushcp __gen_while_24_end


push 357
copy
gpm
swp
pop

pushcp __defc_gen_word_n463
swp
bg
gpm
jz
pop




push 356

pushc __defc_gen_word_n464
gpm

peek 0
pop
pushcp s_len
jc


push 357
copy
gpm
swp
pop


push 353

pushc __defc_gen_word_n465
gpm

peek 0
pop
pushcp s_len
jc
swp
add

push 356

pushc __defc_gen_word_n466
gpm

peek 0
pop
pushcp s_copy
jc

peek 352
pop





push 357
copy
gpm
swp
pop

pushcp __defc_gen_word_n467
swp
sub

pushc __defc_gen_word_n468
gpm

push 356

pushc __defc_gen_word_n469
gpm

peek 0
pop
pushcp s_copy
jc

push 354
swp
add

push 352
swp
add

push 356
mov
pushcp __gen_if_54_end


pushc srfignorecase
gpm

push 355
swp
pushcp _op_in
jc
jz
pop




push 356

pushc __defc_gen_word_n470
gpm

peek 0
pop
pushcp strupper
jc


push 353

pushc __defc_gen_word_n471
gpm

peek 0
pop
pushcp strupper
jc

pushc __defc_gen_word_n472
gpm

peek 0
pop
pushcp s_pos
jc

push 357
mov
pushcp __gen_if_54_else_end
jp
__gen_if_54_end:



push 356

push 353

pushc __defc_gen_word_n473
gpm

peek 0
pop
pushcp s_pos
jc

push 357
mov
__gen_if_54_else_end:
pushcp __gen_while_24
jp
__gen_while_24_end:
pushcp __gen_if_55_end


pushc srfreplaceall
gpm

push 355
swp
pushcp _op_in
jc
jz
pop
pushcp __gen_if_56_end


pushc srfignorecase
gpm

push 355
swp
pushcp _op_in
jc
jz
pop




push 356

pushc __defc_gen_word_n474
gpm

peek 0
pop
pushcp strupper
jc

push 353

pushc __defc_gen_word_n475
gpm

peek 0
pop
pushcp s_pos
jc

push 357
mov
pushcp __gen_if_56_else_end
jp
__gen_if_56_end:



push 356

push 353

pushc __defc_gen_word_n476
gpm

peek 0
pop
pushcp s_pos
jc

push 357
mov
__gen_if_56_else_end:
pushcp __gen_if_57_end


push 357
copy
gpm
swp
pop

pushcp __defc_gen_word_n477
swp
bg
gpm
jz
pop



push 355

push 354

push 353

push 356

pushc __defc_gen_word_n478
gpm

peek 0
pop
pushcp s_replace
jc

push 356
mov
__gen_if_57_end:
__gen_if_55_end:

push 356
jr
__gen_s_replace_method_end:
jr
__gen_s_replace_method_end_block:


pushcp __gen_stringlist__settext_method_end_block
jp
stringlist__settext:
peek 358
pop
peek 359
pop


pushc __defc_gen_word_n479
gpm

peek 0
pop

push 358

pushcp __class__child_clear
push 358
pushai
jc



push 359

push 306

pushc __defc_gen_word_n480
gpm

peek 0
pop
pushcp s_pos
jc

peek 360
pop
__gen_while_25:
pushcp __gen_while_25_end


push 360
copy
gpm
swp
pop

pushcp __defc_gen_word_n481
swp
bg
gpm
jz
pop




push 360
copy
gpm
swp
pop

pushcp __defc_gen_word_n482
swp
sub

pushc __defc_gen_word_n483
gpm

push 359

pushc __defc_gen_word_n484
gpm

peek 0
pop
pushcp s_copy
jc

pushc __defc_gen_word_n485
gpm

peek 0
pop

push 358

pushcp __class__child_add
push 358
pushai
jc



push 360
copy
gpm
swp
pop


push 306

pushc __defc_gen_word_n486
gpm

peek 0
pop
pushcp len
jc
swp
add

pushcp __defc_gen_word_n487
swp
sub

pushc __defc_gen_word_n488
gpm

push 359

pushc __defc_gen_word_n489
gpm

peek 0
pop
pushcp s_del
jc



push 359

push 306

pushc __defc_gen_word_n490
gpm

peek 0
pop
pushcp s_pos
jc

peek 360
pop
pushcp __gen_while_25
jp
__gen_while_25_end:
pushcp __gen_if_58_end



push 359

pushc __defc_gen_word_n491
gpm

peek 0
pop
pushcp len
jc

pushcp __defc_gen_word_n492
swp
bg
gpm
jz
pop


push 359

pushc __defc_gen_word_n493
gpm

peek 0
pop

push 358

pushcp __class__child_add
push 358
pushai
jc
__gen_if_58_end:
__gen_stringlist__settext_method_end:
jr
__gen_stringlist__settext_method_end_block:
pushcp __gen_stringlist__gettext_method_end_block
jp
stringlist__gettext:
peek 361
pop


pushc __defc_gen_str_n494
gpm

peek 362
pop

pushc __defc_gen_word_n495
gpm

peek 363
pop
__gen_for_21:
pushcp __gen_for_21_for_end


push 363
copy
gpm
swp
pop


pushcp __class__child_size
push 361
pushai
bg
gpm
jz
pop





push 363
pushcp __class__child_items
push 361
pushai
pushai

push 362
add
pop
pushcp __gen_if_59_end


push 363
copy
gpm
swp
pop

pushcp __defc_gen_word_n496
swp
add


pushcp __class__child_size
push 361
pushai
bg
gpm
jz
pop



push 306

push 362
add
pop
__gen_if_59_end:

push 363
inc
pop
pushcp __gen_for_21
jp
__gen_for_21_for_end:


push 362
jr
__gen_stringlist__gettext_method_end:
jr
__gen_stringlist__gettext_method_end_block:
pushcp __gen_stringlist__savetofile_method_end_block
jp
stringlist__savetofile:
peek 364
pop
peek 365
pop

pushcp __class_tfilestream_allocator
jc
pcopy


pushc fmcreate
gpm
swp

push 365
swp

pushc __defc_gen_word_n497
gpm

peek 0
pop
pushcp tfilestream__create
jc

peek 366
pop



pushc __defc_gen_word_n498
gpm

peek 0
pop

push 364

pushcp __class__child_gettext
push 364
pushai
jc

pushc __defc_gen_word_n499
gpm

peek 0
pop

push 366

pushcp __class__child_writestr
push 366
pushai
jc


pushc __defc_gen_word_n500
gpm

peek 0
pop

push 366

pushcp __class__child_free
push 366
pushai
jc
__gen_stringlist__savetofile_method_end:
jr
__gen_stringlist__savetofile_method_end_block:
pushcp __gen_stringlist__loadfromfile_method_end_block
jp
stringlist__loadfromfile:
peek 367
pop
peek 368
pop

pushcp __class_tfilestream_allocator
jc
pcopy


pushc fmopenread
gpm
swp

push 368
swp

pushc __defc_gen_word_n501
gpm

peek 0
pop
pushcp tfilestream__create
jc

peek 369
pop


pushc __defc_gen_str_n502
gpm

peek 370
pop



pushc __defc_gen_word_n503
gpm

peek 0
pop

push 369

pushcp __class__child_getsize
push 369
pushai
jc

peek 371
pop


push 371

push 370

pushc __defc_gen_word_n504
gpm

peek 0
pop

push 369

pushcp __class__child_readstr
push 369
pushai
jc


pushc __defc_gen_word_n505
gpm

peek 0
pop

push 369

pushcp __class__child_free
push 369
pushai
jc


pushc __defc_gen_word_n506
gpm

peek 0
pop

push 367

pushcp __class__child_clear
push 367
pushai
jc



push 370

push 306

pushc __defc_gen_word_n507
gpm

peek 0
pop
pushcp s_pos
jc

peek 372
pop
__gen_while_26:
pushcp __gen_while_26_end


push 372
copy
gpm
swp
pop

pushcp __defc_gen_word_n508
swp
bg
gpm
jz
pop




push 372
copy
gpm
swp
pop

pushcp __defc_gen_word_n509
swp
sub

pushc __defc_gen_word_n510
gpm

push 370

pushc __defc_gen_word_n511
gpm

peek 0
pop
pushcp s_copy
jc

pushc __defc_gen_word_n512
gpm

peek 0
pop

push 367

pushcp __class__child_add
push 367
pushai
jc



push 372
copy
gpm
swp
pop


push 306

pushc __defc_gen_word_n513
gpm

peek 0
pop
pushcp len
jc
swp
add

pushc __defc_gen_word_n514
gpm

push 370

pushc __defc_gen_word_n515
gpm

peek 0
pop
pushcp s_del
jc



push 370

push 306

pushc __defc_gen_word_n516
gpm

peek 0
pop
pushcp s_pos
jc

peek 372
pop
pushcp __gen_while_26
jp
__gen_while_26_end:
pushcp __gen_if_60_end



push 370

pushc __defc_gen_word_n517
gpm

peek 0
pop
pushcp len
jc

pushcp __defc_gen_word_n518
swp
bg
gpm
jz
pop


push 370

pushc __defc_gen_word_n519
gpm

peek 0
pop

push 367

pushcp __class__child_add
push 367
pushai
jc
__gen_if_60_end:
__gen_stringlist__loadfromfile_method_end:
jr
__gen_stringlist__loadfromfile_method_end_block:


pushcp __gen_map__create_method_end_block
jp
map__create:
peek 373
pop

pushcp __class_list_allocator
jc
pcopy


pushc __defc_gen_word_n520
gpm

peek 0
pop
pushcp list__create
jc


pushcp __class__child_objects
push 373
peekai

pushcp __class_list_allocator
jc
pcopy


pushc __defc_gen_word_n521
gpm

peek 0
pop
pushcp list__create
jc


pushcp __class__child_keys
push 373
peekai
__gen_map__create_method_end:
jr
__gen_map__create_method_end_block:
pushcp __gen_map__free_method_end_block
jp
map__free:
peek 374
pop


pushc __defc_gen_word_n522
gpm

peek 0
pop


pushcp __class__child_objects
push 374
pushai

pushcp __class__child_free
pushcp __class__child_objects
push 374
pushai
pushai
jc


pushc __defc_gen_word_n523
gpm

peek 0
pop


pushcp __class__child_keys
push 374
pushai

pushcp __class__child_free
pushcp __class__child_keys
push 374
pushai
pushai
jc


push 374

pushc __defc_gen_word_n524
gpm

peek 0
pop
pushcp free
jc
__gen_map__free_method_end:
jr
__gen_map__free_method_end_block:
pushcp __gen_map__add_method_end_block
jp
map__add:
peek 375
pop
peek 376
pop
peek 377
pop



push 377

pushc __defc_gen_word_n525
gpm

peek 0
pop


pushcp __class__child_keys
push 375
pushai

pushcp __class__child_nextins
pushcp __class__child_keys
push 375
pushai
pushai
jc

push 376

pushc __defc_gen_word_n526
gpm

peek 0
pop


pushcp __class__child_objects
push 375
pushai

pushcp __class__child_insert
pushcp __class__child_objects
push 375
pushai
pushai
jc
__gen_map__add_method_end:
jr
__gen_map__add_method_end_block:
pushcp __gen_map__delete_method_end_block
jp
map__delete:
peek 378
pop
peek 379
pop



push 379

pushc __defc_gen_word_n527
gpm

peek 0
pop


pushcp __class__child_keys
push 378
pushai

pushcp __class__child_find
pushcp __class__child_keys
push 378
pushai
pushai
jc

peek 380
pop


push 380

pushc __defc_gen_word_n528
gpm

peek 0
pop


pushcp __class__child_keys
push 378
pushai

pushcp __class__child_delete
pushcp __class__child_keys
push 378
pushai
pushai
jc


push 380

pushc __defc_gen_word_n529
gpm

peek 0
pop


pushcp __class__child_objects
push 378
pushai

pushcp __class__child_delete
pushcp __class__child_objects
push 378
pushai
pushai
jc
__gen_map__delete_method_end:
jr
__gen_map__delete_method_end_block:
pushcp __gen_map__deleteat_method_end_block
jp
map__deleteat:
peek 381
pop
peek 382
pop


push 382

pushc __defc_gen_word_n530
gpm

peek 0
pop


pushcp __class__child_keys
push 381
pushai

pushcp __class__child_delete
pushcp __class__child_keys
push 381
pushai
pushai
jc


push 382

pushc __defc_gen_word_n531
gpm

peek 0
pop


pushcp __class__child_objects
push 381
pushai

pushcp __class__child_delete
pushcp __class__child_objects
push 381
pushai
pushai
jc
__gen_map__deleteat_method_end:
jr
__gen_map__deleteat_method_end_block:
pushcp __gen_map__clear_method_end_block
jp
map__clear:
peek 383
pop


pushc __defc_gen_word_n532
gpm

peek 0
pop


pushcp __class__child_keys
push 383
pushai

pushcp __class__child_clear
pushcp __class__child_keys
push 383
pushai
pushai
jc


pushc __defc_gen_word_n533
gpm

peek 0
pop


pushcp __class__child_objects
push 383
pushai

pushcp __class__child_clear
pushcp __class__child_objects
push 383
pushai
pushai
jc
__gen_map__clear_method_end:
jr
__gen_map__clear_method_end_block:
pushcp __gen_map__get_method_end_block
jp
map__get:
peek 384
pop
peek 385
pop



push 385

pushc __defc_gen_word_n534
gpm

peek 0
pop


pushcp __class__child_keys
push 384
pushai

pushcp __class__child_find
pushcp __class__child_keys
push 384
pushai
pushai
jc
pushcp __class__child_items
pushcp __class__child_objects
push 384
pushai
pushai
pushai
jr
__gen_map__get_method_end:
jr
__gen_map__get_method_end_block:
pushcp __gen_map__at_method_end_block
jp
map__at:
peek 386
pop
peek 387
pop


push 387
pushcp __class__child_items
pushcp __class__child_objects
push 386
pushai
pushai
pushai
jr
__gen_map__at_method_end:
jr
__gen_map__at_method_end_block:
pushcp __gen_map__keyat_method_end_block
jp
map__keyat:
peek 388
pop
peek 389
pop


push 389
pushcp __class__child_items
pushcp __class__child_keys
push 388
pushai
pushai
pushai
jr
__gen_map__keyat_method_end:
jr
__gen_map__keyat_method_end_block:
pushcp __gen_map__indexof_method_end_block
jp
map__indexof:
peek 390
pop
peek 391
pop


push 391

pushc __defc_gen_word_n535
gpm

peek 0
pop


pushcp __class__child_objects
push 390
pushai

pushcp __class__child_indexof
pushcp __class__child_objects
push 390
pushai
pushai
jc
jr
__gen_map__indexof_method_end:
jr
__gen_map__indexof_method_end_block:
pushcp __gen_map__keyindexof_method_end_block
jp
map__keyindexof:
peek 392
pop
peek 393
pop


push 393

pushc __defc_gen_word_n536
gpm

peek 0
pop


pushcp __class__child_keys
push 392
pushai

pushcp __class__child_find
pushcp __class__child_keys
push 392
pushai
pushai
jc
jr
__gen_map__keyindexof_method_end:
jr
__gen_map__keyindexof_method_end_block:
pushcp __gen_map__size_method_end_block
jp
map__size:
peek 394
pop



pushcp __class__child_size
pushcp __class__child_keys
push 394
pushai
pushai

pushc __defc_gen_word_n537
gpm

peek 0
pop
pushcp copy
jc
jr
__gen_map__size_method_end:
jr
__gen_map__size_method_end_block:
pushcp __gen_hashmap__add_method_end_block
jp
hashmap__add:
peek 395
pop
peek 396
pop



pushc __defc_gen_word_n538
gpm

peek 0
pop

push 396

pushcp __class__child_gethash
push 396
pushai
jc

push 396

push 395

pushc __defc_gen_word_n539
gpm

peek 0
pop
pushcp map__add
jc
__gen_hashmap__add_method_end:
jr
__gen_hashmap__add_method_end_block:
pushcp __gen_hashmap__indexof_method_end_block
jp
hashmap__indexof:
peek 397
pop
peek 398
pop



pushc __defc_gen_word_n540
gpm

peek 0
pop

push 398

pushcp __class__child_gethash
push 398
pushai
jc

pushc __defc_gen_word_n541
gpm

peek 0
pop

push 397

pushcp __class__child_keyindexof
push 397
pushai
jc
jr
__gen_hashmap__indexof_method_end:
jr
__gen_hashmap__indexof_method_end_block:
pushcp __gen_getstrhash_method_end_block
jp
getstrhash:
peek 399
pop



push 399

pushc __defc_gen_word_n542
gpm

peek 0
pop
pushcp len
jc

peek 400
pop



push 400

pushc __defc_gen_word_n543
gpm

peek 0
pop
pushcp copy
jc

peek 401
pop

pushc __defc_gen_word_n544
gpm

peek 402
pop
__gen_for_22:
pushcp __gen_for_22_for_end


push 402
copy
gpm
swp
pop

push 400
be
gpm
jz
pop





push 402

push 401
copy
gpm
swp
pop
mul
peek 403
pop

push 403
copy
gpm
swp
pop

push 400
swp
add
peek 403
pop

push 403
copy
gpm
swp
pop


push 402
push 399
pushai
swp
xor

push 401
mov

push 402
inc
pop
pushcp __gen_for_22
jp
__gen_for_22_for_end:


push 401
jr
__gen_getstrhash_method_end:
jr
__gen_getstrhash_method_end_block:
pushcp __gen_stringmap__add_method_end_block
jp
stringmap__add:
peek 404
pop
peek 405
pop



push 405

pushc __defc_gen_word_n545
gpm

peek 0
pop
pushcp getstrhash
jc

push 405

push 404

pushc __defc_gen_word_n546
gpm

peek 0
pop
pushcp map__add
jc
__gen_stringmap__add_method_end:
jr
__gen_stringmap__add_method_end_block:
pushcp __gen_stringmap__indexof_method_end_block
jp
stringmap__indexof:
peek 406
pop
peek 407
pop



push 407

pushc __defc_gen_word_n547
gpm

peek 0
pop
pushcp getstrhash
jc

pushc __defc_gen_word_n548
gpm

peek 0
pop

push 406

pushcp __class__child_keyindexof
push 406
pushai
jc
jr
__gen_stringmap__indexof_method_end:
jr
__gen_stringmap__indexof_method_end_block:


pushcp __gen_tree__create_method_end_block
jp
tree__create:
peek 408
pop
peek 409
pop

pushcp __class_list_allocator
jc
pcopy


pushc __defc_gen_word_n549
gpm

peek 0
pop
pushcp list__create
jc


pushcp __class__child_nodes
push 408
peekai


push 409


pushcp __class__child_value
push 408
peekai
__gen_tree__create_method_end:
jr
__gen_tree__create_method_end_block:
pushcp __gen_tree__free_method_end_block
jp
tree__free:
peek 410
pop


pushc __defc_gen_word_n550
gpm

peek 0
pop


pushcp __class__child_nodes
push 410
pushai

pushcp __class__child_free
pushcp __class__child_nodes
push 410
pushai
pushai
jc


push 410

pushc __defc_gen_word_n551
gpm

peek 0
pop
pushcp free
jc
__gen_tree__free_method_end:
jr
__gen_tree__free_method_end_block:
pushcp __gen_tree__clear_method_end_block
jp
tree__clear:
peek 411
pop


pushc tree__clear
gpm

pushc __defc_gen_word_n552
gpm

peek 0
pop


pushcp __class__child_nodes
push 411
pushai

pushcp __class__child_foreach
pushcp __class__child_nodes
push 411
pushai
pushai
jc


pushc tree__free
gpm

pushc __defc_gen_word_n553
gpm

peek 0
pop


pushcp __class__child_nodes
push 411
pushai

pushcp __class__child_foreach
pushcp __class__child_nodes
push 411
pushai
pushai
jc


pushc __defc_gen_word_n554
gpm

peek 0
pop


pushcp __class__child_nodes
push 411
pushai

pushcp __class__child_clear
pushcp __class__child_nodes
push 411
pushai
pushai
jc
__gen_tree__clear_method_end:
jr
__gen_tree__clear_method_end_block:
pushcp __gen_tree__addnode_method_end_block
jp
tree__addnode:
peek 412
pop
peek 413
pop

pushcp __class_tree_allocator
jc
pcopy


push 413
swp

pushc __defc_gen_word_n555
gpm

peek 0
pop
pushcp tree__create
jc

peek 414
pop


push 414

pushc __defc_gen_word_n556
gpm

peek 0
pop


pushcp __class__child_nodes
push 412
pushai

pushcp __class__child_add
pushcp __class__child_nodes
push 412
pushai
pushai
jc

push 414
jr
__gen_tree__addnode_method_end:
jr
__gen_tree__addnode_method_end_block:
pushcp __gen_tree__getnode_method_end_block
jp
tree__getnode:
peek 415
pop
peek 416
pop


push 416

pushc __defc_gen_word_n557
gpm

peek 0
pop


pushcp __class__child_nodes
push 415
pushai

pushcp __class__child_get
pushcp __class__child_nodes
push 415
pushai
pushai
jc
jr
__gen_tree__getnode_method_end:
jr
__gen_tree__getnode_method_end_block:
pushcp __gen_tree__delnode_method_end_block
jp
tree__delnode:
peek 417
pop
peek 418
pop



push 418

pushc __defc_gen_word_n558
gpm

peek 0
pop


pushcp __class__child_nodes
push 417
pushai

pushcp __class__child_get
pushcp __class__child_nodes
push 417
pushai
pushai
jc

peek 419
pop


pushc __defc_gen_word_n559
gpm

peek 0
pop

push 419

pushcp __class__child_free
push 419
pushai
jc


push 418

pushc __defc_gen_word_n560
gpm

peek 0
pop


pushcp __class__child_nodes
push 417
pushai

pushcp __class__child_delete
pushcp __class__child_nodes
push 417
pushai
pushai
jc
__gen_tree__delnode_method_end:
jr
__gen_tree__delnode_method_end_block:
pushcp __gen_thr_create_method_end_block
jp
thr_create:
peek 420
pop
peek 421
pop

push 421

push 420
cthr
__gen_thr_create_method_end:
jr
__gen_thr_create_method_end_block:
pushcp __gen_thr_async_method_end_block
jp
thr_async:
peek 422
pop
peek 423
pop

push 423

push 422
cthr
rthr
__gen_thr_async_method_end:
jr
__gen_thr_async_method_end_block:
pushcp __gen_thr_resume_method_end_block
jp
thr_resume:
peek 424
pop

push 424
rthr
__gen_thr_resume_method_end:
jr
__gen_thr_resume_method_end_block:
pushcp __gen_thr_suspend_method_end_block
jp
thr_suspend:
peek 425
pop

push 425
sthr
__gen_thr_suspend_method_end:
jr
__gen_thr_suspend_method_end_block:
pushcp __gen_thr_terminate_method_end_block
jp
thr_terminate:
peek 426
pop

push 426
tthr
__gen_thr_terminate_method_end:
jr
__gen_thr_terminate_method_end_block:
pushcp __gen_thr_setpriority_method_end_block
jp
thr_setpriority:
peek 427
pop
peek 428
pop

push 428

push 427
thsp
__gen_thr_setpriority_method_end:
jr
__gen_thr_setpriority_method_end_block:
pushcp __gen_thr_kill_method_end_block
jp
thr_kill:
peek 429
pop


push 429

pushc __defc_gen_word_n561
gpm

peek 0
pop
pushcp thr_suspend
jc


push 429

pushc __defc_gen_word_n562
gpm

peek 0
pop
pushcp thr_terminate
jc
__gen_thr_kill_method_end:
jr
__gen_thr_kill_method_end_block:
pushcp __gen_tthread__execute_method_end_block
jp
tthread__execute:
peek 430
pop
__gen_tthread__execute_method_end:
jr
__gen_tthread__execute_method_end_block:
pushcp __gen_tthread_join_method_end_block
jp
tthread_join:
peek 431
pop
peek 432
pop


pushc __defc_gen_word_n563
gpm

peek 0
pop

push 432

pushcp __class__child_execute
push 432
pushai
jc


pushc __defc_gen_word_n564
gpm

peek 0
pop

push 432

pushcp __class__child_terminate
push 432
pushai
jc
__gen_tthread_join_method_end:
jr
__gen_tthread_join_method_end_block:
pushcp __gen_tthread__create_method_end_block
jp
tthread__create:
peek 433
pop
peek 434
pop



pushc false
gpm

pushc __defc_gen_word_n565
gpm

peek 0
pop
pushcp new
jc


pushcp __class__child_resumed
push 433
peekai



pushc false
gpm

pushc __defc_gen_word_n566
gpm

peek 0
pop
pushcp new
jc


pushcp __class__child_terminated
push 433
peekai



pushc true
gpm

pushc __defc_gen_word_n567
gpm

peek 0
pop
pushcp new
jc


pushcp __class__child_freeonterminate
push 433
peekai



push 433

pushc tthread_join
gpm

pushc __defc_gen_word_n568
gpm

peek 0
pop
pushcp thr_create
jc


pushcp __class__child_threadcontext
push 433
peekai
pushcp __gen_if_61_end

push 434
jz
pop


pushc __defc_gen_word_n569
gpm

peek 0
pop

push 433

pushcp __class__child_resume
push 433
pushai
jc
__gen_if_61_end:
__gen_tthread__create_method_end:
jr
__gen_tthread__create_method_end_block:
pushcp __gen_tthread__free_method_end_block
jp
tthread__free:
peek 435
pop
pushcp __gen_if_62_end



pushcp __class__child_terminated
push 435
pushai
copy
gpm
swp
pop
not
jz
pop


pushc false
gpm


pushcp __class__child_freeonterminate
push 435
pushai
mov


pushc __defc_gen_word_n570
gpm

peek 0
pop

push 435

pushcp __class__child_terminate
push 435
pushai
jc
__gen_if_62_end:


push 435


pushcp __class__child_freeonterminate
push 435
pushai


pushcp __class__child_terminated
push 435
pushai


pushcp __class__child_resumed
push 435
pushai

pushc __defc_gen_word_n571
gpm

peek 0
pop
pushcp free
jc
__gen_tthread__free_method_end:
jr
__gen_tthread__free_method_end_block:
pushcp __gen_tthread__rejoin_method_end_block
jp
tthread__rejoin:
peek 436
pop
peek 437
pop



push 436

pushc tthread_join
gpm

pushc __defc_gen_word_n572
gpm

peek 0
pop
pushcp thread
jc


pushcp __class__child_threadcontext
push 436
peekai
pushcp __gen_if_63_end

push 437
jz
pop


pushc __defc_gen_word_n573
gpm

peek 0
pop

push 436

pushcp __class__child_resume
push 436
pushai
jc
__gen_if_63_end:
__gen_tthread__rejoin_method_end:
jr
__gen_tthread__rejoin_method_end_block:
pushcp __gen_tthread__suspend_method_end_block
jp
tthread__suspend:
peek 438
pop



pushcp __class__child_threadcontext
push 438
pushai

pushc __defc_gen_word_n574
gpm

peek 0
pop
pushcp thr_suspend
jc


pushc false
gpm


pushcp __class__child_resumed
push 438
pushai
mov
__gen_tthread__suspend_method_end:
jr
__gen_tthread__suspend_method_end_block:
pushcp __gen_tthread__resume_method_end_block
jp
tthread__resume:
peek 439
pop



pushcp __class__child_threadcontext
push 439
pushai

pushc __defc_gen_word_n575
gpm

peek 0
pop
pushcp thr_resume
jc


pushc true
gpm


pushcp __class__child_resumed
push 439
pushai
mov
__gen_tthread__resume_method_end:
jr
__gen_tthread__resume_method_end_block:
pushcp __gen_tthread__setpriority_method_end_block
jp
tthread__setpriority:
peek 440
pop
peek 441
pop


push 441


pushcp __class__child_threadcontext
push 440
pushai

pushc __defc_gen_word_n576
gpm

peek 0
pop
pushcp thr_setpriority
jc
__gen_tthread__setpriority_method_end:
jr
__gen_tthread__setpriority_method_end_block:
pushcp __gen_tthread__terminate_method_end_block
jp
tthread__terminate:
peek 442
pop


pushc false
gpm


pushcp __class__child_resumed
push 442
pushai
mov


pushc true
gpm


pushcp __class__child_terminated
push 442
pushai
mov



pushcp __class__child_threadcontext
push 442
pushai

peek 443
pop
pushcp __gen_if_64_end


pushcp __class__child_freeonterminate
push 442
pushai
jz
pop


pushc __defc_gen_word_n577
gpm

peek 0
pop

push 442

pushcp __class__child_free
push 442
pushai
jc
__gen_if_64_end:


push 443

pushc __defc_gen_word_n578
gpm

peek 0
pop
pushcp thr_terminate
jc
__gen_tthread__terminate_method_end:
jr
__gen_tthread__terminate_method_end_block:
pushcp __gen_tthread__waitfor_method_end_block
jp
tthread__waitfor:
peek 444
pop



pushcp __class__child_freeonterminate
push 444
pushai

peek 445
pop


pushc false
gpm


pushcp __class__child_freeonterminate
push 444
pushai
mov
__gen_while_27:
pushcp __gen_while_27_end



pushcp __class__child_terminated
push 444
pushai
copy
gpm
swp
pop
not
jz
pop


pushc __defc_gen_word_n579
gpm

pushc __defc_gen_word_n580
gpm

peek 0
pop
pushcp sleep
invoke
pushcp __gen_while_27
jp
__gen_while_27_end:
pushcp __gen_if_65_end

push 445
jz
pop


pushc __defc_gen_word_n581
gpm

peek 0
pop

push 444

pushcp __class__child_free
push 444
pushai
jc
__gen_if_65_end:
__gen_tthread__waitfor_method_end:
jr
__gen_tthread__waitfor_method_end_block:
pushcp __gen_tasynccallthread__create_method_end_block
jp
tasynccallthread__create:
peek 446
pop
peek 447
pop
peek 448
pop


push 447


pushcp __class__child_method
push 446
peekai


push 448


pushcp __class__child_args
push 446
peekai


pushc true
gpm

push 446

pushc __defc_gen_word_n582
gpm

peek 0
pop
pushcp tthread__create
jc
__gen_tasynccallthread__create_method_end:
jr
__gen_tasynccallthread__create_method_end_block:
pushcp __gen_tasynccallthread__execute_method_end_block
jp
tasynccallthread__execute:
peek 449
pop
__gen_while_28:
pushcp __gen_while_28_end



pushc __defc_gen_word_n583
gpm

peek 0
pop


pushcp __class__child_args
push 449
pushai

pushcp __class__child_size
pushcp __class__child_args
push 449
pushai
pushai
jc

pushcp __defc_gen_word_n584
swp
bg
gpm
jz
pop


pushc __defc_gen_word_n585
gpm

peek 0
pop


pushcp __class__child_args
push 449
pushai

pushcp __class__child_pop_back
pushcp __class__child_args
push 449
pushai
pushai
jc
pushcp __gen_while_28
jp
__gen_while_28_end:


pushc __defc_gen_word_n586
gpm

peek 0
pop


pushcp __class__child_args
push 449
pushai

pushcp __class__child_free
pushcp __class__child_args
push 449
pushai
pushai
jc


pushcp __class__child_method
push 449
pushai
copy
gpm
swp
pop
jc
__gen_tasynccallthread__execute_method_end:
jr
__gen_tasynccallthread__execute_method_end_block:
pushcp __gen_async_method_end_block
jp
async:
peek 450
pop

pushcp __class_vector_allocator
jc
pcopy


pushc __defc_gen_word_n587
gpm

peek 0
pop
pushcp vector__create
jc

peek 451
pop


push 0

peek 452
pop
__gen_while_29:
pushcp __gen_while_29_end


push 452
copy
gpm
swp
pop

pushcp __defc_gen_word_n588
swp
bg
gpm
jz
pop
peek 453
pop


push 453

pushc __defc_gen_word_n589
gpm

peek 0
pop

push 451

pushcp __class__child_push_back
push 451
pushai
jc



push 452
dec
pop
pushcp __gen_while_29
jp
__gen_while_29_end:

pushcp __class_tasynccallthread_allocator
jc
pcopy


push 451
swp

push 450
swp

pushc __defc_gen_word_n590
gpm

peek 0
pop
pushcp tasynccallthread__create
jc
jr
__gen_async_method_end:
jr
__gen_async_method_end_block:
pushcp __gen_tqthreadcallthread__create_method_end_block
jp
tqthreadcallthread__create:
peek 454
pop
peek 455
pop
peek 456
pop


push 455


pushcp __class__child_method
push 454
peekai


push 456


pushcp __class__child_args
push 454
peekai


pushc false
gpm

push 454

pushc __defc_gen_word_n591
gpm

peek 0
pop
pushcp tthread__create
jc
__gen_tqthreadcallthread__create_method_end:
jr
__gen_tqthreadcallthread__create_method_end_block:
pushcp __gen_tqthreadcallthread__execute_method_end_block
jp
tqthreadcallthread__execute:
peek 457
pop
__gen_while_30:
pushcp __gen_while_30_end



pushc __defc_gen_word_n592
gpm

peek 0
pop


pushcp __class__child_args
push 457
pushai

pushcp __class__child_size
pushcp __class__child_args
push 457
pushai
pushai
jc

pushcp __defc_gen_word_n593
swp
bg
gpm
jz
pop


pushc __defc_gen_word_n594
gpm

peek 0
pop


pushcp __class__child_args
push 457
pushai

pushcp __class__child_pop_back
pushcp __class__child_args
push 457
pushai
pushai
jc
pushcp __gen_while_30
jp
__gen_while_30_end:


pushc __defc_gen_word_n595
gpm

peek 0
pop


pushcp __class__child_args
push 457
pushai

pushcp __class__child_free
pushcp __class__child_args
push 457
pushai
pushai
jc


pushcp __class__child_method
push 457
pushai
copy
gpm
swp
pop
jc
__gen_tqthreadcallthread__execute_method_end:
jr
__gen_tqthreadcallthread__execute_method_end_block:
pushcp __gen_thread_method_end_block
jp
thread:
peek 458
pop

pushcp __class_vector_allocator
jc
pcopy


pushc __defc_gen_word_n596
gpm

peek 0
pop
pushcp vector__create
jc

peek 459
pop


push 0

peek 460
pop
__gen_while_31:
pushcp __gen_while_31_end


push 460
copy
gpm
swp
pop

pushcp __defc_gen_word_n597
swp
bg
gpm
jz
pop
peek 461
pop


push 461

pushc __defc_gen_word_n598
gpm

peek 0
pop

push 459

pushcp __class__child_push_back
push 459
pushai
jc



push 460
dec
pop
pushcp __gen_while_31
jp
__gen_while_31_end:

pushcp __class_tqthreadcallthread_allocator
jc
pcopy


push 459
swp

push 458
swp

pushc __defc_gen_word_n599
gpm

peek 0
pop
pushcp tqthreadcallthread__create
jc
jr
__gen_thread_method_end:
jr
__gen_thread_method_end_block:
pushcp __gen_tparallelcallthread__create_method_end_block
jp
tparallelcallthread__create:
peek 462
pop
peek 463
pop
peek 464
pop


push 463


pushcp __class__child_method
push 462
peekai


push 464


pushcp __class__child_args
push 462
peekai


pushc false
gpm

push 462

pushc __defc_gen_word_n600
gpm

peek 0
pop
pushcp tthread__create
jc


pushc false
gpm


pushcp __class__child_freeonterminate
push 462
pushai
mov


pushc __defc_gen_word_n601
gpm

peek 0
pop

push 462

pushcp __class__child_resume
push 462
pushai
jc
__gen_tparallelcallthread__create_method_end:
jr
__gen_tparallelcallthread__create_method_end_block:
pushcp __gen_tparallelcallthread__execute_method_end_block
jp
tparallelcallthread__execute:
peek 465
pop
__gen_while_32:
pushcp __gen_while_32_end



pushc __defc_gen_word_n602
gpm

peek 0
pop


pushcp __class__child_args
push 465
pushai

pushcp __class__child_size
pushcp __class__child_args
push 465
pushai
pushai
jc

pushcp __defc_gen_word_n603
swp
bg
gpm
jz
pop


pushc __defc_gen_word_n604
gpm

peek 0
pop


pushcp __class__child_args
push 465
pushai

pushcp __class__child_pop_back
pushcp __class__child_args
push 465
pushai
pushai
jc
pushcp __gen_while_32
jp
__gen_while_32_end:


pushc __defc_gen_word_n605
gpm

peek 0
pop


pushcp __class__child_args
push 465
pushai

pushcp __class__child_free
pushcp __class__child_args
push 465
pushai
pushai
jc


pushcp __class__child_method
push 465
pushai
copy
gpm
swp
pop
jc
__gen_tparallelcallthread__execute_method_end:
jr
__gen_tparallelcallthread__execute_method_end_block:
pushcp __gen_parallel_method_end_block
jp
parallel:
peek 466
pop

pushcp __class_vector_allocator
jc
pcopy


pushc __defc_gen_word_n606
gpm

peek 0
pop
pushcp vector__create
jc

peek 467
pop


push 0

peek 468
pop
__gen_while_33:
pushcp __gen_while_33_end


push 468
copy
gpm
swp
pop

pushcp __defc_gen_word_n607
swp
bg
gpm
jz
pop
peek 469
pop


push 469

pushc __defc_gen_word_n608
gpm

peek 0
pop

push 467

pushcp __class__child_push_back
push 467
pushai
jc



push 468
dec
pop
pushcp __gen_while_33
jp
__gen_while_33_end:

pushcp __class_tparallelcallthread_allocator
jc
pcopy


push 467
swp

push 466
swp

pushc __defc_gen_word_n609
gpm

peek 0
pop
pushcp tparallelcallthread__create
jc
jr
__gen_parallel_method_end:
jr
__gen_parallel_method_end_block:






pushcp __gen_snake__create_method_end_block
jp
snake__create:
peek 470
pop
pushcp __class_vector_allocator
jc
pcopy


pushc __defc_gen_word_n610
gpm

peek 0
pop
pushcp vector__create
jc


pushcp __class__child_body
push 470
peekai
pushcp __class_point_allocator
jc
pcopy


pushc __defc_gen_word_n611
gpm
swp

pushc __defc_gen_word_n612
gpm
swp

pushc __defc_gen_word_n613
gpm

peek 0
pop
pushcp point__create
jc

pushc __defc_gen_word_n614
gpm

peek 0
pop


pushcp __class__child_body
push 470
pushai

pushcp __class__child_push_back
pushcp __class__child_body
push 470
pushai
pushai
jc
pushcp __class_point_allocator
jc
pcopy


pushc __defc_gen_word_n615
gpm
swp

pushc __defc_gen_word_n616
gpm
swp

pushc __defc_gen_word_n617
gpm

peek 0
pop
pushcp point__create
jc

pushc __defc_gen_word_n618
gpm

peek 0
pop


pushcp __class__child_body
push 470
pushai

pushcp __class__child_push_back
pushcp __class__child_body
push 470
pushai
pushai
jc
pushcp __class_point_allocator
jc
pcopy


pushc __defc_gen_word_n619
gpm
swp

pushc __defc_gen_word_n620
gpm
swp

pushc __defc_gen_word_n621
gpm

peek 0
pop
pushcp point__create
jc

pushc __defc_gen_word_n622
gpm

peek 0
pop


pushcp __class__child_body
push 470
pushai

pushcp __class__child_push_back
pushcp __class__child_body
push 470
pushai
pushai
jc
pushc smvright
gpm

pushc __defc_gen_word_n623
gpm

peek 0
pop
pushcp new
jc


pushcp __class__child_movingvector
push 470
peekai
__gen_snake__create_method_end:
jr
__gen_snake__create_method_end_block:
pushcp __gen_snake__free_method_end_block
jp
snake__free:
peek 471
pop
pushc __defc_gen_word_n624
gpm

peek 0
pop


pushcp __class__child_body
push 471
pushai

pushcp __class__child_free
pushcp __class__child_body
push 471
pushai
pushai
jc
push 471


pushcp __class__child_movingvector
push 471
pushai

pushc __defc_gen_word_n625
gpm

peek 0
pop
pushcp free
jc
__gen_snake__free_method_end:
jr
__gen_snake__free_method_end_block:

str snake_char "@"
str food_char "&"
str border_char "#"
pushcp __gen_putch_method_end_block
jp
putch:
peek 480
pop
peek 481
pop
peek 482
pop
push 481

push 480

pushc __defc_gen_word_n629
gpm

peek 0
pop
pushcp crt.gotoxy
jc
push 482

pushc __defc_gen_word_n630
gpm

peek 0
pop
pushcp print
jc
__gen_putch_method_end:
jr
__gen_putch_method_end_block:
pushcp __gen_drawborders_method_end_block
jp
drawborders:
pushc __defc_gen_word_n631
gpm

peek 483
pop
__gen_for_23:
pushcp __gen_for_23_for_end


push 483
copy
gpm
swp
pop

pushcp __defc_gen_word_n632
bg
gpm
jz
pop
pushc __defc_gen_word_n633
gpm

peek 484
pop
__gen_for_24:
pushcp __gen_for_24_for_end


push 484
copy
gpm
swp
pop

pushcp __defc_gen_word_n634
bg
gpm
jz
pop
pushcp __gen_if_66_end



push 483
copy
gpm
swp
pop

pushcp __defc_gen_word_n635
eq
gpm
peek 485
pop


push 483
copy
gpm
swp
pop

pushcp __defc_gen_word_n636
eq
gpm
peek 486
pop

push 485
copy
gpm
swp
pop

push 486
swp
or
jz
pop
pushc border_char
gpm

push 483

push 484

pushc __defc_gen_word_n637
gpm

peek 0
pop
pushcp putch
jc
pushcp __gen_if_66_else_end
jp
__gen_if_66_end:
pushcp __gen_if_67_end



push 484
copy
gpm
swp
pop

pushcp __defc_gen_word_n638
eq
gpm
peek 485
pop


push 484
copy
gpm
swp
pop

pushcp __defc_gen_word_n639
eq
gpm
peek 486
pop

push 485
copy
gpm
swp
pop

push 486
swp
or
jz
pop
pushc border_char
gpm

push 483

push 484

pushc __defc_gen_word_n640
gpm

peek 0
pop
pushcp putch
jc
__gen_if_67_end:
__gen_if_66_else_end:
push 484
inc
pop
pushcp __gen_for_24
jp
__gen_for_24_for_end:
push 483
inc
pop
pushcp __gen_for_23
jp
__gen_for_23_for_end:
__gen_drawborders_method_end:
jr
__gen_drawborders_method_end_block:
pushcp __gen_randfood_method_end_block
jp
randfood:
pushc __defc_gen_word_n641
gpm

pushc __defc_gen_word_n642
gpm

peek 0
pop
pushcp randomb
jc

pushcp __defc_gen_word_n643
swp
add



pushc __defc_gen_word_n644
gpm

pushc __defc_gen_word_n645
gpm

peek 0
pop
pushcp randomb
jc

pushcp __defc_gen_word_n646
swp
add

pushc __defc_gen_word_n647
gpm

peek 0
pop

push 473

pushcp __class__child_set
push 473
pushai
jc
pushc __defc_gen_word_n648
gpm

peek 487
pop
__gen_for_25:
pushcp __gen_for_25_for_end


push 487
copy
gpm
swp
pop


pushc __defc_gen_word_n649
gpm

peek 0
pop


pushcp __class__child_body
push 472
pushai

pushcp __class__child_size
pushcp __class__child_body
push 472
pushai
pushai
jc
bg
gpm
jz
pop
pushcp __gen_if_68_end




pushcp __class__child_x
push 473
pushai
copy
gpm
swp
pop


pushcp __class__child_x
push 487
pushcp __class__child_items
pushcp __class__child_body
push 472
pushai
pushai
pushai
pushai
eq
gpm
peek 488
pop



pushcp __class__child_y
push 473
pushai
copy
gpm
swp
pop


pushcp __class__child_y
push 487
pushcp __class__child_items
pushcp __class__child_body
push 472
pushai
pushai
pushai
pushai
eq
gpm
peek 489
pop

push 488
copy
gpm
swp
pop

push 489
swp
and
jz
pop
pushc __defc_gen_word_n650
gpm

peek 0
pop
pushcp randfood
jc
pushcp __gen_for_25_for_end
jp
__gen_if_68_end:
push 487
inc
pop
pushcp __gen_for_25
jp
__gen_for_25_for_end:
__gen_randfood_method_end:
jr
__gen_randfood_method_end_block:
pushcp __gen_movesnake_method_end_block
jp
movesnake:
peek 490
pop
peek 491
pop
pushc __defc_gen_word_n651
gpm

peek 0
pop


pushcp __class__child_body
push 472
pushai

pushcp __class__child_peek_back
pushcp __class__child_body
push 472
pushai
pushai
jc

peek 492
pop
pushcp __class_point_allocator
jc
pcopy




pushcp __class__child_y
push 492
pushai
copy
gpm
swp
pop

push 491
swp
add
swp



pushcp __class__child_x
push 492
pushai
copy
gpm
swp
pop

push 490
swp
add
swp

pushc __defc_gen_word_n652
gpm

peek 0
pop
pushcp point__create
jc

peek 493
pop
pushcp __gen_if_69_end




pushcp __class__child_x
push 493
pushai
copy
gpm
swp
pop


pushcp __class__child_x
push 473
pushai
eq
gpm
peek 494
pop



pushcp __class__child_y
push 493
pushai
copy
gpm
swp
pop


pushcp __class__child_y
push 473
pushai
eq
gpm
peek 495
pop

push 494
copy
gpm
swp
pop

push 495
swp
and
jz
pop
pushc __defc_gen_word_n653
gpm

peek 0
pop
pushcp randfood
jc
pushc food_char
gpm


pushcp __class__child_y
push 473
pushai


pushcp __class__child_x
push 473
pushai

pushc __defc_gen_word_n654
gpm

peek 0
pop
pushcp putch
jc
push 474
inc
pop
pushc __defc_gen_str_n655
gpm


push 474

pushc __defc_gen_word_n656
gpm

peek 0
pop
pushcp i2s
jc
swp
add

pushcp __defc_gen_str_n657
swp
add

pushc __defc_gen_word_n658
gpm

pushc __defc_gen_word_n659
gpm

pushc __defc_gen_word_n660
gpm

peek 0
pop
pushcp putch
jc
pushcp __gen_if_69_else_end
jp
__gen_if_69_end:
pushc __defc_gen_word_n661
gpm

peek 0
pop


pushcp __class__child_body
push 472
pushai

pushcp __class__child_pop_first
pushcp __class__child_body
push 472
pushai
pushai
jc

peek 496
pop
pushc __defc_gen_str_n662
gpm


pushcp __class__child_y
push 496
pushai


pushcp __class__child_x
push 496
pushai

pushc __defc_gen_word_n663
gpm

peek 0
pop
pushcp putch
jc
pushc __defc_gen_word_n664
gpm

peek 0
pop

push 496

pushcp __class__child_free
push 496
pushai
jc
pushc __defc_gen_word_n665
gpm

peek 497
pop
__gen_for_26:
pushcp __gen_for_26_for_end


push 497
copy
gpm
swp
pop


pushc __defc_gen_word_n666
gpm

peek 0
pop


pushcp __class__child_body
push 472
pushai

pushcp __class__child_size
pushcp __class__child_body
push 472
pushai
pushai
jc
bg
gpm
jz
pop
pushcp __gen_if_70_end




pushcp __class__child_x
push 493
pushai
copy
gpm
swp
pop


pushcp __class__child_x
push 497
pushcp __class__child_items
pushcp __class__child_body
push 472
pushai
pushai
pushai
pushai
eq
gpm
peek 494
pop



pushcp __class__child_y
push 493
pushai
copy
gpm
swp
pop


pushcp __class__child_y
push 497
pushcp __class__child_items
pushcp __class__child_body
push 472
pushai
pushai
pushai
pushai
eq
gpm
peek 495
pop

push 494
copy
gpm
swp
pop

push 495
swp
and
jz
pop
pushc true
gpm

push 479
mov
__gen_if_70_end:
push 497
inc
pop
pushcp __gen_for_26
jp
__gen_for_26_for_end:
pushcp __gen_if_71_end




pushcp __class__child_x
push 493
pushai
copy
gpm
swp
pop

pushcp __defc_gen_word_n667
eq
gpm
peek 494
pop



pushcp __class__child_x
push 493
pushai
copy
gpm
swp
pop

pushcp __defc_gen_word_n668
eq
gpm
peek 495
pop



pushcp __class__child_y
push 493
pushai
copy
gpm
swp
pop

pushcp __defc_gen_word_n669
eq
gpm
peek 498
pop



pushcp __class__child_y
push 493
pushai
copy
gpm
swp
pop

pushcp __defc_gen_word_n670
eq
gpm
peek 499
pop

push 494
copy
gpm
swp
pop

push 495
swp
or

push 498
swp
or

push 499
swp
or
jz
pop
pushc true
gpm

push 479
mov
__gen_if_71_end:
__gen_if_69_else_end:
pushc food_char
gpm


pushcp __class__child_y
push 473
pushai


pushcp __class__child_x
push 473
pushai

pushc __defc_gen_word_n671
gpm

peek 0
pop
pushcp putch
jc
pushc snake_char
gpm


pushcp __class__child_y
push 493
pushai


pushcp __class__child_x
push 493
pushai

pushc __defc_gen_word_n672
gpm

peek 0
pop
pushcp putch
jc
push 493

pushc __defc_gen_word_n673
gpm

peek 0
pop


pushcp __class__child_body
push 472
pushai

pushcp __class__child_push_back
pushcp __class__child_body
push 472
pushai
pushai
jc
__gen_movesnake_method_end:
jr
__gen_movesnake_method_end_block:
pushcp __gen_gametick_method_end_block
jp
gametick:
__gen_switch_1:


pushcp __class__child_movingvector
push 472
pushai
__gen_case_4:
pcopy

pushc smvleft
gpm
eq
gpm
pushcp __gen_case_4_end
swp
jz
pop
pushc __defc_gen_word_n674
gpm


pushc __defc_gen_word_n675
gpm

pushcp __defc_gen_word_n676
swp
sub

pushc __defc_gen_word_n677
gpm

peek 0
pop
pushcp movesnake
jc
pushcp __gen_switch_1_end
jp
pushcp __gen_switch_1_end
jp
__gen_case_4_end:
__gen_case_5:
pcopy

pushc smvright
gpm
eq
gpm
pushcp __gen_case_5_end
swp
jz
pop
pushc __defc_gen_word_n678
gpm

pushc __defc_gen_word_n679
gpm

pushc __defc_gen_word_n680
gpm

peek 0
pop
pushcp movesnake
jc
pushcp __gen_switch_1_end
jp
pushcp __gen_switch_1_end
jp
__gen_case_5_end:
__gen_case_6:
pcopy

pushc smvup
gpm
eq
gpm
pushcp __gen_case_6_end
swp
jz
pop
pushc __defc_gen_word_n681
gpm

pushcp __defc_gen_word_n682
swp
sub

pushc __defc_gen_word_n683
gpm

pushc __defc_gen_word_n684
gpm

peek 0
pop
pushcp movesnake
jc
pushcp __gen_switch_1_end
jp
pushcp __gen_switch_1_end
jp
__gen_case_6_end:
__gen_case_7:
pcopy

pushc smvdown
gpm
eq
gpm
pushcp __gen_case_7_end
swp
jz
pop
pushc __defc_gen_word_n685
gpm

pushc __defc_gen_word_n686
gpm

pushc __defc_gen_word_n687
gpm

peek 0
pop
pushcp movesnake
jc
pushcp __gen_switch_1_end
jp
pushcp __gen_switch_1_end
jp
__gen_case_7_end:
__gen_switch_1_end:
pop
__gen_gametick_method_end:
jr
__gen_gametick_method_end_block:
pushcp __gen_controlthread_method_end_block
jp
controlthread:
__gen_while_34:
pushcp __gen_while_34_end

pushc true
gpm
jz
pop
pushcp __gen_if_72_end


push 478
copy
gpm
swp
pop
not
jz
pop
pushc __defc_gen_word_n688
gpm

peek 0
pop
pushcp crt.readkey
jc

peek 500
pop
__gen_switch_2:


push 500

pushc __defc_gen_word_n689
gpm

peek 0
pop
pushcp strupper
jc
__gen_case_8:
pcopy

pushc __defc_gen_str_n690
gpm
eq
gpm
pushcp __gen_case_8_end
swp
jz
pop
pushcp __gen_if_73_end



pushcp __class__child_movingvector
push 472
pushai
copy
gpm
swp
pop

pushcp smvdown
eq
gpm
jz
pop
pushcp __gen_switch_2_end
jp
__gen_if_73_end:
pushc smvup
gpm


pushcp __class__child_movingvector
push 472
pushai
mov
pushcp __gen_switch_2_end
jp
__gen_case_8_end:
__gen_case_9:
pcopy

pushc __defc_gen_str_n691
gpm
eq
gpm
pushcp __gen_case_9_end
swp
jz
pop
pushcp __gen_if_74_end



pushcp __class__child_movingvector
push 472
pushai
copy
gpm
swp
pop

pushcp smvup
eq
gpm
jz
pop
pushcp __gen_switch_2_end
jp
__gen_if_74_end:
pushc smvdown
gpm


pushcp __class__child_movingvector
push 472
pushai
mov
pushcp __gen_switch_2_end
jp
__gen_case_9_end:
__gen_case_10:
pcopy

pushc __defc_gen_str_n692
gpm
eq
gpm
pushcp __gen_case_10_end
swp
jz
pop
pushcp __gen_if_75_end



pushcp __class__child_movingvector
push 472
pushai
copy
gpm
swp
pop

pushcp smvright
eq
gpm
jz
pop
pushcp __gen_switch_2_end
jp
__gen_if_75_end:
pushc smvleft
gpm


pushcp __class__child_movingvector
push 472
pushai
mov
pushcp __gen_switch_2_end
jp
__gen_case_10_end:
__gen_case_11:
pcopy

pushc __defc_gen_str_n693
gpm
eq
gpm
pushcp __gen_case_11_end
swp
jz
pop
pushcp __gen_if_76_end



pushcp __class__child_movingvector
push 472
pushai
copy
gpm
swp
pop

pushcp smvleft
eq
gpm
jz
pop
pushcp __gen_switch_2_end
jp
__gen_if_76_end:
pushc smvright
gpm


pushcp __class__child_movingvector
push 472
pushai
mov
pushcp __gen_switch_2_end
jp
__gen_case_11_end:
__gen_switch_2_end:
pop
pushc __defc_gen_word_n694
gpm

peek 0
pop

push 477

pushcp __class__child_enter
push 477
pushai
jc
pushc true
gpm

push 478
mov
pushc __defc_gen_word_n695
gpm

peek 0
pop

push 477

pushcp __class__child_leave
push 477
pushai
jc
__gen_if_72_end:
pushc __defc_gen_word_n696
gpm

pushc __defc_gen_word_n697
gpm

peek 0
pop
pushcp sleep
invoke
__gen_while_35:
pushcp __gen_while_35_end

push 479
jz
pop
pushc __defc_gen_word_n698
gpm

pushc __defc_gen_word_n699
gpm

peek 0
pop
pushcp sleep
invoke
pushcp __gen_while_35
jp
__gen_while_35_end:
pushc __defc_gen_word_n700
gpm

peek 0
pop
pushcp gc
jc
pushcp __gen_while_34
jp
__gen_while_34_end:
__gen_controlthread_method_end:
jr
__gen_controlthread_method_end_block:
pushcp __gen_main_method_end_block
jp
main:
pushcp __class_snake_allocator
jc
pcopy


pushc __defc_gen_word_n701
gpm

peek 0
pop
pushcp snake__create
jc

peek 472
pop
pushcp __class_point_allocator
jc
pcopy


pushc __defc_gen_word_n702
gpm
swp

pushc __defc_gen_word_n703
gpm
swp

pushc __defc_gen_word_n704
gpm

peek 0
pop
pushcp point__create
jc

peek 473
pop
pushc __defc_gen_word_n705
gpm

peek 0
pop
pushcp randomize
invoke
pushc controlthread
gpm

pushc __defc_gen_word_n706
gpm

peek 0
pop
pushcp async
jc

peek 476
pop
pushc crt.white
gpm

pushc __defc_gen_word_n707
gpm

peek 0
pop
pushcp crt.textbackground
invoke
pushc __defc_gen_word_n708
gpm

peek 0
pop
pushcp crt.clrscr
invoke
pushc crt.black
gpm

pushc __defc_gen_word_n709
gpm

peek 0
pop
pushcp crt.textcolor
invoke
pushc crt.black
gpm

pushc __defc_gen_word_n710
gpm

peek 0
pop
pushcp crt.textbackground
invoke
pushc __defc_gen_word_n711
gpm

peek 0
pop
pushcp drawborders
jc
pushc crt.white
gpm

pushc __defc_gen_word_n712
gpm

peek 0
pop
pushcp crt.textbackground
invoke
pushc snake_char
gpm


pushcp __class__child_y
pushcp __defc_gen_word_n713
pushcp __class__child_items
pushcp __class__child_body
push 472
pushai
pushai
pushai
pushai


pushcp __class__child_x
pushcp __defc_gen_word_n714
pushcp __class__child_items
pushcp __class__child_body
push 472
pushai
pushai
pushai
pushai

pushc __defc_gen_word_n715
gpm

peek 0
pop
pushcp putch
jc
pushc snake_char
gpm


pushcp __class__child_y
pushcp __defc_gen_word_n716
pushcp __class__child_items
pushcp __class__child_body
push 472
pushai
pushai
pushai
pushai


pushcp __class__child_x
pushcp __defc_gen_word_n717
pushcp __class__child_items
pushcp __class__child_body
push 472
pushai
pushai
pushai
pushai

pushc __defc_gen_word_n718
gpm

peek 0
pop
pushcp putch
jc
pushc snake_char
gpm


pushcp __class__child_y
pushcp __defc_gen_word_n719
pushcp __class__child_items
pushcp __class__child_body
push 472
pushai
pushai
pushai
pushai


pushcp __class__child_x
pushcp __defc_gen_word_n720
pushcp __class__child_items
pushcp __class__child_body
push 472
pushai
pushai
pushai
pushai

pushc __defc_gen_word_n721
gpm

peek 0
pop
pushcp putch
jc
pushc __defc_gen_word_n722
gpm

pushc __defc_gen_word_n723
gpm

peek 0
pop
pushcp randomb
jc

pushcp __defc_gen_word_n724
swp
add



pushc __defc_gen_word_n725
gpm

pushc __defc_gen_word_n726
gpm

peek 0
pop
pushcp randomb
jc

pushcp __defc_gen_word_n727
swp
add

pushc __defc_gen_word_n728
gpm

peek 0
pop

push 473

pushcp __class__child_set
push 473
pushai
jc
pushc food_char
gpm


pushcp __class__child_y
push 473
pushai


pushcp __class__child_x
push 473
pushai

pushc __defc_gen_word_n729
gpm

peek 0
pop
pushcp putch
jc
pushc __defc_gen_str_n730
gpm

pushc __defc_gen_word_n731
gpm

pushc __defc_gen_word_n732
gpm

pushc __defc_gen_word_n733
gpm

peek 0
pop
pushcp putch
jc
pushc __defc_gen_str_n734
gpm

pushc __defc_gen_word_n735
gpm

pushc __defc_gen_word_n736
gpm

pushc __defc_gen_word_n737
gpm

peek 0
pop
pushcp putch
jc
pushc __defc_gen_str_n738
gpm

pushc __defc_gen_word_n739
gpm

pushc __defc_gen_word_n740
gpm

pushc __defc_gen_word_n741
gpm

peek 0
pop
pushcp putch
jc
__gen_while_36:
pushcp __gen_while_36_end


push 479
copy
gpm
swp
pop
not
jz
pop
pushc __defc_gen_word_n742
gpm

peek 0
pop
pushcp tickcnt
jc

peek 501
pop
pushc __defc_gen_word_n743
gpm

peek 0
pop
pushcp crt.cursoroff
invoke
pushcp __gen_if_77_end

push 478
jz
pop
pushc __defc_gen_word_n744
gpm

peek 0
pop

push 477

pushcp __class__child_enter
push 477
pushai
jc
pushc false
gpm

push 478
mov
pushc __defc_gen_word_n745
gpm

peek 0
pop

push 477

pushcp __class__child_leave
push 477
pushai
jc
__gen_if_77_end:
push 475

pushc __defc_gen_word_n746
gpm

peek 0
pop
pushcp sleep
invoke
pushc __defc_gen_word_n747
gpm

peek 0
pop
pushcp gametick
jc
pushc crt.white
gpm

pushc __defc_gen_word_n748
gpm

peek 0
pop
pushcp crt.textcolor
invoke
pushc __defc_gen_word_n749
gpm

peek 0
pop
pushcp tickcnt
jc

push 501
swp
sub
peek 502
pop

push 502

pushc __defc_gen_word_n750
gpm
idiv
peek 503
pop

pushc __defc_gen_str_n751
gpm

push 503
swp
add

pushcp __defc_gen_str_n752
swp
add

pushc __defc_gen_word_n753
gpm

pushc __defc_gen_word_n754
gpm

pushc __defc_gen_word_n755
gpm

peek 0
pop
pushcp putch
jc
pushc crt.black
gpm

pushc __defc_gen_word_n756
gpm

peek 0
pop
pushcp crt.textcolor
invoke
pushc __defc_gen_word_n757
gpm

peek 0
pop
pushcp gc
jc
pushcp __gen_while_36
jp
__gen_while_36_end:
pushc crt.white
gpm

pushc __defc_gen_word_n758
gpm

peek 0
pop
pushcp crt.textcolor
invoke
pushc crt.black
gpm

pushc __defc_gen_word_n759
gpm

peek 0
pop
pushcp crt.textbackground
invoke
pushc __defc_gen_word_n760
gpm

peek 0
pop
pushcp crt.clrscr
invoke
pushc __defc_gen_word_n761
gpm

peek 0
pop
pushcp crt.cursoron
invoke
pushc __defc_gen_str_n762
gpm

pushc __defc_gen_word_n763
gpm

pushc __defc_gen_word_n764
gpm

pushc __defc_gen_word_n765
gpm

peek 0
pop
pushcp putch
jc
pushc __defc_gen_str_n766
gpm


push 474

pushc __defc_gen_word_n767
gpm

peek 0
pop
pushcp i2s
jc
swp
add

pushcp __defc_gen_str_n768
swp
add

pushc __defc_gen_word_n769
gpm

pushc __defc_gen_word_n770
gpm

pushc __defc_gen_word_n771
gpm

peek 0
pop
pushcp putch
jc
pushc __defc_gen_word_n772
gpm

peek 0
pop
pushcp crt.readkey
jc
pushc false
gpm

peek 479
pop
__gen_main_method_end:
jr
__gen_main_method_end_block:

pushc __entrypoint
gpm
jc
pushc __haltpoint
gpm
jp
_common_class_constructor:
pop
jr
__class_point_allocator:

pushcp __defc_gen_word_n773

pushcp __defc_gen_word_n774
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
pushcp point__free
swp
pushcp __class__child_free
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

__class_vector_allocator:

pushcp __defc_gen_word_n775

pushcp __defc_gen_word_n776
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
pushcp vector__free
swp
pushcp __class__child_free
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

__class_tcriticalsection_allocator:

pushcp __defc_gen_word_n777

pushcp __defc_gen_word_n778
newa
typemarkclass
pcopy
pushcp tcriticalsection
swp
pushcp __class__child_type
swp
peekai
pcopy
pushcp tcriticalsection__create
swp
pushcp __class__child_create
swp
peekai
pcopy
pushcp tcriticalsection__free
swp
pushcp __class__child_free
swp
peekai
pcopy
pushcp tcriticalsection__enter
swp
pushcp __class__child_enter
swp
peekai
pcopy
pushcp tcriticalsection__leave
swp
pushcp __class__child_leave
swp
peekai
pcopy
pushcp tcriticalsection__tryenter
swp
pushcp __class__child_tryenter
swp
peekai
__gen___class_tcriticalsection_allocator_method_end:
jr

__class_list_allocator:

pushcp __defc_gen_word_n779

pushcp __defc_gen_word_n780
newa
typemarkclass
pcopy
pushcp list
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
pushcp list__create
swp
pushcp __class__child_create
swp
peekai
pcopy
pushcp list__free
swp
pushcp __class__child_free
swp
peekai
pcopy
pushcp list__add
swp
pushcp __class__child_add
swp
peekai
pcopy
pushcp list__insert
swp
pushcp __class__child_insert
swp
peekai
pcopy
pushcp list__delete
swp
pushcp __class__child_delete
swp
peekai
pcopy
pushcp list__clear
swp
pushcp __class__child_clear
swp
peekai
pcopy
pushcp list__foreach
swp
pushcp __class__child_foreach
swp
peekai
pcopy
pushcp list__get
swp
pushcp __class__child_get
swp
peekai
pcopy
pushcp list__indexof
swp
pushcp __class__child_indexof
swp
peekai
pcopy
pushcp list__sort
swp
pushcp __class__child_sort
swp
peekai
pcopy
pushcp list__nextins
swp
pushcp __class__child_nextins
swp
peekai
pcopy
pushcp list__find
swp
pushcp __class__child_find
swp
peekai
__gen___class_list_allocator_method_end:
jr

__class_tfilestream_allocator:

pushcp __defc_gen_word_n781

pushcp __defc_gen_word_n782
newa
typemarkclass
pcopy
pushcp tfilestream
swp
pushcp __class__child_type
swp
peekai
pcopy
pushcp tfilestream__create
swp
pushcp __class__child_create
swp
peekai
pcopy
pushcp tfilestream__free
swp
pushcp __class__child_free
swp
peekai
pcopy
pushcp tstream__seek
swp
pushcp __class__child_seek
swp
peekai
pcopy
pushcp tstream__clear
swp
pushcp __class__child_clear
swp
peekai
pcopy
pushcp tstream__getcaretpos
swp
pushcp __class__child_getcaretpos
swp
peekai
pcopy
pushcp tstream__getsize
swp
pushcp __class__child_getsize
swp
peekai
pcopy
pushcp tstream__writefrommemorystream
swp
pushcp __class__child_writefrommemorystream
swp
peekai
pcopy
pushcp tstream__readfrommemorystream
swp
pushcp __class__child_readfrommemorystream
swp
peekai
pcopy
pushcp tstream__copyfromstream
swp
pushcp __class__child_copyfromstream
swp
peekai
pcopy
pushcp tstream__write
swp
pushcp __class__child_write
swp
peekai
pcopy
pushcp tstream__writeu
swp
pushcp __class__child_writeu
swp
peekai
pcopy
pushcp tstream__writebyte
swp
pushcp __class__child_writebyte
swp
peekai
pcopy
pushcp tstream__writeword
swp
pushcp __class__child_writeword
swp
peekai
pcopy
pushcp tstream__writeint
swp
pushcp __class__child_writeint
swp
peekai
pcopy
pushcp tstream__writefloat
swp
pushcp __class__child_writefloat
swp
peekai
pcopy
pushcp tstream__writestr
swp
pushcp __class__child_writestr
swp
peekai
pcopy
pushcp tstream__readbyte
swp
pushcp __class__child_readbyte
swp
peekai
pcopy
pushcp tstream__readword
swp
pushcp __class__child_readword
swp
peekai
pcopy
pushcp tstream__readint
swp
pushcp __class__child_readint
swp
peekai
pcopy
pushcp tstream__readfloat
swp
pushcp __class__child_readfloat
swp
peekai
pcopy
pushcp tstream__readstr
swp
pushcp __class__child_readstr
swp
peekai
__gen___class_tfilestream_allocator_method_end:
jr

__class_tree_allocator:

pushcp __defc_gen_word_n783

pushcp __defc_gen_word_n784
newa
typemarkclass
pcopy
pushcp tree
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
pushcp tree__create
swp
pushcp __class__child_create
swp
peekai
pcopy
pushcp tree__free
swp
pushcp __class__child_free
swp
peekai
pcopy
pushcp tree__addnode
swp
pushcp __class__child_addnode
swp
peekai
pcopy
pushcp tree__getnode
swp
pushcp __class__child_getnode
swp
peekai
pcopy
pushcp tree__delnode
swp
pushcp __class__child_delnode
swp
peekai
pcopy
pushcp tree__clear
swp
pushcp __class__child_clear
swp
peekai
__gen___class_tree_allocator_method_end:
jr

__class_tasynccallthread_allocator:

pushcp __defc_gen_word_n785

pushcp __defc_gen_word_n786
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
pushcp tthread__free
swp
pushcp __class__child_free
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

pushcp __defc_gen_word_n787

pushcp __defc_gen_word_n788
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
pushcp tthread__free
swp
pushcp __class__child_free
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

__class_tparallelcallthread_allocator:

pushcp __defc_gen_word_n789

pushcp __defc_gen_word_n790
newa
typemarkclass
pcopy
pushcp tparallelcallthread
swp
pushcp __class__child_type
swp
peekai
pcopy
pushcp tparallelcallthread__create
swp
pushcp __class__child_create
swp
peekai
pcopy
pushcp tthread__free
swp
pushcp __class__child_free
swp
peekai
pcopy
pushcp tparallelcallthread__execute
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
__gen___class_tparallelcallthread_allocator_method_end:
jr

__class_snake_allocator:

pushcp __defc_gen_word_n791

pushcp __defc_gen_word_n792
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
pcopy
pushcp snake__free
swp
pushcp __class__child_free
swp
peekai
__gen___class_snake_allocator_method_end:
jr


__haltpoint:
gc
