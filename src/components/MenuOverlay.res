open Radix

module Styles = {
  let overlayShow = Emotion.keyframes({
    "0%": {"opacity": 0},
    "100%": {"opacity": 1},
  })

  let contentShow = Emotion.keyframes({
    "0%": {"opacity": 0, "transform": "translate(-50%, -48%) scale(.96)"},
    "100%": {"opacity": 1, "transform": "translate(-50%, -50%) scale(1)"},
  })

  let overlay = Emotion.css({
    "height": "100%",
    "width": "100%",
    "background": "#fff",
    "position": "fixed",
    "top": 0,
    "left": 0,
    "animation": `${overlayShow} 150ms cubic-bezier(0.16, 1, 0.3, 1)`,
  })

  let content = Emotion.css({
    "position": "fixed",
    "height": "100%",
    "width": "100%",
    "top": "50%",
    "left": "50%",
    "transform": `translate(-50%, -50%)`,
    "animation": `${contentShow} 150ms cubic-bezier(0.16, 1, 0.3, 1)`,
  })
}

module Trigger = Dialog.Trigger
module Close = Dialog.Close
module Root = Dialog.Root
module Portal = Dialog.Portal

module Content = {
  @react.component
  let make = (~children) => <Dialog.Content className=Styles.content> children </Dialog.Content>
}

module Overlay = {
  @react.component
  let make = () => {
    <Dialog.Overlay className=Styles.overlay />
  }
}
