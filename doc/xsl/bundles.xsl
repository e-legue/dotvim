<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


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
<xsl:element name="a">
  <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
  <xsl:attribute name="target">_blank</xsl:attribute>
  <xsl:value-of select="@name"/>
  <br/>
</xsl:element>
</xsl:template>


</xsl:stylesheet>
