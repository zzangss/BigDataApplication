<?php
// [요구사항 6] 세션을 사용하기 위해 맨 위에 호출
session_start();

// 1. DB 연결 (DB 정보 불러오기!)
require_once __DIR__ . '/db.php';

// 2. 폼 데이터 받기
$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

// 3. 기본 유효성 검사
if (empty($username) || empty($password)) {
    // login.php에 ?error=... 파라미터를 보냅니다.
    header('Location: login.php?error=아이디와 비밀번호를 입력해주세요.');
    exit();
}

try {
    // 4. [DB 정보 불러오기] Users 테이블에서 사용자 정보 조회
    // (SQL Injection 방지를 위해 Prepared Statement 사용)
    $sql = "SELECT user_id, username, password FROM Users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        // 5. 사용자가 존재하면, DB의 비밀번호와 입력된 비밀번호 비교
        $user = $result->fetch_assoc();

        // password_verify() 함수가 해시된 비밀번호와 일반 비밀번호를 안전하게 비교
        if (password_verify($password, $user['password'])) {
            
            // 6. [요구사항 6] 로그인 성공! 세션 생성
            
            // (보안 강화: 세션 고정 공격 방지를 위해 세션 ID를 새로 발급)
            session_regenerate_id(true); 
            
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['username'] = $user['username'];

            // 7. 메인 페이지(index.php)로 이동
            header('Location: index.php');
            exit();

        } else {
            // 비밀번호 불일치
            header('Location: login.php?error=아이디 또는 비밀번호가 올바르지 않습니다.');
            exit();
        }
    } else {
        // 사용자 없음
        header('Location: login.php?error=아이디 또는 비밀번호가 올바르지 않습니다.');
        exit();
    }

} catch (mysqli_sql_exception $exception) {
    // (DB 연결 자체에 실패했거나, 쿼리 오류 시)
    // error_log('Login Error: ' . $exception->getMessage()); // (디버깅용)
    header('Location: login.php?error=데이터베이스 오류가 발생했습니다.');
    exit();
}
?>