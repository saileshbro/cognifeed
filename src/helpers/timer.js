"use strict"

const targetTime = new Date(2020, 2, 14, 16, 17)

setInterval(() => {
  const now = new Date()
  if (
    now.getHours() === targetTime.getHours() &&
    now.getMinutes() === targetTime.getMinutes()
  )
    console.log("It is 4:15 PM")
}, 60000)
