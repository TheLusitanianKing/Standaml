type t = { team_standings: Standing_line.t list }

let parse ~json =
  (* let open Yojson.Basic.Util in *)
  (* here for now, just to avoid OCaml complaining about unused values *)
  Stdio.print_endline @@ Yojson.Basic.to_string json;
  Some { team_standings = [] }
