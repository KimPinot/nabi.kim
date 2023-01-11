let kst = (date: Js.Date.t) => {
  let utc = date->Js.Date.valueOf
  let offset = date->Js.Date.getTimezoneOffset *. (60. *. 1000.)
  (utc +. offset)->Js.Date.fromFloat
}
