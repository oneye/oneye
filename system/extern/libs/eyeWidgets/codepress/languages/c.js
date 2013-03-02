/*
 * CodePress regular expressions for C/C++ syntax highlighting
 */

// C/C++
Language.syntax = [
	{ input : /\"(.*?)(\"|<br>|<\/P>)/g, output : '<s>"$1$2</s>' }, // strings double quote
	{ input : /\'(.*?)(\'|<br>|<\/P>)/g, output : '<s>\'$1$2</s>' }, // strings single quote
	{ input : /\b(break|continue|do|for|new|this|void|case|default|else|return|while|if|switch|var|with|catch|bool|char|long|byte|short|int|try|false|catch|NULL|true|goto|cout|cin)\b/g, output : '<b>$1</b>' }, // reserved words
	{ input : /([^:]|^)\/\/(.*?)(<br|<\/P)/g, output : '$1<i>//$2</i>$3' }, // comments //
	{ input : /\/\*(.*?)\*\//g, output : '<i>/*$1*/</i>' }, // comments /* */
	{ input : /(\#.*?)(<br|<\/P)/g, output : '<u>$1</u>$2' } // # pre-procesor statments
]

Language.snippets = [
	{ input : 'for', output : 'for(int i=0;i < $0;i++) {' },
	{ input : 'if', output : 'if($0) {' },
	{ input : 'printf', output : 'printf("%s\\n",$0);' },
	{ input : 'main', output : 'int main(char argc, char *argv[]) {\n\t$0\n}' },
	{ input : 'inc', output : '#include &lt;$0.h&gt;' },
	{ input : 'incl', output : '#include &lt;$0&gt;' },
	{ input : 'using', output : 'using namespace $0' }
]

Language.complete = [
	{ input : '\'',output : '\'$0\'' },
	{ input : '"', output : '"$0"' },
	{ input : '(', output : '\($0\)' },
	{ input : '[', output : '\[$0\]' },
	{ input : '{', output : '{\n\t$0\n}' }
]

Language.shortcuts = []