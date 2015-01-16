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
  <style>
    .key {font-style:italic}
    .dojoxGrid table {margin: 0;}
  </style>
  <script type="text/javascript">dojoConfig = {parseOnLoad: true}</script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/dojo/1.10.3/dojo/dojo.js" data-dojo-config="async: true"></script>a

  <script>
    dojoConfig = {parseOnLoad: true};
    require(["dojo/parser", "dijit/layout/TabContainer", "dijit/layout/ContentPane", "dojo/store/Memory", "dojo/data/ObjectStore", "dojox/grid/DataGrid"]);
    

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
<xsl:comment>
    <div>
      <xsl:element name="table">
        <xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="style">display: none</xsl:attribute>
        <thead>
          <tr>
            <th>Command</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select="map"/>
        </tbody>  
      </xsl:element>

  reference:      http://dojotoolkit.org/reference-guide/1.10/dojox/data/HtmlTableStore.html
  :q

      <xsl:element name="div">
        <xsl:attribute name="data-dojo-type">dojox.data.HtmlTableStore</xsl:attribute>
        <xsl:attribute name="data-dojo-props">tableId:'<xsl:value-of select="@name"/>'</xsl:attribute>
        <xsl:attribute name="data-dojo-id">gridStore<xsl:value-of select="@name"/></xsl:attribute>
      </xsl:element>
      <div style="width: 400px; height: 200px;">
        <xsl:element name="div">
          <xsl:attribute name="id">grid</xsl:attribute>
          <xsl:attribute name="data-dojo-type">dojox.grid.DataGrid</xsl:attribute>
          <xsl:attribute name="data-dojo-props">store:gridStore<xsl:value-of select="@name"/>, structure:'layoutBooks', query:{}, rowsPerPage:40</xsl:attribute>
        </xsl:element>
      </div>

    </div>
</xsl:comment>

  <script>
  require([
            'dojo/dom',
            'dojo/dom-construct'
        ], function (dom, domConstruct) {
  dojo.ready(function(){
  data<xsl:value-of select="@name"/>=[
    <xsl:apply-templates select="map"/>
  ];
  objectStore<xsl:value-of select="@name"/> = new dojo.store.Memory({data:data<xsl:value-of select="@name"/>});
  grid<xsl:value-of select="@name"/> = new dojox.grid.DataGrid({
    store: dojo.data.ObjectStore({objectStore:objectStore<xsl:value-of select="@name"/>}),
    structure: [ 
      { name:"Command", field:"Command", width:"150px"},
      { name:"Description", field:"Description"}
      ]}, "grid<xsl:value-of select="@name"/>");
  grid<xsl:value-of select="@name"/>.startup();
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
  {Command:'<xsl:value-of select="keys"/>', Description:'<xsl:value-of select="description"/>'},
</xsl:template>

</xsl:stylesheet>
