type props = {params: {"filename": Article.filename}}

let default = async (props: props) => {
  let {content} = props.params["filename"]->Article.Item.get
  let __html = (await Article.render(content))->VFile.toString
  <div dangerouslySetInnerHTML={{"__html": __html}} />
}
