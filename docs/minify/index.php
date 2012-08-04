<?php
/*
  ___  _ __   ___ _   _  ___
 / _ \| '_ \ / _ \ | | |/ _ \
| (_) | | | |  __/ |_| |  __/
 \___/|_| |_|\___|\__, |\___|
                  |___/

oneye is released under the GNU Affero General Public License Version 3 (AGPL3)
 -> provided with this release in license.txt
 -> or via web at www.gnu.org/licenses/agpl-3.0.txt

Copyright © 2005 - 2010 eyeos Team (team@eyeos.org)
             since 2010 Lars Knickrehm (mail@lars-sh.de)
*/

header('Content-Type: text/plain; charset=UTF-8');
chdir('../..');

$excludeJ = array(
	'docs',
	'iphone\\apps\\eyeCalendar\\calendar.js',
	'iphone\\eyeOs_files\\iui.js',
	'eyeOS\\extern\\apps\\eyeChess',
	'eyeOS\\extern\\apps\\eyePdf',
	'eyeOS\\extern\\apps\\eyeSheets',
	'eyeOS\\extern\\apps\\eyeShow',
	'eyeOS\\extern\\apps\\eyeVideo',
	'eyeOS\\extern\\libs\\eyeSound',
	'eyeOS\\extern\\libs\\eyeWidgets\\codepress',
	'eyeOS\\extern\\libs\\eyeWidgets\\jscolor',
	'eyeOS\\extern\\libs\\eyeWidgets\\tiny_mce',
	'eyeOS\\extern\\libs\\x.js'
);
$excludeM = array(
	'docs',
	'iphone'
);
$excludeO = array(
	'docs',
	'iphone'
);
$excludeP = array(
	'docs'
);
$excludeC = array(
	'docs',
	'iphone'
);
$content = getContent('', $excludeJ, $excludeM, $excludeO, $excludeP, $excludeC);
file_put_contents('docs/libraries/jslint-wsh/jslint-wsh.js', file_get_contents('docs/libraries/JSLint/jslint.js') . file_get_contents('docs/libraries/jslint-wsh/wsh.js'));
file_put_contents('docs/minify/minify.cmd', str_replace(array('%0', '%1', '%2', '%3', '%4'), array(trim($content['j']), trim($content['m']), trim($content['o']), trim($content['p']), trim($content['c'])), file_get_contents('docs/minify/template.cmd')));
print_r($content);

function getContent($folder, $excludeJ = array(), $excludeM = array(), $excludeO = array(), $excludeP = array(), $excludeC = array()) {
	$content = array(
		'j' => '',
		'm' => '',
		'o' => '',
		'p' => '',
		'c' => ''
	);
	if ($folder === '') {
		$files = scandir('.');
	} else {
		$files = scandir($folder);
	}
	foreach ($files as $file) {
		if ($file{0} !== '.') {
			if (is_dir($folder . $file) === true) {
				if ($excludeJ !== '*' && in_array($folder . $file, $excludeJ) === false || $excludeM !== '*' && in_array($folder . $file, $excludeM) === false || $excludeO !== '*' && in_array($folder . $file, $excludeO) === false || $excludeP !== '*' && in_array($folder . $file, $excludeP) === false || $excludeC !== '*' && in_array($folder . $file, $excludeC) === false) {
					$excludeJ2 = $excludeJ;
					$excludeM2 = $excludeM;
					$excludeO2 = $excludeO;
					$excludeP2 = $excludeP;
					$excludeC2 = $excludeC;
					if ($excludeJ2 !== '*' && in_array($folder . $file, $excludeJ2) === true) {
						$excludeJ2 = '*';
					}
					if ($excludeM2 !== '*' && in_array($folder . $file, $excludeM2) === true) {
						$excludeM2 = '*';
					}
					if ($excludeO2 !== '*' && in_array($folder . $file, $excludeO2) === true) {
						$excludeO2 = '*';
					}
					if ($excludeP2 !== '*' && in_array($folder . $file, $excludeP2) === true) {
						$excludeP2 = '*';
					}
					if ($excludeC2 !== '*' && in_array($folder . $file, $excludeC2) === true) {
						$excludeC2 = '*';
					}
					$merge = getContent($folder . $file . '\\', $excludeJ2, $excludeM2, $excludeO2, $excludeP2, $excludeC2);
					$content['j'] .= $merge['j'];
					$content['m'] .= $merge['m'];
					$content['o'] .= $merge['o'];
					$content['p'] .= $merge['p'];
					$content['c'] .= $merge['c'];
				}
			} else if (substr($file, -3) === '.js' && substr($file, -7) !== '.min.js') {
				if ($excludeJ !== '*' && in_array($folder . $file, $excludeJ) === false) {
					$content['j'] .= 'cscript.exe //E:JScript //NoLogo docs\\libraries\\jslint-wsh\\jslint-wsh.js "' . $folder . $file . '"' . "\n" . 'echo.' . "\n";
				}
				if ($excludeM !== '*' && in_array($folder . $file, $excludeM) === false) {
					$content['m'] .= 'echo ' . $folder . $file . "\n";
					$content['m'] .= 'docs\libraries\node.js\node.exe docs\libraries\UglifyJS\bin\uglifyjs --lift-vars --no-copyright --output "' . $folder . substr($file, 0, -2) . 'min.js" --reserved-names "$super" --unsafe "' . $folder . $file . '"' . "\n";
				}
			} else if (substr($file, -4) === '.png' && substr($file, -8) !== '.min.png') {
				if ($excludeO !== '*' && in_array($folder . $file, $excludeO) === false) {
					$content['o'] .= 'echo ' . $folder . $file . "\n";
					$content['o'] .= '"docs\\libraries\\OptiPNG\\optipng.exe" -fix -o5 -out "' . $folder . $file . '" -quiet "' . $folder . $file . '"' . "\n";
				}
			} else if (substr($file, -4) === '.php' || substr($file, -8) === '.eyecode') {
				if ($excludeP !== '*' && in_array($folder . $file, $excludeP) === false) {
					$content['p'] .= 'php -l "' . $folder . $file . '"' . "\n";
				}
			} else if (substr($file, -4) === '.css' && substr($file, -8) !== '.min.css') {
				if ($excludeC !== '*' && in_array($folder . $file, $excludeC) === false) {
					$content['c'] .= '"C:\Program Files (x86)\Java\jre7\bin\java.exe" -jar "' . getYuiPath('docs\\libraries\\YUI Compressor\\build\\') . '" "' . $folder . $file . '" -o "' . $folder . substr($file, 0, -4) . '.min.css"' . "\n";
				}
			}
		}
	}
	return $content;
}

function getYuiPath($path) {
	foreach (scandir($path) as $file) {
		if ($file{0} !== '.' && substr($file, -4) === '.jar') {
			return $path . $file;
		}
	}
	return false;
}
?>