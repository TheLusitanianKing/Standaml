open Base
open Cohttp
open Cohttp_lwt_unix
open Lwt

let fetch ~token ~route ~parser =
  let headers = Header.init_with "X-Auth-Token" token in
  Client.get (Uri.of_string route) ~headers >>= fun (resp, body) ->
  let code = resp |> Response.status |> Code.code_of_status in
  if code = 200 then
    Cohttp_lwt.Body.to_string body >>= fun json_raw ->
    (* a functorish/fmap equivalent would be better to use below
       but I don't know if that exists in OCaml *)
    let json = Yojson.Basic.from_string json_raw in
    Lwt.return @@ parser ~json
  else Lwt.return @@ None
