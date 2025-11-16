<?php
// [!!] 500 오류 추적을 위해 맨 위에 추가 [!!]
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// [요구사항 6] 세션 사용
// (session_start()는 다른 세션 변수를 사용하기 전에 항상 먼저 호출되어야 합니다.)
session_start();

// 1. 로그인 상태 확인
// (세션에 user_id가 없거나 비어있으면)
if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])) {
    
    // 2. 로그인이 안 되어있다면 로그인 페이지로 튕겨내기
    // (어떤 페이지에서 튕겨났는지 error 메시지를 보냄)
    header('Location: login.php?error=로그인이 필요합니다.');
    exit();
}

// 3. 로그인이 되어있다면, 세션 변수를 현재 변수로 저장
// (이 파일을 require한 페이지에서 $current_user_id 변수를 바로 쓸 수 있게 함)
$current_user_id = $_SESSION['user_id'];
$current_username = $_SESSION['username'];
?>