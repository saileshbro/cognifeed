"use strict"

const Link = require("./link")
const Server = require("./server")

const url = "127.0.0.1:3300/api/websites"
const scraperServer = new Server()

let seeds = []

require("request-promise-native")(url)
  .then(res => {
    if (!res || typeof res[Symbol.iterator] !== "function")
      throw new Error("Server Start Error! response is not iterable.")

    for (let { _baseURL, _path } of res) {
      seeds.push(new Link(_baseURL, _path))
    }
  })
  .catch(err => {
    console.error(err.message)
    stopServer()
  })

scraperServer.start(new Link("https://en.wikipedia.org", "/wiki/php"))

process.on("SIGTERM", stopServer)
process.on("SIGINT", stopServer)

function stopServer(signal) {
  if (signal) console.log(`Received signal ${signal}`)
  scraperServer.stop()
  process.exit(1)
}
