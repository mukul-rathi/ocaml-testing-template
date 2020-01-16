let%expect_test "Test name" =
  print_string "Hello World";
  (* or equiv code that includes print statements *)
  [%expect {|Hello World|}]
