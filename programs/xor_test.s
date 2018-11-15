test:
  li    $s0, 3           # Load a 3 into $s0
  li    $s1, 4           # Load a 4 into $s1
  xori  $t0, $s0, 1      # Put 3 xor 1 into $t0
  xor   $t1, $s0, $s1    # Put 3 xori 2 into $t1

# Final Expected 
# $t0 2
# $t1 1
