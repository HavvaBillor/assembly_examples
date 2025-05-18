.data

msg1: .asciiz "Taban sayi: "
msg2: .asciiz "Us: "
msg3: .asciiz "Hesaplanan sayi: "

.text
.globl main

main:
   
    la $a0, msg1
    addi $v0, $zero, 4
    syscall

    addi $v0, $zero, 5
    syscall
    add $t0, $v0, $zero   # Taban sayýyý $t0'a al

    
    la $a0, msg2
    addi $v0, $zero, 4
    syscall

    addi $v0, $zero, 5
    syscall
    add $t1, $v0, $zero   

    
    jal exponential

    
    la $a0, msg3
    addi $v0, $zero, 4
    syscall

    add $a0, $t3, $zero 
    addi $v0, $zero, 1
    syscall

    
    addi $v0, $zero, 10
    syscall


exponential:
    
    beq $t1, $zero, base_case

    
    addi $t3, $zero, 1  

loop:
    
    mul $t3, $t3, $t0

    
    addi $t1, $t1, -1

    
    bne $t1, $zero, loop

    
    jr $ra

base_case:
    
    addi $t3, $zero, 1  
    jr $ra
