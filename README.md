# 빅데이터 팀 프로젝트: 인기 음식 데이터 분석 (오늘 뭐 먹지?)

2025-2 빅데이터응용 팀 프로젝트. PHP와 MariaDB(XAMPP) 환경을 기반으로, 사용자의 리뷰 데이터를 수집하고 고급 SQL 쿼리를 통해 '연령'과 '날씨'에 따른 '맞춤형 메뉴 추천' 웹사이트를 구현.

## 1. 주요 기능

과제 요구조건을 충족하기 위해 다음 핵심 기능들을 구현.

* 회원가입 및 로그인 (요구조건: 세션, 트랜잭션)
* 리뷰 작성 및 관리 (요구조건: INSERT, DELETE, UPDATE, SELECT)
* 리뷰에 댓글 달기 (요구조건: 추가 CRUD)
* 리뷰 작성 폼 (요구조건: 다양한 UI 컨트롤)


### 1.1. 4 kinds of advanced analysis functions

(요구조건: PreparedStatements를 사용한 동적 쿼리)

1. [집계] 연령/날씨별 "맛" 선호도
    * `GROUP BY`를 사용해 "20대", "비 오는 날" 등 특정 조건의 평균 맛 점수(`AVG(rating)`)를 집계.
2. [Rollup] 연령대별/카테고리별 리뷰 통계
    * `GROUP BY ... WITH ROLLUP`을 사용해 [전체] > [연령대별] > [연령대+카테고리별] 리뷰 총 수를 계층적으로 분석.
3. [랭킹] 연령/날씨 기반 "오늘의 메뉴" 랭킹
    * `DENSE_RANK() OVER (...)`를 사용해 사용자가 선택한 조건(예: 30대, 맑음)에서 평균 맛 점수가 가장 높은 메뉴 TOP 10을 추천.
4. [윈도잉] 내 '맛' 점수 vs 그룹 평균 비교
    * `AVG(rating) OVER (PARTITION BY ...)`를 사용해 메뉴 상세 페이지에서 '내가 준 점수'와 '해당 메뉴의 전체 평균 점수'를 나란히 비교.

## 2. 기술 스택

* Platform: XAMPP
* Server: Apache
* Backend: PHP
* Database: MariaDB (MySQL)
* Frontend: HTML

## 3. 로컬 개발 환경 세팅 (팀원 테스트용)

로컬 PC에서 프로젝트를 실행하고 테스트하기 위한 가이드.

1. XAMPP 제어판에서 **Apache**와 **MySQL**을 `Start`
2. (최초 1회) `htdocs` 폴더에 `teamXX` 이름으로 프로젝트를 `git clone`
    ```bash
    cd C:\xampp\htdocs
    git clone [깃허브_리포지토리_주소] teamXX
    ```
3. (이후) `htdocs/teamXX` 폴더로 이동해 최신 코드를 `git pull`
    ```bash
    cd C:\xampp\htdocs\teamXX
    git pull
    ```
4.  **DB 연결 설정 확인**
    * `config/db.php` (또는 DB 연결 파일) 열기
    * `DB_HOST`는 'localhost' (또는 '127.0.0.1')
    * `DB_NAME`, `DB_USER`, `DB_PASSWORD`는 `team13`

5. **DB 초기화 (데이터베이스 리셋이 필요할 때)**
    * XAMPP의 'Shell'을 열거나 MySQL CLI에 접속. (예: `mysql -u root -p`)
    * 아래 5줄을 순서대로 실행하여, DB를 완전히 삭제하고, 새로 만들고, 8개 테이블을 생성하고, 1000개 샘플 데이터를 삽입.
    ```sql
    DROP DATABASE IF EXISTS teamXX;
    CREATE DATABASE teamXX DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    USE teamXX;
    source [경로]/dbcreate.sql;
    source [경로]/dbinsert.sql; 
    ```
    * `[경로]`는 `dbcreate.sql` 파일이 있는 실제 위치(예: `C:/xampp/htdocs/teamXX/db/dbcreate.sql`)를 의미.

6. 웹 브라우저에서 `localhost/teamXX`로 접속하여 테스트를 시작.

## 4. 데이터베이스

### 4.1. 필수 제출 스크립트 (4개)

* `dbcreate.sql`: 모든 테이블과 제약조건(PK, FK, Index)을 생성.
* `dbinsert.sql`: 1000개 이상의 초기 샘플 데이터를 삽입.
* `dbdrop.sql`: 모든 테이블을 삭제. (FK 관계 순서 준수)
* `dbdump.sql`: `mysqldump`로 생성한 DB 전체 백업 파일.

### 4.2. 테이블 스키마 (총 8개)

1. Users: 사용자 기본 정보 (ID, PW)
2. UserProfile: 사용자 상세 정보 (생년, 성별) - `Users`와 1:1
3. Categories: 음식 카테고리 (한식, 중식 등)
4. Menus: 음식 메뉴 정보 (제육볶음 등) - `Categories`와 N:1
5. WeatherConditions: 날씨 분류 (맑음, 비 등) - DB 정규화
6. WeatherLog: 일자별 날씨/기온 기록 - `WeatherConditions`와 N:1
7. Reviews: 리뷰 정보 (평점, 가성비, 내용) - `Users`, `Menus`와 연결
8. Comments: 리뷰에 달린 댓글 - `Reviews`, `Users`와 연결

## 5. GitHub 사용 규칙

원활한 협업과 버전 관리를 위해 다음 규칙을 준수.

### 5.1. 브랜치 전략 (Branch Strategy)

* `main`: 최종 제출 가능한 안정 버전. **main 브랜치에 직접 커밋 금지.**
* `develop`: 팀원들의 작업물이 통합되는 개발 브랜치.
* `feature/기능이름`: 개별 기능 개발을 위한 브랜치. `develop` 브랜치에서 분기.

#### 브랜치 생성 규칙

1.  모든 기능 개발은 `develop` 브랜치에서 시작.
    ```bash
    git checkout develop
    git pull origin develop
    ```
2.  자신의 작업에 대한 `feature` 브랜치를 생성. (이름은 **영어 소문자**, **기능 중심**)
    ```bash
    # 예: 로그인 기능 구현 시
    git checkout -b feature/login
    
    # 예: 분석 페이지 UI 구현 시
    git checkout -b feature/analysis-ui
    ```

### 5.2. 커밋 메시지 (Commit Message)

커밋 메시지는 **유형(Type)**과 **주제(Subject)**로 구성.

`Type: Subject`

* **Type**: 커밋의 목적을 명시. (주로 사용되는 5가지)
    * `feat`: 새로운 기능 추가 (e.g., `feat: Add login function`)
    * `fix`: 버그 수정 (e.g., `fix: Correct SQL query error in analysis page`)
    * `style`: 코드 스타일 수정 (세미콜론, 들여쓰기 등)
    * `refactor`: 코드 리팩토링 (기능 변경 없는 내부 구조 개선)
    * `docs`: README.md 등 문서 수정

* **Subject**: 작업 내용을 50자 이내로 간결하게 작성.

### 5.3. 풀 리퀘스트 (Pull Request, PR)

1.  로컬 `feature` 브랜치에서의 작업이 완료되면, `develop` 브랜치로 Pull Request(PR) 생성.
    * **절대 `main` 브랜치로 PR 금지.**
2.  PR 제목은 커밋 메시지와 유사하게 `Type: Subject` 형식 권장.
3.  PR 본문에는 작업 내용 요약, (있다면) 관련 이슈 번호, 테스트 방법을 기재.
4.  팀원 **최소 1명 이상**의 **Approve(승인)** 받아야 Merge 가능.
5.  Merge는 `Squash and merge` (커밋 이력을 하나로 합침) 사용을 권장.

## 6. 팀원

* 팀장 (프론트): [윤소진]
* 팀원 (백엔드): [백소영]
* 팀원 (백엔드): [김재이]
* 팀원 (데이터베이스): [황채원]
  - 고정 X. 유동적으로 임무 할당 예정. 
