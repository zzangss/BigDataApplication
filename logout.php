<?php
session_start();      // 1. 세션(통행증) 관리 시작
session_destroy();    // 2. 통행증(세션)을 파기함 (이게 핵심!)
header('Location: index.php'); // 3. 통행증이 없어진 상태로 index.php로 돌려보냄
exit;
?>