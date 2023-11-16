(** Parse a single config line, e.g. "A=B" *)
val parse_config_single_line : string -> (string * string) option

(** Create a config map from Map.of_alist function *)
val get_config_map_from_map_of_alist : [< `Duplicate_key of 'a | `Ok of (string, 'b, Base.String.comparator_witness) Base.Map.t]
  -> (string, 'b, Base.String.comparator_witness) Base.Map.t

(** Read a config file to get a map of the config values *)
val read_config_file : string
  -> (string, string, Base.String.comparator_witness) Base.Map.t

(** From a config file mapped values, get a specific value *)
val read_config_param_from_config_map
  : (string, string, Base.String.comparator_witness) Base.Map.t 
  -> key:string
  -> string option

(** Read a config file and get a value from it
    Basically does both above at the same time *)
val read_config_param : string -> string -> string option
