(** This is the format the user can choose to display the standing *)
type t = Classic | One_line

val format_to_string : t -> string
(** Put the format to a string *)

val string_to_format : string -> t option
(** Transform a string back to a format if possible *)
