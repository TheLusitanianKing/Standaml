open Base

let usage_msg = "standaml -n <HOW_MANY_TEAMS_PER_COMP> -t <TOKEN> -f <FORMAT> <COMPETITION_CODE_1> [<COMPETITION_CODE_2>]"

let format = ref Standaml.Tui.Standing_format.Default
let arg_token = ref ""
let competitions = ref []

let speclist =
  [ ("-t", Stdlib.Arg.Set_string arg_token, "Output debug information")
  ]

let get_token_from_config_or_fail =
  let config_map = Standaml.Config.read_config_file "../standaml.conf" in
  let opt_token =
    Standaml.Config.read_config_param_from_config_map
      config_map ~key:"FOOTBALL_API_TOKEN" in
  match opt_token with
  | None -> failwith "No token specified in `standaml.conf` or ...."
  | Some conf_token -> conf_token

let get_token_or_fail ref_token =
  let token = !ref_token in
  if String.length token <= 0 then get_token_from_config_or_fail else token

let add_competition competition =
  competitions := competition::!competitions

let fetch_standing_or_error token competition =
  let opt_standing = Lwt_main.run @@ Standaml.Api.fetch_standing ~token ~competition in
  match opt_standing with
  | None -> Stdio.print_endline @@ Printf.sprintf "Couldn't fetch standing for competition %s" competition
  | Some standing ->
    let standing_display = Standaml.Tui.Standing.display_standing ~standing ~standing_format:!format in
    Stdio.print_endline standing_display

let () =
  Stdlib.Arg.parse speclist (fun cpt -> add_competition cpt) usage_msg;
  let token = get_token_or_fail arg_token in
  !competitions |> List.iter ~f:(fun competition -> fetch_standing_or_error token competition)
