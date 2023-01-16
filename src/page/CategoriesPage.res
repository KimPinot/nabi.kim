let default = () => {
  let categories = Article.List.get()->Article.Category.make
  let category_keys = categories->Js.Dict.keys

  <div className="page-content">
    {category_keys
    |> Js.Array2.sortInPlace
    |> Js.Array.map(key => {
      let category = Js.Dict.get(categories, key) |> Js.Option.getWithDefault([])

      <ul key={key} className="list-disc pl-4">
        <li className="mt-2">
          <h2 className="font-bold text-xl"> {key->React.string} </h2>
          <ul className="pl-4">
            {category
            |> Js.Array2.sortInPlace
            |> Js.Array.map(filename => {
              let title = (filename->Article.Item.get).data["title"]
              let filename = filename->Article.filenameToString
              <li className="mt-2" key={filename}>
                <Next.Link href={filename} className="link link-hover link-primary">
                  {title->React.string}
                </Next.Link>
              </li>
            })
            |> React.array}
          </ul>
        </li>
      </ul>
    })
    |> React.array}
  </div>
}
