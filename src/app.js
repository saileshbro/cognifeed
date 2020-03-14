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
const SCRAPER_DIRECTORY = "scraper"

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

// 404 page not found
// app.all("*", (req, res) => {
//   throw new ErrorHandler(404, "Page not found!")
// })
app.listen(port, console.log(`Server running on port ${port}`))
// Error handler
app.use((err, req, res, next) => {
  errorHandler(err, res)
})

//Spider Instantiation.
// ;(function startServer(seeds) {
//   let scraperChild

//   try {
//     scraperChild = fork("start-server.js", {
//       cwd: path.join(__dirname, SCRAPER_DIRECTORY)
//     })
//   } catch (err) {
//     return console.log(err)
//   }

//   process.on("SIGINT", () => {
//     scraperChild.kill()
//   })

//   process.on("SIGTERM", () => {
//     scraperChild.kill()
//   })
// })()
