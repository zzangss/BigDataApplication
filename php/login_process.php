<?php
// 세션 시작
session_start();

// 1. DB 연결
require_once __DIR__ . '/db.php';

// 2. 폼 데이터 받기
$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

// 3. 기본 유효성 검사
if (empty($username) || empty($password)) {
    echo "<!DOCTYPE html>
    <html>
    <head><meta charset='utf-8'></head>
    <body>
        <script>
            alert('아이디와 비밀번호를 모두 입력해주세요.');
            location.href = 'login.php';
        </script>
    </body>
    </html>";
    exit();
}

try {
    // 4. 사용자 정보 조회
    $sql = "SELECT user_id, username, password FROM Users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();

        // 5. 비밀번호 검증 (평문 비교)
        // (이전에 요청하신 대로 password_verify 대신 === 사용)
        if ($password === $user['password']) {
            
            // 로그인 성공
            session_regenerate_id(true); 
            
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['username'] = $user['username'];

            header('Location: index.php');
            exit();

        } else {
            // 비밀번호 불일치
            echo "<!DOCTYPE html>
            <html>
            <head><meta charset='utf-8'></head>
            <body>
                <script>
                    alert('아이디 또는 비밀번호가 올바르지 않습니다.');
                    location.href = 'login.php';
                </script>
            </body>
            </html>";
            exit();
        }
    } else {
        // 사용자 없음
        echo "<!DOCTYPE html>
        <html>
        <head><meta charset='utf-8'></head>
        <body>
            <script>
                alert('아이디 또는 비밀번호가 올바르지 않습니다.');
                location.href = 'login.php';
            </script>
        </body>
        </html>";
        exit();
    }

} catch (mysqli_sql_exception $exception) {
    echo "<!DOCTYPE html>
    <html>
    <head><meta charset='utf-8'></head>
    <body>
        <script>
            alert('데이터베이스 오류가 발생했습니다.');
            location.href = 'login.php';
        </script>
    </body>
    </html>";
    exit();
}
?>