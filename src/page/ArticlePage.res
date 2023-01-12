type props = { params: {"filename": Article.filename}}

let default = async (props: props) => {
  let { content } = Article.read(props.params["filename"])->Article.format
  let __html = (await Article.render(content)) -> VFile.toString
  <div dangerouslySetInnerHTML={{"__html": __html}} />
}
