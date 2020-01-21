(* The identity function returns its argument *)
let identity x = x

type person =
  | TChild of string * int
  (* [string] refers to the name of the child, [int] refers to their age. *)
  | TAdult of string * int * person list

(* Adults also have children (specified by [person list])*)
