type props = {params: {"tagname": string}}

let default = (props: props) => {
  let tags = Article.List.get()->Article.Tags.make
  let tag_name = props.params["tagname"]->Js.Global.decodeURI
  let current_tag = tags->Js.Dict.get(tag_name)

  switch current_tag {
  | Some(tag) =>
    <div className="page-content">
      <h1 className="font-bold text-3xl my-2"> {tag_name->React.string} </h1>
      <ul className="list-disc pl-4">
        {tag
        |> Js.Array.map(filename => {
          let metadata = Article.Item.get(filename).data
          <li key={filename->Article.filenameToString} className={"mt-2"}>
            <Next.Link
              className="link link-primary link-hover"
              href={`/${filename->Article.filenameToString}`}>
              {metadata["title"]->React.string}
            </Next.Link>
          </li>
        })
        |> React.array}
      </ul>
    </div>

  | None => <div className="page-content"> {`404 Not Found`->React.string} </div>
  }
}
