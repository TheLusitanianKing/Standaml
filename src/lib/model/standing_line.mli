type t

val parse : json:Yojson.Basic.t -> t option

val points : standing_line:t -> int

val goals_difference : standing_line:t -> int
