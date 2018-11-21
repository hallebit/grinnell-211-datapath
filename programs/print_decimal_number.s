.constant TERMINAL 0xff10
.constant HALT 0xff00
.constant ASCII0 0x0030

  nop # First instruction does not execute

main: 
  li $a0, 302
  jal print_decimal_number
  nop
  li   $t2, 5			
  j HALT 
  nop

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

# procedure, print_decimal_number
# produces, prints $a0 to ASCII digit
print_decimal_number:
  bne  $a0, $zero, p_d_n_nonzero	# If $a0 == 0, don't jump
  nop
  li   $t0, ASCII0
  li   $t1, TERMINAL 
  sb   $t0, 0($t1) 
  jr   $ra
  nop
p_d_n_nonzero:
  addi $sp, $sp, -12			# Create space on the stack
  sw   $ra, 0($sp)			# Put $ra on stack
  sw   $a0, 4($sp)			# Put $a0 on stack
  li   $a1, 10				# Set second parameter to 10
  jal  remainder			# Set $v0 = $a0 % 10
  nop
  sw   $s0, 8($sp)			# Put original $s0 on stack
  add  $s0, $zero, $v0			# Put remainder in $s0
  lw   $a0, 4($sp)			# Retrieve orig $a0 from stack
  slt  $t0, $s0, $a0			# Put 1 in $t0 if $s0 < $a0
  beq  $t0, $zero, p_d_n_skip		# If $s0 >= $a0, don't jump 
  nop
  add  $v0, $zero, $zero
  jal  quotient				# $a0 = original $a0, $a1 = 10
  nop
  add  $a0, $v0, $zero 			# Set $a0 to quotient result
  jal  print_decimal_number
  nop		
p_d_n_skip: 
  li   $t0, ASCII0
  li   $t1, TERMINAL 	
  add  $t0, $s0, $t0			# '0' + remainder result
  sb   $t0, 0($t1)	
  lw   $ra, 0($sp)			# Retrieve $ra from stack
  lw   $s0, 8($sp) 			# Retrieve $s0 from stack
  addi $sp, $sp, 12			# Put stack back where it was
  jr $ra
  nop


