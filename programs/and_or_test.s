test:
  li    $s0, 3           # Load a 3 into $s0
  li    $s1, 4           # Load a 4 into $s1
  andi $t0, $s0, 1       # Put 3 and 1 into $t0
  and  $t1, $s0, $s1     # Put 3 and 2 into $t1
  ori  $t2, $s0, 1       # Put 3 or 1 into $t2
  or   $t3, $s0, $s1     # Put 3 or 2 into $t3

# Final Expected 
# $t0 1
# $t1 0
# $t2 3 
# $t3 7
