<?php
// 1. 세션 시작 및 로그인 검사
require_once __DIR__ . '/auth_check.php';
// $current_user_id 사용 가능

// 2. DB 연결
require_once __DIR__ . '/db.php';

// 3. 폼 데이터(POST) 받기
$comment_content = $_POST['comment_content'] ?? '';
$review_id = $_POST['review_id'] ?? 0;
$menu_id = $_POST['menu_id'] ?? 0; // [!!] 리다이렉션(돌아가기) 용도

// 4. 유효성 검사
if (empty($comment_content)) {
    header('Location: review_detail.php?menu_id=' . $menu_id . '&comment_error=댓글 내용을 입력해주세요.');
    exit();
}
if (empty($review_id) || empty($menu_id)) {
    header('Location: index.php?comment_error=잘못된 접근입니다.'); // (review_id나 menu_id가 없음)
    exit();
}

try {
    // 5. [DB 등록] Comments 테이블에 INSERT
    $sql = "INSERT INTO Comments (review_id, user_id, content) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    
    // bind_param 타입: i(review_id), i(user_id), s(content)
    $stmt->bind_param("iis", 
        $review_id, 
        $current_user_id, 
        $comment_content
    );
    $stmt->execute();

    // 6. 성공
    if ($stmt->affected_rows > 0) {
        // 성공 시, 방금 댓글을 단 그 메뉴 상세 페이지로 이동
        header('Location: review_detail.php?menu_id=' . $menu_id . '&comment_success=댓글이 등록되었습니다.');
    } else {
        throw new Exception("댓글이 등록되지 않았습니다.");
    }
    exit();

} catch (mysqli_sql_exception $exception) {
    // [실패] (예: review_id가 잘못되었거나 (FK 오류))
    header('Location: review_detail.php?menu_id=' . $menu_id . '&comment_error=DB 오류: ' . $exception->getMessage());
    exit();
}
?>