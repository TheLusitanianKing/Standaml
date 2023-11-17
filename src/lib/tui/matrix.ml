open Base

let fill_with content n ~fill_with_char =
  content ^ String.make (n - Batteries.UTF8.length content) fill_with_char

let fill_with_space = fill_with ~fill_with_char:' '

(** list of list of string (+ the max size, for each column) *)
let pretty_display (matrix: (int * string list) list) =
  let (matrix_reworked:(int * string) list list) =
    List.map ~f:(fun (max_size, l) -> List.map ~f:(fun x -> (max_size, x)) l) matrix in
  let transposed_matrix = List.transpose_exn matrix_reworked in
  String.concat ~sep:"\n" @@ List.mapi ~f:(fun i row ->
    let printed_row = String.concat ~sep:" | " @@ List.map ~f:(fun (i, s) -> fill_with_space s i) row in
    if i = 0 then 
      let dotted_row = String.concat ~sep:"---" @@ List.map ~f:(fun (i, _) -> fill_with "" i ~fill_with_char:'-') row in
      printed_row ^ "\n" ^ dotted_row
    else printed_row
  ) transposed_matrix
