<?php
session_start(); // 1. 세션 시작

// 2. [수정] 로그인이 안 되어 있다면 'index.php'로 즉시 리다이렉트
// 로그인 된 상태도록 주석처리함 
// if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])) {
//     header('Location: index.php'); 
//     exit; // 여기서 스크립트 즉시 종료
// }

// (로그인 된 사용자만 이 아래 코드를 보게 됩니다)
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
        form div { 
            margin-bottom: 15px;
            /* [수정] 라벨과 입력창을 가로로 배치 */
            display: flex;
            align-items: center; /* 기본 정렬은 중앙 */
        }
        form label { 
            display: inline-block;
            /* [수정] 라벨 너비 100px로 증가 */
            width: 100px; 
            font-weight: bold; 
        }
        
        /* --- ▼ [수정/추가] 폼 요소 스타일 ▼ --- */
        form input[type="text"],
        form input[type="number"],
        form textarea,
        form input[type="file"] {
            padding: 8px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            /* [수정] 폼 너비를 400px로 크게 */
            width: 400px;
            box-sizing: border-box;
        }
        form input[type="number"] { width: 100px; } /* 별점 입력창은 작게 */
        form textarea { height: 150px; resize: vertical; } /* 리뷰 내용 높이 증가 */
        
        /* [추가] 파일 입력창은 브라우저 기본 스타일 사용 방지 */
        form input[type="file"] {
            padding: 10px;
            background-color: #f9f9f9;
        }
        
        /* [추가] textarea 라벨 상단 정렬 */
        .textarea-group {
            align-items: flex-start; /* 라벨을 위로 붙임 */
        }
        .textarea-group label {
            padding-top: 8px; /* 라벨 텍스트 위치 살짝 내림 */
        }
        /* --- ▲ [수정/추가] 끝 ▲ --- */

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
        <a href="index.php" class="logo">오늘 뭐먹지?</a>
        <nav class="nav-links">
            <a href="menu.php" class="active">메뉴리뷰</a>
            <a href="analysis.php">분석하기</a>
            <a href="mypage.php">마이페이지</a>
            <a href="logout.php" class="logout-btn">로그아웃</a>
        </nav>
    </header>
    <h2>리뷰 쓰기</h2>

    <form method="post" action="review_process.php" enctype="multipart/form-data">
        <div>
            <label for="menu">메뉴명</label>
            <input type="text" id="menu" name="menu" required>
        </div>
        <div>
            <label for="rating">별점(1~5)</label>
            <input type="number" id="rating" name="rating" min="1" max="5">
        </div>

        <div>
            <label for="image">이미지</label>
            <input type="file" id="image" name="review_image" accept="image/*">
        </div>
        
        <div class="textarea-group">
            <label for="comment">리뷰 내용</label>
            <textarea id="comment" name="comment"></textarea>
        </div>
        
        <button type="submit">리뷰 등록하기</button>
    </form>
    </body>
</html>