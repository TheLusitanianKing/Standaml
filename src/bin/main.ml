open Core

let get_token_from_config_or_fail =
  let config_map = Standaml.Config.read_config_file "../standaml.conf" in
  let opt_token =
    Standaml.Config.read_config_param_from_config_map config_map
      ~key:"FOOTBALL_API_TOKEN" in
  match opt_token with
  | None ->
      failwith
        "No token specified: need to be specified either into the conf file or \
         with the option -t."
  | Some conf_token -> conf_token

let fetch_standing_or_error ~token ~competition ~format ~limit =
  let opt_standing =
    Lwt_main.run @@ Standaml.Api.fetch_standing ~token ~competition in
  match opt_standing with
  | None ->
      Stdio.print_endline
      @@ Printf.sprintf "Couldn't fetch standing for competition %s" competition
  | Some standing ->
      let standing_display =
        Standaml.Tui.Standing.display_standing ~standing ~standing_format:format
          ~limit in
      Stdio.print_endline @@ standing_display ^ "\n"

let run_command competitions opt_token opt_format limit () =
  let token = Option.value opt_token ~default:get_token_from_config_or_fail in
  let opt_format' =
    Option.bind opt_format ~f:Standaml.Tui.Standing_format.string_to_format
  in
  let format =
    Option.value opt_format' ~default:Standaml.Tui.Standing_format.Classic in
  competitions
  |> List.iter ~f:(fun competition ->
         fetch_standing_or_error ~token ~competition ~format ~limit)

let command =
  Command.basic_spec ~summary:"Standing of your favourite football leagues"
    Command.Spec.(
      empty
      +> anon (sequence ("competition_code" %: string))
      +> flag "-t" (optional string)
           ~doc:
             "token Football API token (not needed if specified in the config \
              file)"
      +> flag "-f" (optional string)
           ~doc:
             "format Desired format (classic OR one-line, default is classic)"
      +> flag "-n" (optional int)
           ~doc:
             "limit Limit how many teams per competition should be displayed \
              in the standings")
    run_command

let () = Command_unix.run command
