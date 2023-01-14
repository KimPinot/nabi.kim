module Layout = {
  @react.component
  let make = (~title: string, ~date: Js.Date.t, ~children: React.element) => {
    <main>
      <header>
        <div className="page-content">
          <h1 className="text-2xl font-bold"> {title->React.string} </h1>
          <h3 className="text-lg flex gap-2 items-center">
            <ReactIcons.Bi.Time />
            {date->Date.kst->DateFns.format("yyyy-MM-dd hh:mm:ss")->React.string}
          </h3>
        </div>
      </header>
      <article className={"markdown-content"}>
        <div className="page-content pt-0 pb-36">
          children
          <Comments />
        </div>
      </article>
    </main>
  }
}

type params = {"filename": Article.filename}

@react.component
let make = (~params: params, ~children: React.element) => {
  let article = params["filename"]->Article.Item.get
  <Layout title={article.data["title"]} date={article.data["date"]}> children </Layout>
}
