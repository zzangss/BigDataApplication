/*
 * dbcreate.sql
 * 데이터베이스 및 모든 테이블을 생성하는 스크립트
 * (과제 요구사항 [2-1] 충족)
 */

-- 1. 데이터베이스 선택 
-- 
--    이 스크립트를 실행하기 전에 phpMyAdmin에서 
--    데이터베이스 team13을
--    Collation 'utf8mb4_general_ci'로 생성
-- 
USE team13;


-- 2. 테이블 삭제
-- 스크립트를 반복 실행할 수 있도록 기존 테이블 삭제
DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS UserProfile;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Menus;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS WeatherLog;
DROP TABLE IF EXISTS WeatherConditions;


-- 3. 테이블 생성

-- Users (회원 기본 정보)
CREATE TABLE Users (
    user_id INT NOT NULL AUTO_INCREMENT COMMENT '개발용 유저 식별 아이디',
    username VARCHAR(100) NOT NULL COMMENT '유저 아이디',
    password VARCHAR(255) NOT NULL COMMENT '유저 비밀번호',
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (user_id),
    UNIQUE KEY (username),
    UNIQUE KEY (email)
);

-- UserProfile (회원 상세 정보 - 분석용)
CREATE TABLE UserProfile (
    user_id INT NOT NULL,
    birth_year INT COMMENT '연령대 분석용',
    gender VARCHAR(10) COMMENT '성별 분석용',
    PRIMARY KEY (user_id),
    CONSTRAINT fk_userprofile_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Categories (음식 카테고리)
CREATE TABLE Categories (
    category_id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL COMMENT '예: 한식, 중식',
    PRIMARY KEY (category_id),
    UNIQUE KEY (category_name)
);

-- Menus (음식 메뉴)
CREATE TABLE Menus (
    menu_id INT NOT NULL AUTO_INCREMENT,
    category_id INT NOT NULL,
    menu_name VARCHAR(100) NOT NULL COMMENT '예: 제육볶음',
    food_image_url VARCHAR(1024) NULL COMMENT '음식 이미지 경로 (URL 또는 파일 경로)',
    PRIMARY KEY (menu_id),
    INDEX idx_category (category_id),
    CONSTRAINT fk_menu_category
        FOREIGN KEY (category_id) REFERENCES Categories(category_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- WeatherConditions (날씨 상태)
CREATE TABLE WeatherConditions (
    condition_id INT NOT NULL AUTO_INCREMENT,
    condition_name ENUM('sunny', 'rainy', 'cloudy') NOT NULL,
    PRIMARY KEY (condition_id)
);

-- WeatherLog (일별 날씨 기록)
CREATE TABLE WeatherLog (
    log_date DATE NOT NULL COMMENT '기록 날짜',
    condition_id INT NOT NULL,
    temperature INT,
    PRIMARY KEY (log_date),
    INDEX idx_condition (condition_id),
    CONSTRAINT fk_weatherlog_condition
        FOREIGN KEY (condition_id) REFERENCES WeatherConditions(condition_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Reviews 
CREATE TABLE Reviews (
    review_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL COMMENT '작성자 (UserProfile 연결)',
    menu_id INT NOT NULL COMMENT '메뉴 (Menus 연결)',
    log_date DATE NOT NULL COMMENT '날씨 (WeatherLog 연결)',
    taste_rating INT NOT NULL COMMENT '맛 평점 (1~5)',
    content TEXT COMMENT '텍스트 리뷰',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '리뷰 실제 작성 시간',
    PRIMARY KEY (review_id),
    INDEX idx_user (user_id),
    INDEX idx_menu (menu_id),
    INDEX idx_log_date (log_date),
    CONSTRAINT fk_review_user
        FOREIGN KEY (user_id) REFERENCES UserProfile(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_review_menu
        FOREIGN KEY (menu_id) REFERENCES Menus(menu_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_review_weather
        FOREIGN KEY (log_date) REFERENCES WeatherLog(log_date)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Comments (리뷰에 대한 댓글)
CREATE TABLE Comments (
    comment_id INT NOT NULL AUTO_INCREMENT,
    review_id INT NOT NULL COMMENT '리뷰 FK',
    user_id INT NOT NULL COMMENT '댓글 작성자 FK (Users 연결)',
    content TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (comment_id),
    INDEX idx_review (review_id),
    INDEX idx_user_comment (user_id),
    CONSTRAINT fk_comment_review
        FOREIGN KEY (review_id) REFERENCES Reviews(review_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_comment_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);