# MIPs program to calculate approximate area of circle using areas of circumscribed square and triangles.
# 'circle_area' procedure takes one arguments:
#       $f0 - radius of the circle.
# return value: 
#       $f10 - approximate area of the circle.
        .data
r:      .double   3.2
area:   .double   0.0

        .text
main:
    l.d $f0, r
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal circle_area

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    s.d $f10, area
    jr $ra
.end main

circle_area:                    # area of square + 4*(area of small triangles).
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    
    li.d $f14, 0.0
    jal square_area
    mov.d $f14, $f10
    jal triangle_area
    add.d $f10, $f10, $f10
    add.d $f10, $f10, $f10
    add.d $f10, $f10, $f14
    
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

square_area:                     # 2*(r^2)
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    jal righttrianle_area
    add.d $f10, $f10, $f10
    
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

triangle_area:                   # 0.207107(r^2)
    li.d $f16, 0.207107
    mul.d $f10, $f0, $f0
    mul.d $f10, $f10, $f16
    jr $ra

righttrianle_area:               # r^2
    mul.d $f10, $f0, $f0
    jr $ra