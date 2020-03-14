require("dotenv").config()
const axios = require("axios")
const express = require("express")
const app = express()
const morgan = require("morgan")
const bodyParser = require("body-parser")
const { errorHandler } = require("./helpers/error_handler")
const fcm = require("../functions/index")
const port = process.env.PORT || 8000
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(morgan("tiny"))
app.use("/public", express.static("public"))

app.use("/api", require("./routes/user"))
app.use("/api", require("./routes/spider"))
app.use("/api", require("./routes/purifier"))
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
// const Link = require("./scraper/link")
// const Spider = require("./scraper/spider")
// const WikiPurifier = require("./purifier/WikiPurifier")
// const spider = Spider.spawn(new Link("https://en.wikipedia.org", "/wiki/Node.js"))
// ;(async function name() {
//   const horizion = await spider.resolveUrl()
//   spider.getNewLinks()
//   const purifier = new WikiPurifier(spider.html, spider.link.resolve())
//   purifier.purify()
//   purifier.persistPurified()
// })()
const sendNotification = async () => {
  try {
    const response = await axios({
      method: "POST",
      url: "https://fcm.googleapis.com/fcm/send",
      headers: {
        "Content-Type": "application/json",
        Authorization:
          "Key=AAAAZ6-SYm0:APA91bGiJAyN79c-AqVRf94wiKia1ghqmNk6-xTW1_OadiF-OaTxAo9XclHrm7d5bN74yBzQAPUj38BX32ygx0Uq35Pq8_3VsK5c7AMHiSh6joPKlT98Ju82iimVn41P_BPK138Bf0k5"
      },
      data: { notification: { title: "My Awesome App", body: "message" } }
    })
  } catch (error) {
    console.log(error)
  }
}
sendNotification()
