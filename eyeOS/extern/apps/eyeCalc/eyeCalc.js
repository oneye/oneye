/*global eyeMessageBoxShow, xEvent */
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

var eyeCalc_$myPid = {
	Action: 0,
	ClearOnNext: 0,
	Memory: 'null',

	OnClickAddNumer: function () {
		eyeCalc_$myPid.AddNumber(this.id.substr(this.id.length - 1));
	},

	Init: function () {
		document.getElementById('$myPid_eyeCalc_Button_1').onclick = function () { eyeCalc_$myPid.AddNumber('1'); };
		document.getElementById('$myPid_eyeCalc_Button_2').onclick = function () { eyeCalc_$myPid.AddNumber('2'); };
		document.getElementById('$myPid_eyeCalc_Button_3').onclick = function () { eyeCalc_$myPid.AddNumber('3'); };
		document.getElementById('$myPid_eyeCalc_Button_4').onclick = function () { eyeCalc_$myPid.AddNumber('4'); };
		document.getElementById('$myPid_eyeCalc_Button_5').onclick = function () { eyeCalc_$myPid.AddNumber('5'); };
		document.getElementById('$myPid_eyeCalc_Button_6').onclick = function () { eyeCalc_$myPid.AddNumber('6'); };
		document.getElementById('$myPid_eyeCalc_Button_7').onclick = function () { eyeCalc_$myPid.AddNumber('7'); };
		document.getElementById('$myPid_eyeCalc_Button_8').onclick = function () { eyeCalc_$myPid.AddNumber('8'); };
		document.getElementById('$myPid_eyeCalc_Button_9').onclick = function () { eyeCalc_$myPid.AddNumber('9'); };
		document.getElementById('$myPid_eyeCalc_Button_c').onclick = function () { eyeCalc_$myPid.C(); };
		document.getElementById('$myPid_eyeCalc_Button_ce').onclick = function () { eyeCalc_$myPid.CE(); };
		document.getElementById('$myPid_eyeCalc_Button_delete').onclick = function () { eyeCalc_$myPid.Delete(); };
		document.getElementById('$myPid_eyeCalc_Button_divide').onclick = function () { eyeCalc_$myPid.DoAction('/'); };
		document.getElementById('$myPid_eyeCalc_Button_dot').onclick = function () { eyeCalc_$myPid.Dot(); };
		document.getElementById('$myPid_eyeCalc_Button_equal').onclick = function () { eyeCalc_$myPid.Equal(); };
		document.getElementById('$myPid_eyeCalc_Button_minus').onclick = function () { eyeCalc_$myPid.DoAction('-'); };
		document.getElementById('$myPid_eyeCalc_Button_multiply').onclick = function () { eyeCalc_$myPid.DoAction('*'); };
		document.getElementById('$myPid_eyeCalc_Button_null').onclick = function () { eyeCalc_$myPid.AddNumber('0'); };
		document.getElementById('$myPid_eyeCalc_Button_onedivx').onclick = function () { eyeCalc_$myPid.OneDivX(); };
		document.getElementById('$myPid_eyeCalc_Button_percentage').onclick = function () { eyeCalc_$myPid.Percentage(); };
		document.getElementById('$myPid_eyeCalc_Button_plus').onclick = function () { eyeCalc_$myPid.DoAction('+'); };
		document.getElementById('$myPid_eyeCalc_Button_sign').onclick = function () { eyeCalc_$myPid.Sign(); };
		document.getElementById('$myPid_eyeCalc_Button_sqrt').onclick = function () { eyeCalc_$myPid.Sqrt(); };
		if (document.getElementById('$myPid_eyeCalc_Button_Advanced')) {
			document.getElementById('$myPid_eyeCalc_Button_cos').onclick = function () { eyeCalc_$myPid.Cos(); };
			document.getElementById('$myPid_eyeCalc_Button_exp').onclick = function () { eyeCalc_$myPid.Exp(); };
			document.getElementById('$myPid_eyeCalc_Button_ln').onclick = function () { eyeCalc_$myPid.LN(); };
			document.getElementById('$myPid_eyeCalc_Button_log').onclick = function () { eyeCalc_$myPid.Log(); };
			document.getElementById('$myPid_eyeCalc_Button_nfactorial').onclick = function () { eyeCalc_$myPid.Factorial(); };
			document.getElementById('$myPid_eyeCalc_Button_pi').onclick = function () { eyeCalc_$myPid.Pi(); };
			document.getElementById('$myPid_eyeCalc_Button_sin').onclick = function () { eyeCalc_$myPid.Sin(); };
			document.getElementById('$myPid_eyeCalc_Button_tan').onclick = function () { eyeCalc_$myPid.Tan(); };
			document.getElementById('$myPid_eyeCalc_Button_xpowthree').onclick = function () { eyeCalc_$myPid.XPowThree(); };
			document.getElementById('$myPid_eyeCalc_Button_xpowtwo').onclick = function () { eyeCalc_$myPid.XPowTwo(); };
			document.getElementById('$myPid_eyeCalc_Button_xpowy').onclick = function () { eyeCalc_$myPid.DoAction('^'); };
		}

		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.onkeydown = function (e) {
			e = new xEvent(e);
			if (e.keyCode === 16 || e.keyCode === 17 || e.keyCode === 18 || e.keyCode === 91 || e.keyCode === 92) {
				alert('Due to keyboard layout compatibility problems, special keys (shift, ctrl, alt, windows) are forbidden.\r\nPlease use your mouse to select operation');
				return true;
			}
			if (e.keyCode === 48 || e.keyCode === 96) {
				eyeCalc_$myPid.AddNumber('0');
			} else if (e.keyCode === 49 || e.keyCode === 97) {
				eyeCalc_$myPid.AddNumber('1');
			} else if (e.keyCode === 50 || e.keyCode === 98) {
				eyeCalc_$myPid.AddNumber('2');
			} else if (e.keyCode === 51 || e.keyCode === 99) {
				eyeCalc_$myPid.AddNumber('3');
			} else if (e.keyCode === 52 || e.keyCode === 100) {
				eyeCalc_$myPid.AddNumber('4');
			} else if (e.keyCode === 53 || e.keyCode === 101) {
				eyeCalc_$myPid.AddNumber('5');
			} else if (e.keyCode === 54 || e.keyCode === 102) {
				eyeCalc_$myPid.AddNumber('6');
			} else if (e.keyCode === 55 || e.keyCode === 103) {
				eyeCalc_$myPid.AddNumber('7');
			} else if (e.keyCode === 56 || e.keyCode === 104) {
				eyeCalc_$myPid.AddNumber('8');
			} else if (e.keyCode === 57 || e.keyCode === 105) {
				eyeCalc_$myPid.AddNumber('9');
			} else if (e.keyCode === 27) {
				eyeCalc_$myPid.C();
			} else if (e.keyCode === 46) {
				eyeCalc_$myPid.CE();
			} else if (e.keyCode === 8) {
				eyeCalc_$myPid.Delete();
			} else if (e.keyCode === 107) {
				eyeCalc_$myPid.DoAction('+');
			} else if (e.keyCode === 109 || e.keyCode === 189) {
				eyeCalc_$myPid.DoAction('-');
			} else if (e.keyCode === 106) {
				eyeCalc_$myPid.DoAction('*');
			} else if (e.keyCode === 111 || e.keyCode === 191) {
				eyeCalc_$myPid.DoAction('/');
			} else if (e.keyCode === 220) {
				eyeCalc_$myPid.DoAction('^');
			} else if (e.keyCode === 110 || e.keyCode === 188 || e.keyCode === 190) {
				eyeCalc_$myPid.Dot();
			} else if (e.keyCode === 13) {
				eyeCalc_$myPid.Equal();
			} else {
				return true;
			}
			return false;
		};
		e.readOnly = true;
	},

	Actions: {
		Divide: function (one, two) {
			var exponent, length, output, temp;
			exponent = 0;
			temp = 0;
			output = '+';
			length = 20;
			one = eyeCalc_$myPid.Actions.Input(one);
			two = eyeCalc_$myPid.Actions.Input(two);
			if (one.substr(0, 1) !== two.substr(0, 1)) {
				output = '-';
			}
			one = one.substr(1);
			two = two.substr(1);
			while (parseFloat(one) > 0 && exponent <= length) {
				exponent += 1;
				if (output === '+' || output === '-') {
					exponent -= 1;
				}
				temp = 0;
				while (parseFloat(one) >= parseFloat(eyeCalc_$myPid.Actions.Multiply(temp + 1, two))) {
					temp += 1;
				}
				one = eyeCalc_$myPid.Actions.Input(eyeCalc_$myPid.Actions.Multiply('10', eyeCalc_$myPid.Actions.Plus(one, '-' + eyeCalc_$myPid.Actions.Multiply(temp, two))));
				output = output.substr(0, output.length - 1) + String(temp + Number(output.substr(output.length - 1) + '0'));
			}
			return output + 'e-' + String(exponent);
		},

		Input: function (one) {
			var dot, exponent, letter, output, sign, zero;
			dot = 0;
			exponent = '+';
			letter = '';
			output = '';
			sign = '+';
			zero = 1;
			one = String(one);
			while (one.length) {
				letter = one.substr(0, 1);
				one = one.substr(1);
				if (letter === '-' && output === '') {
					if (sign === '+') {
						sign = '-';
					} else {
						sign = '+';
					}
				} else if (letter === '0' && output !== '') {
					output += '0';
				} else if (letter === '1' || letter === '2' || letter === '3' || letter === '4' || letter === '5' || letter === '6' || letter === '7' || letter === '8' || letter === '9') {
					output += letter;
					zero = 0;
				} else if (letter === '.' && !dot) {
					dot = 1;
					if (output === '') {
						output += '0';
					}
					output += '.';
				} else if (letter === 'e') {
					if (zero) {
						return '+0';
					}
					while (one.length) {
						letter = one.substr(0, 1);
						one = one.substr(1);
						if (letter === '-') {
							if (exponent === '+') {
								exponent = '-';
							} else if (exponent === '-') {
								exponent = '+';
							}
						} else if ((letter === '0' && exponent !== '+' && exponent !== '-') || letter === '1' || letter === '2' || letter === '3' || letter === '4' || letter === '5' || letter === '6' || letter === '7' || letter === '8' || letter === '9') {
							exponent += letter;
						}
					}
				}
			}
			if (zero) {
				return '+0';
			}
			if (exponent !== '+' && exponent !== '-') {
				output = output.split('.');
				if (typeof output[1] === 'undefined') {
					output[1] = '';
				}
				dot = 1;
				exponent = Number(exponent);
				if (exponent < 0) {
					exponent = -exponent;
					while (output[0].length < exponent) {
						output[0] = '0' + output[0];
					}
					output = output[0].substr(0, output[0].length - exponent) + '.' + output[0].substr(output[0].length - exponent) + output[1];
				} else if (exponent > 0) {
					while (output[1].length < exponent) {
						output[1] += '0';
					}
					output = output[0] + output[1].substr(0, exponent) + '.' + output[1].substr(exponent);
				} else {
					output = output[0] + '.' + output[1];
				}
			}
			while (dot && output.substr(output.length - 1) === '0') {
				output = output.substr(0, output.length - 1);
			}
			if (output.substr(output.length - 1) === '.') {
				output = output.substr(0, output.length - 1);
			}
			while (output.substr(0, 1) === '0') {
				output = output.substr(1);
			}
			if (output.substr(0, 1) === '.') {
				output = '0' + output;
			}
			return sign + output;
		},

		LogGamma: function (x) { // Token from http://mathe-online.at/javacalc/jcintro.html
			var v, w;
			v = 1;
			while (x < 8) {
				v *= x;
				x += 1;
			}
			w = 1 / (x * x);
			return ((((((((-3617 / 122400) * w + 7 / 1092) * w - 691 / 360360) * w + 5 / 5940) * w - 1 / 1680) * w + 1 / 1260) * w - 1 / 360) * w + 1 / 12) / x + 0.5 * Math.log(2 * Math.PI) - Math.log(v) - x + (x - 0.5) * Math.log(x);
		},

		Multiply: function (one, two) {
			var dot, exponent, letter, output, sign;
			dot = 0;
			letter = '';
			exponent = 0;
			output = '0';
			sign = '+';
			one = eyeCalc_$myPid.Actions.Input(one);
			two = eyeCalc_$myPid.Actions.Input(two);
			if (one.substr(0, 1) !== two.substr(0, 1)) {
				sign = '-';
			}
			one = one.substr(1);
			two = two.substr(1);
			if (one.length === 1 || one === '10') {
				one = Number(one);
				while (one) {
					output = eyeCalc_$myPid.Actions.Plus(output, two);
					one -= 1;
				}
			} else {
				while (one.length) {
					letter = one.substr(0, 1);
					if (letter === '.') {
						dot = 1;
					} else {
						if (dot) {
							exponent += 1;
						}
						output = eyeCalc_$myPid.Actions.Plus(eyeCalc_$myPid.Actions.Multiply('10', output), eyeCalc_$myPid.Actions.Multiply(letter, two));
					}
					one = one.substr(1);
				}
			}
			return sign + eyeCalc_$myPid.Actions.Input(output).substr(1) + 'e-' + String(exponent);
		},

		Output: function (one) {
			one = eyeCalc_$myPid.Actions.Input(one);
			if (one.substr(0, 1) === '+') {
				one = one.substr(1);
			}
			return parseFloat(one);
		},

		Plus: function (one, two) {
			var action, exponent, n, output, sign, temp;
			action = '+';
			exponent = 0;
			n = 0;
			output = '';
			sign = '+';
			temp = '';
			one = eyeCalc_$myPid.Actions.Input(one);
			two = eyeCalc_$myPid.Actions.Input(two);
			if (one.substr(0, 1) !== two.substr(0, 1)) {
				action = '-';
				if (one.substr(0, 1) === '-') {
					temp = one;
					one = two;
					two = temp;
				}
				if (parseFloat(one.substr(1)) < parseFloat(two.substr(1))) {
					sign = '-';
					temp = one;
					one = two;
					two = temp;
				}
			} else if (one.substr(0, 1) === '-') {
				sign = '-';
			}
			one = one.substr(1).split('.');
			two = two.substr(1).split('.');
			if (typeof one[1] === 'undefined') {
				one[1] = '';
			}
			if (typeof two[1] === 'undefined') {
				two[1] = '';
			}
			while (one[0].length - two[0].length < 0) {
				one[0] = '0' + one[0];
			}
			while (one[0].length - two[0].length > 0) {
				two[0] = '0' + two[0];
			}
			while (one[1].length - two[1].length < 0) {
				one[1] += '0';
			}
			while (one[1].length - two[1].length > 0) {
				two[1] += '0';
			}
			exponent = one[1].length;
			one = one[0] + one[1];
			two = two[0] + two[1];
			if (action === '+') {
				while (one.length) {
					n = Number(one.substr(one.length - 1)) + Number(two.substr(two.length - 1)) + n;
					output = String(n).substr(String(n).length - 1) + output;
					n = Number(String(n).substr(0, String(n).length - 1));
					one = one.substr(0, one.length - 1);
					two = two.substr(0, two.length - 1);
				}
				if (n) {
					output = String(n) + output;
				}
			} else {
				while (one.length) {
					n = Number(two.substr(two.length - 1)) + n;
					if (Number(one.substr(one.length - 1)) < n) {
						n = Number('1' + one.substr(one.length - 1)) - n;
						output = String(n).substr(String(n).length - 1) + output;
						n = 1;
					} else {
						n = Number(one.substr(one.length - 1)) - n;
						output = String(n) + output;
						n = 0;
					}
					one = one.substr(0, one.length - 1);
					two = two.substr(0, two.length - 1);
				}
			}
			return sign + output + 'e-' + exponent;
		}
	},

	AddNumber: function (value) {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		if (e.value === '0' || eyeCalc_$myPid.ClearOnNext) {
			e.value = value;
			eyeCalc_$myPid.ClearOnNext = 0;
		} else if (e.value === '-0') {
			e.value = '-' + value;
		} else {
			e.value += value;
		}
	},

	C: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		e.value = '0';
		eyeCalc_$myPid.Action = 0;
		eyeCalc_$myPid.ClearOnNext = 0;
		eyeCalc_$myPid.Memory = 'null';
	},

	CE: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		e.value = '0';
		eyeCalc_$myPid.ClearOnNext = 0;
	},

	Cos: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		e.value = String(Math.cos(parseFloat(e.value) / 180 * Math.PI));
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	Delete: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		e.value = e.value.substr(0, e.value.length - 1);
		if (e.value === '' || e.value === '-' || eyeCalc_$myPid.ClearOnNext) {
			e.value = '0';
			eyeCalc_$myPid.ClearOnNext = 0;
		}
	},

	DoAction: function (action) {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		if (eyeCalc_$myPid.Memory === 'null') {
			eyeCalc_$myPid.Memory = parseFloat(e.value);
		} else if (!eyeCalc_$myPid.ClearOnNext) {
			if (eyeCalc_$myPid.Action === '/' && !parseFloat(e.value)) {
				eyeMessageBoxShow('$lang:Division by zero is invalid!');
				e.focus();
				return false;
			}
			if (eyeCalc_$myPid.Action === '^' && !eyeCalc_$myPid.Memory && parseFloat(e.value) <= 0) {
				eyeMessageBoxShow('$lang:Exponentiation of zero by a negative number or zero is invalid!');
				e.focus();
				return false;
			}
			if (eyeCalc_$myPid.Action === '+') {
				eyeCalc_$myPid.Memory = eyeCalc_$myPid.Actions.Output(eyeCalc_$myPid.Actions.Plus(eyeCalc_$myPid.Memory, e.value));
			} else if (eyeCalc_$myPid.Action === '-') {
				eyeCalc_$myPid.Memory = eyeCalc_$myPid.Actions.Output(eyeCalc_$myPid.Actions.Plus(eyeCalc_$myPid.Memory, '-' + e.value));
			} else if (eyeCalc_$myPid.Action === '*') {
				eyeCalc_$myPid.Memory = eyeCalc_$myPid.Actions.Output(eyeCalc_$myPid.Actions.Multiply(eyeCalc_$myPid.Memory, e.value));
			} else if (eyeCalc_$myPid.Action === '/') {
				eyeCalc_$myPid.Memory = eyeCalc_$myPid.Actions.Output(eyeCalc_$myPid.Actions.Divide(eyeCalc_$myPid.Memory, e.value));
			} else if (eyeCalc_$myPid.Action === '^') {
				eyeCalc_$myPid.Memory = Math.pow(eyeCalc_$myPid.Memory, parseFloat(e.value));
			}
			e.value = String(eyeCalc_$myPid.Memory);
		}
		eyeCalc_$myPid.Action = action;
		eyeCalc_$myPid.ClearOnNext = 1;
		return true;
	},

	Dot: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		if (eyeCalc_$myPid.ClearOnNext) {
			e.value = '0';
			eyeCalc_$myPid.ClearOnNext = 0;
		}
		if (e.value.substr(e.value.length - 1) === '.') {
			e.value = e.value.substr(0, e.value.length - 1);
		} else if (typeof e.value.split('.')[1] === 'undefined') {
			e.value += '.';
		}
	},

	Equal: function () {
		eyeCalc_$myPid.DoAction(0);
		eyeCalc_$myPid.Memory = 'null';
	},

	Exp: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		e.value = String(Math.exp(parseFloat(e.value)));
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	LN: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		if (parseFloat(e.value) > 0) {
			e.value = String(Math.log(parseFloat(e.value)));
		} else {
			eyeMessageBoxShow('$lang:Logarithm of a negative number or zero is invalid!');
			return false;
		}
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	Log: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		if (parseFloat(e.value) > 0) {
			e.value = String(Math.log(parseFloat(e.value)) / Math.log(10));
		} else {
			eyeMessageBoxShow('$lang:Logarithm of a negative number or zero is invalid!');
			return false;
		}
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	Factorial: function () {
		var e, num, output;
		e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		num = parseFloat(e.value);
		if (num >= 0 && Math.floor(num) === num) {
			output = 1;
			while (num > 0) {
				output *= num;
				num -= 1;
			}
			e.value = String(output);
		} else if (num < 0) {
			if (Math.floor(num) === num) {
				eyeMessageBoxShow('$lang:Factorial of a negative number is invalid!');
				return false;
			}
			e.value = String(Math.PI / (Math.sin(Math.PI * (num - 1)) * Math.exp(eyeCalc_$myPid.Actions.LogGamma(-num))));
		} else {
			e.value = String(Math.exp(eyeCalc_$myPid.Actions.LogGamma(num - 1)));
		}
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	OneDivX: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		if (parseFloat(e.value)) {
			e.value = String(eyeCalc_$myPid.Actions.Output(eyeCalc_$myPid.Actions.Divide('1', e.value)));
		} else {
			eyeMessageBoxShow('$lang:Division by zero is invalid!');
			return false;
		}
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	Percentage: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		e.value = String(eyeCalc_$myPid.Actions.Output(eyeCalc_$myPid.Actions.Input(e.value) + 'e-2'));
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	Pi: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		e.value = String(Math.PI);
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	Sign: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		if (eyeCalc_$myPid.ClearOnNext) {
			e.value = '0';
			eyeCalc_$myPid.ClearOnNext = 0;
		}
		if (e.value.substr(0, 1) === '-') {
			e.value = e.value.substr(1);
		} else {
			e.value = '-' + e.value;
		}
	},

	Sin: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		e.value = String(Math.sin(parseFloat(e.value) / 180 * Math.PI));
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	Sqrt: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		if (parseFloat(e.value) >= 0) {
			e.value = String(Math.sqrt(parseFloat(e.value)));
		} else {
			eyeMessageBoxShow('$lang:Square root of a negative number is invalid!');
			return false;
		}
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	Tan: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		e.value = String(Math.tan(parseFloat(e.value) / 180 * Math.PI));
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	XPowThree: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		e.value = eyeCalc_$myPid.Actions.Output(eyeCalc_$myPid.Actions.Multiply(eyeCalc_$myPid.Actions.Multiply(e.value, e.value), e.value));
		eyeCalc_$myPid.ClearOnNext = 1;
	},

	XPowTwo: function () {
		var e = document.getElementById('$myPid_eyeCalc_Textbox');
		e.focus();
		e.value = eyeCalc_$myPid.Actions.Output(eyeCalc_$myPid.Actions.Multiply(e.value, e.value));
		eyeCalc_$myPid.ClearOnNext = 1;
	}
};

eyeCalc_$myPid.Init();