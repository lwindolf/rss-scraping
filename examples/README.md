## How to use the examples

All examples were written to illustrate content extraction from news website `spiegel.de`.

Preparation:

    curl -L https://spiegel.de >spiegel.html
    
To run the examples:
    
    # Regex extraction
    perl regex-scraper.pl <spiegel.html
    bash regex-scraper.sh <spiegel.html
    
    # XSLT extraction
    xsltproc --html --novalid html5-scraper.xsl spiegel.html 2>/dev/null
