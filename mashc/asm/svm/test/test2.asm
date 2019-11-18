import PrintLn "crt.lib" "PRINTLN"

pushcp main
jc

print_hello:
  str Hello "Hello world!"
  pushcp Hello
  pushcp PrintLn
  invoke
jr
  
main:
  main.loop:
    pushcp print_hello
    jc
    gc
  pushcp main.loop
  jp