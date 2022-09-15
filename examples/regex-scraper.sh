#!/usr/bin/bash

# This is a very simple website scraper written for Bash+sed.
#
# It expects HTML to be provided on STDIN
#
# It performs a simple regex based extraction (without any input validation)
# to extract content from new site https://spiegel.de

# print a feed header
cat <<EOT
<?xml version="1.0" encoding="ISO-8859-1"?>
<rdf:RDF
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
xmlns:content="http://purl.org/rss/1.0/modules/content/"
xmlns="http://my.netscape.com/rdf/simple/0.9/">
<channel>
  <title>Spiegel News</title>
  <link>https://www.spiegel.de/</link>
  <description>Extracted Spiegel News</description>
</channel>
EOT

# In current HTML the snippets we are interested in look like this:
#
# --------- 8< -------------- 8< -------------
# <article aria-label="Sicherheit in Museen: »Stundenlang mit einer Axt draufhauen«" data-sara-article-id="40b542f2-9157-43df-8972-bade815e32ac" class="py-16 lg:px-24 md:px-24 sm:px-16" data-has-linked-author>
# <h2>
# <a href="https://www.spiegel.de/wissenschaft/mensch/wie-sich-deutschlands-museen-besser-gegen-raubueberfaelle-und-andere-attacken-schuetzen-wollen-a-40b542f2-9157-43df-8972-bade815e32ac" target="_self" class="text-black dark:text-shade-lightest block" title="Sicherheit in Museen: »Stundenlang mit einer Axt draufhauen«">
# <span class="block font-sansUI font-bold text-base">
# <span class="inline-flex align-middle leading-none mr-4" data-contains-flags="Spplus-paid">
# <span class="inline-block mr-4 text-primary-base dark:text-dm-primary-base" data-flag-name="Spplus-paid"><svg width="16" height="16"><use xlink:href="#spon-spplus-flag-m"/></svg>
# </span>
# </span><span class="hover:opacity-moderate focus:opacity-moderate relative top-2"><span class="mr-6">Sicherheit in Museen: »Stundenlang mit einer Axt draufhauen«</span>
# <span class="font-sansUI font-normal text-s text-shade-dark dark:text-shade-light whitespace-nowrap">
# Vor 8 Min</span>
# </span>
# </span>
# </a>
# </h2>
# </article>
# --------- 8< -------------- 8< -------------
#
# Note: of course such a HTML5 page is simpler to parse as XML, but this script is to illustrate
# some simple regex based extraction.
#
# Note: due to missing non-greedy matching in sed it is not possible to extract the
# link from the description

# Explanation of sed invocations:
# - 1st one strips all newlines from HTML
# - 2nd one isolates <article> start tag into a single new line
# - 3rd one isolates </article> end tag into a single new line
# - 4th one drops all unused HTML

cat - |\
sed ':a;N;$!ba;s/\n//g' |\
sed 's/<article\saria-label="\([^"]*\)"[^>]*>/\n<item>\n<link>https:\/\/spiegel.de<\/link><title>\1<\/title><content:encoded><![CDATA[/g' |\
sed 's/<\/article/]]><\/content:encoded>\n<\/item>\n/g' |\
sed '/<item>/,/<\/item>/!d'

echo "</rdf:RDF>"
