SET DOCFILE=%1

pushd latex2e
platex %DOCFILE%
jbibtex %DOCFILE%
platex %DOCFILE%
platex %DOCFILE%
dvipdfmx -f ipaembed.map -z9 -o ..\%DOCFILE%.pdf %DOCFILE%.dvi
popd
