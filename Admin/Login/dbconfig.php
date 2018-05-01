<?php
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "login";

$dbcon = new PDO("mysql:host=$dbhost; dbname=$dbname",$dbuser,$dbpass);

$dbcon->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

echo "connection Successful";

?>