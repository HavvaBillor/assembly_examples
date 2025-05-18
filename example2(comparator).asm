.data
msg1: .asciiz "Ilk sayiyi giriniz:"
msg2: .asciiz "Ikinci sayiyi giriniz"
msg3: .asciiz "Birinici sayi buyuk:"
msg4: .asciiz "Ikinci sayi buyuk"
msg5: .asciiz "Iki sayi esit"

.text 
.globl main

main:

la $a0,msg1
addi $v0,$zero,4
syscall

addi $v0,$zero,5
syscall
add $t0,$v0,$zero

la $a0,msg2
addi $v0,$zero,4
syscall

addi $v0,$zero,5
syscall
add $t1,$v0,$zero

beq $t0,$t1,esit
slt $t2,$t0,$t1 
beq $t2,1,Iki
beq $t2,0,Bir


Iki:

la $a0,msg4
addi $v0,$zero,4
syscall

add $a0,$t1,$zero
addi $v0,$zero,1
syscall 

j exit

Bir: 

la $a0,msg3
addi $v0,$zero,4
syscall

add $a0,$t0,$zero
addi $v0,$zero,1
syscall 

j exit

esit:

la $a0,msg5
addi $v0,$zero,4
syscall

add $a0,$t0,$zero
addi $v0,$zero,1
syscall 

j exit

exit:

addi $v0,$zero,10
syscall

