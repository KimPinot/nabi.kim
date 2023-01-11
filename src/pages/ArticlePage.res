@react.component
let default = () => {
  let __html = "Hello <b>world</b>"
  <div dangerouslySetInnerHTML={{"__html": __html}} />
}
