SET DOCFILE=%1
SET REVISION=%2

tar cvf %DOCFILE%-%REVISION%.tar %DOCFILE%.sdoc %DOCFILE%.sbib cc-license.sdoc SmartDoc.properties somerights2.png %DOCFILE%.xml.rdf rss.xml.xsl
bzip2 -z %DOCFILE%-%REVISION%.tar
rem del %DOCFILE%-%REVISION%.tar
gpg -o %DOCFILE%-%REVISION%.tar.bz2.sig -u 0x76F72BE7 -b %DOCFILE%-%REVISION%.tar.bz2

gpg -o %DOCFILE%.pdf.sig -u 0x76F72BE7 -b %DOCFILE%.pdf
gpg -o %DOCFILE%.xml.rdf.sig -u 0x76F72BE7 --textmode -b %DOCFILE%.xml.rdf
