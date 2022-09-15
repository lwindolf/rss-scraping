# RSS website scraping scripts

This repository serves as a starting point for RSS/Atom feed scraping solutions:

1. Scripts fixing broken feeds
2. Scripts scraping websites without feeds
3. Scripts augmenting feeds without good content

While this repos hosts a few scripts and examples to build upon, it mostly provides links to existing solutions.

**This list focusess on simple (almost) zero-setup solutions!**

## Examples

## 3rd party OSS scrapers

| Tool              | Input | Output  | Type | Details                                            |
|-------------------|-------|---------|------|----------------------------------------------------|
| [sjehuda/html2atom](https://github.com/sjehuda/html2atom) | HTML | Atom | Python Script |Allows to specify XPath selectors to extract content |
| [h43z/rssify](https://github.com/h43z/rssify) | HTML | RSS | Python script | Allows to specify CSS selectors to extract content |
| [MitchellMcKenna/twitter-rss-google-apps-script](https://github.com/MitchellMcKenna/twitter-rss-google-apps-script) | Twitter | RSS | Hosted | Google apps hosted script for Twitter API callback |

## Commercial 3rd party scraper services

| Tool              | Input | Output | Details                                            |
|-------------------|-------|--------|----------------------------------------------------|
| [nitter.com](https://nitter.com) | Twitter | RSS | No sign up. Access RSS via `https://nitter.net/<twitter username>/rss` |
| [feed43.com](https://feed43.com) | Any website | RSS | No sign up required. Free for non-commercial use. Allows to specify patterns to extract |
| [fivefilters.org](http://createfeed.fivefilters.org/index.php) | Any website | RSS | No sign up required. Allows to specify CSS selectors. Returns only 5 most recent items per feed |
| [RSS.app](https://rss.app) | All social networks | RSS | Requires sign up | 
| [fetchrss](http://fetchrss.com/) | Any website | RSS | Requires sign up. 4 feeds are free |

