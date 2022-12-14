module GetStaticPaths = Next.Page.GetStaticPaths
module GetStaticProps = Next.Page.GetStaticProps

type params = {slug: string}
type props = {post: BlogClient.post}

let default = () => {
  <div />
}

let transformMDtoHtml = async content => {
  open Remark
  let result = await remark()->use(Html.html, Some({"sanitize": false}))->process(content)
  result->String.make
}

let getStaticPaths: GetStaticPaths.t<params> = {
  open GetStaticPaths
  async () => {
    paths: BlogClient.getSlugs()->Belt.Array.map(slug => {params: {slug: slug}}),
    fallback: false,
  }
}

let getStaticProps: GetStaticProps.t<props, params, unit> = async context => {
  let post = BlogClient.getPostBySlug(context.params.slug)
  let html = await transformMDtoHtml(post.content)
  let html = html->CodeHighlighter.highlight

  let postWithHtml = {
    ...post,
    content: html,
  }
  {"props": {post: postWithHtml}}
}
