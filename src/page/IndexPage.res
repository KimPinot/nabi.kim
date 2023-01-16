@react.components
let default = () => {
  let cards =
    Article.List.get()
    ->Article.List.sort
    ->Belt.Array.map(filename => {
      let article = filename->Article.Item.get
      let filename = filename->Article.filenameToString
      <ArticleCard
        key={filename}
        id={filename}
        title={article.data["title"]}
        description={article.data["description"]}
        date={article.data["date"]->Date.kst}
      />
    })

  <main className="page-content"> {cards->React.array} </main>
}
