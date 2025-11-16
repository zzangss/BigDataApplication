<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT); // 디버깅용(완료되면 지워도 됨)

$DB_HOST = '127.0.0.1';   // 또는 'localhost'
$DB_PORT = 3307;          // MAMP MySQL 기본 포트
$DB_NAME = 'team13';      // phpMyAdmin에서 만든 DB 이름
$DB_USER = 'team13';      // 만든 사용자
$DB_PASSWORD = 'team13';  // 그 비밀번호

$conn = new mysqli($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_NAME, $DB_PORT);
$conn->set_charset('utf8mb4');
?>