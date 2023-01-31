module Link = {
  @module("next/link") @react.component
  external make: (
    ~href: string,
    ~className: string=?,
    @as("as") ~_as: string=?,
    ~prefetch: bool=?,
    ~scroll: bool=?,
    ~replace: option<bool>=?,
    ~shallow: option<bool>=?,
    ~passHref: option<bool>=?,
    ~children: React.element,
  ) => React.element = "default"
}

module Image = {
  type loadedImageSize = {
    naturalWidth: int,
    naturalHeight: int,
  }
  type imageLayout = [#intrinsic | #fixed | #responsive | #fill | #raw]
  @module("next/image") @react.component
  external make: (
    ~className: string=?,
    ~src: string,
    ~alt: string=?,
    ~width: int=?,
    ~height: int=?,
    ~quality: int=?,
    ~priority: bool=?,
    ~fill: bool=?,
    ~layout: imageLayout=?,
    ~onLoadingComplete: loadedImageSize => unit=?,
    ~ref: ReactDOM.domRef=?,
  ) => React.element = "default"
}

module Script = {
  type strategy = [
    | #beforeInteractive
    | #defer
    | #lazyOnload
    | #afterInteractive
    | #dangerouslyBlockRendering
  ]
  @module("next/script") @react.component
  external make: (
    ~src: string=?,
    ~strategy: strategy=?,
    ~children: React.element=?,
  ) => React.element = "default"
}
