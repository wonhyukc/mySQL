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


/*
-- 4) 저장 프로시저 결과 INSERT

-- 저장 프로시저 만들기
DELIMITER $$
CREATE PROCEDURE usp_GetVacation ( IN cEmpID char(5) )
begin
	SELECT EmpID, BeginDate, EndDate, Duration
		FROM Vacation
		WHERE EMpID = cEmpID;
end $$
DELIMITER ;

-- 임시 테이블 만들기
CREATE TEMPORARY TABLE Vacation (
   EmpID char(5),
   BeginDate datetime,
   EndDate datetime,
   Duration int
);
 
-- 저장 프로시저 결과 INSERT
INSERT INTO Vacation EXEC usp_GetVacation 'S0001';

SELECT * FROM #Vacation
;
*/

-- 5) AUTO_INCREMENT 속성에 INSERT
SELECT * FROM Vacation;

DELETE FROM Vacation	-- FROM 빠지면 오류
	WHERE VacationID = 2;

SELECT * FROM Vacation;

-- AUTO_INCREMENT 에 임의의 값 삽입: 가능하다.
INSERT INTO Vacation(VacationID, EmpID, BeginDate, EndDate, Reason)
   VALUES(2, 'S0003', '2007-01-02', '2007-01-08', N'신년 맞이 기분 내기');

SELECT * FROM Vacation;



-- 
--  B. UPDATE
-- 


-- 1) 기본적인 UPDATE 문

UPDATE Employee
   SET EmpName = N'홍길퉁'
   WHERE EmpID = 'S0001';

SELECT * 
	FROM Employee
	WHERE EmpID = 'S0001';


-- 2) FROM 절을 사용한 다양한 조건 지정
select * from Employee;
SELECT EmpID, COUNT(*) as cnt	FROM Vacation GROUP BY  EmpID  HAVING count(*) > 2;

UPDATE Employee a
	JOIN (
		SELECT EmpID, COUNT(*) as cnt	FROM Vacation GROUP BY  EmpID  HAVING count(*) > 2
    ) b ON a.EmpID = b.EmpID	
SET Salary = Salary * 0.8;
/*
Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column 
To disable safe mode, toggle the option in Preferences -> SQL Queries and reconnect.	0.000 sec
*/

select * from Employee;


-- 
--  C. DELETE
-- 


-- 1) 기본적인 DELETE문

DELETE from Vacation
   WHERE VacationID = 10;

-- TRUNCATE TABLE

TRUNCATE TABLE Vacation;
