<?php
session_start(); // 1. 세션 시작

// 2. [수정] 로그인이 안 되어 있다면 'index.php'로 즉시 리다이렉트
if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])) {
    header('Location: index.php'); 
    exit; // 여기서 스크립트 즉시 종료
}

// 3. (여기까지 왔다면) 로그인이 된 상태입니다.
//    정상적인 리뷰 작성 페이지를 보여줍니다.
?>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘 뭐먹지? - 리뷰</title>
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
        .nav-links a.active { font-weight: bold; color: #000; }
        .nav-links a.logout-btn { color: #d9534f; }
        h2 { color: #333; }

        form {
            display: inline-block;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: left; 
        }
        form div { margin-bottom: 15px; }
        form label { display: inline-block; width: 80px; font-weight: bold; }
        form input, form textarea {
            padding: 8px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 250px;
            box-sizing: border-box;
        }
        form input[type="number"] { width: 80px; }
        form textarea { height: 100px; resize: vertical; }
        form button {
            display: block; 
            width: 100%; 
            margin-top: 20px;
            padding: 10px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        form button:hover { background-color: #45a049; }
    </style>
</head>
<body>

    <header>
        <a href="main.php" class="logo">오늘 뭐먹지?</a>
        <nav class="nav-links">
            <a href="menu.php">메뉴리뷰</a>
            <a href="review.php" class="active">리뷰쓰기</a> <a href="analysis.php">분석하기</a>
            <a href="mypage.php">마이페이지</a>
            <a href="logout.php" class="logout-btn">로그아웃</a>
        </nav>
    </header>
    
    <h2>리뷰 쓰기</h2>

    <form method="post" action="review_process.php">
        <div>
            <label for="menu">메뉴명:</label>
            <input type="text" id="menu" name="menu" required>
        </div>
        <div>
            <label for="rating">별점:</label>
            <input type="number" id="rating" name="rating" min="1" max="5">
        </div>
        <div>
            <label for="comment">댓글:</label>
            <textarea id="comment" name="comment"></textarea>
        </div>
        <button type="submit">등록</button>
    </form>
</body>
</html>