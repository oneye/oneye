/*
 *  Slimey - SLIdeshow Microformat Editor - http://slimey.sourceforge.net
 *  Copyright (C) 2007 - 2008 Ignacio de Soto
 *
 *  Common utility functions
 */

/**
 *  cancels event propagation
 */
function stopPropagation(e) {
	if (!e) e = window.event;
	e.cancelBubble = true;
	if (e.stopPropagation) {
		e.stopPropagation();
	}
}

/**
 *  convenience function that returns the number on a percental value (removes the '%' sign)
 *  	val: value to be converted (e.g. 57% returns 57)
 */
function getPercentValue(val) {
	return parseInt(val.substring(0, val.length - 1));
}

/**
 *  returns the client area as size.w and size.h
 */
function getClientArea(frame) {
	var size = { w:0, h:0 };

	if (frame.innerHeight) {
		size.w = frame.innerWidth;
		size.h = frame.innerHeight;
	} else if (frame.document.documentElement.clientHeight) {
		size.w = frame.document.documentElement.clientWidth;
		size.h = frame.document.documentElement.clientHeight;
	} else if (frame.document.body.clientHeight) {
		size.w = frame.document.body.clientWidth;
		size.h = frame.document.body.clientHeight;
	}

	return size;
}

/**
 *  returns the mouse position from an event as pos.x and pos.y
 *  	e: a javascript mouse event
 *  	ref: (optional) mouse coordinates are given relative to this element (default: window)
 */
function getMousePosition(e, ref) {
	var pos = { x:0, y:0 };

	if (e.pageX || e.pageY) {
		pos.x = e.pageX;
		pos.y = e.pageY;
	}
	else if (e.clientX || e.clientY) {
		pos.x = e.clientX + document.body.scrollLeft
			+ document.documentElement.scrollLeft;
		pos.y = e.clientY + document.body.scrollTop
			+ document.documentElement.scrollTop;
	}
	if (ref) {
		/* we subtract the element's position on the screen to get the mouse position relative to the element */
		var offset = getOffsetPosition(ref);
		pos.x -= offset.x;
		pos.y -= offset.y;
	}
	return pos;
}

/**
 *  gets the objects actual position relative to the window.
 *  	elem: element for which to calculate its offset position
 */
function getOffsetPosition(elem) {
	var pos = { x:0, y:0 };
	while (elem.offsetParent) {
		pos.x += elem.offsetLeft;
		pos.y += elem.offsetTop;
		elem = elem.offsetParent;
	}
	return pos;
}

/**
 *  sets an event handler to an element, removing any previous handlers for the event
 *  	elem: element to which to set the event handler (e.g. document)
 *  	ev: event to handle (e.g. mousedown)
 *  	func: function that will handle the event
 */
function setEventHandler(elem, ev, func) {
	elem[ev + "Count"] = 0;
	elem["on" + ev] = func;
}

/**
 *  adds an event handler to an element, keeping the current event handlers.
 *  	elem: element to which to add the event handler (e.g. document)
 *  	ev: event to handle (e.g. mousedown)
 *  	fun: function that will handle the event
 *  	scope: (optional) on which object to run the function
 */
function addEventHandler(elem, ev, fun, scope) {
	if (scope) {
		var func = function(e) {
			fun.call(scope, e);
		};
	} else {
		var func = fun;
	}
	if (elem[ev + "Count"]) {
		elem[ev + elem[ev + "Count"]++] = func;
	} else {
		elem[ev + "Count"] = 0;
		if (typeof elem["on" + ev] == 'function') {
			elem[ev + elem[ev + "Count"]++] = elem["on" + ev];
		}
		elem[ev + elem[ev + "Count"]++] = func;
		elem["on" + ev] = function(event) {
			for (var i=0; i < elem[ev + "Count"]; i++) {
				elem[ev + i](event);
			}
		};
	}
}

/**
 *  returns document.getElementById(id);
 *  	id: id of the element
 *		container: (optional) where to search (default: document.body)
 *  	frame: (optional) frame where the element is (default: window)
 */
function $(id, container, frame) {
	if (!frame) frame = window;
	if (!container) container = document.body;

	return frame.document.getElementById(id);
}

/**
 *  escapes the &, <, >, " and ' characters from a SLIM string
 */
function escapeSLIM(rawSLIM) {
	return encodeURIComponent(rawSLIM);
}

/**
 *  unescapes the &, <, >, " and ' characters from an escaped SLIM string
 */
function unescapeSLIM(encodedSLIM) {
	return decodeURIComponent(encodedSLIM);
}

// Colors picker

function chooseColor(func, scope, button) {


	var div = document.createElement('div');

	div.className = 'divcolor';
	div.id = 'divcolor';

	div.scope = scope;
	div.style.marginLeft = '484px';
	div.style.marginTop = '90px';
	div.style.zIndex = '1000000';

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#85c329' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#85c329');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#3bb000' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#3bb000');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#c90404' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#c90404');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#000097' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#000097');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ff6600' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ff6600');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#0000ff' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#0000ff');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ffbf23' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ffbf23');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#c9e5fc' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#c9e5fc');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#b3a7a0' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#b3a7a0');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ccdddd' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ccdddd');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#339933' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#339933');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#4f789f' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#4f789f');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#c9f2ba' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#c9f2ba');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#84c984' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#84c984');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#cde8fb' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#cde8fb');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#172973' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#172973');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#000000' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#000000');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ff6600' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ff6600');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#003366' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#003366');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ff0084' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ff0084');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#0063dc' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#0063dc');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ff0033' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ff0033');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#efba00' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#efba00');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#007d08' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#007d08');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#1845ad' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#1845ad');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ffffff' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ffffff');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#df7417' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#df7417');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#fdf801' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#fdf801');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#859c0e' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#859c0e');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#327ebe' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#327ebe');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#d20039' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#d20039');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#91998e' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#91998e');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#554d49' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#554d49');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#7f7772' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#7f7772');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#a4b6c8' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#a4b6c8');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#247fe6' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#247fe6');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#002e92' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#002e92');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ff9523' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ff9523');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ac0481' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ac0481');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#d4dded' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#d4dded');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#9a9a9a' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#9a9a9a');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#f677c4' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#f677c4');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#128f35' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#128f35');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#cc0000' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#cc0000');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#3b3b3b' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#3b3b3b');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#74c343' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#74c343');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#efefef' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#efefef');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#feec30' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#feec30');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ffff30' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ffff30');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#1777b1' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#1777b1');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#f5e1cd' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#f5e1cd');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#cc6600' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#cc6600');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ddeeff' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ddeeff');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ff12ff' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ff12ff');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#4f9cef' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#4f9cef');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#7cd300' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#7cd300');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#006666' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#006666');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#cccccc' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#cccccc');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#71ab6b' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#71ab6b');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#feedb7' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#feedb7');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#0aaafd' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#0aaafd');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#05386b' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#05386b');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#f1f6ff' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#f1f6ff');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ff6c17' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ff6c17');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ed2024' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ed2024');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#cccccc' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#cccccc');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#edebd5' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#edebd5');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#34160c' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#34160c');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#ff9a66' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#ff9a66');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#bababa' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#bababa');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);

	var div2 = document.createElement('div');
		div2.className = 'coloritem';
		div2.style.cursor = 'pointer';
		div2.style.width = '15px' ;
		div2.style.backgroundColor = '#042eb9' ;
		div2.style.height = '15px' ;
		div2.onclick = function() {
			document.getElementById("divcolor").style.display='none' ;
			document.body.removeChild(document.getElementById('divcolor'));func.call(scope, '#042eb9');
		};
		div2.innerHTML = '' ;
		div.appendChild(div2);
document.body.appendChild(div);

}

function chooseImageEye(func, scope, button) {
//	var url = prompt("Enter the url of the image:", "images/sample.png");
//	var newWindow = window.open('test.php','clipart','width=500;height=400');
// 	func.call(scope, url);

window.parent.sendMsg($checknum,'Insert_eyeos_Image','');
window.parent.scope = scope;
window.parent.callback = func;

}


/**
 *  gets a string input.
 */
function getInput(msg, func, scope, button) {
	var text = prompt(msg);
	if (text) {
		func.call(scope, text);
	}
}
/**
 *  gets text translated to the current locale
 */
function lang(text) {
	if (typeof slang != 'object') {
		var value = text;
	} else {
		var value = slang[text] || text;
	}
	for (var i=1; i < arguments.length; i++) {
		value = value.replace("{" + (i-1) + "}", arguments[i]);
	}
	return value;
}