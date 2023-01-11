%%raw(`import "styles/tailwindcss.scss"`)

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