module Styles = {
  let button = Emotion.css({
    "padding": 0,
    "outline": 0,
    "border": 0,
    "margin": 0,
    "cursor": "pointer",
    "width": "fit-content",
    "height": "fit-content",
    "backgroundColor": "transparent",
    "display": "flex",
    "flexDirection": "column",
    "gap": 6,
    "> span": {
      "borderRadius": 1,
      "display": "block",
      "backgroundColor": Theme.colors(#black),
      "width": 28,
      "height": 2,
    },
  })
}


@react.component
let make = React.forwardRef((~onClick=?, ref_) => {
  <button
    ?onClick
    ref=?{ref_->Js.Nullable.toOption->Belt.Option.map(ReactDOM.Ref.domRef)}
    className=Styles.button>
    <span />
    <span />
  </button>
})
