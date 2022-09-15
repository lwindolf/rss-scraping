#!/usr/bin/perl

# This is a very simple website scraper written in Perl5.
#
# - it expects HTML to be provided on STDIN
# - it performs a simple regex based extraction (without any input validation!)

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

my $contentfound = 0;
while(<STDIN>) {
	my $line = $_;

	$contentfound = 1 if($line =~ /^<div class="spTopThema/);

	if(1 == $contentfound) {
		if($line =~ /<h3><a href="(.*)">(.*)<\/a><\/h3>/) {
			print "<item>\n";
			print "  <title>$2</title>\n";
			print "  <id>$1</id>\n";
			print "  <link>https://www.spiegel.de/$1</link>\n";
			my $tmp = <STDIN>;
			print "  <content:encoded>";
			print "<![CDATA[${tmp}]]>";
			print "</content:encoded>\n";
			print "</item>\n";
			$contentfound = 0;
		}
	}
}

# print a feed footer
print "</rdf:RDF>\n";
