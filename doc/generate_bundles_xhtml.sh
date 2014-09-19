./bundles.awk < ../.gitmodules  > bundles.xml
xsltproc -o bundles.xhtml xsl/bundles.xsl bundles.xml
