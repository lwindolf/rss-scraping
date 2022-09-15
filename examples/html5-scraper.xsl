<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:content="http://purl.org/rss/1.0/modules/content/"
                version="1.0">
                
<!--

This XSLT stylesheet can be used to extract content from any HTML5 page.

To run it manually:

    xlstproc \-\-html \-\-novalid html5-scraper.xsl webpage.html >feed.rss

-->

<xsl:template match="article">
	<xsl:element name="item">
		<xsl:element name="title">
			<xsl:value-of select="@aria-label"/>
		</xsl:element>
		<xsl:element name="guid">
			<xsl:value-of select="descendant::a/@href"/>
		</xsl:element>
		<xsl:element name="link">
			<xsl:value-of select="descendant::a/@href"/>
		</xsl:element>
		<xsl:element name="content:encoded">
		    <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
    		    <xsl:copy-of select="child::*"/>
		    <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
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
				<xsl:value-of select="/html/head/title"/>
			</xsl:element>
			
			<!-- link is hard as HTML5 <meta> tags cannot be parsed due to missing closing -->
			<xsl:element name="link">FIXME</xsl:element>
			
			<xsl:apply-templates select="//article"/>
		
		</xsl:element>
	</rss>
</xsl:template>

</xsl:stylesheet>
