/* eslint-disable linebreak-style */
"use strict"

/**
 * The Spider module:
 * This module is responsible for spawning a spider with a seed url, getting new links from a page and adding those links to a links collection.
 * @module src/scraper/spider
 */

const got = require("got")
const cheerio = require("cheerio")
const axios = require("axios").default

const LinksCollection = require("./links-collection")
const Link = require("./link")

const baseUrl = "http://127.0.0.1:" + process.env.PORT

/**
 * @class
 */
class Spider {
  /**
   * Returns a new Spider object with link as parameter.
   * If the links collection of one spider spawned in a url is full,
   * then links collecction field can be added to spawn
   * @param {Link} link - The link object for the site to be traversed
   * @returns {Spider}
   */
  static spawn(link) {
    return new Spider(link)
  }
  /**
   * Collect all links from within the seed url into a links collecton
   * @returns {LinksCollection}
   */
  async getNewLinks() {
    try {
      /**
       * The decompressed HTML string returned by the website
       * @private
       * @type {string}
       */
      this._html = (await got(this.link.resolve())).body
    } catch (err) {
      if (err.error.code === "EAI_AGAIN" || err.error.code === "ENOTFOUND") {
        throw new Error(
          "Spider Error! Couldn't fetch new links! Please check the internet connection."
        )
      }
      throw err
    }

    const $ = cheerio.load(this._html)
    $("a").each((i, e) => {
      if ($(e).attr("href") === undefined) return

      let baseURL = this._link.baseURL
      let path
      if ($(e).attr("href").startsWith("http")) {
        const url = new URL($(e).attr("href"))
        baseURL = url.origin
        path = url.pathname
      } else if ((path = $(e).attr("href")).includes("#")) return
      // Filter out relative URLs

      const newLink = new Link(baseURL, path)
      if (!this._link.matches(newLink))
        this._horizon = this._horizon.addLinks(newLink)
    })
    // eslint-disable-next-line no-undef
    return this._horizon
  }

  /**
   * Getter for the link property
   * @returns {Link} - The link the spider is currently visiting
   */
  get link() {
    return this._link
  }

  /**
   * Getter for the html property
   * @returns {string}
   */
  get html() {
    if (this._html === undefined)
      throw new Error("Spider Error! html property undefined")

    return this._html
  }

  /**
   * Saves or returns html from this._link
   * @private
   */
  async _persistHtml() {
    console.log(this._html.length)

    try {
      const payload = {
        url: this._link.resolve(),
        html: this._html
      }
      const response = await axios.post(
        `${baseUrl}/api/spider/persist`,
        payload
      )
      console.log(response)
    } catch (error) {
      console.error(error.message)
    }
  }

  /**
   * Create a new Spider object
   * @param {Link} link
   * @private
   */
  constructor(link) {
    /**
     * The seed link to which to send the spider
     * @private
     * @type {Link}
     */
    this._link = link
    /**
     * The collection to which the spider adds links encountered in a page
     * @private
     * @type {LinksCollection}
     */
    this._horizon = LinksCollection.create()
  }
}

module.exports = Spider
