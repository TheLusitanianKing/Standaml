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
    let team_name = "Team name (TODO)" in
    let played_games = json |> member "playedGames" |> to_int in
    let won = json |> member "won" |> to_int in
    let lost = json |> member "lost" |> to_int in
    let draw = json |> member "draw" |> to_int in
    let goals_for = json |> member "goalsFor" |> to_int in
    let goals_against = json |> member "goalsAgainst" |> to_int in
    Some { team_name; played_games; won; draw; lost; goals_for; goals_against }
  with
    Type_error _ -> None

let points x =
  x.won * 3 + x.draw

let goals_difference x =
  x.goals_for - x.goals_against

(* as a reminder,
   the comparison function must return 0 if its arguments compare as equal,
   a positive integer if the first is greater,
   and a negative integer if the first is smaller *)
(** The greatest line is the one with most points and
    in case of equality, the one with the best goals difference *)
let compare (x:t) (y:t): int =
  let points_diff = points x - points y in
  let goals_diff = goals_difference x - goals_difference y in
  if points_diff = 0
    then goals_diff
    else points_diff

let%test "compare (total equality)" =
  let x = { team_name = "A"; played_games = 4; won = 2; draw = 1; lost = 1; goals_for = 5; goals_against = 3 } in
  let y = { team_name = "B"; played_games = 4; won = 2; draw = 1; lost = 1; goals_for = 5; goals_against = 3 } in
  compare x y = 0

let%test "compare (equality)" =
  let x = { team_name = "A"; played_games = 4; won = 1; draw = 0; lost = 2; goals_for = 3; goals_against = 3 } in
  let y = { team_name = "B"; played_games = 4; won = 0; draw = 3; lost = 0; goals_for = 3; goals_against = 3 } in
  compare x y = 0

let%test "compare (more points)" =
  let x = { team_name = "A"; played_games = 1; won = 1; draw = 0; lost = 0; goals_for = 3; goals_against = 0 } in
  let y = { team_name = "B"; played_games = 1; won = 0; draw = 0; lost = 1; goals_for = 3; goals_against = 4 } in
  compare x y > 0

let%test "compare (same points, best goals difference)" =
  let x = { team_name = "A"; played_games = 1; won = 1; draw = 0; lost = 0; goals_for = 3; goals_against = 0 } in
  let y = { team_name = "B"; played_games = 1; won = 1; draw = 0; lost = 0; goals_for = 1; goals_against = 0 } in
  compare x y > 0