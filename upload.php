<?php

define('RAW_IMAGE', false);
define('RAW_IMAGE_LINK', true);
define('IMAGE_EXTENSION', false);

define('TWITTER_CARDS', false);


define('IMAGESERVE_DIR', '');
define('TWITTER_HANDLE', '@PubCc');

define('APP_NAME', 'ReflectiveLoader.exe');
define('PASSKEY', 'zPQ6uinI0usDn3YfiIftLPZYeqT1Tw'); 


$allowedTypes = array('image/png', 'image/jpeg');//,  'image/gif', 'video/webm');

if ( ! isset($_POST['secret']) || $_POST['secret'] !== PASSKEY) {
    die('error,e-401');
}

if ( ! (filesize($_FILES['sharex']['tmp_name']) > 0 && in_array($_FILES['sharex']['type'], $allowedTypes))) {
    die('error,e-415');
}

if ($_FILES['sharex']['error'] > 0) {
    die('error,e-500');
}

$dir = __DIR__ . '/images/';

saveImage($_FILES['sharex']['type'], $_FILES['sharex']['tmp_name']);

function generateNewHash($type)
{
    $an = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    $str = '';

    for ($i = 0; $i < 5; $i++) {
        $str .= substr($an, rand(0, strlen($an) - 1), 1);
    }

    if ( ! file_exists(__DIR__ . "/images/$str.$type")) {
        return $str;
    } else {
        return generateNewHash($type);
    }
}

function saveImage($mimeType, $tempName)
{
    global $dir;

    $mimeTypeArray = explode('/', $mimeType);
    $type = $mimeTypeArray[1];
    $hash = generateNewHash($type);
	

    $dir3 = "https://".$_SERVER['SERVER_NAME']."/";
    if (move_uploaded_file($tempName, $dir . "$hash.$type")) {
        die('' . (RAW_IMAGE_LINK ? $dir3 . "$hash.$type" : ($type == 'png' ? '' : substr($type, 0, 1) . '/') . "$hash" . (IMAGE_EXTENSION ? ".$type" : '')));
    }

    die('error,e-500x');
}
