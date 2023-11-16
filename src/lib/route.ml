open Base

let base_url = "https://api.football-data.org/v4"

let standing_route competition_code =
  Printf.sprintf "%s/competitions/%s/standings" base_url competition_code
