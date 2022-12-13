module Styles = {
  let link = Emotion.css({
    "letterSpacing": "0.01em",
    "color": Theme.colors(#gray200),
    "fontSize": "2.0rem",
    "cursor": "pointer",
    "textDecoration": 0,
    "position": "relative",
    "transition": "color 250ms",
    "&:hover": {
      "color": Theme.colors(#black),
      "&:after": {
        "transition": "color 250ms",
        "borderColor": Theme.colors(#black),
      },
    },
    "&:after": {
      "content": "''",
      "bottom": -4,
      "left": 0,
      "position": "absolute",
      "width": "100%",
      "borderBottom": `1.5px dashed ${Theme.colors(#gray200)}`,
    },
  })
}

@react.component
let make = (~children, ~href) => {
  <a href target="_blank" className={Styles.link}> {children->React.string} </a>
}
