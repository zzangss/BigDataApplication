<?php
require_once __DIR__ . '/db.php';

$r = $conn->query("SELECT 1 AS ok");
$row = $r->fetch_assoc();
echo ($row['ok'] == 1) ? "DB 연결 OK" : "쿼리 실패";
