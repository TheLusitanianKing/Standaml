open Base

let get_colour_scheme filename =
  try
    Utils.Config.read_config_file filename
    |> Map.to_alist
    |> List.filter_map ~f:(fun (k, v) ->
           Option.(Tui.Colour.Basic.parse_colour v >>= fun c -> Some (k, c)))
    |> Option.return
  with _ -> None
