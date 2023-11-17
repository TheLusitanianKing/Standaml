type t = {
  team_name : string;
  position : int;
  played_games : int;
  won : int;
  draw : int;
  lost : int;
  goals_for : int;
  goals_against : int;
}

(** Parse JSON to a standing line if possible *)
val parse : json:Yojson.Basic.t -> t option

(** Get the team points from the line *)
val points : t -> int

(** Get the team goal diff from the line*)
val goals_difference : t -> int

(** Compare two team standing (line) *)
val compare : t -> t -> int
