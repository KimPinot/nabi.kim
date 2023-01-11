open Unified
open Unified.Module
open Node.Fs
open Node.Path

type filename
type markdown = string

let article_folder = "articles"

@module external stringtoFilename: string => filename = "%identity"
@module external filenameToString: filename => string = "%identity"

let list = () => {
  readdirSync(article_folder)
  |> Js.Array.filter(filename => filename->Path.extname == ".md")
  |> Js.Array.map(stringtoFilename)
}

let read = (filename: filename) => {
  readFileSync(resolve(article_folder, filename->filenameToString))(#utf8)
}

let format = (markdown: markdown) => {
  markdown->GrayMatter.format
}

let render = (markdown: markdown) => {
  let empty = Js.Obj.empty()
  unified()
  ->use(remarkParse, empty)
  ->use(remarkMdx, empty)
  ->use(remarkGfm, empty)
  ->use(remarkGithub, {"repository": "kimpinot/nabi.kim"})
  ->use(remarkGemoji, empty)
  ->use(remarkBreaks, empty)
  ->use(remarkMermaid, {"launchOptions": empty, "svgo": Js.Nullable.null})
  ->use(remarkRehype, empty)
  ->use(rehypeStringify, empty)
  ->use(rehypeHighlight, empty)
  ->use(
    rehypeAddClasses,
    {
      "h1": "markdown-h1 text-2xl",
      "h2": "markdown-h2 text-xl",
      "h3": "markdown-h3 text-lg",
      "h4": "markdown-h4 text-base",
      "h1, h2, h3, h4": "font-bold mt-4",
      "code:not(.hljs)": "py-[1px] px-[4px] rounded-md bg-slate-100 text-stale-600",
      "input[type=checkbox]": "inline-block checkbox checkbox-sm -mb-1",
      "a": "link link-hover link-primary underline-offset-4",
      "ul, ol": "pl-5",
      "ul": "markdown-ul list-disc",
      "ol": "markdown-ol list-decimal",
      "img": "markdown-img card",
      "table": "markdown-table table",
    },
  )
  ->use(
    rehypeWrap,
    {"selector": "table", "wrapper": "div.overflow-x-auto.w-full", "fallback": false},
  )
  ->process(markdown)
}