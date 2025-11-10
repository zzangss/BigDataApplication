<?php
session_start(); // 1. 세션 시작

// 로그인 상태 확인
$is_logged_in = isset($_SESSION['user_id']) && !empty($_SESSION['user_id']);

//임시로그인 (테스트용)
$_SESSION['user_id'] = 1; 
$_SESSION['username'] = 'testuser';
$is_logged_in = true; 


// DB 로직 대신 임시 $review 데이터를 생성합니다.
$review = [
    'review_id' => 101,
    'menu_name' => '마라로제떡볶이',
    'taste_rating' => 4.0,
    'username' => 'testuser',
    'created_at' => '2025-10-25 14:30:00',
    'content' => "여기 정말 맛있네요.\n국물 맛이 아주 깊어요.\n다음에 또 올 거예요!",
    'user_id' => 1 // 이 리뷰를 작성한 사용자의 ID (1번 = testuser)
];

// 댓글 목록을 위한 가짜(Dummy) 데이터 
$dummy_comments = [
    ['id' => 1, 'username' => 'anotherUser', 'created_at' => '2025-10-25 15:00:00'],
];
?>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘 뭐먹지? - 리뷰 상세</title>
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
        .nav-links a.login-btn { color: #4CAF50; font-weight: bold; } 
        .nav-links a.active { font-weight: bold; color: #000; }

        .container {
            width: 90%;
            max-width: 900px; /* 너비 통일 */
            margin: 0 auto; /* 중앙 정렬 */
            text-align: left;
        }

        .content-box {
            width: 100%; 
            box-sizing: border-box; 
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: left;
        }
        .content-box h2 {
            margin-top: 0;
            font-size: 28px;
        }
        .content-box .rating-score {
            font-size: 22px;  
            font-weight: bold;
            color: #333;       
            margin-bottom: 20px; 
        }
        
        .content-box .meta-info {
            font-size: 16px;
            color: #777;
            margin-bottom: 25px;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
        }
        .content-box .text-content {
            font-size: 1.1em;
            line-height: 1.7;
            min-height: 150px; 
            color: #333; /* 회색 글씨 방지 */
        }
        .comment-section {
            margin-top: 40px; /* 리뷰 본문과의 간격 */
        }
        .comment-section h3 {
            margin-top: 0;
            margin-bottom: 20px;
            text-align: center;
            font-size: 20px;
        }
        .comment-form textarea {
            width: 100%;
            min-height: 80px;
            padding: 10px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; 
            margin-bottom: 10px;
            font-family: "맑은 고딕", sans-serif; 
        }
        .comment-form button {
            background-color: #4CAF50; 
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            float: right; 
            font-size: 15px;
            font-weight: bold;
        }
        .comment-form button:hover {
            background-color: #45a049;
        }

        /* 댓글 목록 스타일 */
        .comment-list {
            margin-top: 70px; /* 댓글 폼(float)과의 간격 확보 */
            clear: both; /* float 해제 */
            border-top: 2px solid #f0f0f0; /* 폼과 목록 구분선 */
            padding-top: 10px;
        }
        .comment-item {
            padding: 15px 0;
            border-bottom: 1px solid #eee; /* 댓글 구분선 */
        }
        .comment-item:last-child {
            border-bottom: none; /* 마지막 댓글은 선 없음 */
        }
        .comment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }
        .comment-author {
            font-weight: bold;
            font-size: 16px;
            color: #000;
        }
        .comment-date {
            font-size: 14px;
            color: #888;
        }
        .comment-content {
            font-size: 15px;
            color: #333;
            line-height: 1.6;
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
        <div class="content-box">
            <h2><?php echo htmlspecialchars($review['menu_name']); ?></h2>
            <div class="rating-score">⭐ <?php echo htmlspecialchars($review['taste_rating']); ?>점</div>

            <div class="meta-info">
                <div> 작성자: <strong><?php echo htmlspecialchars($review['username']); ?></strong> | 
                    작성일: <?php echo date("Y-m-d", strtotime($review['created_at'])); ?>
                </div>
            </div> <div class="text-content"> <?php echo nl2br(htmlspecialchars($review['content'])); // nl2br: \n을 <br>로 변경 ?>
            </div>
            </div>


        <div class="content-box comment-section">
            
            <h3>댓글 작성</h3>
            <form class="comment-form" method="post" action="comment_process.php">
                <input type="hidden" name="review_id" value="<?php echo $review['review_id']; ?>">
                
                <textarea name="comment" placeholder="댓글을 입력하세요..."></textarea>
                <button type="submit">댓글 등록</button>
            </form>

            <div class="comment-list">
                <?php
                if (count($dummy_comments) > 0) {
                    foreach ($dummy_comments as $comment) {
                        ?>
                        <div class="comment-item">
                            <div class="comment-header">
                                <strong class="comment-author"><?php echo htmlspecialchars($comment['username']); ?></strong>
                                <span class="comment-date"><?php echo date("Y-m-d H:i", strtotime($comment['created_at'])); ?></span>
                            </div>
                            <div class="comment-content">
                                내취향 아님
                            </div>
                        </div>
                        <?php
                    }
                } else {
                    echo '<p style="text-align: center; color: #888;">아직 댓글이 없습니다.</p>';
                }
                ?>
            </div>

        </div>
        </div>
    </body>
</html>