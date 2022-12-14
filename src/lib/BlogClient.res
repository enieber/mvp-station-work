open Node

type postData = {
  date: Date.t,
  title: string,
  excerpt: string,
}

type post = {
  content: string,
  publishedAt: string,
  title: string,
  excerpt: string,
  slug: string,
  readingTimeInMinutes: int,
}

let postsDirectory = Path.join([Process.cwd(), "posts"])
let ignoredFiles = ["index.js"]

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

let removeIgnoredFiles = files =>
  files->Belt.Array.keep(fileName => !(ignoredFiles->Array.includes(fileName)))

let removeFileExtension = files =>
  files->Belt.Array.map(fileName => fileName->String.split(".")->Belt.Array.getExn(0))

let getSlugs = () => Fs.readdirSync(postsDirectory)->removeIgnoredFiles->removeFileExtension

let getPostBySlug = slug => {
  let postPath = Path.join([postsDirectory, `${slug}.mdx`])
  let post = Fs.readFileSync(postPath, #utf8)
  let post = GrayMatter.matter(post)

  {
    slug,
    content: post.content,
    publishedAt: post.data.date->Date.toISOString,
    title: post.data.title,
    excerpt: post.data.excerpt,
    readingTimeInMinutes: calculateReadingTime(post.content),
  }
}

let getPosts = () => getSlugs()->Belt.Array.map(getPostBySlug)
