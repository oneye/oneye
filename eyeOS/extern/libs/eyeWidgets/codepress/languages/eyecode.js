/*
 * CodePress regular expressions for eyecode syntax highlighting
 */

// eyeCode
Language.syntax = [
	{ input : /(&lt;[^!\?]*?&gt;)/g, output : '<b>$1</b>' }, // all tags
	{ input : /(&lt;style.*?&gt;)(.*?)(&lt;\/style&gt;)/g, output : '<em>$1</em><em>$2</em><em>$3</em>' }, // style tags
	{ input : /(&lt;script.*?&gt;)(.*?)(&lt;\/script&gt;)/g, output : '<ins>$1</ins><ins>$2</ins><ins>$3</ins>' }, // script tags
	{ input : /\"(.*?)(\"|<br>|<\/P>)/g, output : '<s>"$1$2</s>' }, // strings double quote
	{ input : /\'(.*?)(\'|<br>|<\/P>)/g, output : '<s>\'$1$2</s>'}, // strings single quote
	{ input : /(&lt;\?)/g, output : '<strong>$1' }, // <?.*
	{ input : /(\?&gt;)/g, output : '$1</strong>' }, // .*?>
	{ input : /(&lt;\?php|&lt;\?=|&lt;\?|\?&gt;)/g, output : '<cite>$1</cite>' }, // php tags
	{ input : /(\$[\w\.]*)/g, output : '<a>$1</a>' }, // vars
	{ input : /\b(reqLib|service|false|true|and|or|xor|__FILE__|exception|__LINE__|array|as|break|case|class|const|continue|declare|default|die|do|echo|else|elseif|empty|enddeclare|endfor|endforeach|endif|endswitch|endwhile|eval|exit|extends|for|foreach|function|global|if|include|include_once|isset|list|new|print|require|require_once|return|static|switch|unset|use|while|__FUNCTION__|__CLASS__|__METHOD__|final|php_user_filter|interface|implements|extends|public|private|protected|abstract|clone|try|catch|throw|this)\b/g, output : '<u>$1</u>' }, // reserved words
	{ input : /([^:])\/\/(.*?)(<br|<\/P)/g, output : '$1<i>//$2</i>$3' }, // php comments //
	{ input : /([^:])#(.*?)(<br|<\/P)/g, output : '$1<i>#$2</i>$3' }, // php comments #
	{ input : /\/\*(.*?)\*\//g, output : '<i>/*$1*/</i>' }, // php comments /* */
	{ input : /(&lt;!--.*?--&gt.)/g, output : '<big>$1</big>' } // html comments
]

Language.snippets = [
	{ input : 'if', output : 'if($0){\n\t\n}' },
	{ input : 'ifelse', output : 'if($0){\n\t\n}\nelse{\n\t\n}' },
	{ input : 'else', output : '}\nelse {\n\t' },
	{ input : 'elseif', output : '}\nelseif($0) {\n\t' },
	{ input : 'do', output : 'do{\n\t$0\n}\nwhile();' },
	{ input : 'inc', output : 'include_once("$0");' },
	{ input : 'fun', output : 'function $0(){\n\t\n}' },
	{ input : 'func', output : 'function $0(){\n\t\n}' },
	{ input : 'while', output : 'while($0){\n\t\n}' },
	{ input : 'for', output : 'for($0,,){\n\t\n}' },
	{ input : 'fore', output : 'foreach($0 as ){\n\t\n}' },
	{ input : 'foreach', output : 'foreach($0 as ){\n\t\n}' },
	{ input : 'echo', output : 'echo \'$0\';' },
	{ input : 'switch', output : 'switch($0) {\n\tcase "": break;\n\tdefault: ;\n}' },
	{ input : 'case', output : 'case "$0" : break;' },
	{ input : 'ret0', output : 'return false;' },
	{ input : 'retf', output : 'return false;' },
	{ input : 'ret1', output : 'return true;' },
	{ input : 'rett', output : 'return true;' },
	{ input : 'ret', output : 'return $0;' },
	{ input : 'def', output : 'define(\'$0\',\'\');' },
	{ input : '<?', output : 'php\n$0\n?>' },
	{ input : 'onmes', output : 'function $0_on_Message($params=\'\') {\n\treqLib(\'eyeWidgets\', \'updateContent\', $params);\n}' },
	{ input : 'onclo', output : 'function $0_on_Close($params=\'\'){\n\tproc(\'end\');\n}' },
	{ input : 'event', output : 'function $0_on_($params=\'\'){\n\t\n}' },
	{ input : 'run', output : 'function $0_run($params=null) {\n\n}'},
	{ input : 'end', output: 'function $0_end($params=null) {\n\treqLib(\'eyeWidgets\',\'unserialize\');\n}'},
	{ input : 'tapp', output: '<?php\nfunction $0_run($params=null) {\n\n}\n\nfunction _end($params=null) {\n\treqLib(\'eyeWidgets\',\'unserialize\');\n}\n?>'},
	{ input : 'tevt', output : '<?php\nfunction $0_on_Message($params=\'\') {\n\treqLib(\'eyeWidgets\', \'updateContent\', $params);\n}\n\nfunction _on_Close($params=\'\'){\n\tproc(\'end\');\n}\n?>' },
	{ input : 'window', output: "\t$myWindow = new Window(array(\n\t\t'name'=>'_WND_1',\n\t\t'father'=>'eyeApps',\n\t\t'type'=>NORMAL_WINDOW,\n\t\t'width'=>450,\n\t\t'height'=>450,\n\t\t'title'=>''\n\t));\n\t$myWindow->show();\n"},
	{ input : 'tree', output: "\t$myTree = new Tree(array(\n\t\t'name'=>'_TREE_1',\n\t\t'father'=>'_WND_1_Content',\n\t\t'x'=>20,\n\t\t'y'=>20,\n\t\t'width' =>200,\n\t\t'height' => 200,\n\t));\n\t$myTree->show();\n"},
	{ input : 'toolbar', output: "\t$toolbar = new Toolbar(array(\n\t\t'name' => '_TLB_1',\n\t\t'father' => '_WND_1_Content',\n\t\t'x' => 20,\n\t\t'y' => 20\n\t));\n\t$toolbar->show();\n"},
	{ input : 'textbox', output: "\t$urlTextbox = new Textbox(array(\n\t\t'name' => '_TXT_',\n\t\t'father' => '_WND_1_Content',\n\t\t'x' => 20,\n\t\t'y' => 20,\n\t\t'width' => 200,\n\t\t'text' => ''\n\t));\n\t$urlTextbox->show();\n"},
	{ input : 'textarea', output: "\t$myTextArea = new Textarea(array(\n\t\t'name'=>'_TXTAREA_',\n\t\t'father'=>'_WND_1_Content',\n\t\t'width'=>300,\n\t\t'height'=>300,\n\t\t'x'=>20,\n\t\t'y'=>60,\n\t));\n\t$myTextArea->show();\n"},
	{ input : 'tab', output: "\t$myTab = new Tab(array(\n\t\t'name' => '_TAB_1',\n\t\t'father' => '_WND_1_Content',\n\t\t'width' => 300,\n\t\t'height' => 300,\n\t\t'x' => 20,\n\t\t'y' => 20\n\t));\n\t$myTab->show();\n"},
	{ input : 'sortable', output: "\t$sortypes = array();\n\t$myHeader = array();\n\t$myTable = new Sortabletable(array(\n\t\t'name'=>'_TBL_1',\n\t\t'father'=>'_WND_1_Content',\n\t\t'sortypes'=>$sortypes,\n\t\t'theader'=>$myHeader,\n\t\t'x'=>20,\n\t\t'y'=>20,\n\t\t'width'=>300,\n\t\t'height'=>300));\n\t$myTable->show();\n"},
	{ input : 'select', output: "\t$mySelect = new Select(array(\n\t\t'name'=>'_SLCT_1',\n\t\t'father'=>'_WND_1_Content',\n\t\t'x'=>20,\n\t\t'y'=>20));\n\t$mySelect->show();\n"},
	{ input : 'progress', output: "\t$myProgress = new ProgressBar(array(\n\t\t'name' => '_PRGB_1',\n\t\t'father' => '_WND_1_Content',\n\t\t'width' => 200,\n\t\t'x' => 20,\n\t\t'y' => 20,\n\t\t'max' => 100,\n\t\t'progress' => 0\n\t));\n\t$myProgress->show();\n"},
	{ input : 'line', output: "\t$myLine = new Line(array(\n\t\t'name'=>'_LN_1',\n\t\t'father'=>'_WND_1_Content',\n\t\t'x'=>20,\n\t\t'y'=>20,\n\t\t'width'=>1,\n\t\t'height'=>20));\n\t$myLine->show(0);\n"},
	{ input : 'label', output: "\t$nameLabel = new Label(array(\n\t\t'name' => '_LBL_1',\n\t\t'father' => '_WND_1_Content',\n\t\t'x' => 20,\n\t\t'y' => 20,\n\t\t'text' => '$0'\n\t));\n\t$nameLabel->show();\n"},
	{ input : 'imagebox', output: "\t$myImage = new Imagebox(array(\n\t\t'name'=>'_IMG_1',\n\t\t'father'=>'_WND_1_Content',\n\t\t'url'=>'$0',\n\t\t'x'=>20,\n\t\t'y'=>20));\n\t$myImage->show();\n"},
	{ input : 'iframe', output: "\t$myFrame = new Iframe(array(\n\t\t'name'=>'_IFRM_1',\n\t\t'father'=>'_WND_1_Content',\n\t\t'x'=>20,\n\t\t'y'=>20,\n\t\t'height'=>300,\n\t\t'width'=>300,\n\t\t'url'=>'$0'\n\t));\n\t$myFrame->show();\n"},
	{ input : 'icon', output: "\t$myIcon = new Icon(array(\n\t\t'name'=>'_ICON_1',\n\t\t'father'=>'_WND_1_Content',\n\t\t'image'=>'$0',\n\t\t'content'=>array(),\n\t\t'x'=>20,\n\t\t'y'=>20));\n\t$myIcon->show();\n"},
	{ input : 'shidden', output: "\t$myHidden = new Hidden(array(\n\t\t'name'=>'_HDN_1',\n\t\t'father'=>'_WND_1_Content',\n\t\t'text'=>'$0'\n\t));\n\treqLib('eyeWidgets','serialize',array($myHidden));\n"},
	{ input : 'hidden', output: "\t$myHidden = new Hidden(array(\n\t\t'name'=>'_HDN_1',\n\t\t'father'=>'_WND_1_Content',\n\t\t'text'=>'$0'\n\t));\n\t$myHidden->show();\n"},
	{ input : 'flash', output: "\t$flashParamsNames[] = '';\n\t$flashParamsValues[] = '';\n\n\t$myFlash = new Flash(array(\n\t\t'name'=>'_SWF_1',\n\t\t'title' => '',\n\t\t'father' => '_WND_1',\n\t\t'x' => 0,\n\t\t'y' => 0,\n\t\t'width' => 300,\n\t\t'height' => 300,\n\t\t'src' => '$0',\n\t\t'flashParamsNames' => $flashParamsNames,\n\t\t'flashParamsValues' => $flashParamsValues\n\t));\n\t$myFlash->show();\n"},
	{ input : 'file', output: "\t$myFile = new File(array(\n\t\t'name'=> '_FILE_1',\n\t\t'father'=>'_WND_1_Content',\n\t\t'x'=>20,\n\t\t'y'=>20,\n\t\t'callback'=>'$0',\n\t\t'filename'=>'myFile'\n\t));\n\t$myFile->show();\n"},
	{ input : 'checkbox', output: "\t$myCheckBox = new Checkbox(array(\n\t\t'name'=>'_CHK_1',\n\t\t'father'=>'_WND_1_Content',\n\t\t'x'=>20,\n\t\t'y'=>20,\n\t\t'text'=>'$0'));\n\t$myCheckBox->show();\n"},
	{ input : 'button', output: "\t$myButton = new Button(array(\n\t\t'name'=>'_BTN_1',\n\t\t'caption'=>'$0',\n\t\t'father'=>'_WND_1_Content',\n\t\t'x'=>20,\n\t\t'y'=>20\n\t));\n\t$myButton->show();\n"},
	{ input : 'fudir', output: "\t$myUserDir = service('um','getCurrentUserDir').FILES_USER_DIR.'/';"},
	{ input : 'cudir', output: "\t$myUserDir = service('um','getCurrentUserDir').CONF_USER_DIR.'/';"},
	{ input : 'msgbox', output: "\tservice('eyex','messageBox',array('content' => '$0'));"},
	{ input : 'sudo', output: "\tglobal $currentUser;\n\t$oldUser = $currentUser;\n\t$currentUser = ROOTUSER;\n\t$0\n\t$currentUser = $oldUser;"}
]
		

Language.complete = [
	{ input : '\'', output : '\'$0\'' },
	{ input : '"', output : '"$0"' },
	{ input : '(', output : '\($0\)' },
	{ input : '[', output : '\[$0\]' },
	{ input : '{', output : '{\n\t$0\n}' }
]

Language.shortcuts = [
	{ input : '[space]', output : '&nbsp;' },
	{ input : '[enter]', output : '<br />' } ,
	{ input : '[j]', output : 'testing' },
	{ input : '[7]', output : '&amp;' }
]