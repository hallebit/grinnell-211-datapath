test:
  li    $s0, 3           # Load a 3 into $s0
  li    $s1, 4           # Load a 4 into $s1
  addi  $t0, $s0, 1      # Put 3 + 1 into $t0
  add   $t1, $s0, $s1    # Put 3 + 2 into $t1
  subi  $t2, $s0, 1      # Put 3 - 1 into $t2
  sub   $t3, $s0, $s1    # Put 3 - 2 into $t3
  andi  $t0, $s0, 1      # Put 3 and 1 into $t0
  and   $t1, $s0, $s1    # Put 3 and 2 into $t1
  ori   $t2, $s0, 1      # Put 3 or 1 into $t2
  or    $t3, $s0, $s1    # Put 3 or 2 into $t3
  nandi $t0, $s0, 1      # Put 3 nand 1 into $t0
  nand  $t1, $s0, $s1    # Put 3 nand 2 into $t1
  nori  $t2, $s0, 1      # Put 3 nor 1 into $t2
  nor   $t3, $s0, $s1    # Put 3 nor 2 into $t3
  slti  $t0, $s0, 1      # Put 0 in $t0
  slt   $t1, $s0, $s1    # Put 1 in $t1
  sltiu $t2, $s0, 1      # Put 0 in $t2
  sltu  $t3, $s0, $s1    # Put 1 in $t3


# Final Expected

# $t0 0
# $t1 1
# $t2 0 
# $t3 1
