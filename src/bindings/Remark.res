type t
type plugin
type output

@module("remark")
external remark: unit => t = "remark"

@send external use: (t, plugin, option<{..}>) => t = "use"
@send external process: (t, string) => Promise.t<output> = "process"

module Html = {
  @module("remark-html") external html: plugin = "default"
}

module Prism = {
  @module("remark-prism") external prism: plugin = "default"
}
