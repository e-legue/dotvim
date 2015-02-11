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
  <div style="width: 900px; height: 500px">
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

    
    <xsl:element name="div">
      <xsl:attribute name="id">grid<xsl:value-of select="@name"/></xsl:attribute>
    </xsl:element>

    <!-- load Dojo -->
    <script>
      require([
        'dojo/_base/declare', 'dgrid/Grid', 'dgrid/Keyboard', 'dgrid/Selection', 'dojo/domReady!'
        ], function (declare, Grid, Keyboard, Selection) {
        var data = [
            <xsl:apply-templates/>
        ];

        // Create a new constructor by mixing in the components
        var CustomGrid = declare([ Grid, Keyboard, Selection ]);

        // Now, create an instance of our custom grid which
        // have the features we added!
        var grid = new CustomGrid({
            columns: {
                command: 'Command',
                description: 'Action',
            },
            selectionMode: 'single', // for Selection; only select a single row at a time
            cellNavigation: false // for Keyboard; allow only row-level keyboard navigation
            }, 'grid<xsl:value-of select="@name"/>');
        grid.renderArray(data);
      });
    </script>
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
  {command:'<xsl:value-of select="keys"/>', description:'<xsl:value-of select="description"/>'},
</xsl:template>

</xsl:stylesheet>
