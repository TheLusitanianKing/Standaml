type t =
  { team_name: string
  ; position: int
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
    let team_name = json |> member "team" |> member "name" |> to_string in
    let position = json |> member "position" |> to_int in
    let played_games = json |> member "playedGames" |> to_int in
    let won = json |> member "won" |> to_int in
    let lost = json |> member "lost" |> to_int in
    let draw = json |> member "draw" |> to_int in
    let goals_for = json |> member "goalsFor" |> to_int in
    let goals_against = json |> member "goalsAgainst" |> to_int in
    Some { team_name; position; played_games; won; draw; lost; goals_for; goals_against }
  with
    Type_error _ -> None

let points x =
  x.won * 3 + x.draw

let goals_difference x =
  x.goals_for - x.goals_against

let compare (x:t) (y:t): int = x.position - y.position
