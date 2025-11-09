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
    '눈' => 'snowy', // 스키마 enum에 없음
  ];
  
  // 3. 유효성 체크
  if (!isset($ageRanges[$ageSel]) || !isset($weatherMap[$weatherSel])) {
    exit('연령대/날씨를 올바르게 선택하세요.');
  }
  [$ageMin, $ageMax] = $ageRanges[$ageSel];
  $cond = $weatherMap[$weatherSel];
  
  // 4. 쿼리 

  $sql = "  SELECT m.menu_id, m.menu_name,
                ROUND(AVG(r.taste_rating),1) AS avg_rating,
                COUNT(r.review_id) AS review_count
            FROM Reviews r
                JOIN UserProfile up ON up.user_id = r.user_id
                JOIN Menus m ON m.menu_id = r.menu_id
                JOIN WeatherLog wl ON wl.log_date = DATE(r.created_at)
                JOIN WeatherConditions wc ON wc.condition_id = wl.condition_id
            WHERE wc.condition_name = ?
                AND (YEAR(CURDATE()) - up.birth_year) BETWEEN ? AND ?
            GROUP BY m.menu_id
            HAVING review_count >=1
            ORDER BY avg_rating DESC, review_count DESC, m.menu_id ASC
            LIMIT 3;";

$stmt = $conn->prepare($sql);
$stmt->bind_param('sii', $cond, $ageMin, $ageMax);
$stmt->execute();
$res = $stmt->get_result();

echo "<h3>💫 나에게 맞는 메뉴 Top 3</h3>";
echo "<table border='1' cellspacing='0' cellpadding='8' style='margin-top:10px; border-collapse:collapse; text-align:center;'>";
echo "<tr style='background:#f0f0f0;'>
        <th>순위</th>
        <th>메뉴명</th>
        <th>평균 별점</th>
      </tr>";

$rank = 1;
if ($res->num_rows > 0) {
    while ($row = $res->fetch_assoc()) {
        $menu_name = htmlspecialchars($row['menu_name'], ENT_QUOTES, 'UTF-8');
        $avg_rating = htmlspecialchars($row['avg_rating'], ENT_QUOTES, 'UTF-8');

        echo "<tr>
                <td>{$rank}</td>
                <td>{$menu_name}</td>
                <td>{$avg_rating}</td>
              </tr>";
        $rank++;
    }
} else {
    echo "<tr><td colspan='3'>조건에 맞는 메뉴가 없습니다.</td></tr>";
}

echo "</table>";