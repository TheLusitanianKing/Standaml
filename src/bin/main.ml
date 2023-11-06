open Base

(* let usage_msg = "standaml -n <HOW_MANY_TEAMS_PER_COMP> -t <TOKEN> -f <FORMAT> <COMPETITION_CODE_1> [<COMPETITION_CODE_2>]" *)

let format = ref Standaml.Tui.Standing_format.Default
let arg_token = ref None

let get_token_from_config_or_fail =
  let config_map = Standaml.Config.read_config_file "../standaml.conf" in
  let opt_token =
    Standaml.Config.read_config_param_from_config_map
      config_map ~key:"FOOTBALL_API_TOKEN" in
  match opt_token with
  | None -> failwith "No token specified in `standaml.conf` or ...."
  | Some conf_token -> conf_token

let get_token_or_fail token =
  match !token with
  | None -> get_token_from_config_or_fail
  | Some t -> t

let () =
  let token = get_token_or_fail arg_token in
  let competition = "PL" in
  let opt_standing = Lwt_main.run @@ Standaml.Api.fetch_standing ~token ~competition in
  match opt_standing with
  | None -> Stdio.print_endline @@ Printf.sprintf "Couldn't fetch standing for competition %s" competition
  | Some standing ->
    let standing_display = Standaml.Tui.Standing.display_standing ~standing ~standing_format:!format in
    Stdio.print_endline standing_display
