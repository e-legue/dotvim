<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>

  <xsl:include href="mapping.xsl"/>

  <xsl:template match="/root">
    <html>
    <head>
      <meta charset="UTF-8"/>
      <title>Vim memo</title>
      <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.10.3/dijit/themes/claro/claro.css"/>

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
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/dojo/1.10.3/dojo/dojo.js"></script>
      <script>
        require(["dojo/parser", "dijit/layout/TabContainer", "dijit/layout/ContentPane", "dgrid/Grid", "dojo/domReady!"]);
      </script>
      
      <style>
        .dgrid-column-command {
            width: 30em;
        }

        .dgrid {
            height: auto;
        }

        .dgrid .dgrid-scroller {
            position: relative;
            overflow: visible;
        }        

        .dgrid-row-even {
            background: #CCC;
        }
        .dgrid-row-odd {
            background: #FFF;
        }    
      </style>
    </head>
    <body class="claro">
      <xsl:apply-templates/>
    </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
