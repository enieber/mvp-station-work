open AncestorSite

module Styles = {
  let card = Emotion.css({
    "transition": "background-color 200ms",
    "cursor": "default",
    "&:hover": {
      "backgroundColor": "#eee",
    },
  })
}

module Stats = {
  @react.component
  let make = (~children) => {
    <Typography tag=#span fontSize={xs: 1.6->#rem} color={xs: #black}>
      {React.string(children)}
    </Typography>
  }
}

@react.component
let make = (~title, ~text, ~readingTime, ~publishedAt) => {
  <Stack
    className=Styles.card
    borderRadius={xs: 0.75}
    py={xs: 3.0}
    px={xs: 2.0}
    gap={xs: #one(1.0)}
    tag=#article>
    <Typography fontSize={xs: 2.0->#rem} color={xs: #black}> {title->React.string} </Typography>
    <Typography fontSize={xs: 1.8->#rem} color={xs: #gray100}> {text->React.string} </Typography>
    <Stack
      mt={xs: 2.5}
      gap={xs: #one(2.0)}
      alignItems={xs: #center}
      direction={xs: #horizontal}
      divider={<Base
        borderRadius={xs: 1.0} bgColor={xs: #gray200} width={xs: 4->#px} height={xs: 4->#px}
      />}>
      <Stats> {readingTime} </Stats>
      <Stats> {publishedAt} </Stats>
    </Stack>
  </Stack>
}
