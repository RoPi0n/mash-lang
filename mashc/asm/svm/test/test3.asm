import PrintLn "crt.lib" "PRINTLN"
import InputLn "crt.lib" "INPUTLN"

str hello1 "Hello, what's ur name?"
str hello2 "Hello..."

pushcp hello1
pushcp PrintLn
invoke

pushcp InputLn
invoke
@name
peek name
pop

pushcp hello2
pushcp PrintLn
invoke
push name
pushcp PrintLn
invoke