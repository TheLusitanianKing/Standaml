open Base

type t = { team_standings: Standing_line.t list }

let parse ~json =
  let open Yojson.Basic.Util in
  let opt_standing = json |> member "standings" |> to_list |> List.hd in
  match opt_standing with
    | None -> None
    | Some st ->
      let lines = st |> member "table"
        |> to_list
        |> List.filter_map ~f:(fun json -> Standing_line.parse ~json) in
      Some { team_standings = lines }
