.constant TERMINAL 0xff10
.constant HALT 0xff00

  nop # First instruction does not execute

main: 
  li $a0, 12
  li $a1, 5
  jal wtf
  nop
  j HALT 
  nop

wtf:
  addi $sp, $sp, -4
  sw   $ra, 0($sp)
  jal  remainder
  nop
  lw   $ra, 0($sp)
  addi $sp, $sp, 4

# procedure, remainder
# produces, the remainder of $a0 divided by $a1
remainder:
  slt  $t0, $a0, $a1		# Put 1 in $t0 if $a0 < $a1
  bne  $t0, $zero, rembase 	# If $a0 < $a1 jump to base
  nop
  sub  $a0, $a0, $a1		# otherwise, $a0 = $a0 - a1
  j remainder			# tail call elimination
  nop 
rembase: 
  add  $v0, $a0, $zero 		# Set the return value to $a0
  jr   $ra
  nop  
