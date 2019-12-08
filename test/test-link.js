const { expect } = require("chai")
const Link = require("../src/scraper/link")

describe("Link", () => {
  context("#resolve()", () => {
    it("should return https://wikipedia.org/", () => {
      expect(new Link("https://wikipedia.org", "/").resolve())
        .to.equal("https://wikipedia.org/")
    })

    it("should return https://wikipedia.org/", () => {
      expect(new Link("https://wikipedia.org").resolve())
        .to.equal("https://wikipedia.org/")
    })
  })

  context("#baseURL getter", () => {
    it("should return the baseURL", () => {
      expect(new Link("https://wikipedia.org").baseURL)
        .to.equal("https://wikipedia.org")
    })
  })

  context("#path getter", () => {
    it("should return the path", () => {
      expect(new Link("https://wikipedia.org", "/nodejs").path)
        .to.equal("/nodejs")
    })
  })
})

