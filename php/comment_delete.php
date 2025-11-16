<?php
// 1. 세션 시작 및 로그인 검사 (필수!)
require_once __DIR__ . '/auth_check.php';
// $current_user_id 사용 가능

// 2. DB 연결
require_once __DIR__ . '/db.php';

// 3. 폼 데이터(POST) 받기
$comment_id = $_POST['comment_id'] ?? 0;
$menu_id = $_POST['menu_id'] ?? 0; // [!!] 리다이렉션(돌아가기) 용도

// 4. 유효성 검사
if (empty($comment_id) || empty($menu_id)) {
    // menu_id가 없으면 review_detail.php로 돌아갈 수 없음
    header('Location: index.php?delete_error=잘못된 접근입니다.');
    exit();
}

try {
    // 5. [DB 삭제] 
    // [보안] comment_id와 user_id가 '둘 다' 일치하는 댓글만 삭제
    $sql = "DELETE FROM Comments WHERE comment_id = ? AND user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $comment_id, $current_user_id);
    $stmt->execute();

    // 6. 성공/실패 확인
    if ($stmt->affected_rows > 0) {
        // (1줄이 삭제되었으면 성공)
        header('Location: review_detail.php?menu_id=' . $menu_id . '&delete_success=댓글이 삭제되었습니다.');
    } else {
        // (0줄이 삭제되었으면, 본인 댓글이 아니거나(해킹 시도) 이미 삭제된 댓글)
        throw new Exception("삭제 권한이 없거나 이미 삭제된 댓글입니다.");
    }
    exit();

} catch (Exception $e) {
    header('Location: review_detail.php?menu_id=' . $menu_id . '&delete_error=' . $e->getMessage());
    exit();
}
?>