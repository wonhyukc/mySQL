-- JOIN / 하위질의 subquery / 상관하위질의 correlated subquery / EXIST

select * from department;
select * from unit;
-- INSERT department VALUES ( 'x', 'xxx', 'x', '2020-01-01');

ALTER TABLE department
	DROP FOREIGN KEY fk_dept_unit;
DESC department;

INSERT department VALUES ( 'x', 'xxx', 'x', '2020-01-01');
select * from department;

INSERT unit VALUES ( 'y', 'y본부');
select * from unit;


-- JOIN
select * 
from unit u JOIN department d ON u.unitID = d.unitID
;
select * 
from unit u LEFT JOIN department d ON u.unitID = d.unitID
;
select * 
from unit u RIGHT JOIN department d ON u.unitID = d.unitID
;


-- JOIN: unit에 존재하는 모든 부서
select d.* 
from department d JOIN unit u ON u.unitID = d.unitID
;

-- 일반 하위 쿼리
select d.* 
from department d 
where unitID in (
		select unitID	from unit
	)
;


-- 상관 하위 쿼리
select d.* 
from department d 
where unitID in (
		select unitID	from unit where unitID = d.unitID
	)
;

-- EXISTS 상관 하위 쿼리
select d.* 
from department d 
where EXISTS (
		select * from unit where unitID = d.unitID
	)
;
