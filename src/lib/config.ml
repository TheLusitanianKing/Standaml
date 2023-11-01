open Base
open Stdio

let parse_config_single_line line =
  let filtered = String.split ~on:'=' line
    |> List.filter ~f:(fun x -> not @@ String.is_empty x) in
  match filtered with
    | [] -> None
    | [_] -> None
    | (x::y::_) -> Some (x, y) (* just ignore the rest if any *)

let%test "parsing single line (1)" =
  Option.is_none @@ parse_config_single_line "A="
let%test "parsing single line (2)" =
  Option.is_none @@ parse_config_single_line "A A"
let%test "parsing single line (3)" =
  Option.equal (Tuple.equal_tuple' String.equal)
    (parse_config_single_line "A=A")
    (Some ("A", "A"))
let%test "parsing single line (4)" =
  Option.equal (Tuple.equal_tuple' String.equal)
    (parse_config_single_line "A=B=A")
    (Some ("A", "B"))

let get_config_map_from_map_of_alist x =
  match x with
    | `Duplicate_key _ -> Base.Map.empty (module String)
    | `Ok x -> x

let read_config_file filename =
  In_channel.read_lines filename |>
  List.map ~f:parse_config_single_line |>
  List.filter_opt |>
  Map.of_alist (module String) |>
  get_config_map_from_map_of_alist

let read_config_param_from_config_map config_map ~key =
  Base.Map.find config_map key

let read_config_param filename key =
  read_config_file filename |> read_config_param_from_config_map ~key:key

let%test "read_config_file_from_config_map (1)" =
  let expected = Some "B" in
  let result =
    Map.of_alist (module String) [("A", "B"); ("B", "A")] |>
    get_config_map_from_map_of_alist |>
    read_config_param_from_config_map ~key:"A" in
  Option.equal String.equal result expected

let%test "read_config_file_from_config_map (2)" =
  let expected = None in
  let result =
    Map.of_alist (module String) [] |>
    get_config_map_from_map_of_alist |>
    read_config_param_from_config_map ~key:"A" in
  Option.equal String.equal result expected
