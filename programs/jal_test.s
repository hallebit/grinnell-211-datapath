.constant HALT 0xff00

  nop
  li $a0, 0
  jal increment
  nop
  j HALT
  nop
increment:
  addi $a0, $a0, 2
  jr $ra
  nop



# Final Expected 

# $a0 2
