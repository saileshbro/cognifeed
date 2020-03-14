/* eslint-disable linebreak-style */
require("dotenv").config()
const Link = require("./scraper/link")
const app = require("express")()
const morgan = require("morgan")
const bodyParser = require("body-parser")

// Modules required for scraper
const { fork } = require("child_process")
const path = require("path")

// CONSTANTS for scraper
const SCRAPER_DIR = "./scraper"
const HELPERS_DIR = "./helpers"

// Exit codes for signals
const EXIT_INT = 130
const EXIT_TERM = 143

const { errorHandler } = require("./helpers/error_handler")
const express = require("express")
const port = process.env.PORT || 8000
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(morgan("tiny"))
app.use("/public", express.static("public"))

app.use("/api", require("./routes/user"))
app.use("/api", require("./routes/spider"))
app.use("/api", require("./routes/articles"))
app.use("/api", require("./routes/tags"))
app.use("/api", require("./routes/websites"))
app.use("/api", require("./routes/notification"))

// 404 page not found
// app.all("*", (req, res) => {
//   throw new ErrorHandler(404, "Page not found!")
// })
app.listen(port, console.log(`Server running on port ${port}`))
// Error handler
app.use((err, req, res, next) => {
  errorHandler(err, res)
})

// Fork out a child process to start-up the scraper
// ;(function startServer() {
//   let scraperChild
//
//   try {
//     scraperChild = fork("start-server.js", {
//       cwd: path.join(__dirname, SCRAPER_DIR)
//     })
//   } catch (err) {
//     return console.error(err)
//   }
//
//   process.on("SIGINT", () => {
//     scraperChild.kill()
//     process.exit(EXIT_INT)
//   })
//   process.on("SIGTERM", () => {
//     scraperChild.kill()
//     process.exit(EXIT_TERM)
//   })
// })()

// Start the child process for the notification daemon
;(function startNoficationTimer() {
  let timerChild

  try {
    timerChild = fork("timer.js", {
      cwd: path.join(__dirname, HELPERS_DIR)
    })
  } catch (err) {
    return console.error(err)
  }

  process.on("SIGINT", () => {
    timerChild.kill()
    process.exit(EXIT_INT)
  })
  process.on("SIGTERM", () => {
    timerChild.kill()
    process.exit(EXIT_TERM)
  })
})()
