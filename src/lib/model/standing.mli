type t = { team_standings : Standing_line.t list }

val parse : json:Yojson.Basic.t -> t option
(** Trying to parse JSON to a standing *)

val sort_standing : standing:t -> Standing_line.t list
(** Sort the standing lines *)
