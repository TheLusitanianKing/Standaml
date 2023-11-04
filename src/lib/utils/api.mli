val fetch : token:string
  -> route:string
  -> parser:(json:Yojson.Basic.t -> 'a option)
  -> ('a option) Lwt.t
