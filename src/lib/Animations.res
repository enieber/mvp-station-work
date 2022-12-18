let fadeInAnimation = Emotion.keyframes({
  "0%": {"opacity": 0},
  "100%": {"opacity": 1},
})

let fadeFromTopAnimation = Emotion.keyframes({
  "0%": {"opacity": 0, "top": 50},
  "100%": {"opacity": 1, "top": 0},
})

let fadeIn = (~delay=150, ~duration=300, ()) =>
  Emotion.css({
    "opacity": 0,
    "animationFillMode": "forwards",
    "animationName": `${fadeInAnimation}`,
    "animationDuration": `${duration->Int.toString}ms`,
    "animationDelay": `${delay->Int.toString}ms`,
  })

let fadeFromBottom = (~delay=150, ~duration=300, ()) =>
  Emotion.css({
    "opacity": 0,
    "top": 50,
    "position": "relative",
    "animationFillMode": "forwards",
    "animationName": `${fadeFromTopAnimation}`,
    "animationDuration": `${duration->Int.toString}ms`,
    "animationDelay": `${delay->Int.toString}ms`,
  })
