<?php
// 댓글 리스트를 DB에서 불러와 출력하는 독립 모듈
require_once __DIR__ . '/db.php';

// 1. review_id 받아오기
$review_id = $_GET['id'] ?? $review_id ?? null;
if (!$review_id) {
    echo '<p style="text-align:center;color:#888;">리뷰 ID가 없습니다.</p>';
    return;
}

// 2. DB 조회
$stmt = $conn->prepare("
  SELECT c.comment_id, c.content, c.created_at, u.username
  FROM Comments c
  JOIN Users u ON u.user_id = c.user_id
  WHERE c.review_id = ?
  ORDER BY c.created_at DESC
");
$stmt->bind_param('i', $review_id);
$stmt->execute();
$comments = $stmt->get_result();
?>

<!-- 3. 댓글 리스트 출력 -->
<div class="comment-list">
  <?php if ($comments && $comments->num_rows > 0): ?>
    <?php while ($row = $comments->fetch_assoc()): ?>
      <div class="comment-item">
        <div class="comment-header">
          <strong class="comment-author">
            <?= htmlspecialchars($row['username'] ?? '익명', ENT_QUOTES, 'UTF-8') ?>
          </strong>
          <span class="comment-date">
            <?= htmlspecialchars(date("Y-m-d H:i", strtotime($row['created_at'])), ENT_QUOTES, 'UTF-8') ?>
          </span>
        </div>
        <div class="comment-content">
          <?= nl2br(htmlspecialchars($row['content'] ?? '', ENT_QUOTES, 'UTF-8')) ?>
        </div>
      </div>
    <?php endwhile; ?>
  <?php else: ?>
    <p style="text-align: center; color: #888;">아직 댓글이 없습니다.</p>
  <?php endif; ?>
</div>

<?php
$stmt->close();
$conn->close(); // 전체 페이지에서 한 번만 닫기
?>
