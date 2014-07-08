<?php
/*
get:
    place=
        contact:
        user:
        group:
        default:
            href(contact,user,group)
    page=({val},0)
    search
        contact:
        user:
        group:
        default`:
            search user and group
post(admin in auth(group)):
    place=
        user: add user
        group: add group
put(admin in auth(group)):
    place=
        user: update user
    group=
        update: group
*/

if (!isset($_SERVER['PHP_AUTH_USER'])) {
    header('WWW-Authenticate: Basic realm="My Realm"');
    header('HTTP/1.0 401 Unauthorized');
    exit;
}

echo $_SERVER['REQUEST_METHOD'] . "\r\n<br />";
echo $_SERVER['QUERY_STRING'] . "\r\n<br />";
echo $_SERVER['REQUEST_URI'] . "\r\n<br />";
echo $_SERVER['PHP_AUTH_USER'] . "\r\n<br />";
echo $_SERVER['PHP_AUTH_PW'] . "\r\n<br />";
?>