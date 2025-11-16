<?php
// 1. 세션 시작
session_start();

// 2. 로그인 상태를 변수에 저장
$is_logged_in = isset($_SESSION['user_id']) && !empty($_SESSION['user_id']);
?>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘 뭐먹지?</title>
    <style>
        body {
            font-family: "맑은 고딕", sans-serif;
            background-color: #fafafa;
            text-align: center;
            padding-top: 120px; /* 헤더 높이(80px) + 여유(40px) */
            padding-bottom: 40px;
        }

        /* --- 상단바 스타일 --- */
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
        .nav-links a:hover { color: #000; }
        .nav-links a.logout-btn { color: #d9534f; }
        .nav-links a.login-btn { color: #4CAF50; font-weight: bold; }
        .nav-links a.active { font-weight: bold; color: #000; }

        .content {
            background: white;
            padding: 40px 30px; /* 상하 여백 늘림 */
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            display: inline-block;
            max-width: 600px;
        }
        .content h2 {
            font-size: 28px;
            color: #333;
            margin-top: 0;
        }
        .content p {
            font-size: 1.1em;
            line-height: 1.6;
            color: #555;
        }
        .content-button {
            display: inline-block;
            margin-top: 25px; /* <p> 태그와의 간격 */
            padding: 12px 30px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background-color: #4CAF50; /* 초록색 (다른 버튼과 통일) */
            text-decoration: none;
            border-radius: 8px;
            border: 2px solid #4CAF50;
            transition: background-color 0.2s;
        }
        .content-button:hover {
            background-color: #45a049;
        }


        /*오늘의 최고 인기 메뉴*/
        .popular-menu-section {
            margin: 50px auto 0 auto; /* .content와의 간격 */
            width: 100%;
            max-width: 1200px; /* 5개 항목이 들어갈 넓은 너비 */
        }
        .popular-menu-section h3 {
            font-size: 24px;
            color: #333;
            margin-bottom: 25px;
        }

        .menu-container {
    display: flex;            /* 가로 정렬의 핵심 */
    flex-wrap: nowrap;        /* 줄바꿈 안 함 (한 줄에 5개 고정) */
    justify-content: center;  /* 가운데 정렬 */
    gap: 20px;                /* 카드 사이 간격 */
    margin-top: 20px;
  }

  .menu-item {
    width: 200px;             /* 카드 너비 */
    border: 1px solid #ccc;
    border-radius: 12px;
    background: #fafafa;
    text-align: center;
    padding: 10px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    transition: transform 0.2s ease;
  }

  .menu-item:hover {
    transform: translateY(-5px);
  }

  .menu-image img {
    width: 100%;
    height: 150px;
    object-fit: cover;
    border-radius: 8px;
  }

  .menu-info p {
    margin: 5px 0;
  }
        
    </style>
</head>
<body>

    <header>
        <a href="index.php" class="logo">오늘 뭐먹지?</a>
        
        <nav class="nav-links">
            <?php if ($is_logged_in): ?>
                <a href="menu.php">메뉴리뷰</a>
                <a href="analysis.php">분석하기</a>
                <a href="mypage.php">마이페이지</a>
                <a href="logout.php" class="logout-btn">로그아웃</a>
            <?php else: ?>
                <a href="menu.php">메뉴리뷰</a>
                <a href="analysis.php">분석하기</a>
                <a href="login.php" class="login-btn">로그인</a>
            <?php endif; ?>
        </nav>
    </header>

    <div class="content">
        <p>안녕하세요, 
            <strong>
                <?php 
                if ($is_logged_in) {
                    echo htmlspecialchars($_SESSION['username']);
                } else {
                    echo '방문자';
                }
                ?>
            </strong>님!
        </p>
        
        <h2>오늘 날씨에 딱!</h2>
        <p>당신을 위한 맞춤 메뉴 추천<br>
           연령대별 최고 인기 메뉴를 지금 바로 확인하세요!</p>
            <img src="오늘뭐먹지로고.png" alt="오늘 뭐먹지 로고" style="width: 200px; margin: 10px 0;">
            <br>
        <a href="analysis.php" class="content-button">나의 메뉴 찾기</a>
    </div>
    <div class="popular-menu-section">
        <h3>오늘의 최고 인기 메뉴는?</h3>
        
        <?php include __DIR__ . '/get_top_menus.php'; ?>

    </body>
</html>