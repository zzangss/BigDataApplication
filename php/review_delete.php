<?php
// 1. 세션 시작 및 로그인 검사
require_once __DIR__ . '/auth_check.php';
// $current_user_id 사용 가능

// 2. DB 연결
require_once __DIR__ . '/db.php';

// 3. 폼 데이터(POST) 받기
$review_id = $_POST['review_id'] ?? 0;

// 4. 유효성 검사
if (empty($review_id)) {
    header('Location: mypage.php?delete_error=삭제할 리뷰를 찾을 수 없습니다.');
    exit();
}

try {
    // 5. [보안] 삭제하려는 리뷰가 정말 '내'가 쓴 리뷰인지 확인
    $sql_check = "SELECT user_id FROM Reviews WHERE review_id = ?";
    $stmt_check = $conn->prepare($sql_check);
    $stmt_check->bind_param("i", $review_id);
    $stmt_check->execute();
    $result_check = $stmt_check->get_result();
    
    if ($result_check->num_rows === 1) {
        $review = $result_check->fetch_assoc();
        
        if ($review['user_id'] == $current_user_id) {
            // 6. [DB 삭제] 내 리뷰가 맞으므로 삭제 실행
            $sql_delete = "DELETE FROM Reviews WHERE review_id = ?";
            $stmt_delete = $conn->prepare($sql_delete);
            $stmt_delete->bind_param("i", $review_id);
            $stmt_delete->execute();
            
            if ($stmt_delete->affected_rows > 0) {
                header('Location: mypage.php?delete_success=리뷰가 삭제되었습니다.');
            } else {
                throw new Exception("리뷰 삭제에 실패했습니다.");
            }
        } else {
            // 내 리뷰가 아님 (해킹 시도)
            throw new Exception("삭제 권한이 없습니다.");
        }
    } else {
        // 해당 리뷰 ID 없음
        throw new Exception("삭제할 리뷰가 존재하지 않습니다.");
    }
    
    exit();

} catch (Exception $e) {
    header('Location: mypage.php?delete_error=' . $e->getMessage());
    exit();
}
?>