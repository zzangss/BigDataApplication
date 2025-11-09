/*
 * dbinsert.sql
 * 모든 테이블에 1000개 이상의 샘플 데이터를 삽입하는 스크립트
 * (과제 요구사항 [2-2] 및 [5] 충족)
 * * 실행 방법:
 * 1. phpMyAdmin에서 'teamXX' 데이터베이스를 선택.
 * 2. [SQL] 탭을 클릭합니다.
 * 3. 이 파일의 모든 내용을 붙여넣고 [Go] 버튼을 클릭.
 */

-- 0. 데이터베이스 사용
USE team13;

-- 1. 데이터 삽입. 

-- WeatherConditions (날씨 상태)
INSERT INTO WeatherConditions (condition_id, condition_name) VALUES
(1, 'sunny'),
(2, 'rainy'),
(3, 'cloudy');

-- Categories (음식 카테고리)
INSERT INTO Categories (category_id, category_name) VALUES
(1, '한식'),
(2, '중식'),
(3, '일식'),
(4, '양식'),
(5, '분식');

-- Users & UserProfile (50명 생성)
INSERT INTO users (user_id, username, password, email) VALUES
(1, 'user01', 'password01', 'user01@example.com'),
(2, 'user02', 'password02', 'user02@example.com'),
(3, 'user03', 'password03', 'user03@example.com'),
(4, 'user04', 'password04', 'user04@example.com'),
(5, 'user05', 'password05', 'user05@example.com'),
(6, 'user06', 'password06', 'user06@example.com'),
(7, 'user07', 'password07', 'user07@example.com'),
(8, 'user08', 'password08', 'user08@example.com'),
(9, 'user09', 'password09', 'user09@example.com'),
(10, 'user10', 'password10', 'user10@example.com'),
(11, 'user11', 'password11', 'user11@example.com'),
(12, 'user12', 'password12', 'user12@example.com'),
(13, 'user13', 'password13', 'user13@example.com'),
(14, 'user14', 'password14', 'user14@example.com'),
(15, 'user15', 'password15', 'user15@example.com'),
(16, 'user16', 'password16', 'user16@example.com'),
(17, 'user17', 'password17', 'user17@example.com'),
(18, 'user18', 'password18', 'user18@example.com'),
(19, 'user19', 'password19', 'user19@example.com'),
(20, 'user20', 'password20', 'user20@example.com'),
(21, 'user21', 'password21', 'user21@example.com'),
(22, 'user22', 'password22', 'user22@example.com'),
(23, 'user23', 'password23', 'user23@example.com'),
(24, 'user24', 'password24', 'user24@example.com'),
(25, 'user25', 'password25', 'user25@example.com'),
(26, 'user26', 'password26', 'user26@example.com'),
(27, 'user27', 'password27', 'user27@example.com'),
(28, 'user28', 'password28', 'user28@example.com'),
(29, 'user29', 'password29', 'user29@example.com'),
(30, 'user30', 'password30', 'user30@example.com'),
(31, 'user31', 'password31', 'user31@example.com'),
(32, 'user32', 'password32', 'user32@example.com'),
(33, 'user33', 'password33', 'user33@example.com'),
(34, 'user34', 'password34', 'user34@example.com'),
(35, 'user35', 'password35', 'user35@example.com'),
(36, 'user36', 'password36', 'user36@example.com'),
(37, 'user37', 'password37', 'user37@example.com'),
(38, 'user38', 'password38', 'user38@example.com'),
(39, 'user39', 'password39', 'user39@example.com'),
(40, 'user40', 'password40', 'user40@example.com'),
(41, 'user41', 'password41', 'user41@example.com'),
(42, 'user42', 'password42', 'user42@example.com'),
(43, 'user43', 'password43', 'user43@example.com'),
(44, 'user44', 'password44', 'user44@example.com'),
(45, 'user45', 'password45', 'user45@example.com'),
(46, 'user46', 'password46', 'user46@example.com'),
(47, 'user47', 'password47', 'user47@example.com'),
(48, 'user48', 'password48', 'user48@example.com'),
(49, 'user49', 'password49', 'user49@example.com'),
(50, 'user50', 'password50', 'user50@example.com');


-- UserProfile 
insert into UserProfile (user_id, birth_year, gender) values (1, 2007, 'male');
insert into UserProfile (user_id, birth_year, gender) values (2, 1993, 'female');
insert into UserProfile (user_id, birth_year, gender) values (3, 1998, 'male');
insert into UserProfile (user_id, birth_year, gender) values (4, 1993, 'female');
insert into UserProfile (user_id, birth_year, gender) values (5, 1980, 'female');
insert into UserProfile (user_id, birth_year, gender) values (6, 1985, 'female');
insert into UserProfile (user_id, birth_year, gender) values (7, 2009, 'male');
insert into UserProfile (user_id, birth_year, gender) values (8, 1986, 'male');
insert into UserProfile (user_id, birth_year, gender) values (9, 1983, 'female');
insert into UserProfile (user_id, birth_year, gender) values (10, 2009, 'female');
insert into UserProfile (user_id, birth_year, gender) values (11, 1999, 'male');
insert into UserProfile (user_id, birth_year, gender) values (12, 1985, 'female');
insert into UserProfile (user_id, birth_year, gender) values (13, 1982, 'female');
insert into UserProfile (user_id, birth_year, gender) values (14, 1984, 'female');
insert into UserProfile (user_id, birth_year, gender) values (15, 1981, 'male');
insert into UserProfile (user_id, birth_year, gender) values (16, 2001, 'male');
insert into UserProfile (user_id, birth_year, gender) values (17, 2004, 'male');
insert into UserProfile (user_id, birth_year, gender) values (18, 1999, 'female');
insert into UserProfile (user_id, birth_year, gender) values (19, 2007, 'male');
insert into UserProfile (user_id, birth_year, gender) values (20, 2002, 'male');
insert into UserProfile (user_id, birth_year, gender) values (21, 2009, 'male');
insert into UserProfile (user_id, birth_year, gender) values (22, 1996, 'male');
insert into UserProfile (user_id, birth_year, gender) values (23, 1999, 'female');
insert into UserProfile (user_id, birth_year, gender) values (24, 2007, 'male');
insert into UserProfile (user_id, birth_year, gender) values (25, 1990, 'female');
insert into UserProfile (user_id, birth_year, gender) values (26, 1998, 'male');
insert into UserProfile (user_id, birth_year, gender) values (27, 1999, 'male');
insert into UserProfile (user_id, birth_year, gender) values (28, 1982, 'male');
insert into UserProfile (user_id, birth_year, gender) values (29, 1992, 'female');
insert into UserProfile (user_id, birth_year, gender) values (30, 1986, 'male');
insert into UserProfile (user_id, birth_year, gender) values (31, 1989, 'female');
insert into UserProfile (user_id, birth_year, gender) values (32, 2010, 'female');
insert into UserProfile (user_id, birth_year, gender) values (33, 1999, 'female');
insert into UserProfile (user_id, birth_year, gender) values (34, 2010, 'female');
insert into UserProfile (user_id, birth_year, gender) values (35, 2001, 'male');
insert into UserProfile (user_id, birth_year, gender) values (36, 2003, 'male');
insert into UserProfile (user_id, birth_year, gender) values (37, 1989, 'male');
insert into UserProfile (user_id, birth_year, gender) values (38, 1999, 'female');
insert into UserProfile (user_id, birth_year, gender) values (39, 1983, 'male');
insert into UserProfile (user_id, birth_year, gender) values (40, 2002, 'male');
insert into UserProfile (user_id, birth_year, gender) values (41, 1983, 'male');
insert into UserProfile (user_id, birth_year, gender) values (42, 1988, 'female');
insert into UserProfile (user_id, birth_year, gender) values (43, 1990, 'female');
insert into UserProfile (user_id, birth_year, gender) values (44, 2000, 'male');
insert into UserProfile (user_id, birth_year, gender) values (45, 2004, 'male');
insert into UserProfile (user_id, birth_year, gender) values (46, 1984, 'female');
insert into UserProfile (user_id, birth_year, gender) values (47, 1997, 'female');
insert into UserProfile (user_id, birth_year, gender) values (48, 2003, 'female');
insert into UserProfile (user_id, birth_year, gender) values (49, 1980, 'male');
insert into UserProfile (user_id, birth_year, gender) values (50, 2003, 'male');


-- Menus (카테고리별 5개씩, 총 25개 메뉴)
INSERT INTO Menus (category_id, menu_name, food_image_url) VALUES
/* 한식 (Category 1) */
(1, '제육볶음', 'images/jeyuk_bokkeum.jpg'), 
(1, '김치찌개', 'images/kimchi_jjigae.jpg'), 
(1, '비빔밥', 'images/bibimbap.jpg'), 
(1, '불고기', 'images/bulgogi.jpg'), 
(1, '된장찌개', 'images/doenjang_jjigae.jpg'),

/* 중식 (Category 2) */
(2, '짜장면', 'images/jjajangmyeon.jpg'), 
(2, '짬뽕', 'images/jjamppong.jpg'), 
(2, '탕수육', 'images/tangsuyuk.jpg'), 
(2, '마파두부', 'images/mapa_tofu.jpg'), 
(2, '양장피', 'images/yangjangpi.jpg'),

/* 일식 (Category 3) */
(3, '초밥', 'images/sushi.jpg'), 
(3, '라멘', 'images/ramen.jpg'), 
(3, '돈까스', 'images/donkkaseu.jpg'), 
(3, '우동', 'images/udon.jpg'), 
(3, '야끼소바', 'images/yakisoba.jpg'),

/* 양식 (Category 4) */
(4, '파스타', 'images/pasta.jpg'), 
(4, '피자', 'images/pizza.jpg'), 
(4, '스테이크', 'images/steak.jpg'), 
(4, '리조또', 'images/risotto.jpg'), 
(4, '시저 샐러드', 'images/caesar_salad.jpg'),

/* 분식 (Category 5) */
(5, '떡볶이', 'images/tteokbokki.jpg'), 
(5, '순대', 'images/sundae.jpg'), 
(5, '튀김', 'images/twigim.jpg'), 
(5, '김밥', 'images/gimbap.jpg'), 
(5, '어묵', 'images/eomuk.jpg');


-- WeatherLog
-- 100일간의 날씨 데이터 생성
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-01', 1, 30.0);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-02', 3, 29.7);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-03', 1, 29.4);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-04', 3, 29.1);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-05', 2, 28.8);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-06', 1, 28.5);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-07', 2, 28.2);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-08', 1, 27.9);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-09', 1, 27.6);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-10', 1, 27.3);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-11', 3, 27.0);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-12', 2, 26.7);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-13', 3, 26.4);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-14', 1, 26.1);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-15', 3, 25.8);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-16', 3, 25.5);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-17', 3, 25.2);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-18', 1, 24.9);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-19', 3, 24.6);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-20', 1, 24.3);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-21', 3, 24.0);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-22', 3, 23.7);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-23', 1, 23.4);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-24', 2, 23.1);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-25', 3, 22.8);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-26', 3, 22.5);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-27', 3, 22.2);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-28', 2, 21.9);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-29', 1, 21.6);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-30', 2, 21.3);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-07-31', 2, 21.0);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-01', 3, 20.7);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-02', 3, 20.4);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-03', 3, 20.1);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-04', 3, 19.8);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-05', 2, 19.5);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-06', 2, 19.2);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-07', 1, 18.9);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-08', 2, 18.6);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-09', 3, 18.3);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-10', 2, 18.0);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-11', 2, 17.7);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-12', 3, 17.4);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-13', 3, 17.1);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-14', 1, 16.8);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-15', 2, 16.5);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-16', 3, 16.2);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-17', 1, 15.9);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-18', 1, 15.6);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-19', 1, 15.3);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-20', 1, 15.0);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-21', 3, 14.7);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-22', 1, 14.4);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-23', 1, 14.1);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-24', 1, 13.8);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-25', 2, 13.5);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-26', 2, 13.2);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-27', 3, 12.9);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-28', 1, 12.6);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-29', 3, 12.3);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-30', 3, 12.0);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-08-31', 1, 11.7);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-01', 2, 11.4);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-02', 2, 11.1);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-03', 2, 10.8);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-04', 2, 10.5);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-05', 1, 10.2);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-06', 1, 9.9);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-07', 2, 9.6);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-08', 3, 9.3);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-09', 3, 9.0);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-10', 2, 8.7);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-11', 2, 8.4);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-12', 3, 8.1);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-13', 2, 7.8);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-14', 3, 7.5);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-15', 3, 7.2);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-16', 1, 6.9);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-17', 1, 6.6);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-18', 2, 6.3);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-19', 2, 6.0);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-20', 3, 5.7);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-21', 1, 5.4);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-22', 1, 5.1);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-23', 3, 4.8);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-24', 1, 4.5);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-25', 1, 4.2);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-26', 3, 3.9);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-27', 2, 3.6);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-28', 2, 3.3);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-29', 3, 3.0);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-09-30', 2, 2.7);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-10-01', 3, 2.4);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-10-02', 3, 2.1);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-10-03', 2, 1.8);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-10-04', 2, 1.5);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-10-05', 1, 1.2);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-10-06', 3, 0.9);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-10-07', 2, 0.6);
insert into WeatherLog (log_date, condition_id, temperature) values ('2025-10-08', 1, 0.3);



-- Reviews 대량 생성
-- 800개의 리뷰 데이터
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (1, 9, 7, '2025-09-09', 5, '추천합니다.', '2025-09-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (2, 4, 9, '2025-09-28', 2, '별로입니다.', '2025-09-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (3, 26, 5, '2025-08-15', 2, '별로입니다.', '2025-08-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (4, 19, 21, '2025-07-28', 4, '좋습니다.', '2025-07-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (5, 8, 15, '2025-08-25', 5, '추천합니다.', '2025-08-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (6, 25, 21, '2025-08-13', 3, '보통입니다.', '2025-08-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (7, 36, 22, '2025-08-04', 1, '추천하지 않습니다.', '2025-08-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (8, 2, 8, '2025-09-21', 4, '좋습니다.', '2025-09-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (9, 7, 15, '2025-08-05', 3, '보통입니다.', '2025-08-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (10, 33, 4, '2025-07-22', 1, '추천하지 않습니다.', '2025-07-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (11, 32, 18, '2025-09-24', 2, '별로입니다.', '2025-09-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (12, 48, 4, '2025-09-07', 5, '추천합니다.', '2025-09-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (13, 15, 4, '2025-09-29', 3, '보통입니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (14, 12, 9, '2025-08-24', 1, '추천하지 않습니다.', '2025-08-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (15, 30, 24, '2025-08-14', 5, '추천합니다.', '2025-08-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (16, 13, 22, '2025-07-23', 1, '추천하지 않습니다.', '2025-07-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (17, 8, 19, '2025-07-21', 3, '보통입니다.', '2025-07-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (18, 3, 13, '2025-08-11', 4, '좋습니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (19, 41, 10, '2025-10-01', 3, '보통입니다.', '2025-10-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (20, 26, 2, '2025-08-28', 1, '추천하지 않습니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (21, 47, 22, '2025-08-24', 5, '추천합니다.', '2025-08-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (22, 45, 2, '2025-09-07', 1, '추천하지 않습니다.', '2025-09-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (23, 30, 22, '2025-07-12', 5, '추천합니다.', '2025-07-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (24, 30, 25, '2025-08-16', 5, '추천합니다.', '2025-08-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (25, 18, 14, '2025-08-12', 3, '보통입니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (26, 48, 15, '2025-09-10', 4, '좋습니다.', '2025-09-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (27, 29, 2, '2025-09-01', 1, '추천하지 않습니다.', '2025-09-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (28, 6, 9, '2025-07-11', 5, '추천합니다.', '2025-07-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (29, 27, 19, '2025-09-24', 3, '보통입니다.', '2025-09-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (30, 36, 2, '2025-07-26', 1, '추천하지 않습니다.', '2025-07-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (31, 42, 8, '2025-09-18', 5, '추천합니다.', '2025-09-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (32, 26, 10, '2025-08-20', 3, '보통입니다.', '2025-08-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (33, 40, 22, '2025-07-18', 5, '추천합니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (34, 43, 6, '2025-07-29', 3, '보통입니다.', '2025-07-31');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (35, 9, 11, '2025-09-04', 3, '보통입니다.', '2025-09-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (36, 31, 14, '2025-08-18', 1, '추천하지 않습니다.', '2025-08-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (37, 17, 9, '2025-09-11', 5, '추천합니다.', '2025-09-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (38, 11, 25, '2025-07-04', 4, '좋습니다.', '2025-07-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (39, 40, 5, '2025-08-10', 4, '좋습니다.', '2025-08-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (40, 21, 7, '2025-07-24', 3, '보통입니다.', '2025-07-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (41, 49, 14, '2025-09-19', 4, '좋습니다.', '2025-09-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (42, 18, 21, '2025-08-21', 1, '추천하지 않습니다.', '2025-08-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (43, 23, 15, '2025-08-22', 2, '별로입니다.', '2025-08-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (44, 38, 7, '2025-07-14', 5, '추천합니다.', '2025-07-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (45, 43, 1, '2025-07-12', 4, '좋습니다.', '2025-07-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (46, 50, 5, '2025-07-01', 5, '추천합니다.', '2025-07-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (47, 37, 5, '2025-07-26', 4, '좋습니다.', '2025-07-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (48, 49, 22, '2025-10-03', 5, '추천합니다.', '2025-10-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (49, 9, 8, '2025-09-13', 2, '별로입니다.', '2025-09-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (50, 18, 9, '2025-07-07', 2, '별로입니다.', '2025-07-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (51, 50, 1, '2025-10-07', 3, '보통입니다.', '2025-10-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (52, 22, 12, '2025-07-25', 4, '좋습니다.', '2025-07-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (53, 49, 11, '2025-09-23', 5, '추천합니다.', '2025-09-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (54, 48, 22, '2025-09-22', 5, '추천합니다.', '2025-09-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (55, 40, 5, '2025-07-14', 3, '보통입니다.', '2025-07-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (56, 40, 13, '2025-08-20', 4, '좋습니다.', '2025-08-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (57, 6, 13, '2025-09-10', 5, '추천합니다.', '2025-09-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (58, 32, 10, '2025-10-05', 3, '보통입니다.', '2025-10-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (59, 41, 20, '2025-07-23', 1, '추천하지 않습니다.', '2025-07-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (60, 14, 23, '2025-09-28', 5, '추천합니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (61, 50, 23, '2025-09-14', 4, '좋습니다.', '2025-09-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (62, 45, 9, '2025-09-10', 2, '별로입니다.', '2025-09-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (63, 40, 6, '2025-07-14', 1, '추천하지 않습니다.', '2025-07-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (64, 10, 7, '2025-10-05', 1, '추천하지 않습니다.', '2025-10-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (65, 8, 16, '2025-07-01', 2, '별로입니다.', '2025-07-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (66, 3, 6, '2025-08-09', 1, '추천하지 않습니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (67, 11, 7, '2025-07-06', 1, '추천하지 않습니다.', '2025-07-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (68, 26, 18, '2025-09-12', 2, '별로입니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (69, 2, 10, '2025-08-27', 3, '보통입니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (70, 39, 6, '2025-09-12', 3, '보통입니다.', '2025-09-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (71, 15, 6, '2025-09-03', 3, '보통입니다.', '2025-09-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (72, 4, 7, '2025-09-23', 4, '좋습니다.', '2025-09-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (73, 8, 16, '2025-08-30', 5, '추천합니다.', '2025-08-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (74, 40, 20, '2025-09-01', 5, '추천합니다.', '2025-09-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (75, 15, 13, '2025-07-28', 4, '좋습니다.', '2025-07-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (76, 43, 12, '2025-09-25', 2, '별로입니다.', '2025-09-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (77, 50, 7, '2025-07-08', 5, '추천합니다.', '2025-07-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (78, 47, 9, '2025-07-18', 2, '별로입니다.', '2025-07-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (79, 11, 21, '2025-09-16', 5, '추천합니다.', '2025-09-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (80, 48, 7, '2025-08-01', 2, '별로입니다.', '2025-08-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (81, 38, 22, '2025-08-08', 2, '별로입니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (82, 28, 1, '2025-07-04', 2, '별로입니다.', '2025-07-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (83, 30, 23, '2025-08-07', 5, '추천합니다.', '2025-08-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (84, 16, 20, '2025-08-06', 2, '별로입니다.', '2025-08-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (85, 48, 18, '2025-09-11', 4, '좋습니다.', '2025-09-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (86, 14, 18, '2025-09-28', 4, '좋습니다.', '2025-09-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (87, 43, 17, '2025-08-12', 3, '보통입니다.', '2025-08-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (88, 40, 1, '2025-07-15', 1, '추천하지 않습니다.', '2025-07-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (89, 33, 3, '2025-07-09', 3, '보통입니다.', '2025-07-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (90, 27, 11, '2025-09-04', 2, '별로입니다.', '2025-09-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (91, 34, 17, '2025-08-02', 3, '보통입니다.', '2025-08-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (92, 17, 2, '2025-09-17', 3, '보통입니다.', '2025-09-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (93, 48, 14, '2025-07-27', 3, '보통입니다.', '2025-07-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (94, 29, 17, '2025-09-25', 2, '별로입니다.', '2025-09-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (95, 27, 4, '2025-10-07', 4, '좋습니다.', '2025-10-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (96, 33, 2, '2025-09-13', 4, '좋습니다.', '2025-09-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (97, 44, 22, '2025-08-12', 1, '추천하지 않습니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (98, 50, 14, '2025-09-04', 4, '좋습니다.', '2025-09-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (99, 28, 2, '2025-09-28', 3, '보통입니다.', '2025-09-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (100, 6, 1, '2025-07-16', 5, '추천합니다.', '2025-07-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (101, 8, 2, '2025-07-12', 4, '좋습니다.', '2025-07-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (102, 13, 17, '2025-08-16', 4, '좋습니다.', '2025-08-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (103, 14, 10, '2025-08-29', 5, '추천합니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (104, 9, 7, '2025-07-18', 4, '좋습니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (105, 10, 12, '2025-07-20', 1, '추천하지 않습니다.', '2025-07-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (106, 39, 11, '2025-08-10', 5, '추천합니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (107, 42, 18, '2025-09-26', 4, '좋습니다.', '2025-09-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (108, 21, 13, '2025-08-09', 3, '보통입니다.', '2025-08-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (109, 22, 23, '2025-08-06', 5, '추천합니다.', '2025-08-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (110, 32, 19, '2025-09-23', 3, '보통입니다.', '2025-09-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (111, 33, 25, '2025-09-20', 1, '추천하지 않습니다.', '2025-09-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (112, 2, 16, '2025-08-27', 4, '좋습니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (113, 33, 20, '2025-10-04', 3, '보통입니다.', '2025-10-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (114, 29, 2, '2025-09-10', 5, '추천합니다.', '2025-09-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (115, 31, 12, '2025-09-19', 2, '별로입니다.', '2025-09-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (116, 46, 9, '2025-07-31', 4, '좋습니다.', '2025-07-31');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (117, 35, 3, '2025-08-18', 2, '별로입니다.', '2025-08-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (118, 47, 3, '2025-09-08', 5, '추천합니다.', '2025-09-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (119, 15, 8, '2025-09-15', 4, '좋습니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (120, 6, 21, '2025-07-27', 3, '보통입니다.', '2025-07-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (121, 31, 16, '2025-08-26', 3, '보통입니다.', '2025-08-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (122, 33, 18, '2025-10-01', 1, '추천하지 않습니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (123, 11, 13, '2025-10-05', 3, '보통입니다.', '2025-10-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (124, 42, 2, '2025-09-05', 4, '좋습니다.', '2025-09-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (125, 8, 20, '2025-09-17', 4, '좋습니다.', '2025-09-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (126, 25, 4, '2025-08-08', 1, '추천하지 않습니다.', '2025-08-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (127, 41, 8, '2025-07-18', 1, '추천하지 않습니다.', '2025-07-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (128, 38, 2, '2025-09-10', 5, '추천합니다.', '2025-09-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (129, 25, 19, '2025-08-19', 5, '추천합니다.', '2025-08-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (130, 36, 3, '2025-10-01', 4, '좋습니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (131, 7, 14, '2025-07-22', 3, '보통입니다.', '2025-07-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (132, 27, 18, '2025-08-18', 2, '별로입니다.', '2025-08-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (133, 11, 24, '2025-09-17', 4, '좋습니다.', '2025-09-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (134, 43, 18, '2025-09-21', 1, '추천하지 않습니다.', '2025-09-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (135, 25, 2, '2025-09-23', 5, '추천합니다.', '2025-09-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (136, 17, 18, '2025-09-08', 3, '보통입니다.', '2025-09-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (137, 32, 2, '2025-08-15', 3, '보통입니다.', '2025-08-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (138, 40, 11, '2025-10-06', 3, '보통입니다.', '2025-10-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (139, 22, 2, '2025-09-27', 1, '추천하지 않습니다.', '2025-09-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (140, 29, 12, '2025-08-06', 2, '별로입니다.', '2025-08-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (141, 50, 21, '2025-09-16', 3, '보통입니다.', '2025-09-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (142, 42, 8, '2025-09-15', 3, '보통입니다.', '2025-09-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (143, 47, 23, '2025-07-25', 5, '추천합니다.', '2025-07-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (144, 34, 9, '2025-07-15', 5, '추천합니다.', '2025-07-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (145, 48, 8, '2025-08-10', 1, '추천하지 않습니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (146, 32, 1, '2025-09-14', 5, '추천합니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (147, 25, 14, '2025-09-06', 3, '보통입니다.', '2025-09-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (148, 8, 21, '2025-10-07', 3, '보통입니다.', '2025-10-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (149, 15, 24, '2025-07-24', 5, '추천합니다.', '2025-07-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (150, 1, 22, '2025-09-12', 2, '별로입니다.', '2025-09-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (151, 37, 19, '2025-08-11', 3, '보통입니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (152, 7, 7, '2025-07-25', 1, '추천하지 않습니다.', '2025-07-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (153, 41, 7, '2025-09-01', 4, '좋습니다.', '2025-09-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (154, 34, 20, '2025-09-15', 3, '보통입니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (155, 48, 16, '2025-09-25', 3, '보통입니다.', '2025-09-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (156, 26, 1, '2025-09-12', 2, '별로입니다.', '2025-09-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (157, 37, 9, '2025-08-13', 5, '추천합니다.', '2025-08-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (158, 27, 24, '2025-09-26', 5, '추천합니다.', '2025-09-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (159, 21, 15, '2025-07-07', 1, '추천하지 않습니다.', '2025-07-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (160, 44, 9, '2025-07-02', 3, '보통입니다.', '2025-07-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (161, 23, 6, '2025-07-10', 1, '추천하지 않습니다.', '2025-07-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (162, 44, 2, '2025-09-12', 3, '보통입니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (163, 10, 12, '2025-08-06', 4, '좋습니다.', '2025-08-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (164, 8, 20, '2025-09-05', 1, '추천하지 않습니다.', '2025-09-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (165, 35, 15, '2025-08-10', 5, '추천합니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (166, 38, 2, '2025-08-02', 3, '보통입니다.', '2025-08-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (167, 6, 20, '2025-08-06', 5, '추천합니다.', '2025-08-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (168, 38, 4, '2025-09-26', 1, '추천하지 않습니다.', '2025-09-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (169, 26, 22, '2025-07-07', 5, '추천합니다.', '2025-07-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (170, 19, 21, '2025-09-22', 3, '보통입니다.', '2025-09-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (171, 7, 20, '2025-07-16', 5, '추천합니다.', '2025-07-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (172, 49, 17, '2025-09-21', 2, '별로입니다.', '2025-09-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (173, 29, 6, '2025-10-01', 5, '추천합니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (174, 32, 11, '2025-09-24', 4, '좋습니다.', '2025-09-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (175, 24, 13, '2025-07-16', 2, '별로입니다.', '2025-07-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (176, 29, 24, '2025-07-13', 3, '보통입니다.', '2025-07-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (177, 48, 3, '2025-08-21', 3, '보통입니다.', '2025-08-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (178, 44, 25, '2025-07-01', 5, '추천합니다.', '2025-07-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (179, 14, 25, '2025-10-06', 1, '추천하지 않습니다.', '2025-10-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (180, 10, 1, '2025-07-09', 2, '별로입니다.', '2025-07-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (181, 13, 2, '2025-08-28', 3, '보통입니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (182, 3, 3, '2025-07-02', 1, '추천하지 않습니다.', '2025-07-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (183, 16, 20, '2025-09-17', 3, '보통입니다.', '2025-09-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (184, 33, 7, '2025-08-24', 2, '별로입니다.', '2025-08-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (185, 49, 22, '2025-08-10', 1, '추천하지 않습니다.', '2025-08-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (186, 30, 9, '2025-08-28', 2, '별로입니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (187, 38, 14, '2025-08-30', 4, '좋습니다.', '2025-09-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (188, 43, 12, '2025-08-17', 1, '추천하지 않습니다.', '2025-08-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (189, 28, 1, '2025-07-18', 4, '좋습니다.', '2025-07-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (190, 33, 2, '2025-09-27', 1, '추천하지 않습니다.', '2025-09-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (191, 45, 2, '2025-09-08', 1, '추천하지 않습니다.', '2025-09-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (192, 36, 2, '2025-10-06', 1, '추천하지 않습니다.', '2025-10-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (193, 11, 20, '2025-07-01', 1, '추천하지 않습니다.', '2025-07-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (194, 21, 4, '2025-09-15', 3, '보통입니다.', '2025-09-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (195, 43, 4, '2025-07-06', 2, '별로입니다.', '2025-07-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (196, 16, 19, '2025-08-21', 1, '추천하지 않습니다.', '2025-08-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (197, 19, 22, '2025-10-05', 3, '보통입니다.', '2025-10-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (198, 6, 25, '2025-07-03', 3, '보통입니다.', '2025-07-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (199, 27, 4, '2025-10-01', 2, '별로입니다.', '2025-10-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (200, 26, 6, '2025-09-14', 2, '별로입니다.', '2025-09-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (201, 8, 11, '2025-08-23', 5, '추천합니다.', '2025-08-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (202, 31, 25, '2025-08-21', 3, '보통입니다.', '2025-08-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (203, 36, 25, '2025-08-19', 5, '추천합니다.', '2025-08-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (204, 22, 16, '2025-09-16', 3, '보통입니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (205, 4, 18, '2025-08-15', 4, '좋습니다.', '2025-08-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (206, 4, 3, '2025-07-04', 2, '별로입니다.', '2025-07-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (207, 42, 6, '2025-07-09', 4, '좋습니다.', '2025-07-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (208, 29, 19, '2025-09-15', 4, '좋습니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (209, 45, 11, '2025-08-16', 4, '좋습니다.', '2025-08-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (210, 8, 21, '2025-09-30', 5, '추천합니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (211, 14, 8, '2025-08-01', 1, '추천하지 않습니다.', '2025-08-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (212, 3, 3, '2025-09-05', 3, '보통입니다.', '2025-09-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (213, 24, 24, '2025-08-29', 5, '추천합니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (214, 26, 8, '2025-09-05', 4, '좋습니다.', '2025-09-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (215, 7, 3, '2025-08-15', 4, '좋습니다.', '2025-08-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (216, 22, 16, '2025-07-05', 3, '보통입니다.', '2025-07-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (217, 40, 20, '2025-09-01', 4, '좋습니다.', '2025-09-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (218, 24, 15, '2025-08-10', 3, '보통입니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (219, 6, 22, '2025-07-18', 3, '보통입니다.', '2025-07-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (220, 18, 17, '2025-08-07', 4, '좋습니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (221, 48, 24, '2025-08-03', 5, '추천합니다.', '2025-08-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (222, 29, 16, '2025-09-25', 1, '추천하지 않습니다.', '2025-09-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (223, 47, 13, '2025-08-05', 4, '좋습니다.', '2025-08-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (224, 50, 11, '2025-10-01', 1, '추천하지 않습니다.', '2025-10-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (225, 20, 13, '2025-07-16', 5, '추천합니다.', '2025-07-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (226, 38, 7, '2025-09-25', 4, '좋습니다.', '2025-09-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (227, 17, 14, '2025-08-01', 2, '별로입니다.', '2025-08-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (228, 10, 19, '2025-09-22', 3, '보통입니다.', '2025-09-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (229, 4, 3, '2025-08-14', 4, '좋습니다.', '2025-08-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (230, 7, 7, '2025-08-13', 4, '좋습니다.', '2025-08-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (231, 13, 4, '2025-07-29', 1, '추천하지 않습니다.', '2025-07-31');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (232, 36, 16, '2025-08-19', 5, '추천합니다.', '2025-08-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (233, 46, 14, '2025-09-13', 3, '보통입니다.', '2025-09-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (234, 45, 2, '2025-09-17', 4, '좋습니다.', '2025-09-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (235, 50, 20, '2025-09-27', 1, '추천하지 않습니다.', '2025-09-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (236, 18, 16, '2025-10-07', 1, '추천하지 않습니다.', '2025-10-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (237, 19, 3, '2025-07-07', 3, '보통입니다.', '2025-07-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (238, 46, 7, '2025-07-13', 1, '추천하지 않습니다.', '2025-07-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (239, 29, 16, '2025-08-19', 2, '별로입니다.', '2025-08-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (240, 33, 20, '2025-07-19', 4, '좋습니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (241, 5, 1, '2025-08-15', 5, '추천합니다.', '2025-08-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (242, 43, 6, '2025-10-04', 1, '추천하지 않습니다.', '2025-10-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (243, 13, 14, '2025-07-11', 3, '보통입니다.', '2025-07-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (244, 50, 3, '2025-07-01', 3, '보통입니다.', '2025-07-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (245, 36, 1, '2025-08-30', 3, '보통입니다.', '2025-09-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (246, 37, 12, '2025-08-01', 2, '별로입니다.', '2025-08-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (247, 42, 3, '2025-07-09', 4, '좋습니다.', '2025-07-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (248, 4, 14, '2025-08-05', 3, '보통입니다.', '2025-08-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (249, 19, 11, '2025-09-09', 1, '추천하지 않습니다.', '2025-09-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (250, 18, 9, '2025-09-07', 3, '보통입니다.', '2025-09-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (251, 26, 16, '2025-07-01', 5, '추천합니다.', '2025-07-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (252, 26, 5, '2025-09-10', 3, '보통입니다.', '2025-09-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (253, 30, 14, '2025-07-18', 3, '보통입니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (254, 15, 10, '2025-07-07', 1, '추천하지 않습니다.', '2025-07-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (255, 40, 7, '2025-09-27', 3, '보통입니다.', '2025-09-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (256, 42, 17, '2025-07-22', 5, '추천합니다.', '2025-07-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (257, 45, 5, '2025-08-28', 3, '보통입니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (258, 17, 16, '2025-08-03', 5, '추천합니다.', '2025-08-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (259, 37, 5, '2025-09-30', 3, '보통입니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (260, 13, 4, '2025-09-06', 4, '좋습니다.', '2025-09-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (261, 15, 13, '2025-07-21', 5, '추천합니다.', '2025-07-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (262, 20, 17, '2025-10-04', 3, '보통입니다.', '2025-10-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (263, 28, 16, '2025-10-07', 5, '추천합니다.', '2025-10-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (264, 42, 13, '2025-09-18', 5, '추천합니다.', '2025-09-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (265, 14, 12, '2025-08-23', 1, '추천하지 않습니다.', '2025-08-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (266, 41, 16, '2025-09-04', 1, '추천하지 않습니다.', '2025-09-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (267, 36, 4, '2025-10-06', 3, '보통입니다.', '2025-10-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (268, 29, 14, '2025-09-07', 4, '좋습니다.', '2025-09-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (269, 8, 17, '2025-07-14', 2, '별로입니다.', '2025-07-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (270, 31, 6, '2025-07-06', 2, '별로입니다.', '2025-07-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (271, 10, 3, '2025-07-18', 2, '별로입니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (272, 46, 16, '2025-07-15', 3, '보통입니다.', '2025-07-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (273, 16, 15, '2025-07-19', 1, '추천하지 않습니다.', '2025-07-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (274, 19, 13, '2025-09-04', 5, '추천합니다.', '2025-09-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (275, 24, 14, '2025-08-20', 4, '좋습니다.', '2025-08-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (276, 21, 24, '2025-08-10', 1, '추천하지 않습니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (277, 34, 9, '2025-09-03', 2, '별로입니다.', '2025-09-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (278, 20, 9, '2025-07-12', 5, '추천합니다.', '2025-07-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (279, 19, 4, '2025-07-11', 2, '별로입니다.', '2025-07-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (280, 30, 23, '2025-09-24', 1, '추천하지 않습니다.', '2025-09-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (281, 42, 7, '2025-10-03', 5, '추천합니다.', '2025-10-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (282, 21, 13, '2025-08-13', 3, '보통입니다.', '2025-08-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (283, 39, 13, '2025-09-03', 2, '별로입니다.', '2025-09-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (284, 40, 19, '2025-09-15', 4, '좋습니다.', '2025-09-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (285, 41, 25, '2025-07-31', 4, '좋습니다.', '2025-08-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (286, 50, 18, '2025-09-23', 5, '추천합니다.', '2025-09-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (287, 46, 17, '2025-08-15', 3, '보통입니다.', '2025-08-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (288, 27, 25, '2025-07-23', 2, '별로입니다.', '2025-07-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (289, 12, 7, '2025-09-06', 3, '보통입니다.', '2025-09-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (290, 7, 24, '2025-07-01', 1, '추천하지 않습니다.', '2025-07-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (291, 27, 12, '2025-09-16', 4, '좋습니다.', '2025-09-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (292, 23, 1, '2025-07-20', 3, '보통입니다.', '2025-07-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (293, 25, 15, '2025-09-06', 2, '별로입니다.', '2025-09-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (294, 23, 15, '2025-09-29', 4, '좋습니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (295, 1, 8, '2025-10-07', 1, '추천하지 않습니다.', '2025-10-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (296, 6, 4, '2025-09-14', 3, '보통입니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (297, 49, 18, '2025-07-25', 2, '별로입니다.', '2025-07-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (298, 43, 3, '2025-07-16', 3, '보통입니다.', '2025-07-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (299, 39, 8, '2025-07-03', 4, '좋습니다.', '2025-07-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (300, 37, 1, '2025-09-29', 5, '추천합니다.', '2025-09-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (301, 19, 10, '2025-08-15', 3, '보통입니다.', '2025-08-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (302, 49, 1, '2025-09-28', 1, '추천하지 않습니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (303, 48, 20, '2025-10-06', 4, '좋습니다.', '2025-10-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (304, 47, 12, '2025-09-05', 5, '추천합니다.', '2025-09-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (305, 9, 21, '2025-08-08', 3, '보통입니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (306, 31, 11, '2025-09-02', 2, '별로입니다.', '2025-09-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (307, 7, 12, '2025-07-22', 5, '추천합니다.', '2025-07-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (308, 12, 16, '2025-08-04', 2, '별로입니다.', '2025-08-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (309, 35, 24, '2025-08-15', 1, '추천하지 않습니다.', '2025-08-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (310, 9, 18, '2025-08-27', 1, '추천하지 않습니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (311, 33, 16, '2025-09-13', 2, '별로입니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (312, 22, 23, '2025-08-07', 1, '추천하지 않습니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (313, 39, 19, '2025-10-03', 1, '추천하지 않습니다.', '2025-10-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (314, 36, 7, '2025-08-01', 3, '보통입니다.', '2025-08-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (315, 43, 2, '2025-07-19', 4, '좋습니다.', '2025-07-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (316, 8, 5, '2025-08-22', 5, '추천합니다.', '2025-08-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (317, 38, 3, '2025-07-28', 5, '추천합니다.', '2025-07-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (318, 40, 2, '2025-08-22', 3, '보통입니다.', '2025-08-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (319, 30, 2, '2025-08-20', 4, '좋습니다.', '2025-08-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (320, 25, 17, '2025-10-04', 2, '별로입니다.', '2025-10-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (321, 29, 14, '2025-09-05', 1, '추천하지 않습니다.', '2025-09-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (322, 19, 5, '2025-09-20', 5, '추천합니다.', '2025-09-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (323, 40, 23, '2025-08-02', 3, '보통입니다.', '2025-08-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (324, 9, 20, '2025-09-26', 5, '추천합니다.', '2025-09-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (325, 32, 7, '2025-09-27', 5, '추천합니다.', '2025-09-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (326, 32, 6, '2025-09-04', 4, '좋습니다.', '2025-09-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (327, 18, 6, '2025-07-25', 2, '별로입니다.', '2025-07-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (328, 3, 11, '2025-09-14', 5, '추천합니다.', '2025-09-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (329, 18, 12, '2025-09-13', 2, '별로입니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (330, 43, 6, '2025-08-05', 3, '보통입니다.', '2025-08-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (331, 7, 5, '2025-08-13', 5, '추천합니다.', '2025-08-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (332, 5, 25, '2025-07-11', 2, '별로입니다.', '2025-07-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (333, 15, 25, '2025-08-19', 4, '좋습니다.', '2025-08-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (334, 37, 16, '2025-10-06', 2, '별로입니다.', '2025-10-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (335, 23, 22, '2025-07-23', 2, '별로입니다.', '2025-07-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (336, 42, 15, '2025-07-03', 5, '추천합니다.', '2025-07-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (337, 7, 22, '2025-08-07', 1, '추천하지 않습니다.', '2025-08-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (338, 17, 24, '2025-09-25', 4, '좋습니다.', '2025-09-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (339, 6, 20, '2025-09-03', 5, '추천합니다.', '2025-09-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (340, 10, 15, '2025-09-19', 5, '추천합니다.', '2025-09-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (341, 1, 4, '2025-09-24', 2, '별로입니다.', '2025-09-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (342, 43, 4, '2025-08-11', 1, '추천하지 않습니다.', '2025-08-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (343, 34, 18, '2025-08-30', 5, '추천합니다.', '2025-08-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (344, 38, 5, '2025-08-24', 5, '추천합니다.', '2025-08-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (345, 5, 6, '2025-07-20', 3, '보통입니다.', '2025-07-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (346, 14, 21, '2025-08-21', 3, '보통입니다.', '2025-08-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (347, 17, 8, '2025-07-19', 4, '좋습니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (348, 30, 2, '2025-08-21', 3, '보통입니다.', '2025-08-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (349, 50, 25, '2025-07-07', 2, '별로입니다.', '2025-07-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (350, 41, 11, '2025-07-21', 2, '별로입니다.', '2025-07-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (351, 39, 1, '2025-07-25', 4, '좋습니다.', '2025-07-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (352, 20, 18, '2025-09-20', 1, '추천하지 않습니다.', '2025-09-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (353, 50, 12, '2025-07-18', 3, '보통입니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (354, 41, 24, '2025-09-01', 5, '추천합니다.', '2025-09-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (355, 39, 4, '2025-09-26', 5, '추천합니다.', '2025-09-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (356, 3, 12, '2025-09-29', 4, '좋습니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (357, 26, 3, '2025-07-25', 2, '별로입니다.', '2025-07-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (358, 50, 14, '2025-09-22', 3, '보통입니다.', '2025-09-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (359, 15, 17, '2025-09-06', 5, '추천합니다.', '2025-09-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (360, 44, 23, '2025-09-02', 3, '보통입니다.', '2025-09-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (361, 21, 4, '2025-08-31', 4, '좋습니다.', '2025-09-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (362, 6, 22, '2025-09-24', 4, '좋습니다.', '2025-09-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (363, 3, 20, '2025-09-05', 2, '별로입니다.', '2025-09-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (364, 44, 15, '2025-07-14', 5, '추천합니다.', '2025-07-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (365, 44, 17, '2025-09-01', 1, '추천하지 않습니다.', '2025-09-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (366, 43, 7, '2025-08-21', 2, '별로입니다.', '2025-08-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (367, 2, 10, '2025-07-28', 5, '추천합니다.', '2025-07-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (368, 13, 19, '2025-07-20', 2, '별로입니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (369, 45, 24, '2025-08-12', 1, '추천하지 않습니다.', '2025-08-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (370, 12, 12, '2025-07-12', 2, '별로입니다.', '2025-07-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (371, 35, 9, '2025-07-28', 2, '별로입니다.', '2025-07-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (372, 13, 4, '2025-07-16', 3, '보통입니다.', '2025-07-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (373, 8, 22, '2025-07-07', 2, '별로입니다.', '2025-07-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (374, 9, 2, '2025-08-29', 3, '보통입니다.', '2025-08-31');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (375, 21, 17, '2025-09-03', 5, '추천합니다.', '2025-09-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (376, 35, 7, '2025-09-29', 1, '추천하지 않습니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (377, 23, 1, '2025-09-14', 3, '보통입니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (378, 32, 4, '2025-08-19', 2, '별로입니다.', '2025-08-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (379, 1, 18, '2025-08-15', 5, '추천합니다.', '2025-08-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (380, 34, 4, '2025-08-11', 3, '보통입니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (381, 27, 13, '2025-09-08', 5, '추천합니다.', '2025-09-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (382, 15, 15, '2025-10-02', 2, '별로입니다.', '2025-10-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (383, 49, 1, '2025-09-09', 5, '추천합니다.', '2025-09-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (384, 11, 17, '2025-10-01', 4, '좋습니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (385, 3, 7, '2025-08-06', 3, '보통입니다.', '2025-08-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (386, 6, 10, '2025-09-02', 1, '추천하지 않습니다.', '2025-09-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (387, 12, 21, '2025-07-12', 4, '좋습니다.', '2025-07-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (388, 35, 15, '2025-08-03', 2, '별로입니다.', '2025-08-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (389, 23, 24, '2025-08-21', 2, '별로입니다.', '2025-08-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (390, 3, 24, '2025-07-14', 4, '좋습니다.', '2025-07-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (391, 13, 21, '2025-09-17', 1, '추천하지 않습니다.', '2025-09-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (392, 44, 13, '2025-07-15', 3, '보통입니다.', '2025-07-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (393, 40, 1, '2025-07-15', 5, '추천합니다.', '2025-07-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (394, 25, 19, '2025-07-29', 3, '보통입니다.', '2025-07-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (395, 9, 20, '2025-07-18', 4, '좋습니다.', '2025-07-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (396, 29, 4, '2025-07-25', 5, '추천합니다.', '2025-07-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (397, 8, 13, '2025-09-21', 4, '좋습니다.', '2025-09-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (398, 2, 10, '2025-07-29', 4, '좋습니다.', '2025-07-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (399, 28, 14, '2025-09-11', 3, '보통입니다.', '2025-09-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (400, 25, 18, '2025-10-05', 3, '보통입니다.', '2025-10-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (401, 29, 13, '2025-07-20', 5, '추천합니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (402, 15, 3, '2025-08-26', 1, '추천하지 않습니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (403, 24, 2, '2025-09-13', 2, '별로입니다.', '2025-09-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (404, 48, 21, '2025-07-09', 4, '좋습니다.', '2025-07-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (405, 36, 21, '2025-08-03', 2, '별로입니다.', '2025-08-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (406, 37, 14, '2025-07-22', 5, '추천합니다.', '2025-07-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (407, 22, 14, '2025-08-06', 3, '보통입니다.', '2025-08-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (408, 14, 22, '2025-09-23', 3, '보통입니다.', '2025-09-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (409, 25, 8, '2025-08-07', 4, '좋습니다.', '2025-08-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (410, 22, 12, '2025-09-09', 2, '별로입니다.', '2025-09-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (411, 25, 9, '2025-07-29', 1, '추천하지 않습니다.', '2025-07-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (412, 47, 8, '2025-07-29', 2, '별로입니다.', '2025-07-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (413, 34, 17, '2025-07-23', 3, '보통입니다.', '2025-07-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (414, 43, 13, '2025-09-11', 2, '별로입니다.', '2025-09-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (415, 32, 2, '2025-07-05', 4, '좋습니다.', '2025-07-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (416, 7, 9, '2025-08-22', 3, '보통입니다.', '2025-08-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (417, 32, 25, '2025-08-31', 3, '보통입니다.', '2025-08-31');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (418, 1, 14, '2025-08-01', 3, '보통입니다.', '2025-08-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (419, 26, 11, '2025-09-30', 3, '보통입니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (420, 5, 25, '2025-09-17', 5, '추천합니다.', '2025-09-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (421, 37, 2, '2025-09-30', 1, '추천하지 않습니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (422, 17, 14, '2025-08-22', 4, '좋습니다.', '2025-08-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (423, 20, 9, '2025-07-12', 4, '좋습니다.', '2025-07-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (424, 48, 18, '2025-09-03', 5, '추천합니다.', '2025-09-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (425, 19, 10, '2025-07-18', 4, '좋습니다.', '2025-07-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (426, 16, 7, '2025-09-19', 2, '별로입니다.', '2025-09-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (427, 9, 24, '2025-08-19', 1, '추천하지 않습니다.', '2025-08-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (428, 42, 2, '2025-09-30', 2, '별로입니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (429, 34, 13, '2025-10-07', 3, '보통입니다.', '2025-10-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (430, 34, 22, '2025-09-22', 3, '보통입니다.', '2025-09-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (431, 40, 22, '2025-08-29', 5, '추천합니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (432, 36, 6, '2025-09-08', 1, '추천하지 않습니다.', '2025-09-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (433, 38, 22, '2025-07-27', 1, '추천하지 않습니다.', '2025-07-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (434, 33, 5, '2025-09-15', 5, '추천합니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (435, 39, 15, '2025-09-14', 1, '추천하지 않습니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (436, 11, 4, '2025-08-30', 1, '추천하지 않습니다.', '2025-08-31');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (437, 44, 14, '2025-07-21', 5, '추천합니다.', '2025-07-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (438, 5, 8, '2025-07-21', 1, '추천하지 않습니다.', '2025-07-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (439, 44, 11, '2025-09-23', 4, '좋습니다.', '2025-09-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (440, 3, 8, '2025-09-25', 2, '별로입니다.', '2025-09-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (441, 42, 8, '2025-09-14', 4, '좋습니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (442, 20, 21, '2025-07-30', 3, '보통입니다.', '2025-07-31');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (443, 50, 4, '2025-08-08', 2, '별로입니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (444, 16, 23, '2025-07-17', 3, '보통입니다.', '2025-07-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (445, 15, 3, '2025-08-28', 2, '별로입니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (446, 22, 11, '2025-07-06', 3, '보통입니다.', '2025-07-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (447, 5, 24, '2025-09-26', 5, '추천합니다.', '2025-09-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (448, 31, 7, '2025-09-06', 5, '추천합니다.', '2025-09-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (449, 31, 11, '2025-08-28', 5, '추천합니다.', '2025-08-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (450, 36, 17, '2025-08-20', 1, '추천하지 않습니다.', '2025-08-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (451, 28, 1, '2025-07-21', 2, '별로입니다.', '2025-07-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (452, 36, 24, '2025-08-28', 2, '별로입니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (453, 35, 17, '2025-09-03', 1, '추천하지 않습니다.', '2025-09-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (454, 50, 4, '2025-07-28', 1, '추천하지 않습니다.', '2025-07-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (455, 5, 21, '2025-09-07', 3, '보통입니다.', '2025-09-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (456, 30, 21, '2025-08-29', 4, '좋습니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (457, 26, 18, '2025-09-16', 3, '보통입니다.', '2025-09-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (458, 36, 14, '2025-07-29', 3, '보통입니다.', '2025-07-31');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (459, 38, 2, '2025-08-20', 4, '좋습니다.', '2025-08-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (460, 42, 20, '2025-08-10', 1, '추천하지 않습니다.', '2025-08-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (461, 21, 7, '2025-08-04', 4, '좋습니다.', '2025-08-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (462, 14, 4, '2025-10-01', 4, '좋습니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (463, 35, 3, '2025-08-26', 5, '추천합니다.', '2025-08-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (464, 42, 9, '2025-09-29', 2, '별로입니다.', '2025-09-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (465, 5, 9, '2025-08-14', 4, '좋습니다.', '2025-08-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (466, 8, 20, '2025-07-12', 3, '보통입니다.', '2025-07-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (467, 29, 2, '2025-09-01', 3, '보통입니다.', '2025-09-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (468, 10, 16, '2025-09-08', 3, '보통입니다.', '2025-09-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (469, 24, 23, '2025-09-15', 3, '보통입니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (470, 38, 7, '2025-09-21', 3, '보통입니다.', '2025-09-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (471, 46, 6, '2025-09-14', 4, '좋습니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (472, 12, 7, '2025-07-04', 4, '좋습니다.', '2025-07-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (473, 23, 25, '2025-09-26', 2, '별로입니다.', '2025-09-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (474, 3, 19, '2025-09-14', 5, '추천합니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (475, 15, 19, '2025-09-28', 5, '추천합니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (476, 43, 24, '2025-09-13', 1, '추천하지 않습니다.', '2025-09-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (477, 30, 10, '2025-09-10', 5, '추천합니다.', '2025-09-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (478, 34, 20, '2025-10-07', 2, '별로입니다.', '2025-10-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (479, 29, 8, '2025-09-21', 2, '별로입니다.', '2025-09-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (480, 38, 12, '2025-09-02', 5, '추천합니다.', '2025-09-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (481, 47, 13, '2025-09-22', 2, '별로입니다.', '2025-09-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (482, 19, 16, '2025-08-24', 4, '좋습니다.', '2025-08-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (483, 47, 16, '2025-07-12', 4, '좋습니다.', '2025-07-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (484, 13, 14, '2025-09-22', 5, '추천합니다.', '2025-09-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (485, 36, 19, '2025-07-18', 2, '별로입니다.', '2025-07-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (486, 44, 6, '2025-08-30', 2, '별로입니다.', '2025-08-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (487, 21, 1, '2025-08-05', 4, '좋습니다.', '2025-08-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (488, 19, 7, '2025-07-16', 3, '보통입니다.', '2025-07-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (489, 37, 18, '2025-10-02', 2, '별로입니다.', '2025-10-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (490, 14, 12, '2025-08-08', 4, '좋습니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (491, 31, 9, '2025-08-26', 5, '추천합니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (492, 2, 10, '2025-08-30', 1, '추천하지 않습니다.', '2025-09-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (493, 47, 13, '2025-08-28', 1, '추천하지 않습니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (494, 44, 19, '2025-07-24', 3, '보통입니다.', '2025-07-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (495, 4, 14, '2025-08-28', 5, '추천합니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (496, 4, 4, '2025-09-13', 4, '좋습니다.', '2025-09-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (497, 49, 3, '2025-07-20', 3, '보통입니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (498, 14, 25, '2025-09-28', 2, '별로입니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (499, 21, 1, '2025-08-28', 3, '보통입니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (500, 25, 23, '2025-08-08', 5, '추천합니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (501, 22, 4, '2025-08-20', 2, '별로입니다.', '2025-08-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (502, 30, 23, '2025-08-29', 5, '추천합니다.', '2025-08-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (503, 17, 5, '2025-08-08', 2, '별로입니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (504, 46, 5, '2025-08-10', 2, '별로입니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (505, 28, 6, '2025-08-28', 4, '좋습니다.', '2025-08-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (506, 37, 10, '2025-07-27', 4, '좋습니다.', '2025-07-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (507, 21, 16, '2025-09-05', 4, '좋습니다.', '2025-09-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (508, 50, 4, '2025-09-27', 2, '별로입니다.', '2025-09-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (509, 47, 11, '2025-07-18', 4, '좋습니다.', '2025-07-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (510, 5, 9, '2025-08-14', 1, '추천하지 않습니다.', '2025-08-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (511, 19, 3, '2025-08-15', 2, '별로입니다.', '2025-08-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (512, 9, 22, '2025-09-27', 1, '추천하지 않습니다.', '2025-09-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (513, 4, 15, '2025-09-21', 3, '보통입니다.', '2025-09-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (514, 31, 11, '2025-08-24', 3, '보통입니다.', '2025-08-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (515, 36, 5, '2025-07-04', 5, '추천합니다.', '2025-07-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (516, 26, 4, '2025-07-29', 2, '별로입니다.', '2025-07-31');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (517, 16, 25, '2025-08-26', 3, '보통입니다.', '2025-08-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (518, 40, 17, '2025-08-21', 2, '별로입니다.', '2025-08-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (519, 4, 4, '2025-08-15', 5, '추천합니다.', '2025-08-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (520, 11, 12, '2025-09-19', 3, '보통입니다.', '2025-09-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (521, 35, 8, '2025-09-17', 1, '추천하지 않습니다.', '2025-09-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (522, 21, 18, '2025-08-23', 4, '좋습니다.', '2025-08-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (523, 2, 17, '2025-07-07', 5, '추천합니다.', '2025-07-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (524, 31, 9, '2025-10-05', 5, '추천합니다.', '2025-10-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (525, 5, 12, '2025-08-17', 1, '추천하지 않습니다.', '2025-08-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (526, 9, 22, '2025-08-16', 5, '추천합니다.', '2025-08-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (527, 36, 22, '2025-09-18', 1, '추천하지 않습니다.', '2025-09-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (528, 7, 15, '2025-09-13', 1, '추천하지 않습니다.', '2025-09-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (529, 42, 8, '2025-08-09', 5, '추천합니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (530, 17, 10, '2025-07-29', 4, '좋습니다.', '2025-07-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (531, 35, 12, '2025-09-23', 5, '추천합니다.', '2025-09-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (532, 49, 13, '2025-09-15', 2, '별로입니다.', '2025-09-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (533, 13, 9, '2025-07-10', 5, '추천합니다.', '2025-07-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (534, 5, 19, '2025-07-29', 1, '추천하지 않습니다.', '2025-07-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (535, 24, 4, '2025-09-06', 5, '추천합니다.', '2025-09-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (536, 11, 21, '2025-07-06', 3, '보통입니다.', '2025-07-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (537, 3, 9, '2025-07-26', 2, '별로입니다.', '2025-07-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (538, 37, 15, '2025-09-09', 5, '추천합니다.', '2025-09-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (539, 9, 8, '2025-09-19', 1, '추천하지 않습니다.', '2025-09-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (540, 14, 15, '2025-09-03', 2, '별로입니다.', '2025-09-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (541, 33, 16, '2025-09-29', 5, '추천합니다.', '2025-09-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (542, 36, 20, '2025-09-19', 1, '추천하지 않습니다.', '2025-09-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (543, 25, 15, '2025-10-02', 4, '좋습니다.', '2025-10-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (544, 3, 1, '2025-08-27', 1, '추천하지 않습니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (545, 18, 6, '2025-08-11', 4, '좋습니다.', '2025-08-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (546, 19, 20, '2025-07-21', 1, '추천하지 않습니다.', '2025-07-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (547, 35, 12, '2025-07-02', 2, '별로입니다.', '2025-07-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (548, 42, 23, '2025-10-03', 3, '보통입니다.', '2025-10-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (549, 38, 16, '2025-08-03', 4, '좋습니다.', '2025-08-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (550, 16, 4, '2025-09-29', 5, '추천합니다.', '2025-10-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (551, 38, 19, '2025-07-23', 1, '추천하지 않습니다.', '2025-07-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (552, 9, 17, '2025-08-08', 2, '별로입니다.', '2025-08-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (553, 18, 9, '2025-09-20', 3, '보통입니다.', '2025-09-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (554, 8, 10, '2025-10-05', 3, '보통입니다.', '2025-10-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (555, 36, 2, '2025-07-13', 5, '추천합니다.', '2025-07-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (556, 28, 13, '2025-08-07', 1, '추천하지 않습니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (557, 41, 16, '2025-09-19', 1, '추천하지 않습니다.', '2025-09-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (558, 26, 7, '2025-07-25', 4, '좋습니다.', '2025-07-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (559, 46, 4, '2025-07-08', 3, '보통입니다.', '2025-07-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (560, 30, 16, '2025-07-25', 2, '별로입니다.', '2025-07-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (561, 2, 25, '2025-08-11', 4, '좋습니다.', '2025-08-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (562, 18, 3, '2025-07-03', 4, '좋습니다.', '2025-07-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (563, 26, 9, '2025-07-29', 4, '좋습니다.', '2025-07-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (564, 16, 19, '2025-07-04', 1, '추천하지 않습니다.', '2025-07-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (565, 25, 21, '2025-07-15', 5, '추천합니다.', '2025-07-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (566, 17, 6, '2025-07-27', 2, '별로입니다.', '2025-07-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (567, 45, 6, '2025-08-12', 2, '별로입니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (568, 21, 14, '2025-08-26', 3, '보통입니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (569, 48, 1, '2025-07-31', 1, '추천하지 않습니다.', '2025-08-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (570, 19, 3, '2025-08-28', 1, '추천하지 않습니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (571, 48, 9, '2025-08-12', 1, '추천하지 않습니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (572, 33, 14, '2025-08-12', 2, '별로입니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (573, 11, 14, '2025-08-30', 2, '별로입니다.', '2025-08-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (574, 14, 7, '2025-07-03', 2, '별로입니다.', '2025-07-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (575, 36, 11, '2025-08-13', 2, '별로입니다.', '2025-08-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (576, 33, 1, '2025-08-26', 5, '추천합니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (577, 38, 11, '2025-08-25', 4, '좋습니다.', '2025-08-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (578, 28, 24, '2025-07-12', 5, '추천합니다.', '2025-07-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (579, 34, 23, '2025-09-13', 5, '추천합니다.', '2025-09-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (580, 12, 3, '2025-09-28', 1, '추천하지 않습니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (581, 36, 2, '2025-10-04', 4, '좋습니다.', '2025-10-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (582, 45, 22, '2025-07-14', 1, '추천하지 않습니다.', '2025-07-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (583, 48, 3, '2025-07-05', 1, '추천하지 않습니다.', '2025-07-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (584, 17, 1, '2025-07-20', 1, '추천하지 않습니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (585, 36, 19, '2025-09-26', 3, '보통입니다.', '2025-09-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (586, 6, 12, '2025-09-02', 1, '추천하지 않습니다.', '2025-09-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (587, 48, 19, '2025-07-23', 2, '별로입니다.', '2025-07-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (588, 3, 9, '2025-07-21', 5, '추천합니다.', '2025-07-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (589, 28, 24, '2025-08-08', 2, '별로입니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (590, 29, 7, '2025-08-23', 2, '별로입니다.', '2025-08-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (591, 29, 20, '2025-08-17', 5, '추천합니다.', '2025-08-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (592, 19, 9, '2025-09-01', 2, '별로입니다.', '2025-09-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (593, 16, 25, '2025-09-26', 2, '별로입니다.', '2025-09-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (594, 19, 20, '2025-07-13', 3, '보통입니다.', '2025-07-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (595, 12, 9, '2025-08-06', 2, '별로입니다.', '2025-08-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (596, 50, 4, '2025-08-08', 4, '좋습니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (597, 29, 12, '2025-07-11', 3, '보통입니다.', '2025-07-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (598, 4, 17, '2025-09-15', 3, '보통입니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (599, 22, 12, '2025-08-28', 1, '추천하지 않습니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (600, 29, 12, '2025-08-01', 2, '별로입니다.', '2025-08-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (601, 37, 16, '2025-07-10', 1, '추천하지 않습니다.', '2025-07-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (602, 37, 16, '2025-09-25', 4, '좋습니다.', '2025-09-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (603, 8, 18, '2025-07-16', 2, '별로입니다.', '2025-07-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (604, 43, 2, '2025-07-12', 3, '보통입니다.', '2025-07-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (605, 11, 3, '2025-09-05', 1, '추천하지 않습니다.', '2025-09-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (606, 42, 24, '2025-08-21', 5, '추천합니다.', '2025-08-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (607, 13, 9, '2025-09-17', 3, '보통입니다.', '2025-09-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (608, 24, 22, '2025-08-01', 2, '별로입니다.', '2025-08-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (609, 6, 10, '2025-07-14', 2, '별로입니다.', '2025-07-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (610, 4, 8, '2025-09-15', 4, '좋습니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (611, 14, 6, '2025-09-17', 3, '보통입니다.', '2025-09-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (612, 41, 9, '2025-09-30', 4, '좋습니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (613, 12, 9, '2025-08-28', 1, '추천하지 않습니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (614, 32, 5, '2025-07-12', 1, '추천하지 않습니다.', '2025-07-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (615, 32, 21, '2025-09-30', 1, '추천하지 않습니다.', '2025-10-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (616, 48, 16, '2025-07-01', 5, '추천합니다.', '2025-07-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (617, 34, 6, '2025-07-30', 5, '추천합니다.', '2025-07-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (618, 5, 25, '2025-07-03', 3, '보통입니다.', '2025-07-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (619, 10, 20, '2025-09-28', 4, '좋습니다.', '2025-09-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (620, 8, 12, '2025-08-07', 2, '별로입니다.', '2025-08-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (621, 20, 19, '2025-08-27', 3, '보통입니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (622, 50, 19, '2025-07-28', 3, '보통입니다.', '2025-07-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (623, 7, 20, '2025-07-16', 2, '별로입니다.', '2025-07-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (624, 7, 3, '2025-09-19', 3, '보통입니다.', '2025-09-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (625, 46, 16, '2025-07-25', 4, '좋습니다.', '2025-07-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (626, 50, 22, '2025-08-27', 2, '별로입니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (627, 25, 8, '2025-10-07', 4, '좋습니다.', '2025-10-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (628, 36, 3, '2025-07-02', 4, '좋습니다.', '2025-07-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (629, 6, 10, '2025-09-15', 1, '추천하지 않습니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (630, 34, 3, '2025-08-18', 5, '추천합니다.', '2025-08-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (631, 14, 9, '2025-09-06', 5, '추천합니다.', '2025-09-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (632, 32, 5, '2025-10-01', 5, '추천합니다.', '2025-10-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (633, 6, 1, '2025-08-22', 1, '추천하지 않습니다.', '2025-08-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (634, 4, 25, '2025-09-27', 1, '추천하지 않습니다.', '2025-09-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (635, 7, 7, '2025-09-14', 4, '좋습니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (636, 39, 3, '2025-08-11', 2, '별로입니다.', '2025-08-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (637, 19, 24, '2025-08-07', 1, '추천하지 않습니다.', '2025-08-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (638, 7, 16, '2025-09-02', 5, '추천합니다.', '2025-09-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (639, 36, 6, '2025-07-10', 5, '추천합니다.', '2025-07-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (640, 38, 10, '2025-09-21', 1, '추천하지 않습니다.', '2025-09-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (641, 40, 21, '2025-08-10', 5, '추천합니다.', '2025-08-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (642, 38, 18, '2025-07-01', 4, '좋습니다.', '2025-07-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (643, 16, 9, '2025-09-28', 1, '추천하지 않습니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (644, 34, 24, '2025-07-13', 3, '보통입니다.', '2025-07-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (645, 14, 22, '2025-07-08', 3, '보통입니다.', '2025-07-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (646, 19, 13, '2025-07-10', 5, '추천합니다.', '2025-07-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (647, 4, 1, '2025-08-04', 1, '추천하지 않습니다.', '2025-08-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (648, 25, 24, '2025-10-05', 1, '추천하지 않습니다.', '2025-10-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (649, 18, 14, '2025-09-15', 3, '보통입니다.', '2025-09-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (650, 7, 14, '2025-07-13', 1, '추천하지 않습니다.', '2025-07-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (651, 22, 7, '2025-08-20', 4, '좋습니다.', '2025-08-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (652, 44, 24, '2025-07-22', 2, '별로입니다.', '2025-07-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (653, 40, 1, '2025-08-04', 1, '추천하지 않습니다.', '2025-08-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (654, 34, 24, '2025-08-26', 4, '좋습니다.', '2025-08-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (655, 35, 19, '2025-08-27', 4, '좋습니다.', '2025-08-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (656, 23, 23, '2025-08-14', 2, '별로입니다.', '2025-08-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (657, 39, 1, '2025-09-21', 1, '추천하지 않습니다.', '2025-09-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (658, 29, 7, '2025-10-04', 3, '보통입니다.', '2025-10-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (659, 21, 16, '2025-08-30', 3, '보통입니다.', '2025-08-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (660, 44, 13, '2025-08-17', 5, '추천합니다.', '2025-08-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (661, 23, 23, '2025-08-23', 2, '별로입니다.', '2025-08-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (662, 7, 15, '2025-09-12', 3, '보통입니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (663, 26, 3, '2025-09-02', 4, '좋습니다.', '2025-09-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (664, 9, 15, '2025-09-14', 3, '보통입니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (665, 5, 17, '2025-07-05', 5, '추천합니다.', '2025-07-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (666, 32, 12, '2025-08-27', 1, '추천하지 않습니다.', '2025-08-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (667, 37, 9, '2025-08-17', 2, '별로입니다.', '2025-08-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (668, 30, 20, '2025-08-04', 2, '별로입니다.', '2025-08-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (669, 2, 20, '2025-07-25', 2, '별로입니다.', '2025-07-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (670, 4, 23, '2025-10-03', 2, '별로입니다.', '2025-10-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (671, 41, 19, '2025-07-23', 1, '추천하지 않습니다.', '2025-07-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (672, 3, 16, '2025-08-03', 1, '추천하지 않습니다.', '2025-08-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (673, 50, 6, '2025-09-14', 1, '추천하지 않습니다.', '2025-09-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (674, 19, 22, '2025-08-30', 5, '추천합니다.', '2025-09-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (675, 10, 19, '2025-09-06', 4, '좋습니다.', '2025-09-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (676, 1, 24, '2025-10-07', 3, '보통입니다.', '2025-10-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (677, 45, 17, '2025-07-17', 5, '추천합니다.', '2025-07-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (678, 43, 18, '2025-07-22', 4, '좋습니다.', '2025-07-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (679, 5, 16, '2025-08-26', 3, '보통입니다.', '2025-08-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (680, 29, 7, '2025-09-05', 3, '보통입니다.', '2025-09-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (681, 38, 4, '2025-09-16', 5, '추천합니다.', '2025-09-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (682, 19, 17, '2025-08-23', 3, '보통입니다.', '2025-08-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (683, 15, 10, '2025-09-06', 3, '보통입니다.', '2025-09-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (684, 22, 2, '2025-09-21', 1, '추천하지 않습니다.', '2025-09-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (685, 36, 4, '2025-08-13', 1, '추천하지 않습니다.', '2025-08-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (686, 18, 2, '2025-08-19', 2, '별로입니다.', '2025-08-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (687, 17, 25, '2025-07-25', 1, '추천하지 않습니다.', '2025-07-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (688, 9, 10, '2025-08-10', 4, '좋습니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (689, 41, 14, '2025-09-01', 5, '추천합니다.', '2025-09-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (690, 36, 24, '2025-07-05', 1, '추천하지 않습니다.', '2025-07-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (691, 18, 20, '2025-07-10', 2, '별로입니다.', '2025-07-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (692, 15, 19, '2025-08-26', 5, '추천합니다.', '2025-08-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (693, 4, 17, '2025-08-25', 5, '추천합니다.', '2025-08-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (694, 27, 14, '2025-09-18', 3, '보통입니다.', '2025-09-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (695, 9, 5, '2025-08-01', 5, '추천합니다.', '2025-08-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (696, 38, 17, '2025-07-20', 1, '추천하지 않습니다.', '2025-07-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (697, 14, 17, '2025-09-19', 3, '보통입니다.', '2025-09-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (698, 26, 25, '2025-07-05', 4, '좋습니다.', '2025-07-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (699, 12, 11, '2025-10-03', 5, '추천합니다.', '2025-10-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (700, 37, 1, '2025-07-23', 3, '보통입니다.', '2025-07-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (701, 40, 3, '2025-07-20', 4, '좋습니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (702, 20, 14, '2025-07-17', 3, '보통입니다.', '2025-07-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (703, 49, 24, '2025-08-20', 3, '보통입니다.', '2025-08-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (704, 18, 11, '2025-09-29', 4, '좋습니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (705, 38, 8, '2025-08-25', 1, '추천하지 않습니다.', '2025-08-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (706, 49, 22, '2025-07-05', 5, '추천합니다.', '2025-07-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (707, 32, 5, '2025-08-04', 3, '보통입니다.', '2025-08-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (708, 14, 24, '2025-09-17', 1, '추천하지 않습니다.', '2025-09-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (709, 7, 1, '2025-08-08', 4, '좋습니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (710, 13, 6, '2025-09-10', 1, '추천하지 않습니다.', '2025-09-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (711, 12, 8, '2025-10-05', 2, '별로입니다.', '2025-10-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (712, 38, 16, '2025-09-29', 3, '보통입니다.', '2025-09-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (713, 15, 1, '2025-09-21', 1, '추천하지 않습니다.', '2025-09-22');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (714, 10, 24, '2025-08-05', 3, '보통입니다.', '2025-08-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (715, 50, 8, '2025-09-11', 4, '좋습니다.', '2025-09-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (716, 4, 12, '2025-09-24', 3, '보통입니다.', '2025-09-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (717, 24, 11, '2025-08-29', 1, '추천하지 않습니다.', '2025-08-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (718, 48, 13, '2025-09-12', 3, '보통입니다.', '2025-09-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (719, 47, 21, '2025-07-28', 3, '보통입니다.', '2025-07-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (720, 16, 4, '2025-09-12', 1, '추천하지 않습니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (721, 50, 1, '2025-08-31', 4, '좋습니다.', '2025-09-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (722, 50, 10, '2025-08-09', 5, '추천합니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (723, 44, 20, '2025-08-31', 2, '별로입니다.', '2025-09-01');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (724, 33, 16, '2025-09-03', 1, '추천하지 않습니다.', '2025-09-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (725, 5, 16, '2025-08-29', 3, '보통입니다.', '2025-08-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (726, 20, 1, '2025-07-16', 4, '좋습니다.', '2025-07-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (727, 30, 3, '2025-08-29', 2, '별로입니다.', '2025-08-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (728, 7, 16, '2025-08-16', 5, '추천합니다.', '2025-08-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (729, 3, 6, '2025-08-13', 2, '별로입니다.', '2025-08-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (730, 32, 12, '2025-08-22', 1, '추천하지 않습니다.', '2025-08-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (731, 26, 16, '2025-08-11', 4, '좋습니다.', '2025-08-13');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (732, 17, 7, '2025-08-21', 3, '보통입니다.', '2025-08-23');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (733, 15, 13, '2025-08-06', 2, '별로입니다.', '2025-08-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (734, 45, 18, '2025-07-10', 1, '추천하지 않습니다.', '2025-07-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (735, 20, 7, '2025-09-17', 4, '좋습니다.', '2025-09-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (736, 28, 15, '2025-08-19', 2, '별로입니다.', '2025-08-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (737, 38, 11, '2025-08-08', 3, '보통입니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (738, 50, 19, '2025-07-01', 1, '추천하지 않습니다.', '2025-07-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (739, 38, 15, '2025-09-01', 3, '보통입니다.', '2025-09-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (740, 3, 20, '2025-08-02', 5, '추천합니다.', '2025-08-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (741, 42, 6, '2025-08-12', 2, '별로입니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (742, 13, 5, '2025-08-15', 3, '보통입니다.', '2025-08-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (743, 10, 17, '2025-09-14', 2, '별로입니다.', '2025-09-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (744, 3, 11, '2025-08-05', 5, '추천합니다.', '2025-08-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (745, 50, 13, '2025-09-26', 2, '별로입니다.', '2025-09-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (746, 18, 3, '2025-09-23', 2, '별로입니다.', '2025-09-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (747, 3, 24, '2025-09-30', 1, '추천하지 않습니다.', '2025-10-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (748, 20, 8, '2025-07-17', 5, '추천합니다.', '2025-07-19');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (749, 31, 17, '2025-09-03', 3, '보통입니다.', '2025-09-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (750, 28, 15, '2025-07-11', 3, '보통입니다.', '2025-07-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (751, 46, 2, '2025-09-27', 2, '별로입니다.', '2025-09-27');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (752, 12, 10, '2025-07-05', 2, '별로입니다.', '2025-07-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (753, 13, 9, '2025-08-16', 5, '추천합니다.', '2025-08-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (754, 45, 10, '2025-07-19', 1, '추천하지 않습니다.', '2025-07-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (755, 3, 24, '2025-07-17', 2, '별로입니다.', '2025-07-17');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (756, 47, 2, '2025-07-21', 4, '좋습니다.', '2025-07-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (757, 1, 9, '2025-08-06', 3, '보통입니다.', '2025-08-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (758, 26, 23, '2025-07-18', 2, '별로입니다.', '2025-07-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (759, 7, 24, '2025-09-20', 1, '추천하지 않습니다.', '2025-09-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (760, 34, 12, '2025-09-28', 3, '보통입니다.', '2025-09-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (761, 22, 15, '2025-08-04', 4, '좋습니다.', '2025-08-05');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (762, 20, 21, '2025-08-29', 4, '좋습니다.', '2025-08-30');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (763, 49, 5, '2025-09-24', 5, '추천합니다.', '2025-09-26');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (764, 27, 7, '2025-08-03', 2, '별로입니다.', '2025-08-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (765, 12, 10, '2025-07-11', 1, '추천하지 않습니다.', '2025-07-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (766, 38, 15, '2025-10-06', 5, '추천합니다.', '2025-10-07');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (767, 42, 3, '2025-09-08', 2, '별로입니다.', '2025-09-08');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (768, 50, 7, '2025-08-25', 4, '좋습니다.', '2025-08-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (769, 38, 11, '2025-07-28', 4, '좋습니다.', '2025-07-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (770, 12, 20, '2025-08-06', 5, '추천합니다.', '2025-08-06');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (771, 1, 11, '2025-07-28', 4, '좋습니다.', '2025-07-29');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (772, 19, 6, '2025-07-15', 4, '좋습니다.', '2025-07-15');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (773, 27, 19, '2025-08-24', 5, '추천합니다.', '2025-08-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (774, 19, 24, '2025-08-22', 2, '별로입니다.', '2025-08-24');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (775, 42, 15, '2025-08-11', 2, '별로입니다.', '2025-08-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (776, 17, 1, '2025-07-11', 2, '별로입니다.', '2025-07-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (777, 15, 19, '2025-09-26', 1, '추천하지 않습니다.', '2025-09-28');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (778, 14, 4, '2025-08-18', 2, '별로입니다.', '2025-08-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (779, 2, 23, '2025-08-10', 3, '보통입니다.', '2025-08-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (780, 30, 13, '2025-07-11', 5, '추천합니다.', '2025-07-12');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (781, 29, 6, '2025-07-14', 3, '보통입니다.', '2025-07-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (782, 19, 18, '2025-07-31', 2, '별로입니다.', '2025-08-02');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (783, 28, 1, '2025-08-08', 4, '좋습니다.', '2025-08-09');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (784, 25, 2, '2025-10-04', 4, '좋습니다.', '2025-10-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (785, 48, 9, '2025-07-01', 3, '보통입니다.', '2025-07-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (786, 33, 3, '2025-09-17', 1, '추천하지 않습니다.', '2025-09-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (787, 36, 2, '2025-07-19', 3, '보통입니다.', '2025-07-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (788, 18, 4, '2025-07-15', 3, '보통입니다.', '2025-07-16');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (789, 34, 4, '2025-09-11', 5, '추천합니다.', '2025-09-11');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (790, 41, 12, '2025-10-02', 5, '추천합니다.', '2025-10-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (791, 20, 3, '2025-08-10', 5, '추천합니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (792, 22, 13, '2025-07-04', 4, '좋습니다.', '2025-07-04');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (793, 11, 12, '2025-07-14', 4, '좋습니다.', '2025-07-14');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (794, 9, 2, '2025-08-03', 1, '추천하지 않습니다.', '2025-08-03');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (795, 40, 24, '2025-07-20', 1, '추천하지 않습니다.', '2025-07-20');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (796, 13, 6, '2025-07-21', 1, '추천하지 않습니다.', '2025-07-21');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (797, 27, 8, '2025-08-09', 1, '추천하지 않습니다.', '2025-08-10');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (798, 38, 7, '2025-07-24', 1, '추천하지 않습니다.', '2025-07-25');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (799, 44, 17, '2025-09-18', 4, '좋습니다.', '2025-09-18');
insert into Reviews (review_id, user_id, menu_id, log_date, taste_rating, content, created_at) values (800, 44, 23, '2025-08-11', 4, '좋습니다.', '2025-08-13');

-- Comments 생성
-- 100개의 댓글 데이터 생성
insert into Comments (comment_id, review_id, user_id, content, created_at) values (1, 641, 7, '인정합니다.', '2025-10-10');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (2, 550, 26, '인정합니다.', '2025-10-29');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (3, 110, 42, '인정합니다.', '2025-10-14');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (4, 130, 20, '인정합니다.', '2025-10-27');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (5, 763, 2, '인정합니다.', '2025-10-30');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (6, 662, 38, '인정합니다.', '2025-10-23');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (7, 303, 48, '인정합니다.', '2025-10-30');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (8, 555, 1, '인정합니다.', '2025-10-19');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (9, 728, 1, '인정합니다.', '2025-10-13');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (10, 55, 23, '인정합니다.', '2025-10-13');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (11, 509, 21, '인정합니다.', '2025-10-22');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (12, 498, 14, '인정합니다.', '2025-10-20');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (13, 605, 26, '인정합니다.', '2025-10-23');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (14, 578, 23, '인정합니다.', '2025-10-26');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (15, 84, 17, '인정합니다.', '2025-10-25');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (16, 185, 26, '인정합니다.', '2025-10-30');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (17, 641, 11, '인정합니다.', '2025-10-23');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (18, 523, 6, '인정합니다.', '2025-10-23');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (19, 31, 8, '인정합니다.', '2025-10-23');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (20, 719, 34, '인정합니다.', '2025-10-12');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (21, 365, 50, '맞아요.', '2025-10-28');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (22, 294, 25, '맞아요.', '2025-10-12');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (23, 84, 16, '맞아요.', '2025-10-22');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (24, 454, 33, '맞아요.', '2025-10-12');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (25, 336, 20, '맞아요.', '2025-10-30');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (26, 279, 13, '맞아요.', '2025-10-08');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (27, 450, 40, '맞아요.', '2025-10-30');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (28, 392, 48, '맞아요.', '2025-10-13');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (29, 99, 27, '맞아요.', '2025-10-21');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (30, 799, 42, '맞아요.', '2025-10-25');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (31, 379, 44, '맞아요.', '2025-10-30');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (32, 142, 9, '맞아요.', '2025-10-17');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (33, 760, 14, '맞아요.', '2025-10-15');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (34, 231, 6, '맞아요.', '2025-10-26');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (35, 459, 6, '맞아요.', '2025-10-21');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (36, 730, 48, '맞아요.', '2025-10-23');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (37, 671, 27, '맞아요.', '2025-10-21');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (38, 400, 49, '맞아요.', '2025-10-14');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (39, 502, 40, '맞아요.', '2025-10-16');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (40, 288, 25, '맞아요.', '2025-10-21');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (41, 386, 27, '저는 별로.', '2025-10-28');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (42, 578, 10, '저는 별로.', '2025-10-22');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (43, 640, 24, '저는 별로.', '2025-10-10');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (44, 746, 18, '저는 별로.', '2025-10-15');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (45, 445, 43, '저는 별로.', '2025-10-10');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (46, 431, 44, '저는 별로.', '2025-11-03');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (47, 455, 15, '저는 별로.', '2025-11-04');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (48, 414, 38, '저는 별로.', '2025-10-18');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (49, 633, 38, '저는 별로.', '2025-10-29');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (50, 118, 32, '저는 별로.', '2025-10-14');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (51, 120, 14, '저는 별로.', '2025-10-24');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (52, 475, 16, '저는 별로.', '2025-10-08');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (53, 2, 13, '저는 별로.', '2025-10-26');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (54, 143, 31, '저는 별로.', '2025-10-16');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (55, 333, 28, '저는 별로.', '2025-10-14');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (56, 449, 32, '저는 별로.', '2025-11-04');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (57, 50, 23, '저는 별로.', '2025-10-08');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (58, 672, 32, '저는 별로.', '2025-10-26');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (59, 709, 40, '저는 별로.', '2025-11-03');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (60, 439, 19, '저는 별로.', '2025-10-31');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (61, 332, 30, '공감합니다.', '2025-10-09');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (62, 218, 20, '공감합니다.', '2025-10-22');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (63, 705, 5, '공감합니다.', '2025-10-11');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (64, 642, 4, '공감합니다.', '2025-10-09');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (65, 63, 35, '공감합니다.', '2025-10-24');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (66, 314, 17, '공감합니다.', '2025-11-03');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (67, 126, 4, '공감합니다.', '2025-11-03');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (68, 187, 36, '공감합니다.', '2025-10-22');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (69, 16, 18, '공감합니다.', '2025-10-13');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (70, 316, 33, '공감합니다.', '2025-10-23');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (71, 399, 2, '공감합니다.', '2025-10-28');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (72, 87, 9, '공감합니다.', '2025-10-21');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (73, 117, 47, '공감합니다.', '2025-10-24');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (74, 169, 39, '공감합니다.', '2025-11-02');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (75, 535, 33, '공감합니다.', '2025-11-03');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (76, 622, 38, '공감합니다.', '2025-10-14');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (77, 315, 49, '공감합니다.', '2025-10-13');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (78, 88, 15, '공감합니다.', '2025-10-17');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (79, 761, 19, '공감합니다.', '2025-10-31');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (80, 589, 18, '공감합니다.', '2025-10-10');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (81, 561, 9, '리뷰 잘 봤습니다.', '2025-10-19');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (82, 7, 6, '리뷰 잘 봤습니다.', '2025-10-30');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (83, 120, 26, '리뷰 잘 봤습니다.', '2025-10-12');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (84, 156, 10, '리뷰 잘 봤습니다.', '2025-10-16');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (85, 246, 44, '리뷰 잘 봤습니다.', '2025-10-19');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (86, 331, 1, '리뷰 잘 봤습니다.', '2025-10-13');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (87, 328, 18, '리뷰 잘 봤습니다.', '2025-10-24');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (88, 83, 3, '리뷰 잘 봤습니다.', '2025-10-10');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (89, 208, 35, '리뷰 잘 봤습니다.', '2025-10-22');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (90, 331, 38, '리뷰 잘 봤습니다.', '2025-10-17');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (91, 70, 8, '리뷰 잘 봤습니다.', '2025-10-15');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (92, 329, 46, '리뷰 잘 봤습니다.', '2025-10-13');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (93, 785, 45, '리뷰 잘 봤습니다.', '2025-10-20');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (94, 103, 23, '리뷰 잘 봤습니다.', '2025-10-21');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (95, 161, 40, '리뷰 잘 봤습니다.', '2025-10-23');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (96, 579, 6, '리뷰 잘 봤습니다.', '2025-10-24');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (97, 193, 9, '리뷰 잘 봤습니다.', '2025-10-14');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (98, 344, 41, '리뷰 잘 봤습니다.', '2025-10-08');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (99, 269, 7, '리뷰 잘 봤습니다.', '2025-10-27');
insert into Comments (comment_id, review_id, user_id, content, created_at) values (100, 2, 24, '리뷰 잘 봤습니다.', '2025-11-03');