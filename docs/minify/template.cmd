@echo off
cd /d %~dp0\..\..

:start
echo.
echo.
echo.
echo Press enter to check JavaScript files.
echo Type "c" to minify CSS files.
echo Type "m" to minify JavaScript files.
echo Type "o" to minify PNG files.
echo Type "p" to check PHP files.
set input=
set /p input=

echo.
echo.
echo.
if /i "%input%" == "c" goto c
if /i "%input%" == "m" goto m
if /i "%input%" == "o" goto o
if /i "%input%" == "p" goto p

%0
goto start

:c
%4
goto start

:m
set NODE_PATH=docs\libraries\UglifyJS
%1
goto start

:o
%2
goto start

:p
%3
goto start