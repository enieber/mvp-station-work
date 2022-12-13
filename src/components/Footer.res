open AncestorSite

@react.component
let make = () => {
  <Box
    tag=#footer
    borderTop={xs: (1->#px, #solid, #gray400)}
    mt={md: 24.0}
    pt={xs: 4.0, md: 4.0}
    pb={xs: 6.0, md: 9.0}
    gap={xs: #one(4.0)}
    display={xs: #flex}
    flexDirection={xs: #column, sm: #row}
    alignItems={xs: #center}
    justifyContent={xs: #center, sm: #"space-between"}>
    <Typography tag=#span fontSize={xs: 2.0->#rem} color={xs: #gray100}>
      {`Made with `->React.string}
      <Link color=#black target="_blank" href="https://rescript-lang.org"> "ReScript" </Link>
    </Typography>
    <Box display={xs: #flex} gap={xs: #one(1.5)}>
      <SocialLink href="https://twitter.com/vmaarcosp"> "twitter" </SocialLink>
      <SocialLink href="https://github.com/vmarcosp"> "github" </SocialLink>
    </Box>
  </Box>
}
