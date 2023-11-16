let equal_tuple cmp1 cmp2 (x, y) (x', y') =
  cmp1 x x' && cmp2 y y'

let equal_tuple' cmp = equal_tuple cmp cmp
