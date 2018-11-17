  nop
  li $sp, 0xf800
  li $t0, 3
  li $t1, 1
  addi $sp, $sp, 4
  sw $t0, $sp, 0
  lw $t1, $sp, 0

# Final Expected

# $t0 3
# $t1 3
