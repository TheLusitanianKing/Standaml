open Base

let () =
  let config_map = Standaml.Config.read_config_file "../standaml.conf" in
  let opt_token =
    Standaml.Config.read_config_param_from_config_map
      config_map ~key:"FOOTBALL_API_TOKEN" in
  (* TODO: see how to propagate the option error handling *)
  match opt_token with
    | None -> failwith "No token specified in `standaml.conf`."
    | Some token ->
      let opt_standing = Lwt_main.run @@ Standaml.Api.fetch_standing ~token ~competition:"PPL" in
      match opt_standing with
        | None -> failwith "Standing couldn't be fetched"
        | Some _st ->  Stdio.print_endline "Hello football fans"
