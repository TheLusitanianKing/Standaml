open Base

let () =
  let config_map = Standaml.Config.read_config_file "../standaml.conf" in
  let opt_token =
    Standaml.Config.read_config_param_from_config_map
      config_map ~key:"FOOTBALL_API_TOKEN" in
  match opt_token with
  | None -> failwith "No token specified in `standaml.conf`."
  | Some token ->
    let opt_standing = Lwt_main.run @@ Standaml.Api.fetch_standing ~token ~competition:"PPL" in
    match opt_standing with
    | None -> failwith "Standing couldn't be fetched"
    | Some standing ->
      let standing_display = Standaml.Tui.Standing.display_standing ~standing ~standing_format:Standaml.Tui.Standing_format.Default in
      Stdio.print_endline standing_display
