type t = {
  path: string,
  dirname: string,
  basename: string,
  value: string,
  toString: unit => string,
}

@send external toString: t => string = "toString"
