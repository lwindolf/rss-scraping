<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:date="http://exslt.org/dates-and-times" 
                extension-element-prefixes="date"
                version="1.0">
                
<!--

This XSLT stylesheet can be used to create a feed with items linking
to all current chapters of a given manga hosted at mangakatana.com.
For it to work it you need to pass the URL of the overview page for the
manga you are interested in.


To run it manually:

    curl https://mangakatana.com/manga/the-max-level-hero-has-returned.25329 |\
    xsltproc \-\-html \-\-novalid mangakatana-chapters.xsl -

-->

<xsl:template match="div">
	<xsl:element name="item">
		<xsl:element name="title">
			<xsl:value-of select="a"/>
		</xsl:element>
		<xsl:element name="guid">
			<xsl:value-of select="a/@href"/>
		</xsl:element>
		<xsl:element name="link">
			<xsl:value-of select="a/@href"/>
		</xsl:element>
		<xsl:element name="description">
			<xsl:value-of select="a"/>
		</xsl:element>
		<xsl:element name="dc:date">
			 <!--

				Correct RFC822 formatting would be done as given below, but sadly 
				the date:format-date() EXSLT function is not supported by libxslt 

				<xsl:value-of select="date:format-date(date:add(date:date-time(), concat('PT',count(preceding::div[@class='chapter']),'S')), "EEE, dd MMM yyyy HH:mm:ss zzz')"/>

				Instead we cheat and just put the ISO8601 format produced
				by date:add() and rely on Liferea handling it gracefully
			-->
			<xsl:value-of select="date:add(date:date-time(), concat('PT',count(preceding::div[@class='chapter']),'S'))"/>
		</xsl:element>
	</xsl:element>
</xsl:template>

<xsl:template match="/">
	<rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/">
		<xsl:element name="channel">
			<xsl:element name="title">
				<xsl:value-of select="/html/head/title"/>
			</xsl:element>
			<xsl:element name="description">
				<xsl:value-of select="/html/head/meta[@property='og:description']/@content"/>
			</xsl:element>
			
			<xsl:element name="link">
				<xsl:value-of select="/html/head/meta[@property='og:url']/@content"/>
			</xsl:element>
			
			<xsl:apply-templates select="//div[@class='chapters']//div[@class='chapter']"/>
		</xsl:element>
	</rss>
</xsl:template>

</xsl:stylesheet>

