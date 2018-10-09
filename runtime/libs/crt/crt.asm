; SVM, crt.lib API.
; github.com/pavel151/svm

import Crt.CursorBig      "crt.lib" "CURSORBIG"
import Crt.CursorOff      "crt.lib" "CURSOROFF"
import Crt.CursorOn       "crt.lib" "CURSORON"       
import Crt.DelLine        "crt.lib" "DELLINE"        
import Crt.GotoXY32       "crt.lib" "GOTOXY32"       
import Crt.InsLine        "crt.lib" "INSLINE"        
import Crt.KeyPressed     "crt.lib" "KEYPRESSED"     
import Crt.ReadKey        "crt.lib" "READKEY"        
import Crt.Sound          "crt.lib" "SOUND"          
import Crt.WhereX32       "crt.lib" "WHEREX32"       
import Crt.WhereY32       "crt.lib" "WHEREY32"       
import Crt.Window32       "crt.lib" "WINDOW32"       
import Crt.ClrEOL         "crt.lib" "CLREOL"         
import Crt.ClrScr         "crt.lib" "CLRSCR"         
import Crt.GetDirectVideo "crt.lib" "GETDIRECTVIDEO" 
import Crt.GetLastMode    "crt.lib" "GETLASTMODE"    
import Crt.GetTextAttr    "crt.lib" "GETTEXTATTR"    
import Crt.GetWindMax     "crt.lib" "GETWINDMAX"     
import Crt.GetWindMaxX    "crt.lib" "GETWINDMAXX"    
import Crt.GetWindMaxY    "crt.lib" "GETWINDMAXY"    
import Crt.GetWindMin     "crt.lib" "GETWINDMIN"     
import Crt.GetWindMinX    "crt.lib" "GETWINDMINX"    
import Crt.GetWindMinY    "crt.lib" "GETWINDMINY"    
import Crt.GetCheckBreak  "crt.lib" "GETCHECKBREAK"  
import Crt.GetCheckEOF    "crt.lib" "GETCHECKEOF"    
import Crt.GetCheckSnow   "crt.lib" "GETCHECKSNOW"   
import Crt.Print          "crt.lib" "PRINT"
import Crt.PrintLn        "crt.lib" "PRINTLN"        
import Crt.PrintFormat    "crt.lib" "PRINTFORMAT"
import Crt.Input          "crt.lib" "INPUT"
import Crt.InputLn        "crt.lib" "INPUTLN"

; CRT modes 
word  Crt.BW40           0            ; 40x25 B/W on Color Adapter 
word  Crt.CO40           1            ; 40x25 Color on Color Adapter 
word  Crt.BW80           2            ; 80x25 B/W on Color Adapter 
word  Crt.CO80           3            ; 80x25 Color on Color Adapter 
word  Crt.Mono           7            ; 80x25 on Monochrome Adapter 
word  Crt.Font8x8        256          ; Add-in for ROM font 

; Foreground and background color constants 
word Crt.Black          0
word Crt.Blue           1
word Crt.Green          2
word Crt.Cyan           3
word Crt.Red            4
word Crt.Magenta        5
word Crt.Brown          6
word Crt.LightGray      7

; Foreground color constants 
word Crt.DarkGray       8
word Crt.LightBlue      9
word Crt.LightGreen     10
word Crt.LightCyan      11
word Crt.LightRed       12
word Crt.LightMagenta   13
word Crt.Yellow         14
word Crt.White          15

; Add-in for blinking 
word Crt.Blink          128 

;Functions & procedures for work with CRT

var Crt.TextAttr

proc Crt.Init()
  push 0x07
  pop  $Crt.TextAttr
endp

proc Crt.TextColor($.color)
  and  $.color, 0x8f
  push !Crt.TextAttr
  push 0x70
  and
  push $.color
  or
  mov  $Crt.TextAttr, $.color
endp

label Crt.TextBackground
  word &color ?
  word &buf   ?
  mov  &buf   0xf0
  not  &color Crt.Blink
  and  &buf   &color
  pop  &color
  shl  &color 4
  and  &color &buf
  mov  &buf   0x0f
  or   &buf   Crt.Blink
  and  &buf   Crt.TextAttr
  or   &color &buf
  mov  Crt.TextAttr &color
  rem  &color
  rem  &buf
return

label Crt.HighVideo
  word &buf ?
  mov  &buf Crt.TextAttr
  or   &buf 0x08
  push &buf
  call Crt.TextColor
  rem  &buf
return

label Crt.LowVideo
  word &buf ?
  mov  &buf Crt.TextAttr
  and  &buf 0x77
  push &buf
  call Crt.TextColor
  rem  &buf
return

label Crt.NormVideo
  push 7
  call TextColor
  push 0
  call Crt.TextBackGround
return

label Crt.Window
 invoke Crt.Window32
return

label Crt.GotoXY
 invoke Crt.GotoXY32
return

label Crt.WhereX
 word &buf  ?
 call Crt.WhereX32
 pop  &buf
 mod  &buf  256
 push &buf
 rem  &buf
return

label Crt.WhereY
 word &buf  ?
 call Crt.WhereY2
 pop  &buf
 mod  &buf  256
 push &buf
 rem  &buf
return

label Crt.PrintFmt
 var &buf ?
 pop &buf
 push Crt.TextAttr
 push &buf
 invoke Crt.PrintFormat
 rem  &buf
return

proc Crt.Pause()
  gc
  invoke !Crt.KeyPressed
  gpm
  jz !Crt.Pause
endp