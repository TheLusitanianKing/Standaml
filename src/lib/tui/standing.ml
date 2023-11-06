open Base

let display_standing_line ~(standing_line:Model.Standing_line.t) =
  Printf.sprintf "%s (%d pts)"
    standing_line.team_name
    (Model.Standing_line.points standing_line)

let display_standing ~(standing:Model.Standing.t) ~standing_format =
  let standing_lines = standing.team_standings in
  let sorted_lines = standing_lines
    |> List.sort ~compare:Model.Standing_line.compare
    |> List.rev in
  let formatted_lines = sorted_lines
    |> List.map ~f:(fun standing_line -> display_standing_line ~standing_line) in
  let open Standing_format in
  match standing_format with
  | Default  -> formatted_lines |> String.concat ~sep:"\n" 
  | One_line -> formatted_lines |> String.concat ~sep:" | "
