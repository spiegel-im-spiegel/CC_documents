SET DOCFILE=%1

call sdoc %DOCFILE%.sdoc
copy html4\*.html .

echo LaTeX2e �� PDF
pause
call makepdf %DOCFILE%
