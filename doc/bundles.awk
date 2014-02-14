#!/bin/awk -f
BEGIN { 
  print "<?xml version=\"1.0\"?>";
  print "<?xml-stylesheet type=\"text/xsl\" href=\"bundle.xsl\"?>";
  print "<root>";
  print "  <generation date=\"" strftime("%Y-%m-%d %H:%M:%S") "\" by=\"generate_vim_bundle_xml.sh\"/>";
  print
}
{
  if ( $1 == "[submodule" ) {
    printf "  <submodule ";
  } else if( $1 == "path" ) {
     printf "name=\"" $3 "\" ";
  } else if( $1 == "url" ) {
     print "url=\"" $3 "\"/>" ;
  }
}
END { 
  print "</root>"; 
}

