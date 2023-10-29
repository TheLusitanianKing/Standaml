open Lwt
open Cohttp
open Cohttp_lwt_unix

let body token =
  (* TODO: the competition(s) will be parametrised later *)
  let standing_route = Standaml.Api.standing_route "PPL" in
  let headers = Header.init_with "X-Auth-Token" token in
  Client.get (Uri.of_string standing_route) ~headers >>= fun (resp, body) ->
  let code = resp |> Response.status |> Code.code_of_status in
  Printf.printf "Response code: %d\n" code;
  Printf.printf "Headers: %s\n" (resp |> Response.headers |> Header.to_string);
  body |> Cohttp_lwt.Body.to_string

let () =
  let config_map = Standaml.Config.read_config_file "../standaml.conf" in
  let opt_token =
    Standaml.Config.read_config_param_from_config_map
      config_map ~key:"FOOTBALL_API_TOKEN" in
  match opt_token with
    | None ->
      print_endline "No token specified in `standaml.conf`."
    | Some token ->
      let resp = Lwt_main.run @@ body token in
      print_endline @@
        Printf.sprintf "Hello football fans (token is: %s)\n%s" token resp
