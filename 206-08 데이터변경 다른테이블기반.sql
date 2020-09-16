use hrdb;

ALTER TABLE Vacation ADD Duration INT GENERATED ALWAYS AS (DATEDIFF(EndDate, BeginDate)+1);
select * from vacation;
INSERT Vacation VALUES( NULL,'S0002', '2006-12-24', '2006-12-26', '크리스마스 기념 가족 여행', DEFAULT);


create temporary table emp
select * from employee;

select * from emp;
alter table emp 
	add vacation int;

-- 각 직원이 사용한 총 휴가 기간을 사원 테이블에 업데이트
start TRANSACTION;
	update emp as e
		set vacation = (select sum(duration) from Vacation where empid = e.empid)
	;
	select * from emp;
commit; -- rollback;
alter table emp 
	drop vacation;



start TRANSACTION;
	-- 휴가 일수가 3일 이상인 사원을 지운다
	delete from emp e
		where (select sum(duration) from Vacation where empid = e.empid) > 3
	;
    
	select * from emp;
commit; -- rollback;
rollback;


ALTER TABLE Vacation DROP Duration;
SHOW COLUMNS IN Vacation ;
-- SHOW TABLES ;
