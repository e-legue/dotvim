<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>

<xsl:template match="/root">
<html>
<head>
  <meta charset="UTF-8"/>
  <title>Vim memo</title>
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.10.3/dijit/themes/claro/claro.css"/>
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.10.3/dojox/grid/resources/Grid.css"/>
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.10.3/dojox/grid/resources/nihiloGrid.css"/>

  <script>dojoConfig = {parseOnLoad: true}</script>
  <script>
    var baseUrl = "http://dgrid.io/js/";
    var dojoConfig = {
      parseOnLoad: true,
      has: {
 	"dojo-firebug": true,
        "dojo-debug-messages": true
	},
      packages: [ 
      			{ name: 'dgrid', location: baseUrl + 'dgrid' },
			{ name: 'xstyle', location: baseUrl + 'xstyle' },
			{ name: 'put-selector', location: baseUrl + 'put-selector' }
	 ]
    };
  </script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/dojo/1.10.3/dojo/dojo.js"></script>a
  <script>
    require(["dojo/parser", "dijit/layout/TabContainer", "dijit/layout/ContentPane", "dgrid/Grid", "dojo/domReady!"]);
  </script>
</head>
<body class="claro">
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

<xsl:template match="mapping">
  <h2>Mappings</h2>
  <div style="width: 100%; height: 100%">
    <div data-dojo-type="dijit/layout/TabContainer" style="width: 100%; height: 100%;">
      <xsl:apply-templates select="section"/>
    </div>
  </div>
</xsl:template>


<xsl:template match="section">
  <xsl:element name="div">
    <xsl:attribute name="data-dojo-type">dijit/layout/ContentPane</xsl:attribute>
    <xsl:attribute name="title"><xsl:value-of select="@name"/></xsl:attribute>
    <xsl:attribute name="data-dojo-props">selected:true</xsl:attribute>

    <xsl:value-of select="@name"/>pppppp

    <xsl:element name="div">
      <xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
    </xsl:element>

  </xsl:element>
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
  {Command:'<xsl:value-of select="keys"/>', Description:'<xsl:value-of select="description"/>'},
</xsl:template>

</xsl:stylesheet>
