open Base

let columns_to_display_in_classic_view =
  [ ("Rank",   fun (x:Model.Standing_line.t) -> x.position |> Int.to_string)
  ; ("Team",   fun (x:Model.Standing_line.t) -> x.team_name)
  ; ("P",      fun (x:Model.Standing_line.t) -> x.played_games |> Int.to_string)
  ; ("W",      fun (x:Model.Standing_line.t) -> x.won |> Int.to_string)
  ; ("D",      fun (x:Model.Standing_line.t) -> x.draw |> Int.to_string)
  ; ("L",      fun (x:Model.Standing_line.t) -> x.lost |> Int.to_string)
  ; ("GF",     fun (x:Model.Standing_line.t) -> x.goals_for |> Int.to_string)
  ; ("GA",     fun (x:Model.Standing_line.t) -> x.goals_against |> Int.to_string)
  ; ("GD",     fun (x:Model.Standing_line.t) -> Model.Standing_line.goals_difference x |> Int.to_string)
  ; ("Points", fun (x:Model.Standing_line.t) -> Model.Standing_line.points x |> Int.to_string)
  ]

let prepare_columns columns standing_lines =
  List.map ~f:(fun (col_name, get_column) ->
    let col_name_size = String.length col_name in
    let lines_with_sizes = List.map ~f:(fun sl -> let x = get_column sl in (String.length x, x)) standing_lines in
    let max_size = List.fold lines_with_sizes ~init:col_name_size ~f:(fun x (y, _) -> max x y) in
    (max_size, col_name :: List.map ~f:(fun (_, x) -> x) lines_with_sizes)
  ) columns

let display_standing_line_one_line ~(standing_line:Model.Standing_line.t) =
  Printf.sprintf "%d. %s (%d pts)"
    standing_line.position
    standing_line.team_name
    (Model.Standing_line.points standing_line)

let display_standing ~(standing:Model.Standing.t) ~standing_format ~limit =
  let sorted_standing_lines = standing.team_standings
    |> List.sort ~compare:Model.Standing_line.compare in
  let opt_trimming = Option.bind limit ~f:(fun l -> Option.return @@ List.take sorted_standing_lines l) in
  let trimmed_lines = Option.value opt_trimming ~default:sorted_standing_lines in
  let open Standing_format in
  match standing_format with
  | Classic -> trimmed_lines
    |> prepare_columns columns_to_display_in_classic_view
    |> Matrix.pretty_display
  | One_line -> trimmed_lines
    |> List.map ~f:(fun standing_line -> display_standing_line_one_line ~standing_line)
    |> String.concat ~sep:" - "
