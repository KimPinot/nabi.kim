type grayMatterResponse = {
  content: string,
  data: {
    "title": string,
    "description": string,
    "date": Js.Date.t,
    "tags": option<array<string>>,
    "categoires": array<string>,
  },
}

@module external format: string => grayMatterResponse = "gray-matter"
