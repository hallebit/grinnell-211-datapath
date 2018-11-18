  nop
  li $t0, 0
  bne $t0, $zero, wherever
  nop
  addi $t0, $t0, 1
wherever:
  li $t1, 0
  beq $t1, $zero, here
  nop
  addi $t1, $t1, 1
here:
  nop
  li $t2, 1
  beq $t2, $zero, place
  nop
  addi $t2, $t2, 1
place:
  li $t3, 3
  bne $t3, $zero, there
  nop
  addi $t3, $t3, 1
there:

# Expected Values
# $t0 1
# $t1 0
# $t2 2
# $t3 3
