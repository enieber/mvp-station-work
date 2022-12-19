open AncestorSite

module GetStaticProps = Next.Page.GetStaticProps
module Hero = Home_Hero

type section = {
  title: string,
  items: option<list<string>>,
  description: option<string>,
}

type sections = array<section>

module TextHighlight = {
  @react.component
  let make = (~children) => {
    <Typography
      color={xs: #black} fontWeight={xs: #500} tag=#h4 fontSize={xs: 3.2->#rem, md: 4.2->#rem}>
      {React.string(children)}
    </Typography>
  }
}

let default = () => {
  let sections: sections = [
    {
      title: "Problema",
      items: Some(list{"Multiplos usuarios para um funcionario", "Sistemas dificeis de integrar"}),
      description: None,
    },
    {
      title: "Ideia",
      description: Some(`Existe muitas ferramentas que nos auxiliam no dia de trabalho, ferramentas como: rocketchat, nextcloud e outras ferramentas. Para cada ferramenta alguém precisa gerenciar, criar usuarios distintos e se caso a empresa queira criar ou usar alguma ferramenta open source, muita das vezes é dificultada pela necessidade de usar algum sistema de autenticação complexo e nada extensível. Por conta desse problema, o Station Work nasceu com o objetivo de centralizar todos os acessos e ferramentas que a sua empresa usa, criando uma verdadeira Estação de trabalho.`),
      items: None,
    },
    {
      title: "Solução",
      items: Some(list{"Centralização de login", "Api para integração", "Open Source code"}),
      description: None,
    },
  ]

  <Stack gap={xs: #one(8.0)} pb={xs: 8.0}>
    <Hero />
    <Stack gap={xs: #one(6.0), md: #one(11.0)}>
      {sections
      ->Belt.Array.mapWithIndex((key, section) => {
        <Box columns={xs: #12, md: #12} key={`section-${key->Belt.Int.toString}`}>
          <h3>
            <TextHighlight> {section.title} </TextHighlight>
          </h3>
          <div>
            {switch section.items {
            | Some(items) =>
              <ul>
                {items
                ->Belt.List.toArray
                ->Belt.Array.mapWithIndex((key, item) => {
                  <li key={`${section.title}-${key->Belt.Int.toString}`}>
                    <Hero.Text> {item->React.string} </Hero.Text>
                  </li>
                })
                ->React.array}
              </ul>
            | None => <> </>
            }}
            {switch section.description {
            | Some(description) => <Hero.Text> {description->React.string} </Hero.Text>

            | None => <> </>
            }}
          </div>
        </Box>
      })
      ->React.array}
    </Stack>
  </Stack>
}
