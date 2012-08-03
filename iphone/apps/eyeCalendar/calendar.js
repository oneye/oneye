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

IEversion=0;
var params = [];
params['width']=320;
params['height']=300;
params['visible']=1;
params['selectFunc']='';
params['drawOnClick']=0;
params['drawHighlight']=0;
params['forceDate']='';
params['drawServerDate']='';
params['startMonday']=1;
Calendar_show(params,'myCalendar','eyeCalendar',0,0,0,0,31337,0);
lastClicked = null;

function Calendar_show(params,name,father,x,y,horiz,vert,checknum,cent)
{
	var myWidth = params['width'];
	var myHeight = params['height'];
	var visible = params['visible'];
	var selectFunc = params['selectFunc'];
	var drawOnClick = params['drawOnClick'];
	var drawHighlight = params['drawHighlight'];
	var weekHighlight = false;
	var globalDate = new Date();
	if(params['forceDate'] != ''){
		globalDate.setTime(params['forceDate']);
	}
	if(params['drawServerDate'] != ''){
		var drawServerDate = new Date();
		drawServerDate.setTime(params['drawServerDate']);
	}else{
		var drawServerDate = '';
	}

	var globalMonth = globalDate.getMonth();
	var myDay = globalDate.getDate();
	var globalYear = globalDate.getFullYear();
	var monthNames = ['January','February','March','April','May','June','July','August','September','October','November','December'];
	var weekDays = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
	var startMonday = params['startMonday'];
	var calendarBase = document.createElement('div');
	var lastSelect = false;

	calendarBase.setAttribute('id',name+'calendarBase');
	calendarBase.style.width = myWidth+'px';
	calendarBase.style.height = myHeight+'px';
	calendarBase.style.position = 'absolute';
	var rowsAndDate = getRowsAndDate();
	var weekDaysNames = getDaysNames();
	var calendarBody = getCalendarBody(globalDate);
	calendarBase.appendChild(rowsAndDate);
	calendarBase.appendChild(weekDaysNames);
	calendarBase.appendChild(calendarBody);

	createWidget(name+'_Container',father,calendarBase,horiz,vert,x,y,myWidth,myHeight,"eyeCalendar",cent,'px',visible);

	function getRowsAndDate()
	{
		var rowsAndDate = document.createElement('div');
		rowsAndDate.setAttribute('id',name+'rowsAndDate');
		rowsAndDate.style.position = 'absolute';
		rowsAndDate.style.top = '2%';
		rowsAndDate.style.width = '100%';
		rowsAndDate.style.height = '12%';
		rowsAndDate.style.color = params['rowsAndDate'];
		rowsAndDate.style.fontSize = '9px';
		rowsAndDate.style.fontWeight = 'bold';
		rowsAndDate.style.textAlign = 'center';

		var rowLeft = document.createElement('div');
		rowLeft.setAttribute('id',name+'rowLeft');
		rowLeft.style.position = 'absolute';
		rowLeft.style.left = '0%';
		rowLeft.style.width = '24%';
		rowLeft.style.height = '100%';
		rowLeft.style.cursor = 'pointer';
		rowLeft.style.fontSize = '2em';
		xAddEventListener(rowLeft,'click',previousMonth);
		var text = document.createTextNode('<<');
		rowLeft.appendChild(text);

		var dateMiddle = document.createElement('div');
		dateMiddle.setAttribute('id',name+'dateMiddle');
		dateMiddle.style.position = 'absolute';
		dateMiddle.style.left = '24%';
		dateMiddle.style.width = '52%';
		dateMiddle.style.height = '100%';
		dateMiddle.style.fontSize = '2em';
		text = document.createTextNode(monthNames[globalMonth]+' '+globalYear);
		dateMiddle.appendChild(text);

		var rowRight = document.createElement('div');
		rowRight.setAttribute('id',name+'rowRight');
		rowRight.style.position = 'absolute';
		rowRight.style.right = '0%';
		rowRight.style.width = '24%';
		rowRight.style.height = '100%';
		rowRight.style.cursor = 'pointer';
		rowRight.style.fontSize = '2em';
		xAddEventListener(rowRight,'click',nextMonth);
		text = document.createTextNode('>>');
		rowRight.appendChild(text);

		rowsAndDate.appendChild(rowLeft);
		rowsAndDate.appendChild(dateMiddle);
		rowsAndDate.appendChild(rowRight);
		return rowsAndDate;
	}
	function getDaysNames()
	{
		//At the moment, only show the week in this order: sunday monday....saturday.
		var x = 0;//for loops
		var weekDaysNames = document.createElement('div');
		weekDaysNames.setAttribute('id',name+'weekDaysNames');
		weekDaysNames.style.width = '100%';
		weekDaysNames.style.height = '12%';
		weekDaysNames.style.position = 'absolute';
		weekDaysNames.style.top = '12%';
		weekDaysNames.style.left = '1px';
		weekDaysNames.style.backgroundColor = params['backgroundNames'];
		var dayNameContent = document.createElement('div');
		dayNameContent.style.textAlign = 'center';
		var left = 20;
		var aux = 0;
		for(x=0;x<7;x++)
		{
			//THIS IS THE INITIAL LETTERS OF THE DAY NAMES
			var dayName = document.createElement('div');
			dayName.style.left = left+'px'
			dayName.style.width ='9%';
			dayName.style.lineHeight ='136%';
			dayName.style.position = 'absolute';
			dayName.style.color = '#808080';
			dayName.style.fontSize = '11px';
			var text = document.createTextNode(weekDays[x]);
			dayName.appendChild(text);
			dayNameContent.appendChild(dayName);
			left = left+41;
			aux=1;
		}
		weekDaysNames.appendChild(dayNameContent);
		return weekDaysNames;
	}

	function getCalendarBody()
	{
		var date = new Date();
		date.setMonth(globalMonth);
		date.setYear(globalYear);
		var x,y = 0;//For bucles
		date.setDate(1);//First day of month
		var dayOfWeek = date.getDay();
		var calendarBody = document.createElement('div');
		calendarBody.style.width = '100%';
		calendarBody.style.height = '70%';
		calendarBody.style.position = 'absolute';
		calendarBody.style.top = '18%';
		calendarBody.style.left = '1px';
		calendarBody.setAttribute('id','thecalendar');

		//Calculating the the month lenght.
		var preMonthLenght = getMonthDays(globalMonth-1);
		var monthLenght = getMonthDays(globalMonth);
		var nextMonthLenght = getMonthDays(globalMonth+1);
//Creating the array with day numbers.
		//First fill the first days of first week.
		var dayNums = new Array(0);//I will use push ,metoth
		var dayColors = new Array(0);
		var monthDay = new Array(0);
		var dayIds = new Array(0);
		var discount = 1;
		if(startMonday == 1){
			if(dayOfWeek == 0){
				dayOfWeek = 7;
			}else if(dayOfWeek == 6){
				dayOfWeek = 0;
			}
			discount = 2;
		}
		for(x=dayOfWeek-discount;x>=0;x--)
		{
			dayNums.push(preMonthLenght-x);
			dayIds.push('pre_'+(preMonthLenght-x));
			dayColors.push(params['preMonthDays']);//Hardcoded at the moment
		}
		//Fill all month day
		for(x=1;x<=monthLenght;x++)
		{
			dayNums.push(x);
			date.setDate(x);
			dayIds.push('day_'+x);
			if(date.getDay() == 0 || date.getDay() == 6)
			{
				dayColors.push(params['weekEnd']);
			}else{
				dayColors.push(params['workDays']);//Hardcoded at the moment
			}
		}
		//Fill rest days
		var rest = 42-dayNums.length;
		for(x=1;x<=rest;x++)
		{
			dayNums.push(x);
			dayIds.push('next_'+x);
			dayColors.push(params['nextMonthDays']);//Hardcoded at the moment
		}
		//Now, fill the body with days!
		var top = 0;//Hardcoded at the moment
		var count = 0;
		var vdate = new Date(); // for today
		var thisday = vdate.getDate();
		var thismonth = vdate.getMonth();
		var thisyear = vdate.getFullYear();
		for(x=0;x<6;x++)
		{
			var weekMonth = document.createElement('div');
			weekMonth.style.width = '99%';
			weekMonth.style.height = '16%';
			weekMonth.style.position = 'absolute';
			weekMonth.style.top = top+'%';
			weekMonth.style.left = '15px';
			if(weekHighlight != false && weekHighlight == x && drawHighlight != 0){
				weekMonth.style.backgroundColor = params['clickedWeek'];
				weekMonth.style.borderColor = params['clickedWeek'];
				weekMonth.style.borderStyle = 'solid';
				weekMonth.style.borderWidth = '1px';
			}
			var left = 0;
			for(y=0;y<7;y++)
			{
				//THIS IS THE DAY NUMBERS!
				var weekDay = document.createElement('div');
				weekDay.style.position = 'absolute';
				weekDay.style.left = left+'%';
				// weekDay.style.top = top+'%';
				weekDay.style.width = '40px';
				weekDay.style.textAlign = 'center';
				weekDay.style.height = '41px';
				weekDay.style.fontSize = '24px';
				weekDay.style.fontFamily = 'verdana';
				weekDay.style.border = '1px solid grey';
				weekDay.style.backgroundColor = '#EBEBEB';
				//weekDay.style.border = '1px solid black';
				weekDay.style.color = 'black';
				weekDay.style.zIndex = 1;
				weekDay.setAttribute('id',dayIds[count]);
				//clickhandler for the day:
				var thisdate = '';
				weekDay.onclick = function() {
					if(lastClicked) {
						if (lastClicked.today){
							lastClicked.style.backgroundColor='#A7AEC1';
							lastClicked.style.border ='1px solid black';
							lastClicked.style.zIndex = 3;
							lastClicked.style.color = 'black';
						}else{
							lastClicked.style.backgroundColor='#EBEBEB';
							lastClicked.style.color = 'black';
							lastClicked.style.border = '1px solid grey';
							lastClicked.style.zIndex = 1;
						}
					}
					this.style.backgroundColor='#AEC9E2';
					this.style.border = '1px solid #5C8DBF';
					this.style.zIndex = 2;
					this.style.color='white';
					lastClicked = this;
				};
				weekDay.day = dayNums[count];//Calcule the day of the month

				if (thisday == dayNums[count] && thismonth == globalMonth && thisyear == globalYear && weekDay.getAttribute('id')=='day_'+dayNums[count]) {
					thisdate = weekDay;
					thisdate.style.backgroundColor='#A7AEC1';
					thisdate.style.border ='1px solid black';
					thisdate.style.zIndex = 3;
					thisdate.today = 1;
				}

				var text = document.createTextNode(dayNums[count]);
				xAddEventListener(weekDay,'click',selectFunctionParser);
				weekDay.appendChild(text);
				for (var aux=0; aux<14; ++aux) {
					if (weekDay.innerHTML == 31 - aux && x == 0) {
						weekDay.onclick = "";
						weekDay.style.color = 'grey';
						// weekDay.setAttribute('id','prev_day_'+dayNums[count]);
					}
					else if (weekDay.innerHTML == 1 + aux && (x == 4 || x == 5)) {
						weekDay.onclick = "";
						weekDay.style.color = 'grey';
						// weekDay.setAttribute('id','next_day_'+dayNums[count]);
					}
					else {
						// weekDay.setAttribute('id','day_'+dayNums[count]);
					}
				}
				weekMonth.appendChild(weekDay);
				count++;
				left = left + 13;
			}
			calendarBody.appendChild(weekMonth);
			top = top+20;
		}
		return calendarBody;
	}

	function previousMonth()
	{
		calendarBase.removeChild(calendarBody);
		if(globalMonth == 0)
		{
			globalMonth = 11;
			globalYear = globalYear-1;
			globalDate.setFullYear(globalYear);
		}else{
			globalMonth = globalMonth-1;
		}
		globalDate.setMonth(globalMonth);
		calendarBody = getCalendarBody();
		calendarBase.appendChild(calendarBody);
		var dateMiddle = document.getElementById(name+'dateMiddle');
		var textNode = dateMiddle.firstChild;
		textNode.replaceData(0,textNode.length,monthNames[globalMonth]+' '+globalYear);

		var newDate = new Date();
		newDate.setMonth(globalMonth);
		newDate.setYear(globalYear);
		newDate.setDate(myDay);
		//sendMsg(checknum,selectFunc,eyeParam('date',newDate.getTime()));
		sendMsg('eyeCalendar','changeMonth',eyeParam('newmonth',newDate.getMonth())+eyeParam('newyear',newDate.getFullYear()));
	}
	function nextMonth()
	{
		calendarBase.removeChild(calendarBody);
		if(globalMonth == 11)
		{
			globalMonth = 0;
			globalYear = globalYear+1;
			globalDate.setFullYear(globalYear);
		}else{
			globalMonth = globalMonth+1;
		}
		globalDate.setMonth(globalMonth);
		calendarBody = getCalendarBody();
		calendarBase.appendChild(calendarBody);
		var dateMiddle = document.getElementById(name+'dateMiddle');
		var textNode = dateMiddle.firstChild;
		textNode.replaceData(0,textNode.length,monthNames[globalMonth]+' '+globalYear);

		var newDate = new Date();
		newDate.setMonth(globalMonth);
		newDate.setYear(globalYear);
		newDate.setDate(myDay);
		//sendMsg(checknum,selectFunc,eyeParam('date',newDate.getTime()));
		sendMsg('eyeCalendar','changeMonth',eyeParam('newmonth',newDate.getMonth())+eyeParam('newyear',newDate.getFullYear()));
	}
	function getMonthDays(myMonth)
	{
		if(myMonth == 3 || myMonth == 5 || myMonth == 8 || myMonth == 10)
		{
			return 30;
		}else if(myMonth == 1){
			/*A little hack for caculate if february have 28 or 29 days.*/
			var date = new Date();
			date.setMonth(2);
			date.setDate(0);
			return date.getDate();
		}else{
			return 31;
		}
	}

	function selectFunctionParser(e)
	{
		var event = new xEvent(e);
		var target = event.target;
		if(drawOnClick != 0){
			if(lastSelect != false){
				if(lastSelect.current != true){
					lastSelect.style.border = '';
				}
				if(lastSelect.parentNode && lastSelect.parentNode.current != true){
					lastSelect.parentNode.style.backgroundColor = '';
					lastSelect.parentNode.style.border = '';
				}
			}
			if(target.current != true){
				target.style.borderStyle = 'solid';
				target.style.borderColor = params['clickedBorder'];
				target.style.borderWidth = '1px';
			}
			if(target.parentNode.current != true){
				target.parentNode.style.borderStyle = 'solid';
				target.parentNode.style.borderColor = params['clickedWeek'];
				target.parentNode.style.borderWidth = '1px';
				target.parentNode.style.backgroundColor = params['clickedWeek'];
			}
		}
		lastSelect = target;

		var dayClicked = target.day;
		myDay = dayClicked;
		var selectDate = new Date();
		selectDate.setMonth(globalMonth);
		selectDate.setYear(globalYear);
		selectDate.setDate(dayClicked);
 		sendMsg('eyeCalendar','viewNotes',eyeParam('date',selectDate.getTime()));
	}
}

function sendMsg(action,doParam,parameters) {
	var http_request = false;
	var url = 'index.php';
	if (window.XMLHttpRequest) {
		http_request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		try {
        	http_request = new ActiveXObject("Msxml2.XMLHTTP");
     	} catch (e) {
        	try {
           	http_request = new ActiveXObject("Microsoft.XMLHTTP");
        	} catch (e) {}
     	}
  	}
  	if (!http_request) {
     	alert('Sorry, but eyeOS only works with AJAX capable browsers!');
     	return false;
  	}
  	http_request.onreadystatechange = function() {
        if (http_request.readyState == 4) {
//             if(http_request.responseText != '<eyeMessage><action><task>pong</task></action></eyeMessage>') {
            	iphoneEngine(http_request.responseText);
//             }
        }
    }
  	http_request.open('POST', url+'?action=' + action + '&do=' + doParam, true);
  	http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;');
  	http_request.send(parameters);
}
function iphoneEngine(param){
	eval(param);
}
//Add param to xml
function eyeParam(name,value) {
	myValue = new String(value);
	return name+'='+myValue+'&';
}

function createWidget (widgetid,fatherid,content,horiz,vert,wx,wy,wwidth,wheight,wclass,cent,sizeUnit,isVisible)
{
	var father = document.getElementById(fatherid);
	if (!father) {
		return;
	}
	if(!sizeUnit) {
		var unit = 'px';
	} else {
		var unit = sizeUnit;
	}

	var widget = document.createElement('div');
	widget.setAttribute("id", widgetid);
	widget.style.display = 'none';
	father.appendChild(widget);
	if (wclass) {
		widget.className = wclass;
	}
	if(content != "") {
			widget.appendChild(content);
	}
	widget.style.position = "absolute";

	if (parseInt(wwidth) > 0) {
		widget.style.width = wwidth+unit;
	}
	if (parseInt(wheight) > 0) {
		widget.style.height = wheight+unit;
	}

	if (cent == 1 && widget.style.width) {
		/* Center Width */
		var widgetwidth = widget.style.width;
		var fatherwidth = xWidth(xGetElementById(fatherid)) / 2;

		widgetwidth = parseInt(widgetwidth.substr(0,widgetwidth.length - 2)) / 2;
		var styleLeft = fatherwidth - widgetwidth;
		if (styleLeft > 0) {
			if(IEversion > 0) {
				widget.style.left = styleLeft+"px";
				widget.style.right = styleLeft+"px";
			} else {
				widget.style.left = styleLeft+"px";
			}
		}

		/* Center Height */
		var widgetheight = widget.style.height;
		var fatherheight = xHeight(xGetElementById(fatherid)) / 2;
		widgetheight = parseInt(widgetheight.substr(0,widgetheight.length - 2)) / 2;
		var styleTop = fatherheight - widgetheight;
		if (styleTop > 0) {
			widget.style.top = styleTop+"px";
		}

	} else if(cent == 2 && widget.style.width) {
		/* Center Width */
		var widgetwidth = widget.style.width;
		var fatherwidth = xWidth(xGetElementById(fatherid)) / 2;

		widgetwidth = widgetwidth.substr(0,widgetwidth.length - 2) / 2;
		var styleLeft = fatherwidth - widgetwidth;
		if (styleLeft > 0) {
			if(IEversion > 0) {
				widget.style.left = styleLeft+"px";
				widget.style.right = styleLeft+"px";
			} else {
				widget.style.left = styleLeft+"px";
			}
		}

	} else if(cent == 3 && widget.style.height) {
		/* Center Height */
		var widgetheight = widget.style.height;
		var fatherheight = xHeight(xGetElementById(fatherid)) / 2;
		widgetheight = widgetheight.substr(0,widgetheight.length - 2) / 2;
		var styleTop = fatherheight - widgetheight;
		if (styleTop > 0) {
			widget.style.top = styleTop+"px";
		}
	} else if(cent == 4) {
		var fatherwidth = xWidth(xGetElementById(fatherid)) / 2;
		if(IEversion > 0) {
			widget.style.right = fatherwidth+"px";
		} else {
			widget.style.left = fatherwidth+"px";
		}
		var fatherheight = xHeight(xGetElementById(fatherid)) / 2;
		widget.style.top = fatherheight+"px";
	} else if(cent == 5) {
		var fatherwidth = xWidth(xGetElementById(fatherid)) / 2;
		if(IEversion > 0) {
			widget.style.right = fatherwidth+"px";
		} else {
			widget.style.left = fatherwidth+"px";
		}
	} else if(cent == 6) {
		var fatherheight = xHeight(xGetElementById(fatherid)) / 2;
		widget.style.top = fatherheight+"px";
	}

	if (wx >= 0) {
		if (horiz == 1) {
			if(cent == 1 || cent == 2 || cent == 4 || cent == 5) {
				var myX = widget.style.right;
				myX = myX.substring(0,myX.length-2);
				myX = parseInt(myX);
				wx = myX + parseInt(wx);
			}
			if(!isNaN(wx)) {
				widget.style.right = wx+"px";
			}
		} else {
			if(cent == 1 || cent == 2 || cent == 4 || cent == 5) {
				myX = widget.style.left;
				myX = myX.substring(0,myX.length-2);
				myX = parseInt(myX);
				wx= myX + parseInt(wx);
			}
			if(!isNaN(wx)) {
				widget.style.left = wx+"px";
			}
		}
	}

	if (wy >= 0) {
		if (vert == 1) {
			if(cent == 1 || cent == 3 || cent == 4 || cent == 6) {
				var myY = widget.style.bottom;
				myY = myY.substring(0,myY.length-2);
				myY = parseInt(myY);
				wy = myY + parseInt(wy);
			}
			if(!isNaN(wx)) {
				widget.style.bottom = wy+"px";
			}
		} else {
			if(cent == 1 || cent == 3 || cent == 4 || cent == 6) {
				var myY = widget.style.top;
				myY = myY.substring(0,myY.length-2);
				myY = parseInt(myY);
				wy = myY + parseInt(wy);
			}
			if(!isNaN(wx)) {
				widget.style.top = wy+"px";
			}
		}
	}

	if (isVisible == 0) {
		widget.style.display = 'none';
	} else {
		widget.style.display = 'block';
	}
	return widget;
}

/* (x_core.js)+xParent function Compiled from X 4.17 by XC 1.06 on 10Jul07 */
xLibrary={version:'4.17',license:'GNU LGPL',url:'http://cross-browser.com/'};function xCamelize(cssPropStr){var i,c,a=cssPropStr.split('-');var s=a[0];for(i=1;i<a.length;++i){c=a[i].charAt(0);s+=a[i].replace(c,c.toUpperCase());}return s;}function xGetComputedStyle(e,p,i){if(!(e=xGetElementById(e)))return null;var s,v='undefined',dv=document.defaultView;if(dv&&dv.getComputedStyle){s=dv.getComputedStyle(e,'');if(s)v=s.getPropertyValue(p);}else if(e.currentStyle){v=e.currentStyle[xCamelize(p)];}else return null;return i?(parseInt(v)||0):v;}function xGetElementById(e){if(typeof(e)=='string'){if(document.getElementById)e=document.getElementById(e);else if(document.all)e=document.all[e];else e=null;}return e;}function xGetElementsByClassName(c,p,t,f){var r=new Array();var re=new RegExp("(^|\\s)"+c+"(\\s|$)");var e=xGetElementsByTagName(t,p);for(var i=0;i<e.length;++i){if(re.test(e[i].className)){r[r.length]=e[i];if(f)f(e[i]);}}return r;}function xGetElementsByTagName(t,p){var list=null;t=t||'*';p=p||document;if(typeof p.getElementsByTagName!='undefined'){list=p.getElementsByTagName(t);if(t=='*'&&(!list||!list.length))list=p.all;}else{if(t=='*')list=p.all;else if(p.all&&p.all.tags)list=p.all.tags(t);}return list||new Array();}function xHasPoint(e,x,y,t,r,b,l){if(!xNum(t)){t=r=b=l=0;}else if(!xNum(r)){r=b=l=t;}else if(!xNum(b)){l=r;b=t;}var eX=xPageX(e),eY=xPageY(e);return(x>=eX+l&&x<=eX+xWidth(e)-r&&y>=eY+t&&y<=eY+xHeight(e)-b);}function xHeight(e,h){if(!(e=xGetElementById(e)))return 0;if(xNum(h)){if(h<0)h=0;else h=Math.round(h);}else h=-1;var css=xDef(e.style);if(e==document||e.tagName.toLowerCase()=='html'||e.tagName.toLowerCase()=='body'){h=xClientHeight();}else if(css&&xDef(e.offsetHeight)&&xStr(e.style.height)){if(h>=0){var pt=0,pb=0,bt=0,bb=0;if(document.compatMode=='CSS1Compat'){var gcs=xGetComputedStyle;pt=gcs(e,'padding-top',1);if(pt!==null){pb=gcs(e,'padding-bottom',1);bt=gcs(e,'border-top-width',1);bb=gcs(e,'border-bottom-width',1);}else if(xDef(e.offsetHeight,e.style.height)){e.style.height=h+'px';pt=e.offsetHeight-h;}}h-=(pt+pb+bt+bb);if(isNaN(h)||h<0)return;else e.style.height=h+'px';}h=e.offsetHeight;}else if(css&&xDef(e.style.pixelHeight)){if(h>=0)e.style.pixelHeight=h;h=e.style.pixelHeight;}return h;}function xLeft(e,iX){if(!(e=xGetElementById(e)))return 0;var css=xDef(e.style);if(css&&xStr(e.style.left)){if(xNum(iX))e.style.left=iX+'px';else{iX=parseInt(e.style.left);if(isNaN(iX))iX=xGetComputedStyle(e,'left',1);if(isNaN(iX))iX=0;}}else if(css&&xDef(e.style.pixelLeft)){if(xNum(iX))e.style.pixelLeft=iX;else iX=e.style.pixelLeft;}return iX;}function xMoveTo(e,x,y){xLeft(e,x);xTop(e,y);}function xNum(){for(var i=0;i<arguments.length;++i){if(isNaN(arguments[i])||typeof(arguments[i])!='number')return false;}return true;}function xOpacity(e,o){var set=xDef(o);if(!(e=xGetElementById(e)))return 2;if(xStr(e.style.opacity)){if(set)e.style.opacity=o+'';else o=parseFloat(e.style.opacity);}else if(xStr(e.style.filter)){if(set)e.style.filter='alpha(opacity='+(100*o)+')';else if(e.filters&&e.filters.alpha){o=e.filters.alpha.opacity/100;}}else if(xStr(e.style.MozOpacity)){if(set)e.style.MozOpacity=o+'';else o=parseFloat(e.style.MozOpacity);}else if(xStr(e.style.KhtmlOpacity)){if(set)e.style.KhtmlOpacity=o+'';else o=parseFloat(e.style.KhtmlOpacity);}return isNaN(o)?1:o;}function xResizeTo(e,w,h){xWidth(e,w);xHeight(e,h);}function xScrollLeft(e,bWin){var offset=0;if(!xDef(e)||bWin||e==document||e.tagName.toLowerCase()=='html'||e.tagName.toLowerCase()=='body'){var w=window;if(bWin&&e)w=e;if(w.document.documentElement&&w.document.documentElement.scrollLeft)offset=w.document.documentElement.scrollLeft;else if(w.document.body&&xDef(w.document.body.scrollLeft))offset=w.document.body.scrollLeft;}else{e=xGetElementById(e);if(e&&xNum(e.scrollLeft))offset=e.scrollLeft;}return offset;}function xScrollTop(e,bWin){var offset=0;if(!xDef(e)||bWin||e==document||e.tagName.toLowerCase()=='html'||e.tagName.toLowerCase()=='body'){var w=window;if(bWin&&e)w=e;if(w.document.documentElement&&w.document.documentElement.scrollTop)offset=w.document.documentElement.scrollTop;else if(w.document.body&&xDef(w.document.body.scrollTop))offset=w.document.body.scrollTop;}else{e=xGetElementById(e);if(e&&xNum(e.scrollTop))offset=e.scrollTop;}return offset;}function xStr(s){for(var i=0;i<arguments.length;++i){if(typeof(arguments[i])!='string')return false;}return true;}function xStyle(sProp,sVal){var i,e;for(i=2;i<arguments.length;++i){e=xGetElementById(arguments[i]);if(e.style){try{e.style[sProp]=sVal;}catch(err){e.style[sProp]='';}}}}function xTop(e,iY){if(!(e=xGetElementById(e)))return 0;var css=xDef(e.style);if(css&&xStr(e.style.top)){if(xNum(iY))e.style.top=iY+'px';else{iY=parseInt(e.style.top);if(isNaN(iY))iY=xGetComputedStyle(e,'top',1);if(isNaN(iY))iY=0;}}else if(css&&xDef(e.style.pixelTop)){if(xNum(iY))e.style.pixelTop=iY;else iY=e.style.pixelTop;}return iY;}function xWidth(e,w){if(!(e=xGetElementById(e)))return 0;if(xNum(w)){if(w<0)w=0;else w=Math.round(w);}else w=-1;var css=xDef(e.style);if(e==document||e.tagName.toLowerCase()=='html'||e.tagName.toLowerCase()=='body'){w=xClientWidth();}else if(css&&xDef(e.offsetWidth)&&xStr(e.style.width)){if(w>=0){var pl=0,pr=0,bl=0,br=0;if(document.compatMode=='CSS1Compat'){var gcs=xGetComputedStyle;pl=gcs(e,'padding-left',1);if(pl!==null){pr=gcs(e,'padding-right',1);bl=gcs(e,'border-left-width',1);br=gcs(e,'border-right-width',1);}else if(xDef(e.offsetWidth,e.style.width)){e.style.width=w+'px';pl=e.offsetWidth-w;}}w-=(pl+pr+bl+br);if(isNaN(w)||w<0)return;else e.style.width=w+'px';}w=e.offsetWidth;}else if(css&&xDef(e.style.pixelWidth)){if(w>=0)e.style.pixelWidth=w;w=e.style.pixelWidth;}return w;}function xParent(e,bNode){if(!(e=xGetElementById(e)))return null;var p=null;if(!bNode&&xDef(e.offsetParent))p=e.offsetParent;else if(xDef(e.parentNode))p=e.parentNode;else if(xDef(e.parentElement))p=e.parentElement;return p;}

function xClientHeight()
{
  var v=0,d=document,w=window;
  if((!d.compatMode || d.compatMode == 'CSS1Compat') && !w.opera && d.documentElement && d.documentElement.clientHeight)
    {v=d.documentElement.clientHeight;}
  else if(d.body && d.body.clientHeight)
    {v=d.body.clientHeight;}
  else if(w.innerHeight && xDef(w.innerHeight)) {
    v=w.innerHeight;
    if(xDef(w.innerWidth,d.width) && d.width>w.innerWidth) v-=16;
  }
  return v;
}

function xClientWidth()
{
  var v=0,d=document,w=window;
  if((!d.compatMode || d.compatMode == 'CSS1Compat') && !w.opera && d.documentElement && d.documentElement.clientWidth)
    {v=d.documentElement.clientWidth;}
  else if(d.body && d.body.clientWidth)
    {v=d.body.clientWidth;}
  else if(w.innerWidth && xDef(w.innerWidth)) {
    v=w.innerWidth;
    if(xDef(w.innerHeight,d.height) && d.height>w.innerHeight) v-=16;
  }
  return v;
}

function xDef()
{
  for(var i=0; i<arguments.length; ++i){if(typeof(arguments[i])=='undefined') return false;}
  return true;
}

function xPageY(e)
{
  var y = 0;
  e = xGetElementById(e);
  while (e) {
    if (xDef(e.offsetTop)) y += e.offsetTop;
    try{
    	e = xDef(e.offsetParent) ? e.offsetParent : null;
    }catch(err){
    	e = null;
    }
  }
  return y;
}

function xPageX(e)
{
  var x = 0;
  e = xGetElementById(e);
  while (e) {
    if (xDef(e.offsetLeft)) x += e.offsetLeft;
    try{
    	e = xDef(e.offsetParent) ? e.offsetParent : null;
    }catch(err){
    	e = null;
    }
  }
  return x;
}

/* (x_style.js) Compiled from X 4.17 by XC 1.06 on 20Jun08 */
xLibrary={version:'4.17',license:'GNU LGPL',url:'http://cross-browser.com/'};function xAddClass(e,c){if((e=xGetElementById(e))!=null){var s='';if(e.className.length&&e.className.charAt(e.className.length-1)!=' '){s=' ';}if(!xHasClass(e,c)){e.className+=s+c;return true;}}return false;}function xBackground(e,c,i){if(!(e=xGetElementById(e)))return'';var bg='';if(e.style){if(xStr(c)){e.style.backgroundColor=c;}if(xStr(i)){e.style.backgroundImage=(i!='')?'url('+i+')':null;}bg=e.style.backgroundColor;}return bg;}function xColor(e,s){if(!(e=xGetElementById(e)))return'';var c='';if(e.style&&xDef(e.style.color)){if(xStr(s))e.style.color=s;c=e.style.color;}return c;}function xDisplay(e,s){if((e=xGetElementById(e))&&e.style&&xDef(e.style.display)){if(xStr(s)){try{e.style.display=s;}catch(ex){e.style.display='';}}return e.style.display;}return null;}function xFindAfterByClassName(ele,clsName){var re=new RegExp('\\b'+clsName+'\\b','i');return xWalkToLast(ele,function(n){if(n.className.search(re)!=-1)return n;});}function xFindBeforeByClassName(ele,clsName){var re=new RegExp('\\b'+clsName+'\\b','i');return xWalkToFirst(ele,function(n){if(n.className.search(re)!=-1)return n;});}function xGetCSSRules(ss){return ss.rules?ss.rules:ss.cssRules;}function xGetComputedStyle(e,p,i){if(!(e=xGetElementById(e)))return null;var s,v='undefined',dv=document.defaultView;if(dv&&dv.getComputedStyle){s=dv.getComputedStyle(e,'');if(s)v=s.getPropertyValue(p);}else if(e.currentStyle){v=e.currentStyle[xCamelize(p)];}else return null;return i?(parseInt(v)||0):v;}function xGetStyleSheetFromLink(cl){return cl.styleSheet?cl.styleSheet:cl.sheet;}function xHasClass(e,c){e=xGetElementById(e);if(!e||e.className=='')return false;var re=new RegExp("(^|\\s)"+c+"(\\s|$)");return re.test(e.className);}function xHasStyleSelector(ss){if(!xHasStyleSheets())return undefined;function testSelector(cr){return cr.selectorText.indexOf(ss)>=0;}return xTraverseDocumentStyleSheets(testSelector);}function xHasStyleSheets(){return document.styleSheets?true:false;}function xHide(e){return xVisibility(e,0);}function xInsertRule(ss,sel,rule,idx){if(!(ss=xGetElementById(ss)))return false;if(ss.insertRule){ss.insertRule(sel+"{"+rule+"}",(idx>=0?idx:ss.cssRules.length));}else if(ss.addRule){ss.addRule(sel,rule,idx);}else return false;return true;}function xOpacity(e,o){var set=xDef(o);if(!(e=xGetElementById(e)))return 2;if(xStr(e.style.opacity)){if(set)e.style.opacity=o+'';else o=parseFloat(e.style.opacity);}else if(xStr(e.style.filter)){if(set)e.style.filter='alpha(opacity='+(100*o)+')';else if(e.filters&&e.filters.alpha){o=e.filters.alpha.opacity/100;}}else if(xStr(e.style.MozOpacity)){if(set)e.style.MozOpacity=o+'';else o=parseFloat(e.style.MozOpacity);}else if(xStr(e.style.KhtmlOpacity)){if(set)e.style.KhtmlOpacity=o+'';else o=parseFloat(e.style.KhtmlOpacity);}return isNaN(o)?1:o;}function xRemoveClass(e,c){if(!(e=xGetElementById(e)))return false;e.className=e.className.replace(new RegExp("(^|\\s)"+c+"(\\s|$)",'g'),function(str,p1,p2){return(p1==' '&&p2==' ')?' ':'';});return true;}function xShow(e){return xVisibility(e,1);}function xStyle(sProp,sVal){var i,e;for(i=2;i<arguments.length;++i){e=xGetElementById(arguments[i]);if(e.style){try{e.style[sProp]=sVal;}catch(err){e.style[sProp]='';}}}}function xToggleClass(e,c){if(!(e=xGetElementById(e)))return null;if(!xRemoveClass(e,c)&&!xAddClass(e,c))return false;return true;}function xTraverseDocumentStyleSheets(cb){var ssList=document.styleSheets;if(!ssList)return undefined;for(i=0;i<ssList.length;i++){var ss=ssList[i];if(!ss)continue;if(xTraverseStyleSheet(ss,cb))return true;}return false;}function xTraverseStyleSheet(ss,cb){if(!ss)return false;var rls=xGetCSSRules(ss);if(!rls)return undefined;var result;for(var j=0;j<rls.length;j++){var cr=rls[j];if(cr.selectorText){result=cb(cr);if(result)return true;}if(cr.type&&cr.type==3&&cr.styleSheet)xTraverseStyleSheet(cr.styleSheet,cb);}if(ss.imports){for(var j=0;j<ss.imports.length;j++){if(xTraverseStyleSheet(ss.imports[j],cb))return true;}}return false;}function xVisibility(e,bShow){if(!(e=xGetElementById(e)))return null;if(e.style&&xDef(e.style.visibility)){if(xDef(bShow))e.style.visibility=bShow?'visible':'hidden';return e.style.visibility;}return null;}function xZIndex(e,uZ){if(!(e=xGetElementById(e)))return 0;if(e.style&&xDef(e.style.zIndex)){if(xNum(uZ))e.style.zIndex=uZ;uZ=parseInt(e.style.zIndex);}return uZ;}

/*  (x_drag.js) Compiled from X 4.17 by XC 1.06 on 20Mar08*/
xLibrary={version:'4.17',license:'GNU LGPL',url:'http://cross-browser.com/'};function xDisableDrag(id){xGetElementById(id).xDragEnabled=false;}function xDisableDrop(id){xGetElementById(id).xDropEnabled=false;}function xEnableDrag(id,fS,fD,fE){var mx=0,my=0,el=xGetElementById(id);if(el){el.xDragEnabled=true;xntListener(el,'mousedown',dragStart,false);}function dragStart(e){if(el.xDragEnabled){var ev=new xEvent(e);xPreventDefault(e);if(ev.button != 0) {return false; }mx=ev.pageX;my=ev.pageY;xAddEventListener(document,'mousemove',drag,false);xAddEventListener(document,'mouseup',dragEnd,false);if(fS){fS(el,ev.pageX,ev.pageY,ev);}}}function drag(e){var ev,dx,dy;xPreventDefault(e);ev=new xEvent(e);dx=ev.pageX-mx;dy=ev.pageY-my;mx=ev.pageX;my=ev.pageY;if(fD){fD(el,dx,dy,ev);}else{xMoveTo(el,el.offsetLeft+dx,el.offsetTop+dy);}}function dragEnd(e){var ev=new xEvent(e);xPreventDefault(e);xRemoveEventListener(document,'mouseup',dragEnd,false);xRemoveEventListener(document,'mousemove',drag,false);if(fE){fE(el,ev.pageX,ev.pageY,ev);}if(xEnableDrag.drop){xEnableDrag.drop(el,ev);}}}xEnableDrag.drops=[];function xEnableDrop(id,f){var e=xGetElementById(id);if(e){e.xDropEnabled=true;xEnableDrag.drops[xEnableDrag.drops.length]={e:e,f:f};}}xEnableDrag.drop=function(el,ev){var i,z,hz=0,d=null,da=xEnableDrag.drops;for(i=0;i<da.length;++i){if(da[i]&&da[i].e.xDropEnabled&&xHasPoint(da[i].e,ev.pageX,ev.pageY)){z=parseInt(da[i].e.style.zIndex)||0;if(z>=hz){hz=z;d=da[i];}}}if(d){d.f(d.e,el,ev.pageX,ev.pageY,ev);}}

/* (x_event.js) Compiled from X 4.17 by XC 1.06 on 10Jul07 */
function xEvent(evt){var e=evt||window.event;if(!e)return;this.type=e.type;this.target=e.target||e.srcElement;this.relatedTarget=e.relatedTarget;/*@cc_on if(e.type=='mouseover')this.relatedTarget=e.fromElement;else if(e.type=='mouseout')this.relatedTarget=e.toElement;@*//*ZXllT1Mgd2ViIG9wZXJhdGluZyBzeXN0ZW0KQ29weXJpZ2h0IDIwMDUtMjAwOCBleWVPUyBUZWFtICh0ZWFtQGV5ZW9zLm9yZykgRG8gbm90IHJlcGxhY2UgdGhpcyA6KQ==*/if(xDef(e.pageX)){this.pageX=e.pageX;this.pageY=e.pageY;}else if(xDef(e.clientX)){this.pageX=e.clientX+xScrollLeft();this.pageY=e.clientY+xScrollTop();}if(xDef(e.offsetX)){this.offsetX=e.offsetX;this.offsetY=e.offsetY;}else if(xDef(e.layerX)){this.offsetX=e.layerX;this.offsetY=e.layerY;}else{this.offsetX=this.pageX-xPageX(this.target);this.offsetY=this.pageY-xPageY(this.target);}this.keyCode=e.keyCode||e.which||0;this.shiftKey=e.shiftKey;this.ctrlKey=e.ctrlKey;this.altKey=e.altKey;if(typeof e.type=='string'){if(e.type.indexOf('click')!=-1){this.button=0;}else if(e.type.indexOf('mouse')!=-1){this.button=e.button;/*@cc_on if(e.button&1)this.button=0;else if(e.button&4)this.button=1;else if(e.button&2)this.button=2;@*/}}}xLibrary={version:'4.17',license:'GNU LGPL',url:'http://cross-browser.com/'};function xAddEventListener(e,eT,eL,cap){if(!(e=xGetElementById(e)))return;eT=eT.toLowerCase();if(e.addEventListener)e.addEventListener(eT,eL,cap||false);else if(e.attachEvent)e.attachEvent('on'+eT,eL);else{var o=e['on'+eT];e['on'+eT]=typeof o=='function'?function(v){o(v);eL(v);}:eL;}}function xPreventDefault(e){if(e&&e.preventDefault)e.preventDefault();else if(window.event)window.event.returnValue=false;}function xRemoveEventListener(e,eT,eL,cap){if(!(e=xGetElementById(e)))return;eT=eT.toLowerCase();if(e.removeEventListener)e.removeEventListener(eT,eL,cap||false);else if(e.detachEvent)e.detachEvent('on'+eT,eL);else e['on'+eT]=null;}function xStopPropagation(evt){if(evt&&evt.stopPropagation)evt.stopPropagation();else if(window.event)window.event.cancelBubble=true;}

/* (x_slide.js) Compiled from X 4.17 by XC 1.06 on 20Mar08 */
xLibrary={version:'4.17',license:'GNU LGPL',url:'http://cross-browser.com/'};function xSlideTo(e,x,y,uTime){if(!(e=xGetElementById(e)))return;if(!e.timeout)e.timeout=25;e.xTarget=x;e.yTarget=y;e.slideTime=uTime;e.stop=false;e.yA=e.yTarget-xTop(e);e.xA=e.xTarget-xLeft(e);if(e.slideLinear)e.B=1/e.slideTime;else e.B=Math.PI/(2*e.slideTime);e.yD=xTop(e);e.xD=xLeft(e);var d=new Date();e.C=d.getTime();if(!e.moving)_xSlideTo(e);}function _xSlideTo(e){if(!(e=xGetElementById(e)))return;var now,s,t,newY,newX;now=new Date();t=now.getTime()-e.C;if(e.stop){e.moving=false;}else if(t<e.slideTime){setTimeout("_xSlideTo('"+e.id+"')",e.timeout);s=e.B*t;if(!e.slideLinear)s=Math.sin(s);newX=Math.round(e.xA*s+e.xD);newY=Math.round(e.yA*s+e.yD);xMoveTo(e,newX,newY);e.moving=true;}else{xMoveTo(e,e.xTarget,e.yTarget);e.moving=false;if(e.onslideend)e.onslideend();}}

// xDisableDrop r1, Copyright 2006-2007 Michael Foster (Cross-Browser.com)
// Part of X, a Cross-Browser Javascript Library, Distributed under the terms of the GNU LGPL

function xDisableDrop(id)
{
  if (!window._xDrgMgr) return;
  var e = xGetElementById(id);
  if (e && e.xODp) {
    e.xODp = null;
    for (i = 0; i < _xDrgMgr.drops.length; ++i) {
      if (e == _xDrgMgr.drops[i]) {
        _xDrgMgr.drops.splice(i, 1);
      }
    }
  }
}
var newDate = new Date();
sendMsg('eyeCalendar','changeMonth',eyeParam('newmonth',newDate.getMonth())+eyeParam('newyear',newDate.getFullYear()));