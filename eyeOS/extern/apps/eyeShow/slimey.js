/*
 *  Slimey - SLIdeshow Microformat Editor - http://slimey.sourceforge.net
 *  Copyright (C) 2007 - 2008 Ignacio de Soto
 *
 *  Inclusion to a webpage.
 */

/**
 *  Initializes and writes an instance of Slimey
 *
 *  config options:
 *  	container: Where Slimey will be written to
 *  	rootDir: Slimey classes root dir
 *  	imagesDir: Slimey images dir
 *  	filename: name of the file that's going to be edited
 *  	slimContent: content of the file
 *  	saveUrl: where the modified file will be submited
 */
 
 
 function loadCode() {
	window.parent.sendMsg($checknum,'openFile','');
}

 function getMyFile() {
	window.parent.sendMsg($checknum,'getFile','');
}

function save_ed(slim) {
//	var cont = document.getElementById('slimeyEditor').innerHTML ;
	window.parent.sendMsg($checknum,'Save','<arg1>ed</arg1>') ;
	alert(slim) ;
}

var Slimey = function(config) {
	if (config.rootDir) Slimey.rootDir = config.rootDir;
	if (config.imagesDir) Slimey.imagesDir = config.imagesDir;
	if (config.filename) this.filename = config.filename;
	if (config.slimContent) this.slimContent = config.slimContent;
	if (config.saveUrl) this.saveUrl = config.saveUrl;
	this.config = config;
	Slimey.preloadImages();
	this.editor = new SlimeyEditor(this);
	this.navigation = new SlimeyNavigation(this);
//	this.toolbar = new SlimeyToolbar(this);

	//Ajout Ed
	this.Navbar = new SlimeyNavbar(this);

	var div2 = document.createElement('div');
	div2.style.position = 'absolute';
	div2.style.marginTop = '0px';
	div2.style.marginLeft = '0px';
	div2.style.marginRight = '0px';
	div2.style.height = '58px';
	div2.style.width = '100%';

	div2.appendChild(this.Navbar.container);
//	this.container = $(config.container);
//	this.container.appendChild(this.navigation.container);
	//

/*


	var div = document.createElement('div');
	div.style.position = 'absolute';
	div.style.marginLeft = '200px';
	div.style.marginRight = '2px';
	div.style.marginTop = '59px';
	div.style.height = '100%';
	div.appendChild(this.toolbar.container);
	div.appendChild(this.editor.container);
	this.container = $(config.container);
	this.container.appendChild(this.navigation.container);
	this.container.appendChild(div);
	*/
	this.edtoolbar = new SlimeyToolbar(this, [
			new SlimeySaveTool(this),
			'-',
			new SlimeyInsertTextTool(this),
			new SlimeyInsertOrderedListTool(this), new SlimeyInsertUnorderedListTool(this),
			new SlimeyDeleteTool(this),
			'-',
			new SlimeyUndoTool(this), new SlimeyRedoTool(this),
			'-',
			new SlimeyFontColorTool(this), new SlimeyFontFamilyTool(this),
			new SlimeyFontSizeTool(this),
			'-',
			new SlimeyStyleToggleTool(this, 'bold', lang('bold text'), 'fontWeight', 'bold', 'normal'),
			new SlimeyStyleToggleTool(this, 'underline', lang('underline text'), 'textDecoration', 'underline', 'none'),
			new SlimeyStyleToggleTool(this, 'italic', lang('italic text'), 'fontStyle', 'italic', 'normal'),
			'-',
			new SlimeySendToBackTool(this), new SlimeyBringToFrontTool(this),
			'-',
			new SlimeyViewSourceTool(this), new SlimeyPreviewTool(this)
	]);
	this.navtoolbar = new SlimeyToolbar(this, [
		new SlimeyAddSlideTool(this), new SlimeyDeleteSlideTool(this),
		'-',
		new SlimeyMoveSlideDownTool(this), new SlimeyMoveSlideUpTool(this)

	]);


	if (typeof config.container == 'string') {
		this.container = document.getElementById(config.container);
	} else if (typeof config.container == 'object') {
		this.container = config.container;
	} else {
		this.container = document.body;
	}
	this.container.appendChild(div2);
	this.container.appendChild(this.navtoolbar.container);
	this.container.appendChild(this.edtoolbar.container);
	this.container.appendChild(this.navigation.container);
	this.container.appendChild(this.editor.container);

	var a = this.aspect || 4/3;
	var h = this.container.offsetHeight;
	var w = this.container.offsetWidth;

	this.navtoolbar.container.style.position = 'absolute';
	this.navtoolbar.container.style.width = this.navigation.container.offsetWidth + 'px';
	this.navtoolbar.container.style.top = '60px';

	this.navigation.container.style.position = 'absolute';
	this.navigation.container.style.top = this.navtoolbar.container.offsetHeight + 60+'px';
	this.navigation.container.style.height = h - this.navtoolbar.container.offsetHeight + 'px';

	this.edtoolbar.container.style.position = 'absolute';
	this.edtoolbar.container.style.left = this.navigation.container.offsetWidth + 'px';
	this.edtoolbar.container.style.width = (w - this.navigation.container.offsetWidth) + 'px';
	this.edtoolbar.container.style.top = '60px';

	this.editor.container.style.position = 'absolute';

	this.editor.container.style.top = '95px';
	this.editor.container.style.left = '210px';

		var scnWid,scnHei;
	if (self.innerHeight) // all except Explorer
	{
		scnWid = self.innerWidth;
		scnHei = self.innerHeight;
	}
	else if (document.documentElement && document.documentElement.clientHeight)
		// Explorer 6 Strict Mode
	{
		scnWid = document.documentElement.clientWidth;
		scnHei = document.documentElement.clientHeight;
	}
	else if (document.body) // other Explorers
	{
		scnWid = document.body.clientWidth;
		scnHei = document.body.clientHeight;
	}

	var ew = scnWid - 200;
	var eh = scnHei - 120;

	if (ew > eh * a) {
		// there's extra width so base on height
		this.editor.container.style.height = eh + 'px';
		this.editor.container.style.width = eh * a + 'px';
		this.editor.container.style.left = this.navigation.container.offsetWidth + (w - this.navigation.container.offsetWidth - eh * a) / 2 + 'px';
		this.editor.container.style.top = this.edtoolbar.container.offsetHeight + 60;
	} else {
		// there's extra height so base on width
		this.editor.container.style.height = ew / a + 'px';
		this.editor.container.style.width = ew + 'px';
		this.editor.container.style.left = this.navigation.container.offsetWidth + 0 + 'px';
		this.editor.container.style.top = this.edtoolbar.container.offsetHeight + 60;
	}


	addEventHandler(window, 'resize', this.layout, this);
//	addEventHandler(window, 'load', this.layout, this);
}


Slimey.prototype.layout = function() {
	var a = this.aspect || 4/3;
	var h = this.container.offsetHeight;
	var w = this.container.offsetWidth;

	this.navtoolbar.container.style.position = 'absolute';
	this.navtoolbar.container.style.width = this.navigation.container.offsetWidth + 'px';
	this.navtoolbar.container.style.top = '60px';

	this.navigation.container.style.position = 'absolute';
	this.navigation.container.style.top = this.navtoolbar.container.offsetHeight + 60+'px';
	this.navigation.container.style.height = h - this.navtoolbar.container.offsetHeight + 'px';

	this.edtoolbar.container.style.position = 'absolute';
	this.edtoolbar.container.style.left = this.navigation.container.offsetWidth + 'px';
	this.edtoolbar.container.style.width = (w - this.navigation.container.offsetWidth) + 'px';
	this.edtoolbar.container.style.top = '60px';

	this.editor.container.style.position = 'absolute';
	this.editor.container.style.top = '95px';
	this.editor.container.style.left = '210px';

		var scnWid,scnHei;
	if (self.innerHeight) // all except Explorer
	{
		scnWid = self.innerWidth;
		scnHei = self.innerHeight;
	}
	else if (document.documentElement && document.documentElement.clientHeight)
		// Explorer 6 Strict Mode
	{
		scnWid = document.documentElement.clientWidth;
		scnHei = document.documentElement.clientHeight;
	}
	else if (document.body) // other Explorers
	{
		scnWid = document.body.clientWidth;
		scnHei = document.body.clientHeight;
	}

	var ew = scnWid - 200;
	var eh = scnHei - 120;

	if (ew > eh * a) {
		// there's extra width so base on height
		this.editor.container.style.height = eh + 'px';
		this.editor.container.style.width = eh * a + 'px';
		this.editor.container.style.left = this.navigation.container.offsetWidth + (w - this.navigation.container.offsetWidth - eh * a) / 2 + 'px';
		this.editor.container.style.top = this.edtoolbar.container.offsetHeight + 60;
	} else {
		// there's extra height so base on width
		this.editor.container.style.height = ew / a + 'px';
		this.editor.container.style.width = ew + 'px';
		this.editor.container.style.left = this.navigation.container.offsetWidth + 0 + 'px';
		this.editor.container.style.top = this.edtoolbar.container.offsetHeight + 60;
	}
	this.editor.resized();
}


Slimey.prototype.submitFile = function() {
	sc.value = this.slimContent;
	window.parent.sendMsg($checknum,'saveFile',sc.value);
}

Slimey.imagesDir = 'index.php?theme=' + USERTHEME + '&extern=icons/22x22/eyeShow/';

Slimey.preloadedImages = new Array();

Slimey.includeScripts = function() {

	Slimey.rootDir = 'index.php?extern=apps/eyeShow/getjs.eyecode&type=dynamic&type=dynamic&params[]=$myPid&params[]=$checknum&params[]=' ;
	document.write('<script language="javascript" src="' + Slimey.rootDir + 'functions"></script>');
	document.write('<script language="javascript" src="' + Slimey.rootDir + 'stack"></script>');
	document.write('<script language="javascript" src="' + Slimey.rootDir + 'editor"></script>');
	document.write('<script language="javascript" src="' + Slimey.rootDir + 'navigation"></script>');
	document.write('<script language="javascript" src="' + Slimey.rootDir + 'actions"></script>');
	document.write('<script language="javascript" src="' + Slimey.rootDir + 'tools"></script>');
	document.write('<script language="javascript" src="' + Slimey.rootDir + 'toolbar"></script>');
}

Slimey.preloadImage = function(filename) {
	var ims = Slimey.preloadedImages;
	var i = ims.length;
	ims[i] = new Image(); ims[i].src = Slimey.imagesDir + filename;
}

Slimey.preloadToolbarImage = function(name) {
	Slimey.preloadImage(name + '.png');
	Slimey.preloadImage(name + 'h.png');
	Slimey.preloadImage(name + 'x.png');
	Slimey.preloadImage(name + 'd.png');
}

Slimey.preloadImages = function() {
	if (!Image) {
		return;
	}
	Slimey.preloadToolbarImage('bold');
	Slimey.preloadToolbarImage('bringToFront');
	Slimey.preloadToolbarImage('color');
	Slimey.preloadToolbarImage('delete');
	Slimey.preloadToolbarImage('empty');
	Slimey.preloadToolbarImage('insertImage');
	Slimey.preloadToolbarImage('insertOList');
	Slimey.preloadToolbarImage('insertUList');
	Slimey.preloadToolbarImage('insertText');
	Slimey.preloadToolbarImage('italic');
	Slimey.preloadToolbarImage('preview');
	Slimey.preloadToolbarImage('redo');
	Slimey.preloadToolbarImage('save');
	Slimey.preloadToolbarImage('sendToBack');
	Slimey.preloadToolbarImage('underline');
	Slimey.preloadToolbarImage('undo');
	Slimey.preloadToolbarImage('viewSource');

	Slimey.preloadImage('newslide.png');
	Slimey.preloadImage('delslide.png');
	Slimey.preloadImage('sep.png');
}


//base64 class from webtoolkit
Base64 = {

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