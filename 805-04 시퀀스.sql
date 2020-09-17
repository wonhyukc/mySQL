/*
	정원혁 2014.11. 
	이장래 저 "SQL Server 2012 운영과 개발 : 이장래와 함께하는" 의 스크립트를 migration
	http://www.yes24.com/SearchCorner/Search?scode=032&ozsrank=1&author_yn=y&query=%c0%cc%c0%e5%b7%a1&domain=all
*/
-- 
--  5.4 시퀀스
-- 


-- 1) 시퀀스 만들기

USE AdventureWorks2012;

-- 시퀀스 만들기
CREATE SEQUENCE Seq01 
	AS bigint
	START WITH 1
	INCREMENT BY 1;

-- 시퀀스 제거하기 
DROP SEQUENCE Seq01 ;


-- 2) 하나의 테이블에대한 시쿼스

USE TempDB;

-- 테이블 만들기
CREATE TABLE TestSeq01 (
   col1 int PRIMARY KEY,
   col2 int,
   col3 int
);

-- 시퀀스 만들기
CREATE SEQUENCE Seq01
   START WITH 1
   INCREMENT BY 1;

-- 행 추가하기
INSERT TestSeq01 (col1, col2, col3) VALUES (NEXT VALUE FOR Seq01, 10, 100) 
INSERT TestSeq01 (col1, col2, col3) VALUES (NEXT VALUE FOR Seq01, 20, 200)
INSERT TestSeq01 (col1, col2, col3) VALUES (NEXT VALUE FOR Seq01, 30, 300);

-- 결과 확인
SELECT * FROM TestSeq01;


-- 3) INSERT 전에 다음 증가 값 얻기

DECLARE @NextID int
SET @NextID = NEXT VALUE FOR Seq01
-- 여러 작업이 이 사이에 발생 했다는 가정
-- 그리고 이후에 변수의 값으로 다음 값 추가
INSERT TestSeq01(col1, col2, col3) VALUES (@NextID, 40, 400);

-- 결과 확인
SELECT * FROM TestSeq01 ;


-- 4) 여러 테이블과 연관된 시퀀스

-- 시퀀스 만들기
CREATE SEQUENCE Seq02 AS int
   START WITH 1
   INCREMENT BY 1 ;

-- 여러 테이블 만들기
CREATE TABLE TestSeq02 (
   col1 int PRIMARY KEY DEFAULT (NEXT VALUE FOR Seq02), -- 기본 값 지정
   col2 int,
   col3 int
);
CREATE TABLE TestSeq03 (
   col1 int PRIMARY KEY DEFAULT (NEXT VALUE FOR Seq02), -- 기본 값 지정
   col2 int,
   col3 int
);
CREATE TABLE TestSeq04 (
   col1 int PRIMARY KEY DEFAULT (NEXT VALUE FOR Seq02), -- 기본 값 지정
   col2 int,
   col3 int
);

-- 여러 테이블들에 대해서 순차적으로 데이터 추가
INSERT TestSeq02 (col2, col3) VALUES (10, 100)
INSERT TestSeq02 (col2, col3) VALUES (20, 200)
INSERT TestSeq03 (col2, col3) VALUES (11, 201)
INSERT TestSeq03 (col2, col3) VALUES (21, 201)
INSERT TestSeq04 (col2, col3) VALUES (12, 102)
INSERT TestSeq02 (col2, col3) VALUES (30, 300)
INSERT TestSeq03 (col2, col3) VALUES (31, 301);

-- 여러 테이블에 반영 된 Sequence 결과 확인
SELECT col1, col2, col3 FROM TestSeq02
UNION ALL
SELECT col1, col2, col3 FROM TestSeq03
UNION ALL
SELECT col1, col2, col3 FROM TestSeq04
   ORDER BY col1 ASC;


-- 5) 시퀀스 값이 반복되게 하기

-- SELECT 결과를 가져와 연습용 테이블 만들기
SELECT * 
	INTO Products
	FROM AdventureWorks2012.Production.Product;

   -- 시퀀스 만들기
CREATE SEQUENCE Seq03 AS tinyint
   START WITH 1
   INCREMENT BY 1
   MINVALUE 1
   MAXVALUE 5
   CYCLE ;

-- 반복되는 값 확인하기
SELECT NEXT VALUE FOR Seq03 AS 'SurveyGroup', Name 
   FROM Products;


-- 6) OVER 절로 정렬 된 결과에 시퀀스 사용하기

-- 시퀀스 만들기
CREATE SEQUENCE Seq04  AS tinyint
   START WITH 1
   INCREMENT BY 1;

-- Name 열을 기준으로 정렬 한 후 시퀀스 값 생성하기
SELECT NEXT VALUE FOR Seq04 OVER (ORDER BY Name) AS 'NutID', 
		ProductID, Name, ProductNumber
   FROM Products
   WHERE Name LIKE '%Nut%' ;


-- 7) 시퀀스 리셋 하기

-- 리셋 되지 않는 경우
SELECT NEXT VALUE FOR Seq04 OVER (ORDER BY Name) AS 'NutID', 
		ProductID, Name, ProductNumber 
   FROM Products
   WHERE Name LIKE '%Nut%' ;

-- 리셋 하기
ALTER SEQUENCE Seq04
   RESTART WITH 1 ;

-- 리셋 된 결과 확인
SELECT NEXT VALUE FOR Seq04 OVER (ORDER BY Name) AS 'NutID', 
		ProductID, Name, ProductNumber 
   FROM Products
   WHERE Name LIKE '%Nut%' ;