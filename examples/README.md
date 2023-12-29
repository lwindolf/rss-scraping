## How to use the examples

### Generic Examples

Thos examples were written to illustrate content extraction from news website `spiegel.de`.
    
    # Perl regex extraction
    curl -L https://spiegel.de | ./regex-scraper.pl

    # Bash regex extraction
    curl -L https://spiegel.de | ./regex-scraper.sh
    
    # XSLT HTML5 extraction
    curl -L https://spiegel.de | xsltproc --html --novalid html5-scraper.xsl -

All those examples should also work with other websites.

### Advanced 

#### XSLT Manga Chapter Feed

For a more advanced example we solve the use case of checking for new chapters of
a period manga published online. As typical sites usually provide a chapter index
we simple extract the chapter index and convert it to RSS items.

    curl -L https://mangakatana.com/manga/the-eminence-in-shadow.22020 | xsltproc --html --novalid mangakatana-chapters.xsl -

You can use this `managakatana-chapters.xsl` XSLT on any manga overview page of `managakatana.com`.
