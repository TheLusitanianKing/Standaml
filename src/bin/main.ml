open Base

let usage_msg = "standaml -n <MAX_TEAMS_PER_COMP_STANDING> -t <TOKEN> -f <FORMAT> <COMPETITION_CODE_1> [<COMPETITION_CODE_2>]"

let format_raw = ref ""
let limit = ref 0
let arg_token = ref ""
let competitions = ref []

let speclist =
  [ ("-t", Stdlib.Arg.Set_string arg_token, "Football API token (not needed if specified in the config file)")
  ; ("-f", Stdlib.Arg.Set_string format_raw, "Format (options are: classic and one-line, default is: classic)")
  ; ("-n", Stdlib.Arg.Set_int limit, "Limit how many teams per competition should be displayed in the standings")
  ]

let get_token_from_config_or_fail =
  let config_map = Standaml.Config.read_config_file "../standaml.conf" in
  let opt_token =
    Standaml.Config.read_config_param_from_config_map
      config_map ~key:"FOOTBALL_API_TOKEN" in
  match opt_token with
  | None -> failwith "No token specified: need to be specified either into the conf file or with the option -t."
  | Some conf_token -> conf_token

let get_token_or_fail ref_token =
  let token = !ref_token in
  if String.length token <= 0 then get_token_from_config_or_fail else token

let add_competition competition =
  competitions := competition::!competitions

let fetch_standing_or_error ~token ~competition ~format ~limit =
  let opt_standing = Lwt_main.run @@ Standaml.Api.fetch_standing ~token ~competition in
  match opt_standing with
  | None -> Stdio.print_endline @@ Printf.sprintf "Couldn't fetch standing for competition %s" competition
  | Some standing ->
    let standing_display = Standaml.Tui.Standing.display_standing ~standing ~standing_format:format ~limit in
    Stdio.print_endline standing_display

let () =
  Stdlib.Arg.parse speclist (fun cpt -> add_competition cpt) usage_msg;
  let token = get_token_or_fail arg_token in
  let opt_format = Standaml.Tui.Standing_format.string_to_format !format_raw in
  let format = Option.value opt_format ~default:Standaml.Tui.Standing_format.Classic in
  let limit = if !limit <= 0 then None else Some !limit in
  !competitions
    |> List.rev
    |> List.iter ~f:(fun competition -> fetch_standing_or_error ~token ~competition ~format ~limit)
