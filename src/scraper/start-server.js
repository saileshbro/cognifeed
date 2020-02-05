"use strict"

const Link = require("./link")
const Server = require("./server")

const scraperServer = new Server()

scraperServer.start(new Link("https://en.wikipedia.org", "/wiki/php"))

process.on("SIGTERM", stopServer)
process.on("SIGINT", stopServer)

function stopServer(signal) {
  console.log(`Received signal ${signal}`)
  scraperServer.stop()
  process.exit(1)
}
