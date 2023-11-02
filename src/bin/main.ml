open Base

let () =
  let config_map = Standaml.Config.read_config_file "../standaml.conf" in
  let opt_token =
    Standaml.Config.read_config_param_from_config_map
      config_map ~key:"FOOTBALL_API_TOKEN" in
  match opt_token with
    | None ->
      Stdio.print_endline "No token specified in `standaml.conf`."
    | Some token ->
      let resp = Lwt_main.run @@ Standaml.Api.fetch_standing token "PPL" in
      Stdio.print_endline @@
        Printf.sprintf "Hello football fans (token is: %s)\n%s" token resp
