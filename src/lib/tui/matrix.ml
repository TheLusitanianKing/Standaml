open Base

(** list of list of string (+ the max size, for each column) *)
let pretty_display (matrix: (int * string list) list) =
  String.concat ~sep:"\n" @@ List.map ~f:(fun _col -> failwith "TODO") matrix 
