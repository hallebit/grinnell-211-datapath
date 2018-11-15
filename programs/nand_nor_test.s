test:
  li    $s0, 3           # Load a 3 into $s0
  li    $s1, 4           # Load a 4 into $s1
  nandi $t0, $s0, 1      # Put 3 nand 1 into $t0
  nand  $t1, $s0, $s1    # Put 3 nand 2 into $t1
  nori  $t2, $s0, 1      # Put 3 nor 1 into $t2
  nor   $t3, $s0, $s1    # Put 3 nor 2 into $t3

# Final Expected 
# $t0 2
# $t1 1
# $t2 0 
# $t3 0
