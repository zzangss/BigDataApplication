<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘 뭐먹지? - 로그인</title>
    <style>
        body { font-family: "맑은 고딕", sans-serif; background-color: #fafafa; text-align: center; padding-top: 120px; padding-bottom: 40px; }
        header { position: fixed; top: 0; left: 0; width: 100%; height: 80px; background-color: white; display: flex; justify-content: space-between; align-items: center; padding: 0 40px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); box-sizing: border-box; }
        .logo { font-size: 24px; font-weight: bold; color: #333; text-decoration: none; }
        .nav-links a { margin-left: 25px; font-size: 16px; color: #555; text-decoration: underline; }
        .nav-links a:hover { color: #000; }
        .nav-links a.login-btn { color: #4CAF50; font-weight: bold; }
        h2 { color: #333; }
        form { display: inline-block; background: white; padding: 30px; border-radius: 12px; box-shadow: 0 0 10px rgba(0,0,0,0.1); text-align: left; }
        form div { margin-bottom: 15px; display: flex; align-items: center; }
        /* [수정] 라벨 너비를 100px로 늘림 */
        form label { width: 100px; font-weight: bold; } 
        form input { padding: 8px; font-size: 15px; border: 1px solid #ccc; border-radius: 5px; width: 200px; }
        form button { display: block; width: 100%; margin-top: 20px; padding: 10px; font-size: 16px; background-color: #4CAF50; color: white; border: none; border-radius: 8px; cursor: pointer; }
        form button:hover { background-color: #45a049; }
        body > a { display: block; margin-top: 20px; color: #555; text-decoration: underline; }
    </style>
</head>
<body>
    <header>
        <a href="index.php" class="logo">오늘 뭐먹지?</a>
        <nav class="nav-links">
            <a href="menu.php">메뉴리뷰</a>
            <a href="analysis.php">분석하기</a>
            <a href="login.php" class="login-btn">로그인</a>
            </nav>
    </header>

    <h2>오늘 뭐먹지?</h2>
    
    <form method="post" action="login_process.php">
        <div>
            <label for="username">아이디</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="password" required>
        </div>
        <button type="submit">로그인</button>
    </form>
    
    <a href="signup.php">회원가입</a>
</body>
</html>