const Spider = require("../src/scraper/spider")
const YahooSportsPurifier = require("../src/purifier/sports/YahooSportsPurifier")
const Link = require("../src/scraper/link")
const spider = Spider.spawn(
  new Link("https://sports.yahoo.com", "/nfl-notebook-giants-qb-manning-034408005.html")
)
;(async function name() {
  const horizion = await spider.resolveUrl()
  console.log(horizion.readLinks().length)
  spider.getNewLinks()
  const purifier = new YahooSportsPurifier(spider.html, spider.link.resolve())
  purifier.purify()
  purifier.persistPurified()
})()
