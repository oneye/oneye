// oneye
var myPid = $myPid;
var myChecknum = $checknum;
var USERTHEME = '$usertheme';

/**************************************************************************\
	* Simple Groupware 0.532                                                   *
	* http://www.simple-groupware.de                                           *
	* Copyright (C) 2002-2009 by Thomas Bley                                   *
	* ------------------------------------------------------------------------ *
	*  This program is free software; you can redistribute it and/or           *
	*  modify it under the terms of the GNU General Public License Version 2   *
	*  as published by the Free Software Foundation; only version 2            *
	*  of the License, no later version.                                       *
	*                                                                          *
	*  This program is distributed in the hope that it will be useful,         *
	*  but WITHOUT ANY WARRANTY; without even the implied warranty of          *
	*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the            *
	*  GNU General Public License for more details.                            *
	*                                                                          *
	*  You should have received a copy of the GNU General Public License       *
	*  Version 2 along with this program; if not, write to the Free Software   *
	*  Foundation, Inc., 59 Temple Place - Suite 330, Boston,                  *
	*  MA  02111-1307, USA.                                                    *
	\**************************************************************************/

// Translations implemented by Sophie Lee.

var agent = navigator.userAgent.toLowerCase();
if (agent.indexOf("konqueror")!=-1) agent = "konqueror";
  else if (agent.indexOf("safari")!=-1) agent = "safari";
  else if (agent.indexOf("opera")!=-1) agent = "opera";
  else if (agent.indexOf("firefox")!=-1) agent = "firefox";
  else if (agent.indexOf("msie")!=-1) agent = "msie";

window.onerror=handleErr;
  
if (agent=="msie" || agent=="safari") { // cursor keys only in keydown
  document.onkeydown = keypress;
} else document.onkeypress=keypress;

var init_data = "";
var auto_recalc = true;
var cols = 13;
var rows = 30;
var row0 = 0;
var col0 = 0;
var col_min_width = "90px";

/* format: cells[row][column][type]
type:
0 = formula
1 = styling
2 = cell description
3 = current value
*/
var cells = new Array();
var marks = new Array();
var view = "values";
var currRow = 0;
var currCol = 0;
var multiRange = new Array();
var clipboard_row = 0;
var clipboard_col = 0;
var clipboard_range = new Array();
var clipboard_mode = "";
var active = "";
var showColumnGroups = false;
var allowPaging = true;
var registerFuncs = "";
var isMouseDown = 0;
var isShiftDown = 0;
var sgs_folder = 0;
var sgs_view = "";
var saveMethod = "save('js')";
var closeMethod = "";
var isWriteable = true;
var tab = String.fromCharCode(9);
var printstyle = "index.php?theme=" + USERTHEME + "&extern=css/apps/eyeSheets/print.css";

function trans(key) {
  if (strings[key]) return strings[key]; else return "["+key+"]";
}

function keypress(event) {
  if (!getObj("value") || active=="code") return true;
  var event = (event)?event:window.event;
  // TODO2 test safari change dimensions / positions
  var keyCode = getmykey(event);
  var ret = true;
  if (active=="position") {
    if (keyCode==13) {
	  gotoCell(getObj("field").value);
	  active="content";
	  ret = false;
	}
	return ret;
  }
  if (active=="dimensions") {
    if (keyCode==13) {
	  rows=parseInt(getObj("rows").value);
	  cols=parseInt(getObj("cols").value);
	  active="content";
	  display();
	  ret = false;
	}
	return ret;
  }
  if (getObj("styling").disabled) {
    getObj("focus").focus(); // avoid window scrolling
    active = "content";
	var shift = event.shiftKey;
	var alt = event.altKey;
	var ctrl = event.ctrlKey;

	if ((ctrl && (keyCode==88 || keyCode==120)) || (shift && keyCode==46)) { // ctrl-x = cut || shift-del = cut
	  cutcopy("cut","#FFDDDD");
  	  ret=false;
	} else if ((ctrl && (keyCode==67 || keyCode==99)) || ctrl && keyCode==45) { // ctrl-c = copy || ctrl-ins = copy
	  cutcopy("copy","#DDDDFF");
  	  ret=false;
	} else if (((ctrl && (keyCode==86 || keyCode==118)) || (shift && keyCode==45)) && clipboard_mode!="") { // ctrl-v = paste || shift-ins = paste
	  paste();
  	  ret=false;
	}

	if (shift && !isShiftDown) {
	  highlightRange(multiRange,"cell");
	  multiRange = new Array(currRow,currCol,currRow,currCol);
	  isShiftDown = 1;
	} else if (!alt && !ctrl && !shift && multiRange.length>0 && keyCode!=46) {
	  highlightRange(multiRange,"cell");
	  multiRange = new Array();
	  isShiftDown=0;
	  isMouseDown=0;
	}

	if (!alt && !ctrl && keyCode!=0) {
	  if (keyCode==33) { // page up
		if (currRow-10 <= row0 && currRow > 10) {
		  row0 -= rows;
		  display();
	      mouseoverCell(currRow-10,currCol);
		  scrollDown();
		} else {
	      mouseoverCell(currRow>=10?currRow-10:0,currCol);
		  scrollUp();
		}
  		ret=false;
	  } else if (keyCode==34) { // page down
	    if (currRow+10 >= row0+rows) {
		  row0 += rows;
		  display();
	      mouseoverCell(currRow+10,currCol);
		  scrollUp();
		} else {
	      mouseoverCell(currRow+10,currCol);
		  scrollDown();
		}
  		ret=false;
	  } else if (keyCode==36) { // home
		if (currCol!=col0) {
		  mouseoverCell(currRow,col0);
		} else if (currCol+1 >= cols) {
		  col0 -= cols;
		  display();
	      mouseoverCell(currRow,currCol-cols);
		} else if (currRow > row0) {
		  mouseoverCell(row0,currCol);
		} else if (currRow+1 > rows) {
		  row0 -= rows;
		  display();
	      mouseoverCell(currRow-rows,currCol);
		}
		scrollLeft();
		ret=false;
	  } else if (keyCode==35) { // end
	    if (currCol!=(col0+cols-1)) {
	      mouseoverCell(currRow,col0+cols-1);
		} else {
		  col0 += cols;
		  display();
	   	  mouseoverCell(currRow,currCol+cols);
		}
		scrollRight();
		ret=false;
	  } else if (keyCode==39 || keyCode==9) { // right
	    goRight();
		ret=false;
	  } else if (keyCode==40) { // down
	    goDown();
		ret=false;
	  } else if (keyCode==38 && currRow>-2) { // up
	    goUp();
		ret=false;
	  } else if (keyCode==37 && currCol>-1) { // left
	    goLeft();
		ret=false;
	  } else if (!shift && keyCode==46 && isWriteable && confirm(trans("Really empty cell(s) ?"))) {
	    removeSelectedCell();
		ret=false;
	  } else if ((keyCode<33 || keyCode>40) && keyCode!=46 && keyCode!=45 &&
	    keyCode!=16 && keyCode!=17 && keyCode!=18)  {
	    editCell(currRow,currCol,keyCode);
		if (keyCode==13) ret=false;
	  }
	}
	if (isShiftDown) {
	  highlightRange(multiRange,"cell");
      multiRange[2] = currRow;
      multiRange[3] = currCol;
      highlightRange(multiRange,"cell_highlight_over");
	}
  } else {
	if (keyCode==13) {
	  saveCell();
  	  ret=false;
	} else if (keyCode==27) {
	  cancelCell();
  	  ret=false;
	}
  }
  return ret;
}

function goLeft() {
  if (currCol <= col0 && currCol > 0) {
	col0 -= cols;
	display();
	mouseoverCell(currRow,currCol-1);
	scrollRight();
  } else {
	mouseoverCell(currRow,currCol-1);
	scrollLeft();
  }
}

function goUp() {
  if (currRow <= row0 && currRow > 0) {
	row0 -= rows;
	display();
	mouseoverCell(currRow-1,currCol);
	scrollDown();
  } else {
	mouseoverCell(currRow-1,currCol);
	scrollUp();
  }
}

function goRight() {
  if (currCol+1 >= col0+cols) {
	col0 += cols;
	display();
	mouseoverCell(currRow,currCol+1);
	scrollLeft();
  } else {
	mouseoverCell(currRow,currCol+1);
	scrollRight();
  }
}

function goDown() {
  if (currRow+1 >= row0+rows) {
	row0 += rows;
	display();
	mouseoverCell(currRow+1,currCol);
	scrollUp();
  } else {
	mouseoverCell(currRow+1,currCol);
	scrollDown();
  }
}

function display() {
  marks = new Array();
  isMouseDown=0;
  var scrollX = 0; // keep scrolling states
  var scrollY = 0;
  if (getObj("content")) {
    scrollX = getObj("content").scrollLeft;
    scrollY = getObj("content").scrollTop;
  }
  var out = "";
  if (isWriteable) {
  	out += '<div class="blockbar">';
	out += '<div class="blockbarItem" onclick="load(init_data); resetPath();" ><img class="blockbarImg" src="index.php?theme=' + USERTHEME + '&extern=icons/22x22/filenew.png" /><div class="blockbarText">'+trans('New')+'</div></div>';
	out += '<div class="blockbarItem" onclick="loadCode();" ><img class="blockbarImg" src="index.php?theme=' + USERTHEME + '&extern=icons/22x22/fileopen.png" /><div class="blockbarText">'+trans('Open')+'</div></div>';
	out += '<div class="blockbarItem" onclick="saveCode();" ><img class="blockbarImg" src="index.php?theme=' + USERTHEME + '&extern=icons/22x22/filesave.png" /><div class="blockbarText">'+trans('Save')+'</div></div>';
	out += '<div class="blockbarItem" onclick="saveAs();" ><img class="blockbarImg" src="index.php?theme=' + USERTHEME + '&extern=icons/22x22/filesaveas.png" /><div class="blockbarText">'+trans('Save As')+'</div></div>';
	out += '<span class="blockbarline" /></span>';
	out += '<div class="blockbarItem" onclick="insertRow();" ><img class="blockbarImg" src="index.php?theme=' + USERTHEME + '&extern=icons/22x22/newrow.png" /><div class="blockbarText">'+trans('Ins. Row')+'</div></div>';
	out += '<div class="blockbarItem" onclick="insertColumn();" ><img class="blockbarImg" src="index.php?theme=' + USERTHEME + '&extern=icons/22x22/newcolumn.png" /><div class="blockbarText">'+trans('Ins. Column')+'</div></div>';
	out += '<div class="blockbarItem" onclick="deleteRow();" ><img class="blockbarImg" src="index.php?theme=' + USERTHEME + '&extern=icons/22x22/deleterow.png" /><div class="blockbarText">'+trans('Del. Row')+'</div></div>';
	out += '<div class="blockbarItem" onclick="deleteColumn();" ><img class="blockbarImg" src="index.php?theme=' + USERTHEME + '&extern=icons/22x22/deletecolumn.png" /><div class="blockbarText">'+trans('Del. Column')+'</div></div>';
	out += '<span class="blockbarline" /></span>';
	out += '<div class="blockbarItem" onclick="print();" ><img class="blockbarImg" src="index.php?theme=' + USERTHEME + '&extern=icons/22x22/agt_print.png" /><div class="blockbarText">'+trans('Print')+'</div></div>';
	out += '<div class="blockbarItem_right" onclick="help();" ><img class="blockbarImg" src="index.php?theme=' + USERTHEME + '&extern=icons/22x22/help.png" /><div class="blockbarText">'+trans('Help')+'</div></div>';
	out += '<div class="blockbarItem_right" onclick="fullScreen();" ><img class="blockbarImg" src="index.php?theme=' + USERTHEME + '&extern=icons/22x22/fullScreen.png" /><div class="blockbarText">' + trans('Full Screen') + '</div></div>';
	out += '</div>';
  }
  out += "<textarea id='focus' onfocus='this.blur();'></textarea><div id='header' class='header'><table cellpadding='0' cellspacing='0' style='width:100%;'><tr><td nowrap>";
  out += "<input type='text' value='' title='"+trans("Position")+"' id='field' style='width:30px; text-align:center;' onfocus='active=\"position\";' onblur='active=\"content\";' accesskey='g'> &nbsp;";
  out += "</td><td nowrap style='width:100%;'>";
  out += "<iframe src='about:blank' id='multiline'></iframe>";
  out += "<input type='text' value='' title='"+trans("Formula")+"' id='value' style='width:100%;' disabled onmouseover='previewValue();' onkeyup='previewValue();'> ";
  out += "<input type='hidden' title='"+trans("Style")+"' value='' id='styling' disabled onmouseover='previewValue();' onkeyup='previewValue();'> ";
  out += "</td><td nowrap>";
  if (isWriteable) {
    out += "&nbsp; <input type='button' value='"+trans("Save")+"' id='save' onclick='saveCell();' disabled>&nbsp;";
    out += "<input type='button' value='"+trans("X")+"' id='cancel' onclick='cancelCell();' disabled>";
  }
  out += "</td></tr></table></div>";
  var style = "";
  if (agent=="msie") style = "style='height:expression((document.body.clientHeight-40)+\"px\");'";
  out += "<div id='content' "+style+"><table id='table' cellspacing='0'>";
  out += "<tr>";
  if (showColumnGroups) {
    out += "<th id='-2_-1' ondblclick='editCell(-2,-1);' onclick='mouseoverCell(-2,-1);'>"+htmlEscape(showCell(-2,-1,0),true)+"</th>";
    for (var i=col0; i<cols+col0; i++) {
	  var colGroupTitle = showCell(-2,i,0);
	  if (colGroupTitle && (!marks[-2] || !marks[-2][i])) {
	    var colSpan = getCellStyle(-2,i,"colspan");
	    if (colSpan) {
		  if (!marks[-2]) marks[-2] = new Array();
		  for (var s=i+1; s<i+colSpan; s++) marks[-2][s] = new Array(-2,i);
		}
	    out += "<th id='-2_"+i+"' ondblclick='editCell(-2,"+i+",0);' onclick='mouseoverCell(-2,"+i+");' colspan='"+colSpan+"'><div style='"+htmlEscape(formatStyle(getCells(-2,i,1),"_"),false)+"'>"+htmlEscape(colGroupTitle,true)+"</div></th>";
	  } else if ((!marks[-2] || !marks[-2][i])) {
	    out += "<th id='-2_"+i+"' ondblclick='editCell(-2,"+i+",0);' onclick='mouseoverCell(-2,"+i+");'>&nbsp;</th>";
	  }
	}
  }
  out += "</tr>";
  out += "<tr><th id='-1_-1' ondblclick='editCell(-1,-1,0);' onclick='mouseoverCell(-1,-1);'>"+htmlEscape(showCell(-1,-1,0),true)+"</th>";
  for (var i=col0; i<cols+col0; i++) {
	var colTitle = showCell(-1,i,0);
    out += "<th id='-1_"+i+"' ondblclick='editCell(-1,"+i+",0);' onclick='mouseoverCell(-1,"+i+");'><div style='"+htmlEscape(formatStyle(getCells(-1,i,1),"_"),false)+"'>"+(colTitle?htmlEscape(colTitle,true)+" - ":"")+buildColName(i)+"</div></th>";
  }
  out += "</tr>";
  var lastIndex = -1;
  var noRowTtitle = false;
  for (var row=row0; row<rows+row0; row++) {
    out += "<tr>";
	var rowTitle = showCell(row,-1,0);
	out += "<th id='"+row+"_-1' ondblclick='editCell("+row+",-1,0);' onclick='mouseoverCell("+row+",-1);'><div style='"+htmlEscape(formatStyle(getCells(row,-1,1),"_"),false)+"'>"+(rowTitle?htmlEscape(rowTitle,true)+"<br>":"")+(row+1)+"</div></th>";
    for (var col=col0; col<cols+col0; col++) {
	  if (view=="values") {
	    if (!marks[row] || !marks[row][col]) {
	      var style = getCells(row,col,1);
		  var value = showCell(row,col,0);
		  var colSpan = getCellStyle(row,col,"colspan");
		  if (colSpan) {
		    if (!marks[row]) marks[row] = new Array();
		    for (var s=col+1; s<col+colSpan; s++) marks[row][s] = new Array(row,col);
	  	  }
		  var rowSpan = getCellStyle(row,col,"rowspan");
		  if (rowSpan) {
		    for (var s=row+1; s<row+rowSpan; s++) {
		      if (!marks[s]) marks[s] = new Array();
		      marks[s][col] = new Array(row,col);
		    }
	  	  }
		  value = formatValue(value,style);
		  style = htmlEscape(formatStyle(style,value),false);
          out += "<td "+(rowSpan?"rowspan='"+rowSpan+"'":"")+" "+(colSpan?"colspan='"+colSpan+"'":"")+" id='"+row+"_"+col+"' onmousedown='mousedown("+row+","+col+");' onmouseup='mouseup();' onmouseover='buildStatus("+row+","+col+");' onclick='mouseoverCell("+row+","+col+");' onclick='mouseoverCell("+row+","+col+");' ondblclick='editCell("+row+","+col+",0);'><div style='"+style+"'>"+htmlEscape(value,true)+"</div></td>";
		}
	  } else if (view=="formulas") {
        out += "<td id='"+row+"_"+col+"' onmouseover='buildStatus("+row+","+col+");' onclick='mouseoverCell("+row+","+col+");' onclick='mouseoverCell("+row+","+col+");' ondblclick='editCell("+row+","+col+",0);'>"+htmlEscape(getCells(row,col,0),true)+"</td>";
	  } else {
        out += "<td id='"+row+"_"+col+"' onmouseover='buildStatus("+row+","+col+");' onclick='mouseoverCell("+row+","+col+");' onclick='mouseoverCell("+row+","+col+");' ondblclick='editCell("+row+","+col+",0);'>"+htmlEscape(getCells(row,col,1),true)+"</td>";
	  }
    }
    out += "</tr>";
  }
  out += "<tr id='spacer'><th class='empty'></th>";
  for (var i=col0; i<cols+col0; i++) out += "<th class='empty'><img src='' style='width:"+col_min_width+"; height:0px;'></th>";
  out += "</tr>";
  out += "</table></div>";
  out += "<div class='footer' id='footer' onmouseover='getObj(\"status\").innerHTML=\"\";'>&nbsp;";
  if (allowPaging) {
    if (col0-cols>=0) {
      out += "<a href='#' onclick='col0 -= cols; currCol -= cols; display(); return false;'><img border='0' src='index.php?theme=" + USERTHEME + "&extern=icons/16x16/back.png'></a> ";
    } else out += "<img border='0' src='index.php?theme=" + USERTHEME + "&extern=icons/16x16/back.png'> ";
    out += "<a href='#' onclick='col0 += cols; currCol += cols; display(); return false;'><img border='0' src='index.php?theme=" + USERTHEME + "&extern=icons/16x16/forward.png'></a> ";
    if (row0-rows>=0) {
      out += "<a href='#' onclick='row0 -= rows; currRow -= rows; display(); return false;'><img border='0' src='index.php?theme=" + USERTHEME + "&extern=icons/16x16/restore.png'></a> ";
    } else out += " <img border='0' src='index.php?theme=" + USERTHEME + "&extern=icons/16x16/restore.png'> ";
    out += "<a href='#' onclick='row0 += rows; currRow += rows; display(); return false;'><img border='0' src='index.php?theme=" + USERTHEME + "&extern=icons/16x16/download.png'></a> ";

  }
  
  out += "</div>";
  
  out += "<div class='statusText'> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "+trans("Sheet Size")+": <input type='text' value='"+cols+"' style='width:28px; text-align:center;' id='cols' onfocus='active=\"dimensions\";' onblur='active=\"content\";'> x <input type='text' value='"+rows+"' style='width:28px; text-align:center;' id='rows' onfocus='active=\"dimensions\";' onblur='active=\"content\";'></div>";
  out += "<div id='status' class='status'></div>";
  getObj("data").innerHTML = out;
  getObj("content").scrollLeft = scrollX;
  getObj("content").scrollTop = scrollY;
  mouseoverCell(currRow,currCol);
  if (clipboard_mode!="") {
    var color = "#DDDDFF"
    if (clipboard_mode=="cut") color = "#FFDDDD";
    if (clipboard_range.length>0) {
      highlightRange(clipboard_range,"",color);
	} else {
      var obj = resolveCell(clipboard_row,clipboard_col);
	  if (obj) obj.style.backgroundColor = color;
	}
  }
  getObj("focus").focus();
}

function showHeaderFooter(show) {
  if (isWriteable) return;
  if (show) {
    getObj("content").style.top="23px";
    getObj("content").style.bottom="18px";
    getObj("header").style.display="";
    getObj("footer").style.display="";
    getObj("status").style.display="";
  } else {
    getObj("content").style.top="0px";
    getObj("content").style.bottom="0px";
    getObj("header").style.display="none";
    getObj("footer").style.display="none";
    getObj("status").style.display="none";
  }
}

function previewValue() {
  var value = getObj("value").value;
  if (!getObj("value").disabled &&
	 (value.length>25 || value.indexOf("\\n")!=-1 || value.indexOf("html:")==0)) {
    getObj("multiline").style.display = "inline";
	//getObj("content").style.overflow = "hidden"; // needed for invisible cursor
    if (getObj("multiline").contentWindow.update) { // oneye
	  getObj("multiline").contentWindow.update();
	}
  }
  previewField();
}
function previewField() {
  var obj2 = resolveCell(currRow,currCol);
  value = previewCell(getObj("value").value,0);
  value = formatValue(value,getObj("styling").value);
  var style = htmlEscape(formatStyle(getObj("styling").value,value),false);
  if (currRow == -1) {
    if (value!="") value += " - ";
    value += buildColName(currCol);
  } else if (currCol == -1) {
    if (value!="") value += "\\n";
    value += currRow+1;
  }
  value = htmlEscape(value,true);
  var val = "<div "+(style?"style='"+style+"'":"")+">"+value+"</div>";
  obj2.innerHTML = val;
  if (val.indexOf("<img")!=-1) obj2.style.height = obj2.offsetHeight+"px";
  if (currRow == -1 || currCol == -1) highlightCellHeader(currRow,currCol);
}
function previewMultiline(value) {
  getObj("value").value = value.replace(/\n/g,"\\n").replace(/\r/g,"");
  previewField();
}

function log(val) {
  if (!getObj("tconsole")) {
    var obj = document.createElement("textarea");
	obj.id = "tconsole";
	document.body.appendChild(obj);
  }
  getObj("tconsole").value += (getObj("tconsole").value.split("\n").length)+": "+val+"\n";
}

function manual() {
  window.open("manual.html","manual","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=800,height=600");
}

function isWritable(style) {
  if (style.indexOf("readonly:true")==-1 && isWriteable) return true;
  return false;
}

// convert e.g. B3 to (1,2)
function getCells(row,col,item) {
  if (cells[row] && cells[row][col] && cells[row][col].length==4) return cells[row][col][item];
  return "";
}
function getCellsR(row,col,item) {
  var arr = resolveCellArray(row,col);
  return getCells(arr[0],arr[1],item);
}
function getCells2(col_str,row,item,calls) {
  var col_num = colstrToColnum(col_str);
  var val_data = showCell(row-1,col_num,calls+1);
  var val = parseFloat(val_data);
  if (val == val_data) return val; else return val_data;
}
function getCells3(col_str,row,col_str2,row2,item,calls) {
  var result = new Array();
  var col_num = colstrToColnum(col_str);
  var col_num2 = colstrToColnum(col_str2);
  if (col_num > col_num2 || row > row2) return new Array("error");
  for (var i_row=row; i_row<=row2; i_row++) {
    for (var i_col=col_num; i_col<=col_num2; i_col++) {
	  var val_data = showCell(i_row-1,i_col,calls+1);
	  var val = parseFloat(val_data);
	  if (val == val_data) result[result.length] = val; else result[result.length] = val_data;
	}
  }
  return result;
}
function getCellStyle(row,col,style) {
  var span = getCells(row,col,1);
  var re = new RegExp(style+":(.*?);","i");
  if (p = re.exec(span)) span = parseInt(p[1]); else span = 0;
  return span;
}
function setCells(row,col,item,value) {
  if (!cells[row]) cells[row] = new Array();
  if (!cells[row][col]) cells[row][col] = new Array("","","","");
  if (cells[row][col][item]!=value) {
    cells[row][col][item] = value;
	return true;
  } else return false;
}
function setCellsR(row,col,item,value) {
  var arr = resolveCellArray(row,col);
  return setCells(arr[0],arr[1],item,value);
}

function loadScriptFile(location){
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = location;
  document.getElementsByTagName("head").item(0).appendChild(script);
}
function loadStyleFile(location){
  var script = document.createElement("link");
  script.type = "text/css";
  script.rel = "stylesheet";
  script.href = location;
  document.getElementsByTagName("head").item(0).appendChild(script);
}

function load(code) {
  if (code.indexOf("dbCells")==-1) {
    if (code.indexOf(tab)==-1) cells = loadCSV(code); else cells = loadTSV(code);
	if (!cells) return;
  } else {
    try { eval(code); }
    catch (err) {
      // alert(trans("Error loading data:")+" "+err); // oneye
	  return;
    }
	window.registerFuncs = registerFuncs;
    if (registerFuncs) {
      for (var i=0; i<registerFuncs.length; i++) {
        window[registerFuncs[i]] = eval(registerFuncs[i]);
	  }
    }
    /* Benchmark
    dbCells = new Array();
    for (var i=0; i<100; i++) {
      for (var i2=0; i2<100; i2++) {
        dbCells[dbCells.length] = [i,i2,i+"_Mit der Beta 2 von Vista zeigt Microsoft, wie weit der Nach Heft-CD."+i2,""];
      }
    }
    */
    // process 1 dimensional dbCells to 2 dimensional data
    cells = new Array();
    try {
      for (var i=0; i<dbCells.length; i++) {
	    if (!dbCells[i]) continue;
        if (!cells[dbCells[i][1]]) cells[dbCells[i][1]] = new Array();
        cells[dbCells[i][1]][dbCells[i][0]] = new Array(dbCells[i][2],dbCells[i][3],dbCells[i][4],"");
      }
    }
    catch (err) {
      // alert(trans("Error parsing data:")+" "+err+" i="+i+" cells=\""+dbCells[i]+"\""); // oneye
	  return;
    }
  }
  if (typeof cells[-2] != "undefined") showColumnGroups = true; else showColumnGroups = false;
  active = "content";
  getObj("source").style.display = "none";
  getObj("data").style.display = "inline";
  display();
}
function cancelLoad() {
  active = "content";
  getObj("source").style.display = "none";
  getObj("data").style.display = "inline";
  display();
}
function loadCSV(code) {
  code = code.replace(/([^,])""([^,])/g,"$1#quot#$2").replace(/\r/g,"");
  code = code.replace(/(".*?")/g, function(str){ return str.replace(/,/g,"#comm#"); });
  code = code.replace(/([^,])""([^,])/g,"$1#quot#$2");
  code = code.split("\n");
  for (var i=0; i<code.length; i++) {
    code[i] = "[\""+code[i].replace(/^"|"\s*$/g,"").replace(/"?,"?/g,"\",\"")+"\"]";
	if (i != code.length-1) code[i] += ",";
  }
  code = "dbCells = [\n"+code.join("\n")+"\n];\n";
  code = code.replace(/#comm#/g,",").replace(/#quot#/g,"\\\"");
  return loadDbCells(code);
}
function loadTSV(code) {
  code = code.replace(/^\/\/.*?\n/g,"").replace(/\r/g,"").split("\n");
  for (var i=0; i<code.length; i++) {
    code[i] = "[\""+code[i].replace(/"/g,"\\\"").replace(/	/g,"\",\"")+"\"]"; // tab
	if (i != code.length-1) code[i] += ",";
  }
  code = "dbCells = [\n"+code.join("\n")+"\n];\n";
  code = code.replace(/\[""\],\n/g,"");
  return loadDbCells(code);
}
function loadDbCells(code) {
  try { eval(code); }
  catch (err) {
    // alert(trans("Error loading data:")+" "+err); // oneye
	return false;
  }
  // process 1 dimensional dbCells to 2 dimensional data
  cells = new Array();
  try {
    for (var i=0; i<dbCells.length; i++) {
      for (var i2=0; i2<dbCells[i].length; i2++) {
	    if (dbCells[i][i2]) {
          if (!cells[i-1]) cells[i-1] = new Array();
          cells[i-1][i2] = new Array(dbCells[i][i2]+"","","","");
  } } } }
  catch (err) {
    // alert(trans("Error parsing data:")+" "+err+" i="+i+" cells=\""+dbCells[i]+"\""); // oneye
	return false;
  }
  return cells;
}

function save(format) {
  active = "code";
  getObj("status").innerHTML = "";
  var out = "";
  if (format == "csv") out = cellsToCSV();
    else if (format == "tsv") out = cellsToTSV();
	else out = cellsToJS();
  getObj("data").style.display = "none";
  getObj("source").style.display = "inline";
  getObj("code").value = out;
}

function cellsToJS() {
  var out = "";
  out += "dbCells = [\n";
  for (var i=-2; i<cells.length; i++) {
    if (cells[i]) {
      for (var i2=-1; i2<cells[i].length; i2++) {
	    if (!cells[i][i2]) continue;
		if (cells[i][i2][0]=="" && cells[i][i2][1]=="") continue;
        out += "  ["+i2+","+i+",\""+strescape(cells[i][i2][0])+"\",\""+strescape(cells[i][i2][1])+"\"";
		if (cells[i][i2][2] && isNaN(cells[i][i2][2])) out += ",\""+strescape(cells[i][i2][2])+"\"";
		  else if (cells[i][i2][2]) out += ","+cells[i][i2][2];
		out += "], // "+buildColName(i2)+(i+1)+"\n";
      }
	  out += "\n";
	}
  }
  if (cells.length>0) out = out.substring(0,out.length-2)+"\n];\n"; else out += "];\n";
  if (registerFuncs) {
    out += "\nvar registerFuncs = [";
    for (var i=0; i<registerFuncs.length; i++) {
	  out += "\""+registerFuncs[i]+"\",";
    }
    out = out.substring(0,out.length-1)+"];\n\n";
    for (var i=0; i<registerFuncs.length; i++) {
	  out += eval(registerFuncs[i])+"\n\n";
    }
    out = out.substring(0,out.length-2);
  }
  return out;
}

function cellsToCSV() {
  var out = "";
  for (var i=-1; i<cells.length; i++) {
    if (cells[i]) {
      for (var i2=0; i2<cells[i].length; i2++) {
	    if (cells[i][i2] && cells[i][i2][0]) {
		  if (i==-1 && cells[i][i2][2]) {
		    out += "\""+cells[i][i2][2].replace(/\\/g,"\\\\").replace(/"/g,"\"\"")+"\",";
		  } else {
		    var val = showCell(i,i2);
		    if (isNaN(val)) {
		      out += "\""+val.replace(/\\/g,"\\\\").replace(/"/g,"\"\"")+"\",";
		    } else out += val+",";
		  }
		} else out += ",";
      }
      out = out.substring(0,out.length-1)+"\n";
	} else out += ",\n";
  }
  return out;
}

function cellsToTSV() {
  var out = "// "+trans("Copy / paste this code to other spreadsheet applications (e.g. Excel)")+":\n\n";
  for (var i=-1; i<cells.length; i++) {
    if (cells[i]) {
      for (var i2=0; i2<cells[i].length; i2++) {
	    if (cells[i][i2] && cells[i][i2][0]) {
	      if (i==-1 && cells[i][i2][2]) {
		    out += cells[i][i2][2]+tab;
		  } else {
		    out += showCell(i,i2)+tab;
		  }
		} else out += tab;
      }
      out = out.substring(0,out.length-1)+"\n";
	} else if (i==-1) out += tab+"\n";
  }
  return out;
}

function addHiddenParam(parent,name,value) {
  param = document.createElement("input");
  parent.appendChild(param);
  param.setAttribute("type","hidden");
  param.setAttribute("name",name);
  param.setAttribute("value",value);
}

function saveSGS() {
  var url = "index.php?view="+escape(sgs_view)+"&folder="+escape(sgs_folder);
  if (sgs_view=="edit") url += "&form_submit_edit=checked"; else url += "&form_submit_create=checked";
  var out = "";
  var limit = 0;
  var myform=document.createElement("form");
  for (var i=0; i<cells.length; i++) {
    if (cells[i]) {
	  var id = i;
	  if (cells[-1][0][2]=="id" && cells[i][0] && cells[i][0][3]!="") id = cells[i][0][3];
	  addHiddenParam(myform,"form_fields[]",id)
	  addHiddenParam(myform,"form_"+id+"_folder",escape(sgs_folder))
	  limit++;
      for (var i2=0; i2<cells[-1].length; i2++) {
	  
	    var key = "";
		if (cells[-1] && cells[-1][i2]) {
		  if (cells[-1][i2][2]) key = cells[-1][i2][2]; else key = cells[-1][i2][0];
		}
	    if (key) addHiddenParam(myform,"form_"+id+"_"+key,showCell(i,i2))
  } } }
  myform.action = url+"&limit="+limit;
  myform.method = "POST";
  myform.style.display = "none";
  document.body.appendChild(myform);
  myform.submit();
}

function loadSheetFromUrl(location) {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.onload = script.onreadystatechange = function (event) { /* oneye */
	if (agent === 'msie') {
		if (script.readyState === 'loaded' || script.readyState === 'complete') {
			load('// dbCells');
		}
	} else if (agent === 'opera') {
		if (typeof event !== 'string' && event.type === 'load') {
			load('// dbCells');
		}
	} else if (typeof event !== 'string' && (event.type === 'load' || (event.type === 'readystatechange' && (event.target.readyState === 'complete' || event.target.readyState === 'loaded')))) {
		load('// dbCells');
	}
  };
  script.src = location;
  document.getElementsByTagName("head").item(0).appendChild(script);
}

function resetPath() { // oneye
	window.parent.sendMsg($checknum,'resetPath','');
}

function saveCode() { // oneye
	window.parent.sendMsg($checknum,'saveFile','<arg1>' + Base64.encode(cellsToJS()) + '</arg1>');
}

function saveCodeClose() { // oneye
	window.parent.sendMsg($checknum,'yDelete','<arg1>' + Base64.encode(cellsToJS()) + '</arg1>');
}

function saveAs() { // oneye
	window.parent.sendMsg($checknum,'saveAs','');
}

function loadCode() { // oneye
	window.parent.sendMsg($checknum,'openFile','');
}

function help() { // oneye
	window.parent.sendMsg($checknum,'help','');
}

function fullScreen() { // oneye
	window.parent.sendMsg($checknum,'fullScreen','');
}

function print() {
  var out = document.getElementById("content").innerHTML;
  out = out.replace(/(<\/tr>|<\/table>)/g,"$1\n");
  var obj = window.open("","print","toolbar=no,location=no,directories=no,status=no,menubar=yes,scrollbars=yes,resizable=yes,copyhistory=no,width=800,height=600");
  obj.document.write("<html><head><link media='all' href='"+printstyle+"' rel='stylesheet' type='text/css'/></head>\n");
  obj.document.write("<body>\n"+out+"\n</body></html>");
  obj.document.close();
  obj.window.print();
}

function insertRow() {
  for (var i=cells.length-1; i>=currRow; i--) {
    if (cells[i]) {
      for (var i2=0; i2<cells[i].length; i2++) {
	    if (!cells[i][i2]) continue;
		// TODO2 change formulas ?
		if (!cells[i+1]) cells[i+1] = new Array();
		cells[i+1][i2] = cells[i][i2];
		cells[i][i2] = "";
	  }
	}
  }
  display();
}
function deleteRow() {
  var row0 = currRow;
  var row1 = currRow;
  if (multiRange.length>0) {
    var cRange = getMultiRange(multiRange);
	row0 = cRange[0];
	row1 = cRange[2];
  }
  for (var row=row0; row<=row1; row++) {
    for (var i=row0; i<cells.length; i++) {
      if (cells[i]) {
        for (var i2=0; i2<cells[i].length; i2++) {
		  if (!cells[i+1]) cells[i+1] = new Array();
	      if (!cells[i+1][i2] && cells[i][i2]) cells[i][i2] = "";
	      if (!cells[i+1][i2] && !cells[i][i2]) continue;
		  // TODO2 change formulas ?
		  cells[i][i2] = cells[i+1][i2];
		  cells[i+1][i2] = "";
  } } } }
  display();
}
function insertColumn() {
  for (var i=0; i<cells.length; i++) {
    if (cells[i]) {
      for (var i2=cells[i].length-1; i2>=currCol; i2--) {
	    if (!cells[i][i2]) continue;
		// TODO2 change formulas ?
		cells[i][i2+1] = cells[i][i2];
		cells[i][i2] = "";
      }
	}
  }
  display();
}
function deleteColumn() {
  var col0 = currCol;
  var col1 = currCol;
  if (multiRange.length>0) {
    var cRange = getMultiRange(multiRange);
	col0 = cRange[1];
	col1 = cRange[3];
  }
  for (var col=col0; col<=col1; col++) {
    for (var i=0; i<cells.length; i++) {
      if (cells[i]) {
        for (var i2=col0; i2<cells[i].length; i2++) {
	      if (!cells[i][i2+1] && cells[i][i2]) cells[i][i2] = "";
	      if (!cells[i][i2+1] && !cells[i][i2]) continue;
		  // TODO2 change formulas ?
		  cells[i][i2] = cells[i][i2+1];
		  cells[i][i2+1] = "";
  } } } }
  display();
}

function scroll() {
  scrollDown();
  scrollUp();
  scrollRight();
  scrollLeft();
}
function scrollUp() {
  var obj = resolveCell(currRow,currCol);
  var posY = findPosY(obj);
  if (posY < (getObj("content").scrollTop+100) && getObj("content").scrollTop > (posY-100)) {
    getObj("content").scrollTop = posY-100;
  }

  var posX = findPosX(obj);
  if (posX < getObj("content").scrollLeft+200 && getObj("content").scrollLeft > (posX-150)) {
    getObj("content").scrollLeft = posX-150;
  }
}
function scrollDown() {
  var obj = resolveCell(currRow,currCol);
  var posY = findPosY(obj);
  var height = return_height();
  if (obj && (posY+obj.offsetHeight+100) > height) {
    var newHeight = posY+obj.offsetHeight+100-height;
    if (newHeight > getObj("content").scrollTop) getObj("content").scrollTop = newHeight;
  }

  var posX = findPosX(obj);
  var width = return_width();
  if (obj && (posX+obj.offsetWidth+100) > width) {
    var newWidth = posX+obj.offsetWidth+100-width;
    if (newWidth > getObj("content").scrollLeft) getObj("content").scrollLeft = newWidth;
  }
}
function scrollLeft() {
  scrollUp();
}
function scrollRight() {
  scrollDown();
}

function removeSelectedCell() {
  if (multiRange.length>0) {
    var cRange = getMultiRange(multiRange);
	for (var row=cRange[0]; row<=cRange[2]; row++) {
	  for (var col=cRange[1]; col<=cRange[3]; col++) {
	    if (isWritable(getCellsR(row,col,1))) {
	      setCellsR(row,col,0,"");
	      setCellsR(row,col,1,"");
    	  if (!auto_recalc) {
		    var obj2 = resolveCell(row,col);
		    obj2.innerHTML = "<div>&nbsp;</div>";
  }	} } } } else {
    removeCell(currRow,currCol);
    if (!auto_recalc && isWritable(getCellsR(currRow,currCol,1))) {
      var obj2 = resolveCell(currRow,currCol);
      obj2.innerHTML = "<div>&nbsp;</div>";
	}
  }
  if (auto_recalc) display();
}
function cutcopy(mode,color) {
  if (!isWriteable) return;
  if (clipboard_range.length>0) {
    highlightRange(clipboard_range,"","");
  } else {
    if (clipboard_mode) {
	  var obj = resolveCell(clipboard_row,clipboard_col);
	  if (obj) obj.style.backgroundColor = "";
	}
  }
  clipboard_mode = mode;
  clipboard_row = currRow;
  clipboard_col = currCol;
  clipboard_range = getMultiRange(multiRange);
  if (multiRange.length>0) {
    highlightRange(multiRange,"",color);
  } else {
    var obj = resolveCell(currRow,currCol);
	if (obj) obj.style.backgroundColor = color;
  }
}
function paste() {
  if (clipboard_range.length>0) {
    var sRange = getMultiRange(clipboard_range);
    var cRange = new Array(currRow,currCol,currRow+sRange[2]-sRange[0],currCol+sRange[3]-sRange[1]);
    if (multiRange.length>0 && (multiRange[0]!=multiRange[2] || multiRange[1]!=multiRange[3])) {
	  cRange = getMultiRange(multiRange);
	}
    var rOffset = 0;
	var cOffset = 0;
	if ((cRange[0] >= sRange[0] && cRange[1] >= sRange[1]) || (cRange[0] > sRange[0] && cRange[1] < sRange[1])) {
	  for (var row=cRange[2]; row>=cRange[0]; row--) {
	    rOffset = (row - cRange[0]) % (sRange[2]-sRange[0]+1);
	    for (var col=cRange[3]; col>=cRange[1]; col--) {
	      cOffset = (col - cRange[1]) % (sRange[3]-sRange[1]+1);
          copyCell(sRange[0] + rOffset, sRange[1] + cOffset, row, col);
		  var obj = resolveCell(sRange[0] + rOffset, sRange[1] + cOffset);
		  if (obj) obj.style.backgroundColor = "";
	    }
	  }
	} else {
	  for (var row=cRange[0]; row<=cRange[2]; row++) {
	    rOffset = (row - cRange[0]) % (sRange[2]-sRange[0]+1);
	    for (var col=cRange[1]; col<=cRange[3]; col++) {
	      cOffset = (col - cRange[1]) % (sRange[3]-sRange[1]+1);
          copyCell(sRange[0] + rOffset, sRange[1] + cOffset, row, col);
	      var obj = resolveCell(sRange[0] + rOffset, sRange[1] + cOffset);
		  if (obj) obj.style.backgroundColor = "";
	    }
	  }
	}
	if (clipboard_mode=="cut") {
	  for (var row=sRange[0]; row<=sRange[2]; row++) {
	    for (var col=sRange[1]; col<=sRange[3]; col++) {
		  if ((row < cRange[0] || row > cRange[2]) ||
		      (col < cRange[1] || col > cRange[3])) removeCell(row,col);
	    }
	  }
	  clipboard_mode = "";
	}
  } else {
 	if (multiRange.length>0 && (multiRange[0]!=multiRange[2] || multiRange[1]!=multiRange[3])) {
	  cRange = getMultiRange(multiRange);
	  for (var row=cRange[2]; row>=cRange[0]; row--) {
	    for (var col=cRange[3]; col>=cRange[1]; col--) {
	      copyCell(clipboard_row,clipboard_col,row,col);
		}
	  }
      if (clipboard_mode=="cut" && (clipboard_row < cRange[0] || clipboard_row > cRange[2] ||
		  clipboard_col < cRange[1] || clipboard_col > cRange[3])
	  ) {
	    removeCell(clipboard_row,clipboard_col);
      }
	} else {
      copyCell(clipboard_row,clipboard_col,currRow,currCol);
      if (clipboard_mode=="cut" && (clipboard_row!=currRow || clipboard_col!=currCol)) {
	    removeCell(clipboard_row,clipboard_col);
      }
	}
	if (clipboard_mode=="cut") clipboard_mode = "";
  }
  display();
}
function sortNum(val) {
  if (isNaN(val)) return val.charAt(0).toLowerCase().charCodeAt(0);
  return parseFloat(val);
}
function sortCells(a,b) {
  if (a[currCol] && b[currCol]) {
    if (a[currCol][3]=="") return 1;
    if (b[currCol][3]=="") return -1;
    a = sortNum(a[currCol][3]);
	b = sortNum(b[currCol][3]);
	return a-b;
  }
  return (a[currCol]?1:-1);
}
function sort(asc) {
  if (multiRange.length>0) {
    var cRange = getMultiRange(multiRange);
	var cCells = new Array();
	for (var row=cRange[0]; row<=cRange[2]; row++) {
	  for (var col=cRange[1]; col<=cRange[3]; col++) {
		if (!cCells[row]) cCells[row] = new Array();
		if (cells[row] && cells[row][col]) cCells[row][col] = cells[row][col];
	  }
	}
    if (asc) cCells = cCells.sort(sortCells); else cCells = cCells.sort(sortCells).reverse();
	for (var row=cRange[0]; row<=cRange[2]; row++) {
	  for (var col=cRange[1]; col<=cRange[3]; col++) {
	    if (!cells[row]) cells[row] = new Array();
		cells[row][col] = cCells[row][col];
	  }
	}
  } else {
    if (asc) cells = cells.sort(sortCells); else cells = cells.sort(sortCells).reverse();
  }
  display();
}

function buildStatus(row,col) {
  var status = "";
  var colTitle = getCellsR(-1,col,0);
  var colGroupTitle = getCellsR(-2,col,0);
  var cellTitle = getCellsR(row,col,2);
  if (cellTitle && row != -1) status += cellTitle+" - ";
  if (colTitle) {
	var colTitleLong = getCellsR(-1,col,2);
	if (colGroupTitle) status += colGroupTitle+": ";
	status += (colTitleLong?colTitleLong:colTitle)+" - ";
  } else if (colGroupTitle) {
	status += colGroupTitle+" - ";
  }
  var rowTitle = getCellsR(row,-1,0);
  if (rowTitle) {
	var rowTitleLong = getCellsR(row,-1,2);
	status += (rowTitleLong?rowTitleLong:rowTitle)+" - ";
  }
  getObj("status").innerHTML = status+buildColName(col)+(row+1);

  if (isMouseDown) {
    markCell(row,col);
    highlightRange(multiRange,"cell");
    multiRange[2] = row;
    multiRange[3] = col;
    highlightRange(multiRange,"cell_highlight_over");
  }
}
function highlightRange(multiRange,classname,att) {
  if (multiRange.length==0) return false;
  var cRange = getMultiRange(multiRange);
  for (var row=cRange[0]; row<=cRange[2]; row++) {
	for (var col=cRange[1]; col<=cRange[3]; col++) {
	  obj = resolveCell(row,col);
	  if (obj && classname) obj.className = classname;
	    else if (!classname && obj) obj.style.backgroundColor = att;
	}
  }
}
function getMultiRange(multiRange) {
  if (multiRange.length==0) return new Array();
  var row1 = multiRange[0]>multiRange[2]?multiRange[2]:multiRange[0];
  var row2 = multiRange[0]>multiRange[2]?multiRange[0]:multiRange[2];
  var col1 = multiRange[1]>multiRange[3]?multiRange[3]:multiRange[1];
  var col2 = multiRange[1]>multiRange[3]?multiRange[1]:multiRange[3];
  return new Array(row1,col1,row2,col2);
}
function mousedown(row,col) {
  if (getObj("styling").disabled) {
	document.onmousedown = function() { return false; };
	document.onselectstart = function() { return false; };
	isMouseDown=1;
	highlightRange(multiRange,"cell");
    multiRange = new Array(row,col,row,col);
	highlightRange(multiRange,"cell_highlight_over");
  }
}
function mouseup() {
  if (getObj("styling").disabled) {
	document.onmousedown="";
    document.onselectstart="";
	isMouseDown=0;
  }
}
function markCell(row,col) {
  highlightCell(row,col,"cell_highlight_over");
  highlightCellHeader(row,col);
  currRow = row;
  currCol = col;
  getObj("value").value = getCellsR(row,col,0);
  getObj("styling").value = getCellsR(row,col,1);
  getObj("field").value = buildColName(col)+(row+1);
}
function mouseoverCell(row,col) {
  if (getObj("styling").disabled) {
    if (row==currRow && col==currCol && getObj("field").value) {
	  editCell(row,col,0);
	} else {
	  markCell(row,col);
	  buildStatus(row,col);
	}
  } else if (!getObj("value").disabled) {
    var obj = getObj("value");
	var ins = buildColName(col)+(row+1);
	if (obj.selectionStart) {
	  var tmp = obj.selectionStart;
	  obj.value = obj.value.substring(0,obj.selectionStart)+ins+obj.value.substring(obj.selectionStart);
	  obj.selectionStart = tmp+ins.length;
	  obj.selectionEnd = tmp+ins.length;
      obj.focus();
	} else if (document.selection) {
	  obj.value += ins;
	}
	previewValue();
  }
}
function highlightCell(row,col,className) {
  var obj = resolveCell(currRow,currCol);
  if (obj) obj.className = "cell";
  obj = resolveCell(row,col);
  if (obj) obj.className = className;
}
function highlightCellHeader(row,col) {
  var obj = resolveCell(-1,currCol);
  if (obj) obj.className = "border";
  obj = resolveCell(currRow,-1);
  if (obj) obj.className = "border";
  var sRow = -1;
  if (row<-1) sRow = -2;
  obj = resolveCell(sRow,col);
  if (obj) obj.className = "border_highlight";
  if (row>=-1) {
    obj = resolveCell(row,-1);
    if (obj) obj.className = "border_highlight";
  }
}
function showCell(row,col,calls) {
  if (typeof calls == "undefined") calls = 0;
  value = getCells(row,col,0);
  if (calls>25) { // avoid endless recursion
    value = "undefined";
  } else if (value!="" && value.charAt(0)=="=") {
    var cmd = "";
    var token = "";
    var openToken = "";
    var sequence = "";
    for (var i=0; i<value.length; i++) {
      token = value.charAt(i);
	  sequence += token;
      if (((token=="'" || token=="\"") && openToken=="") || i==value.length-1) {
	    if (openToken=="") {
		  sequence = sequence.replace(/([A-Z]+)([0-9]+):([A-Z]+)([0-9]+)/g,"getCells3('$1',$2,'$3',$4,0,"+(calls+1)+")");
		  sequence = sequence.replace(/([A-Z]+)([0-9]+)/g,"getCells2('$1',$2,0,"+(calls+1)+")");
	    }
	    openToken = token;
	    cmd += sequence;
	    sequence = "";
	  } else if (token==openToken && value.charAt(i-1)!="\\") {
	    openToken = "";
	    cmd += sequence;
	    sequence = "";
	  }
    }
    try { eval("value"+cmd); }
    catch (err) {
      // alert(trans("Error evaluating")+" "+buildColName(col)+(row+1)+" \""+value+"\"\n\n"+err+"\n\n"+trans("value")+cmd); // oneye
    }
  }
  if (cells[row] && cells[row][col]) cells[row][col][3] = value;
  return value;
}
function previewCell(value,calls) {
  if (value=="" || value.charAt(0)!="=") return value;
  if (calls>25) return "undefined"; // avoid endless recursion
  var cmd = "";
  var token = "";
  var openToken = "";
  var sequence = "";
  for (var i=0; i<value.length; i++) {
    token = value.charAt(i);
	sequence += token;
    if (((token=="'" || token=="\"") && openToken=="") || i==value.length-1) {
	  if (openToken=="") {
		sequence = sequence.replace(/([A-Z]+)([0-9]+):([A-Z]+)([0-9]+)/g,"getCells3('$1',$2,'$3',$4,0,"+(calls+1)+")");
		sequence = sequence.replace(/([A-Z]+)([0-9]+)/g,"getCells2('$1',$2,0,"+(calls+1)+")");
	  }
	  openToken = token;
	  cmd += sequence;
	  sequence = "";
	} else if (token==openToken && value.charAt(i-1)!="\\") {
	  openToken = "";
	  cmd += sequence;
	  sequence = "";
	}
  }
  var nvalue = "";
  try { eval("nvalue"+cmd); }
  catch (err) {}
  if (nvalue!=null && (nvalue+"").length>0) return nvalue; else return value;
}
function gotoCell(pos) {
  var re = new RegExp("([@A-Z]+)([0-9]+)","g");
  if (p = re.exec(pos)) {
    var col = colstrToColnum(p[1]);
	var row = p[2]-1;
    if (col>=-1 && row>=0) {
	  getObj("focus").focus();
	  if (col!=currCol || row!=currRow) {
		if (col >= cols || row <= rows) {
		  col0 = col - (col % cols);
		  row0 = row - (row % rows);
		  display();
		}
	    mouseoverCell(row,col);
		scroll();
	  }
	  return;
	}
  }
  // alert(trans("Invalid cell.")); // oneye
}
function editCell(row,col,keyCode) {
  active = "content";
  if (!isWriteable) return;
  if (!getObj("styling").disabled) cancelCell();
  
  highlightCell(row,col,"cell_highlight");
  highlightCellHeader(row,col);
  currRow = row;
  currCol = col;
  
  if (isWritable(getCellsR(row,col,1))) {
    getObj("value").disabled = false;
  }
  getObj("styling").disabled = false;
  getObj("save").disabled = false;
  getObj("cancel").disabled = false;
  if (getObj("cols")) getObj("cols").disabled = true;
  if (getObj("rows")) getObj("rows").disabled = true;
  getObj("field").disabled = true;
  getObj("styling").value = getCellsR(row,col,1);
  if (keyCode > 32 && agent=="firefox" && !getObj("value").disabled) {
  	getObj("value").value = String.fromCharCode(keyCode);
  } else {
    getObj("value").value = getCellsR(row,col,0);
  }
  if (!getObj("value").disabled) {
    getObj("value").focus();
  } else {
    getObj("styling").focus();
  }
}
function copyCell(row,col,cRow,cCol) {
  if (!isWritable(getCellsR(cRow,cCol,1))) {
    // alert(trans("Cannot edit: cell is marked as readonly.")); // oneye
	return;
  }
  if (row!=cRow || col!=cCol) {
    setCells(cRow,cCol,0,getCellsR(row,col,0));
    setCells(cRow,cCol,1,getCellsR(row,col,1));
  }
}
function saveCell() {
  var changed = setCellsR(currRow,currCol,0,getObj("value").value);
  var changed2 = setCellsR(currRow,currCol,1,getObj("styling").value);
  if (changed || changed2) {
    if (!auto_recalc) {
	  disableEdit();
  	  previewValue();
    } else display();
  } else cancelCell();
}
function disableEdit() {
  getObj("value").blur();
  highlightCell(currRow,currCol,"cell_highlight_over");
  getObj("value").disabled = true;
  getObj("styling").disabled = true;
  getObj("save").disabled = true;
  getObj("cancel").disabled = true;

  if (getObj("cols")) getObj("cols").disabled = false;
  if (getObj("rows")) getObj("rows").disabled = false;
  getObj("field").disabled = false;

  getObj("multiline").style.display = "none";
  getObj("content").style.overflow = "auto"; // needed for invisible cursor
}
function cancelCell() {
  disableEdit();
  getObj("value").value = getCellsR(currRow,currCol,0);
  getObj("styling").value = getCellsR(currRow,currCol,1);
  previewValue();
}
function removeCell(row,col) {
  if (!isWritable(getCellsR(row,col,1))) {
    // alert(trans("Cannot edit: cell is marked as readonly.")); // oneye
	return;
  }
  setCellsR(row,col,0,"");
  setCellsR(row,col,1,"");
}
function resolveCell(row,col) {
  var obj = getObj(row+"_"+col);
  if (!obj && marks[row] && marks[row][col]) {
	obj=getObj(marks[row][col][0]+"_"+marks[row][col][1]);
  }
  return obj;
}
function resolveCellArray(row,col) {
  var obj = getObj(row+"_"+col);
  if (!obj && marks[row] && marks[row][col]) {
    var arr = marks[row][col];
    row = arr[0];
	col = arr[1];
  }
  return new Array(row,col);
}

function getSize(width) {
  var myWidth = 0, myHeight = 0;
  if (typeof(window.innerWidth) == 'number') {
    myWidth = window.innerWidth;
    myHeight = window.innerHeight;
  } else if( document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
    //IE 6+ in 'standards compliant mode'
    myWidth = window.document.documentElement.clientWidth;
    myHeight = window.document.documentElement.clientHeight;
  } else if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
    // IE 4 compatible
    myWidth = document.body.clientWidth;
    myHeight = document.body.clientHeight;
  } else if (self.screen.height && self.screen.width) {
    myWidth = self.screen.width;
    myHeight = self.screen.height;
  }
  if (width) return myWidth; else return myHeight;
}
function return_height() {
  return getSize(0);
}
function return_width() {
  return getSize(1);
}
function getObj(id) {
  return document.getElementById(id);
}
function getmykey(event) {
  if (typeof(event)=="undefined") return window.event.keyCode;
  if (event.keyCode==0 && event.charCode!=0) return event.charCode;
  if (event.keyCode==0) return event.which;
  return event.keyCode;
}
function findPosY(obj) {
  if (!obj) return 0;
  var curtop = 0;
  if (obj.offsetParent) {
	while (obj.offsetParent) {
	  curtop += obj.offsetTop;
	  obj = obj.offsetParent;
	}
  } else if (obj.y) curtop += obj.y;
  return curtop;
}
function findPosX(obj) {
  if (!obj) return 0;
  var curtop = 0;
  if (obj.offsetParent) {
	while (obj.offsetParent) {
	  curtop += obj.offsetLeft;
	  obj = obj.offsetParent;
	}
  } else if (obj.x) curtop += obj.x;
  return curtop;
}
function strescape(str) {
  return str.replace(/\\/g,"\\\\").replace(/"/g,"\\\"");
}
function htmlEscape(str,fill) {
  if (str==null || str.length == 0) return (fill?"&nbsp;":"");
  str = new String(str);
  if (str.indexOf("html:")==0) {
    str = str.substring(5);
  } else {
    str = str.replace(/</g,"&lt;").replace(/>/g,"&gt;"); // escape special characters
    str = str.replace(/'/g,"&#039;").replace(/"/g,"&quot;");
    str = str.replace(/([^\s$]+@[^\s$]+)/g,"<a href='$1'>$1</a>"); // make emails appear as a link
    str = str.replace(/img:((http[s]?:\/\/[^\s$]+\.(gif|jpg|png))|(graphs\.php\?.*?$))/g,"<img src='$1'>"); // display images
    str = str.replace(/(^|[^'])(http[s]?:\/\/[^\s$]+)/g,"$1<a target='_blank' href='$2'>$2</a>"); // make http(s)://... appear as link
    str = str.replace(/\\n/g,"<br>");
  }
  return str;
}
function handleErr(msg,url,l) {
  // alert(trans("There was an error on this page.")+"\n\n"+trans("Error:")+" "+msg+"\n"+trans("Url")+": "+url+"\n"+trans("Line:")+" "+l); // oneye
  return true;
}

// convert 26 to AA, 0 to A
function buildColName(num) {
  var val = "";
  var result = "";
  if (num>=702) {
    val = (Math.floor(num/676)-1)%26;
	result += String.fromCharCode(val+65);
  }
  if (num>=26) {
    val = (Math.floor(num/26)-1)%26;
	result += String.fromCharCode(val+65);
  }
  result += String.fromCharCode(num%26+65);
  return result;
}
//convert AA to 26
function colstrToColnum(col_str) {
  var col_num = 0;
  for (var i=0; i<col_str.length; i++) {
    col_num += 26*(col_str.length-i-1) + (col_str.charCodeAt(i)-65);
  }
  return col_num;
}

function formatStyle(style,value) {
  if (style.indexOf("text-align:")==-1 && value.length>0 && !isNaN((value+"").replace(/[$%,]/g,"").replace("&euro;",""))) {
    style += "; text-align:right; white-space:nowrap;";
	if (value<0 && style.indexOf("color:")==-1) style += "color:#FF0000;";
  }
  return style.replace(/(format|readonly|colspan|rowspan):.*?;/ig,"");
}
function formatValue(value,style) {
  if (style.indexOf("format:")!=-1) {
    if (style.indexOf("format:euro")!=-1) value = formatNumber(value)+" &euro;";
      else if (style.indexOf("format:dollar")!=-1) value = "$"+formatNumber(value);
      else if (style.indexOf("format:percent")!=-1) value = (value*100).toFixed(2)+"%";
      else if (style.indexOf("format:number")!=-1) value = formatNumber(value);
      else if (style.indexOf("format:datefulltime")!=-1) value = formatDateFullTime(value);
      else if (style.indexOf("format:datetime")!=-1) value = formatDateTime(value);
      else if (style.indexOf("format:datefull")!=-1) value = formatDateFull(value);
      else if (style.indexOf("format:date")!=-1) value = formatDate(value);
      else if (style.indexOf("format:time")!=-1) value = formatTime(value);
  } else if (!isNaN(value) && value!=0) {
    value = formatNumber(value).replace(/\.00$/,"");
  }
  return value;
}
function formatDate(value) {
  if (isNaN(new Date(value).getHours())) {
    value = value.replace(/(\d{1,2})\.(\d{1,2})\.(\d{2,4})/,"$2/$1/$3");
  }
  var dateObj = new Date(value);
  return (dateObj.getMonth()+1)+"/"+dateObj.getDate()+"/"+dateObj.getFullYear();
}
function formatDateFull(value) {
  if (isNaN(new Date(value).getHours())) {
    value = value.replace(/(\d{1,2})\.(\d{1,2})\.(\d{2,4})/,"$2/$1/$3");
  }
  var dateObj = new Date(value);
  var months = new Array(trans("January"),trans("February"),trans("March"),trans("April"),trans("May"),trans("June"),trans("July"),trans("August"),trans("September"),trans("October"),trans("November"),trans("December"));
  var days = new Array(trans("Sunday"),trans("Monday"),trans("Tuesday"),trans("Wednesday"),trans("Thursday"),trans("Friday"),trans("Sunday"));
  return days[dateObj.getDay()]+", "+months[dateObj.getMonth()]+" "+dateObj.getDate()+" "+dateObj.getFullYear();
}
function formatTime(value) {
  if (isNaN(new Date(value).getHours())) {
    value = value.replace(/\d+\.\d+\.\d+/,"$2/$1/$3");
	if (value.length<12) value = "01/01/01 "+value;
  }
  var dateObj = new Date(value);
  hour = dateObj.getHours();
  var a = "am";
  if (hour > 11) a = "pm";
  if (hour > 12) hour -= 12;
  if (hour == 0) hour = 12;
  return hour+":"+dateObj.getMinutes()+":"+dateObj.getSeconds()+" "+a;
}
function formatDateTime(value) {
  return formatDate(value)+" "+formatTime(value);
}
function formatDateFullTime(value) {
  return formatDateFull(value)+", "+formatTime(value);
}
function formatNumber(val) {
  var output = "";
  var sign = "";
  if (val < 0) {
	sign = "-";
	val *= -1;
  }
  number = Math.floor((val-0).toFixed(2))+"";
  if (number.length > 3) {
    var mod = number.length%3;
    var output = (mod==0?"":(number.substring(0,mod)));
    for (i=0; i<Math.floor(number.length/3); i++) {
      if (mod==0 && i==0) {
        output += number.substring(mod+3*i,mod+3*i+3);
      } else {
        output += ","+number.substring(mod+3*i,mod+3*i+3);
      }
    }
  } else output += number;
  if (val-number != 0) {
    output += Math.abs(val-number).toFixed(2).replace("0.",".");
  }
  return sign+output;
}
function param(str) {
  if (str.join) str = str.join(",");
  if (str.replace) return escape(str);
  return str;
}
function graph(type,title,data,keys,xtitle,ytitle,width,height) {
  var url = "img:graphs.php?type="+param(type)+"&title="+param(title);
  url += "&data="+param(data)+"&keys="+param(keys);
  if (typeof xtitle != "undefined") {
    url += "&xtitle="+param(xtitle);
  }
  if (typeof ytitle != "undefined") {
    url += "&ytitle="+param(ytitle);
  }
  if (typeof width != "undefined") {
    url += "&width="+width;
  }
  if (typeof height != "undefined") {
    url += "&height="+height;
  }
  return url;
}
function graph2(type,title,data,data2,keys,xtitle,ytitle,width,height) {
  var url = "img:graphs.php?type="+param(type)+"&title="+param(title);
  url += "&data="+param(data)+"&data2="+param(data2)+"&keys="+param(keys);
  if (typeof xtitle != "undefined") {
    url += "&xtitle="+param(xtitle);
  }
  if (typeof ytitle != "undefined") {
    url += "&ytitle="+param(ytitle);
  }
  if (typeof width != "undefined") {
    url += "&width="+width;
  }
  if (typeof height != "undefined") {
    url += "&height="+height;
  }
  return url;
}
/*
function param2(str) {
  if (str.join) str = str.join(",");
  if (str.replace) return escape(str.replace(/,/g,"|"));
  return str;
}
function graph(type,title,data,keys,xtitle,ytitle,width,height) {
  if (type=="line") type = "lc";
    else if (type=="pie") type = "p3";
    else if (type=="bar") type = "bvg";
    else if (type=="scatter") type = "s";
// Check: linesteps,

  var url = "img:http://chart.apis.google.com/chart?cht="+param(type)+"&chtt="+param(title);
  if (type!="s") {
	url += "&chd=t:"+param(data)+"&chl="+param2(keys);
    url += "&chds="+min(data)+","+max(data);
    url += "&chm=N*f0*,0000FF,0,-1,11";
  } else {
    url += "&chxt=x,y&chd=t:"+param(keys)+"|"+param(data);
  }
  /* Check: map
  if (typeof xtitle != "undefined") {
    url += "&xtitle="+param(xtitle);
  }
  if (typeof ytitle != "undefined") {
    url += "&ytitle="+param(ytitle);
  }
  if (typeof(width)!= "undefined" && typeof(height)!= "undefined") {
    url += "&chs="+width+"x"+height;
  } else url += "&chs=300x125";
  return url+"&.png";
}

function graph2(type,title,data,data2,keys,xtitle,ytitle,width,height) {
  if (type=="bar") type = "bvg";
    else if (type=="baraccumulate") type = "bvs";
    else if (type=="bar") type = "bvg";
    else if (type=="scatter") type = "s";
// Check linesteps, line

  var url = "img:http://chart.apis.google.com/chart?cht="+param(type)+"&chtt="+param(title);
  url += "&chd=t:"+param(data)+"|"+param(data2)+"&chl="+param2(keys);
  if (typeof xtitle != "undefined") {
    url += "&xtitle="+param(xtitle);
  }
  if (typeof ytitle != "undefined") {
    url += "&ytitle="+param(ytitle);
  }
  if (typeof(width)!= "undefined" && typeof(height)!= "undefined") {
    url += "&chs="+width+"x"+height;
  } else url += "&chs=300x125";
  return url;
}
  */
function sum(arr) {
  var result = 0;
  for (var i=0; i<arr.length; i++) result += arr[i];
  return result;
}
function min(arr) {
  var result = 0;
  if (arr.length>0) result = arr[0];
  for (var i=0; i<arr.length; i++) if (arr[i]<result) result = arr[i];
  return result;
}
function max(arr) {
  var result = 0;
  if (arr.length>0) result = arr[0];
  for (var i=0; i<arr.length; i++) if (arr[i]>result) result = arr[i];
  return result;
}
function avg(arr) {
  var result = 0;
  if (arr.length==0) return 0;
  for (var i=0; i<arr.length; i++) result += arr[i];
  return Math.round(1000*(result/arr.length))/1000; // round to 0.000
}
function count(arr) {
  var result = 0;
  return arr.length;
}

/**
*
*  Base64 encode / decode
*  http://www.webtoolkit.info/
*
**/

var Base64 = {

	// private property
	_keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",

	// public method for encoding
	encode : function (input) {
		var output = "";
		var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
		var i = 0;

		input = Base64._utf8_encode(input);

		while (i < input.length) {

			chr1 = input.charCodeAt(i++);
			chr2 = input.charCodeAt(i++);
			chr3 = input.charCodeAt(i++);

			enc1 = chr1 >> 2;
			enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
			enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
			enc4 = chr3 & 63;

			if (isNaN(chr2)) {
				enc3 = enc4 = 64;
			} else if (isNaN(chr3)) {
				enc4 = 64;
			}

			output = output +
			this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
			this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);

		}

		return output;
	},

	// public method for decoding
	decode : function (input) {
		var output = "";
		var chr1, chr2, chr3;
		var enc1, enc2, enc3, enc4;
		var i = 0;

		input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

		while (i < input.length) {

			enc1 = this._keyStr.indexOf(input.charAt(i++));
			enc2 = this._keyStr.indexOf(input.charAt(i++));
			enc3 = this._keyStr.indexOf(input.charAt(i++));
			enc4 = this._keyStr.indexOf(input.charAt(i++));

			chr1 = (enc1 << 2) | (enc2 >> 4);
			chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
			chr3 = ((enc3 & 3) << 6) | enc4;

			output = output + String.fromCharCode(chr1);

			if (enc3 != 64) {
				output = output + String.fromCharCode(chr2);
			}
			if (enc4 != 64) {
				output = output + String.fromCharCode(chr3);
			}

		}

		output = Base64._utf8_decode(output);

		return output;

	},

	// private method for UTF-8 encoding
	_utf8_encode : function (string) {
		string = string.replace(/\r\n/g,"\n");
		var utftext = "";

		for (var n = 0; n < string.length; n++) {

			var c = string.charCodeAt(n);

			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}

		}

		return utftext;
	},

	// private method for UTF-8 decoding
	_utf8_decode : function (utftext) {
		var string = "";
		var i = 0;
		var c = c1 = c2 = 0;

		while ( i < utftext.length ) {

			c = utftext.charCodeAt(i);

			if (c < 128) {
				string += String.fromCharCode(c);
				i++;
			}
			else if((c > 191) && (c < 224)) {
				c2 = utftext.charCodeAt(i+1);
				string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				i += 2;
			}
			else {
				c2 = utftext.charCodeAt(i+1);
				c3 = utftext.charCodeAt(i+2);
				string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
				i += 3;
			}

		}

		return string;
	}

}