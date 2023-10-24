open Base
open Stdio

(* Parse a single config line *)
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
  Option.equal (Tuple.equal_tuple' String.equal) (parse_config_single_line "A=A") (Some ("A", "A"))
let%test "parsing single line (4)" =
  Option.equal (Tuple.equal_tuple' String.equal) (parse_config_single_line "A=B=A") (Some ("A", "B"))

let read_config_file filename =
  In_channel.read_lines filename |>
  List.map ~f:parse_config_single_line |>
  List.filter_opt |>
  Map.of_alist (module String) |>
  fun x -> match x with
  | `Duplicate_key _ -> Base.Map.empty (module String)
  | `Ok x -> x
