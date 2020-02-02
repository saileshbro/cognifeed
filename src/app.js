require("dotenv").config()
const app = require("express")()
const morgan = require("morgan")
const bodyParser = require("body-parser")
const { errorHandler, ErrorHandler } = require("./helpers/error_handler")
const port = process.env.PORT || 8000
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(morgan("tiny"))

app.use("/api", require("./routes/user"))
app.use("/api", require("./routes/spider"))
app.use("/api", require("./routes/purifier"))
app.use("/api", require("./routes/articles"))
app.use("/api", require("./routes/tags"))

// 404 page not found
app.all("*", (req, res) => {
  throw new ErrorHandler(404, "Page not found!")
})
app.listen(port, console.log(`Server running on port ${port}`))
// Error handler
app.use((err, req, res, next) => {
  console.log(err)
  errorHandler(err, res)
})
//Spider Instantiation.
// const Link = require("./scraper/link")
// const Spider = require("./scraper/spider")
// const WikiPurifier = require("./purifier/WikiPurifier")
// const spider = Spider.spawn(new Link("https://en.wikipedia.org", "/wiki/Node.js"))
// ;(async function name() {
//   const horizion = await spider.resolveUrl()
//   console.log(horizion.links().length)
//   spider.getNewLinks()
//   const purifier = new WikiPurifier(spider.html, spider.link.resolve())
//   purifier.purify()
//   purifier.persistPurified()
// })()
