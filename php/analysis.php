<?php
session_start(); // 1. 세션 시작
// 2. 로그인 여부 확인 (페이지를 쫓아내지는 않습니다)
$is_logged_in = isset($_SESSION['user_id']) && !empty($_SESSION['user_id']);
?>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘 뭐먹지? - 분석하기</title>
    <style>
        body {
            font-family: "맑은 고딕", sans-serif;
            background-color: #fafafa;
            text-align: center;
            padding-top: 80px; 
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
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            text-decoration: none; 
        }
        .nav-links a {
            margin-left: 25px; 
            font-size: 16px;
            color: #555;
            text-decoration: underline; 
        }
        .nav-links a:hover {
            color: #000;
        }

        .nav-links a.active {
            font-weight: bold; 
            color: #000; 
        }

        /* --- ▼ [추가] 로그인/로그아웃 버튼 스타일 ▼ --- */
        .nav-links a.logout-btn {
            color: #d9534f; 
        }
        .nav-links a.login-btn {
            color: #4CAF50; /* 초록색 */
            font-weight: bold;
        }
        /* --- ▲ [추가] 스타일 끝 ▲ --- */

        h2 { color: #333; }
        form {
            display: inline-block;
            width: 200px; /* (너비가 좁아 보여서 조금 수정했습니다, 원본: 200px) */
            min-width: 250px; /* 최소 너비 */
            background: white;
            padding: 50px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        select, button {
            padding: 10px;
            margin: 10px;
            font-size: 16px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    
    <header>
        <a href="index.php" class="logo">오늘 뭐먹지?</a>
        
        <nav class="nav-links">
            <?php if ($is_logged_in): ?>
                <a href="menu.php">메뉴리뷰</a>
                <a href="analysis.php" class="active">분석하기</a>
                <a href="mypage.php">마이페이지</a>
                <a href="logout.php" class="logout-btn">로그아웃</a>
            <?php else: ?>
                <a href="menu.php">메뉴리뷰</a>
                <a href="analysis.php" class="active">분석하기</a>
                <a href="index.php" class="login-btn">로그인</a> <?php endif; ?>
        </nav>
        </header>

    <h2>오늘 뭐먹지?</h2>
    <form method="POST" action="analysis_filter.php">
        <label for="age">찾을 연령대:</label><br>
        <select name="age" id="age" required>
            <option value="">선택</option>
            <option value="10대">10대</option>
            <option value="20대">20대</option>
            <option value="30대">30대</option>
            <option value="40대">40대</option>
        </select><br><br>

        <label for="weather">오늘의 날씨:</label><br>
        <select name="weather" id="weather" required>
            <option value="">선택</option>
            <option value="맑음">맑음</option>
            <option value="비">비</option>
            <option value="눈">눈</option>
            <option value="흐림">흐림</option>
        </select><br><br>

        <button type="submit">분석하기</button>
    </form>
</body>
</html>