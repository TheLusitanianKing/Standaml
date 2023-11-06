type t = Simple | One_line

let format_to_string x =
  match x with
  | Simple -> "simple"
  | One_line -> "one-line"

let string_to_format x =
  match x with
  | "simple" -> Some Simple
  | "one-line" -> Some One_line
  | _ -> None
