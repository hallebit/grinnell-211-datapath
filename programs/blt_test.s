  nop 
  li $t0, 3
  li $t1, 4
  blt! $t1, $t0, jumped
  nop
  addi $t1, $t1, 1
jumped: 

# Expected output
# $t1, 1
# $t0, 3 
