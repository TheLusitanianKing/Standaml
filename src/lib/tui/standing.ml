open Base

let display_standing_line ~(standing_line:Model.Standing_line.t) ~standing_format =
  let open Standing_format in
  match standing_format with
  | Classic ->
      Printf.sprintf "%d. P%d - %s (%d pts) (%d-%d)"
        standing_line.position
        standing_line.played_games
        standing_line.team_name
        (Model.Standing_line.points standing_line)
        standing_line.goals_for
        standing_line.goals_against
  | One_line ->
      Printf.sprintf "%d. %s (%d pts)"
        standing_line.position
        standing_line.team_name
        (Model.Standing_line.points standing_line)

let display_standing ~(standing:Model.Standing.t) ~standing_format ~limit =
  let sorted_standing_lines = standing.team_standings
    |> List.sort ~compare:Model.Standing_line.compare in
  let opt_trimming = Option.bind limit ~f:(fun l -> Option.return @@ List.take sorted_standing_lines l) in
  let trimmed_lines = Option.value opt_trimming ~default:sorted_standing_lines in
  let formatted_lines = trimmed_lines
    |> List.map ~f:(fun standing_line -> display_standing_line ~standing_line ~standing_format) in
  let open Standing_format in
  match standing_format with
  | Classic  -> formatted_lines |> String.concat ~sep:"\n" 
  | One_line -> formatted_lines |> String.concat ~sep:" - "
