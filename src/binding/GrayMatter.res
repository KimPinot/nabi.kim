type grayMatterResponse = {
  content: string,
  data: {
    "title": string,
    "description": string,
    "date": Js.Date.t,
    "tags": option<array<string>>,
    "hidden": option<bool>,
    "categories": option<array<string>>,
  },
}

@module external format: string => grayMatterResponse = "gray-matter"
