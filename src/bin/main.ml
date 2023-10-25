let () =
  let config_map = Standaml.Config.read_config_file "standaml.conf" in
  let opt_token = Standaml.Config.read_config_param_from_config_map config_map ~key:"" in
  match opt_token with
  | None -> print_endline "You need to specify your token in the config file `standaml.conf`."
  | Some _token -> print_endline "Hello football fans"
