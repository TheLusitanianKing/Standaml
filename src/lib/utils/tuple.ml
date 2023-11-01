let equal_tuple cmp1 cmp2 (x, y) (x', y') =
  cmp1 x x' && cmp2 y y'

let%test "equal_tuple" =
  not @@ equal_tuple String.equal Int.equal ("A", 1) ("B", 2)

let equal_tuple' cmp = equal_tuple cmp cmp

let%test "equal_tuple' (1)" =
  equal_tuple' String.equal ("A", "A") ("A", "A")
let%test "equal_tuple' (2)" =
  not @@ equal_tuple' String.equal ("A", "A") ("A", "B")
