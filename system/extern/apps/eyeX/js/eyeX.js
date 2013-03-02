/*global Base64, DOMParser, htmlspecialchars, localEngine, oApps, oCursor, tinyMCE, USERTHEME, xAddEventListener, xEnableDrag2, xEvent, xGetElementById, xHeight, xRemoveEventListener, xShow, xTop, xWidth, xZIndex */
/*jslint browser: true, devel: true, newcap: true, sloppy: true, todo: true, windows: true */
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
 * VARIABLES
 */

var eyeKeyDown = 0;
var IEversion = 0;
var isEyeCursorActivated = false;
var loadingRequests = 0;
var messageBoxDirection = 0;
var mouseX = 0;
var mouseY = 0;
var sendMsg_active = false;
var sendMsg_list = [];
var TimeViewClock = 2000;
var zindex = 100;
var zLayers = 11; // One more than eyeApps (default and base layer for all apps)

/*
 * DETECTIONS
 */

if (navigator.appVersion.indexOf("MSIE") !== -1) {
	IEversion = parseFloat(navigator.appVersion.split('MSIE')[1]);
}

// TRUE if the client is a touch device, FALSE if the client is a mouse-only (!) device
var touchscreen = (typeof window.ontouchstart !== 'undefined');

var android = 0;
var ios = 0;
var windows_phone = 0;
if (navigator.userAgent.match(/Android/i)) {
	var android = 1;
} else if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPod/i)) {
	var ios = 1;
} else if (navigator.userAgent.match(/Windows Phone/i)) {
	var windows_phone = 1;
}

// TRUE if the browser supports the HTML5 audio tag and the Ogg audio codec, FALSE otherwise
var OggVorbisAudioSupported = (function () {
	var myAudio = document.createElement('audio');
	if (typeof myAudio.canPlayType === "function" && myAudio.canPlayType('audio/ogg; codecs="vorbis"') !== "") {
		return true;
	}
	return false;
}());

/*
 * INITIALIZE
 */

document.oncontextmenu = function (e) {
	if (!IEversion) {
		e.preventDefault();
		e.cancelBubble = true;
	}
	return false;
};

document.onkeydown = function (e) {
	e = new xEvent(e);
	if (e.which) {
		eyeKeyDown = e.which;
	} else {
		eyeKeyDown = e.keyCode;
	}
};

document.onkeyup = function () {
	eyeKeyDown = 0;
};

if (navigator.appVersion.indexOf("Mac") !== -1) {
	document.onmousemove = function (e) {
		if (IEversion && IEversion < 8) {
			mouseX = e.clientX + document.body.scrollLeft;
			mouseY = e.clientY + document.body.scrollTop;
		} else {
			mouseX = e.pageX;
			mouseY = e.pageY;
		}
		if (typeof oCursor !== 'undefined' && loadingRequests > 0) {
			oCursor.style.left = mouseX + 10 + 'px';
			oCursor.style.top = mouseY - 14 + 'px';
		}
	};
}

/*
 * UTILITIES
 */

function checkEnterKey(e) {
	var characterCode;
	if (e.which) {
		characterCode = e.which;
	} else {
		characterCode = e.keyCode;
	}
	if (characterCode === 13) {
		return true;
	}
	return false;
}

// Workaround for buggy navigator.cookieEnabled behaviour in some browsers
function cookieEnabled() {
	if (typeof navigator.cookieEnabled === 'boolean' && navigator.cookieEnabled) {
		return navigator.cookieEnabled;
	}
	var cookieNumber = 0;
	while (document.cookie.indexOf('cookieEnabled-' + cookieNumber) !== -1) {
		cookieNumber += 1;
	}
	document.cookie = 'cookieEnabled-' + cookieNumber;
	if (document.cookie.indexOf('cookieEnabled-' + cookieNumber) !== -1) {
		return true;
	}
	return false;
}

/*jslint evil: true */
function evilEval(content) {
	return eval(content);
}
/*jslint evil: false */

// Add param to xml
function eyeParam(name, value, nocode) {
	name = String(name);
	value = String(value);
	if (!nocode) {
		name = htmlspecialchars(name);
		value = htmlspecialchars(value);
	}
	return '<' + name + '>' + value + '</' + name + '>';
}

// Fixes transparent PNG images in Internet Explorer 6
function fixPNG(myImage, type) {
	if (IEversion && IEversion < 7) {
		if (!myImage.src) {
			myImage = xGetElementById(myImage);
		}
		if (myImage.src.substr(myImage.src.length - 4).toLowerCase() === '.png' && myImage.src.substr(myImage.src.length - 24).toLowerCase() !== 'apps/eyex/gfx/spacer.gif') {
			if (!type) {
				type = 'scale';
			}
			myImage.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + myImage.src + "', sizingMethod='" + type + "')";
			myImage.src = 'index.php?extern=apps/eyeX/gfx/spacer.gif';
		}
	}
}

function getArrayArg(arg) {
	var i, last, myRet, ret, temp, x;
	ret = arg.split('""');
	for (i = 0; i < ret.length; i += 1) {
		temp = ret[i].replace(/\\\"/, '"');
		temp = temp.replace(/\\\'/, "'");
		last = ret[i];
		while (temp !== last) {
			last = temp;
			temp = temp.replace(/\\\"/, '"');
			temp = temp.replace(/\\\'/, "'");
		}
		ret[i] = temp;
	}
	myRet = [];
	i = 0;
	for (x in ret) {
		if (ret.hasOwnProperty(x)) {
			myRet[i] = ret[x];
			i += 1;
		}
	}
	return myRet;
}

// tty stuff
function printToTty(tty, text) {
	var oTty = document.getElementById(tty + '_tty');

	if (!oTty) {
		return false;
	}
	if (oTty.tagName === 'DIV') {
		oTty.appendChild(document.createTextNode(text));
		oTty.appendChild(document.createElement('br'));
	} else if (oTty.tagName === 'INPUT') {
		oTty.value += text;
		oTty.value += "\n";
	}
}

function raiseZIndex(value) {
	zindex += value;
	return zindex;
}

function setWallpaper(newWllp, repeat, center, color) {
	var wllp = document.getElementById('eyeWallpaper');

	wllp.style.backgroundImage = "url('" + newWllp + "')";

	if (parseInt(repeat, 10)) {
		wllp.style.backgroundRepeat = "repeat";
	} else {
		wllp.style.backgroundRepeat = "no-repeat";
	}

	if (!center) {
		wllp.style.backgroundPosition = "left top";
	} else {
		wllp.style.backgroundPosition = "center";
	}

	if (color) {
		wllp.style.backgroundColor = color;
	} else {
		wllp.style.backgroundColor = 'transparent';
	}
}

// Taken from TinyMCE 2 for compatibility with our widgets.
tinyMCE.entityDecode = function (s) {
	var e = document.createElement('div');
	e.innerHTML = s;
	return !e.firstChild ? s : e.firstChild.nodeValue;
};

// Changes the opacity from init to end in time and calls callback
function updateOpacity(id, init, end, time, callback) {
	var count, i;
	time = Math.round(time / 100);
	count = 0;

	if (init > end) {
		for (i = init; i >= end; i -= 1) {
			setTimeout("updateOpacityOnce(" + i + ", '" + id + "');", count * time);
			count += 1;
		}
		if (callback) {
			setTimeout(callback, count * time);
		}
	} else if (init < end) {
		for (i = init; i <= end; i += 1) {
			setTimeout("updateOpacityOnce(" + i + ", '" + id + "');", count * time);
			count += 1;
		}
		if (callback) {
			setTimeout(callback, count * time);
		}
	}
}

// Fixes opacity compatibility for all browsers.
function updateOpacityOnce(opacity, id) {
	var object = xGetElementById(id);
	object.style.opacity = opacity / 100;
	object.style.filter = "alpha(opacity=" + opacity + ")";
	if (!opacity) {
		object.style.display = "none";
	} else {
		if (object.style.display === "none") {
			object.style.display = "block";
		}
	}
}

/*
 * EVENTS HANDLING
 */

var EventHandler = {
	List: {},
	LastEvent: 0,

	HandleEvent: function (e) {
		var element, friend, isfriend, t;
		e = new xEvent(e);
		EventHandler.LastEvent = e;
		isfriend = 0;
		for (element in EventHandler.List[e.type]) {
			if (EventHandler.List[e.type].hasOwnProperty(element)) {
				if (element !== e.target.id && EventHandler.List[e.type][element]) {
					if (EventHandler.List[e.type][element].option) {
						t = e.target.parentNode;
						while (!isfriend && t) {
							if (element === t.id) {
								isfriend = 1;
							} else {
								t = t.parentNode;
							}
						}
					}
					if (!isfriend) {
						for (friend in EventHandler.List[e.type][element].friends) {
							if (EventHandler.List[e.type][element].friends[friend] === e.target.id) {
								isfriend = 1;
							}
						}
					}
					if (EventHandler.List[e.type][element]['function']) {
						isfriend = EventHandler.List[e.type][element]['function'](e, isfriend);
					}
					if (!isfriend) {
						evilEval(EventHandler.List[e.type][element].code);
					}
					isfriend = 0;
				}
			}
		}
	},

	Add: function (handler, element, code, option, func) {
		if (typeof EventHandler.List[handler] !== 'object') {
			EventHandler.List[handler] = {};
			xAddEventListener(document, handler, EventHandler.HandleEvent, false);
		}
		if (typeof EventHandler.List[handler][element] !== 'object') {
			EventHandler.List[handler][element] = {};
			EventHandler.List[handler][element].friends = [];
		}
		EventHandler.List[handler][element].code = code;
		if (typeof option !== 'undefined') {
			EventHandler.List[handler][element].option = option;
		}
		if (typeof func !== 'undefined') {
			EventHandler.List[handler][element]['function'] = func;
		}
	},

	AddFriend: function (handler, element, friend) {
		if (EventHandler.List[handler] && EventHandler.List[handler][element]) {
			EventHandler.List[handler][element].friends.push(friend);
		}
	},

	Remove: function (handler, element) {
		if (EventHandler.List[handler] && EventHandler.List[handler][element]) {
			xRemoveEventListener(document, handler, EventHandler.HandleEvent, false);
			EventHandler.List[handler][element] = 0;
		}
	},

	RemoveFriend: function (handler, element, friend) {
		var f;
		for (f = 0; f < EventHandler.List[handler][element].friends.length; f += 1) {
			if (EventHandler.List[handler][element].friends[f] === friend) {
				EventHandler.List[handler][element].friends[f] = 0;
				return;
			}
		}
	}
};

function addClickHandler(element, code) {
	EventHandler.Add('click', element, code);
}

function addFriendClick(element, friend) {
	EventHandler.AddFriend('click', element, friend);
}

function delClickHandler(element) {
	EventHandler.Remove('click', element);
}

/*
 * LOADING CURSOR
 */

function noviewLoading() {
	if (loadingRequests <= 0) {
		loadingRequests = 0;
		if (navigator.appVersion.indexOf("Mac") !== -1) {
			oCursor.style.display = 'none';
		} else {
			oApps.style.cursor = 'auto';
		}
	}
	return true;
}

// This function is called by the localEngine() function. It makes the "loading" cursor disappear if the request was the last one waiting and decreases the number of loading request by one
function notifyEndOfLoadingRequest() {
	if (!ios && !android && !windows_phone) {
		loadingRequests -= 1;
		noviewLoading();
	}
	return true;
}

// Here is the "loading" special cursor that informs the user that a request has been sent and is processed by the server
function viewLoading() {
	if (navigator.appVersion.indexOf("Mac") !== -1) {
		oCursor.style.top = mouseY - 14 + 'px';
		oCursor.style.left = mouseX + 10 + 'px';
		oCursor.style.display = 'block';
	} else {
		oApps.style.cursor = 'url(index.php?theme=' + USERTHEME + '&extern=images/desktop/loadingcursor/loading.cur), wait';
	}
	return true;
}

// This function is called by the sendMsg() function. It makes the "loading" cursor appear and increase the number of loading request by one
function notifyLoadingRequest() {
	if (!ios && !android && !windows_phone) {
		loadingRequests += 1;
		var ctime = setTimeout(viewLoading, TimeViewClock);
		return ctime;
	}
	return true;
}

// This function can be used to force the "loading" cursor to reset and hide it
function resetLoadingRequests() {
	if (!ios && !android && !windows_phone) {
		loadingRequests = 0;
		viewLoading();
	}
	return true;
}

/*
 * SCRIPTS AND STYLES
 */

// Load css dynamically
function dhtmlLoadCSS(url, id) {
	var oLink = document.createElement("link");
	oLink.setAttribute("href", url);
	oLink.setAttribute("rel", "stylesheet");
	oLink.setAttribute("type", "text/css");
	oLink.setAttribute("id", id);
	document.getElementsByTagName("head")[0].appendChild(oLink);
}

// Load script dynamically
function dhtmlLoadScript(url) {
	var e = document.createElement("script");
	e.src = url;
	e.type = "text/javascript";
	document.getElementsByTagName("head")[0].appendChild(e);
}

// Remove css dynamically
function dhtmlRemoveCSS(remid) {
	var oLink = document.getElementById(remid);
	if (oLink) {
		document.getElementsByTagName("head")[0].removeChild(oLink);
	}
}

function getNodeValue(node) {
	if (!node) {
		return '';
	}
	if (typeof node.textContent !== 'undefined') {
		return node.textContent;
	}
	return node.firstChild.nodeValue;
}

function updateCss(widgetid, prop, val) {
	document.getElementById(widgetid).style[prop] = val;
}

/*
 * LAYERS
 */

function createLayer(name, father, layerClass) {
	var divFather, myLayer;
	myLayer = document.createElement('div');
	myLayer.setAttribute("id", name);
	myLayer.className = layerClass;
	myLayer.style.display = 'none';
	divFather = document.getElementById(father);
	divFather.appendChild(myLayer);
}

function fadeInLayer(layerId, startAlpha, endAlpha, time) {
	var callback, myLayer;
	myLayer = document.getElementById(layerId);
	if (myLayer) {
		//fadein alpha and then call hideLayer for set zindex etc
		callback = 'hideLayer("' + layerId + '");';//Totaly hide  put tis optional? maybe
		updateOpacity(layerId, startAlpha, endAlpha, time, callback);
	}
}

function fadeOutLayer(layerId, startAlpha, endAlpha, time) {
	var myLayer = document.getElementById(layerId);
	if (myLayer) {
		updateOpacityOnce(0, layerId);
		myLayer.style.display = 'block';
		//Up to layers
		xZIndex(myLayer, zLayers);
		zLayers += 1;
		updateOpacity(layerId, startAlpha, endAlpha, time, '');
	}
}

function hideLayer(layerId) {
	var myLayer = document.getElementById(layerId);
	if (myLayer) {
		myLayer.style.display = 'none';
		xZIndex(myLayer, 1);//1 is because the minim of zLayer is 10.
	}
}

function removeLayer(divid) {
	var div, father;
	father = document.getElementById('eyeScreen');//Hardcoded because all layer are child of eyeScreen
	div = document.getElementById(divid);
	if (father && div) {
		father.removeChild(div);
	}
}

function showLayer(layerId) {
	var myLayer = document.getElementById(layerId);
	if (myLayer) {
		myLayer.style.display = 'block';
		xZIndex(myLayer, zLayers);
		zLayers += 1;
	}
}

/*
 * MESSAGE BOXES
 */

function eyeMessageBoxHid(i) {
	if (!IEversion && document.getElementById("eyeMessageBox_" + i).style.opacity) {
		updateOpacity("eyeMessageBox_" + i, 100, 0, 1000, function () {
			document.getElementById('eyeScreen').removeChild(document.getElementById('eyeMessageBox_' + i));
		});
	} else {
		document.getElementById('eyeScreen').removeChild(document.getElementById("eyeMessageBox_" + i));
	}
}

function eyeMessageBoxShow(msg) {
	var box, i, last, theMsg;
	if (msg) {

		i = 0;

		while (document.getElementById('eyeMessageBox_' + i)) {
			i += 1;
		}

		box = document.createElement('div');
		box.setAttribute('id', 'eyeMessageBox_' + i);
		box.className = 'eyeMessageBox';

		if (i > 0) {
			last = document.getElementById('eyeMessageBox_' + (i - 1));
			if (!messageBoxDirection) {
				box.style.top = xTop(last) - xHeight(last) + 20 + 'px';
			} else {
				box.style.top = xTop(last) + xHeight(last) + 20 + 'px';
			}
		}

		theMsg = document.createElement('div');
		theMsg.setAttribute('id', 'eyeMessageBoxText_' + i);
		theMsg.className = 'eyeMessageBoxText';

		theMsg.innerHTML = msg;

		box.appendChild(theMsg);
		document.getElementById('eyeScreen').appendChild(box);

		if (!IEversion) {
			updateOpacity("eyeMessageBox_" + i, 0, 100, 1000);
		} else {
			document.getElementById("eyeMessageBox_" + i).style.visibility = 'visible';
		}
		setTimeout("eyeMessageBoxHid(" + i + ")", 2000);
	}
}

/*
 * WIDGETS
 */

function getParentWidgetType(widget, widgetType) {
	if (!widget.parentNode) {
		return false;
	}
	var widgetParent = widget.parentNode;
	while (true) {
		if (widgetParent.widgetType === widgetType) {
			return widgetParent;
		}
		if (!widgetParent.parentNode) {
			return false;
		}
		widgetParent = widgetParent.parentNode;
	}
}

function makeDrag(widgetid, father, afterfunction, checknum, content, noIndex) {
	var firstX, firstY, widget;
	widget = xGetElementById(widgetid);
	if (!widget) {
		return false;
	}
	if (!noIndex) {
		widget.onmousedown = function () {
			xZIndex(widget, zindex);
			raiseZIndex(1);
		};
	}
	firstX = 0;
	firstY = 0;

	function savePositions(e, x, y) {
		firstX = x;
		firstY = y;
	}

	function callafterfunction(e, x, y) {
		if (afterfunction) {
			var contentid = '';
			if (content) {
				contentid = ",'" + content + "'";
			}
			evilEval(afterfunction + "('" + widgetid + "'," + firstX + ',' + firstY + ',' + x + ',' + y + ",'" + checknum + "'" + contentid + ');');
		}
	}

	xEnableDrag2(widgetid, savePositions, null, callafterfunction, father);
	xShow(widget);
}

function removeWidget(widgetid) {
	var widget = xGetElementById(widgetid);
	if (widget) {
		widget.parentNode.removeChild(widget);
	}
}

function setWidgetPos(widget, father, horiz, vert, x, y, cent) {
	widget = xGetElementById(widget);
	father = xGetElementById(father);
	if (!widget || !father) {
		return false;
	}
	cent = parseInt(cent, 10);
	if (cent === 1 || cent === 2) {
		x = parseInt(x, 10) + (xWidth(father) - xWidth(widget)) / 2;
	} else if (cent === 4 || cent === 5) {
		x = parseInt(x, 10) + xWidth(father) / 2;
	}
	horiz = parseInt(horiz, 10);
	if (!isNaN(x) && x >= 0) {
		if (horiz === 1) {
			widget.style.right = String(parseInt(x, 10)) + 'px';
		} else {
			widget.style.left = String(parseInt(x, 10)) + 'px';
		}
	}

	if (cent === 1 || cent === 3) {
		y = parseInt(y, 10) + (xHeight(father) - xHeight(widget)) / 2;
	} else if (cent === 4 || cent === 6) {
		y = parseInt(y, 10) + xHeight(father) / 2;
	}
	vert = parseInt(vert, 10);
	if (!isNaN(y) && y >= 0) {
		if (vert === 1) {
			widget.style.bottom = String(parseInt(y, 10)) + 'px';
		} else {
			widget.style.top = String(parseInt(y, 10)) + 'px';
		}
	}
	return widget;
}

function createWidget(widgetid, fatherid, content, horiz, vert, x, y, width, height, className, cent, unit, visible, widgetType) {
	var father, widget;
	if (document.getElementById(widgetid)) {
		try {
			console.log(widgetid + ' already exists.');
		} catch (err) {}
		return false;
	}
	father = document.getElementById(fatherid);
	if (!father) {
		try {
			console.log(fatherid + ' does not exist.');
		} catch (error) {}
		return false;
	}
	if (!unit) {
		unit = 'px';
	}

	widget = document.createElement('div');
	widget.setAttribute('id', widgetid);
	father.appendChild(widget);
	if (content) {
		widget.appendChild(content);
	}
	if (className) {
		widget.className = className;
	}
	if (visible === 0) {
		widget.style.display = 'none';
	} else {
		widget.style.display = 'block';
	}
	if (parseInt(height, 10) > 0) {
		widget.style.height = String(parseInt(height, 10)) + unit;
	}
	if (parseInt(width, 10) > 0) {
		widget.style.width = String(parseInt(width, 10)) + unit;
	}
	widget.style.position = 'absolute';
	widget.widgetType = widgetType;
	return setWidgetPos(widget, father, horiz, vert, x, y, cent);
}

/*
 * SYSTEM
 */

// sendMsg is a ajax wrapper, send request to index.php with App checknum mgs and params (optional)
function sendMsg(checknum, msg, parameters) {
	var ctime, http_request, url;
	if (sendMsg_active === true) {
		sendMsg_list.push([checknum, msg, parameters]);
		return true;
	}
	sendMsg_active = true;
	http_request = false;
	url = 'index.php';
	if (window.XMLHttpRequest) {
		http_request = new XMLHttpRequest();
	} else if (window.ActiveXObject && ActiveXObject) {
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (err) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (error) {}
		}
	}
	if (!http_request) {
		alert('Sorry, but oneye only works with AJAX capable browsers!');
		return false;
	}
	if (msg !== 'ping') {
		ctime = notifyLoadingRequest();
	}
	http_request.onreadystatechange = function () {
		if (http_request.readyState === 4) {
			var key, parser, xmlDoc;
			try {
				xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
				xmlDoc.async = "false";
				xmlDoc.loadXML(http_request.responseText);
			} catch (e) {
				parser = new DOMParser();
				parser.async = "false";
				xmlDoc = parser.parseFromString(http_request.responseText, "text/xml");
			}
			if (http_request.responseText !== '<eyeMessage><action><task>pong</task></action></eyeMessage>') {
				clearTimeout(ctime);
				localEngine(xmlDoc);
			}
			sendMsg_active = false;
			for (key in sendMsg_list) {
				if (sendMsg_list.hasOwnProperty(key)) {
					sendMsg.apply(this, sendMsg_list[key]);
					delete sendMsg_list[key];
					return;
				}
			}
		}
	};
	http_request.open('POST', url + '?checknum=' + checknum + '&msg=' + msg, true);
	http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;');
	http_request.send('params=' + encodeURIComponent(parameters));
}

// Parses the sendMsg response.
function localEngine(msg) {
	var actions, args, cent, center, checknum, color, content, count, divFather, endAlpha, event, father, func, horiz, id, js, myCheck, myClass, myDiv, myMsg, myPar, mySize, name, noIndex, paramStr, position, prop, repeat, startAlpha, task, time, type, url, val, vert, widget, widgetname, x, y;
	//message is not set, could be an empty response to a request
	notifyEndOfLoadingRequest();
	if (msg.hasChildNodes()) {
		actions = msg.getElementsByTagName('action');
		if (!actions) {
			actions = msg.firstChild.childNodes;
		}
		mySize = actions.length;
		for (count = 0; count < mySize; count += 1) {
			try {
				task = getNodeValue(actions[count].getElementsByTagName('task')[0]);
				if (task === 'createWidget') {
					position = actions[count].getElementsByTagName('position')[0];
					x = getNodeValue(position.getElementsByTagName('x')[0]);
					y = getNodeValue(position.getElementsByTagName('y')[0]);
					horiz = getNodeValue(position.getElementsByTagName('horiz')[0]);
					vert = getNodeValue(position.getElementsByTagName('vert')[0]);
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					checknum = getNodeValue(actions[count].getElementsByTagName('checknum')[0]);
					father = getNodeValue(actions[count].getElementsByTagName('father')[0]);
					widgetname = getNodeValue(actions[count].getElementsByTagName('widgetname')[0]);
					cent = getNodeValue(actions[count].getElementsByTagName('cent')[0]);
					paramStr = getNodeValue(actions[count].getElementsByTagName('params')[0]);
					try {
						evilEval(widgetname + "_show(" + paramStr + ",'" + name + "','" + father + "','" + x + "','" + y + "','" + horiz + "','" + vert + "','" + checknum + "','" + cent + "');");
					} catch (e) {
						try {
							console.log('widget error: ' + e);
						} catch (er) {}
					}
				} else if (task === 'messageBox') {
					content = getNodeValue(actions[count].getElementsByTagName('content')[0]);
					content = tinyMCE.entityDecode(content);
					type = parseInt(getNodeValue(actions[count].getElementsByTagName('type')[0]), 10);
					if (!type || type === 1) {
						eyeMessageBoxShow(content);
					} else if (type === 2) {
						alert(content);
					}
				} else if (task === 'setValue') {
					content = getNodeValue(actions[count].getElementsByTagName('content')[0]);
					widget = getNodeValue(actions[count].getElementsByTagName('widget')[0]);
					if (document.getElementById(widget)) {
						document.getElementById(widget).value = content;
					}
				} else if (task === 'setValueB64') {
					content = getNodeValue(actions[count].getElementsByTagName('content')[0]);
					widget = getNodeValue(actions[count].getElementsByTagName('widget')[0]);
					if (document.getElementById(widget)) {
						document.getElementById(widget).value = Base64.decode(content);
					}
				} else if (task === 'concatValue') {
					content = getNodeValue(actions[count].getElementsByTagName('content')[0]);
					widget = getNodeValue(actions[count].getElementsByTagName('widget')[0]);
					if (document.getElementById(widget)) {
						document.getElementById(widget).value = document.getElementById(widget).value + content;
					}
				} else if (task === 'concatValueB64') {
					content = getNodeValue(actions[count].getElementsByTagName('content')[0]);
					widget = getNodeValue(actions[count].getElementsByTagName('widget')[0]);
					if (document.getElementById(widget)) {
						document.getElementById(widget).value = document.getElementById(widget).value + Base64.decode(content);
					}
				} else if (task === 'concatDiv') {
					content = getNodeValue(actions[count].getElementsByTagName('content')[0]);
					widget = getNodeValue(actions[count].getElementsByTagName('widget')[0]);
					if (document.getElementById(widget)) {
						document.getElementById(widget).innerHTML = document.getElementById(widget).innerHTML + content;
					}
				} else if (task === 'rawjs') {
					js = getNodeValue(actions[count].getElementsByTagName('js')[0]);
					js = js.replace(/\n/, "");
					js = js.replace(/\r/, "");
					evilEval(js);
				} else if (task === 'setDiv') {
					content = getNodeValue(actions[count].getElementsByTagName('content')[0]);
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					document.getElementById(name).innerHTML = content;
				} else if (task === 'loadScript') {
					url = getNodeValue(actions[count].getElementsByTagName('url')[0]);
					dhtmlLoadScript(url);
				} else if (task === 'loadCSS') {
					url = getNodeValue(actions[count].getElementsByTagName('url')[0]);
					id = getNodeValue(actions[count].getElementsByTagName('id')[0]);
					dhtmlLoadCSS(url, id);
				} else if (task === 'removeCSS') {
					id = getNodeValue(actions[count].getElementsByTagName('id')[0]);
					dhtmlRemoveCSS(id);
				} else if (task === 'removeWidget') {
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					removeWidget(name);
				} else if (task === 'createDiv') {
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					myClass = getNodeValue(actions[count].getElementsByTagName('class')[0]);
					father = getNodeValue(actions[count].getElementsByTagName('father')[0]);
					myDiv = document.createElement('div');
					myDiv.setAttribute("id", name);
					myDiv.className = myClass;
					divFather = document.getElementById(father);
					divFather.appendChild(myDiv);
				} else if (task === 'setWallpaper') {
					url = getNodeValue(actions[count].getElementsByTagName('url')[0]);
					repeat = getNodeValue(actions[count].getElementsByTagName('repeat')[0]);
					center = getNodeValue(actions[count].getElementsByTagName('center')[0]);
					color = getNodeValue(actions[count].getElementsByTagName('color')[0]);
					setWallpaper(url, repeat, center, color);
				} else if (task === 'updateCss') {
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					prop = getNodeValue(actions[count].getElementsByTagName('property')[0]);
					val = getNodeValue(actions[count].getElementsByTagName('value')[0]);
					updateCss(name, prop, val);
				} else if (task === 'makeDrag') {
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					father = getNodeValue(actions[count].getElementsByTagName('father')[0]);
					//We use try catch for evade the differents beteewn browsers
					try {
						noIndex = getNodeValue(actions[count].getElementsByTagName('noIndex')[0]);
						makeDrag(name, father, '', '', '', noIndex);
					} catch (err) {
						makeDrag(name, father, '', '', '', '');
					}
				} else if (task === 'rawSendMessage') {
					myMsg = getNodeValue(actions[count].getElementsByTagName('msg')[0]);
					if (actions[count].getElementsByTagName('par')[0].firstChild) {
						myPar = getNodeValue(actions[count].getElementsByTagName('par')[0]);
					} else {
						myPar = '';
					}
					myCheck = getNodeValue(actions[count].getElementsByTagName('checknum')[0]);
					sendMsg(myCheck, myMsg, myPar);
				} else if (task === 'addEvent') {
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					event = getNodeValue(actions[count].getElementsByTagName('event')[0]);
					func = getNodeValue(actions[count].getElementsByTagName('func')[0]);
					args = getNodeValue(actions[count].getElementsByTagName('args')[0]);
					if (!args || args === '0') {
						args = '';
					}
					evilEval('document.getElementById("' + name + '").' + event + ' = function (' + args + ') {' + func + '};');
				} else if (task === 'createLayer') {
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					myClass = getNodeValue(actions[count].getElementsByTagName('class')[0]);
					father = getNodeValue(actions[count].getElementsByTagName('father')[0]);
					createLayer(name, father, myClass);
				} else if (task === 'removeLayer') {
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					removeLayer(name);
				} else if (task === 'showLayer') {
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					showLayer(name);
				} else if (task === 'hideLayer') {
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					hideLayer(name);
				} else if (task === 'fadeOutLayer') {
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					time = getNodeValue(actions[count].getElementsByTagName('time')[0]);
					startAlpha = getNodeValue(actions[count].getElementsByTagName('startAlpha')[0]);
					endAlpha = getNodeValue(actions[count].getElementsByTagName('endAlpha')[0]);
					fadeOutLayer(name, startAlpha, endAlpha, time);
				} else if (task === 'fadeInLayer') {
					name = getNodeValue(actions[count].getElementsByTagName('name')[0]);
					time = getNodeValue(actions[count].getElementsByTagName('time')[0]);
					startAlpha = getNodeValue(actions[count].getElementsByTagName('startAlpha')[0]);
					endAlpha = getNodeValue(actions[count].getElementsByTagName('endAlpha')[0]);
					fadeInLayer(name, startAlpha, endAlpha, time);
				}
			} catch (erro) {
				try {
					console.log('Response error: ' + erro);
				} catch (error) {}
			}
		}
	}
}