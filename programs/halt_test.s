  nop
  li $sp, 0xf800
  li $t0, 3
  li $t1, 1
  addi $sp, $sp, 4
  j 0xff00
  sw $t0, 0($sp)
  lw $t1, 0($sp)

# Final Expected

# $t0 3
# $t1 1
