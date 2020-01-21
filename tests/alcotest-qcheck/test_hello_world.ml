open Lib

(* OCaml and Reason interoperate seamlessly! Here I call a Reason function *)
let test_greeting_teacher () =
  Alcotest.(check string)
    "same string" "Hey Professor!"
    (Something.greeting Something.Teacher)

let test_greeting_director () =
  Alcotest.(check string)
    "same string" "Hello Director."
    (Something.greeting Something.Director)

(* If instead I want to compare my custom type directly, I need to create a testable type *)

let pprint_schoolperson ppf = function
  | Something.Director     -> Fmt.pf ppf "Director"
  | Something.Student name -> Fmt.pf ppf "Student %s" name
  | Something.Teacher      -> Fmt.pf ppf "Teacher"

let schoolperson_eq a b = a = b
let schoolperson_testable = Alcotest.testable pprint_schoolperson schoolperson_eq

let test_teachers_are_equal () =
  Alcotest.(check schoolperson_testable)
    "Test same teacher" Something.Teacher Something.Teacher

let test_identity_function =
  QCheck.Test.make ~count:1000 ~name:"test identity"
    QCheck.(int)
    (fun i -> Hello_world.id i = i)

let () =
  let qcheck_tests = List.map QCheck_alcotest.to_alcotest [test_identity_function] in
  Alcotest.run "Example Alcotest + QCheck suite"
    [ ( "Greetings"
      , [ Alcotest.test_case "Greeting teacher" `Quick test_greeting_teacher
        ; Alcotest.test_case "Greeting director" `Quick test_greeting_director ] )
    ; ( "Check Equality"
      , [Alcotest.test_case "Same teacher" `Quick test_teachers_are_equal] )
    ; ("Qcheck tests", qcheck_tests) ]
