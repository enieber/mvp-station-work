open AncestorSite

@react.component
let make = () => {
  <Box
    tag=#header
    pt={xs: 6.0}
    display={xs: #flex}
    justifyContent={xs: #"space-between"}
    width={xs: 100.->#pct}>
    <Logo />
    <Menu>
      <Menu.Item>
        <Menu.Link href="/" label="About" />
      </Menu.Item>
      <Menu.Item>
        <Menu.Link href="/writing" label="Writing" />
      </Menu.Item>
      <Menu.Item>
        <Menu.Link href="/talks" label="Talks" />
      </Menu.Item>
      <Menu.Item>
        <Menu.Link href="/projects" label="Projects" />
      </Menu.Item>
    </Menu>
  </Box>
}
