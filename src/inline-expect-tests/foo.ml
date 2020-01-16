let print_hello_world () = print_string "Hello World"

(* Test in same file as source code *)
let%expect_test "Test name" =
  print_hello_world ();
  (* or equiv code that includes print statements *)
  [%expect {|Hello World|}]
