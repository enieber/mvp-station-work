open AncestorSite

@react.component
let make = (~children) => {
  <Box px={xs: 3.0, sm: 4.0} display={xs: #flex} justifyContent={xs: #center}>
    <Box width={xs: 100.->#pct} maxW={xs: 792->#px}>
      <Header />
      <Box tag=#main> children </Box>
    </Box>
  </Box>
}
