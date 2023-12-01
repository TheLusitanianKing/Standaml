open Base
open Tui.Matrix

let%test "fill (1)" = String.equal (fill_with_space "AB" 3) "AB "
let%test "fill (2)" = String.equal (fill_with_space "AB" 2) "AB"
