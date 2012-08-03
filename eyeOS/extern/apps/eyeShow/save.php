<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
<title>Sample backend</title>
</head>
<body>

<?php
function escapeSLIM($rawSLIM) {
    return rawurlencode($rawSLIM);
}

function unescapeSLIM($encodedSLIM) {
    return rawurldecode($encodedSLIM);
}
?>

<h1>This is what the server gets:</h1>

Filename: <input type="text" value="<?php echo $_POST['filename'] ?>" />

<br /><br />

Slim Content:<br />
<textarea rows="2" cols="80"><?php
echo $_POST['slimContent'];
?></textarea>

<br /><br />

Unescaped Slim Content:<br />
<textarea rows="5" cols="80"><?php
echo unescapeSLIM(unescapeSLIM($_POST['slimContent']));
?></textarea>

</body>
</html>