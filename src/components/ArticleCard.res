open AncestorSite

type lang = English | Portuguese

module Styles = {
  let card = Emotion.css(
    {
      "transition": "background-color 200ms",
      "backgroundColor": "#eee",
      "cursor": "default",
    }->Media.md({
      "backgroundColor": "transparent",
      "&:hover": {
        "backgroundColor": "#eee",
      },
    }),
  )
}

module Stats = {
  @react.component
  let make = (~children) => {
    <Typography tag=#span fontWeight={xs: #500} fontSize={xs: 1.6->#rem} color={xs: #black}>
      {React.string(children)}
    </Typography>
  }
}

@react.component
let make = (~title, ~text, ~lang: lang, ~readingTime, ~publishedAt) => {
  <Stack
    className=Styles.card
    borderRadius={xs: 0.75}
    py={xs: 3.0}
    px={xs: 3.0}
    gap={xs: #one(1.0)}
    tag=#article>
    <Typography fontSize={xs: 2.2->#rem} fontWeight={xs: #700} color={xs: #black}>
      {title->React.string}
    </Typography>
    <Typography fontSize={xs: 1.8->#rem} lineHeight={xs: 2.8->#rem} color={xs: #gray100}>
      {text->React.string}
    </Typography>
    <Stack
      mt={xs: 2.5}
      gap={xs: #one(1.5)}
      alignItems={xs: #center}
      direction={xs: #horizontal}
      divider={<Base
        borderRadius={xs: 1.0} bgColor={xs: #gray200} width={xs: 4->#px} height={xs: 4->#px}
      />}>
      <Stats> {readingTime} </Stats>
      <Stats> {publishedAt} </Stats>
      <Stats>
        {switch lang {
        | English => "🇺🇸"
        | Portuguese => "🇧🇷"
        }}
      </Stats>
    </Stack>
  </Stack>
}
