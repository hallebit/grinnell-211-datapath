.constant HALT 0xff00
.constant TERM 0xff10
.constant KB 0xff20
.constant STACK_TOP 0xf800
.constant ASCII0 0x0030

nop
main:
  li $s0, TERM
  li $s1, KB
  li $sp, STACK_TOP
  
first_digit:
  lw $t0, 0($s1)
  beq $t0, $zero, first_digit
  nop
  li $t1, 48
  add $t2, $t0, $zero
  blt! $t2, $t1, first_digit
  nop
  li $t1, 57
  add $t2, $t0, $zero
  bgt! $t2, $t1, first_digit
  nop
add:
  lw $t1, 0($s1)
  li $t2, 43
  bne $t1, $t2, add
  nop
second_digit:
  lw $t1, 0($s1)
  beq $t1, $zero, second_digit
  nop
  li $t2, 48
  add $t3, $t1, $zero
  blt! $t3, $t2, second_digit
  nop
  li $t2, 57
  add $t3, $t1, $zero
  bgt! $t3, $t2, second_digit
  nop  
addition:
  add $a0, $t0, $t1
  addi $a0, $a0, -96
  jal print_decimal_number
  nop
  sw $v0, 0($s0)
  li $t1, '\n'
  sw $t1, 0($s0)
  beq $t0, $t1, end
  j first_digit
  nop
end:
  li $s0, HALT
  jr $s0

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
  li   $t1, TERM 
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
  li   $t1, TERM 	
  add  $t0, $s0, $t0			# '0' + remainder result
  sb   $t0, 0($t1)	
  lw   $ra, 0($sp)			# Retrieve $ra from stack
  lw   $s0, 8($sp) 			# Retrieve $s0 from stack
  addi $sp, $sp, 12			# Put stack back where it was
  jr $ra
  nop

