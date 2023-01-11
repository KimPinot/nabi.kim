@react.component
let make = (~id: string, ~title: string, ~description: string, ~date: Js.Date.t) => {
  <article className="flex flex-col py-4 gap-y-1">
    <Next.Link href={id} className="flex-1 text-2xl hover:text-primary transition-colors font-bold">
      {title->React.string}
    </Next.Link>
    <p className="text-base text-slate-700"> {description->React.string} </p>
    <span className="font-[inherit] text-base text-slate-400">
      {date->DateFns.format("yyyy-MM-dd")->React.string}
    </span>
  </article>
}
