.constant TERMINAL 0xff10
.constant HALT 0xff00
.constant VALUE 0x000a

nop
li $t5, 0
loop:
bgt $t5, VALUE, exit
addi $t5, $t5, 1
add $a0, $zero, $t5
jal fib
nop
#TODO:print num
j loop

fib:
bgt $a0, 1, recurse
add $v0, $a0, $zero
jr $ra
nop

recurse:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $a0, 4($sp)
addi $a0, $a0, -1
jal fib
nop
sw $v0, 8($sp)
lw $a0, 4($sp)
addi $a0, $a0, -2
jal fib
nop
lw $t0, 8($sp)
add $v0, $v0, $t0
lw $ra, 0($sp)
addi $sp, $sp, 12
jr $ra
nop

exit:
j HALT
