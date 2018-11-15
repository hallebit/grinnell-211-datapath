  nop
  li $a0, 0
  jal increment
  nop
increment:
  addi $a0, $a0, 2
  jr $ra
  nop

