<?php
// 1. DB 연결
require_once __DIR__ . '/db.php';

// 2. 폼 데이터 받기
$username   = $_POST['username'] ?? '';
$password   = $_POST['password'] ?? '';
$email      = $_POST['email'] ?? '';
$birth_year = $_POST['birth_year'] ?? '';
$gender     = $_POST['gender'] ?? ''; 

// 3. 유효성 검사
if (empty($username) || empty($password) || empty($email)) {
    header('Location: signup.php?error=아이디, 비밀번호, 이메일은 필수입니다.');
    exit();
}
// (나머지 유효성 검사는 유지)
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    header('Location: signup.php?error=올바른 이메일 형식이 아닙니다.');
    exit();
}
if (strlen($password) < 4) { // 비밀번호 길이 제한 (선택 사항)
    header('Location: signup.php?error=비밀번호는 4자리 이상이어야 합니다.');
    exit();
}

// 4. DB에 저장할 데이터 가공
// [!!수정!!] password_hash() 제거 -> 그냥 입력받은 $password 그대로 사용
$password_to_store = $password; 

$birth_year_to_db = empty($birth_year) ? NULL : (int)$birth_year;
$gender_to_db = empty($gender) ? NULL : $gender;

// 5. 트랜잭션 시작
$conn->begin_transaction();

try {
    // 6. Users 테이블 삽입
    $sql_users = "INSERT INTO Users (username, password, email) VALUES (?, ?, ?)";
    $stmt_users = $conn->prepare($sql_users);
    // $password_to_store (평문) 저장
    $stmt_users->bind_param("sss", $username, $password_to_store, $email);
    $stmt_users->execute();

    // 7. user_id 가져오기
    $new_user_id = $conn->insert_id;
    if ($new_user_id == 0) {
        throw new Exception("새 사용자 ID를 가져오는 데 실패했습니다.");
    }

    // 8. UserProfile 테이블 삽입
    $sql_profile = "INSERT INTO UserProfile (user_id, birth_year, gender) VALUES (?, ?, ?)";
    $stmt_profile = $conn->prepare($sql_profile);
    $stmt_profile->bind_param("iis", $new_user_id, $birth_year_to_db, $gender_to_db);
    $stmt_profile->execute();

    // 9. 커밋
    $conn->commit();
    
    header('Location: login.php?success=회원가입이 완료되었습니다. 로그인해주세요.');
    exit();

} catch (mysqli_sql_exception $exception) {
    $conn->rollback();

    if ($exception->getCode() == 1062) {
        if (str_contains($exception->getMessage(), 'username')) {
            header('Location: signup.php?error=이미 사용 중인 아이디입니다.');
        } else if (str_contains($exception->getMessage(), 'email')) {
            header('Location: signup.php?error=이미 사용 중인 이메일입니다.');
        } else {
            header('Location: signup.php?error=중복된 값이 있습니다.');
        }
    } else {
        header('Location: signup.php?error=데이터베이스 오류가 발생했습니다.');
    }
    exit();
} catch (Exception $e) {
    $conn->rollback();
    header('Location: signup.php?error=회원가입 처리 중 오류가 발생했습니다.');
    exit();
}
?>