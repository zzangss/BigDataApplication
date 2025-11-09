<?php
if (session_status() === PHP_SESSION_NONE) session_start();

$age     = $_POST['age'] ?? null;
$weather = $_POST['weather'] ?? null;

if (!$age || !$weather) { die('선택값이 없습니다.'); }

$_SESSION['filters'] = [
  'age' => $age,
  'weather' => $weather
];

// 한 곳으로 모아서 렌더하거나, 바로 page1.php로 보내도 됨
header('Location: analysis_result.php');

exit;
