const Purifier = require("../Purifier")
const {cheerio} = require("cheerio")
class iamfoodblogPurifier extends Purifier {
  static baseUrl = "https://iamafoodblog.com/";

  /**
   *
   * @param{String} html
   * @param{string} url
   */
  constructor(html,url) {
    super(html,url);
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title = " "
    $(".field-link a > h4").each((index, element)=>{
      this.title = $(element).text()
    })
    
    this.image_url = $(".feed-link a.tall-thumbnail").attr("style");
  }

}
module.exports = iamfoodblogPurifier
