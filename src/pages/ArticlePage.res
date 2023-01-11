@react.component
let make = () => {
  let __html = "Hello <b>world</b>"
  <div dangerouslySetInnerHTML={{"__html": __html}} />
}
