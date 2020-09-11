/*
	정원혁 2014.11. 
	이장래 저 "SQL Server 2012 운영과 개발 : 이장래와 함께하는" 의 스크립트를 migration
	http://www.yes24.com/SearchCorner/Search?scode=032&ozsrank=1&author_yn=y&query=%c0%cc%c0%e5%b7%a1&domain=all

	https://github.com/wonhyukc/mySQL	
*/
-- *
-- * HRDB 데이터베이스
-- *


--  1) 데이터베이스 만들기
drop database IF EXISTS HRDB;
create database IF NOT EXISTS HRDB;
use HRDB;
SELECT database();

--  Unit 테이블 만들기
CREATE TABLE Unit (
	UnitID char(1) PRIMARY KEY,
	UnitName varchar(10) NOT NULL
);


INSERT INTO Unit VALUES ('A', '제1본부'), ('B', '제2본부'), ('C', '제3본부');
-- select * from unit;

--  Department 테이블 만들기
-- DROP TABLE Department ;
CREATE TABLE Department (
	DeptID char(3) PRIMARY KEY,
	DeptName varchar(10) NOT NULL,
	UnitID char(1) NULL,    
	StartDate date NOT NULL,
    CONSTRAINT `fk_dept_unit` FOREIGN KEY (`UnitID`) REFERENCES `Unit` (`UnitID`) ON UPDATE CASCADE
);


INSERT INTO Department VALUES('SYS', '정보시스템', 'A', '2007-01-01');
INSERT INTO Department VALUES('MKT', '영업', 'C', '2006-05-01');
INSERT INTO Department VALUES('HRD', '인사', 'B', '2006-05-01');
INSERT INTO Department VALUES('GE', '총무', 'B', '2007-03-01');
INSERT INTO Department VALUES('ACC', '회계', 'B', '2006-04-01');
INSERT INTO Department VALUES('ADV', '홍보', 'C', '2009-06-01');
INSERT INTO Department VALUES('STG', '전략기획', NULL, '2009-06-01');
-- select * from Department;


--  Employee 테이블 만들기
CREATE TABLE Employee (
	EmpID char(5) PRIMARY KEY,
	EmpName varchar(4) NOT NULL,
	Gender char(1) NOT NULL,
	HireDate date NOT NULL,
	RetireDate date NULL,
	DeptID char(3) NOT NULL REFERENCES Department(DeptID) ,
	EMail varchar(50) NOT NULL,
	Salary int NULL
);


--  데이터 추가
INSERT INTO Employee VALUES('S0001', '홍길동', 'M', '2006-01-01', NULL, 'SYS', 'hong@itforum.co.kr', 8500);
INSERT INTO Employee VALUES('S0002', '일지매', 'M', '2006-01-12', NULL, 'GE', 'jimae@itforum.co.kr', 8200);
INSERT INTO Employee VALUES('S0003', '강우동', 'M', '2006-04-01', NULL, 'SYS', 'hodong@itforum.co.kr', 6500);
INSERT INTO Employee VALUES('S0004', '김삼순', 'F', '2006-08-01', NULL, 'MKT', 'samsoon@itforum.co.kr',	7000);
INSERT INTO Employee VALUES('S0005', '오삼식', 'M', '2007-01-01', '2009-01-31','MKT', 'samsik@itforum.co.kr', 6400);
INSERT INTO Employee VALUES('S0006', '김치국', 'M', '2007-03-01', NULL, 'HRD', 'chikook@itforum.co.kr',	6000);
INSERT INTO Employee VALUES('S0007', '안경태', 'M', '2007-05-01', NULL, 'ACC', 'ahn@itforum.co.kr', 6000);
INSERT INTO Employee VALUES('S0008', '박여사', 'F', '2007-08-01', '2007-09-30','HRD', 'yeosa@itforum.co.kr', 6300);
INSERT INTO Employee VALUES('S0009', '최사모', 'F', '2007-10-01', NULL, 'SYS', 'samo@itforum.co.kr', 5800);
INSERT INTO Employee VALUES('S0010', '정효리', 'F', '2008-01-01', NULL, 'MKT', 'hyori@itforum.co.kr', 5000);
INSERT INTO Employee VALUES('S0011', '오감자', 'M', '2008-02-01', NULL, 'SYS', 'gamja@itforum.co.kr',4700);
INSERT INTO Employee VALUES('S0012', '최일국', 'M', '2008-02-01', NULL, 'GE', 'ilkook@itforum.co.kr', 6500);
INSERT INTO Employee VALUES('S0013', '한국인', 'M', '2008-04-01', NULL, 'SYS', 'hankook@itforum.co.kr', 4500);
INSERT INTO Employee VALUES('S0014', '이최고', 'M', '2008-04-01', NULL, 'MKT', 'one@itforum.co.kr', 5000);
INSERT INTO Employee VALUES('S0015', '박치기', 'M', '2008-06-01', '2009-05-31','MKT', 'chichi@itforum.co.kr', 4700);
INSERT INTO Employee VALUES('S0016', '한사랑', 'F', '2008-06-01', NULL, 'HRD', 'love@itforum.co.kr', 7200);
INSERT INTO Employee VALUES('S0017', '나도야', 'M', '2008-12-01', NULL, 'ACC', 'yaya@itforum.co.kr', 4000);
INSERT INTO Employee VALUES('S0018', '이리와', 'M', '2009-01-01', '2009-06-30','HRD', 'comeon@itforum.co.kr', 5300);
INSERT INTO Employee VALUES('S0019', '정주고', 'M', '2009-01-01', NULL, 'SYS', 'give@itforum.co.kr', 6000);
INSERT INTO Employee VALUES('S0020', '고소해', 'F', '2009-04-01', NULL, 'STG', 'haha@itforum.co.kr', 5000);
--	select * from Employee;

--  Vacation 테이블 만들기
CREATE TABLE Vacation (
	VacationID int PRIMARY KEY auto_increment ,
	EmpID char(5) NOT NULL REFERENCES Employee(EmpID),
	BeginDate date NOT NULL,
	EndDate date NOT NULL,
	Reason varchar(50) DEFAULT '개인사유'
    -- ,CHECK (EndDate >= BeginDate)
);
-- ALTER TABLE  Vacation ADD CHECK (EndDate >= BeginDate);
-- ALTER TABLE Vacation ADD Duration INT GENERATED ALWAYS AS (DATEDIFF(EndDate, BeginDate)+1);


INSERT INTO Vacation VALUES( NULL,'S0001', '2006-12-24', '2006-12-26', '크리스마스 기념 가족 여행');
INSERT INTO Vacation VALUES( NULL,'S0003', '2007-01-01', '2007-01-07', '신년 맞이 기분 내기');
INSERT INTO Vacation VALUES( NULL,'S0001', '2007-05-04', '2007-05-04', '어린이날 이벤트 준비');
INSERT INTO Vacation VALUES( NULL,'S0011', '2009-03-01', '2009-03-02', DEFAULT);
INSERT INTO Vacation VALUES( NULL,'S0014', '2009-06-05', '2009-06-06', '부모님 환갑잔치');
INSERT INTO Vacation VALUES( NULL,'S0019', '2010-10-08', '2010-10-16', '신종플루');
INSERT INTO Vacation VALUES( NULL,'S0001', '2010-12-02', '2010-12-05', '율도국 관광');
INSERT INTO Vacation VALUES( NULL,'S0012', '2010-12-15', '2010-12-18', '감기몸살');
INSERT INTO Vacation VALUES( NULL,'S0009', '2010-12-26', '2010-12-26', '크리스마스 후유증');
INSERT INTO Vacation VALUES( NULL,'S0016', '2011-01-03', '2011-01-15', '달나라 여행');
