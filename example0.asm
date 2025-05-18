.data
msg1: .asciiz "Toplam:"

.text 
.globl main

main:

addi $v0,$zero,5
syscall
add $t0,$v0,$zero

addi $v0,$zero,5
syscall
add $t1,$v0,$zero

add $t2,$t1,$t0

la $a0,msg1
addi $v0,$zero,4
syscall

add $a0,$t2,$zero
addi $v0,$zero,1
syscall

addi $v0,$zero,10
syscall