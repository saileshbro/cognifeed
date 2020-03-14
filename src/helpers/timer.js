"use strict"

const targetTime = new Date(2020, 2, 14, 21, 19)

setInterval(() => {
  const now = new Date()
  if (
    now.getHours() === targetTime.getHours() &&
    now.getMinutes() === targetTime.getMinutes()
  )
    console.log("It is 9:13 PM")
}, 60000)
