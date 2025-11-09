<?php

require_once __DIR__ . '/db.php';

// 1. form 값 수신
if (session_status() === PHP_SESSION_NONE) session_start();
$ageSel     = isset($age)     && $age     !== '' ? $age     : ($_SESSION['filters']['age']     ?? null);
$weatherSel = isset($weather) && $weather !== '' ? $weather : ($_SESSION['filters']['weather'] ?? null);


// 2. 매핑 (한글 → 범위/enum)
$ageRanges = [
    '10대' => [10,19],
    '20대' => [20,29],
    '30대' => [30,39],
    '40대' => [40,49],
  ];
  $weatherMap = [
    '맑음' => 'sunny',
    '비'   => 'rainy',
    '흐림' => 'cloudy',
  ];
  
  // 3. 유효성 체크
  if (!isset($ageRanges[$ageSel]) || !isset($weatherMap[$weatherSel])) {
    exit('연령대/날씨를 올바르게 선택하세요.');
  }
  [$ageMin, $ageMax] = $ageRanges[$ageSel];
  $cond = $weatherMap[$weatherSel];
  
  // 4. 쿼리 

  $sql = "  SELECT
  c.category_id,
  c.category_name,
  COALESCE(
    ROUND(AVG(
      CASE
        WHEN wc.condition_name = ?  -- 날씨
         AND (YEAR(CURDATE()) - up.birth_year) BETWEEN ? AND ?  -- 나이
      THEN r.taste_rating
      END
    ), 1),
    0
  ) AS avg_rating,
  COALESCE(
    SUM(
      CASE
        WHEN wc.condition_name = ?
         AND (YEAR(CURDATE()) - up.birth_year) BETWEEN ? AND ?
      THEN 1 ELSE 0
      END
    ),
    0
  ) AS review_count
FROM Categories c
LEFT JOIN Menus m
       ON m.category_id = c.category_id
LEFT JOIN Reviews r
       ON r.menu_id = m.menu_id
LEFT JOIN UserProfile up
       ON up.user_id = r.user_id
LEFT JOIN WeatherLog wl
       ON wl.log_date = DATE(r.created_at)
LEFT JOIN WeatherConditions wc
       ON wc.condition_id = wl.condition_id
GROUP BY c.category_id, c.category_name
ORDER BY avg_rating DESC, review_count DESC, c.category_name ASC;
";

$stmt = $conn->prepare($sql);
$stmt->bind_param('siisii', $cond, $ageMin, $ageMax, $cond, $ageMin, $ageMax);

$stmt->execute();
$res = $stmt->get_result();

echo "<h3>🍱 카테고리별 선호도</h3>";
echo "<table border='1' cellspacing='0' cellpadding='8' style='border-collapse:collapse; margin-top:10px; text-align:center; width:100%;'>";
echo "<tr style='background:#f0f0f0;'>
        <th>카테고리</th>
        <th>평균 별점</th>
        <th>리뷰 수</th>
      </tr>";

if ($res->num_rows > 0) {
  while ($row = $res->fetch_assoc()) {
    $category = htmlspecialchars($row['category_name'], ENT_QUOTES, 'UTF-8');
    $avg      = htmlspecialchars($row['avg_rating'], ENT_QUOTES, 'UTF-8');
    $count    = (int)$row['review_count'];

    echo "<tr>
            <td>{$category}</td>
            <td>{$avg}</td>
            <td>{$count}</td>
          </tr>";
  }
} else {
  echo "<tr><td colspan='3'>데이터가 없습니다.</td></tr>";
}

echo "</table>";

$stmt->close();
?>