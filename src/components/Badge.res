open AncestorSite

@react.component
let make = (~children) => {
  <Box
    tag=#span
    display={xs: #flex}
    alignItems={xs: #center}
    bgColor={xs: #black}
    py={xs: 1.0}
    px={xs: 1.25}
    m={xs: 0.0}
    borderRadius={xs: 0.4}
    color={xs: #background}
    fontSize={xs: 1.8->#rem, md: 2.2->#rem}>
    {React.string(children)}
  </Box>
}
