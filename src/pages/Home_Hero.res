open AncestorSite

let customFadeIn = Animations.fadeIn(~delay=400)

module Name = {
  @react.component
  let make = () => {
    <Typography
      tag=#h1
      className={customFadeIn()}
      m={xs: 0.0}
      fontSize={xs: 3.6->#rem, md: 5.2->#rem}
      color={xs: #black}
      fontFamily={xs: [Theme.Fonts.recoleta]->#custom}>
      {`Station Work`->React.string}
    </Typography>
  }
}

module Text = {
  @react.component
  let make = (~children) => {
    <Typography
      className={customFadeIn()}
      tag=#p
      letterSpacing={xs: -0.02->#em}
      m={xs: 0.0}
      lineHeight={xs: 3.6->#rem}
      color={xs: #gray200}
      fontSize={xs: 2.2->#rem, md: 2.4->#rem}>
      children
    </Typography>
  }
}
module TextHighlight = {
  @react.component
  let make = (~children) => {
    <Typography color={xs: #black} fontWeight={xs: #500} tag=#span>
      {React.string(children)}
    </Typography>
  }
}

module Texts = {
  @react.component
  let make = () => {
    <Stack gap={xs: #one(3.0)}>
      <Text>
        {`Monte sua estação de trabalho como um profissional usando `->React.string}
        <TextHighlight> {`Station Work`} </TextHighlight>
      </Text>
    </Stack>
  }
}

@react.component
let make = () => {
  <Stack mt={xs: 12.0, md: 21.5} gap={xs: #one(1.5)}>
    <Name />
    <Stack gap={xs: #one(6.0), md: #one(11.0)}>
      <Texts />
    </Stack>
  </Stack>
}
