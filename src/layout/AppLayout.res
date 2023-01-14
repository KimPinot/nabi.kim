%%raw(`import "styles/tailwindcss.scss"`)
%%raw(`import "styles/global.css"`)

@react.component
let make = (~children: React.element) => {
  <html>
    <head />
    <body>
      <Header />
      children
    </body>
  </html>
}
