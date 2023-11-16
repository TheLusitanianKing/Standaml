open Utils.Tuple

let%test "equal_tuple" =
  not @@ equal_tuple String.equal Int.equal ("A", 1) ("B", 2)
let%test "equal_tuple' (1)" =
  equal_tuple' String.equal ("A", "A") ("A", "A")
let%test "equal_tuple' (2)" =
  not @@ equal_tuple' String.equal ("A", "A") ("A", "B")
