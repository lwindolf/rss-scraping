<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:content="http://purl.org/rss/1.0/modules/content/"
   version="1.0">

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
		<channel>
	        <title>Spiegel</title>
	        <link>https://spiegel.de</link>
	        <description>Extracted Spiegel News</description>

		<xsl:apply-templates select="//article"/>
		
		</channel>
	</rss>
</xsl:template>

</xsl:stylesheet>
