open Core

let fetch_standing_or_error ?format ?limit ?colour_scheme ~token ~competition =
  let opt_standing =
    Lwt_main.run @@ Standaml.Api.fetch_standing ~token ~competition in
  match opt_standing with
  | None ->
      Stdio.print_endline
      @@ Printf.sprintf "Couldn't fetch standing for competition \"%s\"" competition
  | Some standing ->
      let standing_display =
        Standaml.Tui.Standing.display_standing ?standing_format:format ?limit
          ?colour_scheme ~standing in
      Stdio.print_endline @@ standing_display ^ "\n"

let run_command competitions opt_token opt_format limit () =
  let token =
    opt_token
    |> Option.value
         ~default:
           (Standaml.Config.Token.get_token_from_config_or_fail
              "../standaml.conf") in
  let opt_colour_scheme =
    Standaml.Config.Colour.get_colour_scheme "../colour.conf" in
  let opt_format' =
    Option.bind opt_format ~f:Standaml.Tui.Standing_format.string_to_format
  in
  competitions
  |> List.iter ~f:(fun competition ->
         fetch_standing_or_error ~token ~competition ?format:opt_format' ?limit
           ?colour_scheme:opt_colour_scheme)

let command =
  Command.basic_spec ~summary:"Standing of your favourite football leagues"
    Command.Spec.(
      empty
      +> anon (non_empty_sequence_as_list ("competition_code" %: string))
      +> flag "--token" (optional string) ~full_flag_required:()
           ~aliases:[ "-t" ]
           ~doc:
             ("token" ^ " "
            ^ "Football API token (not needed if specified in the config file)"
             )
      +> flag "--format" (optional string) ~full_flag_required:()
           ~aliases:[ "-f" ]
           ~doc:
             ("format" ^ " "
            ^ "Desired format (classic OR one-line, default is classic)")
      +> flag "--limit" (optional int) ~full_flag_required:() ~aliases:[ "-n" ]
           ~doc:
             ("nb_of_teams" ^ " "
            ^ "Limit how many teams per competition should be displayed in the \
               standings"))
    run_command

let () = Command_unix.run command
