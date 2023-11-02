open Base

let base_url = "https://api.football-data.org/v4"

let standing_route competition_code =
  Printf.sprintf "%s/competitions/%s/standings" base_url competition_code

let%test "standing route" =
  String.equal (standing_route "PPL") "https://api.football-data.org/v4/competitions/PPL/standings"
