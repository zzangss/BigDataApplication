<?php
// 1. 로그인 검사 (가장 먼저 실행)
require_once __DIR__ . '/auth_check.php';
// $current_user_id 사용 가능

// 2. DB 연결
require_once __DIR__ . '/db.php';

// 3. [신규] 리뷰 등록 성공 여부 확인 (버튼 비활성화용)
$is_submitted = isset($_GET['review_success']);

// 4. 'Menus' 테이블에서 전체 메뉴 목록 가져오기 (드롭다운용)
$sql_menus = "SELECT menu_id, menu_name FROM Menus ORDER BY menu_name ASC";
$menu_result = $conn->query($sql_menus);

// 5. [수정] 'WeatherLog'와 'WeatherConditions'를 JOIN하여 날짜와 날씨 이름 가져오기
$sql_dates = "SELECT 
                    WL.log_date, 
                    WC.condition_name 
                FROM WeatherLog AS WL
                JOIN WeatherConditions AS WC ON WL.condition_id = WC.condition_id
                ORDER BY WL.log_date DESC"; // 최신 날짜부터
$date_result = $conn->query($sql_dates);

// $menu_result와 $date_result는 아래 HTML <select>에서 사용
?>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘 뭐먹지? - 리뷰 작성</title>
    <!-- (스타일 태그는 mypage.php와 거의 동일하게 사용) -->
    <style>
        body { font-family: "맑은 고딕", sans-serif; background-color: #fafafa; text-align: center; padding-top: 120px; padding-bottom: 40px; }
        header { position: fixed; top: 0; left: 0; width: 100%; height: 80px; background-color: white; display: flex; justify-content: space-between; align-items: center; padding: 0 40px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); box-sizing: border-box; }
        .logo { font-size: 24px; font-weight: bold; color: #333; text-decoration: none; }
        .nav-links a { margin-left: 25px; font-size: 16px; color: #555; text-decoration: underline; }
        .nav-links a:hover { color: #000; }
        .nav-links a.active { font-weight: bold; color: #000; }
        .nav-links a.logout-btn { color: #d9534f; } 
        h2 { color: #333; }
        form { display: inline-block; background: white; padding: 30px; border-radius: 12px; box-shadow: 0 0 10px rgba(0,0,0,0.1); text-align: left; width: 100%; max-width: 500px; }
        form div { margin-bottom: 15px; display: flex; align-items: center; }
        form label { width: 100px; font-weight: bold; flex-shrink: 0; }
        form input, form select, form textarea { 
            padding: 8px; font-size: 15px; border: 1px solid #ccc; border-radius: 5px; flex-grow: 1; box-sizing: border-box; 
        }
        form textarea { height: 100px; resize: vertical; }
        form button { display: block; width: 100%; margin-top: 20px; padding: 10px; font-size: 16px; background-color: #4CAF50; color: white; border: none; border-radius: 8px; cursor: pointer; }
        form button:hover { background-color: #45a049; }
        
        /* [신규] 비활성화된 버튼 스타일 */
        form button:disabled {
            background-color: #aaa;
            cursor: not-allowed;
        }
        form button:disabled:hover {
            background-color: #aaa;
        }

        /* (별점 라디오 스타일) */
        .rating-group { display: flex; align-items: center; flex-grow: 1; justify-content: space-around; }
        .rating-group > div { display: flex; align-items: center; }
        .rating-group input[type="radio"] { width: auto; margin: 0 5px 0 0; }
        .rating-group label { width: auto; font-weight: normal; }
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
            <!-- (review.php가 '메뉴리뷰' 페이지라고 가정) -->
            <a href="review.php" class="active">메뉴리뷰</a> 
            <a href="analysis.php">분석하기</a>
            <a href="mypage.php">마이페이지</a> 
            <a href="logout.php" class="logout-btn">로그아웃</a>
        </nav>
    </header>

    <h2>리뷰 작성하기</h2>

    <form method="post" action="review_process.php">
        
        <!-- 리뷰 작성 결과 메시지 표시 -->
        <?php if ($is_submitted): ?>
            <div class="message success"><?php echo htmlspecialchars($_GET['review_success']); ?></div>
        <?php elseif (isset($_GET['review_error'])): ?>
            <div class="message error"><?php echo htmlspecialchars($_GET['review_error']); ?></div>
        <?php endif; ?>

        <!-- 1. 메뉴 선택 -->
        <div>
            <label for="menu_id">메뉴 선택</label>
            <select id="menu_id" name="menu_id" required <?php echo $is_submitted ? 'disabled' : ''; ?>>
                <option value="">-- 메뉴를 선택하세요 --</option>
                <?php
                if ($menu_result->num_rows > 0) {
                    while ($row = $menu_result->fetch_assoc()) {
                        echo '<option value="' . $row['menu_id'] . '">' . htmlspecialchars($row['menu_name']) . '</option>';
                    }
                }
                $menu_result->close();
                ?>
            </select>
        </div>

        <!-- 2. 날짜 선택 (WeatherLog + WeatherConditions) -->
        <div>
            <label for="log_date">날짜 (날씨)</label>
            <select id="log_date" name="log_date" required <?php echo $is_submitted ? 'disabled' : ''; ?>>
                <option value="">-- 날짜(날씨)를 선택하세요 --</option>
                <?php
                if ($date_result->num_rows > 0) {
                    while ($row = $date_result->fetch_assoc()) {
                        // 옵션에 (날씨 이름)을 함께 표시
                        $display_text = $row['log_date'] . ' (' . htmlspecialchars($row['condition_name']) . ')';
                        echo '<option value="' . $row['log_date'] . '">' . $display_text . '</option>';
                    }
                }
                $date_result->close();
                ?>
            </select>
        </div>
        
        <!-- 3. 맛 별점 (taste_rating) -->
        <div>
            <label>맛 별점</label>
            <div class="rating-group">
                <?php for ($i = 1; $i <= 5; $i++): ?>
                <div>
                    <input type="radio" id="taste_<?php echo $i; ?>" name="taste_rating" value="<?php echo $i; ?>" <?php echo ($i == 3) ? 'checked' : ''; ?> <?php echo $is_submitted ? 'disabled' : ''; ?>>
                    <label for="taste_<?php echo $i; ?>"><?php echo $i; ?>점</label>
                </div>
                <?php endfor; ?>
            </div>
        </div>

        <!-- 4. 리뷰 내용 (content) -->
        <div>
            <label for="content">리뷰 내용</label>
            <textarea id="content" name="content" placeholder="리뷰 내용을 입력하세요 (선택)" <?php echo $is_submitted ? 'disabled' : ''; ?>></textarea>
        </div>
        
        <!-- [!!] ------------ (수정된 부분) ------------ [!!] -->
        <button type="submit" <?php echo $is_submitted ? 'disabled' : ''; ?>>
            <?php echo $is_submitted ? '등록 완료' : '리뷰 등록하기'; ?>
        </button>
        <!-- [!!] ---------------------------------------- [!!] -->

    </form>
</body>
</html>
<?php $conn->close(); ?>