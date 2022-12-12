module Styles = {
  type styles

  external fromObject: {..} => styles = "%identity"
  external dictToObject: Js.Dict.t<styles> => {..} = "%identity"
  external dictOfObject: {..} => Js.Dict.t<styles> = "%identity"
}

type breakpoints<'a> = [#xs('a) | #sm('a) | #md('a) | #lg('a) | #xl('a)]

let valueOfDevice = (value: breakpoints<'a>) =>
  switch value {
  | #xs(_) => 0
  | #sm(_) => 600
  | #md(_) => 840
  | #lg(_) => 1280
  | #xl(_) => 1440
  }

let breakpoint = (current, styles, ~media, ~device) => {
  let currentStyles = current->Styles.dictOfObject
  let mediaQuery = `@media (${media}: ${device->valueOfDevice->Js.Int.toString}px)`

  currentStyles->Js.Dict.set(mediaQuery, styles->Styles.fromObject)
  currentStyles->Styles.dictToObject
}

let greaterThan = breakpoint(~media=`min-width`)
let lessThan = breakpoint(~media=`max-width`)

let xs = greaterThan(~device=#xs())
let sm = greaterThan(~device=#sm())
let md = greaterThan(~device=#md())
let lg = greaterThan(~device=#lg())
let xl = greaterThan(~device=#xl())
