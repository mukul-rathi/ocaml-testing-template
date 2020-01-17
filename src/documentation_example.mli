(** This is a documentation comment for the module as a whole *)

val identity : 'a -> 'a
(** The identity function returns its argument *)

type person =
  | TChild of string * int
      (** [string] refers to the name of the child, [int] refers to their age. *)
  | TAdult of string * int * person list
      (** Adults also have children (specified by [person list])*)
