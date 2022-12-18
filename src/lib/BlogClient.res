open Node

type postData = {
  date: Date.t,
  title: string,
  excerpt: string,
  lang: option<string>,
}

type post = {
  content: string,
  publishedAt: string,
  title: string,
  excerpt: string,
  slug: string,
  lang: ArticleCard.lang,
  readingTimeInMinutes: int,
}

let postsDirectory = Path.join([Process.cwd(), "posts"])

let calculateReadingTime = content => {
  let wordsPerMinute = 260.
  let wordsRegex = %re(`/\w+/g`)

  content
  ->String.match(wordsRegex)
  ->Belt.Option.map(Array.length)
  ->Belt.Option.map(wordsCount => Math.ceil(wordsCount->Belt.Int.toFloat /. wordsPerMinute))
  ->Belt.Option.getWithDefault(1.0)
  ->Belt.Float.toInt
}

let removeFileExtension = files =>
  files->Belt.Array.map(fileName => fileName->String.split(".")->Belt.Array.getExn(0))

let getSlugs = () => Fs.readdirSync(postsDirectory)->removeFileExtension

let getPostBySlug = slug => {
  let postPath = Path.join([postsDirectory, `${slug}.mdx`])
  let post = Fs.readFileSync(postPath, #utf8)
  let post: GrayMatter.result<postData> = GrayMatter.matter(post)

  {
    slug,
    content: post.content,
    publishedAt: post.data.date->Date.toISOString,
    title: post.data.title,
    excerpt: post.data.excerpt,
    readingTimeInMinutes: calculateReadingTime(post.content),
    lang: switch post.data.lang {
    | Some("portuguese") => #portuguese
    | None
    | Some("english")
    | Some(_) =>
      #english
    },
  }
}

let getPosts = () => getSlugs()->Belt.Array.map(getPostBySlug)

let getLatestPosts = () => getPosts()->Array.slice(~from=0, ~end=2)
