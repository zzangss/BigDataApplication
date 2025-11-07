<!-- <?php
include 'db.php';

// 1. 폼에서 데이터 받기
$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];
$birth_year = $_POST['birth_year']; // 출생연도
$gender = $_POST['gender'];

// 2. 비밀번호 암호화
$hashed_pw = password_hash($password, PASSWORD_DEFAULT);

// 3. 트랜잭션 시작 (두 개의 테이블에 나눠서 저장해야 하므로)
$conn->begin_transaction();

try {
    // 4. [첫 번째] Users 테이블에 삽입
    $sql_users = "INSERT INTO Users (username, password, email) VALUES (?, ?, ?)";
    $stmt_users = $conn->prepare($sql_users);
    $stmt_users->bind_param("sss", $username, $hashed_pw, $email);
    
    if (!$stmt_users->execute()) {
        // ID(username) 중복 등 에러 처리
        if ($conn->errno == 1062) {
             throw new Exception("이미 사용 중인 ID입니다.");
        }
        throw new Exception("Users 테이블 삽입 실패: " . $stmt_users->error);
    }

    // 5. [중요] 방금 생성된 user_id (숫자) 가져오기
    $new_user_id = $conn->insert_id;

    // 6. [두 번째] UserProfile 테이블에 삽입
    // (스키마에 intro도 있지만, 폼에서 받지 않았으므로 NULL 허용으로 가정)
    $sql_profile = "INSERT INTO UserProfile (user_id, birth_year, gender) VALUES (?, ?, ?)";
    $stmt_profile = $conn->prepare($sql_profile);
    $stmt_profile->bind_param("iss", $new_user_id, $birth_year, $gender); // 'i'는 int(숫자)
    
    if (!$stmt_profile->execute()) {
        throw new Exception("UserProfile 테이블 삽입 실패: " . $stmt_profile->error);
    }

    // 7. 모든 작업이 성공했으면 DB에 확정 (Commit)
    $conn->commit();
    echo "<script>alert('회원가입 성공! 로그인해주세요.'); location.href='index.php';</script>";

} catch (Exception $e) {
    // 8. 하나라도 실패하면 모든 작업을 되돌림 (Rollback)
    $conn->rollback();
    echo "<script>alert('회원가입 실패: " . addslashes($e->getMessage()) . "'); history.back();</script>";
}

$stmt_users->close();
$stmt_profile->close();
$conn->close();
?> -->