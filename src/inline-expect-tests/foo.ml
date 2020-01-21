let gen_hello_world () =
  let output_str = "Hello World" in
  print_string output_str ; (* insert print statement *)
                            output_str

(* Test in same file as source code *)
let%expect_test "Test name" =
  (* run src code - here I'm ignoring the output *)
  ignore (gen_hello_world () : string) ;
  [%expect {|Hello World|}]
