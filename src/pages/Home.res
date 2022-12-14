open AncestorSite

module Hero = Home_Hero

let default = () => {
  <Stack gap={xs: #one(8.0)} pb={xs: 8.0}>
    <Hero />
    <Stack
      gap={xs: #one(4.0), md: #one(4.0)} pt={sm: 16.0, md: 18.0} alignItems={xs: #"flex-start"}>
      <Box mt={xs: 3.0}>
        <Badge> "Writing" </Badge>
      </Box>
      <Grid spacing={xs: 4.0}>
        <Box columns={xs: #12, md: #6}>
          <ArticleCard
            title="Improving the UI using ADTs"
            text="You'll finally understand what is monad and how to use it."
            readingTime={`3min read`}
            publishedAt={`Dec 03, 2022`}
            lang=English
          />
        </Box>
        <Box columns={xs: #12, md: #6}>
          <ArticleCard
            title="Improving the UI using ADTs"
            text="You'll finally understand what is monad and how to use it."
            readingTime={`3min read`}
            publishedAt={`Dec 03, 2022`}
            lang=English
          />
        </Box>
      </Grid>
    </Stack>
  </Stack>
}
