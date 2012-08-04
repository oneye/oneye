/*global Base64, eyeParam, IEversion, md5, sendMsg, updateOpacity, updateOpacityOnce, USERTHEME, xEvent, xGetElementById, xLeft */
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

var eyeLogin_original_X = 0;
var eyeLogin_original_Y = 0;
var movecount = 0;

function eyeLogin_Disable_On(pid) {
	xGetElementById(pid + '_eyeLogin_Textbox_1_Password').disabled = true;
	xGetElementById(pid + '_eyeLogin_Textbox_1_User').disabled = true;
	movecount = 0;
	setTimeout('eyeLogin_Move_R("' + pid + '_eyeLogin_1_Container", "' + pid + '");', 500);
}

function eyeLogin_badLogin(user, pass, checknum, pid) {
	eyeLogin_Disable_On(pid);
}

function eyeLogin_SendLogin(checknum, pid) {
	var password, sawasc;
	sawasc = '$sawasc';
	if (sawasc) {
		password = xGetElementById(pid + '_eyeLogin_Textbox_1_Password').value;
		password = md5(sawasc + md5(password + md5(password)));
	} else {
		password = Base64.encode(xGetElementById(pid + '_eyeLogin_Textbox_1_Password').value);
	}
	sendMsg(checknum, 'Login', eyeParam('eyeLogin_Textbox_1_User', xGetElementById(pid + '_eyeLogin_Textbox_1_User').value) + eyeParam('eyeLogin_Textbox_1_Password', password) + eyeParam('eyeLogin_Select_1_Language', xGetElementById(pid + '_eyeLogin_Select_1_Language').value));
}

function eyeLogin_1_KeyPressed(characterCode, checknum, pid) {
	if (characterCode === 13) {
		eyeLogin_SendLogin(checknum, pid);
		return false;
	}
	return true;
}

function eyeLogin_2_KeyPressed(characterCode, checknum, pid) {
	if (characterCode === 13) {
		sendMsg(checknum, 'Create', eyeParam('eyeLogin_Textbox_2_User', xGetElementById(pid + '_eyeLogin_Textbox_2_User').value) + eyeParam('eyeLogin_Textbox_2_Password_1', Base64.encode(xGetElementById(pid + '_eyeLogin_Textbox_2_Password_1').value)) + eyeParam('eyeLogin_Textbox_2_Password_2', Base64.encode(xGetElementById(pid + '_eyeLogin_Textbox_2_Password_2').value)) + eyeParam('eyeLogin_Select_2_Language', xGetElementById(pid + '_eyeLogin_Select_2_Language').value));
		return false;
	}
	return true;
}

function eyeLogin_successLogin(user, checknum, pid) {
	updateOpacity(pid + '_eyeLogin_1_Container', 100, 0, 150, 'sendMsg(' + checknum + ', "successLogin", "");');
}

function eyeLogin_2_Clean(pid) {
	xGetElementById(pid + '_eyeLogin_Imagebox_2_Create_Container').style.display = 'none';
	xGetElementById(pid + '_eyeLogin_Label_2_Create').style.display = 'none';
	xGetElementById(pid + '_eyeLogin_Label_2_Language').style.display = 'none';
	xGetElementById(pid + '_eyeLogin_Label_2_Password_1').style.display = 'none';
	xGetElementById(pid + '_eyeLogin_Label_2_Password_2').style.display = 'none';
	xGetElementById(pid + '_eyeLogin_Label_2_User').style.display = 'none';
	xGetElementById(pid + '_eyeLogin_Select_2_Language').style.display = 'none';
	xGetElementById(pid + '_eyeLogin_Textbox_2_Password_1').style.display = 'none';
	xGetElementById(pid + '_eyeLogin_Textbox_2_Password_2').style.display = 'none';
	xGetElementById(pid + '_eyeLogin_Textbox_2_User').style.display = 'none';
}

function eyeLogin_Light_Off(id) {
	if (!IEversion || IEversion > 7) {
		xGetElementById(id).style.backgroundImage = 'url(index.php?theme=' + USERTHEME + '&extern=images/apps/eyeLogin/box.png)';
	}
}

function eyeLogin_Light_On(id) {
	if (!IEversion || IEversion > 7) {
		xGetElementById(id).style.backgroundImage = 'url(index.php?theme=' + USERTHEME + '&extern=images/apps/eyeLogin/box_x.png)';
	}
}

function eyeLogin_2_Launch(pid, checknum) {
	if (xGetElementById(pid + '_eyeLogin_2_Container').style.display === 'block') {
		if (IEversion) {
			xGetElementById(pid + '_eyeLogin_2_Container').style.display = 'none';
		} else {
			updateOpacity(pid + '_eyeLogin_2_Container', 100, 0, 500, 'xGetElementById("' + pid + '_eyeLogin_2_Container").style.display = "none";');
		}
		eyeLogin_Light_Off(pid + '_eyeLogin_Textbox_2_User');
		eyeLogin_Light_Off(pid + '_eyeLogin_Textbox_2_Password_1');
		eyeLogin_Light_Off(pid + '_eyeLogin_Textbox_2_Password_2');
		xGetElementById(pid + '_eyeLogin_Textbox_1_User').focus();
		eyeLogin_Light_On(pid + '_eyeLogin_Textbox_1_User');
	} else {
		if (!IEversion) {
			updateOpacityOnce(0, pid + '_eyeLogin_2_Container');
		}
		xGetElementById(pid + '_eyeLogin_2_Container').style.display = 'block';
		if (!IEversion) {
			updateOpacity(pid + '_eyeLogin_2_Container', 0, 100, 500, '');
		}
		eyeLogin_Light_Off(pid + '_eyeLogin_Textbox_1_User');
		eyeLogin_Light_Off(pid + '_eyeLogin_Textbox_1_Password');
		xGetElementById(pid + '_eyeLogin_Textbox_2_User').focus();
		eyeLogin_Light_On(pid + '_eyeLogin_Textbox_2_User');
	}

	var obj = xGetElementById(pid + '_eyeLogin_Imagebox_2_Create_Container');
	if (obj) {
		obj.onclick = function () { sendMsg(checknum, 'Create', eyeParam('eyeLogin_Textbox_2_User', xGetElementById(pid + '_eyeLogin_Textbox_2_User').value) + eyeParam('eyeLogin_Textbox_2_Password_1', Base64.encode(xGetElementById(pid + '_eyeLogin_Textbox_2_Password_1').value)) + eyeParam('eyeLogin_Textbox_2_Password_2', Base64.encode(xGetElementById(pid + '_eyeLogin_Textbox_2_Password_2').value)) + eyeParam('eyeLogin_Select_2_Language', xGetElementById(pid + '_eyeLogin_Select_2_Language').value)); };

		obj = xGetElementById(pid + '_eyeLogin_Label_2_Create');
		obj.onclick = function () { sendMsg(checknum, 'Create', eyeParam('eyeLogin_Textbox_2_User', xGetElementById(pid + '_eyeLogin_Textbox_2_User').value) + eyeParam('eyeLogin_Textbox_2_Password_1', Base64.encode(xGetElementById(pid + '_eyeLogin_Textbox_2_Password_1').value)) + eyeParam('eyeLogin_Textbox_2_Password_2', Base64.encode(xGetElementById(pid + '_eyeLogin_Textbox_2_Password_2').value)) + eyeParam('eyeLogin_Select_2_Language', xGetElementById(pid + '_eyeLogin_Select_2_Language').value)); };
	}

	obj = xGetElementById(pid + '_eyeLogin_Textbox_2_User');
	obj.onkeypress = function (e) {
		var event = new xEvent(e);
		eyeLogin_2_KeyPressed(event.keyCode, checknum, pid);
	};
	obj.onfocus = function () { eyeLogin_Light_On(pid + '_eyeLogin_Textbox_2_User'); };
	obj.onblur = function () { eyeLogin_Light_Off(pid + '_eyeLogin_Textbox_2_User'); };

	obj = xGetElementById(pid + '_eyeLogin_Textbox_2_Password_1');
	obj.onkeypress = function (e) {
		var event = new xEvent(e);
		eyeLogin_2_KeyPressed(event.keyCode, checknum, pid);
	};
	obj.onfocus = function () { eyeLogin_Light_On(pid + '_eyeLogin_Textbox_2_Password_1'); };
	obj.onblur = function () { eyeLogin_Light_Off(pid + '_eyeLogin_Textbox_2_Password_1'); };

	obj = xGetElementById(pid + '_eyeLogin_Textbox_2_Password_2');
	obj.onkeypress = function (e) {
		var event = new xEvent(e);
		eyeLogin_2_KeyPressed(event.keyCode, checknum, pid);
	};
	obj.onfocus = function () { eyeLogin_Light_On(pid + '_eyeLogin_Textbox_2_Password_2'); };
	obj.onblur = function () { eyeLogin_Light_Off(pid + '_eyeLogin_Textbox_2_Password_2'); };
}

function eyeLogin_Start(pid, checknum) {
	var obj_lbl_enter, obj_lbl_enter_cnt, obj_img_cnt, obj_sel_lang, obj_txt_pwd, obj_txt_user;
	eyeLogin_original_X = xGetElementById(pid + '_eyeLogin_1_Container').style.left;
	eyeLogin_original_Y = xGetElementById(pid + '_eyeLogin_1_Container').style.top;
	obj_lbl_enter = xGetElementById(pid + '_eyeLogin_Label_1_Enter');
	obj_lbl_enter.onclick = function () { eyeLogin_SendLogin(checknum, pid); };
	obj_lbl_enter.style.zIndex = '10000';

	obj_lbl_enter_cnt = xGetElementById(pid + '_eyeLogin_Imagebox_1_Enter_Container');
	obj_lbl_enter_cnt.onclick = function () { eyeLogin_SendLogin(checknum, pid); };
	obj_lbl_enter_cnt.style.zIndex = '10000';

	obj_img_cnt = xGetElementById(pid + '_eyeLogin_Imagebox_1_New_Container');
	if (obj_img_cnt) {
		obj_img_cnt.onclick = function () { eyeLogin_2_Launch(pid, checknum); };
		obj_img_cnt.style.zIndex = '10000';

		obj_img_cnt = xGetElementById(pid + '_eyeLogin_Label_1_New_Container');
		obj_img_cnt.onclick = function () { eyeLogin_2_Launch(pid, checknum); };
		obj_img_cnt.style.zIndex = '10000';
	}

	obj_txt_pwd = xGetElementById(pid + '_eyeLogin_Textbox_1_Password');
	obj_txt_pwd.onkeypress = function (e) {
		eyeLogin_1_KeyPressed(new xEvent(e).keyCode, checknum, pid);
	};
	obj_txt_pwd.onfocus = function () { eyeLogin_Light_On(pid + '_eyeLogin_Textbox_1_Password'); };
	obj_txt_pwd.onblur = function () { eyeLogin_Light_Off(pid + '_eyeLogin_Textbox_1_Password'); };

	obj_txt_user = xGetElementById(pid + '_eyeLogin_Textbox_1_User');
	obj_txt_user.onkeypress = function (e) {
		eyeLogin_1_KeyPressed(new xEvent(e).keyCode, checknum, pid);
	};
	obj_txt_user.onfocus = function () { eyeLogin_Light_On(pid + '_eyeLogin_Textbox_1_User'); };
	obj_txt_user.onblur = function () { eyeLogin_Light_Off(pid + '_eyeLogin_Textbox_1_User'); };

	obj_sel_lang = xGetElementById(pid + '_eyeLogin_Select_1_Language');
	obj_sel_lang.onkeypress = function (e) {
		eyeLogin_1_KeyPressed(new xEvent(e).keyCode, checknum, pid);
	};
	obj_sel_lang.onfocus = function () { eyeLogin_Light_On(pid + '_eyeLogin_Select_1_Language'); };
	obj_sel_lang.onblur = function () { eyeLogin_Light_Off(pid + '_eyeLogin_Select_1_Language'); };
}

function eyeLogin_Move_L(widget, pid) {
	xLeft(widget, xLeft(widget) - 40);
	setTimeout('eyeLogin_Move_R("' + widget + '", "' + pid + '");', 50);
}

function eyeLogin_Disable_Off(pid) {
	xGetElementById(pid + '_eyeLogin_Textbox_1_Password').disabled = false;
	xGetElementById(pid + '_eyeLogin_Textbox_1_User').disabled = false;
}

function eyeLogin_Move_R(widget, pid) {
	if (movecount > 5) {
		xGetElementById(widget).style.left = eyeLogin_original_X;
		xGetElementById(widget).style.top = eyeLogin_original_Y;
		eyeLogin_Disable_Off(pid);
	} else {
		if (!movecount) {
			xLeft(widget, xLeft(widget) + 20);
		} else {
			xLeft(widget, xLeft(widget) + 40);
		}
		movecount += 1;
		setTimeout('eyeLogin_Move_L("' + widget + '", "' + pid + '");', 50);
	}
}

eyeLogin_Start('$myPid', '$checknum');