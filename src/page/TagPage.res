let default = () => {
  let tags = Article.List.get()->Article.Tags.make
  let tag_keys = tags->Js.Dict.keys

  <div className="page-content">
    <h1 className="text-3xl font-bold my-2"> {"Tags"->React.string} </h1>
    <ul className="list-disc pl-4">
      {tag_keys
      |> Js.Array2.sortInPlace
      |> Js.Array.map(key => {
        let length = tags->Js.Dict.unsafeGet(key)->Js.Array.length->Belt.Int.toString

        <li className="mt-2" key={key}>
          <Next.Link className="link link-hover link-primary text-xl" href={`/tag/${key}`}>
            {`${key} (${length})`->React.string}
          </Next.Link>
        </li>
      })
      |> React.array}
    </ul>
  </div>
}
