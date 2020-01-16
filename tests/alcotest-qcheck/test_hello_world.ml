open Lib

(* OCaml and Reason interoperate seamlessly! *)
let test_something () =
  Alcotest.(check string)
    "same string" "Hey Professor!"
    (Something.greeting Something.Teacher)

let test_other_thing =
  QCheck.Test.make ~count:1000 ~name:"zero"
    QCheck.(int)
    (fun i -> Hello_world.zero i = 0)

let () =
  let foo = List.map QCheck_alcotest.to_alcotest [ test_other_thing ] in
  Alcotest.run "Utils"
    [
      ("string-case", [ Alcotest.test_case "Something" `Quick test_something ]);
      ("foo", foo);
    ]
