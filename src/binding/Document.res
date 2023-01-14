type t

@val external create: t = "document"

@send external createElement: (t, string) => Dom.element = "createElement"
