.data

msg1: .asciiz "\nKup için=1\nKure için=2\nSilindir için=3 giriniz"
msg2: .asciiz "Yanlis tuslama yaptiniz:"
msg3: .asciiz "Kupun bir kenari="
msg4: .asciiz "Kurenin yaricapi="
msg5: .asciiz "Silindirin yaricapi="
msg6: .asciiz "Silindirin kenar uzunlugu="
msg7: .asciiz "Alan="

AlanDizisi: .space 400

.text 
.globl main

main:


la $t9,AlanDizisi

counter:

slti $s7,$s0,3
beq $s7,1,giris
beq $s7,0,cikis

beq $s0,1,ilk
beq $s0,2,ikinci
beq $s0,3,ucuncu

ilk:
sw $t1, 0($t9)
ikinci:
sw $t2, 4($t9)
ucuncu:
sw $t5, 8($t9)



giris:

addi $s0,$s0,0
la $a0,msg1
addi $v0,$zero,4
syscall

addi $v0,$zero,5
syscall
add $t0,$zero,$v0

secim: 
beq $t0,1,kup
beq $t0,2,kure
beq $t0,3,silindir
j yanlis


kup:
la $a0,msg3
addi $v0,$zero,4
syscall

addi $v0,$zero,5
syscall
add $t1,$zero,$v0

mul $t1,$t1,$t1
mul $t1,$t1,6

la $a0,msg7
addi $v0,$zero,4
syscall

add $a0,$t1,$zero
addi $v0,$zero,1
syscall

addi $s0,$s0,1
j counter

kure:

la $a0,msg4
addi $v0,$zero,4
syscall

addi $v0,$zero,5
syscall
add $t2,$zero,$v0

mul $t2,$t2,$t2
mul $t2,$t2,4
mul $t2,$t2,314
div $t2,$t2,100

la $a0,msg7
addi $v0,$zero,4
syscall

add $a0,$t2,$zero
addi $v0,$zero,1
syscall

addi $s0,$s0,1
j counter

silindir:

la $a0,msg5
addi $v0,$zero,4
syscall

addi $v0,$zero,5
syscall
add $t3,$v0,$zero

la $a0,msg6
addi $v0,$zero,4
syscall

addi $v0,$zero,5
syscall
add $t4,$v0,$zero

mul $t5,$t3,$t4
mul $t5,$t5,2
mul $t6,$t3,$t3
mul $t6,$t6,2
add $t5,$t5,$t6
mul $t5,$t5,314
div $t5,$t5,100

la $a0,msg7
addi $v0,$zero,4
syscall

add $a0,$t5,$zero
addi $v0,$zero,1
syscall

addi $s0,$s0,1
j counter

yanlis:

la $a0,msg2
addi $v0,$zero,4
syscall

j cikis

cikis:

addi $v0,$zero,10
syscall



