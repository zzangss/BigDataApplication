<?php
if (session_status() === PHP_SESSION_NONE) session_start();

// 세션에 저장된 필터값이 있으면 우선 사용, 없으면 POST 값 사용
$age     = $_SESSION['filters']['age']     ?? ($_POST['age'] ?? '');
$weather = $_SESSION['filters']['weather'] ?? ($_POST['weather'] ?? '');

// (선택) 안전하게 기본값
if ($age === '')     { $age = '20대'; }     // 필요 시 기본 연령대
if ($weather === '') { $weather = '맑음'; } // 필요 시 기본 날씨
?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘 뭐먹지? - 분석결과</title>
    <style>
        body {
            font-family: "맑은 고딕", sans-serif;
            background-color: #fdfdfd;
            text-align: center;
            padding-top: 120px; 
            padding-left: 40px;
            padding-right: 40px;
            padding-bottom: 40px;
        }

        /* --- 상단바 스타일 (변경 없음) --- */
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
        /* --- 상단바 스타일 끝 --- */

        /* --- [추가] 재검색 폼 스타일 --- */
        .search-form {
            background: #fcfcfc;
            border: 1px solid #eee;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px; /* 결과 컨테이너와 간격 */
            display: inline-block; /* 가운데 정렬 유지 */
        }
        .search-form label {
            margin: 0 10px 0 15px;
            font-size: 16px;
            color: #333;
        }
        .search-form select, .search-form button {
            padding: 10px;
            font-size: 16px;
            margin: 0 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .search-form button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .search-form button:hover {
            background-color: #45a049;
        }
        /* --- [추가] 스타일 끝 --- */

        /* --- 결과 컨테이너 스타일 (변경 없음) --- */
        .container {
            display: flex;
            justify-content: space-around;
            gap: 20px;
            margin-top: 40px; 
            text-align: left;
        }
        .section {
            flex: 1; 
            min-width: 0;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        table {
            border-collapse: collapse;
            margin: 20px auto;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
        }
        th {
            background-color: #f2f2f2;
        }
        h2 { color: #333; }
        h3 {
            text-align: center;
            margin-top: 0;
        }
    </style>
</head>
<body>

    <header>
        <a href="index.php" class="logo">오늘 뭐먹지?</a>
        <nav class="nav-links">
            <a href="menu.php">메뉴리뷰</a>
            <a href="analysis.php" class="active">분석하기</a>
            <a href="mypage.php">마이페이지</a>
        </nav>
    </header>

    <h2>오늘 이거 먹으면 맛있겠다!</h2>
    
    <form class="search-form" method="POST" action="analysis_filter.php">
        <label for="age">연령대:</label>
        <select name="age" id="age" required>
            <option value="">선택</option>
            <option value="10대" <?= ($age == '10대') ? 'selected' : '' ?>>10대</option>
            <option value="20대" <?= ($age == '20대') ? 'selected' : '' ?>>20대</option>
            <option value="30대" <?= ($age == '30대') ? 'selected' : '' ?>>30대</option>
            <option value="40대" <?= ($age == '40대') ? 'selected' : '' ?>>40대</option>
        </select>
    
        <label for="weather">오늘의 날씨:</label>
        <select name="weather" id="weather" required>
            <option value="">선택</option>
            <option value="맑음" <?= ($weather == '맑음') ? 'selected' : '' ?>>맑음</option>
            <option value="비" <?= ($weather == '비') ? 'selected' : '' ?>>비</option>
            <option value="흐림" <?= ($weather == '흐림') ? 'selected' : '' ?>>흐림</option>
        </select>
    
        <button type="submit">다시 분석하기</button>
    </form>

    <!-- 표 시작 -->

    <div class="container">
        <div class="section">
        <?php include __DIR__ . '/get_my_menus.php'; ?>
        </div>

        <div class="section">
        <?php include __DIR__ . '/get_my_category.php'; ?>
        </div>

        <div class="section">
        <?php include __DIR__ . '/get_review_analysis.php'; ?>
        </div>
    </div> 

</body>
</html>

