open Base

let fill content n =
  let rec helper acc s i =
    if i >= n
      then acc
      else
        match s with
        | [] -> acc @ List.init (n-i) ~f:(fun _ -> ' ')
        | x::xs -> helper (acc @ [x]) xs (i+1)
  in String.of_char_list @@ helper [] (String.to_list content) 0

let%test "fill (1)" =
  String.equal (fill "AB" 3) "AB "

let%test "fill (2)" =
  String.equal (fill "AB" 2) "AB"

let%test "fill (3)" =
  String.equal (fill "AB" 0) ""

(** list of list of string (+ the max size, for each column) *)
let pretty_display (matrix: (int * string list) list) =
  String.concat ~sep:"\n" @@ List.map ~f:(fun _col -> failwith "TODO") matrix 
