open Lib.Something

let%expect_test "Test greeting teacher" =
  print_string (greeting Teacher) ;
  [%expect {|Hey Professor!|}]

let%expect_test "Test greeting student" =
  print_string (greeting (Student "Bob")) ;
  [%expect {|Hey, Bob.|}]
