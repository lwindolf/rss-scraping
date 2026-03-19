# RSS website scraping scripts

This repository serves as a guide on RSS/Atom feed scraping solutions. While this repos hosts a few scripts and examples to build upon, it mostly provides links to existing solutions. 

**This repo does focus on simple (almost) zero-setup solutions!**

## Example scraping scripts

The `examples` folder provides a few scripts that illustrate how to write a scraper in different scripting languages. It does focus on languages that can be run out of the box on all Linux distributions so you can use those scrapers with feed readers that support running scripts as sources like [Liferea](https://github.com/lwindolf/liferea) and [SnowNews](https://github.com/msharov/snownews).

## OSS scraping scripts

This is a list of simple scripts you can run locally. You can use them with any desktop feed reader that can run local commands.

| Tool              | Input | Extraction | Output  | Details                                            |
|-------------------|-------|------------|---------|----------------------------------------------------|
| [sch/Focus](https://git.xmpp-it.net/sch/Focus/src/branch/main/implementations/focus.py) | HTML, JSON, or XML | XPath | Atom | Python Script |
| [h43z/rssify](https://github.com/h43z/rssify) | HTML | CSS selectors | RSS | Python script |
| [MixCloud](https://gist.github.com/HarHarLinks/db487ed0c1ad6c198cb282ff6d2ffe3b) | HTML | auto | RSS | PHP script |

## Commercial scraping solutions

These are 3rd party services usually provided by companies that offer subscriptions. List is roughly ordered by usefulness and simplicity of the services. When using free plans consider your privacy!

| Tool              | Input | Extraction | Output | Sign Up | Details                                            |
|-------------------|-------|------------|--------|---------|----------------------------------------------------|
| [rsshub.app](https://rsshub.app) | Many social networks | auto | RSS | no | Simple link syntax e.g. `https://rsshub.app/<service>/user/<user name>` |
| [fivefilters.org](http://createfeed.fivefilters.org/index.php) | Any website | CSS selectors | RSS | no | Returns only 5 most recent items per feed |
| [RSS.app](https://rss.app) | Many social networks | auto | RSS | yes | | 
| [fetchrss](http://fetchrss.com/) | Any website | visual assistant | RSS | yes | 4 feeds are free |
| [Google Search](https://www.labnol.org/internet/rss-feeds-for-google-searches/19944/) | Google Search | API Query | RSS/Atom | yes | 100 requests per day, API key necessary |
| [byedoom.com](https://byedoom.com) | Twitter/Facebook | auto | RSS | no | Free for now. Refreshed daily |

If you find a service/link broken or missing please create a PR!
