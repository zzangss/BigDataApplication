<?php
// 500 오류 추적을 위해 맨 위에 추가
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start(); // 1. 세션은 항상 시작

// 2. 로그인 여부를 변수에 저장
$is_logged_in = isset($_SESSION['user_id']) && !empty($_SESSION['user_id']);

// 3. DB 연결
require_once __DIR__ . '/db.php';

// 4. 현재 선택된 카테고리 ID 가져오기 (GET 파라미터)
$current_category_id = $_GET['category_id'] ?? 0;

// 5. 카테고리 목록 불러오기 (필터 링크 생성용)
$sql_categories = "SELECT category_id, category_name FROM Categories ORDER BY category_id";
$category_result = $conn->query($sql_categories);
$categories = $category_result->fetch_all(MYSQLI_ASSOC);

// 6. 메뉴 목록 불러오기 (동적 쿼리)
$sql_menus = "SELECT M.menu_id, M.menu_name, C.category_name, M.food_image_url 
              FROM Menus AS M
              JOIN Categories AS C ON M.category_id = C.category_id";

if (!empty($current_category_id)) {
    // 특정 카테고리가 선택된 경우
    $sql_menus .= " WHERE M.category_id = ?";
}

// '전체'일 경우 최신순, 카테고리 선택 시 이름순
if (empty($current_category_id)) {
    // [!!] '전체': 최신순 정렬 (M.created_at -> M.menu_id) [!!]
    $sql_menus .= " ORDER BY M.menu_id DESC";
} else {
    // '카테고리': 이름순 정렬
    $sql_menus .= " ORDER BY M.menu_name ASC";
}

$stmt_menus = $conn->prepare($sql_menus);

if (!empty($current_category_id)) {
    // Prepared Statement에 category_id 바인딩
    $stmt_menus->bind_param("i", $current_category_id);
}

$stmt_menus->execute();
$menu_result = $stmt_menus->get_result();

?>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘 뭐먹지? - 메뉴리뷰</title>
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
            max-width: 900px;
            margin: 0 auto;
            text-align: left;
        }
        
        .filter-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 25px;
            flex-wrap: wrap;
        }
        .category-nav {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .category-nav a {
            display: inline-block;
            padding: 8px 15px;
            border: 1px solid #ccc;
            border-radius: 20px;
            text-decoration: none;
            color: #555;
            transition: all 0.2s;
            font-size: 15px;
        }
        .category-nav a:hover {
            background-color: #eee;
        }
        .category-nav a.current {
            background-color: #4CAF50;
            color: white;
            border-color: #4CAF50;
            font-weight: bold;
        }

        .review-button {
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            border-radius: 8px;
            flex-shrink: 0;
        }
        .review-button:hover {
            background-color: #45a049;
        }

        .menu-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .menu-item {
            width: 200px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 12px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            text-decoration: none;
            color: #333;
            transition: transform 0.2s ease;
            overflow: hidden;
        }
        .menu-item:hover {
            transform: translateY(-5px);
        }
        .menu-image img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-bottom: 1px solid #eee;
        }
        .menu-info {
            padding: 15px;
            text-align: center;
        }
        .menu-info h3 {
            margin: 0 0 5px 0;
            font-size: 18px;
        }
        .menu-info p {
            margin: 0;
            font-size: 14px;
            color: #777;
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
        <h2>메뉴 리뷰</h2>
        
        <div class="filter-bar">
            <!-- 1. 동적 카테고리 필터 -->
            <nav class="category-nav">
                <!-- '전체' 링크 -->
                <a href="menu.php" class="<?php echo (empty($current_category_id)) ? 'current' : ''; ?>">
                    전체
                </a>
                <!-- DB에서 불러온 카테고리 링크 -->
                <?php foreach ($categories as $category): ?>
                    <a href="menu.php?category_id=<?php echo $category['category_id']; ?>" 
                       class="<?php echo ($current_category_id == $category['category_id']) ? 'current' : ''; ?>">
                        <?php echo htmlspecialchars($category['category_name']); ?>
                    </a>
                <?php endforeach; ?>
            </nav>
            
            <!-- 2. 리뷰쓰기 버튼 (로그인 시에만) -->
            <?php if ($is_logged_in): ?>
            <div>
                <a href="review.php" class="review-button">리뷰쓰기</a>
            </div>
            <?php endif; ?>
        </div>
        
        <!-- 메뉴 그리드 (DB에서 동적 생성) -->
        <div class="menu-container">
            <?php if ($menu_result->num_rows > 0): ?>
                <?php while($menu = $menu_result->fetch_assoc()): ?>
                    <!-- review_detail.php로 menu_id를 전달하는 링크 -->
                    <a href="review_detail.php?menu_id=<?php echo $menu['menu_id']; ?>" class="menu-item">
                        <div class="menu-image">
                            <img src="/team13/<?php echo ltrim(htmlspecialchars($menu['food_image_url']), '/'); ?>" alt="<?php echo htmlspecialchars($menu['menu_name']); ?>">
                        </div>
                        <div class="menu-info">
                            <h3><?php echo htmlspecialchars($menu['menu_name']); ?></h3>
                            <p><?php echo htmlspecialchars($menu['category_name']); ?></p>
                        </div>
                    </a>
                <?php endwhile; ?>
            <?php else: ?>
                <p>해당 카테고리에 메뉴가 없습니다.</p>
            <?php endif; ?>
        </div>

    </div>
</body>
</html>
<?php 
// DB 연결 닫기
$category_result->close();
$stmt_menus->close();
$conn->close(); 
?>