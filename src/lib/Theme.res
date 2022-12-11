module Colors = {
  type t = [
    | #background
    | #gray100
    | #black
  ]

  let make = (token: t) =>
    switch token {
    | #background => #hex("#FAFAFA")
    | #gray100 => #hex("#5A5A5A")
    | #black => #hex("#151515")
    }

  let toString = (token: t) => token->make->Ancestor_Css.Color.toString
}

module Fonts = {
  let corben = "'Corben', sans-serif"
  let chonburi = "'Chonburi', sans-serif"
}

let colors = Colors.toString
