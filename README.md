# RSS website scraping scripts

This repository serves as a starting point for RSS/Atom feed scraping solutions:

1. Scripts fixing broken feeds
2. Scripts scraping websites without feeds
3. Scripts augmenting feeds without good content

While this repos hosts a few scripts and examples to build upon, it mostly provides links to existing solutions.

**This list focusess on simple (almost) zero-setup solutions!**

## Examples

## 3rd party OSS scrapers

This is a list of simple scripts you can run yourself locally (or in the cloud).

| Tool              | Input | Extraction | Output  | Details                                            |
|-------------------|-------|------------|---------|----------------------------------------------------|
| [sjehuda/html2atom](https://github.com/sjehuda/html2atom) | HTML | XPath | Atom | Python Script |
| [h43z/rssify](https://github.com/h43z/rssify) | HTML | CSS selectors | RSS | Python script |
| [MitchellMcKenna/twitter-rss-google-apps-script](https://github.com/MitchellMcKenna/twitter-rss-google-apps-script) | Twitter | auto | RSS | Google apps hosted script for Twitter API callback |

## Commercial 3rd party scraper services

These are 3rd party services usually provided by companies that offer subscriptions. List is roughly ordered by usefulness and simplicity of the services.

When using free plans consider your privacy!

| Tool              | Input | Extraction | Output | Details                                            |
|-------------------|-------|------------|--------|----------------------------------------------------|
| [rsshub.app](https://rsshub.app) | All social networks | auto | RSS | No sign up. Simple link syntax e.g. `https://rsshub.app/<service>/user/<user name>` |
| [nitter.com](https://nitter.com) | Twitter | auto | RSS | No sign up. Simple link syntax `https://nitter.net/<twitter username>/rss` |
| [feed43.com](https://feed43.com) | Any website | string pattern | RSS | No sign up required. Free for non-commercial use. Allows to specify patterns to extract |
| [fivefilters.org](http://createfeed.fivefilters.org/index.php) | Any website | CSS selectors | RSS | No sign up required. Returns only 5 most recent items per feed |
| [RSS.app](https://rss.app) | All social networks | auto | RSS | Requires sign up. | 
| [fetchrss](http://fetchrss.com/) | Any website | visual assistant | RSS | Requires sign up. 4 feeds are free |
| [Google Search](https://www.labnol.org/internet/rss-feeds-for-google-searches/19944/) | Google Search | API Query | RSS/Atom | Sign up required, 100 requests per day, API key necessary |

