SET DOCFILE=%1

tar cvf %DOCFILE%.tar %DOCFILE%.sdoc cc-license.sdoc SmartDoc.properties somerights2.png %DOCFILE%.xml.rdf rss.xml.xsl
del %DOCFILE%.tar.bz2
bzip2 -z %DOCFILE%.tar
gpg -o %DOCFILE%.tar.bz2.sig -u 0x76F72BE7 -b %DOCFILE%.tar.bz2

gpg -o %DOCFILE%.pdf.sig -u 0x76F72BE7 -b %DOCFILE%.pdf
gpg -o %DOCFILE%.xml.rdf.sig -u 0x76F72BE7 --textmode -b %DOCFILE%.xml.rdf
