<?php
session_start(); // 1. 세션은 항상 시작

// ✅ 임시 로그인 세션 강제 설정 (테스트용)
// $_SESSION['user_id'] = 'testuser';

// 2. [수정] 로그인 여부를 변수에 저장만 하고, 쫓아내지 않습니다.
$is_logged_in = isset($_SESSION['user_id']) && !empty($_SESSION['user_id']);


?>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘 뭐먹지? - 내맛보기</title>
    <style>
        body {
            font-family: "맑은 고딕", sans-serif;
            background-color: #fafafa;
            text-align: center;
            padding-top: 120px;
            padding-bottom: 40px;
        }
        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 80px;
            background-color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 40px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            box-sizing: border-box;
        }
        .logo { font-size: 24px; font-weight: bold; color: #333; text-decoration: none; }
        .nav-links a { margin-left: 25px; font-size: 16px; color: #555; text-decoration: underline; }
        .nav-links a:hover { color: #000; }
        .nav-links a.logout-btn { color: #d9534f; }
        .nav-links a.login-btn { color: #4CAF50; font-weight: bold; } /* 로그인 버튼 */
        .nav-links a.active { font-weight: bold; color: #000; } /* '내맛보기' 활성화 */
        /* --- 상단바 스타일 끝 --- */
        .container {
            width: 90%;
            max-width: 900px;
            margin: 0 auto;
            text-align: left;
        }
        
        /* --- 필터 바 --- */
        .filter-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 25px;
        }
        .filter-bar label {
            font-size: 16px;
            font-weight: bold;
            margin-right: 10px;
        }
        .filter-bar select {
            padding: 8px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .review-button {
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            border-radius: 8px;
        }
        .review-button:hover {
            background-color: #45a049;
        }
        .review-list-item {
            display: flex;
            background: white;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            overflow: hidden;
        }
        .review-image {
            width: 150px;
            height: 120px;
            background-color: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #aaa;
            font-size: 16px;
            flex-shrink: 0;
        }
        .review-info {
            padding: 20px;
        }
        .review-info h3 {
            margin: 0 0 10px 0;
            font-size: 20px;
            color: #000;
        }
        .review-info .stars {
            font-size: 24px;
            color: #FFD700;
        }
        .review-info .stars .empty {
            color: #ccc;
        }
    </style>
</head>
<body>

    <header>
        <a href="index.php" class="logo">오늘 뭐먹지?</a>
        <nav class="nav-links">
            <?php if ($is_logged_in): ?>
                <a href="menu.php" class="active">메뉴리뷰</a>
                <a href="analysis.php">분석하기</a>
                <a href="mypage.php">마이페이지</a>
                <a href="logout.php" class="logout-btn">로그아웃</a>
            <?php else: ?>
                <a href="menu.php" class="active">메뉴리뷰</a>
                <a href="analysis.php">분석하기</a>
                <a href="login.php" class="login-btn">로그인</a>
            <?php endif; ?>
        </nav>
    </header>
    <div class="container">

        <div class="filter-bar">
            <div>
                <label for="category">카테고리:</label>
                <select name="category" id="category">
                    <option value="전체">전체</option>
                    <option value="한식">한식</option>
                    <option value="중식">중식</option>
                    <option value="돈까스, 회">돈까스, 회</option>
                    <option value="양식">양식</option>
                    <option value="분식">분식</option>
                    <option value="패스트푸드">패스트푸드</option>
                    <option value="디저트">디저트</option>
                    <option value="찜, 탕">찜, 탕</option>
                    <option value="아시안">아시안</option>
                    <option value="고기">고기</option>
                </select>
            </div>
            
            <?php if ($is_logged_in): // $is_logged_in이 true일 때만 이 버튼이 보입니다. ?>
            <div>
                <a href="review.php" class="review-button">리뷰쓰기</a>
            </div>
            <?php endif; ?>

        </div>
        <div class="review-list-item">
            <div class="review-image">이미지</div>
            <div class="review-info">
                <h3>마라로제떡볶이</h3>
                <div class="stars">
                    <span>★</span><span>★</span><span>★</span><span>★</span><span class="empty">★</span>
                </div>
            </div>
        </div>
        
        <div class="review-list-item">
            <div class="review-image">이미지</div>
            <div class="review-info">
                <h3>라구 파스타</h3>
                <div class="stars">
                    <span>★</span><span>★</span><span>★</span><span class="empty">★</span><span class="empty">★</span>
                </div>
            </div>
        </div>
        
        </div>
    </body>
</html>