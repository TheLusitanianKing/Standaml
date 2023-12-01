open Base
open Route

let%test "standing route" =
  String.equal (standing_route "PPL")
    "https://api.football-data.org/v4/competitions/PPL/standings"
