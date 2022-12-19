open AncestorSite

let default = () => {
  let (email, setEmail) = React.useState(() => "")
  let (error, setError) = React.useState(() => "")

  <Box
    display={xs: #flex}
    justifyContent={xs: #"flex-start", lg: #"space-between"}
    alignItems={xs: #center}
    flexDirection={xs: #column}
    tag=#form
    onSubmit={event => {
      ReactEvent.Synthetic.preventDefault(event)
      Js.log(email)
      if Js.String2.length(email) <= 3 {
        setError(_ => "deu ruim")
      } else {
        setError(_ => "")
      }
    }}>
    <Typography
      className={Animations.fadeIn(~delay=250, ())}
      tag=#h1
      textAlign={xs: #center}
      m={xs: 0.0}
      fontSize={xs: 3.2->#rem, md: 4.6->#rem}
      color={xs: #black}
      fontFamily={xs: [Theme.Fonts.recoleta]->#custom}>
      {`Se inscreva`->React.string}
    </Typography>
    <Base
      fontSize={xs: 2.0->#rem}
      tag=#input
      type_="email"
      placeholder="Email"
      value=email
      onChange={event => {
        let value = ReactEvent.Form.currentTarget(event)["value"]
        setEmail(_ => value)
      }}
    />
    {error->React.string}
    <Box mt={xs: 2.0} mb={xs: 2.0}>
      <Base
        bgColor={xs: #black}
        fontSize={xs: 2.0->#rem}
        color={xs: #light}
        borderStyle={xs: #none}
        borderRadius={xs: 1.0}
        p={xs: 1.0}
        tag=#button
        disabled={Js.String2.length(email) <= 3}>
        {"Cadastrar"->React.string}
      </Base>
    </Box>
  </Box>
}
