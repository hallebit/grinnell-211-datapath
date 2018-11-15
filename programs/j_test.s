  nop
  li $s0, 0
test:
  addi $s0, $s0, 1
  j test
  nop

# Expected Output 
# infinite loop of incrementing 
