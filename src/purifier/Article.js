/**
 * Module to abstract away an article
 * @module src/purifier/Article
 */

class Article {
  /**
   *
   * @param {String} title
   * @param {String} description
   * @param {String} website
   * @param {String} image_url
   * @param {String} link_url
   */
  constructor(title, description, website, image_url, link_url) {
    this.title = title
    this.description = description
    this.website = website
    this.image_url = image_url
    this.link_url = link_url
  }
}

module.exports = Article
