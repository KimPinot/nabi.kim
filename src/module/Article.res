open Unified
open Unified.Module
open Node.Fs
open Node.Path

type filename
type markdown = string

let article_folder = "articles"

@module external stringtoFilename: string => filename = "%identity"
@module external filenameToString: filename => string = "%identity"

module Item = {
  let read = (filename: filename) => {
    let filename = filename->filenameToString->Js.Global.decodeURI
    readFileSync(resolve(article_folder, filename))(#utf8)
  }

  let format = (markdown: markdown) => {
    markdown->GrayMatter.format
  }

  let get = (filename: filename) => {
    filename->read->format
  }
}

module List = {
  let get = () => {
    readdirSync(article_folder)
    |> Js.Array.filter(filename => filename->Path.extname == ".md")
    |> Js.Array.map(stringtoFilename)
  }

  let sort = (filenames: array<filename>) => {
    filenames |> Js.Array.sortInPlaceWith((prev, curr) => {
      let prev_date = (prev->Item.get).data["date"]
      let curr_date = (curr->Item.get).data["date"]
      prev_date->Js.Date.getTime < curr_date->Js.Date.getTime ? 1 : -1
    })
  }

  module Filter = {
    let hidden = (filenames: array<filename>) => {
      filenames |> Js.Array.filter(filename => {
        let hidden = (filename->Item.get).data["hidden"]
        switch hidden {
        | Some(hidden) => hidden != true
        | _ => true
        }
      })
    }
  }
}

module Category = {
  open Js.Dict
  open Js.Array

  let make = (filenames: array<filename>) => {
    let category: Js.Dict.t<array<filename>> = Js.Dict.empty()
    // do main logic
    filenames |> forEach(filename => {
      let categories = (filename->Item.get).data["categories"]
      let key = switch categories {
      | Some(categories) => categories |> joinWith("/")
      | None => "Uncategorized"
      }
      let value =
        category->get(key) |> Js.Option.getWithDefault([])
      category->set(key, concat(value, [filename])->List.sort)
    })
    category
  }
}

module Tags = {
  open Js.Array
  open Js.Dict

  let make = (filenames: array<filename>) => {
    let tags: Js.Dict.t<array<filename>> = Js.Dict.empty()
    filenames |> forEach(filename => {
      let file_tags = (filename->Item.get).data["tags"]
      switch file_tags {
        | Some(file_tags) => {
          file_tags |> forEach(tag => {
            let value = tags->get(tag) |> Js.Option.getWithDefault([])
            tags->set(tag, concat(value, [filename])->List.sort)
          })
        }
        | None => ()
      }
    })
    tags
  }
}

let render = (markdown: markdown) => {
  let empty = Js.Obj.empty()
  unified()
  ->use(remarkParse, empty)
  ->use(remarkMdx, empty)
  ->use(remarkGfm, empty)
  ->use(remarkGithub, {"repository": "kimpinot/nabi.kim"})
  ->use(remarkGemoji, empty)
  ->use(remarkBreaks, empty)
  ->use(remarkEmbed, empty)
  ->use(remarkEmbedImages, {"directory": "articles"})
  ->use(remarkRehype, empty)
  ->use(rehypeStringify, empty)
  ->use(rehypeHighlight, empty)
  ->use(
    rehypeAddClasses,
    {
      "h1": "markdown-h1 text-2xl",
      "h2": "markdown-h2 text-xl",
      "h3": "markdown-h3 text-lg",
      "h4": "markdown-h4 text-base",
      "h1, h2, h3, h4": "font-bold mt-4",
      "code:not(.hljs)": "py-[1px] px-[4px] rounded-md bg-slate-100 text-stale-600",
      "input[type=checkbox]": "inline-block checkbox checkbox-sm -mb-1",
      "a": "link link-hover link-primary underline-offset-4",
      "ul, ol": "pl-5",
      "ul": "markdown-ul list-disc",
      "ol": "markdown-ol list-decimal",
      "img": "markdown-img card",
      "table": "markdown-table table",
      "pre": "mb-1 last:mb-0",
    },
  )
  ->use(
    rehypeWrap,
    {"selector": "table", "wrapper": "div.overflow-x-auto.w-full", "fallback": false},
  )
  ->process(markdown)
}
