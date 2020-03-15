"use strict"

const Link = require("./link")
const Server = require("./server")

// Exit codes for signals
const EXIT_INT = 130
const EXIT_TERM = 143

const url = "127.0.0.1:3300/api/websites"
const testURL = "https://my-json-server.typicode.com/2goodAP/fake-json/websites"
const scraperServer = new Server()

process.on("SIGTERM", stopServer)
process.on("SIGINT", stopServer)

function stopServer(signal) {
  if (signal) console.log(`Received signal ${signal}`)
  scraperServer.stop()

  let ecode
  if (signal === "SIGINT") ecode = EXIT_INT
  else if (signal === "SIGTERM") ecode = EXIT_TERM

  process.exit(ecode)
}

require("request-promise-native")(testURL)
  .then(res => {
    let links

    try {
      links = JSON.parse(res)
    } catch (_) {
      throw new Error("Server Start Error! Invalid JSON data.")
    }

    if (!links || typeof links[Symbol.iterator] !== "function")
      throw new Error("Server Start Error! response is not iterable.")

    const seeds = []

    for (let { _baseURL, _path } of links) {
      seeds.push(new Link(_baseURL, _path))
    }

    scraperServer.start(seeds)
  })
  .catch(err => {
    console.error(err.message)
    stopServer()
  })
