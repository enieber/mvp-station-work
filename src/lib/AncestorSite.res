@ppx_ts.keyOf
type breakpoints<'a> = {
  xs?: 'a,
  sm?: 'a,
  md?: 'a,
  lg?: 'a,
  xl?: 'a,
}

include Ancestor.Make({
  type breakpoints<'a> = breakpoints<'a>
  type fields = breakpoints_keyOf
  let encode = breakpoints => [
    (Xs, breakpoints.xs),
    (Sm, breakpoints.sm),
    (Md, breakpoints.md),
    (Lg, breakpoints.lg),
    (Xl, breakpoints.xl),
  ]
  type spacing = float
  type radius = float
  type zIndex = int
  type colors = Theme.Colors.t

  let zIndex = v => v
  let colors = Theme.Colors.make
  let spacing = spacing => #pxFloat(spacing *. 8.0)
  let radius = radius => #pxFloat(radius *. 8.0)

  let sizeByBreakpoints = breakpoint =>
    switch breakpoint {
    | Xs => 0
    | Sm => 475
    | Md => 920
    | Lg => 1280
    | Xl => 1920
    }

  let css = Ancestor_Emotion.css
})
