/* eslint-disable linebreak-style */
const Purifier = require("../Purifier")
const cheerio = require("cheerio")

class PitchForkPurifier extends Purifier {
  /**
   *
   * @param {String} html
   * @param {String} url
   */
  constructor(html, url) {
    super(html, url)
  }
  purify() {
    const $ = cheerio.load(this.html)
    this.title =
      $("header>h1")
        .text()
        .trim() ||
      $("hgroup.single-album-tombstone__headings>h1")
        .text()
        .trim() ||
      $("div.track-details h1.title")
        .text()
        .trim() ||
      $("div.fts-header__title-container h1.fts-header__title")
        .text()
        .trim() ||
      $("h1.pitch-detail__article-title.pitch-detail__article-title-levels")
        .text()
        .trim()
    this.image_url =
      $("div.news-visual-header__inner-row img.news-visual-header__img").attr(
        "src"
      ) ||
      $("div.single-album-tombstone__art>img").attr("src") ||
      $("div.artwork>img").attr("src") ||
      $("div.fts-header--visual>img").attr("src") ||
      $("div.pitch-visual-header__graphic>img.pitch-visual-header__img").attr(
        "src"
      )
    this.description = $("div.contents>p")
      .text()
      .substr(0, 500)
  }
}
module.exports = PitchForkPurifier
