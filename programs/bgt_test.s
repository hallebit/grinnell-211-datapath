  nop 
  li $t0, 4
  li $t1, 4
  bgt! $t0, $t1, jumped
  nop
  addi $t1, $t1, 1
jumped: 

# Expected output
# $t0, 0
# $t1, 5 
