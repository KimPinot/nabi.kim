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
    <Next.Script
      src="https://www.googletagmanager.com/gtag/js?id=G-FSPPFRL14L" strategy={#afterInteractive}
    />
    <Next.Script>
      {`
        window.dataLayer = window.dataLayer || [];
        function gtag(){window.dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-FSPPFRL14L');
        `->React.string}
    </Next.Script>
  </html>
}
