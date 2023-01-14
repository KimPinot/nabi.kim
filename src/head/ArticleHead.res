module Head = {
  @react.component
  let make = (~title: string, ~description: string) => {
    <>
      <title> {`nabi.kim | ${title}`->React.string} </title>
      <meta name="description" content={description} />
      <meta property="og:title" content={`nabi.kim | ${title}`} />
      <meta property="og:image" content="https://nabi.kim/assets/opengraph.png" />
      <DefaultHead />
    </>
  }
}

type params = {"filename": Article.filename}

@react.component
let make = (~params: params) => {
  let article = params["filename"]->Article.Item.get
  <Head title={article.data["title"]} description={article.data["description"]} />
}
