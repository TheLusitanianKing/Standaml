(* Some utility functions for tuple (/product)
   N.B. some of these might exist somewhere, just couldn't find it *)

val equal_tuple :
  ('a -> 'b -> bool) -> ('c -> 'd -> bool) -> 'a * 'c -> 'b * 'd -> bool
(** Equality function for tuple with 2 different comparers functions *)

val equal_tuple' : ('a -> 'b -> bool) -> 'a * 'a -> 'b * 'b -> bool
(** Equality function for tuple with a single comparer function *)
