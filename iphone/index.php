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

/*
*This defines are different between indexes
*/
define('INDEX_TYPE','iphone');
if(!defined('EYE_INDEX')){
	//Maybe a redirection here?
	include_once('../index.php');
}

define('IPHONE_PATH','../iphone/');

session_start();

include_once(IPHONE_PATH.'lib/message.eyecode');

if(isset($_SESSION['auth']) && $_SESSION['auth'] == 1) {
	global $currentUser;
	$currentUser = $_SESSION['user'];
}
if(!isset($_GET['action'])) {
	require_once(IPHONE_PATH.'top.eyecode');
	if(isset($_SESSION['auth']) && $_SESSION['auth'] == 1) {
		require_once(IPHONE_PATH.'apps/eyeMenu/app.eyecode');
		eyeMenu_execute();
	} else {
		require_once(IPHONE_PATH.'apps/login/app.eyecode');
		login_execute();
	}
	require_once(IPHONE_PATH.'bottom.eyecode');
} else {
	if(!isset($_SESSION['auth']) || $_SESSION['auth'] == 0) {
		require_once(IPHONE_PATH.'top.eyecode');
		if ($_GET['action']=='login' && $_GET['do']=='login') {
			require_once(IPHONE_PATH.'apps/login/events.eyecode');
			call_user_func('login_login');
		} else {
			require_once(IPHONE_PATH.'apps/login/app.eyecode');
			login_execute();
		}
		require_once(IPHONE_PATH.'bottom.eyecode');
	} else {
		$action = basename($_GET['action']);
		if (isset($_GET['noPropagate']) && $_GET['noPropagate']== 2) {
			require_once(IPHONE_PATH.'top_back.eyecode');
		}
		if(file_exists(IPHONE_PATH.'apps/'.$action.'/app.eyecode')) {
			if(!isset($_GET['do'])) {
				require_once(IPHONE_PATH.'apps/'.$action.'/app.eyecode');
				call_user_func($action.'_execute');
			} else {
				$func = basename($_GET['do']);
				require_once(IPHONE_PATH.'apps/'.$action.'/events.eyecode');
				if(function_exists($action.'_'.$func)) {
					call_user_func($action.'_'.$func);
				} else {
					msgIphone(array('title' => 'Error', 'content' => 'Undefined Error'));
				}
			}
		} else {
			require_once(IPHONE_PATH.'404.eyecode');
		}
		if(isset($_GET['noPropagate']) && $_GET['noPropagate']== 2) {
			require_once(IPHONE_PATH.'bottom.eyecode');
		}
	}
}
?>