.data
msg1: .asciiz " Celcius degeri:"
msg2: .asciiz "\n Fahrenheit degeri: "

.text 
.globl main

main: 

la $a0,msg1
addi $v0,$zero,4
syscall

addi $v0,$zero,5
syscall
add $t0,$v0,$zero

mul $t0,$t0,9
div $t0,$t0,5
addi $t0,$t0,32


la $a0,msg2
addi $v0,$zero,4
syscall

add $a0,$t0,$zero
addi $v0,$zero,1
syscall

addi $v0,$zero,10
syscall