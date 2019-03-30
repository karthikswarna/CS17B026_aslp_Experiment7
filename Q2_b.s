# MIPS program to calculate Factorial(n).
	.data
n:	.word	8
fact:	.word	0:2
	.text

main:
    lw $a0, n
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal factorial

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    la $t0, fact
    sw $v0, 4($t0)
    sw $v1, 0($t0)
    jr $ra
.end main

factorial:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)

    slti $t0, $a0, 1
    beq $t0, $zero, greater
    addi $v0, $zero, 1
    addi $sp, $sp, 8
    jr $ra

greater:
    addi $a0, $a0, -1
    jal factorial
    lw $a0, 0($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    mult $a0, $v0
    mflo $v0
    mfhi $v1
    jr $ra
