type t = Classic | One_line

let format_to_string x =
  match x with Classic -> "classic" | One_line -> "one-line"

let string_to_format x =
  match x with
  | "classic" -> Some Classic
  | "one-line" -> Some One_line
  | _ -> None
