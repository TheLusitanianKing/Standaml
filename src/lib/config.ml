open Base
open Stdio

let read_config_file filename =
  In_channel.read_lines filename |> failwith "TODO"

let parse_config_single_line =
  String.split ~on:'='

