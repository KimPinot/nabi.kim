type params = {"filename": Article.filename}

@react.component
let default = (~params: params) => {
  let article = params["filename"]->Article.read->Article.format
  <div dangerouslySetInnerHTML={{"__html": article.content->Article.render}} />
}
