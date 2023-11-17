type t = { team_standings: Standing_line.t list }

(** Trying to parse JSON to a standing *)
val parse : json:Yojson.Basic.t -> t option

(** Sort the standing lines *)
val sort_standing : standing:t -> Standing_line.t list
