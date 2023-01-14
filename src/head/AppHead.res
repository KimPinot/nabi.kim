@react.component
let make = () => {
  <>
    <title> {"nabi.kim"->React.string} </title>
    <meta name="description" content="평범한 기술 블로그" />
    <meta property="og:title" content="nabi.kim" />
    <meta property="og:description" content="평범한 기술 블로그" />
    <DefaultHead />
  </>
}
