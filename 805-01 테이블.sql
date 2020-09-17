/*
	정원혁 2014.11. 
	이장래 저 "SQL Server 2012 운영과 개발 : 이장래와 함께하는" 의 스크립트를 migration
	http://www.yes24.com/SearchCorner/Search?scode=032&ozsrank=1&author_yn=y&query=%c0%cc%c0%e5%b7%a1&domain=all
*/
-- 
--  5.1 테이블 만들기
-- 

-- 1) Smaple 데이터베이스 만들기

-- DROP DATABASE IF EXISTS Sample 
;
CREATE DATABASE IF NOT EXISTS Sample
;


-- 2) 테이블 만들기

USE Sample
;
SHOW TABLES;

-- 직원 테이블 만들기
CREATE TABLE 직원 (
	사원번호 char(5) PRIMARY KEY NOT NULL,
	-- 이름 nchar(4) NOT NULL,
	이름 char(4) CHARACTER SET UTF8MB4 NOT NULL,
	성별 char(1) NOT NULL,
	입사일 date NOT NULL,
	전자메일 varchar(60) NOT NULL,
	전화번호 varchar(20) NULL,
	부서코드 char(3) NOT NULL
) 
;
-- 1 warning(s): 3720 NATIONAL/NCHAR/NVARCHAR implies the character set UTF8MB3, which will be replaced by UTF8MB4 in a future release. Please consider using CHAR(x) CHARACTER SET UTF8MB4 in order to be unambiguous.



-- 3) 열 추가 및 삭제

-- 열 추가
ALTER TABLE 직원
	ADD 급여 int NULL
;

-- 열 삭제
ALTER TABLE 직원
	DROP COLUMN 급여
;

-- 열 수정
ALTER TABLE 직원
	MODIFY 전화번호 VARCHAR(30) NULL; 

-- 테이블 이름 바꾸기
ALTER TABLE 직원
  RENAME TO 사원;
