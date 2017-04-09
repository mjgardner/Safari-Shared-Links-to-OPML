<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/plist">
    <opml version="2.0">
      <head>
        <title>Converted Safari WebFeedSources.plist</title>
      </head>
      <xsl:apply-templates select="array"/>
    </opml>
  </xsl:template>

  <xsl:template match="array">
    <body>
      <xsl:apply-templates select="dict"/>
    </body>
  </xsl:template>

  <xsl:template match="dict">
    <xsl:element name="outline">
      <xsl:attribute name="type">rss</xsl:attribute>
      <xsl:apply-templates select="key"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="key">
    <xsl:choose>
      <xsl:when test=".='Title'">
        <xsl:attribute name="text">
          <xsl:copy-of select="following-sibling::string[position()=1]"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test=".='FeedURL'">
        <xsl:attribute name="xmlUrl">
          <xsl:copy-of select="following-sibling::string[position()=1]"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test=".='SourceURL'">
        <xsl:attribute name="htmlUrl">
          <xsl:copy-of select="following-sibling::string[position()=1]"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
