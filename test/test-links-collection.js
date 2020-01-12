const {expect} = require("chai")
const Link = require("../src/scraper/link")
const LinksCollection = require("../src/scraper/links-collection")


describe("LinksCollection", function() {
  context("#create()", function() {
    let links = LinksCollection.create()
    it("should return an object", function() {
      expect(links).to.be.an("object")
    })
    it("should return an object having an array", function() {
      expect(links).to.own.property("_links")
      expect(links._links).to.be.an("array")
    })
  })

  context("#readLinks", function() {
    let links = LinksCollection.create()
    it("should return an array of urls", function() {
      // Test initialization
      const vimAboutLink = new Link("https://vim.org", "/about")
      const nodejsDownloadLink = new Link("https://nodejs.org", "/download")
      links = links.addLink(vimAboutLink)
      links = links.addLink(nodejsDownloadLink)

      // Test body
      expect(links.readLinks()).to.be.an("array")
      expect(links.readLinks()).to.deep.equals([
        "https://vim.org/about",
        "https://nodejs.org/download"
      ])
    })
  })

  context("#addLink", function() {
    let links = LinksCollection.create()
    it("should add a new link object to linksCollection", function() {
      links.addLink(new Link("https://wikipedia.org"))._links.forEach(link => {
        expect(link.baseURL).to.be.a("string")
        expect(link.path).to.be.a("string")
      })
    })
  })

  context("#getLink", function() {
    let links = LinksCollection.create()
    const vimAboutLink = new Link("https://vim.org", "/about")
    const nodejsDownloadLink = new Link("https://nodejs.org", "/download")
    links = links.addLink(vimAboutLink)
    links = links.addLink(nodejsDownloadLink)
    it("should get the link at given index", function() {
      expect(links.getLink(0)).to.deep.equals(vimAboutLink)
      expect(links.getLink(1)).to.deep.equals(nodejsDownloadLink)
    })
  })

  context("#hasLink", function() {
    let links = LinksCollection.create()
    it("should return true", function() {
      const link = new Link("https://medium.com")
      links = links.addLink(link)
      expect(links.hasLink(link)).to.be.true
    })
  })

  context("#get size()", function() {
    let links = LinksCollection.create()
    links = links.addLink(new Link("https://wiki.org", "/nodejs"))
    links = links.addLink(new Link("https://wiki.org", "/php"))
    links = links.addLink(new Link("https://wiki.org", "/perl"))
    it("should return 3", function() {
      expect(links.size).to.equals(3)
    })
  })

  context("#removeLink", function() {
    let links = LinksCollection.create()
    it("should remove the link from the collection", function() {
      const link = new Link("https://wikipedia.org")
      links = links.removeLink(link)
      expect(links.hasLink(link)).to.be.false
    })
  })

  context("#iterator interface", function() {
    let links = LinksCollection.create()
    links = links.addLink(new Link("https://wiki.org", "/nodejs"))
    links = links.addLink(new Link("https://wiki.org", "/php"))
    links = links.addLink(new Link("https://wiki.org", "/perl"))
    it("should return an iterator", function() {
      for (let link of links) {
        expect(link).to.be.an("object")
        expect(link.baseURL).to.be.a("string")
      }
    })
  })
})
