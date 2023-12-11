<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "versatile";

$connect = mysqli_connect($host, $user, $pass, $db);
# Checking connection status
if (mysqli_connect_error()) {
    echo mysqli_connect_error();
    exit();
}
?>