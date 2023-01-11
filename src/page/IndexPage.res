@react.components
let default = () => {
  <main className="page-content">
    <ArticleCard
      id="test"
      title="test..."
      description="really test..."
      date={Js.Date.fromString("2023-01-12 04:32:40")}
    />
  </main>
}
