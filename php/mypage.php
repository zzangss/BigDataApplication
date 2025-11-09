<?php
session_start(); // 1. 세션 시작

//임시로그인
$_SESSION['user_id'] = 1; // 테스트용 임시 로그인
$_SESSION['username'] = 'testuser';

// 2. 로그인 여부 확인
if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])) {
    
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
            <a href="login.php">로그인 페이지로 이동</a> 
        </div>
    </body>
    </html>
    <?php
    exit; 
}

// // 4. (로그인 됨) DB에서 [사용자 정보] 가져오기
// include 'db.php';
// $user_id = $_SESSION['user_id']; // 세션에 저장된 숫자 user_id

// $sql_user = "SELECT U.username, U.email, P.birth_year, P.gender
//              FROM Users U
//              LEFT JOIN UserProfile P ON U.user_id = P.user_id
//              WHERE U.user_id = ?";

// $stmt_user = $conn->prepare($sql_user);
// $stmt_user->bind_param("i", $user_id);
// $stmt_user->execute();
// $result_user = $stmt_user->get_result();
// $user = $result_user->fetch_assoc();
// $stmt_user->close(); // 첫 번째 쿼리 닫기

// if (!$user) {
//     echo "사용자 정보를 불러오는 데 실패했습니다.";
//     exit;
// }

// // 5. [추가] DB에서 [이 사용자의 리뷰 목록] 가져오기
// $sql_reviews = "SELECT M.menu_name, R.taste_rating 
//                 FROM Reviews R
//                 JOIN Menus M ON R.menu_id = M.menu_id
//                 WHERE R.user_id = ?
//                 ORDER BY R.created_at DESC"; // 최신순으로 정렬

// $stmt_reviews = $conn->prepare($sql_reviews);
// $stmt_reviews->bind_param("i", $user_id);
// $stmt_reviews->execute();
// $reviews_result = $stmt_reviews->get_result();
// // $reviews_result는 HTML에서 사용합니다. (아래 <tbody>에서)

// 6. [추가] 주석 처리한 변수들 대신 가짜(Dummy) 데이터 생성
$user = [
    'username' => '테스트유저',
    'email' => 'test@example.com',
    'birth_year' => 2000,
    'gender' => '여'
];

$dummy_reviews = [
    ['menu_name' => '가짜 마라탕', 'taste_rating' => 5],
    ['menu_name' => '테스트 파스타', 'taste_rating' => 4]
];
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
        
        /* [수정] 폼과 리뷰 섹션의 너비를 통일 */
        .content-box {
            display: inline-block;
            width: 100%;
            max-width: 600px; /* 최대 너비 */
            box-sizing: border-box; /* 패딩 포함 */
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: left;
        }
        form div { margin-bottom: 15px; display: flex; align-items: center; }
        form label { width: 100px; font-weight: bold; }
        form input, form span { padding: 8px; font-size: 15px; width: 200px; }
        form input { border: 1px solid #ccc; border-radius: 5px; }
        form button { display: block; width: 100%; margin-top: 20px; padding: 10px; font-size: 16px; background-color: #4CAF50; color: white; border: none; border-radius: 8px; cursor: pointer; }
        form button:hover { background-color: #45a049; }

        /* --- ▼ [추가] '내가 남긴 리뷰' 테이블 스타일 ▼ --- */
        .review-section {
            margin-top: 40px; /* 폼과의 간격 */
        }
        .review-section h3 {
            text-align: center;
            margin-top: 0;
            margin-bottom: 20px;
        }
        .review-table {
            width: 100%;
            border-collapse: collapse; /* 테이블 선 합치기 */
        }
        .review-table th, .review-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        .review-table th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <header>
        <a href="index.php" class="logo">오늘 뭐먹지?</a>
        <nav class="nav-links">
            <a href="menu.php">메뉴리뷰</a>
            <a href="analysis.php">분석하기</a>
            <a href="mypage.php" class="active">마이페이지</a> 
            <a href="logout.php" class="logout-btn">로그아웃</a>
        </nav>
    </header>

    <h2>마이페이지</h2>
    
    <form class="content-box" method="post" action="mypage_update.php">
        <div>
            <label>아이디</label>
            <span><?php echo htmlspecialchars($user['username']); ?></span>
        </div>
        <div>
            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="password" placeholder="새 비밀번호 (선택)">
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($user['email']); ?>">
        </div>
        <div>
            <label for="birth_year">출생연도</label>
            <input type="number" id="birth_year" name="birth_year" value="<?php echo htmlspecialchars($user['birth_year']); ?>">
        </div>
        <div>
            <label for="gender">성별</label>
            <div class="radio-group">
                    <input type="radio" id="gender_f" name="gender" value="여" <?php echo ($user['gender'] == '여') ? 'checked' : ''; ?>>
                    <label for="gender_f">여</label>
                    <input type="radio" id="gender_m" name="gender" value="남" <?php echo ($user['gender'] == '남') ? 'checked' : ''; ?>>
                    <label for="gender_m">남</label>
            </div>
        </div>
        
        <button type="submit">수정하기</button>
    </form>
    <div class="content-box review-section">
        <h3>내가 남긴 리뷰</h3>
        <table class="review-table">
            <thead>
                <tr>
                    <th>메뉴명</th>
                    <th>별점</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // if ($reviews_result->num_rows > 0) {
                //     // DB에서 가져온 데이터로 행(row)을 반복 생성
                //     while($review = $reviews_result->fetch_assoc()) {
                //         echo "<tr>";
                //         echo "<td>" . htmlspecialchars($review['menu_name']) . "</td>";
                //         echo "<td>" . htmlspecialchars($review['taste_rating']) . "점</td>";
                //         echo "</tr>";
                //     }
                // } else {
                //     // 리뷰가 없는 경우
                //     echo '<tr><td colspan="2">아직 남기신 리뷰가 없습니다.</td></tr>';
                // }
                
                // // 사용한 DB 리소스 모두 닫기
                // $stmt_reviews->close();
                // $conn->close();

                // 가짜(Dummy) 데이터로 대체
                if (count($dummy_reviews) > 0) {
                    foreach ($dummy_reviews as $review) {
                        echo "<tr>";
                        echo "<td>" . htmlspecialchars($review['menu_name']) . "</td>";
                        echo "<td>" . htmlspecialchars($review['taste_rating']) . "점</td>";
                        echo "</tr>";
                    }
                } else {
                    echo '<tr><td colspan="2">아직 남기신 리뷰가 없습니다.</td></tr>';
                }
             ?>
            </tbody>
        </table>
    </div>
    </body>
</html>