/*global Windows */
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

function eyeMp3_loadSound(myPid, path, title) {
	var e = document.getElementById(myPid + '_eyeMp3_Flash');
	e.SetVariable('jsValue', path);
	e.SetVariable('jsMethod', 'newfile');
	Windows.SetTitle(myPid + '_eyeMp3_Window', title);
}