open AncestorSite

@react.component
let make = (~children) => {
  <Box display={xs: #flex} justifyContent={xs: #center}>
    <Box width={xs: 100.->#pct} maxW={xs: 792->#px}> children </Box>
  </Box>
}
