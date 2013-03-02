/*global xDisableDrag, xEnableDrag, xHeight, xLeft, xTop, xWidth */
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

var eyeCatch = {
	Holes: [],
	Enemies: [],
	Infos: [],

	AddHole: function (id, className, message, left, top, width, height) {
		var holeArray, holeDiv;
		holeDiv = document.createElement('div');
		holeDiv.className = className;
		holeDiv.id = id + '_hole' + eyeCatch.Holes[id].length;
		holeDiv.style.left = left + 'px';
		holeDiv.style.top = top + 'px';
		holeDiv.style.width = width + 'px';
		holeDiv.style.height = height + 'px';
		document.getElementById(id + '_holes').appendChild(holeDiv);
		holeArray = [];
		holeArray.id = id + '_hole' + eyeCatch.Holes[id].length;
		holeArray.message = message;
		eyeCatch.Holes[id].push(holeArray);
	},

	AddEnemy: function (id, className, message, left, top, width, height, movex, movey) {
		var enemyArray, enemyDiv;
		enemyDiv = document.createElement('div');
		enemyDiv.className = className;
		enemyDiv.id = id + '_enemy' + eyeCatch.Enemies[id].length;
		enemyDiv.style.left = left + 'px';
		enemyDiv.style.top = top + 'px';
		enemyDiv.style.width = width + 'px';
		enemyDiv.style.height = height + 'px';
		document.getElementById(id + '_field').appendChild(enemyDiv);
		enemyArray = [];
		enemyArray.id = id + '_enemy' + eyeCatch.Enemies[id].length;
		enemyArray.message = message;
		enemyArray.movex = movex;
		enemyArray.movey = movey;
		eyeCatch.Enemies[id].push(enemyArray);
	},

	CreateField: function (id, father, messageBox, className, speed, left, top, width, height) {
		var fieldDiv, holesDiv;
		eyeCatch.Holes[id] = [];
		eyeCatch.Enemies[id] = [];
		eyeCatch.Infos[id] = [];
		eyeCatch.Infos[id].messageBox = messageBox;
		eyeCatch.Infos[id].round = 0;
		eyeCatch.Infos[id].speed = [];
		eyeCatch.Infos[id].speed.current = 0;
		/*jslint evil: true */
		eyeCatch.Infos[id].speed.increase = eval(speed); // JSON
		/*jslint evil: false */
		eyeCatch.Infos[id].starttime = 0;

		fieldDiv = document.createElement('div');
		fieldDiv.className = className;
		fieldDiv.id = id + '_field';
		fieldDiv.style.left = left + 'px';
		fieldDiv.style.top = top + 'px';
		fieldDiv.style.width = width + 'px';
		fieldDiv.style.height = height + 'px';
		document.getElementById(father).appendChild(fieldDiv);

		holesDiv = document.createElement('div');
		holesDiv.id = id + '_holes';
		document.getElementById(id + '_field').appendChild(holesDiv);
	},

	CreatePlayer: function (id, className, left, top, width, height) {
		var playerDiv;
		eyeCatch.Infos[id].left = left;
		eyeCatch.Infos[id].top = top;
		eyeCatch.Infos[id].width = width;
		eyeCatch.Infos[id].height = height;

		playerDiv = document.createElement('div');
		playerDiv.className = className;
		playerDiv.id = id + '_player';
		playerDiv.style.left = left + 'px';
		playerDiv.style.top = top + 'px';
		playerDiv.style.width = width + 'px';
		playerDiv.style.height = height + 'px';
		document.getElementById(id + '_field').appendChild(playerDiv);

		xEnableDrag(id + '_player', function () { eyeCatch.Start(id); }, function (e, left, top) { eyeCatch.OnDrag(id, left, top); });
	},

	HasPoint: function (e1, e2x, e2y, e2w, e2h) {
		var e1x, e1y, e1w, e1h;
		e1x = xLeft(e1);
		e1y = xTop(e1);
		e1w = xWidth(e1);
		e1h = xHeight(e1);

		if (e2x >= e1x && e2x <= e1x + e1w && e2y >= e1y && e2y <= e1y + e1h) {
			return true;
		}
		if (e2x >= e1x && e2x <= e1x + e1w && e2y + e2h >= e1y && e2y + e2h <= e1y + e1h) {
			return true;
		}
		if (e2x + e2w >= e1x && e2x + e2w <= e1x + e1w && e2y >= e1y && e2y <= e1y + e1h) {
			return true;
		}
		if (e2x + e2w >= e1x && e2x + e2w <= e1x + e1w && e2y + e2h >= e1y && e2y + e2h <= e1y + e1h) {
			return true;
		}
		return false;
	},

	MoveEnemies: function (id, start) {
		var enemy, player, speed;
		if (eyeCatch.Infos[id].round || start) {
			for (enemy = eyeCatch.Enemies[id].length - 1; enemy > -1; enemy -= 1) {
				eyeCatch.MoveEnemy(id, enemy);
			}
			if (eyeCatch.Infos[id].speed.increase[eyeCatch.Infos[id].round]) {
				speed = Number(eyeCatch.Infos[id].speed.increase[eyeCatch.Infos[id].round][0]);
				eyeCatch.Infos[id].speed.current = speed;
			} else {
				speed = eyeCatch.Infos[id].speed.current;
			}
			eyeCatch.Infos[id].round += 1;

			player = document.getElementById(id + '_player');
			if (player) {
				for (enemy = eyeCatch.Enemies[id].length - 1; enemy > -1; enemy -= 1) {
					if (eyeCatch.HasPoint(eyeCatch.Enemies[id][enemy].id, eyeCatch.Infos[id].left, eyeCatch.Infos[id].top, eyeCatch.Infos[id].width, eyeCatch.Infos[id].height)) {
						xDisableDrag(player);
						player.parentNode.removeChild(player);
						document.getElementById(eyeCatch.Infos[id].messageBox).innerHTML = eyeCatch.Enemies[id][enemy].message.replace(/%s/g, (new (Date).getTime() - eyeCatch.Infos[id].starttime) / 1000);
					}
				}
			}
			setTimeout(function () { eyeCatch.MoveEnemies(id, 0); }, speed);
		}
	},

	MoveEnemy: function (id, enemy) {
		var element, height, left, top, width;
		element = document.getElementById(eyeCatch.Enemies[id][enemy].id);
		if (element) {
			left = xLeft(element);
			top = xTop(element);
			width = xWidth(element);
			height = xHeight(element);
			if (left >= xWidth(id + '_field') - width || left <= 0) {
				eyeCatch.Enemies[id][enemy].movex *= -1;
			}
			if (top >= xHeight(id + '_field') - height || top <= 0) {
				eyeCatch.Enemies[id][enemy].movey *= -1;
			}
			element.style.left = (eyeCatch.Enemies[id][enemy].movex + left) + 'px';
			element.style.top = (eyeCatch.Enemies[id][enemy].movey + top) + 'px';
		}
	},

	OnDrag: function (id, left, top) {
		var height, hole, player, width;
		player = document.getElementById(id + '_player');
		if (player) {
			eyeCatch.Infos[id].left += left;
			eyeCatch.Infos[id].top += top;

			if (eyeCatch.Infos[id].left < 0) {
				eyeCatch.Infos[id].left = 0;
			}
			width = xWidth(id + '_field') - eyeCatch.Infos[id].width;
			if (eyeCatch.Infos[id].left > width) {
				eyeCatch.Infos[id].left = width;
			}
			if (eyeCatch.Infos[id].top < 0) {
				eyeCatch.Infos[id].top = 0;
			}
			height = xHeight(id + '_field') - eyeCatch.Infos[id].height;
			if (eyeCatch.Infos[id].top > height) {
				eyeCatch.Infos[id].top = height;
			}

			player.style.left = eyeCatch.Infos[id].left + 'px';
			player.style.top = eyeCatch.Infos[id].top + 'px';

			for (hole = eyeCatch.Holes[id].length - 1; hole > -1; hole -= 1) {
				if (eyeCatch.HasPoint(eyeCatch.Holes[id][hole].id, eyeCatch.Infos[id].left, eyeCatch.Infos[id].top, eyeCatch.Infos[id].width, eyeCatch.Infos[id].height)) {
					xDisableDrag(player);
					player.parentNode.removeChild(player);
					document.getElementById(eyeCatch.Infos[id].messageBox).innerHTML = eyeCatch.Holes[id][hole].message.replace(/%s/g, (new (Date).getTime() - eyeCatch.Infos[id].starttime) / 1000);
				}
			}
		}
	},

	Remove: function (id) {
		eyeCatch.Holes[id] = [];
		eyeCatch.Enemies[id] = [];
		eyeCatch.Infos[id] = [];

		var e = document.getElementById(id + '_field');
		if (e) {
			e.parentNode.removeChild(e);
		}
	},

	Start: function (id) {
		if (!eyeCatch.Infos[id].round) {
			eyeCatch.Infos[id].starttime = (new Date()).getTime();
			eyeCatch.MoveEnemies(id, 1);
		}
	}
};