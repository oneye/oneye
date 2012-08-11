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
define('INDEX_TYPE','browser');

//start output buffering.
ob_start();

if(!defined('EYE_INDEX')){
	//Maybe a redirection here?
	include_once('../index.php');
}

//if there are a shorturl in the url, like index.php/file
if(isset($_SERVER['PATH_INFO'])) {
	$myInfo = $_SERVER['PATH_INFO'];
	if ( /* utf8 */ substr($myInfo, 0, 1) === '/') {
		$myInfo = substr($myInfo, 1, strlen($myInfo)); // utf8
	}
} else {
	$myInfo="";
}

//Check if index.php is being used to load images/files from extern directory
if (isset($_GET['extern'])) {
		$myExtern = $_GET['extern'];
		//get the type for the header content-type
		if(isset($_GET['type'])) {
			$type = $_GET['type'];
		} else {
			$type = "";
		}
		//call to extern to throw the file
		//Only start session if we already have a session (keep in mind that extern doesn't have session)
		eyeSessions('checkAndSstartSession');
		extern('getFile', array($myExtern, $type), 1);
} elseif(isset($_GET['api'])) {
	require_once(EYE_ROOT.'/xml-rpc/server.eyecode');
	xmlrpc_parseRequest();
} else {
	//Loading eyeWidgets definitions
	eyeWidgets('loadWidgets');

	//Starting a simple session
	eyeSessions('startSession');

	//If widget table does not exist, create it
	eyeWidgets('checkTable');

	//if a shorturl is present
	if(!empty($myInfo)) {
		//check if the shorturl exists, and get the msg and checknum associated to it
		if(is_array($_SESSION['shortUrls'][$myInfo])) {
			$msg = $_SESSION['shortUrls'][$myInfo]['msg'];
			$checknum = $_SESSION['shortUrls'][$myInfo]['checknum'];
			$_GET['msg'] = $msg;
			$_REQUEST['msg'] = $msg;
			$_GET['checknum'] = $checknum;
			$_REQUEST['checknum'] = $checknum;
		}
	}
	
	/*
	 * [START] URL LOGIN
	 * Copyright © 2012 Lars Knickrehm
	 *
	 * index.php?username=&password=&language=[auto]
	 */
	if (isset($_REQUEST['username']) === true && isset($_REQUEST['password']) === true) {
		if (!proc('findPidByName', array('eyeDesk'))) {
			$_SESSION['username'] = $_REQUEST['username'];
			$_SESSION['password'] = $_REQUEST['password'];
			if (isset($_REQUEST['language']) === true) {
				$_SESSION['language'] = $_REQUEST['language'];
			} else {
				$_SESSION['language'] = '[auto]';
			}
		}
		
		$protocol = substr($_SERVER['SERVER_PROTOCOL'], 0, strpos($_SERVER['SERVER_PROTOCOL'], '/')); // utf8
		$location = /* utf8 */ strtolower($protocol) . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'];
		
		header('Location: ' . $location);
		exit;
	}
	/*
	 * URL LOGIN [END]
	 */
	
	//Checking if checknum and message are set
	if(isset($_GET['checknum']) && !empty($_GET['checknum'])) {
		if(isset($_REQUEST['params']) && !empty($_REQUEST['params'])) {
			$params = $_REQUEST['params'];
		} else {
			$params = null;
		}
		if(isset($_GET['msg'])) {
			$msg = $_GET['msg'];
		} else {
			$msg = null;
		}
		$array_msg = array($_GET['checknum'],$msg,$params);
		echo mmap('routemsg', $array_msg);
		$_SESSION['ping'] = time();
	} else {
		//if a ping response is received
		if(isset($_GET['msg']) && $_GET['msg'] == 'ping') {
			//throw a pong!
			header("Content-type:text/xml");//override header type
			echo "<eyeMessage><action><task>pong</task></action></eyeMessage>";
			$_SESSION['ping'] = time();
			exit;
		}
		//Loading the default application (usually Login App)
		include_once(EYE_ROOT.'/'.SYSTEM_DIR.'/'.KERNEL_DIR.'/init'.EYE_CODE_EXTENSION);
	}
}
?>