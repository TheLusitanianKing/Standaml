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
