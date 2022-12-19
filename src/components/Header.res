open AncestorSite

type link = {label: string, href: string}

let links = [
  {
    label: "Sobre",
    href: "/",
  },
  {
    label: "Começar",
    href: "/wait-list",
  },
]

@react.component
let make = () => {
  let (isMenuOpen, setIsMenuOpen) = React.useState(_ => false)
  let router = Next.Router.useRouter()

  React.useEffect(() => {
    router.events->Next.Router.on(#routeChangeComplete((_, _) => setIsMenuOpen(_ => false)))
    None
  })

  <Box
    className={Animations.fadeIn()}
    tag=#header
    pt={xs: 4.0, md: 6.0}
    display={xs: #flex}
    alignItems={xs: #center}
    justifyContent={xs: #"space-between"}
    width={xs: 100.->#pct}>
    <Next.Link href="/">
      <Logo />
    </Next.Link>
    <Hidden on={xs: true, sm: false}>
      <Menu>
        {links
        ->Belt.Array.map(link => {
          <Menu.Item key=link.href>
            <Menu.Link href=link.href label=link.label />
          </Menu.Item>
        })
        ->React.array}
      </Menu>
    </Hidden>
    <Hidden on={xs: false, sm: true}>
      <MenuOverlay.Root onOpenChange={isOpen => setIsMenuOpen(_ => isOpen)} _open=isMenuOpen>
        <MenuOverlay.Trigger asChild=true>
          <MenuButton />
        </MenuOverlay.Trigger>
        <MenuOverlay.Portal>
          <MenuOverlay.Overlay />
          <MenuOverlay.Content>
            <Stack height={xs: 100.->#pct}>
              <Box
                display={xs: #flex}
                alignItems={xs: #center}
                justifyContent={xs: #center}
                flexGrow={xs: #num(3.0)}>
                <Menu>
                  {links
                  ->Belt.Array.map(link => {
                    <Menu.Item key=link.href>
                      <Menu.Link href=link.href label=link.label />
                    </Menu.Item>
                  })
                  ->React.array}
                </Menu>
              </Box>
              <Box display={xs: #flex} p={xs: 3.0}>
                <MenuOverlay.Close asChild=true>
                  <CloseMenuButton />
                </MenuOverlay.Close>
              </Box>
            </Stack>
          </MenuOverlay.Content>
        </MenuOverlay.Portal>
      </MenuOverlay.Root>
    </Hidden>
  </Box>
}
