# MIPS program to implement nested procedures using floating point instructions.
    .data
m:  .double   1.1
x:  .double   0.0
y:  .double   0.0
z:  .double   0.0
p:  .double   0.0

    .text

main:
    l.d $f12, m
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal calculateY

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    s.d $f0, y                  # $f0 - Floating point return value register.
    jr $ra
.end main

calculateY:                     # procedure to calculate 'y'.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal calculateX
    
    li.d $f2, 3.14
    mul.d $f0, $f0, $f0
    mul.d $f0, $f0, $f0
    add.d $f0, $f0, $f2
    s.d $f0, y
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

calculateX:                     # procedure to calculate 'x'.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal calculateZ

    li.d $f2, 2.718
    mov.d $f4, $f0
    mul.d $f0, $f0, $f0
    mul.d $f0, $f0, $f4
    add.d $f0, $f0, $f12
    s.d $f0, x
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

calculateZ:                     # procedure to calculate 'z'.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal calculateP

    mov.d $f2, $f0
    mul.d $f0, $f0, $f0
    mul.d $f4, $f0, $f2
    add.d $f0, $f4, $f0
    s.d $f0, z
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

calculateP:                     # procedure to calculate 'p'.
    li.d $f2, 6.67
    mul.d $f0, $f2, $f12
    s.d $f0, p
    jr $ra