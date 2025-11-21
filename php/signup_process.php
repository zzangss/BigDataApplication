<?php
// 1. DB 연결
require_once __DIR__ . '/db.php';

// 2. 폼 데이터 받기
$username   = $_POST['username'] ?? '';
$password   = $_POST['password'] ?? '';
$email      = $_POST['email'] ?? '';
$birth_year = $_POST['birth_year'] ?? '';
$gender     = $_POST['gender'] ?? ''; 

// ---- 공통 alert + redirect 함수 ----
function goBack($msg) {
    echo "<script>
            alert('$msg');
            window.location.href = 'signup.php';
          </script>";
    exit();
}

// 3. 유효성 검사
if (empty($username) || empty($password) || empty($email)) {
    goBack("아이디, 비밀번호, 이메일은 필수입니다.");
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    goBack("올바른 이메일 형식이 아닙니다.");
}

if (strlen($password) < 4) {
    goBack("비밀번호는 4자리 이상이어야 합니다.");
}

// 4. DB에 저장할 데이터 가공
$password_to_store = $password;  // 현재 평문 저장 중 (원하면 hash로 변경 가능)

$birth_year_to_db = empty($birth_year) ? NULL : (int)$birth_year;
$gender_to_db     = empty($gender) ? NULL : $gender;

// 5. 트랜잭션 시작
$conn->begin_transaction();

try {
    // 6. Users 삽입
    $sql_users = "INSERT INTO Users (username, password, email) VALUES (?, ?, ?)";
    $stmt_users = $conn->prepare($sql_users);
    $stmt_users->bind_param("sss", $username, $password_to_store, $email);
    $stmt_users->execute();

    // 7. 새 user_id 가져오기
    $new_user_id = $conn->insert_id;
    if ($new_user_id == 0) {
        throw new Exception("새 사용자 ID 생성 실패");
    }

    // 8. UserProfile 삽입
    $sql_profile = "INSERT INTO UserProfile (user_id, birth_year, gender) VALUES (?, ?, ?)";
    $stmt_profile = $conn->prepare($sql_profile);
    $stmt_profile->bind_param("iis", $new_user_id, $birth_year_to_db, $gender_to_db);
    $stmt_profile->execute();

    // 9. commit
    $conn->commit();

    // ---- 성공 메시지도 alert로 표시 ----
    echo "<script>
            alert('회원가입이 완료되었습니다! 로그인해주세요.');
            window.location.href = 'login.php';
          </script>";
    exit();

} catch (mysqli_sql_exception $e) {
    $conn->rollback();

    // 중복키 (username/email)
    if ($e->getCode() == 1062) {
        if (str_contains($e->getMessage(), 'username')) {
            goBack("이미 사용 중인 아이디입니다.");
        } else if (str_contains($e->getMessage(), 'email')) {
            goBack("이미 사용 중인 이메일입니다.");
        } else {
            goBack("중복된 정보가 있습니다.");
        }
    }

    goBack("데이터베이스 오류가 발생했습니다.");

} catch (Exception $e) {
    $conn->rollback();
    goBack("회원가입 처리 중 오류가 발생했습니다.");
}
?>
