val equal_tuple : ('a -> 'b -> bool)
  -> ('c -> 'd -> bool)
  -> 'a * 'c
  -> 'b * 'd
  -> bool

val equal_tuple' : ('a -> 'b -> bool)
  -> 'a * 'a
  -> 'b * 'b
  -> bool