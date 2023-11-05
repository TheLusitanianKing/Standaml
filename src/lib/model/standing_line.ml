type t =
  { team_name: string
  ; played_games: int
  ; won: int
  ; draw: int
  ; lost: int
  ; goals_for: int
  ; goals_against: int
  }

let parse ~json =
  let open Yojson.Basic.Util in
  try
    let team_name = "" in
    let played_games = json |> member "playedGames" |> to_int in
    let won = json |> member "won" |> to_int in
    let lost = json |> member "lost" |> to_int in
    let draw = json |> member "draw" |> to_int in
    let goals_for = json |> member "goalsFor" |> to_int in
    let goals_against = json |> member "goalsAgainst" |> to_int in
    Some { team_name; played_games; won; draw; lost; goals_for; goals_against }
  with
    Type_error _ -> None

let points ~standing_line =
  standing_line.won * 3 + standing_line.draw

let goals_difference ~standing_line =
  standing_line.goals_for - standing_line.goals_against
