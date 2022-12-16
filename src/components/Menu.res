open Radix

module Styles = {
  let listContainer = Emotion.css(
    {
      "padding": 0,
      "margin": 0,
      "display": "flex",
      "alignItems": "center",
      "flexDirection": "column",
      "gap": 32,
    }->Media.sm({
      "gap": 24,
      "flexDirection": "row",
    }),
  )

  let item = Emotion.css({
    "listStyle": "none",
  })

  let link = Emotion.css(
    {
      "color": Theme.colors(#gray100),
      "fontFamily": Theme.Fonts.recoleta,
      "fontSize": "2.8rem",
      "fontWeight": 500,
      "outline": "none",
      "textDecoration": "none",
      "borderRadius": 2,
      "padding": "0 4px",
      "transition": "box-shadow 250ms",
      "position": "relative",
      "&:after": {
        "content": "''",
        "position": "absolute",
        "left": "50%",
        "transform": "translateX(-50%)",
        "bottom": 0,
        "width": 16,
        "height": 2,
        "backgroundColor": "transparent",
      },
      "&[data-active]": {
        "&:after": {
          "backgroundColor": Theme.colors(#black),
        },
        "color": Theme.colors(#black),
      },
      "&:hover": {
        "color": Theme.colors(#black),
      },
      "&:focus-visible": {
        "boxShadow": `0px 0px 0px 1px ${Theme.colors(#gray100)}`,
      },
    }->Media.sm({
      "fontWeight": 400,
      "fontSize": "1.8rem",
    }),
  )
}

module Item = {
  @react.component
  let make = (~children) =>
    <NavigationMenu.Item className=Styles.item> children </NavigationMenu.Item>
}

module Link = {
  @react.component
  let make = (~label, ~href) => {
    let router = Next.Router.useRouter()
    let isActive = router.Next.Router.asPath === href

    <NavigationMenu.Link active=isActive asChild=true>
      <Next.Link className=Styles.link href> {label->React.string} </Next.Link>
    </NavigationMenu.Link>
  }
}

@react.component
let make = (~children) => {
  <NavigationMenu.Root>
    <NavigationMenu.List className=Styles.listContainer> children </NavigationMenu.List>
  </NavigationMenu.Root>
}
