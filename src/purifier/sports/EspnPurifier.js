const Purifier = require("../Purifier")
const {cheerio} = require("cheerio")
class EspnPurifier extends Purifier {
  static baseUrl = "https://www.espn.in/";

  /**
   *
   * @param{String} html
   * @param{string} url
   */
  constructor(html,url) {
    super(html,url);
  }
  purify() {
    const $ =cheerio.load(this.html)
    this.title = $(".article-header h1").text();
    this.description = $(".article-body > p")[1].text();
    this.image_url = $(".inline.inline-photo.full figure>picture>source").attr("srcset").split(",")[0];
  }

}
