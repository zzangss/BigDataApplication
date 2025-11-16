<?php
// 1. 세션 시작 및 로그인 검사
require_once __DIR__ . '/auth_check.php';
// $current_user_id (로그인한 사용자 id) 사용 가능

// 2. DB 연결
require_once __DIR__ . '/db.php';

// 3. 폼 데이터 받기
$menu_id = $_POST['menu_id'] ?? 0;
$log_date = $_POST['log_date'] ?? '';       // 폼에서 '2023-11-10' 같은 날짜 값을 받음
$taste_rating = $_POST['taste_rating'] ?? 0;
$content = $_POST['content'] ?? '';         // 컬럼명 'content'

// 4. 유효성 검사
if (empty($menu_id) || empty($log_date) || empty($taste_rating)) {
    header('Location: review.php?review_error=메뉴, 날짜, 맛 별점은 필수입니다.');
    exit();
}

try {
    // 5. [DB 등록] Reviews 테이블에 INSERT
    $sql = "INSERT INTO Reviews (user_id, menu_id, log_date, taste_rating, content) 
            VALUES (?, ?, ?, ?, ?)";
    
    $stmt = $conn->prepare($sql);
    
    // bind_param 타입: i(user_id), i(menu_id), s(log_date), i(taste_rating), s(content)
    $stmt->bind_param("iisis", 
        $current_user_id, 
        $menu_id, 
        $log_date, 
        $taste_rating, 
        $content
    );
    $stmt->execute();

    // 6. 성공
    if ($stmt->affected_rows > 0) {
        // [!!] ------------ (수정된 부분) ------------ [!!]
        // 성공 시, mypage.php가 아닌 review.php로 리다이렉션
        header('Location: review.php?review_success=리뷰가 성공적으로 등록되었습니다.');
        // [!!] ---------------------------------------- [!!]
    } else {
        throw new Exception("리뷰가 등록되지 않았습니다.");
    }
    exit();

} catch (mysqli_sql_exception $exception) {
    // [실패]
    if ($exception->getCode() == 1062) { // 중복 키 오류
         header('Location: review.php?review_error=이미 해당 메뉴/날짜에 대한 리뷰를 작성하셨습니다.');
    } else if ($exception->getCode() == 1452) { // 외래 키 오류
         header('Location: review.php?review_error=선택한 메뉴 또는 날짜가 유효하지 않습니다.');
    }
     else {
         header('Location: review.php?review_error=DB 오류: ' . $exception->getMessage());
    }
    exit();
} catch (Exception $e) {
    header('Location: review.php?review_error=' . $e->getMessage());
    exit();
}
?>