open Base
open Cohttp
open Cohttp_lwt_unix
open Lwt
(* open Yojson *)

let fetch_standing token competition =
  (* TODO: the competition(s) will be parametrised later *)
  let standing_route = Route.standing_route competition in
  let headers = Header.init_with "X-Auth-Token" token in
  Client.get (Uri.of_string standing_route) ~headers >>= fun (resp, body) ->
  let code = resp |> Response.status |> Code.code_of_status in
  Stdio.print_endline @@
    Printf.sprintf "Response code: %d\n" code;
  Stdio.print_endline @@
    Printf.sprintf "Headers: %s\n" (resp |> Response.headers |> Header.to_string);
  body |> Cohttp_lwt.Body.to_string

(* let parse_standing json_raw =
  let json = Yojson.Basic.from_string json_raw in
  let open Yojson.Basic.Util in
  let title = json |> member "title" |> to_string in
  title *)
