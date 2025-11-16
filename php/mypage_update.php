<?php
// 1. 세션 시작 및 로그인 검사
require_once __DIR__ . '/auth_check.php';
// $current_user_id 사용 가능

// 2. DB 연결
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

// (빈 값은 DB에 NULL로 저장되도록 처리)
$birth_year_to_db = empty($birth_year) ? NULL : (int)$birth_year;
$gender_to_db = empty($gender) ? NULL : $gender;


// 5. [요구사항 7] 트랜잭션 시작 (두 테이블 업데이트)
$conn->begin_transaction();

try {
    // 6. [첫 번째 UPDATE] Users 테이블 (email, password)
    //    (비밀번호는 입력된 경우에만 업데이트)
    
    if (!empty($password)) {
        // 비밀번호가 입력됨 -> 비밀번호도 업데이트
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        $sql_users = "UPDATE Users SET email = ?, password = ? WHERE user_id = ?";
        $stmt_users = $conn->prepare($sql_users);
        $stmt_users->bind_param("ssi", $email, $hashed_password, $current_user_id);
    } else {
        // 비밀번호가 비어있음 -> 이메일만 업데이트
        $sql_users = "UPDATE Users SET email = ? WHERE user_id = ?";
        $stmt_users = $conn->prepare($sql_users);
        $stmt_users->bind_param("si", $email, $current_user_id);
    }
    $stmt_users->execute();

    // 7. [두 번째 UPDATE] UserProfile 테이블 (birth_year, gender)
    $sql_profile = "UPDATE UserProfile SET birth_year = ?, gender = ? WHERE user_id = ?";
    $stmt_profile = $conn->prepare($sql_profile);
    $stmt_profile->bind_param("isi", $birth_year_to_db, $gender_to_db, $current_user_id);
    $stmt_profile->execute();

    // 8. [성공] 트랜잭션 완료 (커밋)
    $conn->commit();
    
    header('Location: mypage.php?update_success=회원 정보가 성공적으로 수정되었습니다.');
    exit();

} catch (mysqli_sql_exception $exception) {
    // 9. [실패] 롤백
    $conn->rollback();

    if ($exception->getCode() == 1062) { // 중복 (이메일)
        header('Location: mypage.php?update_error=이미 사용 중인 이메일입니다.');
    } else {
        header('Location: mypage.php?update_error=DB 오류로 수정에 실패했습니다. (코드: ' . $exception->getCode() . ')');
    }
    exit();
}
?>