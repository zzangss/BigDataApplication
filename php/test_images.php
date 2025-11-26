<?php
// --- 1. DB 연결 설정 (teamXX 부분 수정!) ---
$db_host = 'localhost';
$db_user = 'team13'; // 본인 팀 ID (예: team05)
$db_pass = 'team13'; // 본인 팀 비밀번호
$db_name = 'team13'; // 본인 DB 이름

$conn = new mysqli($db_host, $db_user, $db_pass, $db_name);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "<h1>✅ DB Connection Successful!</h1>";
echo "<h2>DB에서 25개 메뉴 이미지 경로를 읽어옵니다...</h2><hr>";

// --- 2. SQL 실행 ---
$sql = "SELECT menu_name, food_image_url FROM Menus ORDER BY category_id, menu_id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // --- 3. 결과 Loop ---
    while($row = $result->fetch_assoc()) {
        $menu_name = htmlspecialchars($row['menu_name']);
        $image_path = htmlspecialchars($row['food_image_url']);

        // --- 4. HTML로 출력 ---
        echo "<div style='border:1px solid #ccc; padding:10px; margin:5px; display:inline-block;'>";
        echo "<strong>" . $menu_name . "</strong><br>";
        echo "DB Path: <code>" . $image_path . "</code><br>";

        // <img> 태그로 이미지 로드 시도
        echo "<img src='/how2React/BigDataApplication/" . $image_path . "' 
           alt='" . $menu_name . "' 
           width='150' 
           title='" . $menu_name . "'>";


        echo "</div>";
    }
} else {
    echo "0 results found in Menus table.";
}

$conn->close();
?>