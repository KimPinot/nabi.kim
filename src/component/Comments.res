%%raw(`"use client"`)

@react.component
let make = () => {
  let handler: Js.nullable<Dom.element> => unit = element => {
    switch element->Js.Nullable.toOption {
    | None => ()
    | Some(element) => {
        let script = Document.create->Document.createElement("script")
        script->Element.setAttribute("src", "https://utteranc.es/client.js")
        script->Element.setAttribute("repo", "KimPinot/plog-comments")
        script->Element.setAttribute("issue-term", "pathname")
        script->Element.setAttribute("label", "comment :speech_balloon:")
        script->Element.setAttribute("theme", "github-light")
        script->Element.setAttribute("crossorigin", "anonymous")
        script->Element.setAttribute("async", "true")
        element->Element.replaceChildren(script)
      }
    }
  }
  <section className="w-full mt-8 print:hidden" ref={handler->ReactDOM.Ref.callbackDomRef} />
}
