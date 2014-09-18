<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>

  <xsl:template match="/bundles">
    <html>
      <head>
        <title>Installed bundles</title>
      </head>

      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="bundle">
    <xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute><xsl:value-of select="@name"/></xsl:element><br/>
  </xsl:template>
</xsl:stylesheet>
