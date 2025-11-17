<?php

// db 연결
require_once __DIR__ . '/db.php';

// 별점 상위 5개 고르는 sql문 (rating이 1개 이상 )
$sql = "SELECT *
FROM (
    SELECT 
        m.menu_id,
        m.menu_name,
        c.category_name,
        m.food_image_url,
        ROUND(AVG(r.taste_rating), 1) AS rating,
        COUNT(r.review_id) AS review_count,
        
        -- ⭐ RANK()로 순위 계산
        RANK() OVER (
            ORDER BY 
                ROUND(AVG(r.taste_rating), 1) DESC,
                COUNT(r.review_id) DESC,
                m.menu_id ASC
        ) AS ranking

    FROM Menus AS m
    JOIN Categories AS c 
        ON c.category_id = m.category_id
    LEFT JOIN Reviews AS r 
        ON r.menu_id = m.menu_id

    GROUP BY m.menu_id
) AS ranked

-- TOP 5만 가져오기
WHERE ranked.review_count >= 1
ORDER BY ranked.ranking ASC
LIMIT 5;
";
$res = $conn -> query($sql);

// [추가] (링크에 밑줄이 생기지 않도록 스타일 추가)
echo '
<style>
    .popular-menu-section .menu-item-link {
        text-decoration: none;
        color: inherit;
    }
</style>
';

echo '<div class="menu-container">';

if ($res -> num_rows > 0){
    while($row = $res-> fetch_assoc()){

        // [추가]
        $menu_id   = $row['menu_id'];
        
        $menu_name = htmlspecialchars($row['menu_name'] ?? '', ENT_QUOTES);
        $rating    = htmlspecialchars($row['rating'] ?? '', ENT_QUOTES);
        $category  = htmlspecialchars($row['category_name'] ?? '', ENT_QUOTES);
        $image_rel = htmlspecialchars($row['food_image_url'] ?? '', ENT_QUOTES);
        $img_src = '/team13/' . ltrim($image_rel, '/');

        // [추가] review_detail.php로 가는 링크 URL 생성
        $review_url = "review_detail.php?menu_id=" . $menu_id;

        echo '
      <a href="' . $review_url . '" class="menu-item-link">
        <div class="menu-item">
          <div class="menu-image">
            <img src="' . $img_src . '" alt="' . $menu_name . '" title="' . $menu_name . '">
          </div>
          <div class="menu-info">
            <p><strong>' . $menu_name . '</strong></p>
            <p>⭐ ' . $rating . '점 (' . (int)$row['review_count'] . '명)</p>
            <p>' . $category . '</p>
          </div>
        </div>
      </a>
    ';
  }
}

else {
  echo '<p>리뷰가 있는 메뉴가 없습니다.</p>';
}

echo '</div>';

$conn->close();
