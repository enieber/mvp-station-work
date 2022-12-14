type result<'data> = {
  content: string,
  data: 'data,
}

@module("gray-matter")
external matter: string => result<'data> = "default"
