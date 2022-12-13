open AncestorSite

module Name = {
  @react.component
  let make = () => {
    <Typography
      tag=#h1
      fontSize={xs: 3.6->#rem, md: 5.2->#rem}
      color={xs: #black}
      fontFamily={xs: [Theme.Fonts.chonburi]->#custom}>
      {`Marcos Oliveira`->React.string}
    </Typography>
  }
}

module Text = {
  @react.component
  let make = (~children) => {
    <Typography
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
    <Typography color={xs: #black} tag=#span> {React.string(children)} </Typography>
  }
}

module SocialLinks = {
  @react.component
  let make = () => {
    <Box display={xs: #flex} justifyContent={xs: #"space-between"}>
      <Link fontSize=#rem(2.0) href="mailto:marcosoliveira@duck.com">
        "marcosoliveira@duck.com"
      </Link>
      <Box display={xs: #none, md: #flex} gap={xs: #one(1.0)}>
        <Link fontSize=#rem(2.0) href="https://twitter.com/vmaarcosp"> "twitter" </Link>
        <Link fontSize=#rem(2.0) href="https://github.com/vmarcosp"> "github" </Link>
      </Box>
    </Box>
  }
}

@react.component
let make = () => {
  <Box mt={xs: 12.0, md: 21.5}>
    <Name />
    <Stack gap={xs: #one(8.0), md: #one(11.0)}>
      <Stack gap={xs: #one(3.0)}>
        <Text>
          {`UI Developer based in `->React.string}
          <TextHighlight> {`Brazil`} </TextHighlight>
          {` focused on making products using `->React.string}
          <TextHighlight> "design, functional programming" </TextHighlight>
          {" and "->React.string}
          <Link href="https://rescript-lang.org" target="_blank" color=#black> {"rescript"} </Link>
        </Text>
        <Text>
          {"I'm interested in "->React.string}
          <TextHighlight> "functional programming, ui, dx, design systems" </TextHighlight>
          {" and "->React.string}
          <TextHighlight> "open source." </TextHighlight>
        </Text>
      </Stack>
      <SocialLinks />
    </Stack>
  </Box>
}
