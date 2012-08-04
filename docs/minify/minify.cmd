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

cscript.exe //E:JScript //NoLogo docs\libraries\jslint-wsh\jslint-wsh.js "eyeOS\extern\apps\eyeCalc\eyeCalc.js"
echo.
cscript.exe //E:JScript //NoLogo docs\libraries\jslint-wsh\jslint-wsh.js "eyeOS\extern\apps\eyeCalendar\js\components\eyeCalendar.js"
echo.
cscript.exe //E:JScript //NoLogo docs\libraries\jslint-wsh\jslint-wsh.js "eyeOS\extern\apps\eyeCatch\eyeCatch.js"
echo.
cscript.exe //E:JScript //NoLogo docs\libraries\jslint-wsh\jslint-wsh.js "eyeOS\extern\apps\eyeDock\eyeDock.js"
echo.
cscript.exe //E:JScript //NoLogo docs\libraries\jslint-wsh\jslint-wsh.js "eyeOS\extern\apps\eyeFTP\js\eyeFTP.js"
echo.
cscript.exe //E:JScript //NoLogo docs\libraries\jslint-wsh\jslint-wsh.js "eyeOS\extern\apps\eyeLogin\themes\default\eyeLogin.js"
echo.
cscript.exe //E:JScript //NoLogo docs\libraries\jslint-wsh\jslint-wsh.js "eyeOS\extern\apps\eyeMedia\js\eyeMedia.js"
echo.
cscript.exe //E:JScript //NoLogo docs\libraries\jslint-wsh\jslint-wsh.js "eyeOS\extern\apps\eyeMp3\js\eyeMp3.js"
echo.
cscript.exe //E:JScript //NoLogo docs\libraries\jslint-wsh\jslint-wsh.js "eyeOS\extern\apps\eyeX\js\eyeX.js"
echo.
cscript.exe //E:JScript //NoLogo docs\libraries\jslint-wsh\jslint-wsh.js "eyeOS\extern\libs\eyeWidgets\BaseWidgets.js"
echo.
goto start

:c
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyePdf\pdf.js\css\viewer.css" -o "eyeOS\extern\apps\eyePdf\pdf.js\css\viewer.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\css\system.css" -o "eyeOS\extern\apps\eyeX\css\system.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\css\system_IE6.css" -o "eyeOS\extern\apps\eyeX\css\system_IE6.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeCalendar\eyeCalendar.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeCalendar\eyeCalendar.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeCatch\default.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeCatch\default.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeCatch\escapa.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeCatch\escapa.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeCatch\ion.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeCatch\ion.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeCatch\mineField.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeCatch\mineField.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeFTP\eyeFTP.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeFTP\eyeFTP.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeHelp\eyeHelp.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeHelp\eyeHelp.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeSheets\print.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeSheets\print.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeSheets\styles.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeSheets\styles.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeShow\eyeShow.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\eyeShow\eyeShow.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\miniApps\miniApps.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\miniApps\miniApps.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\apps\miniCalendar\miniCalendar.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\apps\miniCalendar\miniCalendar.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_IE6.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_IE6.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_IE7.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_IE7.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_IE8.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_IE8.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_IE9.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_IE9.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_chrome.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_chrome.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_firefox.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_firefox.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_khtml.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_khtml.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_opera.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_opera.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_safari.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\eyeOS_safari.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\default\css\tiny_mce\inlinepopup.css" -o "eyeOS\extern\apps\eyeX\themes\default\css\tiny_mce\inlinepopup.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\apps\eyeSheets\styles.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\apps\eyeSheets\styles.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\apps\eyeShow\eyeShow.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\apps\eyeShow\eyeShow.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_IE6.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_IE6.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_IE7.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_IE7.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_IE8.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_IE8.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_IE9.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_IE9.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_chrome.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_chrome.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_firefox.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_firefox.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_khtml.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_khtml.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_opera.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_opera.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_safari.css" -o "eyeOS\extern\apps\eyeX\themes\defaultPlus\css\eyeOS_safari.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\codepress.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\codepress.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\asp.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\asp.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\autoit.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\autoit.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\c.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\c.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\csharp.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\csharp.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\css.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\css.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\eyecode.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\eyecode.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\generic.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\generic.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\html.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\html.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\java.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\java.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\javascript.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\javascript.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\perl.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\perl.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\php.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\php.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\ruby.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\ruby.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\sql.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\sql.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\text.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\text.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\vbscript.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\vbscript.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\codepress\languages\xsl.css" -o "eyeOS\extern\libs\eyeWidgets\codepress\languages\xsl.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advhr\css\advhr.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advhr\css\advhr.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advimage\css\advimage.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advimage\css\advimage.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlink\css\advlink.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlink\css\advlink.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullpage\css\fullpage.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullpage\css\fullpage.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\window.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\window.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\css\media.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\css\media.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\searchreplace\css\searchreplace.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\searchreplace\css\searchreplace.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\spellchecker\css\content.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\spellchecker\css\content.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\style\css\props.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\style\css\props.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\css\cell.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\css\cell.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\css\row.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\css\row.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\css\table.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\css\table.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\template\css\template.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\template\css\template.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\css\attributes.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\css\attributes.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\css\popup.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\css\popup.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\default\content.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\default\content.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\default\dialog.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\default\dialog.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\default\ui.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\default\ui.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\highcontrast\content.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\highcontrast\content.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\highcontrast\dialog.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\highcontrast\dialog.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\highcontrast\ui.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\highcontrast\ui.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\content.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\content.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\dialog.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\dialog.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\ui.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\ui.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\ui_black.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\ui_black.min.css"
"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "docs\libraries\YUI Compressor\build\yuicompressor-2.4.8pre.jar" "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\ui_silver.css" -o "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\ui_silver.min.css"
goto start

:m
set NODE_PATH=docs\libraries\UglifyJS
echo eyeOS\extern\apps\eyeCalc\eyeCalc.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeCalc\eyeCalc.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeCalc\eyeCalc.js"
echo eyeOS\extern\apps\eyeCalendar\js\components\eyeCalendar.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeCalendar\js\components\eyeCalendar.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeCalendar\js\components\eyeCalendar.js"
echo eyeOS\extern\apps\eyeCatch\eyeCatch.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeCatch\eyeCatch.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeCatch\eyeCatch.js"
echo eyeOS\extern\apps\eyeChess\eyeChess.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeChess\eyeChess.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeChess\eyeChess.js"
echo eyeOS\extern\apps\eyeDock\eyeDock.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeDock\eyeDock.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeDock\eyeDock.js"
echo eyeOS\extern\apps\eyeFTP\js\eyeFTP.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeFTP\js\eyeFTP.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeFTP\js\eyeFTP.js"
echo eyeOS\extern\apps\eyeLogin\themes\default\eyeLogin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeLogin\themes\default\eyeLogin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeLogin\themes\default\eyeLogin.js"
echo eyeOS\extern\apps\eyeMedia\js\eyeMedia.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeMedia\js\eyeMedia.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeMedia\js\eyeMedia.js"
echo eyeOS\extern\apps\eyeMp3\js\eyeMp3.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeMp3\js\eyeMp3.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeMp3\js\eyeMp3.js"
echo eyeOS\extern\apps\eyePdf\pdf.js\js\compatibility.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyePdf\pdf.js\js\compatibility.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyePdf\pdf.js\js\compatibility.js"
echo eyeOS\extern\apps\eyePdf\pdf.js\js\pdf.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyePdf\pdf.js\js\pdf.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyePdf\pdf.js\js\pdf.js"
echo eyeOS\extern\apps\eyePdf\pdf.js\js\viewer.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyePdf\pdf.js\js\viewer.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyePdf\pdf.js\js\viewer.js"
echo eyeOS\extern\apps\eyeSheets\spreadsheet.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeSheets\spreadsheet.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeSheets\spreadsheet.js"
echo eyeOS\extern\apps\eyeSheets\translations\en.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeSheets\translations\en.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeSheets\translations\en.js"
echo eyeOS\extern\apps\eyeShow\actions.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeShow\actions.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeShow\actions.js"
echo eyeOS\extern\apps\eyeShow\editor.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeShow\editor.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeShow\editor.js"
echo eyeOS\extern\apps\eyeShow\functions.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeShow\functions.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeShow\functions.js"
echo eyeOS\extern\apps\eyeShow\navigation.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeShow\navigation.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeShow\navigation.js"
echo eyeOS\extern\apps\eyeShow\slimey.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeShow\slimey.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeShow\slimey.js"
echo eyeOS\extern\apps\eyeShow\stack.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeShow\stack.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeShow\stack.js"
echo eyeOS\extern\apps\eyeShow\toolbar.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeShow\toolbar.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeShow\toolbar.js"
echo eyeOS\extern\apps\eyeShow\tools.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeShow\tools.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeShow\tools.js"
echo eyeOS\extern\apps\eyeVideo\flowplayer.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeVideo\flowplayer.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeVideo\flowplayer.js"
echo eyeOS\extern\apps\eyeX\js\eyeX.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\apps\eyeX\js\eyeX.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\apps\eyeX\js\eyeX.js"
echo eyeOS\extern\libs\eyeSound\soundmanager2.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeSound\soundmanager2.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeSound\soundmanager2.js"
echo eyeOS\extern\libs\eyeSound\soundmanager2_debug.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeSound\soundmanager2_debug.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeSound\soundmanager2_debug.js"
echo eyeOS\extern\libs\eyeWidgets\BaseWidgets.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\BaseWidgets.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\BaseWidgets.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\codepress.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\codepress.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\codepress.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\engines\gecko.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\engines\gecko.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\engines\gecko.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\engines\msie.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\engines\msie.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\engines\msie.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\engines\opera.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\engines\opera.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\engines\opera.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\asp.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\asp.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\asp.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\autoit.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\autoit.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\autoit.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\c.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\c.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\c.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\csharp.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\csharp.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\csharp.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\css.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\css.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\css.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\eyecode.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\eyecode.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\eyecode.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\generic.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\generic.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\generic.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\html.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\html.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\html.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\java.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\java.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\java.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\javascript.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\javascript.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\javascript.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\perl.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\perl.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\perl.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\php.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\php.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\php.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\ruby.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\ruby.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\ruby.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\sql.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\sql.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\sql.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\text.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\text.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\text.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\vbscript.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\vbscript.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\vbscript.js"
echo eyeOS\extern\libs\eyeWidgets\codepress\languages\xsl.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\codepress\languages\xsl.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\codepress\languages\xsl.js"
echo eyeOS\extern\libs\eyeWidgets\jscolor\jscolor.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\jscolor\jscolor.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\jscolor\jscolor.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\langs\en.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\langs\en.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\langs\en.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advhr\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advhr\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advhr\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advhr\js\rule.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advhr\js\rule.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advhr\js\rule.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advhr\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advhr\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advhr\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advimage\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advimage\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advimage\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advimage\js\image.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advimage\js\image.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advimage\js\image.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advimage\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advimage\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advimage\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlink\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlink\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlink\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlink\js\advlink.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlink\js\advlink.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlink\js\advlink.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlink\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlink\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlink\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlist\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlist\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\advlist\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autolink\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autolink\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autolink\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autoresize\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autoresize\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autoresize\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autosave\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autosave\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autosave\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autosave\langs\en.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autosave\langs\en.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\autosave\langs\en.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\bbcode\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\bbcode\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\bbcode\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\contextmenu\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\contextmenu\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\contextmenu\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\directionality\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\directionality\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\directionality\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\emotions\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\emotions\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\emotions\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\emotions\js\emotions.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\emotions\js\emotions.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\emotions\js\emotions.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\emotions\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\emotions\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\emotions\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\js\dialog.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\js\dialog.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\js\dialog.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\langs\en.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\langs\en.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\langs\en.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example_dependency\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example_dependency\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\example_dependency\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullpage\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullpage\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullpage\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullpage\js\fullpage.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullpage\js\fullpage.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullpage\js\fullpage.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullpage\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullpage\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullpage\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullscreen\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullscreen\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\fullscreen\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\iespell\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\iespell\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\iespell\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\insertdatetime\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\insertdatetime\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\insertdatetime\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\layer\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\layer\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\layer\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\legacyoutput\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\legacyoutput\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\legacyoutput\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\lists\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\lists\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\lists\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\js\embed.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\js\embed.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\js\embed.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\js\media.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\js\media.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\js\media.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\media\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\nonbreaking\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\nonbreaking\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\nonbreaking\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\noneditable\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\noneditable\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\noneditable\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\pagebreak\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\pagebreak\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\pagebreak\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\js\pastetext.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\js\pastetext.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\js\pastetext.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\js\pasteword.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\js\pasteword.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\js\pasteword.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\paste\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\preview\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\preview\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\preview\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\preview\jscripts\embed.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\preview\jscripts\embed.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\preview\jscripts\embed.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\print\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\print\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\print\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\save\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\save\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\save\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\searchreplace\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\searchreplace\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\searchreplace\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\searchreplace\js\searchreplace.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\searchreplace\js\searchreplace.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\searchreplace\js\searchreplace.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\searchreplace\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\searchreplace\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\searchreplace\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\spellchecker\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\spellchecker\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\spellchecker\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\style\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\style\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\style\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\style\js\props.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\style\js\props.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\style\js\props.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\style\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\style\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\style\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\tabfocus\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\tabfocus\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\tabfocus\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\cell.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\cell.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\cell.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\merge_cells.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\merge_cells.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\merge_cells.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\row.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\row.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\row.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\table.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\table.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\js\table.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\table\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\template\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\template\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\template\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\template\js\template.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\template\js\template.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\template\js\template.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\template\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\template\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\template\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\visualchars\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\visualchars\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\visualchars\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\wordcount\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\wordcount\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\wordcount\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\editor_plugin.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\editor_plugin.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\editor_plugin.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\abbr.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\abbr.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\abbr.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\acronym.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\acronym.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\acronym.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\attributes.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\attributes.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\attributes.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\cite.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\cite.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\cite.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\del.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\del.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\del.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\element_common.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\element_common.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\element_common.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\ins.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\ins.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\js\ins.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\xhtmlxtras\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\editor_template.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\editor_template.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\editor_template.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\about.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\about.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\about.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\anchor.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\anchor.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\anchor.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\charmap.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\charmap.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\charmap.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\color_picker.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\color_picker.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\color_picker.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\image.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\image.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\image.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\link.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\link.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\link.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\source_editor.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\source_editor.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\js\source_editor.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\langs\en.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\langs\en.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\langs\en.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\langs\en_dlg.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\langs\en_dlg.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\langs\en_dlg.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce_jquery.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce_jquery.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce_jquery.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce_popup.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce_popup.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce_popup.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce_prototype.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce_prototype.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\tiny_mce_prototype.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\editable_selects.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\editable_selects.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\editable_selects.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\form_utils.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\form_utils.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\form_utils.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\mctabs.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\mctabs.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\mctabs.js"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\validate.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\validate.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\eyeWidgets\tiny_mce\utils\validate.js"
echo eyeOS\extern\libs\x.js
docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "eyeOS\extern\libs\x.min.js" --reserved-names "$super" --unsafe "eyeOS\extern\libs\x.js"
goto start

:o
echo eyeOS\extern\apps\eyePdf\pdf.js\images\bookmark.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyePdf\pdf.js\images\bookmark.png" -quiet "eyeOS\extern\apps\eyePdf\pdf.js\images\bookmark.png"
echo eyeOS\extern\apps\eyePdf\pdf.js\images\check.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyePdf\pdf.js\images\check.png" -quiet "eyeOS\extern\apps\eyePdf\pdf.js\images\check.png"
echo eyeOS\extern\apps\eyePdf\pdf.js\images\comment.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyePdf\pdf.js\images\comment.png" -quiet "eyeOS\extern\apps\eyePdf\pdf.js\images\comment.png"
echo eyeOS\extern\apps\eyePdf\pdf.js\images\document-print.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyePdf\pdf.js\images\document-print.png" -quiet "eyeOS\extern\apps\eyePdf\pdf.js\images\document-print.png"
echo eyeOS\extern\apps\eyePdf\pdf.js\images\download.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyePdf\pdf.js\images\download.png" -quiet "eyeOS\extern\apps\eyePdf\pdf.js\images\download.png"
echo eyeOS\extern\apps\eyePdf\pdf.js\images\go-down.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyePdf\pdf.js\images\go-down.png" -quiet "eyeOS\extern\apps\eyePdf\pdf.js\images\go-down.png"
echo eyeOS\extern\apps\eyePdf\pdf.js\images\go-up.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyePdf\pdf.js\images\go-up.png" -quiet "eyeOS\extern\apps\eyePdf\pdf.js\images\go-up.png"
echo eyeOS\extern\apps\eyePdf\pdf.js\images\nav-outline.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyePdf\pdf.js\images\nav-outline.png" -quiet "eyeOS\extern\apps\eyePdf\pdf.js\images\nav-outline.png"
echo eyeOS\extern\apps\eyePdf\pdf.js\images\nav-thumbs.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyePdf\pdf.js\images\nav-thumbs.png" -quiet "eyeOS\extern\apps\eyePdf\pdf.js\images\nav-thumbs.png"
echo eyeOS\extern\apps\eyePdf\pdf.js\images\zoom-in.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyePdf\pdf.js\images\zoom-in.png" -quiet "eyeOS\extern\apps\eyePdf\pdf.js\images\zoom-in.png"
echo eyeOS\extern\apps\eyePdf\pdf.js\images\zoom-out.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyePdf\pdf.js\images\zoom-out.png" -quiet "eyeOS\extern\apps\eyePdf\pdf.js\images\zoom-out.png"
echo eyeOS\extern\apps\eyeShow\logo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeShow\logo.png" -quiet "eyeOS\extern\apps\eyeShow\logo.png"
echo eyeOS\extern\apps\eyeX\gfx\logo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\gfx\logo.png" -quiet "eyeOS\extern\apps\eyeX\gfx\logo.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\12x12\close.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\12x12\close.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\12x12\close.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\12x12\delete.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\12x12\delete.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\12x12\delete.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\12x12\link.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\12x12\link.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\12x12\link.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\back.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\back.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\back.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\calendar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\calendar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\calendar.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\copy.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\copy.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\copy.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\delete.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\delete.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\delete.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\deleteRound.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\deleteRound.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\deleteRound.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\document.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\document.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\document.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\download.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\download.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\download.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\downzip.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\downzip.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\downzip.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\edit.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\edit.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\edit.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\exec.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\exec.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\exec.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\eyeHelp.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\eyeHelp.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\eyeHelp.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\file.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\file.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\file.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\folder.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\folder.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\folder.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\folder_open.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\folder_open.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\folder_open.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\forward.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\forward.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\forward.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\groups.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\groups.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\groups.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\inbox.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\inbox.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\inbox.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\launcher.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\launcher.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\launcher.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\link.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\link.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\link.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\list-add.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\list-add.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\list-add.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\message.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\message.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\message.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\message_trash.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\message_trash.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\message_trash.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\minus.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\minus.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\minus.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\music.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\music.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\music.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\new.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\new.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\new.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\newfolder.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\newfolder.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\newfolder.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\paste.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\paste.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\paste.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\photo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\photo.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\photo.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\plus.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\plus.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\plus.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\preferences.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\preferences.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\preferences.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\properties.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\properties.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\properties.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\read.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\read.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\read.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\refresh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\refresh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\refresh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\rename.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\rename.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\rename.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\restore.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\restore.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\restore.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\save.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\save.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\save.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\saveas.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\saveas.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\saveas.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\search.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\search.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\search.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\selector.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\selector.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\selector.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\sent.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\sent.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\sent.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\spreadsheet.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\spreadsheet.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\spreadsheet.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\tar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\tar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\tar.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\unread.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\unread.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\unread.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\upload.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\upload.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\upload.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\video.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\video.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\video.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\16x16\wallpaper.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\wallpaper.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\16x16\wallpaper.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\1leftarrow.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\1leftarrow.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\1leftarrow.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\1rightarrow.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\1rightarrow.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\1rightarrow.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\2rightarrow.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\2rightarrow.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\2rightarrow.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\RSS.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\RSS.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\RSS.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\accesories.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\accesories.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\accesories.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\addcal.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\addcal.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\addcal.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\addcontact.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\addcontact.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\addcontact.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\addrss.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\addrss.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\addrss.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\agt_print.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\agt_print.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\agt_print.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\agt_update_critical.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\agt_update_critical.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\agt_update_critical.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\agt_update_misc.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\agt_update_misc.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\agt_update_misc.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\apps.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\apps.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\apps.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\archive-extract.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\archive-extract.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\archive-extract.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\archive-insert.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\archive-insert.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\archive-insert.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark_add.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark_add.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark_add.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark_folder.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark_folder.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark_folder.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark_toolbar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark_toolbar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmark_toolbar.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmarks_list_add.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmarks_list_add.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\bookmarks_list_add.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\button_cancel.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\button_cancel.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\button_cancel.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\clock.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\clock.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\clock.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\connect.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\connect.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\connect.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\create.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\create.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\create.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\cyclepower.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\cyclepower.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\cyclepower.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\day.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\day.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\day.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\default.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\default.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\default.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\delete.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\delete.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\delete.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\deletecolumn.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\deletecolumn.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\deletecolumn.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\deletecontact.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\deletecontact.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\deletecontact.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\deleterow.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\deleterow.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\deleterow.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\delrss.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\delrss.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\delrss.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\desktop.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\desktop.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\desktop.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\desktop_widgets.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\desktop_widgets.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\desktop_widgets.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\details.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\details.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\details.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\development.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\development.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\development.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\disconnectall.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\disconnectall.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\disconnectall.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\down.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\down.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\down.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\download.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\download.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\download.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit-undo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit-undo.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit-undo.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit_add.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit_add.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit_add.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit_remove.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit_remove.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\edit_remove.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\editcal.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\editcal.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\editcal.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\editclear.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\editclear.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\editclear.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\editcontact.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\editcontact.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\editcontact.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\emptyTrash.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\emptyTrash.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\emptyTrash.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\exec.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\exec.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\exec.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\exit.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\exit.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\exit.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\exportcontact.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\exportcontact.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\exportcontact.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeAddressBook.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeAddressBook.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeAddressBook.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeBoard.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeBoard.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeBoard.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeCalc.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeCalc.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeCalc.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeCalendar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeCalendar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeCalendar.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeCatch.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeCatch.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeCatch.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeChess.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeChess.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeChess.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeContacts.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeContacts.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeContacts.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeDocs.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeDocs.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeDocs.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeFTP.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeFTP.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeFTP.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeFeeds.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeFeeds.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeFeeds.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeFiles.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeFiles.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeFiles.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeGroups.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeGroups.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeGroups.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeHelp.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeHelp.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeHelp.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeImages.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeImages.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeImages.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeMail.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeMail.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeMail.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeMedia.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeMedia.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeMedia.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeMessages.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeMessages.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeMessages.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeNav.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeNav.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeNav.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeNotes.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeNotes.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeNotes.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyePresentation.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyePresentation.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyePresentation.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeProcess.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeProcess.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeProcess.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeSheets.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeSheets.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeSheets.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslide.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslide.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslide.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslided.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslided.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslided.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslideh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslideh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslideh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslidex.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslidex.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\addslidex.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bold.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bold.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bold.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\boldd.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\boldd.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\boldd.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\boldh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\boldh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\boldh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\boldx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\boldx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\boldx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFront.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFront.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFront.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFrontd.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFrontd.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFrontd.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFronth.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFronth.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFronth.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFrontx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFrontx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\bringToFrontx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\clipart.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\clipart.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\clipart.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\color.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\color.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\color.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\colord.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\colord.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\colord.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\colorh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\colorh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\colorh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\colorx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\colorx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\colorx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delete.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delete.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delete.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\deleted.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\deleted.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\deleted.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\deleteh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\deleteh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\deleteh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\deletex.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\deletex.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\deletex.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslide.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslide.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslide.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslided.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslided.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslided.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslideh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslideh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslideh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslidex.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslidex.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\delslidex.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\empty.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\empty.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\empty.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\emptyd.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\emptyd.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\emptyd.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\emptyh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\emptyh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\emptyh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\emptyx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\emptyx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\emptyx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImage.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImage.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImage.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImaged.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImaged.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImaged.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImageh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImageh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImageh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImagex.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImagex.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertImagex.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOList.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOList.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOList.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOListd.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOListd.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOListd.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOListh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOListh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOListh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOListx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOListx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertOListx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertText.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertText.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertText.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertTextd.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertTextd.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertTextd.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertTexth.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertTexth.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertTexth.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertTextx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertTextx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertTextx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUList.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUList.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUList.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUListd.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUListd.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUListd.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUListh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUListh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUListh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUListx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUListx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\insertUListx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italic.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italic.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italic.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italicd.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italicd.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italicd.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italich.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italich.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italich.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italicx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italicx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\italicx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\myimages.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\myimages.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\myimages.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\newslide.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\newslide.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\newslide.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\preview.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\preview.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\preview.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\previewd.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\previewd.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\previewd.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\previewh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\previewh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\previewh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\previewx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\previewx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\previewx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redo.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redo.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redod.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redod.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redod.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redoh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redoh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redoh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redox.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redox.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\redox.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sample.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sample.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sample.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\save.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\save.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\save.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\saved.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\saved.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\saved.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\saveh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\saveh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\saveh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\savex.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\savex.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\savex.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBack.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBack.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBack.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBackd.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBackd.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBackd.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBackh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBackh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBackh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBackx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBackx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sendToBackx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sep.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sep.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\sep.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedown.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedown.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedown.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedownd.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedownd.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedownd.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedownh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedownh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedownh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedownx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedownx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slidedownx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideshow.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideshow.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideshow.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideup.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideup.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideup.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideupd.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideupd.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideupd.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideuph.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideuph.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideuph.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideupx.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideupx.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\slideupx.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underline.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underline.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underline.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underlined.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underlined.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underlined.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underlineh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underlineh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underlineh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underlinex.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underlinex.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\underlinex.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undo.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undo.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undod.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undod.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undod.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undoh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undoh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undoh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undox.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undox.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\undox.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSource.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSource.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSource.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSourced.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSourced.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSourced.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSourceh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSourceh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSourceh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSourcex.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSourcex.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow\viewSourcex.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeShow.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeString.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeString.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeString.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeTetravex.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeTetravex.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\eyeTetravex.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\favorites.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\favorites.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\favorites.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\favorites_p.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\favorites_p.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\favorites_p.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fileexport.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fileexport.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fileexport.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fileimport.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fileimport.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fileimport.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filenew.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filenew.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filenew.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fileopen.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fileopen.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fileopen.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filesave.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filesave.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filesave.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filesaveas.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filesaveas.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filesaveas.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_clear.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_clear.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_clear.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_delete.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_delete.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_delete.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_revert.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_revert.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_revert.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_use.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_use.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filter_use.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filters.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filters.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\filters.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\folder_up.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\folder_up.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\folder_up.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fullScreen.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fullScreen.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\fullScreen.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\games.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\games.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\games.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\go_logo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\go_logo.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\go_logo.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\groups.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\groups.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\groups.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\help.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\help.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\help.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\history.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\history.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\history.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\home.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\home.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\home.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\homeFolder.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\homeFolder.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\homeFolder.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\image.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\image.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\image.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\importcontact.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\importcontact.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\importcontact.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\info.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\info.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\info.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\installapps.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\installapps.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\installapps.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\kalarm.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\kalarm.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\kalarm.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\launch.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\launch.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\launch.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\lin_agt_wrench.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\lin_agt_wrench.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\lin_agt_wrench.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-attach.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-attach.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-attach.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-forward.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-forward.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-forward.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-receive.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-receive.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-receive.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-reply-sender.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-reply-sender.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\mail-reply-sender.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_delete.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_delete.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_delete.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_new.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_new.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_new.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_open.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_open.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_open.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_refresh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_refresh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_refresh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_restore.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_restore.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\message_restore.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniActions.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniActions.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniActions.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniCalendar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniCalendar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniCalendar.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniHome.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniHome.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniHome.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniMessages.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniMessages.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\miniMessages.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\month.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\month.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\month.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\multimedia.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\multimedia.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\multimedia.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\network.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\network.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\network.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\new.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\new.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\new.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\newcolumn.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\newcolumn.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\newcolumn.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\newfolder.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\newfolder.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\newfolder.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\newrow.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\newrow.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\newrow.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\next.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\next.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\next.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\office.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\office.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\office.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\paste.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\paste.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\paste.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\places.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\places.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\places.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\poweroff.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\poweroff.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\poweroff.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\poweron.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\poweron.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\poweron.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\preferences.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\preferences.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\preferences.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\previous.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\previous.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\previous.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\public.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\public.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\public.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\rating.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\rating.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\rating.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\rating_g.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\rating_g.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\rating_g.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\real.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\real.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\real.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\refresh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\refresh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\refresh.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\rename.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\rename.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\rename.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\search.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\search.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\search.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\sendmessage.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\sendmessage.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\sendmessage.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\settings.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\settings.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\settings.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\show_desktop.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\show_desktop.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\show_desktop.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\status.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\status.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\status.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\system.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\system.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\system.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\today.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\today.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\today.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\top.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\top.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\top.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\trash.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\trash.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\trash.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\trash_full.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\trash_full.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\trash_full.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\unfilter.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\unfilter.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\unfilter.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\up.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\up.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\up.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\upload.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\upload.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\upload.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\users.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\users.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\users.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\view-restore.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\view-restore.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\view-restore.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\week.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\week.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\week.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\window-duplicate.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\window-duplicate.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\window-duplicate.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\22x22\work.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\work.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\22x22\work.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\RSS.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\RSS.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\RSS.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\aboutme.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\aboutme.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\aboutme.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\admingeneral.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\admingeneral.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\admingeneral.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\desktop.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\desktop.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\desktop.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\e.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\e.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\e.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\editClean.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\editClean.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\editClean.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\exec.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\exec.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\exec.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeAddressBook.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeAddressBook.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeAddressBook.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeBoard.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeBoard.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeBoard.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeCalc.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeCalc.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeCalc.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeCalendar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeCalendar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeCalendar.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeChess.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeChess.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeChess.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeConsole.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeConsole.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeConsole.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeContacts.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeContacts.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeContacts.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeDocs.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeDocs.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeDocs.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeFTP.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeFTP.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeFTP.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeFiles.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeFiles.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeFiles.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeGroups.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeGroups.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeGroups.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeHelp.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeHelp.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeHelp.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeImages.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeImages.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeImages.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeMail.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeMail.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeMail.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeMedia.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeMedia.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeMedia.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeMessages.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeMessages.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeMessages.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeNav.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeNav.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeNav.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeNotes.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeNotes.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeNotes.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyePresentation.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyePresentation.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyePresentation.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeProcess.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeProcess.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeProcess.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeSheets.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeSheets.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeSheets.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeString.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeString.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeString.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeTetravex.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeTetravex.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\eyeTetravex.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\file.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\file.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\file.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\ace.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\ace.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\ace.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\document.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\document.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\document.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\documentOffice.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\documentOffice.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\documentOffice.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\eyeProject.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\eyeProject.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\eyeProject.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\folder.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\folder.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\folder.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\home.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\home.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\home.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\image.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\image.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\image.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\link.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\link.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\link.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\pdf.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\pdf.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\pdf.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\presentation.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\presentation.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\presentation.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\presentationOffice.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\presentationOffice.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\presentationOffice.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\rar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\rar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\rar.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\sheetOffice.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\sheetOffice.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\sheetOffice.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\sound.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\sound.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\sound.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_cs.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_cs.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_cs.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_css.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_css.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_css.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_html.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_html.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_html.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_java.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_java.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_java.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_js.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_js.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_js.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_php.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_php.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_php.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_pl.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_pl.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_pl.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_rb.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_rb.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_rb.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_sql.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_sql.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_sql.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_vbs.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_vbs.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_vbs.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_xls.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_xls.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\source_xls.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\tar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\tar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\tar.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\text.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\text.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\text.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\unknown.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\unknown.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\unknown.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\vcard.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\vcard.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\vcard.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\video.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\video.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\video.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\zip.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\zip.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\filetypes\zip.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\folder.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\folder.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\folder.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\folder_up.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\folder_up.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\folder_up.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\groups.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\groups.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\groups.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\home.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\home.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\home.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\i.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\i.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\i.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\kollision.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\kollision.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\kollision.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\language.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\language.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\language.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\logo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\logo.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\logo.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniActions.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniActions.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniActions.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniCalendar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniCalendar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniCalendar.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniHome.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniHome.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniHome.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniMessages.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniMessages.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\miniMessages.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\password.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\password.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\password.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\public.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\public.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\public.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\q.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\q.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\q.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\rename.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\rename.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\rename.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\repositories.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\repositories.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\repositories.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\software.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\software.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\software.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\theme.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\theme.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\theme.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\trash.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\trash.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\trash.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\trash_full.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\trash_full.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\trash_full.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\upload.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\upload.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\upload.png"
echo eyeOS\extern\apps\eyeX\themes\default\icons\48x48\x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\x.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\icons\48x48\x.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apple-touch-icons\114x114.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apple-touch-icons\114x114.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apple-touch-icons\114x114.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apple-touch-icons\57x57.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apple-touch-icons\57x57.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apple-touch-icons\57x57.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apple-touch-icons\72x72.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apple-touch-icons\72x72.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apple-touch-icons\72x72.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeAddressBook\nophoto.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeAddressBook\nophoto.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeAddressBook\nophoto.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\deleteNote.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\deleteNote.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\deleteNote.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\dotted.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\dotted.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\dotted.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\widget\plus.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\widget\plus.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\widget\plus.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\widget\selected.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\widget\selected.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeCalendar\widget\selected.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\0.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\0.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\0.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\1.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\1.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\1.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\10.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\10.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\10.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\11.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\11.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\11.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\12.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\12.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\12.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\13.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\13.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\13.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\14.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\14.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\14.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\2.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\2.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\2.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\3.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\3.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\3.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\4.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\4.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\4.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\5.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\5.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\5.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\6.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\6.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\6.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\9.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\9.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\9.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\0.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\0.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\0.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\1.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\1.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\1.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\10.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\10.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\10.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\11.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\11.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\11.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\12.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\12.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\12.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\13.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\13.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\13.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\14.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\14.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\14.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\2.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\2.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\2.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\3.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\3.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\3.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\4.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\4.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\4.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\5.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\5.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\5.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\6.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\6.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\6.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\9.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\9.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeChess\IE\9.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeControl\norepeat.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeControl\norepeat.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeControl\norepeat.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeControl\repeat.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeControl\repeat.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeControl\repeat.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\Icon_hover_bottom.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\Icon_hover_bottom.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\Icon_hover_bottom.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\bottom.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\bottom.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\bottom.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\bottom_menu_line.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\bottom_menu_line.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\bottom_menu_line.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\clock.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\clock.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\clock.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\left.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\left.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\left.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\right.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\right.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\right.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\select.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\select.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\select.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\task.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\task.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\task.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\taskHover.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\taskHover.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\taskHover.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\top.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\top.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\top.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\top_menu.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\top_menu.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeDock\backgrounds\top_menu.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\err.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\err.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\err.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\info.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\info.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\info.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\norm.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\norm.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\norm.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\succ.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\succ.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\succ.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\warn.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\warn.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\10x10\warn.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\managehosts.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\managehosts.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\managehosts.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\minihost.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\minihost.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\minihost.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\addhost.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\addhost.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\addhost.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\connect.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\connect.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\connect.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\delete.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\delete.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\delete.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\deletehost.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\deletehost.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\deletehost.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\disconnect.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\disconnect.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\disconnect.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\edithost.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\edithost.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\edithost.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\help.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\help.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\help.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\host.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\host.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\host.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\loadhost.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\loadhost.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\loadhost.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\managehosts.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\managehosts.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFTP\toolbar\managehosts.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\addfeed_menu.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\addfeed_menu.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\addfeed_menu.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\delfeedfolder_menu.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\delfeedfolder_menu.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\delfeedfolder_menu.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\editfeedfolder_menu.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\editfeedfolder_menu.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\editfeedfolder_menu.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\item_read.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\item_read.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\item_read.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\item_unread.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\item_unread.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\item_unread.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\search.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\search.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\16x16\search.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\editfeed.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\editfeed.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\editfeed.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\editfolder.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\editfolder.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\editfolder.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\export.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\export.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\export.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\import.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\import.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\import.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\settings.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\settings.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\20x20\settings.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\settings.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\settings.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\settings.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\addfeed.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\addfeed.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\addfeed.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\delfeed.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\delfeed.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\delfeed.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\delfeedfolder.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\delfeedfolder.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\delfeedfolder.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\editfeedfolder.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\editfeedfolder.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeFeeds\toolbar\editfeedfolder.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\bg_login.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\bg_login.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\bg_login.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\bg_newuser.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\bg_newuser.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\bg_newuser.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\bg_newuser_ie.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\bg_newuser_ie.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\bg_newuser_ie.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\box.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\box.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\box.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\box_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\box_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\box_x.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\createaccount.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\createaccount.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\createaccount.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\enter.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\enter.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\enter.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\eyeoslogo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\eyeoslogo.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\eyeoslogo.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\line.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\line.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\line.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\line_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\line_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\line_x.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\new.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\new.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\new.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\new_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\new_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyeLogin\new_x.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\aclarar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\aclarar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\aclarar.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\blancInegre.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\blancInegre.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\blancInegre.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\color-picker-black.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\color-picker-black.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\color-picker-black.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\color-picker-white.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\color-picker-white.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\color-picker-white.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\desenfocar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\desenfocar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\desenfocar.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\enfosquir.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\enfosquir.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\enfosquir.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\invertir.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\invertir.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\invertir.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\llapis.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\llapis.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\llapis.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\relleu.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\relleu.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\relleu.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\sepia.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\sepia.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\sepia.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\suavitzar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\suavitzar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\FX\suavitzar.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\Toolbar\color-preferences.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\Toolbar\color-preferences.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\Toolbar\color-preferences.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\Toolbar\object-rotate-left.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\Toolbar\object-rotate-left.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\Toolbar\object-rotate-left.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\Toolbar\object-rotate-right.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\Toolbar\object-rotate-right.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\eyePictures\Toolbar\object-rotate-right.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniActions\bg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniActions\bg.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniActions\bg.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniActions\button.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniActions\button.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniActions\button.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniCalendar\miniCalendar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniCalendar\miniCalendar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniCalendar\miniCalendar.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniHome\minihome.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniHome\minihome.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniHome\minihome.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniMessages\minimessages.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniMessages\minimessages.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniMessages\minimessages.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniToDo\bg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniToDo\bg.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\apps\miniApps\miniToDo\bg.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\desktop\close.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\desktop\close.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\desktop\close.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\desktop\iconhover.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\desktop\iconhover.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\desktop\iconhover.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\desktop\left.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\desktop\left.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\desktop\left.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\desktop\loadingcursor\loading.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\desktop\loadingcursor\loading.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\desktop\loadingcursor\loading.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\desktop\miniwidgetbg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\desktop\miniwidgetbg.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\desktop\miniwidgetbg.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\desktop\open.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\desktop\open.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\desktop\open.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\desktop\refresh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\desktop\refresh.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\desktop\refresh.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\desktop\right.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\desktop\right.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\desktop\right.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\doowee\doowee.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\doowee\doowee.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\doowee\doowee.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\doowee\message.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\doowee\message.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\doowee\message.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\minimized\arrow_l.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\minimized\arrow_l.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\minimized\arrow_l.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\minimized\arrow_r.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\minimized\arrow_r.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\minimized\arrow_r.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\minimized\bar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\minimized\bar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\minimized\bar.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_bg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_bg.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_bg.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_off.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_off.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_off.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_off_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_off_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_off_x.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_on.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_on.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_on.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_on_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_on_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\minimized\minbar_on_x.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\arrow.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\arrow.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\arrow.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\arrow_left.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\arrow_left.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\arrow_left.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\arrow_right.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\arrow_right.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\arrow_right.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_bottom_center.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_bottom_center.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_bottom_center.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_bottom_left.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_bottom_left.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_bottom_left.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_bottom_right.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_bottom_right.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_bottom_right.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_center_center.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_center_center.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_center_center.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_center_left.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_center_left.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_center_left.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_center_right.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_center_right.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_center_right.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sortable.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sortable.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sortable.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sup_center.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sup_center.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sup_center.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sup_left.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sup_left.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sup_left.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sup_right.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sup_right.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\bg_sup_right.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\blank.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\blank.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\blank.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\boxbg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\boxbg.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\boxbg.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\buttonbg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\buttonbg.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\buttonbg.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\buttonbg_press.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\buttonbg_press.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\buttonbg_press.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\calendar_rowLeft.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\calendar_rowLeft.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\calendar_rowLeft.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\calendar_rowRight.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\calendar_rowRight.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\calendar_rowRight.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\cross.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\cross.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\cross.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\downsimple.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\downsimple.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\downsimple.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\handle.horizontal.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\handle.horizontal.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\handle.horizontal.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\handle.vertical.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\handle.vertical.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\handle.vertical.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\jscolor-bg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\jscolor-bg.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\jscolor-bg.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\tabbg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\tabbg.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\tabbg.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\widgets\upsimple.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\widgets\upsimple.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\widgets\upsimple.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-groups.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-groups.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-groups.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-home.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-home.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-home.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-real.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-real.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-real.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-trash.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-trash.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-trash.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-users.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-users.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg-users.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\bg_top.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg_top.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg_top.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\bg_top_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg_top_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\bg_top_x.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\border_r.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\border_r.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\border_r.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\close.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\close.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\close.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\close_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\close_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\close_x.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\dimple.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\dimple.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\dimple.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\eyefilesbg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\eyefilesbg.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\eyefilesbg.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\hov.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\hov.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\hov.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\max.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\max.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\max.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\max_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\max_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\max_x.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\min.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\min.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\min.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\min_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\min_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\min_x.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\pathBM.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathBM.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathBM.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\pathDiv.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathDiv.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathDiv.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\pathcenter.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathcenter.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathcenter.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\pathgo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathgo.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathgo.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\pathleft.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathleft.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathleft.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\pathsearch.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathsearch.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\pathsearch.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\resizebutton.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\resizebutton.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\resizebutton.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\shadow.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\shadow.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\shadow.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\slider_ew.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\slider_ew.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\slider_ew.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\slider_ns.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\slider_ns.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\slider_ns.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\tabbgTop.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\tabbgTop.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\tabbgTop.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\title_bg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\title_bg.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\title_bg.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\toolbar.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\toolbar.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\toolbar.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleLeft_a.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleLeft_a.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleLeft_a.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleLeft_i.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleLeft_i.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleLeft_i.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleRight_a.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleRight_a.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleRight_a.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleRight_i.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleRight_i.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\topTitleRight_i.png"
echo eyeOS\extern\apps\eyeX\themes\default\images\windows\top_menu_line.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\images\windows\top_menu_line.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\images\windows\top_menu_line.png"
echo eyeOS\extern\apps\eyeX\themes\default\screenshot.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\default\screenshot.png" -quiet "eyeOS\extern\apps\eyeX\themes\default\screenshot.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\icons\22x22\go_logo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\icons\22x22\go_logo.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\icons\22x22\go_logo.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\bottom.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\bottom.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\bottom.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\bottom_menu_line.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\bottom_menu_line.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\bottom_menu_line.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\left.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\left.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\left.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\right.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\right.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\right.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\select.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\select.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\select.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\task.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\task.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\task.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\taskHover.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\taskHover.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\taskHover.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\top.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\top.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\top.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\top_menu.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\top_menu.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeDock\backgrounds\top_menu.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\bg_login.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\bg_login.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\bg_login.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\bg_newuser.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\bg_newuser.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\bg_newuser.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\box.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\box.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\box.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\box_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\box_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\box_x.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\enter.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\enter.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\enter.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\eyeoslogo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\eyeoslogo.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\eyeoslogo.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\line_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\line_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\line_x.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\new.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\new.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\new.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\new_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\new_x.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\eyeLogin\new_x.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\miniApps\miniActions\bg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\miniApps\miniActions\bg.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\apps\miniApps\miniActions\bg.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\doowee\doowee.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\doowee\doowee.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\doowee\doowee.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\doowee\message.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\doowee\message.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\doowee\message.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\windows\close.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\windows\close.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\windows\close.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\windows\max.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\windows\max.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\windows\max.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\images\windows\min.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\windows\min.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\images\windows\min.png"
echo eyeOS\extern\apps\eyeX\themes\defaultPlus\screenshot.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\apps\eyeX\themes\defaultPlus\screenshot.png" -quiet "eyeOS\extern\apps\eyeX\themes\defaultPlus\screenshot.png"
echo eyeOS\extern\libs\eyeWidgets\codepress\images\line-numbers.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\codepress\images\line-numbers.png" -quiet "eyeOS\extern\libs\eyeWidgets\codepress\images\line-numbers.png"
echo eyeOS\extern\libs\eyeWidgets\jscolor\hs.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\jscolor\hs.png" -quiet "eyeOS\extern\libs\eyeWidgets\jscolor\hs.png"
echo eyeOS\extern\libs\eyeWidgets\jscolor\hv.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\jscolor\hv.png" -quiet "eyeOS\extern\libs\eyeWidgets\jscolor\hv.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\bg_top.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\bg_top.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\bg_top.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\bg_top_left.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\bg_top_left.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\bg_top_left.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\bg_top_right.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\bg_top_right.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\bg_top_right.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\close.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\close.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\close.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\close_x.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\close_x.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\close_x.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\e.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\e.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\e.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\eyeHelp.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\eyeHelp.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\plugins\inlinepopups\skins\clearlooks2\img\eyeHelp.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\cornerleft_sh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\cornerleft_sh.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\cornerleft_sh.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\cornerright_sh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\cornerright_sh.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\cornerright_sh.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\left_sh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\left_sh.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\left_sh.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\open.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\open.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\open.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\page_white.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\page_white.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\page_white.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\right_sh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\right_sh.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\right_sh.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\saveAs.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\saveAs.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\saveAs.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\top_sh.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\top_sh.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\img\top_sh.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\default\img\buttons.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\default\img\buttons.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\default\img\buttons.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\img\button_bg.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\img\button_bg.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\img\button_bg.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\img\button_bg_black.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\img\button_bg_black.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\img\button_bg_black.png"
echo eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\img\button_bg_silver.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\img\button_bg_silver.png" -quiet "eyeOS\extern\libs\eyeWidgets\tiny_mce\themes\advanced\skins\o2k7\img\button_bg_silver.png"
echo mobile\mobile-logo.png
"docs\libraries\OptiPNG\optipng.exe" -fix -o5 -out "mobile\mobile-logo.png" -quiet "mobile\mobile-logo.png"
goto start

:p
php -l "browser\index.php"
php -l "eyeOS\apps\HelloWorld\app.eyecode"
php -l "eyeOS\apps\HelloWorld\events.eyecode"
php -l "eyeOS\apps\addLink\app.eyecode"
php -l "eyeOS\apps\addLink\events.eyecode"
php -l "eyeOS\apps\downZip\app.eyecode"
php -l "eyeOS\apps\downZip\events.eyecode"
php -l "eyeOS\apps\editLink\app.eyecode"
php -l "eyeOS\apps\editLink\events.eyecode"
php -l "eyeOS\apps\emptyTrash\app.eyecode"
php -l "eyeOS\apps\emptyTrash\events.eyecode"
php -l "eyeOS\apps\exit\app.eyecode"
php -l "eyeOS\apps\exit\events.eyecode"
php -l "eyeOS\apps\eyeAddressBook\app.eyecode"
php -l "eyeOS\apps\eyeAddressBook\com.eyecode"
php -l "eyeOS\apps\eyeAddressBook\events.eyecode"
php -l "eyeOS\apps\eyeApps\app.eyecode"
php -l "eyeOS\apps\eyeApps\com.eyecode"
php -l "eyeOS\apps\eyeApps\events.eyecode"
php -l "eyeOS\apps\eyeArchive\app.eyecode"
php -l "eyeOS\apps\eyeArchive\events\add_events.eyecode"
php -l "eyeOS\apps\eyeArchive\events\compress.eyecode"
php -l "eyeOS\apps\eyeArchive\events\extract_events.eyecode"
php -l "eyeOS\apps\eyeArchive\events\open_events.eyecode"
php -l "eyeOS\apps\eyeArchive\events.eyecode"
php -l "eyeOS\apps\eyeArchive\libraries\archived_wrapper.eyecode"
php -l "eyeOS\apps\eyeArchive\libraries\directory_wrapper.eyecode"
php -l "eyeOS\apps\eyeArchive\libraries\file_wrapper.eyecode"
php -l "eyeOS\apps\eyeArchive\libraries\main.eyecode"
php -l "eyeOS\apps\eyeArchive\libraries\project_class.eyecode"
php -l "eyeOS\apps\eyeBoard\app.eyecode"
php -l "eyeOS\apps\eyeBoard\events.eyecode"
php -l "eyeOS\apps\eyeCalc\app.eyecode"
php -l "eyeOS\apps\eyeCalc\events.eyecode"
php -l "eyeOS\apps\eyeCalendar\app.eyecode"
php -l "eyeOS\apps\eyeCalendar\com.eyecode"
php -l "eyeOS\apps\eyeCalendar\configDialogs\configEvents.eyecode"
php -l "eyeOS\apps\eyeCalendar\events.eyecode"
php -l "eyeOS\apps\eyeCatch\app.eyecode"
php -l "eyeOS\apps\eyeCatch\com.eyecode"
php -l "eyeOS\apps\eyeCatch\events.eyecode"
php -l "eyeOS\apps\eyeChess\app.eyecode"
php -l "eyeOS\apps\eyeChess\events.eyecode"
php -l "eyeOS\apps\eyeConsole\app.eyecode"
php -l "eyeOS\apps\eyeConsole\events.eyecode"
php -l "eyeOS\apps\eyeContacts\app.eyecode"
php -l "eyeOS\apps\eyeControl\app.eyecode"
php -l "eyeOS\apps\eyeControl\default\account.eyecode"
php -l "eyeOS\apps\eyeControl\default\category.eyecode"
php -l "eyeOS\apps\eyeControl\default\cleantemp.eyecode"
php -l "eyeOS\apps\eyeControl\default\desktop.eyecode"
php -l "eyeOS\apps\eyeControl\default\editfiletype.eyecode"
php -l "eyeOS\apps\eyeControl\default\edituser.eyecode"
php -l "eyeOS\apps\eyeControl\default\eyeACL.eyecode"
php -l "eyeOS\apps\eyeControl\default\eyePdf.eyecode"
php -l "eyeOS\apps\eyeControl\default\eyePictures.eyecode"
php -l "eyeOS\apps\eyeControl\default\eyeboard.eyecode"
php -l "eyeOS\apps\eyeControl\default\eyedesk.eyecode"
php -l "eyeOS\apps\eyeControl\default\eyenav.eyecode"
php -l "eyeOS\apps\eyeControl\default\eyesoft.eyecode"
php -l "eyeOS\apps\eyeControl\default\filetypes.eyecode"
php -l "eyeOS\apps\eyeControl\default\groups.eyecode"
php -l "eyeOS\apps\eyeControl\default\index.eyecode"
php -l "eyeOS\apps\eyeControl\default\lang.eyecode"
php -l "eyeOS\apps\eyeControl\default\newacl.eyecode"
php -l "eyeOS\apps\eyeControl\default\newfiletype.eyecode"
php -l "eyeOS\apps\eyeControl\default\newtarget.eyecode"
php -l "eyeOS\apps\eyeControl\default\newuser.eyecode"
php -l "eyeOS\apps\eyeControl\default\password.eyecode"
php -l "eyeOS\apps\eyeControl\default\security.eyecode"
php -l "eyeOS\apps\eyeControl\default\smtp.eyecode"
php -l "eyeOS\apps\eyeControl\default\system.eyecode"
php -l "eyeOS\apps\eyeControl\default\theme.eyecode"
php -l "eyeOS\apps\eyeControl\default\users.eyecode"
php -l "eyeOS\apps\eyeControl\events\account.eyecode"
php -l "eyeOS\apps\eyeControl\events\cleantemp.eyecode"
php -l "eyeOS\apps\eyeControl\events\desktop.eyecode"
php -l "eyeOS\apps\eyeControl\events\editfiletype.eyecode"
php -l "eyeOS\apps\eyeControl\events\edituser.eyecode"
php -l "eyeOS\apps\eyeControl\events\eyeACL.eyecode"
php -l "eyeOS\apps\eyeControl\events\eyeControl.eyecode"
php -l "eyeOS\apps\eyeControl\events\eyePdf.eyecode"
php -l "eyeOS\apps\eyeControl\events\eyePictures.eyecode"
php -l "eyeOS\apps\eyeControl\events\eyeboard.eyecode"
php -l "eyeOS\apps\eyeControl\events\eyedesk.eyecode"
php -l "eyeOS\apps\eyeControl\events\eyenav.eyecode"
php -l "eyeOS\apps\eyeControl\events\eyesoft.eyecode"
php -l "eyeOS\apps\eyeControl\events\filetypes.eyecode"
php -l "eyeOS\apps\eyeControl\events\groups.eyecode"
php -l "eyeOS\apps\eyeControl\events\index.eyecode"
php -l "eyeOS\apps\eyeControl\events\lang.eyecode"
php -l "eyeOS\apps\eyeControl\events\newacl.eyecode"
php -l "eyeOS\apps\eyeControl\events\newfiletype.eyecode"
php -l "eyeOS\apps\eyeControl\events\newtarget.eyecode"
php -l "eyeOS\apps\eyeControl\events\newuser.eyecode"
php -l "eyeOS\apps\eyeControl\events\password.eyecode"
php -l "eyeOS\apps\eyeControl\events\security.eyecode"
php -l "eyeOS\apps\eyeControl\events\smtp.eyecode"
php -l "eyeOS\apps\eyeControl\events\system.eyecode"
php -l "eyeOS\apps\eyeControl\events\theme.eyecode"
php -l "eyeOS\apps\eyeControl\events\users.eyecode"
php -l "eyeOS\apps\eyeControl\events.eyecode"
php -l "eyeOS\apps\eyeControl\libraries\array.eyecode"
php -l "eyeOS\apps\eyeControl\libraries\eyeControl.eyecode"
php -l "eyeOS\apps\eyeControl\libraries\users.eyecode"
php -l "eyeOS\apps\eyeCopy\app.eyecode"
php -l "eyeOS\apps\eyeDelete\app.eyecode"
php -l "eyeOS\apps\eyeDesk\app.eyecode"
php -l "eyeOS\apps\eyeDesk\com.eyecode"
php -l "eyeOS\apps\eyeDesk\events.eyecode"
php -l "eyeOS\apps\eyeDialog\app.eyecode"
php -l "eyeOS\apps\eyeDialog\events.eyecode"
php -l "eyeOS\apps\eyeDialog\func.eyecode"
php -l "eyeOS\apps\eyeDock\app.eyecode"
php -l "eyeOS\apps\eyeDock\events.eyecode"
php -l "eyeOS\apps\eyeDock\lang\en.eyecode"
php -l "eyeOS\apps\eyeDock\libs.eyecode"
php -l "eyeOS\apps\eyeDock\modules\datetime.eyecode"
php -l "eyeOS\apps\eyeDock\modules\icon.eyecode"
php -l "eyeOS\apps\eyeDock\modules\line.eyecode"
php -l "eyeOS\apps\eyeDock\modules\menu\icon.eyecode"
php -l "eyeOS\apps\eyeDock\modules\menu\line.eyecode"
php -l "eyeOS\apps\eyeDock\modules\menu\showdesktop.eyecode"
php -l "eyeOS\apps\eyeDock\modules\menu\space.eyecode"
php -l "eyeOS\apps\eyeDock\modules\menu\text.eyecode"
php -l "eyeOS\apps\eyeDock\modules\menu.eyecode"
php -l "eyeOS\apps\eyeDock\modules\showdesktop.eyecode"
php -l "eyeOS\apps\eyeDock\modules\space.eyecode"
php -l "eyeOS\apps\eyeDock\modules\taskbar.eyecode"
php -l "eyeOS\apps\eyeDock\modules\text.eyecode"
php -l "eyeOS\apps\eyeDocs\app.eyecode"
php -l "eyeOS\apps\eyeDocs\com.eyecode"
php -l "eyeOS\apps\eyeDocs\events.eyecode"
php -l "eyeOS\apps\eyeDocs\lib.eyecode"
php -l "eyeOS\apps\eyeDownload\app.eyecode"
php -l "eyeOS\apps\eyeDownload\events.eyecode"
php -l "eyeOS\apps\eyeFTP\app.eyecode"
php -l "eyeOS\apps\eyeFTP\com.eyecode"
php -l "eyeOS\apps\eyeFTP\dialogs.eyecode"
php -l "eyeOS\apps\eyeFTP\events-local.eyecode"
php -l "eyeOS\apps\eyeFTP\events-remote.eyecode"
php -l "eyeOS\apps\eyeFTP\events.eyecode"
php -l "eyeOS\apps\eyeFTP\hosts.eyecode"
php -l "eyeOS\apps\eyeFTP\lib-ftp.eyecode"
php -l "eyeOS\apps\eyeFTP\lib-global.eyecode"
php -l "eyeOS\apps\eyeFTP\lib-local.eyecode"
php -l "eyeOS\apps\eyeFTP\lib-remote.eyecode"
php -l "eyeOS\apps\eyeFeeds\app.eyecode"
php -l "eyeOS\apps\eyeFeeds\com.eyecode"
php -l "eyeOS\apps\eyeFeeds\dialogs.eyecode"
php -l "eyeOS\apps\eyeFeeds\events.eyecode"
php -l "eyeOS\apps\eyeFeeds\func.eyecode"
php -l "eyeOS\apps\eyeFeeds\settings.eyecode"
php -l "eyeOS\apps\eyeFeeds\simplepie.eyecode"
php -l "eyeOS\apps\eyeFiles\app.eyecode"
php -l "eyeOS\apps\eyeFiles\boxes\actions.eyecode"
php -l "eyeOS\apps\eyeFiles\boxes\view.eyecode"
php -l "eyeOS\apps\eyeFiles\com.eyecode"
php -l "eyeOS\apps\eyeFiles\events.eyecode"
php -l "eyeOS\apps\eyeFiles\lib.eyecode"
php -l "eyeOS\apps\eyeFiles\views\details.eyecode"
php -l "eyeOS\apps\eyeFiles\views\icons.eyecode"
php -l "eyeOS\apps\eyeFiles\views\list.eyecode"
php -l "eyeOS\apps\eyeGroups\app.eyecode"
php -l "eyeOS\apps\eyeHelp\app.eyecode"
php -l "eyeOS\apps\eyeHelp\events.eyecode"
php -l "eyeOS\apps\eyeHelp\lib\BBcode.eyecode"
php -l "eyeOS\apps\eyeHelp\lib\Wikicode.eyecode"
php -l "eyeOS\apps\eyeIframize\app.eyecode"
php -l "eyeOS\apps\eyeIframize\events.eyecode"
php -l "eyeOS\apps\eyeImages\app.eyecode"
php -l "eyeOS\apps\eyeImages\com.eyecode"
php -l "eyeOS\apps\eyeImages\events.eyecode"
php -l "eyeOS\apps\eyeImport\app.eyecode"
php -l "eyeOS\apps\eyeImport\events.eyecode"
php -l "eyeOS\apps\eyeInfo\app.eyecode"
php -l "eyeOS\apps\eyeInfo\events.eyecode"
php -l "eyeOS\apps\eyeInstaller\app.eyecode"
php -l "eyeOS\apps\eyeInstaller\events.eyecode"
php -l "eyeOS\apps\eyeLaunch\app.eyecode"
php -l "eyeOS\apps\eyeLaunch\events.eyecode"
php -l "eyeOS\apps\eyeLogin\app.eyecode"
php -l "eyeOS\apps\eyeLogin\events.eyecode"
php -l "eyeOS\apps\eyeLogin\themes\default\window.eyecode"
php -l "eyeOS\apps\eyeMail\app.eyecode"
php -l "eyeOS\apps\eyeMail\class.phpmailer.php"
php -l "eyeOS\apps\eyeMail\class.smtp.php"
php -l "eyeOS\apps\eyeMail\com.eyecode"
php -l "eyeOS\apps\eyeMail\compat.eyecode"
php -l "eyeOS\apps\eyeMail\events.eyecode"
php -l "eyeOS\apps\eyeMail\mail.eyecode"
php -l "eyeOS\apps\eyeMail\preferences.eyecode"
php -l "eyeOS\apps\eyeManageApps\app.eyecode"
php -l "eyeOS\apps\eyeManageApps\events.eyecode"
php -l "eyeOS\apps\eyeMedia\app.eyecode"
php -l "eyeOS\apps\eyeMedia\events.eyecode"
php -l "eyeOS\apps\eyeMedia\lib.eyecode"
php -l "eyeOS\apps\eyeMessages\app.eyecode"
php -l "eyeOS\apps\eyeMessages\com.eyecode"
php -l "eyeOS\apps\eyeMessages\events.eyecode"
php -l "eyeOS\apps\eyeMessages\lang\en.eyecode"
php -l "eyeOS\apps\eyeMkDir\app.eyecode"
php -l "eyeOS\apps\eyeMkDir\events.eyecode"
php -l "eyeOS\apps\eyeMp3\app.eyecode"
php -l "eyeOS\apps\eyeMp3\events.eyecode"
php -l "eyeOS\apps\eyeNav\app.eyecode"
php -l "eyeOS\apps\eyeNav\com.eyecode"
php -l "eyeOS\apps\eyeNav\events.eyecode"
php -l "eyeOS\apps\eyeNav\libs.eyecode"
php -l "eyeOS\apps\eyeNav\plugins\anonymouse.eyecode"
php -l "eyeOS\apps\eyeNav\plugins\eyeNavProxy\index.inc.php"
php -l "eyeOS\apps\eyeNav\plugins\eyeNavProxy\index.php"
php -l "eyeOS\apps\eyeNav\plugins\eyeNavProxy.eyecode"
php -l "eyeOS\apps\eyeNav\plugins\iframe.eyecode"
php -l "eyeOS\apps\eyeNotes\app.eyecode"
php -l "eyeOS\apps\eyeNotes\com.eyecode"
php -l "eyeOS\apps\eyeNotes\events.eyecode"
php -l "eyeOS\apps\eyeOpen\app.eyecode"
php -l "eyeOS\apps\eyeOpen\events.eyecode"
php -l "eyeOS\apps\eyePaste\app.eyecode"
php -l "eyeOS\apps\eyePaste\events.eyecode"
php -l "eyeOS\apps\eyePdf\app.eyecode"
php -l "eyeOS\apps\eyePdf\com.eyecode"
php -l "eyeOS\apps\eyePdf\events.eyecode"
php -l "eyeOS\apps\eyePictures\app.eyecode"
php -l "eyeOS\apps\eyePictures\com.eyecode"
php -l "eyeOS\apps\eyePictures\events.eyecode"
php -l "eyeOS\apps\eyePictures\forms\form.eyecode"
php -l "eyeOS\apps\eyePresentation\app.eyecode"
php -l "eyeOS\apps\eyePresentation\events.eyecode"
php -l "eyeOS\apps\eyeProcess\app.eyecode"
php -l "eyeOS\apps\eyeProcess\com.eyecode"
php -l "eyeOS\apps\eyeProcess\events.eyecode"
php -l "eyeOS\apps\eyeProperties\app.eyecode"
php -l "eyeOS\apps\eyeProperties\events.eyecode"
php -l "eyeOS\apps\eyeRename\app.eyecode"
php -l "eyeOS\apps\eyeRename\events.eyecode"
php -l "eyeOS\apps\eyeShare\app.eyecode"
php -l "eyeOS\apps\eyeShare\events.eyecode"
php -l "eyeOS\apps\eyeSheets\app.eyecode"
php -l "eyeOS\apps\eyeSheets\com.eyecode"
php -l "eyeOS\apps\eyeSheets\events.eyecode"
php -l "eyeOS\apps\eyeSheets\lib\ods.eyecode"
php -l "eyeOS\apps\eyeShow\app.eyecode"
php -l "eyeOS\apps\eyeShow\events.eyecode"
php -l "eyeOS\apps\eyeSoft\app.eyecode"
php -l "eyeOS\apps\eyeSoft\events.eyecode"
php -l "eyeOS\apps\eyeSoft\libCompress.eyecode"
php -l "eyeOS\apps\eyeString\app.eyecode"
php -l "eyeOS\apps\eyeString\events.eyecode"
php -l "eyeOS\apps\eyeTetravex\app.eyecode"
php -l "eyeOS\apps\eyeTetravex\events.eyecode"
php -l "eyeOS\apps\eyeTrash\app.eyecode"
php -l "eyeOS\apps\eyeUpload\app.eyecode"
php -l "eyeOS\apps\eyeUpload\events.eyecode"
php -l "eyeOS\apps\eyeUpload\tabs\advanced.eyecode"
php -l "eyeOS\apps\eyeUpload\tabs\simple.eyecode"
php -l "eyeOS\apps\eyeUpload\tabs\web.eyecode"
php -l "eyeOS\apps\eyeVideo\app.eyecode"
php -l "eyeOS\apps\eyeVideo\events.eyecode"
php -l "eyeOS\apps\eyeVisor\app.eyecode"
php -l "eyeOS\apps\eyeVisor\events.eyecode"
php -l "eyeOS\apps\eyeX\app.eyecode"
php -l "eyeOS\apps\eyeX\events.eyecode"
php -l "eyeOS\apps\id\app.eyecode"
php -l "eyeOS\apps\killall\app.eyecode"
php -l "eyeOS\apps\miniActions\app.eyecode"
php -l "eyeOS\apps\miniActions\events.eyecode"
php -l "eyeOS\apps\miniCalendar\app.eyecode"
php -l "eyeOS\apps\miniCalendar\events.eyecode"
php -l "eyeOS\apps\miniHome\app.eyecode"
php -l "eyeOS\apps\miniHome\events.eyecode"
php -l "eyeOS\apps\miniMessages\app.eyecode"
php -l "eyeOS\apps\miniMessages\events.eyecode"
php -l "eyeOS\apps\miniToDo\app.eyecode"
php -l "eyeOS\apps\miniToDo\events.eyecode"
php -l "eyeOS\apps\miniToDo\forms\new_note_form.eyecode"
php -l "eyeOS\apps\moveDrag\app.eyecode"
php -l "eyeOS\apps\newFile\app.eyecode"
php -l "eyeOS\apps\newFile\events.eyecode"
php -l "eyeOS\apps\newMessage\app.eyecode"
php -l "eyeOS\apps\newMessage\events.eyecode"
php -l "eyeOS\apps\restoreTrash\app.eyecode"
php -l "eyeOS\apps\restoreTrash\events.eyecode"
php -l "eyeOS\apps\systemConsole\app.eyecode"
php -l "eyeOS\apps\systemConsole\com.eyecode"
php -l "eyeOS\apps\systemConsole\events.eyecode"
php -l "eyeOS\apps\uname\app.eyecode"
php -l "eyeOS\apps\vCardImport\app.eyecode"
php -l "eyeOS\apps\vCardImport\events.eyecode"
php -l "eyeOS\apps\xKill\app.eyecode"
php -l "eyeOS\apps\xKill\events.eyecode"
php -l "eyeOS\extern\apps\eyeCalc\eyeCalc.eyecode"
php -l "eyeOS\extern\apps\eyeCalendar\js\components\eyeCalendar.eyecode"
php -l "eyeOS\extern\apps\eyeChess\eyeChess.eyecode"
php -l "eyeOS\extern\apps\eyeFTP\js\eyeFTP.eyecode"
php -l "eyeOS\extern\apps\eyeLogin\themes\default\eyeLogin.eyecode"
php -l "eyeOS\extern\apps\eyeMedia\js\eyeMedia.eyecode"
php -l "eyeOS\extern\apps\eyeMp3\js\eyeMp3.eyecode"
php -l "eyeOS\extern\apps\eyePdf\pdf.js.eyecode"
php -l "eyeOS\extern\apps\eyeSheets\getjs.eyecode"
php -l "eyeOS\extern\apps\eyeSheets\spread.eyecode"
php -l "eyeOS\extern\apps\eyeShow\getjs.eyecode"
php -l "eyeOS\extern\apps\eyeShow\lang.eyecode"
php -l "eyeOS\extern\apps\eyeShow\save.php"
php -l "eyeOS\extern\libs\eyeWidgets\getFile.eyecode"
php -l "eyeOS\extern\libs\eyeWidgets\getMultipleFile.eyecode"
php -l "eyeOS\extras\extern.eyecode"
php -l "eyeOS\i18n\en.eyecode"
php -l "eyeOS\system\kernel\compat.eyecode"
php -l "eyeOS\system\kernel\init.eyecode"
php -l "eyeOS\system\kernel\kernel.eyecode"
php -l "eyeOS\system\lib\errorCodes\main.eyecode"
php -l "eyeOS\system\lib\eyeAddressBook\main.eyecode"
php -l "eyeOS\system\lib\eyeBoard\main.eyecode"
php -l "eyeOS\system\lib\eyeCalendar\main.eyecode"
php -l "eyeOS\system\lib\eyeCompress\main.eyecode"
php -l "eyeOS\system\lib\eyeContacts\main.eyecode"
php -l "eyeOS\system\lib\eyeConverter\main.eyecode"
php -l "eyeOS\system\lib\eyeCrypt\lib\rc4.eyecode"
php -l "eyeOS\system\lib\eyeCrypt\lib\xxtea.eyecode"
php -l "eyeOS\system\lib\eyeCrypt\main.eyecode"
php -l "eyeOS\system\lib\eyeFileArchive\main.eyecode"
php -l "eyeOS\system\lib\eyeFiles\alias.eyecode"
php -l "eyeOS\system\lib\eyeFiles\images.eyecode"
php -l "eyeOS\system\lib\eyeFiles\main.eyecode"
php -l "eyeOS\system\lib\eyeIPC\main.eyecode"
php -l "eyeOS\system\lib\eyeMessages\main.eyecode"
php -l "eyeOS\system\lib\eyePear\Contact\Vcard\Build.php"
php -l "eyeOS\system\lib\eyePear\Contact\Vcard\Parse.php"
php -l "eyeOS\system\lib\eyePear\Crypt\RC42.php"
php -l "eyeOS\system\lib\eyePear\Crypt\XXTEA.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\And.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\Current.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\Custom.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\Duplicate.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\Ereg.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\Eregi.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\Extension.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\False.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\Index.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\MIME.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\MaxDepth.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\MinSize.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\MinTime.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\Not.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\Or.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\Preg.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate\True.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Predicate.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Ar.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Archive.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Bzip2.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Cab.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Cache.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\ChangeName\AddDirectory.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\ChangeName\Callback.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\ChangeName\Directory.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\ChangeName.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Concat.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Directory.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\File.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Filter.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Gzip.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Memory.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\MimeList.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Multi.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Rar.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Relay.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Select.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Tar.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Uncompress.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader\Zip.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Reader.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\AddBaseName.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\Ar.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\Archive.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\Bzip2.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\Files.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\Gzip.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\Mail.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\Memory.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\MemoryArchive.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\Multi.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\Output.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\Tar.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\UniqueAppender.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer\Zip.php"
php -l "eyeOS\system\lib\eyePear\File\Archive\Writer.php"
php -l "eyeOS\system\lib\eyePear\File\Archive.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2\Adapter\Curl.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2\Adapter\Mock.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2\Adapter\Socket.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2\Adapter.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2\CookieJar.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2\Exception.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2\MultipartBody.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2\Observer\Log.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2\Response.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2\SOCKS5.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2\SocketWrapper.php"
php -l "eyeOS\system\lib\eyePear\HTTP\Request2.php"
php -l "eyeOS\system\lib\eyePear\MIME\Type\Extension.php"
php -l "eyeOS\system\lib\eyePear\MIME\Type\Parameter.php"
php -l "eyeOS\system\lib\eyePear\MIME\Type.php"
php -l "eyeOS\system\lib\eyePear\Net\URL2.php"
php -l "eyeOS\system\lib\eyePear\Numbers\Roman.php"
php -l "eyeOS\system\lib\eyePear\OS\Guess.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Autoloader.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Builder.php"
php -l "eyeOS\system\lib\eyePear\PEAR\ChannelFile\Parser.php"
php -l "eyeOS\system\lib\eyePear\PEAR\ChannelFile.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Auth.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Build.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Channels.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Common.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Config.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Install.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Mirror.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Package.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Pickle.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Registry.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Remote.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command\Test.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Command.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Common.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Config.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Dependency2.php"
php -l "eyeOS\system\lib\eyePear\PEAR\DependencyDB.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Downloader\Package.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Downloader.php"
php -l "eyeOS\system\lib\eyePear\PEAR\ErrorStack.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Exception.php"
php -l "eyeOS\system\lib\eyePear\PEAR\FixPHP5PEARWarnings.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Frontend\CLI.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Frontend.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer\Role\Cfg.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer\Role\Common.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer\Role\Data.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer\Role\Doc.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer\Role\Ext.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer\Role\Php.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer\Role\Script.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer\Role\Src.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer\Role\Test.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer\Role\Www.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer\Role.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Installer.php"
php -l "eyeOS\system\lib\eyePear\PEAR\PackageFile\Generator\v1.php"
php -l "eyeOS\system\lib\eyePear\PEAR\PackageFile\Generator\v2.php"
php -l "eyeOS\system\lib\eyePear\PEAR\PackageFile\Parser\v1.php"
php -l "eyeOS\system\lib\eyePear\PEAR\PackageFile\Parser\v2.php"
php -l "eyeOS\system\lib\eyePear\PEAR\PackageFile\v1.php"
php -l "eyeOS\system\lib\eyePear\PEAR\PackageFile\v2\Validator.php"
php -l "eyeOS\system\lib\eyePear\PEAR\PackageFile\v2\rw.php"
php -l "eyeOS\system\lib\eyePear\PEAR\PackageFile\v2.php"
php -l "eyeOS\system\lib\eyePear\PEAR\PackageFile.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Packager.php"
php -l "eyeOS\system\lib\eyePear\PEAR\REST\10.php"
php -l "eyeOS\system\lib\eyePear\PEAR\REST\11.php"
php -l "eyeOS\system\lib\eyePear\PEAR\REST\13.php"
php -l "eyeOS\system\lib\eyePear\PEAR\REST.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Registry.php"
php -l "eyeOS\system\lib\eyePear\PEAR\RunTest.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Task\Common.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Task\Postinstallscript\rw.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Task\Postinstallscript.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Task\Replace\rw.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Task\Replace.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Task\Unixeol\rw.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Task\Unixeol.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Task\Windowseol\rw.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Task\Windowseol.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Validate.php"
php -l "eyeOS\system\lib\eyePear\PEAR\Validator\PECL.php"
php -l "eyeOS\system\lib\eyePear\PEAR\XMLParser.php"
php -l "eyeOS\system\lib\eyePear\PEAR.php"
php -l "eyeOS\system\lib\eyePear\PEAR5.php"
php -l "eyeOS\system\lib\eyePear\System\Command.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory\Apachenote.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory\Apc.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory\Common.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory\Eaccelerator.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory\File.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory\Memcache.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory\Mmcache.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory\Sharedance.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory\Shmop.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory\Sqlite.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory\Systemv.php"
php -l "eyeOS\system\lib\eyePear\System\SharedMemory.php"
php -l "eyeOS\system\lib\eyePear\System.php"
php -l "eyeOS\system\lib\eyePear\main.eyecode"
php -l "eyeOS\system\lib\eyePublic\main.eyecode"
php -l "eyeOS\system\lib\eyeSessions\main.eyecode"
php -l "eyeOS\system\lib\eyeSimpleDb\db_drivers\mysql_driver.eyecode"
php -l "eyeOS\system\lib\eyeSimpleDb\main.eyecode"
php -l "eyeOS\system\lib\eyeSmtp\main.eyecode"
php -l "eyeOS\system\lib\eyeSmtp\plain_sasl_client.eyecode"
php -l "eyeOS\system\lib\eyeSmtp\sasl.eyecode"
php -l "eyeOS\system\lib\eyeSmtp\smtp.eyecode"
php -l "eyeOS\system\lib\eyeSound\main.eyecode"
php -l "eyeOS\system\lib\eyeString\main.eyecode"
php -l "eyeOS\system\lib\eyeString\types\compat\explode.eyecode"
php -l "eyeOS\system\lib\eyeString\types\compat\nl2br.eyecode"
php -l "eyeOS\system\lib\eyeString\types\compat\number_format.eyecode"
php -l "eyeOS\system\lib\eyeString\types\iconv\strlen.eyecode"
php -l "eyeOS\system\lib\eyeString\types\iconv\strpos.eyecode"
php -l "eyeOS\system\lib\eyeString\types\iconv\strrpos.eyecode"
php -l "eyeOS\system\lib\eyeString\types\iconv\substr.eyecode"
php -l "eyeOS\system\lib\eyeString\types\mbstring\stripos.eyecode"
php -l "eyeOS\system\lib\eyeString\types\mbstring\stristr.eyecode"
php -l "eyeOS\system\lib\eyeString\types\mbstring\strlen.eyecode"
php -l "eyeOS\system\lib\eyeString\types\mbstring\strpos.eyecode"
php -l "eyeOS\system\lib\eyeString\types\mbstring\strrchr.eyecode"
php -l "eyeOS\system\lib\eyeString\types\mbstring\strripos.eyecode"
php -l "eyeOS\system\lib\eyeString\types\mbstring\strrpos.eyecode"
php -l "eyeOS\system\lib\eyeString\types\mbstring\strtolower.eyecode"
php -l "eyeOS\system\lib\eyeString\types\mbstring\strtoupper.eyecode"
php -l "eyeOS\system\lib\eyeString\types\mbstring\substr.eyecode"
php -l "eyeOS\system\lib\eyeString\types\mbstring\substr_count.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\addcslashes.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\chr.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\chunk_split.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\count_chars.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\html_entity_decode.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\htmlentities.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\htmlspecialchars.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\htmlspecialchars_decode.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\lcfirst.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\levenshtein.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\ltrim.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\ord.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\rtrim.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\str_ireplace.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\str_pad.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\str_shuffle.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\str_split.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\str_word_count.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strcasecmp.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strcspn.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\stripos.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\stristr.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strlen.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strnatcasecmp.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strncasecmp.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strncmp.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strpbrk.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strpos.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strrchr.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strrev.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strripos.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strrpos.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strspn.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strstr.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strtolower.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\strtoupper.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\substr.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\substr_compare.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\substr_count.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\substr_replace.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\trim.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\ucfirst.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\ucwords.eyecode"
php -l "eyeOS\system\lib\eyeString\types\native\wordwrap.eyecode"
php -l "eyeOS\system\lib\eyeSwap\main.eyecode"
php -l "eyeOS\system\lib\eyeURL\main.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\main.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Applet.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Box.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Button.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Calendar.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Checkbox.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Container.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\ContextMenu.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Document.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\File.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Flash.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Hidden.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Icon.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Iframe.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Imagebox.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Label.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Line.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Listbox.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\ProgressBar.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Radio.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Select.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\SimpleMenu.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Simplebox.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Sortabletable.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Split.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Tab.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Textarea.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Textbox.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Toolbar.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Tree.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\Window.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\weekPlanner.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\widgetDrag.eyecode"
php -l "eyeOS\system\lib\eyeWidgets\widgets\widgetDrop.eyecode"
php -l "eyeOS\system\lib\eyeXML\main.eyecode"
php -l "eyeOS\system\lib\eyeXML\parsers\expat.eyecode"
php -l "eyeOS\system\lib\eyeXML\parsers\pure.eyecode"
php -l "eyeOS\system\lib\eyeXML\xmlConfiguration.eyecode"
php -l "eyeOS\system\lib\eyeZip\main.eyecode"
php -l "eyeOS\system\lib\i18n\main.eyecode"
php -l "eyeOS\system\lib\simpleZip\main.eyecode"
php -l "eyeOS\system\lib\vGroups\main.eyecode"
php -l "eyeOS\system\services\extern\main.eyecode"
php -l "eyeOS\system\services\eyex\image_alias.eyecode"
php -l "eyeOS\system\services\eyex\main.eyecode"
php -l "eyeOS\system\services\logs\main.eyecode"
php -l "eyeOS\system\services\mmap\main.eyecode"
php -l "eyeOS\system\services\proc\main.eyecode"
php -l "eyeOS\system\services\sec\main.eyecode"
php -l "eyeOS\system\services\um\main.eyecode"
php -l "eyeOS\system\services\um\modules\eyeos.eyecode"
php -l "eyeOS\system\services\um\modules\ldap.eyecode"
php -l "eyeOS\system\services\vfs\main.eyecode"
php -l "eyeOS\system\services\vfs\modules\real.eyecode"
php -l "eyeOS\system\services\vfs\modules\virtual.eyecode"
php -l "eyeOS\xml-rpc\server.eyecode"
php -l "index.php"
php -l "iphone\404.eyecode"
php -l "iphone\apps\eyeCalendar\app.eyecode"
php -l "iphone\apps\eyeCalendar\events.eyecode"
php -l "iphone\apps\eyeContacts\app.eyecode"
php -l "iphone\apps\eyeContacts\events.eyecode"
php -l "iphone\apps\eyeFeeds\app.eyecode"
php -l "iphone\apps\eyeFeeds\events.eyecode"
php -l "iphone\apps\eyeFiles\app.eyecode"
php -l "iphone\apps\eyeFiles\events.eyecode"
php -l "iphone\apps\eyeFiles\lib.eyecode"
php -l "iphone\apps\eyeMenu\app.eyecode"
php -l "iphone\apps\eyeMenu\events.eyecode"
php -l "iphone\apps\login\app.eyecode"
php -l "iphone\apps\login\events.eyecode"
php -l "iphone\apps\logout\app.eyecode"
php -l "iphone\bottom.eyecode"
php -l "iphone\index.php"
php -l "iphone\lib\message.eyecode"
php -l "iphone\top.eyecode"
php -l "iphone\top_back.eyecode"
php -l "mobile\index.php"
php -l "mobile\mobile_eyeFiles.eyecode"
php -l "mobile\mobile_functions.eyecode"
php -l "settings.php"
goto start