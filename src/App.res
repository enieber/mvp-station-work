%%raw(`import("normalize.css")`)
%%raw(`import("react-toastify/dist/ReactToastify.css")`)

type pageProps

type props = {
  @as("Component")
  component: React.component<pageProps>,
  pageProps: pageProps,
}

Emotion.injectGlobal({
  "html": {
    "backgroundColor": Theme.colors(#background),
    "fontSize": "62.5%",
  },
  "*": {
    "fontFamily": Theme.Fonts.recoleta,
    "boxSizing": "border-box",
    "scrollBehavior": "smooth",
  },
})

let default = (props): React.element => {
  let {component, pageProps} = props

  <Layout> {React.createElement(component, pageProps)} </Layout>
}
