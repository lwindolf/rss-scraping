#!/usr/bin/perl

# This is a very simple website scraper written in Perl5.
#
# It expects HTML to be provided on STDIN
#
# It performs a simple regex based extraction (without any input validation)
# to extract content from new site https://spiegel.de

# print a feed header
print "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n".
	"<rdf:RDF\n".
	"xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"\n".
	"xmlns:content=\"http://purl.org/rss/1.0/modules/content/\"\n".
	"xmlns=\"http://my.netscape.com/rdf/simple/0.9/\">\n".
	"<channel>\n".
	"  <title>Spiegel News</title>\n".
	"  <link>https://www.spiegel.de/</link>\n".
	"  <description>Extracted Spiegel News</description>\n".
	"</channel>\n";

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
# So they are enclosed by a HTML5 article tag. With the item title in an @aria-label property
# and the first <a href=""> is the article link we are interested in.
#
# Note: of course such a HTML5 page is simpler to parse as XML, but this script is to illustrate
# some simple regex based extraction.


my $html = join("", <STDIN>);
while($html =~ /<article\saria-label="([^"]*)".*?>(.*?)<\/article>/msg) {
	my $title = $1;
	my $description = $2;
	$description =~ /<a href="([^"]*)"/ms;
	my $link = $1;
	print "<item>\n";
	print "  <title>$title</title>\n";
	print "  <guid>$link</guid>\n";
	print "  <link>https://www.spiegel.de/$link</link>\n";
	print "  <content:encoded>";
	print "<![CDATA[$description]]>";
	print "</content:encoded>\n";
	print "</item>\n";
}

# print a feed footer
print "</rdf:RDF>\n";
