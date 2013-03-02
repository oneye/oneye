<?php

/*
   +-----------------+------------------------------------------------------------+
   |  Script         | eyeNavProxy fork of PHProxy                                |
   |  Author         | Forked by Fabian Olesen, original author Abdullah Arif     |
   |  Last Modified  | 5:27 PM 1/20/2007                                          |
   +-----------------+------------------------------------------------------------+
   |  This program is free software; you can redistribute it and/or               |
   |  modify it under the terms of the GNU General Public License                 |
   |  as published by the Free Software Foundation; either version 2              |
   |  of the License, or (at your option) any later version.                      |
   |                                                                              |
   |  This program is distributed in the hope that it will be useful,             |
   |  but WITHOUT ANY WARRANTY; without even the implied warranty of              |
   |  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               |
   |  GNU General Public License for more details.                                |
   |                                                                              |
   |  You should have received a copy of the GNU General Public License           |
   |  along with this program; if not, write to the Free Software                 |
   |  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA. |
   +------------------------------------------------------------------------------+
*/

// error_reporting(E_ALL); // oneye

//
// CONFIGURABLE OPTIONS
//

$GLOBALS['_config']            = array
                    (
                        'url_var_name'             => 'page', // oneye
                        'flags_var_name'           => 'hl',
                        'get_form_name'            => '____pgfa',
                        'basic_auth_var_name'      => '____pbavn',
                        'max_file_size'            => -1,
                        'allow_hotlinking'         => 1, // oneye
                        'upon_hotlink'             => 1,
                        'compress_output'          => 1 // oneye
                    );
$GLOBALS['_flags']             = array
                    (
                        'include_form'    => 0, // oneye
                        'remove_scripts'  => 0, // oneye
                        'accept_cookies'  => 1,
                        'show_images'     => 1,
                        'show_referer'    => 1,
                        'rotate13'        => 0,
                        'base64_encode'   => 1,
                        'strip_meta'      => 1,
                        'strip_title'     => 0,
                        'session_cookies' => 1
                    );
$GLOBALS['_frozen_flags']      = array
                    ( // oneye
                        'include_form'    => 1,
                        'remove_scripts'  => 1,
                        'accept_cookies'  => 1,
                        'show_images'     => 1,
                        'show_referer'    => 1,
                        'rotate13'        => 1,
                        'base64_encode'   => 1,
                        'strip_meta'      => 1,
                        'strip_title'     => 1,
                        'session_cookies' => 1
                    );
$GLOBALS['_labels']            = array
                    (
                        'include_form'    => array('Include Form', 'Include mini URL-form on every page'),
                        'remove_scripts'  => array('Remove Scripts', 'Remove client-side scripting (i.e JavaScript)'),
                        'accept_cookies'  => array('Accept Cookies', 'Allow cookies to be stored'),
                        'show_images'     => array('Show Images', 'Show images on browsed pages'),
                        'show_referer'    => array('Show Referer', 'Show actual referring Website'),
                        'rotate13'        => array('Rotate13', 'Use ROT13 encoding on the address'),
                        'base64_encode'   => array('Base64', 'Use base64 encodng on the address'),
                        'strip_meta'      => array('Strip Meta', 'Strip meta information tags from pages'),
                        'strip_title'     => array('Strip Title', 'Strip page title'),
                        'session_cookies' => array('Session Cookies', 'Store cookies for this session only')
                    );
                    
$GLOBALS['_hosts']             = array
                    (
                        '#^127\.|192\.168\.|10\.|172\.(1[6-9]|2[0-9]|3[01])\.|localhost#i'
                    );
$GLOBALS['_hotlink_domains']   = array();
$GLOBALS['_insert']            = array();

//
// END CONFIGURABLE OPTIONS. The ride for you ends here. Close the file.
//

$GLOBALS['_iflags']            = '';
$GLOBALS['_system']            = array
                    (
                        'ssl'          => extension_loaded('openssl') && version_compare(PHP_VERSION, '4.3.0', '>='),
                        'uploads'      => ini_get('file_uploads'),
                        'gzip'         => extension_loaded('zlib') && !ini_get('zlib.output_compression'),
                        'stripslashes' => get_magic_quotes_gpc()
                    );
$GLOBALS['_proxify']           = array('text/html' => 1, 'application/xml+xhtml' => 1, 'application/xhtml+xml' => 1, 'text/css' => 1);
$GLOBALS['_version']           = '0.1';
$GLOBALS['_scriptname']        = 'eyeNavProxy';
$GLOBALS['_http_host']         = isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : (isset($_SERVER['SERVER_NAME']) ? $_SERVER['SERVER_NAME'] : 'localhost');
// $GLOBALS['_script_url']        = 'http' . ((isset($_ENV['HTTPS']) && $_ENV['HTTPS'] == 'on') || $_SERVER['SERVER_PORT'] == 443 ? 's' : '') . '://' . $GLOBALS['_http_host'] . ($_SERVER['SERVER_PORT'] != 80 && $_SERVER['SERVER_PORT'] != 443 ? ':' . $_SERVER['SERVER_PORT'] : '') . $_SERVER['PHP_SELF']; // oneye
// $GLOBALS['_script_base']       = substr($GLOBALS['_script_url'], 0, strrpos($GLOBALS['_script_url'], '/')+1); // oneye
$GLOBALS['_url']               = '';
$GLOBALS['_url_parts']         = array();
$GLOBALS['_base']              = array();
$GLOBALS['_socket']            = null;
$GLOBALS['_request_method']    = $_SERVER['REQUEST_METHOD'];
$GLOBALS['_request_headers']   = '';
$GLOBALS['_cookie']            = '';
$GLOBALS['_post_body']         = '';
$GLOBALS['_response_headers']  = array();
$GLOBALS['_response_keys']     = array();
$GLOBALS['_http_version']      = '';
$GLOBALS['_response_code']     = 0;
$GLOBALS['_content_type']      = 'text/html';
$GLOBALS['_content_length']    = false;
$GLOBALS['_content_disp']      = '';
$GLOBALS['_set_cookie']        = array();
$GLOBALS['_retry']             = false;
$GLOBALS['_quit']              = false;
$GLOBALS['_basic_auth_header'] = '';
$GLOBALS['_basic_auth_realm']  = '';
$GLOBALS['_auth_creds']        = array();
$GLOBALS['_response_body']     = '';

//
// FUNCTION DECLARATIONS
//

function show_report($data)
{
    include $data['which'] . '.inc.php';
    exit(0);
}

function add_cookie($name, $value, $expires = 0)
{
    return rawurlencode(rawurlencode($name)) . '=' . rawurlencode(rawurlencode($value)) . (empty($expires) ? '' : '; expires=' . gmdate('D, d-M-Y H:i:s \G\M\T', $expires)) . '; path=/; domain=.' . $GLOBALS['_http_host'];
}

function set_post_vars($array, $parent_key = null)
{
    $temp = array();

    foreach ($array as $key => $value)
    {
        $key = isset($parent_key) ? sprintf('%s[%s]', $parent_key, urlencode($key)) : urlencode($key);
        if (is_array($value))
        {
            $temp = array_merge($temp, set_post_vars($value, $key));
        }
        else
        {
            $temp[$key] = urlencode($value);
        }
    }
    
    return $temp;
}

function set_post_files($array, $parent_key = null)
{
    $temp = array();

    foreach ($array as $key => $value)
    {
        $key = isset($parent_key) ? sprintf('%s[%s]', $parent_key, urlencode($key)) : urlencode($key);
        if (is_array($value))
        {
            $temp = array_merge_recursive($temp, set_post_files($value, $key));
        }
        else if (preg_match('#^([^\[\]]+)\[(name|type|tmp_name)\]#', $key, $m))
        {
            $temp[str_replace($m[0], $m[1], $key)][$m[2]] = $value;
        }
    }

    return $temp;
}

function url_parse($url, & $container)
{
    $temp = @parse_url($url);

    if (!empty($temp))
    {
        $temp['port_ext'] = '';
        $temp['base']     = $temp['scheme'] . '://' . $temp['host'];

        if (isset($temp['port']))
        {
            $temp['base'] .= $temp['port_ext'] = ':' . $temp['port'];
        }
        else
        {
            $temp['port'] = $temp['scheme'] === 'https' ? 443 : 80;
        }
        
        $temp['path'] = isset($temp['path']) ? $temp['path'] : '/';
        $path         = array();
        $temp['path'] = explode('/', $temp['path']);
    
        foreach ($temp['path'] as $dir)
        {
            if ($dir === '..')
            {
                array_pop($path);
            }
            else if ($dir !== '.')
            {
                for ($dir = rawurldecode($dir), $new_dir = '', $i = 0, $count_i = strlen($dir); $i < $count_i; $new_dir .= strspn($dir{$i}, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789$-_.+!*\'(),?:@&;=') ? $dir{$i} : rawurlencode($dir{$i}), ++$i);
                $path[] = $new_dir;
            }
        }

        $temp['path']     = str_replace('/%7E', '/~', '/' . ltrim(implode('/', $path), '/'));
        $temp['file']     = substr($temp['path'], strrpos($temp['path'], '/')+1);
        $temp['dir']      = substr($temp['path'], 0, strrpos($temp['path'], '/'));
        $temp['base']    .= $temp['dir'];
        $temp['prev_dir'] = substr_count($temp['path'], '/') > 1 ? substr($temp['base'], 0, strrpos($temp['base'], '/')+1) : $temp['base'] . '/';
        $container = $temp;

        return true;
    }
    
    return false;
}

function complete_url($url, $proxify = true)
{
    $url = trim($url);
    
    if ($url === '')
    {
        return '';
    }
    
    $hash_pos = strrpos($url, '#');
    $fragment = $hash_pos !== false ? '#' . substr($url, $hash_pos) : '';
    $sep_pos  = strpos($url, '://');
    
    if ($sep_pos === false || $sep_pos > 5)
    {
        switch ($url{0})
        {
            case '/':
                $url = substr($url, 0, 2) === '//' ? $GLOBALS['_base']['scheme'] . ':' . $url : $GLOBALS['_base']['scheme'] . '://' . $GLOBALS['_base']['host'] . $GLOBALS['_base']['port_ext'] . $url;
                break;
            case '?':
                $url = $GLOBALS['_base']['base'] . '/' . $GLOBALS['_base']['file'] . $url;
                break;
            case '#':
                $proxify = false;
                break;
            case 'm':
                if (substr($url, 0, 7) == 'mailto:')
                {
                    $proxify = false;
                    break;
                }
            default:
                $url = $GLOBALS['_base']['base'] . '/' . $url;
        }
    }

    return $proxify ? "{$GLOBALS['_script_url']}&{$GLOBALS['_config']['url_var_name']}=" . encode_url($url) . $fragment : $url;
}

function proxify_inline_css($css)
{
    preg_match_all('#url\s*\(\s*(([^)]*(\\\))*[^)]*)(\)|$)?#i', $css, $matches, PREG_SET_ORDER);

    for ($i = 0, $count = count($matches); $i < $count; ++$i)
    {
        $css = str_replace($matches[$i][0], 'url(' . proxify_css_url($matches[$i][1]) . ')', $css);
    }
    
    return $css;
}

function proxify_css($css)
{
    $css = proxify_inline_css($css);

    preg_match_all("#@import\s*(?:\"([^\">]*)\"?|'([^'>]*)'?)([^;]*)(;|$)#i", $css, $matches, PREG_SET_ORDER);

    for ($i = 0, $count = count($matches); $i < $count; ++$i)
    {
        $delim = '"';
        $url   = $matches[$i][2];

        if (isset($matches[$i][3]))
        {
            $delim = "'";
            $url = $matches[$i][3];
        }

        $css = str_replace($matches[$i][0], '@import ' . $delim . proxify_css_url($matches[$i][1]) . $delim . (isset($matches[$i][4]) ? $matches[$i][4] : ''), $css);
    }

    return $css;
}

function proxify_css_url($url)
{
    $url   = trim($url);
    $delim = strpos($url, '"') === 0 ? '"' : (strpos($url, "'") === 0 ? "'" : '');

    return $delim . preg_replace('#([\(\),\s\'"\\\])#', '\\$1', complete_url(trim(preg_replace('#\\\(.)#', '$1', trim($url, $delim))))) . $delim;
}

//
// SET FLAGS
//

if (isset($_POST[$GLOBALS['_config']['url_var_name']]) && !isset($_GET[$GLOBALS['_config']['url_var_name']]) && isset($_POST[$GLOBALS['_config']['flags_var_name']]))
{
    foreach ($GLOBALS['_flags'] as $flag_name => $flag_value)
    {
        $GLOBALS['_iflags'] .= isset($_POST[$GLOBALS['_config']['flags_var_name']][$flag_name]) ? (string)(int)(bool)$_POST[$GLOBALS['_config']['flags_var_name']][$flag_name] : ($GLOBALS['_frozen_flags'][$flag_name] ? $flag_value : '0');
    }
    
    $GLOBALS['_iflags'] = base_convert(($GLOBALS['_iflags'] != '' ? $GLOBALS['_iflags'] : '0'), 2, 16);
}
else if (isset($_GET[$GLOBALS['_config']['flags_var_name']]) && !isset($_GET[$GLOBALS['_config']['get_form_name']]) && ctype_alnum($_GET[$GLOBALS['_config']['flags_var_name']]))
{
    $GLOBALS['_iflags'] = $_GET[$GLOBALS['_config']['flags_var_name']];
}
else if (isset($_COOKIE['flags']) && ctype_alnum($_COOKIE['flags']))
{
    $GLOBALS['_iflags'] = $_COOKIE['flags'];
}

if ($GLOBALS['_iflags'] !== '')
{
    $GLOBALS['_set_cookie'][] = add_cookie('flags', $GLOBALS['_iflags'], time()+2419200);
    $GLOBALS['_iflags'] = str_pad(base_convert($GLOBALS['_iflags'], 16, 2), count($GLOBALS['_flags']), '0', STR_PAD_LEFT);
    $i = 0;

    foreach ($GLOBALS['_flags'] as $flag_name => $flag_value)
    {
        $GLOBALS['_flags'][$flag_name] = $GLOBALS['_frozen_flags'][$flag_name] ? $flag_value : (int)(bool)$GLOBALS['_iflags']{$i};
        $i++;
    }
}

//
// DETERMINE URL-ENCODING BASED ON FLAGS
//

if ($GLOBALS['_flags']['rotate13'])
{
    function encode_url($url)
    {
        return rawurlencode(str_rot13($url));
    }
    function decode_url($url)
    {
        return str_replace(array('&amp;', '&#38;'), '&', str_rot13(rawurldecode($url)));
    }
}
else if ($GLOBALS['_flags']['base64_encode'])
{
    function encode_url($url)
    {
        return rawurlencode(base64_encode($url));
    }
    function decode_url($url)
    {
        return str_replace(array('&amp;', '&#38;'), '&', base64_decode(rawurldecode($url)));
    }
}
else
{
    function encode_url($url)
    {
        return rawurlencode($url);
    }
    function decode_url($url)
    {
        return str_replace(array('&amp;', '&#38;'), '&', rawurldecode($url));
    }
}

//
// COMPRESS OUTPUT IF INSTRUCTED
//

if ($GLOBALS['_config']['compress_output'] && $GLOBALS['_system']['gzip'])
{
    ob_start('ob_gzhandler');
}

//
// STRIP SLASHES FROM GPC IF NECESSARY
//

if ($GLOBALS['_system']['stripslashes'])
{
    function _stripslashes($value)
    {
        return is_array($value) ? array_map('_stripslashes', $value) : (is_string($value) ? stripslashes($value) : $value);
    }
    
    $_GET    = _stripslashes($_GET);
    $_POST   = _stripslashes($_POST);
    $_COOKIE = _stripslashes($_COOKIE);
}

//
// FIGURE OUT WHAT TO DO (POST URL-form submit, GET form request, regular request, basic auth, cookie manager, show URL-form)
//

if (isset($_POST[$GLOBALS['_config']['url_var_name']]) && !isset($_GET[$GLOBALS['_config']['url_var_name']]))
{
    header('Location: ' . $GLOBALS['_script_url'] . '&' . $GLOBALS['_config']['url_var_name'] . '=' . encode_url($_POST[$GLOBALS['_config']['url_var_name']]) . '&' . $GLOBALS['_config']['flags_var_name'] . '=' . base_convert($GLOBALS['_iflags'], 2, 16));
    exit(0);
}

if (isset($_GET[$GLOBALS['_config']['get_form_name']]))
{
    $GLOBALS['_url']  = decode_url($_GET[$GLOBALS['_config']['get_form_name']]);
    $qstr = strpos($GLOBALS['_url'], '?') !== false ? (strpos($GLOBALS['_url'], '?') === strlen($GLOBALS['_url'])-1 ? '' : '&') : '?';
    $arr  = explode('&', $_SERVER['QUERY_STRING']);
    
    if (preg_match('#^\Q' . $GLOBALS['_config']['get_form_name'] . '\E#', $arr[0]))
    {
        array_shift($arr);
    }
    
    $GLOBALS['_url'] .= $qstr . implode('&', $arr);
}
else if (isset($_GET[$GLOBALS['_config']['url_var_name']]))
{
    $GLOBALS['_url'] = decode_url($_GET[$GLOBALS['_config']['url_var_name']]);
}
else if (isset($_GET['action']) && $_GET['action'] == 'cookies')
{
    show_report(array('which' => 'cookies'));
}
else
{
    show_report(array('which' => 'index', 'category' => 'entry_form'));
}

if (isset($_GET[$GLOBALS['_config']['url_var_name']], $_POST[$GLOBALS['_config']['basic_auth_var_name']], $_POST['username'], $_POST['password']))
{
    $GLOBALS['_request_method']    = 'GET';
    $GLOBALS['_basic_auth_realm']  = base64_decode($_POST[$GLOBALS['_config']['basic_auth_var_name']]);
    $GLOBALS['_basic_auth_header'] = base64_encode($_POST['username'] . ':' . $_POST['password']);
}

//
// SET URL
//

if (strpos($GLOBALS['_url'], '://') === false)
{
    $GLOBALS['_url'] = 'http://' . $GLOBALS['_url'];
}

if (url_parse($GLOBALS['_url'], $GLOBALS['_url_parts']))
{
    $GLOBALS['_base'] = $GLOBALS['_url_parts'];
    
    if (!empty($GLOBALS['_hosts']))
    {
        foreach ($GLOBALS['_hosts'] as $host)
        {
            if (preg_match($host, $GLOBALS['_url_parts']['host']))
            {
                show_report(array('which' => 'index', 'category' => 'error', 'group' => 'url', 'type' => 'external', 'error' => 1));
            }
        }
    }
}
else
{
    show_report(array('which' => 'index', 'category' => 'error', 'group' => 'url', 'type' => 'external', 'error' => 2));
}

//
// HOTLINKING PREVENTION
//

if (!$GLOBALS['_config']['allow_hotlinking'] && isset($_SERVER['HTTP_REFERER']))
{
    $GLOBALS['_hotlink_domains'][] = $GLOBALS['_http_host'];
    $is_hotlinking      = true;
    
    foreach ($GLOBALS['_hotlink_domains'] as $host)
    {
        if (preg_match('#^https?\:\/\/(www)?\Q' . $host  . '\E(\/|\:|$)#i', trim($_SERVER['HTTP_REFERER'])))
        {
            $is_hotlinking = false;
            break;
        }
    }
    
    if ($is_hotlinking)
    {
        switch ($GLOBALS['_config']['upon_hotlink'])
        {
            case 1:
                show_report(array('which' => 'index', 'category' => 'error', 'group' => 'resource', 'type' => 'hotlinking'));
                break;
            case 2:
                header('HTTP/1.0 404 Not Found');
                exit(0);
            default:
                header('Location: ' . $GLOBALS['_config']['upon_hotlink']);
                exit(0);
        }
    }
}
 
//
// OPEN SOCKET TO SERVER
//

do
{
    $GLOBALS['_retry']  = false;
    $GLOBALS['_socket'] = @fsockopen(($GLOBALS['_url_parts']['scheme'] === 'https' && $GLOBALS['_system']['ssl'] ? 'ssl://' : 'tcp://') . $GLOBALS['_url_parts']['host'], $GLOBALS['_url_parts']['port'], $err_no, $err_str, 30);

    if ($GLOBALS['_socket'] === false)
    {
        show_report(array('which' => 'index', 'category' => 'error', 'group' => 'url', 'type' => 'internal', 'error' => $err_no));
    }

    //
    // SET REQUEST HEADERS
    //

    $GLOBALS['_request_headers']  = $GLOBALS['_request_method'] . ' ' . $GLOBALS['_url_parts']['path'];

    if (isset($GLOBALS['_url_parts']['query']))
    {
        $GLOBALS['_request_headers'] .= '?';
        $query = preg_split('#([&;])#', $GLOBALS['_url_parts']['query'], -1, PREG_SPLIT_DELIM_CAPTURE);
        for ($i = 0, $count = count($query); $i < $count; $GLOBALS['_request_headers'] .= implode('=', array_map('urlencode', array_map('urldecode', explode('=', $query[$i])))) . (isset($query[++$i]) ? $query[$i] : ''), $i++);
    }

    $GLOBALS['_request_headers'] .= " HTTP/1.0\r\n";
    $GLOBALS['_request_headers'] .= 'Host: ' . $GLOBALS['_url_parts']['host'] . $GLOBALS['_url_parts']['port_ext'] . "\r\n";

    if (isset($_SERVER['HTTP_USER_AGENT']))
    {
        $GLOBALS['_request_headers'] .= 'User-Agent: ' . $_SERVER['HTTP_USER_AGENT'] . ' (eyeNav ' . EYEOS_VERSION . ')' . "\r\n"; // oneye
    }
    if (isset($_SERVER['HTTP_ACCEPT']))
    {
        $GLOBALS['_request_headers'] .= 'Accept: ' . $_SERVER['HTTP_ACCEPT'] . "\r\n";
    }
    else
    {
        $GLOBALS['_request_headers'] .= "Accept: */*;q=0.1\r\n";
    }
    if ($GLOBALS['_flags']['show_referer'] && isset($_SERVER['HTTP_REFERER']) && preg_match('#^\Q' . $GLOBALS['_script_url'] . '&' . $GLOBALS['_config']['url_var_name'] . '=\E([^&]+)#', $_SERVER['HTTP_REFERER'], $matches))
    {
        $GLOBALS['_request_headers'] .= 'Referer: ' . decode_url($matches[1]) . "\r\n";
    }
    if (!empty($_COOKIE))
    {
        $_cookie  = '';
        $GLOBALS['_auth_creds']    = array();
    
        foreach ($_COOKIE as $cookie_id => $cookie_content)
        {
            $cookie_id      = explode(';', rawurldecode($cookie_id));
            $cookie_content = explode(';', rawurldecode($cookie_content));
    
            if ($cookie_id[0] === 'COOKIE')
            {
                $cookie_id[3] = str_replace('_', '.', $cookie_id[3]); //stupid PHP can't have dots in var names

                if (count($cookie_id) < 4 || ($cookie_content[1] == 'secure' && $GLOBALS['_url_parts']['scheme'] != 'https'))
                {
                    continue;
                }
    
                if ((preg_match('#\Q' . $cookie_id[3] . '\E$#i', $GLOBALS['_url_parts']['host']) || strtolower($cookie_id[3]) == strtolower('.' . $GLOBALS['_url_parts']['host'])) && preg_match('#^\Q' . $cookie_id[2] . '\E#', $GLOBALS['_url_parts']['path']))
                {
                    $_cookie .= ($_cookie != '' ? '; ' : '') . (empty($cookie_id[1]) ? '' : $cookie_id[1] . '=') . $cookie_content[0];
                }
            }
            else if ($cookie_id[0] === 'AUTH' && count($cookie_id) === 3)
            {
                $cookie_id[2] = str_replace('_', '.', $cookie_id[2]);

                if ($GLOBALS['_url_parts']['host'] . ':' . $GLOBALS['_url_parts']['port'] === $cookie_id[2])
                {
                    $GLOBALS['_auth_creds'][$cookie_id[1]] = $cookie_content[0];
                }
            }
        }
        
        if ($_cookie != '')
        {
            $GLOBALS['_request_headers'] .= "Cookie: $_cookie\r\n";
        }
    }
    if (isset($GLOBALS['_url_parts']['user'], $GLOBALS['_url_parts']['pass']))
    {
        $GLOBALS['_basic_auth_header'] = base64_encode($GLOBALS['_url_parts']['user'] . ':' . $GLOBALS['_url_parts']['pass']);
    }
    if (!empty($GLOBALS['_basic_auth_header']))
    {
        $GLOBALS['_set_cookie'][] = add_cookie("AUTH;{$GLOBALS['_basic_auth_realm']};{$GLOBALS['_url_parts']['host']}:{$GLOBALS['_url_parts']['port']}", $GLOBALS['_basic_auth_header']);
        $GLOBALS['_request_headers'] .= "Authorization: Basic {$GLOBALS['_basic_auth_header']}\r\n";
    }
    else if (!empty($GLOBALS['_basic_auth_realm']) && isset($GLOBALS['_auth_creds'][$GLOBALS['_basic_auth_realm']]))
    {
        $GLOBALS['_request_headers']  .= "Authorization: Basic {$GLOBALS['_auth_creds'][$GLOBALS['_basic_auth_realm']]}\r\n";
    }
    else if (list($GLOBALS['_basic_auth_realm'], $GLOBALS['_basic_auth_header']) = each($GLOBALS['_auth_creds']))
    {
        $GLOBALS['_request_headers'] .= "Authorization: Basic {$GLOBALS['_basic_auth_header']}\r\n";
    }
    if ($GLOBALS['_request_method'] == 'POST')
    {
        if (!empty($_FILES) && $GLOBALS['_system']['uploads'])
        {
            $_data_boundary = '----' . md5(uniqid(rand(), true));
            $array = set_post_vars($_POST);
    
            foreach ($array as $key => $value)
            {
                $GLOBALS['_post_body'] .= "--{$_data_boundary}\r\n";
                $GLOBALS['_post_body'] .= "Content-Disposition: form-data; name=\"$key\"\r\n\r\n";
                $GLOBALS['_post_body'] .= urldecode($value) . "\r\n";
            }
            
            $array = set_post_files($_FILES);
    
            foreach ($array as $key => $file_info)
            {
                $GLOBALS['_post_body'] .= "--{$_data_boundary}\r\n";
                $GLOBALS['_post_body'] .= "Content-Disposition: form-data; name=\"$key\"; filename=\"{$file_info['name']}\"\r\n";
                $GLOBALS['_post_body'] .= 'Content-Type: ' . (empty($file_info['type']) ? 'application/octet-stream' : $file_info['type']) . "\r\n\r\n";
    
                if (is_readable($file_info['tmp_name']))
                {
                    $handle = fopen($file_info['tmp_name'], 'rb');
                    $GLOBALS['_post_body'] .= fread($handle, filesize($file_info['tmp_name']));
                    fclose($handle);
                }
                
                $GLOBALS['_post_body'] .= "\r\n";
            }
            
            $GLOBALS['_post_body']       .= "--{$_data_boundary}--\r\n";
            $GLOBALS['_request_headers'] .= "Content-Type: multipart/form-data; boundary={$_data_boundary}\r\n";
            $GLOBALS['_request_headers'] .= "Content-Length: " . strlen($GLOBALS['_post_body']) . "\r\n\r\n";
            $GLOBALS['_request_headers'] .= $GLOBALS['_post_body'];
        }
        else
        {
            $array = set_post_vars($_POST);
            
            foreach ($array as $key => $value)
            {
                $GLOBALS['_post_body'] .= !empty($GLOBALS['_post_body']) ? '&' : '';
                $GLOBALS['_post_body'] .= $key . '=' . $value;
            }
            $GLOBALS['_request_headers'] .= "Content-Type: application/x-www-form-urlencoded\r\n";
            $GLOBALS['_request_headers'] .= "Content-Length: " . strlen($GLOBALS['_post_body']) . "\r\n\r\n";
            $GLOBALS['_request_headers'] .= $GLOBALS['_post_body'];
            $GLOBALS['_request_headers'] .= "\r\n";
        }
        
        $GLOBALS['_post_body'] = '';
    }
    else
    {
        $GLOBALS['_request_headers'] .= "\r\n";
    }

    fwrite($GLOBALS['_socket'], $GLOBALS['_request_headers']);
    
    //
    // PROCESS RESPONSE HEADERS
    //
    
    $GLOBALS['_response_headers'] = $GLOBALS['_response_keys'] = array();
    
    $line = fgets($GLOBALS['_socket'], 8192);
    
    while (strspn($line, "\r\n") !== strlen($line))
    {
        @list($name, $value) = explode(':', $line, 2);
        $name = trim($name);
        $GLOBALS['_response_headers'][strtolower($name)][] = trim($value);
        $GLOBALS['_response_keys'][strtolower($name)] = $name;
        $line = fgets($GLOBALS['_socket'], 8192);
    }
    
    sscanf(current($GLOBALS['_response_keys']), '%s %s', $GLOBALS['_http_version'], $GLOBALS['_response_code']);
    
    if (isset($GLOBALS['_response_headers']['content-type']))
    {
        list($GLOBALS['_content_type'], ) = explode(';', str_replace(' ', '', strtolower($GLOBALS['_response_headers']['content-type'][0])), 2);
    }
    if (isset($GLOBALS['_response_headers']['content-length']))
    {
        $GLOBALS['_content_length'] = $GLOBALS['_response_headers']['content-length'][0];
        unset($GLOBALS['_response_headers']['content-length'], $GLOBALS['_response_keys']['content-length']);
    }
    if (isset($GLOBALS['_response_headers']['content-disposition']))
    {
        $GLOBALS['_content_disp'] = $GLOBALS['_response_headers']['content-disposition'][0];
        unset($GLOBALS['_response_headers']['content-disposition'], $GLOBALS['_response_keys']['content-disposition']);
    }
    if (isset($GLOBALS['_response_headers']['set-cookie']) && $GLOBALS['_flags']['accept_cookies'])
    {
        foreach ($GLOBALS['_response_headers']['set-cookie'] as $cookie)
        {
            $name = $value = $expires = $path = $domain = $secure = $expires_time = '';

            preg_match('#^\s*([^=;,\s]*)\s*=?\s*([^;]*)#',  $cookie, $match) && list(, $name, $value) = $match;
            preg_match('#;\s*expires\s*=\s*([^;]*)#i',      $cookie, $match) && list(, $expires)      = $match;
            preg_match('#;\s*path\s*=\s*([^;,\s]*)#i',      $cookie, $match) && list(, $path)         = $match;
            preg_match('#;\s*domain\s*=\s*([^;,\s]*)#i',    $cookie, $match) && list(, $domain)       = $match;
            preg_match('#;\s*(secure\b)#i',                 $cookie, $match) && list(, $secure)       = $match;
    
            $expires_time = empty($expires) ? 0 : intval(@strtotime($expires));
            $expires = ($GLOBALS['_flags']['session_cookies'] && !empty($expires) && time()-$expires_time < 0) ? '' : $expires;
            $path    = empty($path)   ? '/' : $path;
                
            if (empty($domain))
            {
                $domain = $GLOBALS['_url_parts']['host'];
            }
            else
            {
                $domain = '.' . strtolower(str_replace('..', '.', trim($domain, '.')));
    
                if ((!preg_match('#\Q' . $domain . '\E$#i', $GLOBALS['_url_parts']['host']) && $domain != '.' . $GLOBALS['_url_parts']['host']) || (substr_count($domain, '.') < 2 && $domain{0} == '.'))
                {
                    continue;
                }
            }
            if (count($_COOKIE) >= 15 && time()-$expires_time <= 0)
            {
                $GLOBALS['_set_cookie'][] = add_cookie(current($_COOKIE), '', 1);
            }
            
            $GLOBALS['_set_cookie'][] = add_cookie("COOKIE;$name;$path;$domain", "$value;$secure", $expires_time);
        }
    }
    if (isset($GLOBALS['_response_headers']['set-cookie']))
    {
        unset($GLOBALS['_response_headers']['set-cookie'], $GLOBALS['_response_keys']['set-cookie']);
    }
    if (!empty($GLOBALS['_set_cookie']))
    {
        $GLOBALS['_response_keys']['set-cookie'] = 'Set-Cookie';
        $GLOBALS['_response_headers']['set-cookie'] = $GLOBALS['_set_cookie'];
    }
    if (isset($GLOBALS['_response_headers']['p3p']) && preg_match('#policyref\s*=\s*[\'"]?([^\'"\s]*)[\'"]?#i', $GLOBALS['_response_headers']['p3p'][0], $matches))
    {
        $GLOBALS['_response_headers']['p3p'][0] = str_replace($matches[0], 'policyref="' . complete_url($matches[1]) . '"', $GLOBALS['_response_headers']['p3p'][0]);
    }
    if (isset($GLOBALS['_response_headers']['refresh']) && preg_match('#([0-9\s]*;\s*URL\s*=)\s*(\S*)#i', $GLOBALS['_response_headers']['refresh'][0], $matches))
    {
        $GLOBALS['_response_headers']['refresh'][0] = $matches[1] . complete_url($matches[2]);
    }
    if (isset($GLOBALS['_response_headers']['location']))
    {
        $GLOBALS['_response_headers']['location'][0] = complete_url($GLOBALS['_response_headers']['location'][0]);
    }
    if (isset($GLOBALS['_response_headers']['uri']))
    {
        $GLOBALS['_response_headers']['uri'][0] = complete_url($GLOBALS['_response_headers']['uri'][0]);
    }
    if (isset($GLOBALS['_response_headers']['content-location']))
    {
        $GLOBALS['_response_headers']['content-location'][0] = complete_url($GLOBALS['_response_headers']['content-location'][0]);
    }
    if (isset($GLOBALS['_response_headers']['connection']))
    {
        unset($GLOBALS['_response_headers']['connection'], $GLOBALS['_response_keys']['connection']);
    }
    if (isset($GLOBALS['_response_headers']['keep-alive']))
    {
        unset($GLOBALS['_response_headers']['keep-alive'], $GLOBALS['_response_keys']['keep-alive']);
    }
    if ($GLOBALS['_response_code'] == 401 && isset($GLOBALS['_response_headers']['www-authenticate']) && preg_match('#basic\s+(?:realm="(.*?)")?#i', $GLOBALS['_response_headers']['www-authenticate'][0], $matches))
    {
        if (isset($GLOBALS['_auth_creds'][$matches[1]]) && !$GLOBALS['_quit'])
        {
            $GLOBALS['_basic_auth_realm']  = $matches[1];
            $GLOBALS['_basic_auth_header'] = '';
            $GLOBALS['_retry'] = $GLOBALS['_quit'] = true;
        }
        else
        {
            show_report(array('which' => 'index', 'category' => 'auth', 'realm' => $matches[1]));
        }
    }
}
while ($GLOBALS['_retry']);

//
// OUTPUT RESPONSE IF NO PROXIFICATION IS NEEDED
//

if (!isset($GLOBALS['_proxify'][$GLOBALS['_content_type']]))
{
    @set_time_limit(0);
   
    $GLOBALS['_response_keys']['content-disposition'] = 'Content-Disposition';
    $GLOBALS['_response_headers']['content-disposition'][0] = empty($GLOBALS['_content_disp']) ? ($GLOBALS['_content_type'] == 'application/octet_stream' ? 'attachment' : 'inline') . '; filename="' . $GLOBALS['_url_parts']['file'] . '"' : $GLOBALS['_content_disp'];
    
    if ($GLOBALS['_content_length'] !== false)
    {
        if ($GLOBALS['_config']['max_file_size'] != -1 && $GLOBALS['_content_length'] > $GLOBALS['_config']['max_file_size'])
        {
            show_report(array('which' => 'index', 'category' => 'error', 'group' => 'resource', 'type' => 'file_size'));
        }
        
        $GLOBALS['_response_keys']['content-length'] = 'Content-Length';
        $GLOBALS['_response_headers']['content-length'][0] = $GLOBALS['_content_length'];
    }
    
    $GLOBALS['_response_headers']   = array_filter($GLOBALS['_response_headers']);
    $GLOBALS['_response_keys']      = array_filter($GLOBALS['_response_keys']);
    
	if (substr(implode('', $GLOBALS['_response_headers']['content-type']), 0, 5) == 'appli') { // oneye
		$path = um('getCurrentUserDir') . '/' . TMP_USER_DIR . '/';
		if (!vfs('isdir', array($path))) {
			vfs('mkDir', array($path));
		}
		vfs('create', array($path . $checknum . '.tmp'));
		$handler = vfs('open', array($path . $checknum . '.tmp', 'w'));
		$GLOBALS['_response_headers']['content-type'][0] = 'text/html';
		$GLOBALS['_response_headers']['charset'][0] = 'utf-8';
	}
    header(array_shift($GLOBALS['_response_keys']));
    array_shift($GLOBALS['_response_headers']);
    
    foreach ($GLOBALS['_response_headers'] as $name => $array)
    {
        foreach ($array as $value)
        {
            header($GLOBALS['_response_keys'][$name] . ': ' . $value, false);
        }
    }
        
    do
    {
        $data = fread($GLOBALS['_socket'], 8192);
		if (isset($handler)) { // oneye
			fwrite($handler, $data);
		} else {
			echo $data;
		}
    }
    while (isset($data{0}));
        
    fclose($GLOBALS['_socket']);
	if (isset($handler)) { // oneye
		fclose($handler);
		echo '<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
	</head>
	<body onload=\'window.parent.sendMsg(' . $checknum . ',"Download","&lt;basename&gt;' . basename($GLOBALS['_url']) . '&lt;/basename&gt;"); history.back();\' style="font-family: Verdana,Arial,sans-serif,FreeSans; font-size: 14px; margin: 0;"></body>
		<div style="margin-top: -7px; position: absolute; text-align: center; top: 50%; width: 100%;">
			<a href="' . complete_url($GLOBALS['eyeNav_url']->text) . '">&nbsp;' . htmlspecialchars(i18n('translate', array('Back')), ENT_NOQUOTES, 'UTF-8') . '&nbsp;</a>
		</div>
	</body>
</html>';
	}
    exit(0);
}

do
{
    $data = @fread($GLOBALS['_socket'], 8192); // silenced to avoid the "normal" warning by a faulty SSL connection
    $GLOBALS['_response_body'] .= $data;
}
while (isset($data{0}));
   
unset($data);
fclose($GLOBALS['_socket']);

//
// MODIFY AND DUMP RESOURCE
//

if ($GLOBALS['_content_type'] == 'text/css')
{
    $GLOBALS['_response_body'] = proxify_css($GLOBALS['_response_body']);
}
else
{
    if ($GLOBALS['_flags']['strip_title'])
    {
        $GLOBALS['_response_body'] = preg_replace('#(<\s*title[^>]*>)(.*?)(<\s*/title[^>]*>)#is', '$1$3', $GLOBALS['_response_body']);
    }
    if ($GLOBALS['_flags']['remove_scripts'])
    {
        $GLOBALS['_response_body'] = preg_replace('#<\s*script[^>]*?>.*?<\s*/\s*script\s*>#si', '', $GLOBALS['_response_body']);
        $GLOBALS['_response_body'] = preg_replace("#(\bon[a-z]+)\s*=\s*(?:\"([^\"]*)\"?|'([^']*)'?|([^'\"\s>]*))?#i", '', $GLOBALS['_response_body']);
        $GLOBALS['_response_body'] = preg_replace('#<noscript>(.*?)</noscript>#si', "$1", $GLOBALS['_response_body']);
    }
    if (!$GLOBALS['_flags']['show_images'])
    {
        $GLOBALS['_response_body'] = preg_replace('#<(img|image)[^>]*?>#si', '', $GLOBALS['_response_body']);
    }
    
    //
    // PROXIFY HTML RESOURCE
    //
    
    $tags = array
    (
        'a'          => array('href'),
        'img'        => array('src', 'longdesc'),
        'image'      => array('src', 'longdesc'),
        'body'       => array('background', 'onload'),
        'base'       => array('href'),
        'frame'      => array('src', 'longdesc'),
        'iframe'     => array('src', 'longdesc'),
        'head'       => array('profile'),
        'layer'      => array('src'),
        'input'      => array('src', 'usemap'),
        'form'       => array('action'),
        'area'       => array('href'),
        'link'       => array('href', 'src', 'urn'),
        'meta'       => array('content'),
        'param'      => array('value'),
        'applet'     => array('codebase', 'code', 'object', 'archive'),
        'object'     => array('usermap', 'codebase', 'classid', 'archive', 'data'),
        'script'     => array('src'),
        'select'     => array('src'),
        'hr'         => array('src'),
        'table'      => array('background'),
        'tr'         => array('background'),
        'th'         => array('background'),
        'td'         => array('background'),
        'bgsound'    => array('src'),
        'blockquote' => array('cite'),
        'del'        => array('cite'),
        'embed'      => array('src'),
        'fig'        => array('src', 'imagemap'),
        'ilayer'     => array('src'),
        'ins'        => array('cite'),
        'note'       => array('src'),
        'overlay'    => array('src', 'imagemap'),
        'q'          => array('cite'),
        'ul'         => array('src')
    );

    preg_match_all('#(<\s*style[^>]*>)(.*?)(<\s*/\s*style[^>]*>)#is', $GLOBALS['_response_body'], $matches, PREG_SET_ORDER);

    for ($i = 0, $count_i = count($matches); $i < $count_i; ++$i)
    {
        $GLOBALS['_response_body'] = str_replace($matches[$i][0], $matches[$i][1]. proxify_css($matches[$i][2]) .$matches[$i][3], $GLOBALS['_response_body']);
    }

    preg_match_all("#<\s*([a-zA-Z\?-]+)([^>]+)>#S", $GLOBALS['_response_body'], $matches);

    for ($i = 0, $count_i = count($matches[0]); $i < $count_i; ++$i)
    {
        if (!preg_match_all("#([a-zA-Z\-\/]+)\s*(?:=\s*(?:\"([^\">]*)\"?|'([^'>]*)'?|([^'\"\s]*)))?#S", $matches[2][$i], $m, PREG_SET_ORDER))
        {
            continue;
        }
        
		$body = false; // oneye
        $rebuild    = false;
        $extra_html = $temp = '';
        $attrs      = array();

        for ($j = 0, $count_j = count($m); $j < $count_j; $attrs[strtolower($m[$j][1])] = (isset($m[$j][4]) ? $m[$j][4] : (isset($m[$j][3]) ? $m[$j][3] : (isset($m[$j][2]) ? $m[$j][2] : false))), ++$j);
        
        if (isset($attrs['style']))
        {
            $rebuild = true;
            $attrs['style'] = proxify_inline_css($attrs['style']);
        }
        
        $tag = strtolower($matches[1][$i]);

        if (isset($tags[$tag]))
        {
            switch ($tag)
            {
                case 'a':
                    if (isset($attrs['href']))
                    {
                        $rebuild = true;
                        $attrs['href'] = complete_url($attrs['href']);
                    }
                    break;
                case 'img':
                    if (isset($attrs['src']))
                    {
                        $rebuild = true;
                        $attrs['src'] = complete_url($attrs['src']);
                    }
                    if (isset($attrs['longdesc']))
                    {
                        $rebuild = true;
                        $attrs['longdesc'] = complete_url($attrs['longdesc']);
                    }
                    break;
                case 'form':
                    if (isset($attrs['action']))
                    {
                        $rebuild = true;
                        
                        if (trim($attrs['action']) === '')
                        {
							$attrs['action'] = $GLOBALS['_script_url']; // oneye
							$extra_html.= '<input type="hidden" name="msg" value="doOutput" />'; // oneye
							$extra_html.= '<input type="hidden" name="checknum" value="' . $checknum . '" />'; // oneye
                        }
                        if (!isset($attrs['method']) || strtolower(trim($attrs['method'])) === 'get')
                        {
                            $extra_html = '<input type="hidden" name="' . $GLOBALS['_config']['get_form_name'] . '" value="' . encode_url(complete_url($attrs['action'], false)) . '" />';
							$attrs['action'] = $GLOBALS['_script_url']; // oneye
							$extra_html.= '<input type="hidden" name="msg" value="doOutput" />'; // oneye
							$extra_html.= '<input type="hidden" name="checknum" value="' . $checknum . '" />'; // oneye
                            break;
                        }
                        
                        $attrs['action'] = complete_url($attrs['action']);
                    }
                    break;
                case 'base':
                    if (isset($attrs['href']))
                    {
                        $rebuild = true;
                        url_parse($attrs['href'], $GLOBALS['_base']);
                        $attrs['href'] = complete_url($attrs['href']);
                    }
                    break;
                case 'meta':
                    if ($GLOBALS['_flags']['strip_meta'] && isset($attrs['name']))
                    {
                        $GLOBALS['_response_body'] = str_replace($matches[0][$i], '', $GLOBALS['_response_body']);
                    }
                    if (isset($attrs['http-equiv'], $attrs['content']) && preg_match('#\s*refresh\s*#i', $attrs['http-equiv']))
                    {
                        if (preg_match('#^(\s*[0-9]*\s*;\s*url=)(.*)#i', $attrs['content'], $content))
                        {
                            $rebuild = true;
                            $attrs['content'] =  $content[1] . complete_url(trim($content[2], '"\''));
                        }
                    }
                    break;
                case 'head':
                    if (isset($attrs['profile']))
                    {
                        $rebuild = true;
                        $attrs['profile'] = implode(' ', array_map('complete_url', explode(' ', $attrs['profile'])));
                    }
                    break;
                case 'applet':
                    if (isset($attrs['codebase']))
                    {
                        $rebuild = true;
                        $temp = $GLOBALS['_base'];
                        url_parse(complete_url(rtrim($attrs['codebase'], '/') . '/', false), $GLOBALS['_base']);
                        unset($attrs['codebase']);
                    }
                    if (isset($attrs['code']) && strpos($attrs['code'], '/') !== false)
                    {
                        $rebuild = true;
                        $attrs['code'] = complete_url($attrs['code']);
                    }
                    if (isset($attrs['object']))
                    {
                        $rebuild = true;
                        $attrs['object'] = complete_url($attrs['object']);
                    }
                    if (isset($attrs['archive']))
                    {
                        $rebuild = true;
                        $attrs['archive'] = implode(',', array_map('complete_url', preg_split('#\s*,\s*#', $attrs['archive'])));
                    }
                    if (!empty($temp))
                    {
                        $GLOBALS['_base'] = $temp;
                    }
                    break;
                case 'object':
                    if (isset($attrs['usemap']))
                    {
                        $rebuild = true;
                        $attrs['usemap'] = complete_url($attrs['usemap']);
                    }
                    if (isset($attrs['codebase']))
                    {
                        $rebuild = true;
                        $temp = $GLOBALS['_base'];
                        url_parse(complete_url(rtrim($attrs['codebase'], '/') . '/', false), $GLOBALS['_base']);
                        unset($attrs['codebase']);
                    }
                    if (isset($attrs['data']))
                    {
                        $rebuild = true;
                        $attrs['data'] = complete_url($attrs['data']);
                    }
                    if (isset($attrs['classid']) && !preg_match('#^clsid:#i', $attrs['classid']))
                    {
                        $rebuild = true;
                        $attrs['classid'] = complete_url($attrs['classid']);
                    }
                    if (isset($attrs['archive']))
                    {
                        $rebuild = true;
                        $attrs['archive'] = implode(' ', array_map('complete_url', explode(' ', $attrs['archive'])));
                    }
                    if (!empty($temp))
                    {
                        $GLOBALS['_base'] = $temp;
                    }
                    break;
                case 'param':
                    if (isset($attrs['valuetype'], $attrs['value']) && strtolower($attrs['valuetype']) == 'ref' && preg_match('#^[\w.+-]+://#', $attrs['value']))
                    {
                        $rebuild = true;
                        $attrs['value'] = complete_url($attrs['value']);
                    }
                    break;
                case 'frame':
                case 'iframe':
                    if (isset($attrs['src']))
                    {
                        $rebuild = true;
                        $attrs['src'] = complete_url($attrs['src']) . '&nf=1';
                    }
                    if (isset($attrs['longdesc']))
                    {
                        $rebuild = true;
                        $attrs['longdesc'] = complete_url($attrs['longdesc']);
                    }
                    break;
                default:
                    foreach ($tags[$tag] as $attr)
                    {
                        if (isset($attrs[$attr]))
                        {
                            $rebuild = true;
                            $attrs[$attr] = complete_url($attrs[$attr]);
                        }
                    }
                    break;
            }
			if ($tag == 'body') { // oneye
				$body = true;
				$rebuild = true;
				$delim = strpos($value, '"') && !strpos($value, "'") ? '"' : "'";
				$attrs['onload'] = 'window.parent.sendMsg(' . $checknum . ', ' . $delim . 'SetAddress' . $delim . ', ' . $delim . '&lt;address&gt;' . base64_encode($GLOBALS['_url']) . '&lt;/address&gt;' . $delim . '); ' . $attrs['onload'];
			}
        }
    
        if ($rebuild)
        {
            $new_tag = "<$tag";
            foreach ($attrs as $name => $value)
            {
                $delim = strpos($value, '"') && !strpos($value, "'") ? "'" : '"';
                $new_tag .= ' ' . $name . ($value !== false ? '=' . $delim . str_replace('&', '&amp;', $value) . $delim : ''); // oneye
            }

            $GLOBALS['_response_body'] = str_replace($matches[0][$i], $new_tag . '>' . $extra_html, $GLOBALS['_response_body']);
        }
    }
	$GLOBALS['_response_body'] = str_replace('<body>', '<body onload=\'window.parent.sendMsg(' . $checknum . ', "SetAddress", "&lt;address&gt;' . base64_encode($GLOBALS['_url']) . '&lt;/address&gt;");\'>', $GLOBALS['_response_body']); // oneye
    
    if ($GLOBALS['_flags']['include_form'] && !isset($_GET['nf']))
    {
        $GLOBALS['_url_form']      = '<div style="width:100%;margin:0;text-align:center;border-bottom:1px solid #725554;color:#000000;background-color:#F2FDF3;font-size:12px;font-weight:bold;font-family:Bitstream Vera Sans,arial,sans-serif;padding:4px;">'
                        . '<form method="post" action="' . $GLOBALS['_script_url'] . '">'
                        . ' <label for="____' . $GLOBALS['_config']['url_var_name'] . '"><a href="' . $GLOBALS['_url'] . '">Address</a>:</label> <input id="____' . $GLOBALS['_config']['url_var_name'] . '" type="text" size="80" name="' . $GLOBALS['_config']['url_var_name'] . '" value="' . $GLOBALS['_url'] . '" />'
                        . ' <input type="submit" name="go" value="Go" />'
                        . ' [go: <a href="' . $GLOBALS['_script_url'] . '&amp;' . $GLOBALS['_config']['url_var_name'] . '=' . encode_url($GLOBALS['_url_parts']['prev_dir']) .' ">up one dir</a>, <a href="' . $GLOBALS['_script_base'] . '">main page</a>]'
                        . '<br /><hr />';

        foreach ($GLOBALS['_flags'] as $flag_name => $flag_value)
        {
            if (!$GLOBALS['_frozen_flags'][$flag_name])
            {
                $GLOBALS['_url_form'] .= '<label><input type="checkbox" name="' . $GLOBALS['_config']['flags_var_name'] . '[' . $flag_name . ']"' . ($flag_value ? ' checked="checked"' : '') . ' /> ' . $GLOBALS['_labels'][$flag_name][0] . '</label> ';
            }
        }

        $GLOBALS['_url_form'] .= '</form></div>';
        $GLOBALS['_response_body'] = preg_replace('#\<\s*body(.*?)\>#si', "$0\n" . $GLOBALS['_url_form'] , $GLOBALS['_response_body'], 1);
    }
}

$GLOBALS['_response_keys']['content-disposition'] = 'Content-Disposition';
$GLOBALS['_response_headers']['content-disposition'][0] = empty($GLOBALS['_content_disp']) ? ($GLOBALS['_content_type'] == 'application/octet_stream' ? 'attachment' : 'inline') . '; filename="' . $GLOBALS['_url_parts']['file'] . '"' : $GLOBALS['_content_disp'];
$GLOBALS['_response_keys']['content-length'] = 'Content-Length';
$GLOBALS['_response_headers']['content-length'][0] = strlen($GLOBALS['_response_body']);
$GLOBALS['_response_headers']   = array_filter($GLOBALS['_response_headers']);
$GLOBALS['_response_keys']      = array_filter($GLOBALS['_response_keys']);

header(array_shift($GLOBALS['_response_keys']));
array_shift($GLOBALS['_response_headers']);

foreach ($GLOBALS['_response_headers'] as $name => $array)
{
    foreach ($array as $value)
    {
        header($GLOBALS['_response_keys'][$name] . ': ' . $value, false);
    }
}

echo $GLOBALS['_response_body'];
?>