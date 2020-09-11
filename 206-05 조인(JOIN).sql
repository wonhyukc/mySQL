/*
	정원혁 2014.11. 
	이장래 저 "SQL Server 2012 운영과 개발 : 이장래와 함께하는" 의 스크립트를 migration
	http://www.yes24.com/SearchCorner/Search?scode=032&ozsrank=1&author_yn=y&query=%c0%cc%c0%e5%b7%a1&domain=all
*/
-- 
--  6.5 조인(JOIN)
-- 


USE HRDB
;


-- 1) INNER JOIN

-- 부서 이름을 포함해서 직원 정보 표시
SELECT e.EmpID, e.EmpName, e.DeptID, d.DeptName
   FROM Employee e
   INNER JOIN Department d ON e.DeptID = d.DeptID
   WHERE e.DeptID IN ('GEN', 'HRD', 'ACC') AND RetireDate IS NULL
;


-- 2) OUTER JOIN

-- 본부 이름을 포함해서 부서 정보 표시
-- INNER JOIN의 경우
SELECT d.DeptID, d.DeptName, d.UnitID, u.UnitName
   FROM Department AS d
   INNER JOIN Unit AS u ON d.UnitID = u.UnitID
;

-- OUTER JOIN의 경우
SELECT d.DeptID, d.DeptName, d.UnitID, u.UnitName
   FROM Department AS d
   LEFT OUTER JOIN Unit AS u ON d.UnitID = u.UnitID
;


-- 3) 여러 테이블간의 조인
ALTER TABLE Vacation ADD Duration INT GENERATED ALWAYS AS (DATEDIFF(EndDate, BeginDate)+1);

-- 휴가를 사용한 직원들의 휴가 사용 현황 얻기
SELECT e.EmpID, e.EmpName, d.DeptName, u.UnitName, 
       v.BeginDate, v.EndDate, v.Duration
   FROM Employee e
   INNER JOIN Department d ON e.DeptID = d.DeptID
   LEFT OUTER JOIN Unit u ON d.UnitID = u.UnitID
   INNER JOIN Vacation v ON e.EmpID = v.EmpID
   ORDER BY e.EmpID ASC
;

-- 모든 직원들의 휴가 사용 현황 얻기
SELECT e.EmpID, e.EmpName, d.DeptName, u.UnitName, 
       v.BeginDate, v.EndDate, v.Duration
   FROM Employee e
   INNER JOIN Department d ON e.DeptID = d.DeptID
   LEFT OUTER JOIN Unit u ON d.UnitID = u.UnitID
   LEFT OUTER JOIN Vacation v ON e.EmpID = v.EmpID
   ORDER BY e.EmpID ASC
;


-- 4) Non-Equi 조인

-- 'S0004', 'S0005' 직원보다 더 많은 급여를 받는 직원의 정보와 급여 차

SELECT e1.EmpID, e1.EmpName, e1.Salary, e2.EmpName, 
       e2.Salary, e2.Salary - e1.Salary AS 'Salary_diff'
   FROM Employee e1
   JOIN Employee e2 ON e1.Salary < e2.Salary
   WHERE e1.EmpID <> e2.EmpID AND e1.EmpID  IN ('S0004', 'S0005')
   ORDER BY e1.EmpID ASC, Salary_diff DESC
;
