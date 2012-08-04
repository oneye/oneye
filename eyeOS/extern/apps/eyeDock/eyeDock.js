/*global Calendar_show, EventHandler, getArrayArg, setWidgetPos, tinyMCE, xAddEventListener, xEvent, xLeft, xSlideTo, xWidth */
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

var DockMenu = {
	Selected: {
		className: 0,
		id: 0
	},

	DateTime: {
		Formats: [],
		MonthNames: 'January""February""March""April""May""June""July""August""September""October""November""December',
		MonthNamesFull: getArrayArg(' ""January""February""March""April""May""June""July""August""September""October""November""December'),
		MamesShort: getArrayArg(' ""Jan""Feb""Mar""Apr""May""Jun""Jul""Aug""Sep""Oct""Nov""Dec'),
		WeekDays0: 'S""M""T""W""T""F""S',
		WeekDays1: 'M""T""W""T""F""S""S',
		WeekDaysFull: getArrayArg('Sunday""Monday""Tuesday""Wednesday""Thursday""Friday""Saturday'),
		WeekDaysShort: getArrayArg('Sun""Mon""Tue""Wed""Thu""Fri""Sat'),

		Create: function (checknum, pid, type, place, id, format, startDay) {
			DockMenu.DateTime.Formats[pid + '_eyeDock_' + type + '_' + place + '_' + id] = format;
			DockMenu.DateTime.Update(pid, type, place, id);
			var params = [];
			params.backgroundNames = '#519eda';
			params.clickedBorder = '#558fc7';
			params.clickedWeek = '#c7dff6';
			params.dayName = '#ffffff';
			params.drawHighlight = 1;
			params.drawOnClick = 1;
			params.drawServerDate = '';
			params.forceDate = '';
			params.height = 148;
			params.monthNames = DockMenu.DateTime.MonthNames;
			params.myPid = pid;
			params.nextMonthDays = '#aaaaaa';
			params.preMonthDays = '#aaaaaa';
			params.rowsAndDate = '#519eda';
			params.selectFunc = '';
			params.startMonday = startDay;
			params.todayBackground = '#ffffff';
			params.todayBorder = '#ffffff';
			params.todayFontColor = '#000000';
			params.toWeekBackground = '#bbbbbb';
			params.visible = 1;
			if (startDay === 1) {
				params.weekDays = DockMenu.DateTime.WeekDays1;
			} else {
				params.weekDays = DockMenu.DateTime.WeekDays0;
			}
			params.weekEnd = '#519eda';
			params.width = 168;
			params.workDays = '#444444';
			Calendar_show(params, pid + '_eyeDock_' + type + '_' + place + '_' + id + '_calendar', pid + '_eyeDock_' + type + '_' + place + '_' + id + '_entries', 5, 5, 0, 0, checknum, 0);
			setWidgetPos(pid + '_eyeDock_' + type + '_' + place + '_' + id + '_calendar', pid + '_eyeDock_' + type + '_' + place + '_' + id + '_entries', 0, 0, 5, 5, 1);
		},

		Update: function (pid, type, place, id) {
			var date, day, e, hour, minute, month, second, text, weekDay, year;
			e = document.getElementById(pid + '_eyeDock_' + type + '_' + place + '_' + id + '_div');
			if (e) {
				date = new Date();
				year = date.getFullYear();
				month = date.getMonth() + 1;
				day = date.getDate();
				weekDay = date.getDay();
				hour = date.getHours();
				minute = date.getMinutes();
				second = date.getSeconds();
				text = DockMenu.DateTime.Formats[pid + '_eyeDock_' + type + '_' + place + '_' + id];

				text = text.replace(/\%G/, hour);
				text = text.replace(/\%D/, DockMenu.DateTime.WeekDaysShort[weekDay]);
				text = text.replace(/\%F/, DockMenu.DateTime.MonthNamesFull[month]);
				text = text.replace(/\%j/, day);
				text = text.replace(/\%l/, DockMenu.DateTime.WeekDaysFull[weekDay]);
				text = text.replace(/\%M/, DockMenu.DateTime.MonthNamesShort[month]);
				text = text.replace(/\%n/, month);
				text = text.replace(/\%Y/, year);
				text = text.replace(/\%y/, year.toString().substr(2));
				if (hour < 12) {
					text = text.replace(/\%a/, 'am');
					text = text.replace(/\%A/, 'AM');
					text = text.replace(/\%g/, hour);
				} else {
					text = text.replace(/\%a/, 'pm');
					text = text.replace(/\%A/, 'PM');
					text = text.replace(/\%g/, hour - 12);
				}
				if (day.toString().substr(day.length - 1) === '1') {
					text = text.replace(/\%S/, 'st');
				} else if (day.toString().substr(day.length - 1) === '2') {
					text = text.replace(/\%S/, 'nd');
				} else if (day.toString().substr(day.length - 1) === '3') {
					text = text.replace(/\%S/, 'rd');
				} else {
					text = text.replace(/\%S/, 'th');
				}
				if (month < 10) {
					month = '0' + month;
				}
				if (day < 10) {
					day = '0' + day;
				}
				if (hour < 10) {
					hour = '0' + hour;
				}
				if (minute < 10) {
					minute = '0' + minute;
				}
				if (second < 10) {
					second = '0' + second;
				}
				text = text.replace(/\%d/, day);
				text = text.replace(/\%H/, hour);
				text = text.replace(/\%i/, minute);
				text = text.replace(/\%m/, month);
				text = text.replace(/\%s/, second);
				if (hour > 12) {
					hour -= 12;
					if (hour < 10) {
						hour = '0' + hour;
					}
				}
				text = text.replace(/\%h/, hour);

				e.innerHTML = tinyMCE.entityDecode(text);
				setTimeout('DockMenu.DateTime.Update("' + pid + '", "' + type + '", "' + place + '", "' + id + '");', 1000);
			} else {
				DockMenu.DateTime.Formats[pid + '_eyeDock_' + type + '_' + place + '_' + id] = 0;
			}
		}
	},

	Hide: function (pid, type, place, id) {
		var e, f;
		e = document.getElementById(pid + '_eyeDock_' + type + '_' + place + '_' + id + '_entries');
		if (e) {
			e.style.display = 'none';
		}
		f = document.getElementById(pid + '_eyeDock_' + type + '_' + place + '_' + id);
		if (f) {
			f.className = 'eyeDock_' + type + '_' + place + '_menu';
		}
		if (DockMenu.Selected.id === pid + '_eyeDock_' + type + '_' + place + '_' + id) {
			DockMenu.Selected.id = 0;
		}
	},

	OnClick: function (e, isfriend) {
		e = new xEvent(e);
		if (typeof isfriend === 'undefined') {
			if (e.target.parentNode.className !== 'eyeContextMenuEntry' && e.target.className !== 'eyeContextMenuEntry' && e.target.className !== 'eyeContextMenu') {
				return true;
			}
		} else {
			if (isfriend && e.target.parentNode.className !== 'eyeContextMenuEntry' && e.target.className !== 'eyeContextMenuEntry' && e.target.className !== 'eyeContextMenu') {
				return isfriend;
			}
		}
		return false;
	},

	OnClickDateTime: function (e, id) {
		e = new xEvent(e);
		if (e.target.id === id || e.target.id === id + '_div' || e.target.id === id + '_img') {
			return DockMenu.OnClick(e);
		}
		return false;
	},

	Show: function (pid, type, place, id) {
		if (DockMenu.Selected.id) {
			document.getElementById(DockMenu.Selected.id + '_entries').style.display = 'none';
			document.getElementById(DockMenu.Selected.id).className = DockMenu.Selected.className;
		}
		DockMenu.Selected.className = 'eyeDock_' + type + '_' + place + '_menu';
		DockMenu.Selected.id = pid + '_eyeDock_' + type + '_' + place + '_' + id;
		document.getElementById(DockMenu.Selected.id).className = 'eyeDock_' + type + '_' + place + '_menu_selected';
		var entries = document.getElementById(DockMenu.Selected.id + '_entries');
		entries.style.display = 'block';
		if (!entries.handled) {
			entries.handled = 1;
			EventHandler.Add('click', pid + '_eyeDock_' + type + '_' + place + '_' + id, 'DockMenu.Hide("' + pid + '", "' + type + '", "' + place + '", "' + id + '");', 1, DockMenu.OnClick);
		}
	},

	Shuffle: function (pid, type, place, id) {
		if (document.getElementById(pid + '_eyeDock_' + type + '_' + place + '_' + id + '_entries').style.display === 'block') {
			DockMenu.Hide(pid, type, place, id);
		} else {
			DockMenu.Show(pid, type, place, id);
		}
	}
};

var Taskbars = {
	Bottom: 0,
	Entries: [],
	List: [],
	PID: '',
	Top: 0,

	Add: function (pid, type, place, id) {
		var key, x;
		Taskbars.PID = pid;
		key = pid + '_eyeDock_' + type + '_' + place + '_' + id;
		if (type === 'bottom') {
			Taskbars.Bottom += 1;
		} else if (type === 'bottom') {
			Taskbars.Top += 1;
		}
		Taskbars.List[key] = [];
		Taskbars.List[key].type = type;
		Taskbars.List[key].place = place;
		Taskbars.List[key].id = id;
		document.getElementById(key + '_move_left').onclick = function () { Taskbars.MoveLeft(key); };
		document.getElementById(key + '_move_right').onclick = function () { Taskbars.MoveRight(key); };
		for (x in Taskbars.Entries) {
			if (Taskbars.Entries.hasOwnProperty(x)) {
				if (Taskbars.Entries[x]) {
					document.getElementById(key + '_entries').innerHTML += '<div class="eyeDock_' + type + '_' + place + '_taskbar_entry" id="' + key + '_' + x + '_entry"><div class="eyeDock_' + type + '_' + place + '_taskbar_entry_div" id="' + key + '_' + x + '_entry_div" onclick="' + Taskbars.Entries[x].onclick + '">' + tinyMCE.entityDecode(Taskbars.Entries[x].title) + '</div></div>';
				}
			}
		}
	},

	AddEntry: function (id, title, onclick) {
		var key, place, type;
		Taskbars.Entries[id] = [];
		Taskbars.Entries[id].title = title;
		Taskbars.Entries[id].onclick = onclick;
		for (key in Taskbars.List) {
			if (Taskbars.List.hasOwnProperty(key)) {
				if (Taskbars.List[key]) {
					type = Taskbars.List[key].type;
					place = Taskbars.List[key].place;
					document.getElementById(key + '_entries').innerHTML += '<div class="eyeDock_' + type + '_' + place + '_taskbar_entry_focus" id="' + key + '_' + id + '_entry"><div class="eyeDock_' + type + '_' + place + '_taskbar_entry_div" id="' + key + '_' + id + '_entry_div" onclick="' + onclick + '">' + tinyMCE.entityDecode(title) + '</div></div>';
				}
			}
		}
		Taskbars.SetWidth();
	},

	FocusEntry: function (id) {
		var e, key;
		if (Taskbars.Entries[id]) {
			for (key in Taskbars.List) {
				if (Taskbars.List.hasOwnProperty(key)) {
					if (Taskbars.List[key]) {
						e = document.getElementById(key + '_' + id + '_entry');
						if (e.className.length < 6 || e.className.substr(e.className.length - 6) !== '_focus') {
							e.className += '_focus';
						}
					}
				}
			}
		}
	},

	MoveLeft: function (key) {
		var left, width;
		if (Taskbars.List[key]) {
			left = xLeft(key + '_entries') + 100;
			width = xWidth(key) - xWidth(key + '_entries');
			if (left > 0) {
				left = 0;
			} else if (left < width) {
				left = width;
			}
			xSlideTo(key + '_entries', left, 0, 1000);
		}
	},

	MoveRight: function (key) {
		var left, width;
		if (Taskbars.List[key]) {
			left = xLeft(key + '_entries') - 100;
			width = xWidth(key) - xWidth(key + '_entries');
			if (left < width) {
				left = width;
			} else if (left > 0) {
				left = 0;
			}
			xSlideTo(key + '_entries', left, 0, 1000);
		}
	},

	Remove: function (id) {
		if (Taskbars.List[id]) {
			var e = document.getElementById(id);
			e.parentNode.removeChild(e);
			Taskbars.List[id] = 0;
		}
	},

	RemoveEntry: function (id) {
		var e, key;
		if (Taskbars.Entries[id]) {
			Taskbars.Entries[id] = 0;
			for (key in Taskbars.List) {
				if (Taskbars.List.hasOwnProperty(key)) {
					if (Taskbars.List[key]) {
						e = document.getElementById(key + '_' + id + '_entry');
						e.parentNode.removeChild(e);
					}
				}
			}
			Taskbars.SetWidth();
		}
	},

	RenameEntry: function (id, title) {
		var key;
		if (Taskbars.Entries[id]) {
			Taskbars.Entries[id].title = title;
			for (key in Taskbars.List) {
				if (Taskbars.List.hasOwnProperty(key)) {
					if (Taskbars.List[key]) {
						document.getElementById(key + '_' + id + '_entry_div').innerHTML = tinyMCE.entityDecode(title);
					}
				}
			}
		}
	},

	SetWidth: function (type) {
		var bottom, cB, cT, csB, csT, e, fB, fT, key, top, width, widthEntries;
		if (Taskbars.Bottom && (type === 'bottom' || typeof type === 'undefined')) {
			bottom = 0;
			fB = document.getElementById(Taskbars.PID + '_eyeDock_bottom');
			csB = fB.childNodes;
			for (cB = 0; cB < csB.length; cB += 1) {
				if (!Taskbars.List[csB[cB].id] && csB[cB].className !== 'eyeDock_bottom_left_taskbar_move_left' && csB[cB].className !== 'eyeDock_bottom_right_taskbar_move_left' && csB[cB].className !== 'eyeDock_bottom_left_taskbar_move_right' && csB[cB].className !== 'eyeDock_bottom_right_taskbar_move_right') {
					bottom += xWidth(csB[cB]);
				}
			}
		}
		if (Taskbars.Top && (type === 'top' || typeof type === 'undefined')) {
			top = 0;
			fT = document.getElementById(Taskbars.PID + '_eyeDock_top');
			csT = fT.childNodes;
			for (cT = 0; cT < csT.length; cT += 1) {
				if (!Taskbars.List[csT[cT].id] && csT[cT].className !== 'eyeDock_top_left_taskbar_move_left' && csT[cT].className !== 'eyeDock_top_right_taskbar_move_left' && csT[cT].className !== 'eyeDock_top_left_taskbar_move_right' && csT[cT].className !== 'eyeDock_top_right_taskbar_move_right') {
					top += xWidth(csT[cT]);
				}
			}
		}
		for (key in Taskbars.List) {
			if (Taskbars.List.hasOwnProperty(key)) {
				e = document.getElementById(key);
				if (!e) {
					Taskbars.List[key] = 0;
				} else if (Taskbars.List[key]) {
					width = 0;
					if (Taskbars.List[key].type === 'bottom') {
						width = (xWidth(fB) - bottom) / Taskbars.Bottom;
					} else if (Taskbars.List[key].type === 'top') {
						width = (xWidth(fT) - top) / Taskbars.Top;
					}
					if (e && width > 0) {
						widthEntries = xWidth(key + '_entries');
						if (widthEntries > width) {
							document.getElementById(key + '_move_left').style.display = 'inline-block';
							document.getElementById(key + '_move_right').style.display = 'inline-block';
							width -= xWidth(key + '_move_left') + xWidth(key + '_move_right');
							if (xLeft(key + '_entries') < width - widthEntries) {
								xSlideTo(key + '_entries', width - widthEntries, 0, 1000);
							}
						} else {
							document.getElementById(key + '_move_left').style.display = 'none';
							document.getElementById(key + '_move_right').style.display = 'none';
							if (xLeft(key + '_entries')) {
								xSlideTo(key + '_entries', 0, 0, 1000);
							}
						}
						e.style.width = width + 'px';
					}
				}
			}
		}
	},

	UnfocusEntry: function (id) {
		var e, key;
		if (Taskbars.Entries[id]) {
			for (key in Taskbars.List) {
				if (Taskbars.List.hasOwnProperty(key)) {
					if (Taskbars.List[key]) {
						e = document.getElementById(key + '_' + id + '_entry');
						if (e.className.length > 6 && e.className.substr(e.className.length - 6) === '_focus') {
							e.className = e.className.substr(0, e.className.length - 6);
						}
					}
				}
			}
		}
	}
};

xAddEventListener(window, 'resize', Taskbars.SetWidth, false);