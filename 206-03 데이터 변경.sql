/*
	정원혁 2014.11. 
	이장래 저 "SQL Server 2012 운영과 개발 : 이장래와 함께하는" 의 스크립트를 migration
	http://www.yes24.com/SearchCorner/Search?scode=032&ozsrank=1&author_yn=y&query=%c0%cc%c0%e5%b7%a1&domain=all
	
	https://github.com/wonhyukc/mySQL
*/

use HRDB;
SELECT database();
-- 
--  6.3 데이터 변경
-- 



-- 
--  A. INSERT
-- 


-- 1) 기본적인 INSERT 문

-- 대상 열 나열
INSERT INTO Department(DeptID, DeptName, UnitID, StartDate)
   VALUES('PRD', N'상품', 'A', now());
SELECT * FROM Department;

-- 대상 열 생략
INSERT INTO Department
   VALUES('DBA', N'DB관리', 'A', now());
SELECT * FROM Department;


-- 2) 동시에 여러 행 INSERT 가능
INSERT INTO Department
   VALUES('OPR', N'운영', 'A', now()), ('CST', N'고객서비스', NULL, now());

SELECT * FROM Department;

-- 3) 상위 n 개 INSERT

-- 테이블 만들기
CREATE TABLE SampleVacation 
	SELECT * 
	FROM Vacation
	WHERE 1 = 0;

-- 상위 5 건만 INSERT
INSERT SampleVacation
   SELECT VacationID, EmpID, BeginDate, EndDate, Reason
      FROM Vacation
	  ORDER BY BeginDate DESC
      LIMIT 5;

SELECT * FROM SampleVacation;

