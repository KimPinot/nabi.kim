type filename

let article_folder = "articles"

@module external stringtoFilename: string => filename = "%identity"
@module external filenameToString: filename => string = "%identity"

let list = () => {
  Node.Fs.readdirSync(article_folder)
  |> Js.Array.filter(filename => filename->Path.extname == ".md")
  |> Js.Array.map(stringtoFilename)
}

let read = (filename: filename) => {
  Node.Fs.readFileSync(Node.Path.resolve(article_folder, filename->filenameToString))(#utf8)
}

let format = (markdown: string) => {
  markdown->GrayMatter.format
}
