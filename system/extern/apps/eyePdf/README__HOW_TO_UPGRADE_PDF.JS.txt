PDF.JS UPGRADE PROCEDURE:

1. Generate an updated version of the JS pdf.js (there is a tutorial on pdf.js's site. Simply, clone the git repository and launch "make") and replace /extern/apps/eyePdf/js/pdf.js with the generated one.
2. Update also viewer.js, compatibility.js and viewer.css
3. Remove from viewer.js all the references to "fileInput" and "viewBookmark", which are disabled in oneye.
4. Comment or remove the "var kDefaultURL" line at the beginning of viewer.js.
5. Generate .min.js copies of pdf.js, viewer.js and compatibility.js with JSMIN (http://fmarcia.info/jsmin/test.html). NOTE: Do not use UglifyJS, YUI Compressor or Google Closure Compiler, because the minified code would not work due to variable renaming, which is not tolerated by pdf.js.
6. It may be necessary to add "vertical-align: top;" to the "#controls > button" block in viewer.css, if some buttons are not displayed correctly.
7. Generate viewer.min.css with the YUI Compressor.
8. Generate updated version of the images if necessary (you have to generate PNGs from the SVGs files, using Inkscape for example)
9. If new html elements have been added in the new version, it may be necessary to update the html code in /extern/apps/eyePdf/pdf.js.eyecode
9. Test and debug with Firebug!