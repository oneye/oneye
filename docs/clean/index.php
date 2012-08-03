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

$excludeC = array(
	'docs'
);
$excludeF = array(
	'docs',
	'eyeOS/apps/eyeFeeds/simplepie.eyecode',
	'eyeOS/apps/eyeMail/class.phpmailer.php',
	'eyeOS/apps/eyeMail/class.smtp.php',
	'eyeOS/apps/eyeNav/plugins/eyeNavProxy',
	'eyeOS/apps/eyeSoft/libCompress.eyecode',
	'eyeOS/system/lib/eyePear',
	'eyeOS/system/lib/eyeSmtp/plain_sasl_client.eyecode',
	'eyeOS/system/lib/eyeSmtp/sasl.eyecode',
	'eyeOS/system/lib/eyeSmtp/smtp.eyecode',
	'eyeOS/system/lib/eyeString/types',
	'eyeOS/xml-rpc/xmlrpc.inc',
	'eyeOS/xml-rpc/xmlrpc_wrappers.inc',
	'eyeOS/xml-rpc/xmlrpcs.inc'
);
$excludeU = array();
$excludeW = array(
	'docs/libraries',
	'eyeOS/extern/libs/eyeWidgets/tiny_mce',
	'eyeOS/system/lib/eyePear'
);

$path = 'eyeOS/system/lib/eyeString/types';
$functions = array_merge(scandir($path . '/compat'), scandir($path . '/native'));
foreach ($functions as $key => $value) {
	if (substr($value, -8) === '.eyecode') {
		$functions[$key] = preg_quote(substr($value, 0, -8), '/');
	} else {
		unset($functions[$key]);
	}
}
$functions[] = 'array_map';
$functions[] = 'preg_filter';
$functions[] = 'preg_grep';
$functions[] = 'preg_match';
$functions[] = 'preg_match_all';
$functions[] = 'preg_replace';
$functions[] = 'preg_replace_callback';
$functions[] = 'preg_split';

getContent('', implode('|', $functions), $excludeC, $excludeF, $excludeU, $excludeW);
echo 'Ready.';

function getContent($folder, $functions, $excludeC = array(), $excludeF = array(), $excludeU = array(), $excludeW = array()) {
	global $temp;
	
	if ($folder === '') {
		$files = scandir('.');
	} else {
		$files = scandir($folder);
	}
	foreach ($files as $file) {
		if ($file[0] !== '.') {
			if (is_dir($folder . $file) === true) {
				if ($excludeC !== '*' && in_array($folder . $file, $excludeC) === false || $excludeF !== '*' && in_array($folder . $file, $excludeF) === false || $excludeU !== '*' && in_array($folder . $file, $excludeU) === false || $excludeW !== '*' && in_array($folder . $file, $excludeW) === false) {
					$excludeC2 = $excludeC;
					$excludeF2 = $excludeF;
					$excludeU2 = $excludeU;
					$excludeW2 = $excludeW;
					if ($excludeC2 !== '*' && in_array($folder . $file, $excludeC2) === true) {
						$excludeC2 = '*';
					}
					if ($excludeF2 !== '*' && in_array($folder . $file, $excludeF2) === true) {
						$excludeF2 = '*';
					}
					if ($excludeU2 !== '*' && in_array($folder . $file, $excludeU2) === true) {
						$excludeU2 = '*';
					}
					if ($excludeW2 !== '*' && in_array($folder . $file, $excludeW2) === true) {
						$excludeW2 = '*';
					}
					getContent($folder . $file . '/', $functions, $excludeC2, $excludeF2, $excludeU2, $excludeW2);
				}
			} else {
				if (substr($file, -4) === '.css' || substr($file, -5) === '.html' || substr($file, -3) === '.js' || substr($file, -5) === '.less' || substr($file, -4) === '.php' || substr($file, -4) === '.inc' || substr($file, -8) === '.eyecode') {
					$content = file_get_contents($folder . $file);
					
					// Clean
					if ($excludeC !== '*' && in_array($folder . $file, $excludeC) === false) {
						$length = strlen($content);
						if (substr($content, 0, 3) === chr(239) . chr(187) . chr(191)) {
							$content = substr($content, 3);
							$length = false;
						}
						$content = str_replace(array("\r\n", "\r"), "\n", trim($content), $count);
						if (strlen($content) !== $length || $count > 0) {
							file_put_contents($folder . $file, $content);
						}
					}
					
					// Functions
					if ((substr($file, -4) === '.php' || substr($file, -4) === '.inc' || substr($file, -8) === '.eyecode') && $excludeF !== '*' && in_array($folder . $file, $excludeF) === false) {
						if (substr($content, 0, 13) !== '<?php // utf8') {
							foreach (explode("\n", $content) as $key => $value) {
								if (strpos($value, '// utf8') === false) {
									preg_match_all('/\\W+(' . $functions . ')\\s*\\(/u', ' ' . $value, $matches);
									preg_match_all('/\\/\\* utf8 \\*\\/ (' . $functions . ')\\s*\\(/u', ' ' . $value, $temp);
									$list = array_filter($matches[1], 'filterFunctions');
									
									preg_match_all('/\\{\\d+\\}/u', $value, $matches);
									$list = array_merge($list, $matches[0]);
									
									if (count($list) > 0) {
										echo str_pad($folder . $file, 80) . ' line ' . str_pad(strval($key + 1), 4, ' ', STR_PAD_LEFT) . ' ' . implode(', ', $list) . "\n";
									}
								}
							}
						}
					}
					
					// UTF-8
					if ($excludeU !== '*' && in_array($folder . $file, $excludeU) === false) {
						if (function_exists('mb_detect_encoding') === true && mb_detect_encoding($content, 'UTF-8', true) === false) {
							echo str_pad($folder . $file, 80) . ' is probably ASCII' . "\n";
						}
					}
					
					// Whitespaces
					if ($excludeW !== '*' && in_array($folder . $file, $excludeW) === false) {
						foreach (explode("\n", $content) as $key => $value) {
							if (ltrim($value) !== '' && rtrim(substr($value, -1)) === '') {
								echo str_pad($folder . $file, 80) . ' line ' . str_pad(strval($key + 1), 4, ' ', STR_PAD_LEFT) . ' whitespaces at the line\'s end' . "\n";
							}
						}
						while (strpos($content, '/*') !== false) {
							$begin = strpos($content, '/*');
							$end = strpos($content, '*/', $begin) + 2;
							if ($end === false) {
								$end = strlen($content);
							}
							$lines = str_pad('', substr_count($content, "\n", $begin, $end - $begin), "\n");
							$content = substr($content, 0, $begin) . '|' . $lines . substr($content, $end);
						}
						foreach (explode("\n", $content) as $key => $value) {
							if (strpos($value, '  ') !== false) {
								// TODO: echo str_pad($folder . $file, 80) . ' line ' . str_pad(strval($key + 1), 4, ' ', STR_PAD_LEFT) . ' doubled whitespaces' . "\n";
							}
						}
					}
				}
			}
		}
	}
}

function filterFunctions($value) {
	global $temp;
	
	if (in_array($value, $temp[1]) === true) {
		unset($temp[1][array_search($value, $temp[1])]);
		return false;
	}
	return true;
}
?>