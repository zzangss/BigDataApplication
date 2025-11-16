<?php
session_start();
$is_logged_in = isset($_SESSION['user_id']) && !empty($_SESSION['user_id']);
// [수정] 현재 로그인한 유저 ID (로그인 안 했으면 0)
$current_user_id = $_SESSION['user_id'] ?? 0; 

// 1. URL에서 menu_id 가져오기 (필수!)
$menu_id = $_GET['menu_id'] ?? 0;
if (empty($menu_id)) {
    die("오류: 메뉴 ID가 없습니다.");
}

require_once __DIR__ . '/db.php';

// 2. [쿼리 1] 메뉴 정보 가져오기 (페이지 상단 표시용)
$sql_menu = "SELECT menu_name, food_image_url FROM Menus WHERE menu_id = ?";
$stmt_menu = $conn->prepare($sql_menu);
$stmt_menu->bind_param("i", $menu_id);
$stmt_menu->execute();
$menu_result = $stmt_menu->get_result();

if ($menu_result->num_rows === 0) {
    die("오류: 해당 메뉴를 찾을 수 없습니다.");
}
$menu = $menu_result->fetch_assoc();
$stmt_menu->close();

// 3. [쿼리 2] 해당 메뉴의 '모든' 리뷰 가져오기 (review_id 추가)
$sql_reviews = "SELECT 
                    R.review_id, 
                    R.taste_rating, 
                    R.content, 
                    R.created_at, 
                    U.username,
                    U.user_id -- [수정] 댓글 작성자와 비교하기 위해 리뷰 작성자 ID도 가져옴
                FROM Reviews AS R
                JOIN Users AS U ON R.user_id = U.user_id
                WHERE R.menu_id = ?
                ORDER BY R.created_at DESC"; // 최신순 정렬

$stmt_reviews = $conn->prepare($sql_reviews);
$stmt_reviews->bind_param("i", $menu_id);
$stmt_reviews->execute();
$reviews_result = $stmt_reviews->get_result();

// 4. [쿼리 3] 이 메뉴에 달린 '모든 댓글'을 한 번에 가져오기
$sql_comments = "SELECT 
                    C.comment_id, 
                    C.review_id, 
                    C.content, 
                    C.created_at, 
                    U.username,
                    U.user_id -- [수정] 댓글 삭제 버튼 표시에 필요
                 FROM Comments AS C
                 JOIN Users AS U ON C.user_id = U.user_id
                 JOIN Reviews AS R ON C.review_id = R.review_id
                 WHERE R.menu_id = ?
                 ORDER BY C.created_at ASC"; // 오래된 순서

$stmt_comments = $conn->prepare($sql_comments);
$stmt_comments->bind_param("i", $menu_id);
$stmt_comments->execute();
$comments_result = $stmt_comments->get_result();

// [신규] 댓글을 review_id 기준으로 재정렬 (PHP에서 처리)
$comments_by_review = [];
if ($comments_result->num_rows > 0) {
    while ($comment = $comments_result->fetch_assoc()) {
        $comments_by_review[$comment['review_id']][] = $comment;
    }
}
$stmt_comments->close();

?>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title><?php echo htmlspecialchars($menu['menu_name']); ?> - 리뷰</title>
    <style>
        /* (헤더 스타일 등은 menu.php와 동일) */
        body { font-family: "맑은 고딕", sans-serif; background-color: #fafafa; text-align: center; padding-top: 120px; padding-bottom: 40px; }
        header { position: fixed; top: 0; left: 0; width: 100%; height: 80px; background-color: white; display: flex; justify-content: space-between; align-items: center; padding: 0 40px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); box-sizing: border-box; }
        .logo { font-size: 24px; font-weight: bold; color: #333; text-decoration: none; }
        .nav-links a { margin-left: 25px; font-size: 16px; color: #555; text-decoration: underline; }
        .nav-links a:hover { color: #000; }
        .nav-links a.logout-btn { color: #d9534f; }
        .nav-links a.login-btn { color: #4CAF50; font-weight: bold; }

        .container { width: 90%; max-width: 800px; margin: 0 auto; text-align: left; }
        
        .menu-header { display: flex; align-items: center; background: white; padding: 20px; border-radius: 12px; box-shadow: 0 0 10px rgba(0,0,0,0.1); margin-bottom: 30px; }
        .menu-header img { width: 150px; height: 150px; object-fit: cover; border-radius: 8px; margin-right: 20px; }
        .menu-header h2 { margin: 0; font-size: 28px; }

        .review-list { list-style: none; padding: 0; }
        .review-list li { background: white; padding: 20px; border-radius: 12px; box-shadow: 0 0 10px rgba(0,0,0,0.1); margin-bottom: 15px; }
        .review-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px; border-bottom: 1px solid #eee; padding-bottom: 10px; }
        .review-header strong { font-size: 18px; }
        .review-header span { font-size: 16px; color: #E9A426; } /* 별점 */
        .review-body { color: #333; line-height: 1.6; margin-bottom: 10px; }
        .review-footer { font-size: 13px; color: #888; text-align: right; }
        
        .comments-section { background-color: #f9f9f9; border-top: 1px solid #eee; margin-top: 20px; padding: 15px; border-radius: 0 0 8px 8px; }
        .comments-section h4 { margin-top: 0; margin-bottom: 10px; font-size: 15px; }
        .comment-list { list-style: none; padding: 0; margin: 0 0 15px 0; }
        .comment-list li {
            background-color: #fff; padding: 10px; border: 1px solid #eee; border-radius: 5px; margin-bottom: 8px; font-size: 14px;
            /* [수정] 삭제 버튼을 위한 flex */
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .comment-content { flex-grow: 1; } /* [신규] 댓글 내용 영역 */
        .comment-list strong { font-size: 14px; color: #000; margin-right: 8px; }
        .comment-list span { font-size: 12px; color: #999; } /* 날짜는 이제 float:right 아님 */
        .comment-list p { margin: 5px 0 0 0; color: #333; }
        
        /* [신규] 댓글 삭제 버튼 스타일 */
        .comment-delete-form {
            margin: 0;
            padding: 0;
            flex-shrink: 0;
            margin-left: 10px;
        }
        .comment-delete-btn {
            background: #ddd;
            color: #777;
            border: none;
            width: 25px;
            height: 25px;
            border-radius: 50%;
            cursor: pointer;
            font-weight: bold;
            font-size: 12px;
            line-height: 25px;
            text-align: center;
        }
        .comment-delete-btn:hover { background: #d9534f; color: white; }

        /* 댓글 폼 스타일 (각 리뷰 내부용) */
        .comment-form { display: flex; gap: 10px; }
        .comment-form textarea { width: 100%; flex-grow: 1; height: 40px; padding: 10px; border: 1px solid #ccc; border-radius: 8px; box-sizing: border-box; resize: vertical; font-size: 14px; }
        .comment-form button { display: inline-block; margin-top: 0; padding: 10px 15px; font-size: 14px; background-color: #555; color: white; border: none; border-radius: 8px; cursor: pointer; flex-shrink: 0; }
        .comment-form button:hover { background-color: #333; }
        .comment-form button:disabled { background-color: #aaa; }
        
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
        <!-- 1. 메뉴 정보 (DB에서 불러옴) -->
        <div class="menu-header">
            <img src="/team13/<?php echo ltrim(htmlspecialchars($menu['food_image_url']), '/'); ?>" alt="<?php echo htmlspecialchars($menu['menu_name']); ?>">
            <h2><?php echo htmlspecialchars($menu['menu_name']); ?></h2>
        </div>

        <!-- 댓글 등록/삭제 결과 메시지 -->
        <?php if (isset($_GET['comment_success'])): ?>
            <div class="message success"><?php echo htmlspecialchars($_GET['comment_success']); ?></div>
        <?php elseif (isset($_GET['comment_error'])): ?>
            <div class="message error"><?php echo htmlspecialchars($_GET['comment_error']); ?></div>
        <?php endif; ?>
        <!-- [신규] 삭제 메시지 -->
        <?php if (isset($_GET['delete_success'])): ?>
            <div class="message success"><?php echo htmlspecialchars($_GET['delete_success']); ?></div>
        <?php elseif (isset($_GET['delete_error'])): ?>
            <div class="message error"><?php echo htmlspecialchars($_GET['delete_error']); ?></div>
        <?php endif; ?>


        <!-- 2. 리뷰 목록 (DB에서 불러옴) -->
        <h3>전체 리뷰</h3>
        <ul class="review-list">
            <?php if ($reviews_result->num_rows > 0): ?>
                <?php while($review = $reviews_result->fetch_assoc()): ?>
                    <li>
                        <!-- (리뷰 내용) -->
                        <div class="review-header">
                            <strong><?php echo htmlspecialchars($review['username']); ?></strong>
                            <span>⭐ <?php echo htmlspecialchars($review['taste_rating']); ?>점</span>
                        </div>
                        <div class="review-body">
                            <p><?php echo nl2br(htmlspecialchars($review['content'])); ?></p>
                        </div>
                        <div class="review-footer">
                            <?php echo htmlspecialchars($review['created_at']); ?>
                        </div>

                        <!-- 댓글 섹션 -->
                        <div class="comments-section">
                            <h4>댓글</h4>
                            
                            <!-- 댓글 목록 표시 -->
                            <ul class="comment-list">
                                <?php if (isset($comments_by_review[$review['review_id']])): ?>
                                    <?php foreach ($comments_by_review[$review['review_id']] as $comment): ?>
                                        <li>
                                            <!-- [수정] div로 감싸기 -->
                                            <div class="comment-content">
                                                <strong><?php echo htmlspecialchars($comment['username']); ?></strong>
                                                <span><?php echo htmlspecialchars($comment['created_at']); ?></span>
                                                <p><?php echo nl2br(htmlspecialchars($comment['content'])); ?></p>
                                            </div>

                                            <!-- [!! 신규 !!] 댓글 삭제 폼 -->
                                            <?php if ($current_user_id == $comment['user_id']): ?>
                                                <form class="comment-delete-form" method="POST" action="comment_delete.php" onsubmit="return confirm('이 댓글을 삭제하시겠습니까?');">
                                                    <input type="hidden" name="comment_id" value="<?php echo $comment['comment_id']; ?>">
                                                    <input type="hidden" name="menu_id" value="<?php echo $menu_id; ?>"> <!-- 돌아오기용 -->
                                                    <button type="submit" class="comment-delete-btn" title="댓글 삭제">X</button>
                                                </form>
                                            <?php endif; ?>
                                        </li>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <li style="border:none; background:none; font-size: 13px; color: #888;">댓글이 없습니다.</li>
                                <?php endif; ?>
                            </ul>

                            <!-- 댓글 작성 폼 -->
                            <form class="comment-form" method="POST" action="comment_process.php">
                                <textarea name="comment_content" placeholder="댓글을 입력하세요..." required <?php echo !$is_logged_in ? 'disabled' : ''; ?>></textarea>
                                
                                <input type="hidden" name="review_id" value="<?php echo $review['review_id']; ?>">
                                <input type="hidden" name="menu_id" value="<?php echo $menu_id; ?>">
                                
                                <button type="submit" <?php echo !$is_logged_in ? 'disabled' : ''; ?>>
                                    <?php echo $is_logged_in ? '등록' : '...'; ?>
                                </button>
                            </form>
                        </div>
                    </li>
                <?php endwhile; ?>
            <?php else: ?>
                <li><p>작성된 리뷰가 없습니다. 첫 번째 리뷰를 남겨주세요!</p></li>
            <?php endif; ?>
        </ul>
        
    </div>

</body>
</html>
<?php 
$reviews_result->close();
$conn->close(); 
?>