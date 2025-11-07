<?php
session_start();
include 'db.php'; // DB 연결

// 1. 폼에서 username과 password 받기 (index.php의 name 속성)
$username_from_form = $_POST['username'];
$password_from_form = $_POST['password']; 

// 2. DB에서 username으로 사용자 찾기 (SQL 인젝션 방지)
$sql = "SELECT * FROM Users WHERE username = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username_from_form);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
    // 3. ID(username)가 존재하면, DB에서 정보 가져오기
    $user = $result->fetch_assoc();
    $hashed_pw_from_db = $user['password']; // DB 스키마의 'password' 컬럼

    // 4. password_verify()로 비번 검증
    if (password_verify($password_from_form, $hashed_pw_from_db)) {
        // 5. 로그인 성공!
        // 세션에 숫자 user_id와 문자 username을 둘 다 저장
        $_SESSION['user_id'] = $user['user_id'];   // (숫자 PK, DB 작업용)
        $_SESSION['username'] = $user['username']; // (문자열, 인사말용)

        // 메인 페이지(index.php)로 이동
        header("Location: index.php");
        exit; // 리다이렉트 후 스크립트 종료
    } else {
        // 6. 비밀번호가 틀림
        echo "<script>alert('로그인 실패: 비밀번호가 틀렸습니다.'); history.back();</script>";
    }

} else {
    // 7. ID(username)가 존재하지 않음
    echo "<script>alert('로그인 실패: 아이디가 존재하지 않습니다.'); history.back();</script>";
}

$stmt->close();
$conn->close();
?>