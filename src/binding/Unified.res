type _unified

module Module = {
  type t
  @module external remarkParse: t = "remark-parse"
  @module external remarkMdx: t = "remark-mdx"
  @module external remarkGfm: t = "remark-gfm"
  @module external remarkGithub: t = "remark-github"
  @module external remarkGemoji: t = "remark-gemoji"
  @module external remarkBreaks: t = "remark-breaks"
  @module external remarkMermaid: t = "remark-mermaid"
  @module external remarkRehype: t = "remark-rehype"
  @module external rehypeStringify: t = "rehype-stringify"
  @module external rehypeHighlight: t = "rehype-highlight"
  @module external rehypeAddClasses: t = "rehype-add-classes"
  @module external rehypeWrap: t = "rehype-wrap"
}

@module("unified") external unified: unit => _unified = "unified"
@send external use: (_unified, Module.t, {..}) => _unified = "use"
@send external process: (_unified, string) => string = "process"
