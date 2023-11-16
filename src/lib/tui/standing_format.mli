(** This is the format the user can choose to display the standing *)
type t = Classic | One_line

(** Put the format to a string *)
val format_to_string : t -> string

(** Transform a string back to a format if possible *)
val string_to_format : string -> t option
