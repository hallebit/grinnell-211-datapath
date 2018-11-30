.constant HALT 0xff00
.constant TERM 0xff10
.constant KB 0xff20
.constant STACK_TOP 0xf800

nop
main:
  li $s0, TERM
  li $s1, KB
  li $sp, STACK_TOP
  
loop_top:
  lw $t0, 0($s1)		# Gets char from KB
  beq $t0, $zero, loop_top	# Asks if char is nothing
  nop 
  addi $sp, $sp, -4
  sw $t0, 0($sp)		# Puts char on stack
  li $t1, '\n'			
  beq $t0, $t1, print		# Stop program when we hit newline
  j loop_top

print:
  lw $t0, 0($sp)		# Get char off stack
  sw $t0, 0($s0)		# Puts char in TERM / TTY
  addi $sp, $sp, 4		# Move stack back
  beq $t0, $zero, end		# if char was nothing, end
  j print

end:
  li $s0, HALT
  jr $s0

