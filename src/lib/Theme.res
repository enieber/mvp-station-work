module Colors = {
  type t = [
    | #background
    | #gray100
    | #gray200
    | #black
  ]

  let make = (token: t) =>
    switch token {
    | #background => #hex("#FAFAFA")
    | #gray100 => #hex("#5A5A5A")
    | #gray200 => #hex("#717171")
    | #black => #hex("#151515")
    }

  let toString = (token: t) => token->make->Ancestor_Css.Color.toString
}

module Fonts = {
  let corben = "'Corben', sans-serif"
  let chonburi = "'Chonburi', sans-serif"
}

let colors = Colors.toString
