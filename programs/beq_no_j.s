  nop
  li $t0, 1
  beq $t0, $zero, wherever
  nop
  addi $t0, $t0, 1
wherever:
  li $t1, 1
  bne $t1, $zero, here
  nop
  addi $t1, $t1, 1
here:

# Expected Values
# $t0 2
# $t1 1

