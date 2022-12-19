module Colors = {
  type t = [
    | #background
    | #gray100
    | #gray200
    | #gray400
    | #black
    | #light
  ]

  let make = (token: t) =>
    switch token {
    | #background => #hex("#FAFAFA")
    | #gray100 => #hex("#5A5A5A")
    | #gray200 => #hex("#717171")
    | #gray400 => #hex("#E2E2E2")
    | #black => #hex("#151515")
    | #light => #hex("#FFFFFF")
    }

  let toString = (token: t) => token->make->Ancestor_Css.Color.toString
}

module Fonts = {
  let recoleta = "'Recoleta', sans-serif"
}

let colors = Colors.toString
