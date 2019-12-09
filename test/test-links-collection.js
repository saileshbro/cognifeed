const {expect} = require("chai")
const Link = require("../src/scraper/link")
const LinksCollection = require("../src/scraper/links-collection")


describe("LinksCollection", () => {
  context("#create()", () => {
    let links = LinksCollection.create()
    it("should return an object", () => {
      expect(links).to.be.an("object")
    })
    it("should return an object having an array", () => {
      expect(links).to.own.property("_links")
      expect(links._links).to.be.an("array")
    })
  })

  context("#readLinks", () => {
    let links = LinksCollection.create()
    it("should return an array of urls", () => {
      // Test initialization
      const vimAboutLink = new Link("https://vim.org", "/about")
      const nodejsDownloadLink = new Link("https://nodejs.org", "/download")
      links = links.addLink(vimAboutLink)
      links = links.addLink(nodejsDownloadLink)

      // Test body
      expect(links.readLinks()).to.be.an("array")
      expect(links.readLinks())
        .to.deep.equals([
          "https://vim.org/about", 
          "https://nodejs.org/download"
        ])
    })
  })
  
  context("#addLink", () => {
    let links = LinksCollection.create()
    it("should add a new link object to linksCollection", () => {
      links.addLink(new Link("https://wikipedia.org"))._links.forEach(link => {
        expect(link.baseURL).to.be.a("string")
        expect(link.path).to.be.a("string")
      })
    })
  })

  context("#hasLink", () => {
    let links = LinksCollection.create()
    it("should return true", () => {
      const link = new Link("https://medium.com")
      links = links.addLink(link)
      expect(links.hasLink(link)).to.be.true
    })
  })

  context("#removeLink", () => {
    let links = LinksCollection.create()
    it("should remove the link from the collection", () => {
      const link = new Link("https://wikipedia.org")
      links = links.removeLink(link)
      expect(links.hasLink(link)).to.be.false
    })
  })

  context("#iterator interface", () => {
    let links = LinksCollection.create()
    it("should return an iterator", () => {
      links = links.addLink(new Link("https://wiki.org", "/nodejs"))
      links = links.addLink(new Link("https://wiki.org", "/php"))
      links = links.addLink(new Link("https://wiki.org", "/perl"))
      for (let link of links) {
        expect(link).to.be.an("object")
        expect(link.baseURL).to.be.a("string")
      }
    })
  })
})
