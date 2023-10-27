let () =
  let config_map = Standaml.Config.read_config_file "../standaml.conf" in
  let opt_token =
    Standaml.Config.read_config_param_from_config_map
      config_map ~key:"FOOTBALL_API_TOKEN" in
  match opt_token with
    | None ->
      print_endline "No token specified in `standaml.conf`."
    | Some token ->
      print_endline @@ Printf.sprintf "Hello football fans (token is: %s)" token
