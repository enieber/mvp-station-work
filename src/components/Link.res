module Styles = {
  let link = (~color, ~fontSize, ~decoration) =>
    Emotion.css({
      "letterSpacing": "0.01em",
      "color": Theme.colors(color),
      "fontSize": AncestorSite.Css.Length.toString(fontSize),
      "cursor": "pointer",
      "textDecoration": "underline",
      "textDecorationStyle": Ancestor.Css.TextDecorationStyle.toString(decoration),
    })
}

@react.component
let make = (
  ~children,
  ~href,
  ~target=?,
  ~fontSize=#em(1.0),
  ~decoration=#solid,
  ~color=#gray100,
) => {
  <a ?target href className={Styles.link(~color, ~fontSize, ~decoration)}>
    {children->React.string}
  </a>
}
