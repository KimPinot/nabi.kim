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
