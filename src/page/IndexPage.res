@react.components
let default = () => {
  let cards = Article.list()->Belt.Array.map(filename => {
    let article = filename->Article.read->Article.format
    <ArticleCard
      id={filename->Article.filenameToString}
      title={article.data["title"]}
      description={article.data["description"]}
      date={article.data["date"]->Date.kst}
    />
  })

  <main className="page-content"> {cards->React.array} </main>
}
