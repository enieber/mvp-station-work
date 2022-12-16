module Styles = {
  let button = Emotion.css({
    "border": 0,
    "outline": 0,
    "background": 0,
    "letterSpacing": "-0.02em",
    "color": Theme.colors(#gray100),
    "fontFamily": Theme.Fonts.recoleta,
    "fontWeight": 500,
    "fontSize": "2.2rem",
  })
}
@react.component
let make = React.forwardRef((~onClick=?, ref_) => {
  <button
    ?onClick
    ref=?{ref_->Js.Nullable.toOption->Belt.Option.map(ReactDOM.Ref.domRef)}
    className=Styles.button>
    {React.string("<< Go back")}
  </button>
})
