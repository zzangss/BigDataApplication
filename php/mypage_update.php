<?php
// 1. 세션 시작 및 로그인 검사
require_once __DIR__ . '/auth_check.php';
require_once __DIR__ . '/db.php';

// 3. 폼 데이터 받기
$password   = $_POST['password'] ?? '';
$email      = $_POST['email'] ?? '';
$birth_year = $_POST['birth_year'] ?? '';
$gender     = $_POST['gender'] ?? '';

// 4. 유효성 검사
if (empty($email)) {
    header('Location: mypage.php?update_error=이메일은 필수입니다.');
    exit();
}
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    header('Location: mypage.php?update_error=올바른 이메일 형식이 아닙니다.');
    exit();
}

$birth_year_to_db = empty($birth_year) ? NULL : (int)$birth_year;
$gender_to_db = empty($gender) ? NULL : $gender;

// 5. 트랜잭션 시작
$conn->begin_transaction();

try {
    // 6. Users 테이블 수정
    if (!empty($password)) {
        // [!!수정!!] 비밀번호가 입력된 경우 -> 평문 그대로 저장
        // $hashed_password = password_hash(...) <-- 삭제
        $password_to_store = $password; 

        $sql_users = "UPDATE Users SET email = ?, password = ? WHERE user_id = ?";
        $stmt_users = $conn->prepare($sql_users);
        $stmt_users->bind_param("ssi", $email, $password_to_store, $current_user_id);
    } else {
        // 비밀번호 변경 안 함
        $sql_users = "UPDATE Users SET email = ? WHERE user_id = ?";
        $stmt_users = $conn->prepare($sql_users);
        $stmt_users->bind_param("si", $email, $current_user_id);
    }
    $stmt_users->execute();

    // 7. UserProfile 테이블 수정
    $sql_profile = "UPDATE UserProfile SET birth_year = ?, gender = ? WHERE user_id = ?";
    $stmt_profile = $conn->prepare($sql_profile);
    $stmt_profile->bind_param("isi", $birth_year_to_db, $gender_to_db, $current_user_id);
    $stmt_profile->execute();

    // 8. 커밋
    $conn->commit();
    header('Location: mypage.php?update_success=회원 정보가 성공적으로 수정되었습니다.');
    exit();

} catch (mysqli_sql_exception $exception) {
    $conn->rollback();
    if ($exception->getCode() == 1062) {
        header('Location: mypage.php?update_error=이미 사용 중인 이메일입니다.');
    } else {
        header('Location: mypage.php?update_error=DB 오류: ' . $exception->getMessage());
    }
    exit();
}
?>