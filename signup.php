<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘 뭐먹지? - 회원가입</title>
    <style>
        body { font-family: "맑은 고딕", sans-serif; background-color: #fafafa; text-align: center; padding-top: 120px; padding-bottom: 40px; }
        header { position: fixed; top: 0; left: 0; width: 100%; height: 80px; background-color: white; display: flex; justify-content: space-between; align-items: center; padding: 0 40px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); box-sizing: border-box; }
        .logo { font-size: 24px; font-weight: bold; color: #333; text-decoration: none; }
        .nav-links a { margin-left: 25px; font-size: 16px; color: #555; text-decoration: underline; }
        .nav-links a:hover { color: #000; }
        h2 { color: #333; }
        form { display: inline-block; background: white; padding: 30px; border-radius: 12px; box-shadow: 0 0 10px rgba(0,0,0,0.1); text-align: left; }
        form div { margin-bottom: 15px; display: flex; align-items: center; }
        form label { width: 100px; font-weight: bold; }
        form input, form select { padding: 8px; font-size: 15px; border: 1px solid #ccc; border-radius: 5px; width: 200px; box-sizing: border-box; }
        form button { display: block; width: 100%; margin-top: 20px; padding: 10px; font-size: 16px; background-color: #4CAF50; color: white; border: none; border-radius: 8px; cursor: pointer; }
        form button:hover { background-color: #45a049; }
        /* (라디오 버튼 스타일) */
        .radio-group { display: flex; align-items: center; width: 200px; }
        .radio-group > div { display: flex; align-items: center; margin-right: 20px; }
        .radio-group input[type="radio"] { width: auto; margin: 0 5px 0 0; }
        .radio-group label { width: auto; font-weight: normal; }
    </style>
</head>
<body>
    <header>
        <a href="index.php" class="logo">오늘 뭐먹지?</a>
        <nav class="nav-links">
            <a href="menu.php">메뉴리뷰</a>
            <a href="analysis.php">분석하기</a>
            <a href="index.php" class="login-btn">로그인</a>
        </nav>
    </header>
    <h2>오늘 뭐먹지? 회원가입</h2>

    <form method="post" action="signup_process.php">
        <div>
            <label for="username">아이디</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="password" required>
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="email" id="email" name="email">
        </div>
        <div>
            <label for="birth_year">출생연도</label>
            <input type="number" id="birth_year" name="birth_year" placeholder="예: 1995">
        </div>
        <div>
            <label>성별</label>
            <div class="radio-group">
                <div>
                    <input type="radio" id="gender_f" name="gender" value="여" checked>
                    <label for="gender_f">여</label>
                </div>
                <div>
                    <input type="radio" id="gender_m" name="gender" value="남">
                    <label for="gender_m">남</label>
                </div>
            </div>
        </div>
        <button type="submit">회원가입</button>
    </form>
</body>
</html>