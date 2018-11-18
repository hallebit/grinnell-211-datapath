.constant TERMINAL 0xff10
.constant HALT 0xff00

  nop # First instruction does not execute

main: 
  li $a0, 16
  li $a1, 5
  jal quotient
  nop
  j HALT 
  nop

# procedure, quotient
# produces, the quotient of $a0 and $a1
quotient:
  slt  $t0, $a0, $a1		# Put 1 in $t0 if $a0 < $a1
  bne  $t0, $zero, quobase 	# If $a0 < $a1 jump to base
  nop 
  sub  $a0, $a0, $a1		# otherwise, $a0 = $a0 - a1
  addi $v0, $v0, 1		# increment return value
  j quotient			# tail call elimination
  nop
quobase:
  jr $ra
  nop
