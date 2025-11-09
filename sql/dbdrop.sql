/*
 * dbdrop.sql
 * 데이터베이스의 모든 테이블을 삭제하는 스크립트
 * (과제 요구사항 [2-3] 충족)
 */

-- 0. 데이터베이스 선택
USE team13;

-- 1. 테이블 삭제
-- 외래키 참조 역순으로 drop해야함. 
DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS UserProfile;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Menus;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS WeatherLog;
DROP TABLE IF EXISTS WeatherConditions;