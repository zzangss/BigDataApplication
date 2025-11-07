<?php
session_start(); // 1. 세션 시작

// 2. 로그인 여부 확인
if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])) {
    
    // 3. 로그인이 안 되었다면, "로그인 필요" 페이지 보여주고 종료
    // (이 부분은 이전과 동일, "로그인 페이지로 이동" 링크가 index.php를 가리키는지 확인)
    ?>
    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-R">
        <title>오늘 뭐먹지? - 접근 불가</title>
        <style>
            body { font-family: "맑은 고딕", sans-serif; background-color: #fafafa; text-align: center; padding-top: 120px; }
            header { position: fixed; top: 0; left: 0; width: 100%; height: 80px; background-color: white; display: flex; justify-content: space-between; align-items: center; padding: 0 40px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); box-sizing: border-box; }
            .logo { font-size: 24px; font-weight: bold; color: #333; text-decoration: none; }
            .nav-links a { margin-left: 25px; font-size: 16px; color: #555; text-decoration: underline; }
            .nav-links a:hover { color: #000; }
            .nav-links a.active { font-weight: bold; color: #000; }
            .login-required { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 0 10px rgba(0,0,0,0.1); display: inline-block; }
            .login-required h2 { color: #d9534f; }
            .login-required a { display: inline-block; margin-top: 20px; padding: 10px 20px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 8px; font-size: 16px; }
            .login-required a:hover { background-color: #45a049; }
        </style>
    </head>
    <body>
        <header>
            <a href="index.php" class="logo">오늘 뭐먹지?</a>
            <nav class="nav-links">
                <a href="menu.php">메뉴리뷰</a>
                <a href="analysis.php">분석하기</a>
                <a href="mypage.php" class="active">마이페이지</a>
            </nav>
        </header>
        <div class="login-required">
            <h2>로그인이 필요합니다!</h2>
            <p>마이페이지는 로그인 후 이용하실 수 있습니다.</p>
            <a href="index.php">로그인 페이지로 이동</a> 
        </div>
    </body>
    </html>
    <?php
    exit; 
}

// 4. (로그인 됨) DB에서 정보 가져오기
include 'db.php';
$user_id = $_SESSION['user_id']; // 세션에 저장된 숫자 user_id

// [수정] JOIN 쿼리로 Users와 UserProfile의 정보를 한 번에 가져옴
$sql = "SELECT U.username, U.email, P.birth_year, P.gender
        FROM Users U
        LEFT JOIN UserProfile P ON U.user_id = P.user_id
        WHERE U.user_id = ?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id); // 'i' = integer (숫자)
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

if (!$user) {
    echo "사용자 정보를 불러오는 데 실패했습니다.";
    exit;
}
?>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘 뭐먹지? - 마이페이지</title>
    <style>
        body { font-family: "맑은 고딕", sans-serif; background-color: #fafafa; text-align: center; padding-top: 120px; padding-bottom: 40px; }
        header { position: fixed; top: 0; left: 0; width: 100%; height: 80px; background-color: white; display: flex; justify-content: space-between; align-items: center; padding: 0 40px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); box-sizing: border-box; }
        .logo { font-size: 24px; font-weight: bold; color: #333; text-decoration: none; }
        .nav-links a { margin-left: 25px; font-size: 16px; color: #555; text-decoration: underline; }
        .nav-links a:hover { color: #000; }
        .nav-links a.active { font-weight: bold; color: #000; }
        .nav-links a.logout-btn { color: #d9534f; } 
        h2 { color: #333; }
        form { display: inline-block; background: white; padding: 30px; border-radius: 12px; box-shadow: 0 0 10px rgba(0,0,0,0.1); text-align: left; }
        form div { margin-bottom: 15px; display: flex; align-items: center; }
        form label { width: 100px; font-weight: bold; }
        form input, form span { padding: 8px; font-size: 15px; width: 200px; }
        form input { border: 1px solid #ccc; border-radius: 5px; }
        form button { display: block; width: 100%; margin-top: 20px; padding: 10px; font-size: 16px; background-color: #4CAF50; color: white; border: none; border-radius: 8px; cursor: pointer; }
        form button:hover { background-color: #45a049; }
    </style>
</head>
<body>
    <header>
        <a href="main.php" class="logo">오늘 뭐먹지?</a> <nav class="nav-links">
            <a href="menu.php">메뉴리뷰</a>
            <a href="analysis.php">분석하기</a>
            <a href="mypage.php" class="active">마이페이지</a> 
            <a href="logout.php" class="logout-btn">로그아웃</a>
        </nav>
    </header>

    <h2>마이페이지</h2>
    
    <form method="post" action="mypage_update.php">
        <div>
            <label>아이디</label>
            <span><?php echo htmlspecialchars($user['username']); ?></span>
        </div>
        <div>
            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="password" placeholder="새 비밀번호 (선택)">
        </div>
        <div>
            <label for="birth_year">출생연도</label>
            <input type="number" id="birth_year" name="birth_year" value="<?php echo htmlspecialchars($user['birth_year']); ?>">
        </div>
        <div>
            <label for="gender">성별</label>
            <input type="text" id="gender" name="gender" value="<?php echo htmlspecialchars($user['gender']); ?>">
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($user['email']); ?>">
        </div>
        <button type="submit">수정하기</button>
    </form>
</body>
</html>