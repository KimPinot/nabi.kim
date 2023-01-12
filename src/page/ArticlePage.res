type params = {"filename": Article.filename}

@react.component
let default = async (~params: params) => {
  let article = params["filename"]->Article.read->Article.format
  let __html = (await article.content->Article.render)->VFile.toString
  <div dangerouslySetInnerHTML={{"__html": __html}} />
}
