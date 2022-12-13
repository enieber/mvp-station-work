open AncestorSite

@react.component
let make = (~children) => {
  <Box tag=#span bgColor={xs: #black} px={xs: 1.25} borderRadius={xs: 0.4}>
    {React.string(children)}
  </Box>
}
