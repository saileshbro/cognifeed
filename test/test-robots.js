"use strict"

const { expect } = require("chai")
const reqProm = require("request-promise-native")
const { RobotsParser, RobotsCache } = require("../src/scraper/robots")
const Link = require("../src/scraper/link")

describe("RobotsParser", function() {
  context("#isDisallowed", function() {
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
            expect(robotsParser.isDisallowed(link)).to.be.false
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
            expect(robotsParser.isDisallowed(link)).to.be.true
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
            new Link("https://twitter.com"),
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

describe("RobotsCache", function() {
  context("#update", function() {
    const robotsCache = new RobotsCache()
    const twitter = new Link("https://twitter.com")
    const wikipedia = new Link("https://wikipedia.org")

    it("should add robots.txt of given link to cache", function() {
      robotsCache.update(twitter, "This is the mock robots.txt of twitter")
      expect(
        robotsCache._cache.findIndex(item => item.link === twitter) >= 0
      ).to.be.true
    })

    it("should contain old and add new robots.txt of given links", function() {
      robotsCache.update(wikipedia, "This is the mock robots.txt of wikipedia")
      expect(
        robotsCache._cache.findIndex(item => item.link === twitter) >= 0
      ).to.be.true
      expect(
        robotsCache._cache.findIndex(item => item.link === wikipedia) >= 0
      ).to.be.true
    })
  })

  context("#findRobotFor", function() {
    const robotsCache = new RobotsCache()
    const twitter = new Link("https://twitter.com")
    const wikipedia = new Link("https://wikipedia.org")
    const mockTwitterRobot = "This is a mock robots.txt for twitter"
    const mockWikiRobot = "This is a mock robots.txt for Wiki"
    robotsCache.update(twitter, mockTwitterRobot)
    robotsCache.update(wikipedia, mockWikiRobot)

    it("should return the robots.txt string", function() {
      const twitterRobot = robotsCache.findRobotFor(twitter)
      expect(twitterRobot).to.equal(mockTwitterRobot)
    })

    it("should return the robots.txt string", function() {
      const wikiRobot = robotsCache.findRobotFor(wikipedia)
      expect(wikiRobot).to.equal(mockWikiRobot)
    })
  })
})
