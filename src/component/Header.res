@react.component
let make = () => {
  <header>
    <div className="page-content pb-0 flex items-center justify-between">
      <Next.Link href="/" className="avatar w-16 h-16 btn btn-square btn-xs btn-ghost">
        <Next.Image src="/assets/avatar.png" alt="" fill={true} />
      </Next.Link>
      <div className="flex">
        <Next.Link href="/" className="btn btn-ghost btn-xs">
          <span className="text-md hover:text-primary transition-[color]">
            {"Posts"->React.string}
          </span>
        </Next.Link>
        <Next.Link href="/about.md" className="btn btn-ghost btn-xs">
          <span className="text-md hover:text-primary transition-[color]">
            {"About"->React.string}
          </span>
        </Next.Link>
        <Next.Link href="/category" className="btn btn-ghost btn-xs">
          <span className="text-md hover:text-primary transition-[color]">
            {"Category"->React.string}
          </span>
        </Next.Link>
        <Next.Link href="/tag" className="btn btn-ghost btn-xs">
          <span className="text-md hover:text-primary transition-[color]">
            {"Tag"->React.string}
          </span>
        </Next.Link>
        // <Next.Link href="/notes" className="btn btn-ghost btn-xs">
        //   <span className="text-md hover:text-primary transition-[color]">
        //     {"Notes"->React.string}
        //   </span>
        // </Next.Link>
        <Next.Link
          href="https://nane.notion.site/CV-4779ec94b3f24a909fb9c2afbfcba343"
          className="btn btn-ghost btn-xs">
          <span className="text-md hover:text-primary transition-[color]">
            {"CV"->React.string}
          </span>
        </Next.Link>
      </div>
    </div>
  </header>
}
