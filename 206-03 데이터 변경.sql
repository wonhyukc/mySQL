/*
	정원혁 2014.11. 
	이장래 저 "SQL Server 2012 운영과 개발 : 이장래와 함께하는" 의 스크립트를 migration
	http://www.yes24.com/SearchCorner/Search?scode=032&ozsrank=1&author_yn=y&query=%c0%cc%c0%e5%b7%a1&domain=all
	
	https://github.com/wonhyukc/mySQL
*/
/*
	실행하기 전/후에 "206-01 HRDB 데이터베이스.sql" 을 실행해서 깨끗한 HRDB를 만들어 두고 진행하세요.
    이 실습을 하면 데이터가 달라집니다. 
*/

use HRDB;
SELECT database();
-- 
--  6.3 데이터 변경
-- 
/*
DML: Data Manipulation Language

INSERT
UPDATE
DELETE

SELECT

DDL: Data Definition Language

CREATE TABLE | VIEW | PROC.....
ALTER 
DROP
*/

/* 기본 골격

INSERT INTO 테이블 
VALUES

UPDATE 테이블
SET 컬럼 = 값, ....
WHERE

DELETE FROM  테이블
WHERE 

SELECT 컬럼
FROM 테이블
WHERE 
*/


-- 
--  A. INSERT
-- 

-- 1) 기본적인 INSERT 문

-- 대상 열 나열
INSERT INTO Department(DeptID, DeptName, UnitID, StartDate)
   VALUES('PRD', '상품', 'A', now());
SELECT * FROM Department;

INSERT INTO Department(DeptName, UnitID, StartDate, DeptID)
   VALUES('상품', 'A', now(), 'PR2');
SELECT * FROM Department;


-- 대상 열 생략
INSERT INTO Department
   VALUES('DBA', 'DB관리', 'A', now());
SELECT * FROM Department;


-- 2) 동시에 여러 행 INSERT 가능
INSERT INTO Department
   VALUES('OPR', '운영', 'A', now()), ('CST', '고객서비스', NULL, now());

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

-- 4) INSERT ... PROC : mySQL에서는 불가능

-- 5) AUTO_INCREMENT 속성에 INSERT
SELECT * FROM Vacation;

DELETE FROM Vacation	-- FROM 빠지면 오류
	WHERE VacationID = 2;

SELECT * FROM Vacation;

-- 정상적인 입력
INSERT INTO Vacation VALUES( NULL,'S0002', '2006-12-24', '2006-12-26', '크리스마스 기념 가족 여행');
SELECT * FROM Vacation;

-- AUTO_INCREMENT 에 임의의 값 삽입: 가능하다.
INSERT INTO Vacation
   VALUES(23, 'S0003', '2007-01-02', '2007-01-08', '신년 맞이 기분 내기');   
SELECT * FROM Vacation;

-- 그럼 이번엔 무슨 값이 입력될까?
INSERT INTO Vacation VALUES( NULL,'S0002', '2006-12-24', '2006-12-26', '크리스마스 기념 가족 여행');
SELECT * FROM Vacation;



-- 
--  B. UPDATE
-- 


-- 1) 기본적인 UPDATE 문

UPDATE Employee
   SET EmpName = '홍길퉁'
   -- WHERE EmpID = 'S0001'
   ;

SELECT * 
	FROM Employee
	-- WHERE EmpID = 'S0001'
    ;


-- 2) FROM 절을 사용한 다양한 조건 지정
select * from Employee;

SELECT EmpID, COUNT(*) as cnt	FROM Vacation GROUP BY  EmpID  HAVING count(*) > 2;
--  "206-04 데이터 집계.sql" 를 배워야 이해할 수 있다.

select * from Employee where empid = 's0001';
-- salary 값을 기억해두자 : 8500

UPDATE Employee AS a
	JOIN (
		SELECT EmpID, COUNT(*) as cnt	FROM Vacation GROUP BY  EmpID  HAVING count(*) > 2
    ) b ON a.EmpID = b.EmpID	
SET Salary = Salary * 0.8;

select * from Employee;
select * from Employee where empid = 's0001';
-- salary 값을 비교해보자. : 8500 > 6800


UPDATE Employee 
SET salary = 100000;

/*
다음 오류 메시지가 나오면 
Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. 
 To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
 
이걸 해야 한다.
Edit > Preferences > SQL Editor > 제일 밑 Safe Updates 체크 해제 > 재 접속
*/
select * from Employee;


-- 
--  C. DELETE
-- 


-- 1) 기본적인 DELETE문

SELECT * FROM Vacation;

DELETE from Vacation
   WHERE VacationID = 10;
   
SELECT * FROM Vacation;

-- TRUNCATE TABLE
DELETE from Vacation;
TRUNCATE TABLE Vacation;
SELECT * FROM Vacation;


/*
	실행하기 전/후에 "206-01 HRDB 데이터베이스.sql" 을 실행해서 깨끗한 HRDB를 만들어 두고 진행하세요.
    이 실습을 하면 데이터가 달라집니다. 
*/
