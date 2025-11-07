<!-- <?php
$DB_HOST = "localhost";
$DB_NAME = "team13";
$DB_USER = "team13";
$DB_PASSWORD = "team13";

$conn = new mysqli($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_NAME);
if ($conn->connect_error) die("DB 연결 실패: " . $conn->connect_error);
?> -->


<?php
$DB_HOST = "localhost";
$DB_NAME = "";
$DB_USER = "";
$DB_PASSWORD = "";

$conn = new mysqli($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_NAME);
if ($conn->connect_error) die("DB 연결 실패: " . $conn->connect_error);
?>