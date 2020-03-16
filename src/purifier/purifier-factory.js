"use strict"
const log = require("log-to-file")
const ESPNPurifier = require("./sports/EspnPurifier")
const YahooSportsPurifier = require("./sports/YahooSportsPurifier")
const WikiPurifier = require("./general/WikiPurifier")
const MindBodyGreenPurifier = require("./healthAndBeauty/MindBodyGreenPurifier")
const BeautyTipsPurifier = require("./healthAndBeauty/BeautyTipsPurifier")
const MentalFlossPurifier = require("./healthAndBeauty/MentalFlossPurifier")
const PsychologyTodayPurifier = require("./healthAndBeauty/PshycologyTodayPurifier")
const EconomistsPurifier = require("./economy/EconomistsPurifier")
const GuardianPurifier = require("./economy/TheGuardianPurifier")
const CodingAlphaPurifier = require("./programming/CodingAlphaPurifier")
const HackerNoonPurifier = require("./programming/HackerNoonPurifier")
const CodeWallPurifier = require("./programming/CodeWallPurifier")
const DavidWalshPurifier = require("./programming/DavidWalshPurifier")
const WebDevBlogPurifier = require("./programming/WebDevBlogPurifier")
const MissTouristPurifier = require("./travelAndTourism/MissTouristPurifier")
const TravelAndTourismNowPurifier = require("./travelAndTourism/TravelAndTourismNowPurifier")
const AboveTheHimalayaPurifier = require("./travelAndTourism/AboveTheHimalayaPurifier")
const TreeHuggerPurifier = require("./environment/TreeHuggerPurifier")
const HuffPostPurifier = require("./environment/HuffPostPurifier")
const IAmFoogBlogPurifier = require("./food/IAmFoogBlogPurifier")
const TheGundrukPurifier = require("./food/TheGundrukPurifier")
const PinchOfYumPurifier = require("./food/PinchOfYumPurifier")
const SeriousEatsPurifier = require("./food/SeriousEatsPurifier")
const ShortStoryMePurifier = require("./stories/ShortStoryMePurifier")
const HowStuffWorksPurifier = require("./science/HowStuffWorksPurifier")
const ScienceDailyPurifier = require("./science/ScienceDailyPurifier")
const PopSciPurifier = require("./science/PopSciPurifier")
const LiveSciencePurifier = require("./science/LiveSciencePurifier")
const BloodAndMilkPurifier = require("./women/BloodAndMilkPurifier")
const LithubPurifier = require("./booksAndCulture/LithubPurifier")
const NewYorkerPurifier = require("./booksAndCulture/NewYorkerPurifier")
const TheMillionsPurifier = require("./booksAndCulture/TheMillionsPurifier")
const LoveIsRespectPurifier = require("./relationship/LoveIsRespectPurifier")
const SmithsonianMagazinePurifier = require("./history/SmithsonianMagazine")
const CinemaBlendPurifier = require("./movies/CinemaBlendPurifier")
const TheGeoPoliticsPurifier = require("./politics/TheGeoPoliticsPurifier")
const PhilosophyForLifePurifier = require("./philosophy/PhilosophyForLifePurifier")
const WesternJournalPurifier = require("./journalism/WesternJournalPurifier")
const FashionLadyPurifier = require("./fashion/FashionLadyPurifier")
const HelpWritersBecomeAuthorPurifier = require("./writing/HelpWritersBecomeAuthorPurifier")
const ArsTechnicaPurifier = require("./technology/ArsTechnicaPurifier")
const LittleOldLadyComedy = require("./humor/LittleOldLadyComedy")
const EatRightPurifier = require("./fitnessAndNutrition/EatRightPurifier")
const HealthyChildrenPurifier = require("./baby/HealthyChildrenPurifier")
const BounceBackParentingPurifier = require("./parenthood/BounceBackParentingPurifier")
const PennyHorderPurifier = require("./finance/PennyHorderPurifier")
const PitchForkPurifier = require("./music/PitchForkPurifier")

class PurifierFactory {
  /**
   * Return the right purifier object
   * @param {string} html - The HTML string
   * @param {Link} link - The key to identify the kind of factory
   * @returns {Purifier} - The concrete purifier object
   */
  createPurifier(html, link) {
    if (link.baseURL.includes("espn.in")) return new ESPNPurifier(html, link)
    else if (link.baseURL.includes("sports.yahoo.com"))
      return new YahooSportsPurifier(html, link)
    else if (link.baseURL.includes("wikipedia.org"))
      return new WikiPurifier(html, link)
    else if (link.baseURL.includes("mindbodygreen.com"))
      return new MindBodyGreenPurifier(html, link)
    else if (link.baseURL.includes("beautytipsonline.com"))
      return new BeautyTipsPurifier(html, link)
    else if (link.baseURL.includes("mentalfloss.com"))
      return new MentalFlossPurifier(html, link)
    else if (link.baseURL.includes("psychologytoday.com"))
      return new PsychologyTodayPurifier(html, link)
    else if (link.baseURL.includes("economists.com"))
      return new EconomistsPurifier(html, link)
    else if (link.baseURL.includes("theguardian.com"))
      return new GuardianPurifier(html, link)
    else if (link.baseURL.includes("codingalpha.com"))
      return new CodingAlphaPurifier(html, link)
    else if (link.baseURL.includes("hackernoon.com"))
      return new HackerNoonPurifier(html, link)
    else if (link.baseURL.includes("codewall.co"))
      return new CodeWallPurifier(html, link)
    else if (link.baseURL.includes("davidwalsh.name"))
      return new DavidWalshPurifier(html, link)
    else if (link.baseURL.includes("webdevblog.com"))
      return new WebDevBlogPurifier(html, link)
    else if (link.baseURL.includes("misstourist.com"))
      return new MissTouristPurifier(html, link)
    else if (link.baseURL.includes("travelandtourismnow.blogspot.com"))
      return new TravelAndTourismNowPurifier(html, link)
    else if (link.baseURL.includes("abovethehimalaya.com"))
      return new AboveTheHimalayaPurifier(html, link)
    else if (link.baseURL.includes("treehugger.com"))
      return new TreeHuggerPurifier(html, link)
    else if (link.baseURL.includes("huffpost.com"))
      return new HuffPostPurifier(html, link)
    else if (link.baseURL.includes("iamafoodblog.com"))
      return new IAmFoogBlogPurifier(html, link)
    else if (link.baseURL.includes("thegundruk.com"))
      return new TheGundrukPurifier(html, link)
    else if (link.baseURL.includes("pinchofyum.com"))
      return new PinchOfYumPurifier(html, link)
    else if (link.baseURL.includes("seriouseats.com"))
      return new SeriousEatsPurifier(html, link)
    else if (link.baseURL.includes("short-story.me"))
      return new ShortStoryMePurifier(html, link)
    else if (link.baseURL.includes("howstuffworks.com"))
      return new HowStuffWorksPurifier(html, link)
    else if (link.baseURL.includes("sciencedaily.com"))
      return new ScienceDailyPurifier(html, link)
    else if (link.baseURL.includes("popsci.com"))
      return new PopSciPurifier(html, link)
    else if (link.baseURL.includes("livescience.com"))
      return new LiveSciencePurifier(html, link)
    else if (link.baseURL.includes("bloodandmilk.com"))
      return new BloodAndMilkPurifier(html, link)
    else if (link.baseURL.includes("lithub.com "))
      return new LithubPurifier(html, link)
    else if (link.baseURL.includes("newyorker.com/culture"))
      return new NewYorkerPurifier(html, link)
    else if (link.baseURL.includes("themillions.com"))
      return new TheMillionsPurifier(html, link)
    else if (link.baseURL.includes("loveisrespect.org/blogs"))
      return new LoveIsRespectPurifier(html, link)
    else if (link.baseURL.includes("smithsonianmag.com"))
      return new SmithsonianMagazinePurifier(html, link)
    else if (link.baseURL.includes("cinemablend.com/news"))
      return new CinemaBlendPurifier(html, link)
    else if (link.baseURL.includes("thegeopolitics.com"))
      return new TheGeoPoliticsPurifier(html, link)
    else if (link.baseURL.includes("philosophyforlife.org/blog"))
      return new PhilosophyForLifePurifier(html, link)
    else if (link.baseURL.includes("westernjournal.com"))
      return new WesternJournalPurifier(html, link)
    else if (link.baseURL.includes("fashionlady.in/category/fashion"))
      return new FashionLadyPurifier(html, link)
    else if (link.baseURL.includes("helpingwritersbecomeauthors.com"))
      return new HelpWritersBecomeAuthorPurifier(html, link)
    else if (link.baseURL.includes("arstechnica.com"))
      return new ArsTechnicaPurifier(html, link)
    else if (link.baseURL.includes("littleoldladycomedy.com"))
      return new LittleOldLadyComedy(html, link)
    else if (link.baseURL.includes("eatright.org"))
      return new EatRightPurifier(html, link)
    else if (
      link.baseURL.includes("healthychildren.org/English/ages-stages/baby")
    )
      return new HealthyChildrenPurifier(html, link)
    else if (link.baseURL.includes("bouncebackparenting.com"))
      return new BounceBackParentingPurifier(html, link)
    else if (link.baseURL.includes("thepennyhoarder.com"))
      return new PennyHorderPurifier(html, link)
    else if (link.baseURL.includes("pitchfork.com"))
      return new PitchForkPurifier(html, link)
    else {
      log(link.resolve(), "no_suitable_purifier.log")
      throw new Error(
        "Purifier Factory Error! Could not find the right purifier."
      )
    }
  }

  constructor() {}
}

module.exports = PurifierFactory
