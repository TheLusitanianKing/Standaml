open Base

module Basic = struct
  type t = Black | Red | Green | Yellow | Blue | Magenta | Cyan | White

  let basic_colour_to_int = function
    | Black -> 0
    | Red -> 1
    | Green -> 2
    | Yellow -> 3
    | Blue -> 4
    | Magenta -> 5
    | Cyan -> 6
    | White -> 7

  let parse_colour = function
    | "Black" -> Some Black
    | "Red" -> Some Red
    | "Green" -> Some Green
    | "Yellow" -> Some Yellow
    | "Blue" -> Some Blue
    | "Magenta" -> Some Magenta
    | "Cyan" -> Some Cyan
    | "White" -> Some White
    | _ -> None

  let colourized_text colour text =
    let colour_number = basic_colour_to_int colour in
    Printf.sprintf "\027[38;5;%dm%s\027[0m" colour_number text
end

module Colour_scheme = struct
  type t = (string * Basic.t) list
end
