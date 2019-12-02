xsltproc -o vim.xhtml xsl/refcard.xsl vim.xml
xsltproc -o bash.xhtml xsl/refcard.xsl bash.xml
xsltproc -o less.xhtml xsl/refcard.xsl less.xml
xsltproc -o gdb.xhtml xsl/refcard.xsl gdb.xml
# generate bundle list and then xhtml page.
gawk -f bundles.awk < ../.gitmodules > bundles.xml  
xsltproc -o bundles.xhtml xsl/bundles.xsl bundles.xml
