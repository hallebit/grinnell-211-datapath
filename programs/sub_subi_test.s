sub_subi_test:
  li $s0, 3          # Load a 3 into $s0
  subi $t0, $s0, 1   # Put 3 - 1 into $t0
  sub $t1, $s0, $t0  # Put 3 - 2 into $t1
