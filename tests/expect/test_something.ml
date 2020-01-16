open Lib.Something

let%expect_test "Test greeting" =
  print_string (greeting Teacher); 
  [%expect {|Hey Professor!|}]