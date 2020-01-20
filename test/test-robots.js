"use strict"

const { expect } = require("chai")
const reqProm = require("request-promise-native")
const RobotsParser = require("../src/scraper/robots")
const Link = require("../src/scraper/link")

describe("RobotsParser", function() {
  context("#isAllowed", function() {
    const wikiDisallowedLinks = [
      new Link("https://en.wikipedia.org", "/wiki/Special:"),
      new Link("https://en.wikipedia.org", "/wiki/Special%3A"),
      new Link("https://en.wikipedia.org", "/wiki/%D8%AE%D8%A7%D8%B5:Search"),
      new Link("https://en.wikipedia.org", "/wiki/%D8%AE%D8%A7%D8%B5%3ASearch"),
      new Link("https://en.wikipedia.org", "/wiki/MediaWiki:Spam-blacklist"),
      new Link(
        "https://en.wikipedia.org",
        "/wiki/Wikipedia%3AArticles_for_deletion"
      )
    ]
    const wikiAllowedLinks = [
      new Link("https://en.wikipedia.org", "/wiki/php"),
      new Link("https://en.wikipedia.org", "/wiki/nodejs")
    ]

    it("should return true", function() {
      reqProm("https://en.wikipedia.org/robots.txt")
        .then(body => {
          const robotsParser = new RobotsParser(
            new Link("https://en.wikipedia.org"),
            body
          )
          wikiAllowedLinks.forEach(link => {
            expect(robotsParser.isAllowed(link)).to.be.true
          })
        })
        .catch(err => console.log(err.message))
    })

    it("should return false", function() {
      reqProm("https://en.wikipedia.org/robots.txt")
        .then(body => {
          const robotsParser = new RobotsParser(
            new Link("https://en.wikipedia.org"),
            body
          )
          wikiDisallowedLinks.forEach(link => {
            expect(robotsParser.isAllowed(link)).to.be.false
          })
        })
        .catch(err => {
          throw err
        })
    })
  })

  context("#getCrawlDelay", function() {
    it("should return 1", function() {
      reqProm("https://twitter.com/robots.txt")
        .then(body => {
          const robotsParser = new RobotsParser(
            new Link("https://en.wikipedia.org"),
            body
          )
          expect(robotsParser.getCrawlDelay()).to.equal(1)
        })
        .catch(err => {
          throw err
        })
    })
  })
})
