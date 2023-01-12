type _unified

module Module = {
  type t
  @module("remark-parse") external remarkParse: t = "default"
  @module("remark-mdx") external remarkMdx: t = "default"
  @module("remark-gfm") external remarkGfm: t = "default"
  @module("remark-github") external remarkGithub: t = "default"
  @module("remark-gemoji") external remarkGemoji: t = "default"
  @module("remark-breaks") external remarkBreaks: t = "default"
  @module("remark-mermaid") external remarkMermaid: t = "default"
  @module("remark-rehype") external remarkRehype: t = "default"
  @module("rehype-stringify") external rehypeStringify: t = "default"
  @module("rehype-highlight") external rehypeHighlight: t = "default"
  @module("rehype-add-classes") external rehypeAddClasses: t = "default"
  @module("rehype-wrap") external rehypeWrap: t = "default"
}

@module("unified") external unified: unit => _unified = "unified"
@send external use: (_unified, Module.t, {..}) => _unified = "use"
@send external process: (_unified, string) => promise<VFile.t> = "process"
