(** Takes a string,
    the number of character you want the string to
    and the character you want the string to be filled with (if needed) *)
val fill_with : string -> int -> fill_with_char:char -> string

(** Same than `fill_with` but for filling with spaces *)
val fill_with_space : string -> int -> string

(** Pretty display of a matrix of strings, each column allows needs a int 
    which is pre-calculated max size of the column for the matrix *)
val pretty_display : (int * string list) list -> string
