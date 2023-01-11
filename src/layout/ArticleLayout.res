module Layout = {
  @react.component
  let make = (~title: string, ~date: Js.Date.t, ~children: React.element) => {
    <main>
      <header>
        <div className="page-content">
          <h1 className="text-2xl font-bold"> {title->React.string} </h1>
          <h3 className="text-lg flex gap-2 items-center">
            //   <BiTime />
            {date->DateFns.format("yyyy-MM-dd hh:mm:ss")->React.string}
          </h3>
        </div>
      </header>
      <article className={"markdown-content"}>
        <div className="page-content pt-0 pb-36"> children </div>
      </article>
    </main>
  }
}

@react.component
let make = (~children: React.element) => {
  <Layout title="test" date={Js.Date.fromString("2023-1-12 04:44:00")}> children </Layout>
}
