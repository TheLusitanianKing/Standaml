val columns_to_display_in_classic_view :
  (string * (Model.Standing_line.t -> string)) list
(** The columns we want to display by default in the classic view *)

val prepare_columns :
     (string * (Model.Standing_line.t -> string)) list
  -> Model.Standing_line.t list
  -> (int * string list) list
(** Prepare the columns: from a list of columns and a list of standing lines
    returns the matrix with each column also having its max size *)

val display_standing_line_one_line :
     colour_scheme:Colour.Colour_scheme.t
  -> standing_line:Model.Standing_line.t
  -> string
(** For the one line format, display a single line *)

val display_standing :
     ?standing_format:Standing_format.t
  -> ?limit:int
  -> ?colour_scheme:Colour.Colour_scheme.t
  -> standing:Model.Standing.t
  -> string
(** This is the most important function of the module
    display the standing, according to the format and the limit (if any) *)
