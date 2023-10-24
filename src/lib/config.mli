val parse_config_single_line : string -> (string * string) option

val get_config_map_from_map_of_alist
  : [< `Duplicate_key of 'a | `Ok of (string, 'b, Base.String.comparator_witness) Base.Map.t]
  -> (string, 'b, Base.String.comparator_witness) Base.Map.t

val read_config_file : string -> (string, string, Base.String.comparator_witness) Base.Map.t

val read_config_param_from_config_map : ('a, 'b, 'c) Base.Map.t -> key:'a -> 'b option

val read_config_param : string -> string -> string option
