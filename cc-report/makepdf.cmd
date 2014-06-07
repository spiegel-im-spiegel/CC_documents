SET DOCFILE=%1

pushd latex2e
platex %DOCFILE%
rem jbibtex %DOCFILE%
rem platex %DOCFILE%
platex %DOCFILE%
dvipdfmx -z9 -o ..\%DOCFILE%.pdf %DOCFILE%.dvi
popd
