<?php

require_once __DIR__ . '/db.php';
  
  // 4. 쿼리 

  $sql = " SELECT
  CASE
    WHEN age_band IS NULL AND weather IS NULL THEN '[전체]'         -- 전체 합계
    WHEN weather   IS NULL THEN CONCAT('[', age_band, ' 소계]')     -- 연령대 소계
    ELSE age_band                                                   -- 상세 행은 연령대 그대로
  END AS age_label,
  CASE
    WHEN age_band IS NULL AND weather IS NULL THEN ''               -- 전체 행은 날씨 공란
    WHEN weather   IS NULL THEN ''                                  -- 소계 행도 공란
    ELSE CASE weather                                               -- 상세 행은 날씨 한글 표시
           WHEN 'sunny'  THEN '맑음'
           WHEN 'rainy'  THEN '비'
           WHEN 'cloudy' THEN '흐림'
         END
  END AS weather_label,
  COUNT(*) AS review_count
FROM (
  SELECT
    CASE
      WHEN (YEAR(CURDATE()) - up.birth_year) BETWEEN 10 AND 19 THEN '10대'
      WHEN (YEAR(CURDATE()) - up.birth_year) BETWEEN 20 AND 29 THEN '20대'
      WHEN (YEAR(CURDATE()) - up.birth_year) BETWEEN 30 AND 39 THEN '30대'
      WHEN (YEAR(CURDATE()) - up.birth_year) BETWEEN 40 AND 49 THEN '40대'
      ELSE NULL  -- 제외
    END AS age_band,
    wc.condition_name AS weather
  FROM Reviews r
  JOIN UserProfile       up ON up.user_id      = r.user_id
  JOIN WeatherLog        wl ON wl.log_date     = DATE(r.created_at)
  JOIN WeatherConditions wc ON wc.condition_id = wl.condition_id
) t
WHERE age_band IS NOT NULL
GROUP BY age_band, weather WITH ROLLUP
;
";

$res = $conn->query($sql);

echo "<h3>📊 연령/날씨별 리뷰 통계 (ROLLUP)</h3>";
echo "<table border='1' cellspacing='0' cellpadding='8' style='border-collapse:collapse; width:100%; text-align:center;'>";
echo "  <tr style='background:#f0f0f0;'>
          <th>연령대</th>
          <th>날씨</th>
          <th>리뷰 수</th>
        </tr>";

if ($res && $res->num_rows > 0) {
  while ($row = $res->fetch_assoc()) {
    $ageLabel  = htmlspecialchars($row['age_label']    ?? '', ENT_QUOTES, 'UTF-8');
    $wLabel    = htmlspecialchars($row['weather_label']?? '', ENT_QUOTES, 'UTF-8');
    $cnt       = (int)($row['review_count'] ?? 0);

    // 총계/소계 강조
    $isTotal  = ($ageLabel === '[전체]');
    $isSubtot = (strpos($ageLabel, '소계') !== false);

    $rowStyle = $isTotal ? "style='font-weight:bold; background:#fff6d8;'" :
               ($isSubtot ? "style='font-weight:bold; background:#f9fbff;'" : "");

    echo "<tr {$rowStyle}>
            <td>{$ageLabel}</td>
            <td>" . ($wLabel === '' ? '-' : $wLabel) . "</td>
            <td>{$cnt}</td>
          </tr>";
  }
} else {
  echo "<tr><td colspan='3'>데이터가 없습니다.</td></tr>";
}
echo "</table>";

$conn->close();
?>