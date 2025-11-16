<?php
// 1. DB 연결
require_once __DIR__ . '/db.php';

// 2. 폼 데이터 받기
$username   = $_POST['username'] ?? '';
$password   = $_POST['password'] ?? '';
$email      = $_POST['email'] ?? '';
$birth_year = $_POST['birth_year'] ?? '';
$gender     = $_POST['gender'] ?? ''; // '여' 또는 '남'

// 3. 유효성 검사 (DB 스키마 기준)
if (empty($username) || empty($password) || empty($email)) {
    // 폼에 required가 없더라도 DB에 NOT NULL이므로 필수 검사
    header('Location: signup.php?error=아이디, 비밀번호, 이메일은 필수입니다.');
    exit();
}
// (이하 생략... 이전 코드의 유효성 검사와 동일)
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) { /* ... */ }
if (strlen($password) < 6) { /* ... */ }

// 4. DB에 저장할 데이터 가공
$hashed_password = password_hash($password, PASSWORD_DEFAULT);
$birth_year_to_db = empty($birth_year) ? NULL : (int)$birth_year;
$gender_to_db = empty($gender) ? NULL : $gender; // (폼에 기본값이 '여'로 체크되어 있지만, 만약을 대비)


// 5. [요구사항 7] 트랜잭션 시작 (두 테이블에 동시 삽입)
$conn->begin_transaction();

try {
    // 6. [첫 번째 INSERT] Users 테이블에 기본 정보 삽입
    $sql_users = "INSERT INTO Users (username, password, email) VALUES (?, ?, ?)";
    $stmt_users = $conn->prepare($sql_users);
    $stmt_users->bind_param("sss", $username, $hashed_password, $email);
    $stmt_users->execute();

    // 7. [핵심] 방금 생성된 user_id 가져오기
    $new_user_id = $conn->insert_id;
    if ($new_user_id == 0) {
        throw new Exception("새 사용자 ID를 가져오는 데 실패했습니다.");
    }

    // 8. [두 번째 INSERT] UserProfile 테이블에 상세 정보 삽입
    $sql_profile = "INSERT INTO UserProfile (user_id, birth_year, gender) VALUES (?, ?, ?)";
    $stmt_profile = $conn->prepare($sql_profile);
    $stmt_profile->bind_param("iis", $new_user_id, $birth_year_to_db, $gender_to_db);
    $stmt_profile->execute();

    // 9. [성공] 모든 쿼리 성공 시 트랜잭션 완료 (커밋)
    $conn->commit();
    
    // 회원가입 성공 -> 로그인 페이지로 이동
    header('Location: login.php?success=회원가입이 완료되었습니다. 로그인해주세요.');
    exit();

} catch (mysqli_sql_exception $exception) {
    // 10. [실패] 오류 발생 시 트랜잭션 전체 취소 (롤백)
    $conn->rollback();

    // 오류 코드 1062: UNIQUE 제약조건 위반 (중복)
    if ($exception->getCode() == 1062) {
        if (str_contains($exception->getMessage(), 'username')) {
            header('Location: signup.php?error=이미 사용 중인 아이디입니다.');
        } else if (str_contains($exception->getMessage(), 'email')) {
            header('Location: signup.php?error=이미 사용 중인 이메일입니다.');
        } else {
            header('Location: signup.php?error=중복된 값이 있습니다 (아이디 또는 이메일).');
        }
    } else {
        // 기타 데이터베이스 오류 (예: FOREIGN KEY 제약조건 위반 등)
        // error_log('Signup Error: ' . $exception->getMessage()); // (디버깅용)
        header('Location: signup.php?error=데이터베이스 오류가 발생했습니다. (코드: ' . $exception->getCode() . ')');
    }
    exit();
} catch (Exception $e) {
    // (new_user_id 가져오기 실패 등)
    $conn->rollback();
    // error_log('Signup Logic Error: ' . $e->getMessage()); // (디버깅용)
    header('Location: signup.php?error=회원가입 처리 중 오류가 발생했습니다.');
    exit();
}
?>