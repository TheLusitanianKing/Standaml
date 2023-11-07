open Base

let display_standing_line ~(standing_line:Model.Standing_line.t) ~standing_format ~index =
  let open Standing_format in
  match standing_format with
  | Simple ->
      Printf.sprintf "%d. P%d - %s (%d pts) (%d-%d)"
        (index + 1)
        standing_line.played_games
        standing_line.team_name
        (Model.Standing_line.points standing_line)
        standing_line.goals_for
        standing_line.goals_against
  | One_line ->
      Printf.sprintf "%d. %s (%d pts)"
        (index + 1)
        standing_line.team_name
        (Model.Standing_line.points standing_line)

let display_standing ~(standing:Model.Standing.t) ~standing_format ~limit =
  let standing_lines = standing.team_standings in
  let sorted_lines = standing_lines
    |> List.sort ~compare:Model.Standing_line.compare
    |> List.rev in
  let opt_trimming = Option.bind limit ~f:(fun l -> Option.return @@ List.take sorted_lines l) in
  let trimmed_lines = Option.value opt_trimming ~default:sorted_lines in
  let formatted_lines = trimmed_lines
    |> List.mapi ~f:(fun index standing_line -> display_standing_line ~standing_line ~index ~standing_format) in
  let open Standing_format in
  match standing_format with
  | Simple   -> formatted_lines |> String.concat ~sep:"\n" 
  | One_line -> formatted_lines |> String.concat ~sep:" - "
