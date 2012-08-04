/*global JSLINT */
/*jslint browser: true, devel: true, newcap: true, sloppy: true, todo: true, windows: true */

(function () {
	var content, filename, handler, index, line;
	content = '';
	filename = 'stdin';
	if (WScript.Arguments.length > 0) {
		filename = WScript.Arguments(0);
		handler = new ActiveXObject('Scripting.FileSystemObject').OpenTextFile(filename, 1);
		content = handler.ReadAll();
		handler.Close();
	} else {
		content = WScript.StdIn.ReadAll();
	}
	if (JSLINT(content) === false) {
		for (index = 0; index < JSLINT.errors.length; index += 1) {
			line = JSLINT.errors[index].line;
			if (typeof line === 'undefined') {
				line = '0';
			}
			WScript.StdOut.WriteLine(filename + ' (' + line + ', ' + JSLINT.errors[index].character + '): ' + JSLINT.errors[index].reason);
			WScript.StdOut.WriteLine("\t" + JSLINT.errors[index].evidence.replace(/^\s*/, '').replace(/\s*$/, ''));
		}
	}
}());