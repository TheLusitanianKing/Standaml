open Base
open Config

let%test "parsing single line (1)" =
  Option.is_none @@ parse_config_single_line "A="

let%test "parsing single line (2)" =
  Option.is_none @@ parse_config_single_line "A A"

let%test "parsing single line (3)" =
  Option.equal
    (Utils.Tuple.equal_tuple' String.equal)
    (parse_config_single_line "A=A")
    (Some ("A", "A"))

let%test "parsing single line (4)" =
  Option.equal
    (Utils.Tuple.equal_tuple' String.equal)
    (parse_config_single_line "A=B=A")
    (Some ("A", "B"))

let%test "read_config_file_from_config_map (1)" =
  let expected = Some "B" in
  let result =
    Map.of_alist (module String) [ ("A", "B"); ("B", "A") ]
    |> get_config_map_from_map_of_alist
    |> read_config_param_from_config_map ~key:"A" in
  Option.equal String.equal result expected

let%test "read_config_file_from_config_map (2)" =
  let expected = None in
  let result =
    Map.of_alist (module String) []
    |> get_config_map_from_map_of_alist
    |> read_config_param_from_config_map ~key:"A" in
  Option.equal String.equal result expected
