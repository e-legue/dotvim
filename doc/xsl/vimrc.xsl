<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<xsl:template match="/root">
<html>
<head>
  <meta charset="UTF-8"/>
  <title>Vim page</title>
  <style>
.key {font-style:italic} 
  </style>
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.9.2/themes/claro/claro.css"/>
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.9.2/dijit/themes/claro/claro.css"/>
  <script>dojoConfig = {parseOnLoad: true}</script>
  <script src="http://ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js" data-dojo-config="async: true"></script>
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

<xsl:template match="mappings">
  <h2>Mappings</h2>
  <br/>
  <xsl:apply-templates select="map"/>
</xsl:template>

<xsl:template match="plugins">
  <xsl:element name="h2">Bundles</xsl:element>
  <br/>
</xsl:template>

<xsl:template match="hints">
  <xsl:element name="h2">Hints</xsl:element>
  <br/>
</xsl:template>



<xsl:template match="map">
  <div class="map">
    <span class="key"><xsl:value-of select="keys"/></span>
    <span class="desc"><xsl:value-of select="description"/></span>
  </div>
</xsl:template>

</xsl:stylesheet>
