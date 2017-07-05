<?php

// HTTP
define('HTTP_SERVER', 'http://www.bannersexpo.com/admin/');
define('HTTP_CATALOG', 'http://www.bannersexpo.com/');

// HTTPS
define('HTTPS_SERVER', 'http://www.bannersexpo.com/admin/');
define('HTTPS_CATALOG','http://www.bannersexpo.com/');

// DIR

$filepath = $_SERVER['DOCUMENT_ROOT'] .'/';

define('DIR_APPLICATION', $filepath . 'admin/');
define('DIR_SYSTEM', $filepath . 'system/');
define('DIR_IMAGE', $filepath . 'image/');
define('DIR_LANGUAGE', $filepath. 'admin/language/');
define('DIR_TEMPLATE', $filepath. 'admin/view/template/');
define('DIR_CONFIG', $filepath . 'system/config/');
define('DIR_CACHE', $filepath . 'system/storage/cache/');
define('DIR_DOWNLOAD', $filepath . 'system/storage/download/');
define('DIR_LOGS', $filepath . 'system/storage/logs/');
define('DIR_MODIFICATION', $filepath. 'system/storage/modification/');
define('DIR_UPLOAD', $filepath . 'system/storage/upload/');
define('DIR_CATALOG', $filepath . 'catalog/');

define('DIR_TECHSPEC', $filepath. 'techspecification/');
// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'bannersexpo.com');
define('DB_USERNAME', 'signsny_expofres');
define('DB_PASSWORD', 'cFVl=hAgQh!v');
define('DB_DATABASE', 'signsny_expofresh');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');
