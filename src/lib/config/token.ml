open Base

let get_token_from_config_or_fail filename =
  let config_map = Utils.Config.read_config_file filename in
  let opt_token =
    Utils.Config.read_config_param_from_config_map config_map
      ~key:"FOOTBALL_API_TOKEN" in
  match opt_token with
  | None ->
      failwith
        "No token specified: need to be specified either into the conf file or \
         with the option -t."
  | Some conf_token -> conf_token
