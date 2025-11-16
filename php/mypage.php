<?php
// 1. [수정] auth_check.php를 사용하여 세션 시작 및 로그인 여부 검사
require_once __DIR__ . '/auth_check.php';
// $current_user_id 와 $current_username 변수를 이제 사용할 수 있습니다.

// 2. DB 연결
require_once __DIR__ . '/db.php';

// 3. [복원] DB에서 [실제 사용자 정보] 가져오기 (Users + UserProfile)
$sql_user = "SELECT U.username, U.email, P.birth_year, P.gender
              FROM Users U
              LEFT JOIN UserProfile P ON U.user_id = P.user_id
              WHERE U.user_id = ?";

$stmt_user = $conn->prepare($sql_user);
$stmt_user->bind_param("i", $current_user_id);
$stmt_user->execute();
$result_user = $stmt_user->get_result();
$user = $result_user->fetch_assoc();
$stmt_user->close(); // 쿼리 닫기

if (!$user) {
    // (auth_check에서 이미 확인했지만, 혹시 모를 예외 처리)
    echo "사용자 정보를 불러오는 데 실패했습니다.";
    exit;
}

// 4. [복원] DB에서 [이 사용자의 리뷰 목록] 가져오기
//    (4.4 Windowing 요구사항 'OVER (PARTITION BY...)' 적용)
$sql_reviews = "
    WITH AllReviewsWithAvg AS (
        SELECT 
            review_id,
            user_id,
            menu_id,
            taste_rating,
            created_at,
            -- (4.4) Windowing: 메뉴별(PARTITION BY) 평균 별점 계산
            ROUND(AVG(taste_rating) OVER (PARTITION BY menu_id), 1) AS avg_rating
        FROM Reviews
    )
    SELECT 
        AR.review_id,
        M.menu_name,
        AR.taste_rating, -- (내 별점)
        AR.avg_rating      -- (평균 별점)
    FROM AllReviewsWithAvg AS AR
    JOIN Menus M ON AR.menu_id = M.menu_id
    WHERE AR.user_id = ?
    ORDER BY AR.created_at DESC; -- 최신순 정렬
";

$stmt_reviews = $conn->prepare($sql_reviews);
$stmt_reviews->bind_param("i", $current_user_id);
$stmt_reviews->execute();
$reviews_result = $stmt_reviews->get_result();
// $reviews_result는 HTML의 <tbody>에서 사용합니다.
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
    
        .container { width: 90%; max-width: 800px; margin: 0 auto; text-align: left; }
        .content-box { width: 100%; box-sizing: border-box; background: white; padding: 30px; border-radius: 12px; box-shadow: 0 0 10px rgba(0,0,0,0.1); text-align: left; }
        form div { margin-bottom: 15px; display: flex; align-items: center; }
        form label { width: 100px; font-weight: bold; flex-shrink: 0; }
        form input, form span { padding: 8px; font-size: 15px; flex-grow: 1; }
        form input { border: 1px solid #ccc; border-radius: 5px; }
        form button { display: block; width: 100%; margin-top: 20px; padding: 10px; font-size: 16px; background-color: #4CAF50; color: white; border: none; border-radius: 8px; cursor: pointer; }
        form button:hover { background-color: #45a049; }

        .radio-group { display: flex; align-items: center; }
        .radio-group label { width: auto; font-weight: normal; margin-left: 5px; margin-right: 20px; }
        .radio-group input[type="radio"] { width: auto; margin: 0; }
        
        .review-section { margin-top: 40px; }
        .review-section h3 { text-align: center; margin-top: 0; margin-bottom: 20px; }
        .review-table { width: 100%; border-collapse: collapse; }
        .review-table th, .review-table td { border: 1px solid #ddd; padding: 12px; text-align: center; }
        .review-table th { background-color: #f2f2f2; }
        .delete-btn { background-color: #d9534f; color: white; border: none; padding: 5px 10px; border-radius: 5px; cursor: pointer; font-size: 14px; }
        .delete-btn:hover { background-color: #c9302c; }
        /* (메시지 스타일) */
        .message { text-align: center; font-weight: bold; padding: 10px; border-radius: 5px; margin-bottom: 15px; }
        .error { color: #d9534f; background-color: #f2dede; }
        .success { color: #4CAF50; background-color: #dff0d8; }
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

    <div class="container">
        <h2>마이페이지</h2>

        <?php if (isset($_GET['update_success'])): ?>
            <div class="message success"><?php echo htmlspecialchars($_GET['update_success']); ?></div>
        <?php elseif (isset($_GET['update_error'])): ?>
            <div class="message error"><?php echo htmlspecialchars($_GET['update_error']); ?></div>
        <?php endif; ?>
        
        <form class="content-box" method="post" action="mypage_update.php">
            <h3>회원 정보 수정</h3>
            <div>
                <label>아이디</label>
                <span><?php echo htmlspecialchars($user['username']); ?></span>
            </div>
            <div>
                <label for="pw">비밀번호</label>
                <input type="password" id="pw" name="password" placeholder="새 비밀번호 (변경 시에만 입력)">
            </div>
            <div>
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($user['email']); ?>" required>
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

            <?php if (isset($_GET['delete_success'])): ?>
                <div class="message success"><?php echo htmlspecialchars($_GET['delete_success']); ?></div>
            <?php elseif (isset($_GET['delete_error'])): ?>
                <div class="message error"><?php echo htmlspecialchars($_GET['delete_error']); ?></div>
            <?php endif; ?>

            <table class="review-table">
                <thead>
                    <tr>
                        <th>메뉴명</th>
                        <th>내 별점</th>
                        <th>평균 별점</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        // [수정] 실제 $reviews_result 변수 사용
                        if ($reviews_result->num_rows > 0) {
                            while ($review = $reviews_result->fetch_assoc()) {
                                echo "<tr>";
                                echo "<td>" . htmlspecialchars($review['menu_name']) . "</td>";
                                echo "<td>" . htmlspecialchars($review['taste_rating']) . "점</td>";
                                echo "<td>" . htmlspecialchars($review['avg_rating']) . "점</td>";
                                
                                // [수정] 삭제 버튼을 별도의 <form>으로 감싸기
                                echo '<td>';
                                echo '  <form method="POST" action="review_delete.php" onsubmit="return confirm(\'정말 삭제하시겠습니까?\');">';
                                echo '    <input type="hidden" name="review_id" value="' . $review['review_id'] . '">';
                                echo '    <button type="submit" class="delete-btn">삭제</button>';
                                echo '  </form>';
                                echo '</td>';
                                
                                echo "</tr>";
                            }
                        } else {
                            echo '<tr><td colspan="4">아직 남기신 리뷰가 없습니다.</td></tr>';
                        }
                        $reviews_result->close(); // 쿼리 닫기
                        $conn->close(); // DB 연결 닫기
                    ?>
                </tbody>
            </table>
        </div>

    </div> 
</body>
</html>