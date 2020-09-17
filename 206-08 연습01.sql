use hr;
/*
employees 에서 사번,이름만 emp 라는 새 테이블 만들기 
이직 횟수라는 새 컬럼 만들기 
job_history의 이직횟수를 업데이트 만든 새 컬럼에 업데이트 
*/


-- 사번,이름만 새로 테이블 만들기 emp
create temporary table emp
select employee_id, concat(first_name," ",last_name) as 성명 
from employees;

-- 이직횟수:새컬럼 추가
alter table emp 
	add 이직횟수 int;

-- job_history의 이직횟수를 업데이트
START TRANSACTION;
	update emp as e
	set 이직횟수 = (
		select count(employee_id) 
		from job_history 
		where employee_id = e.employee_id
		)
	;
	select * from emp;
COMMIT;
ROLLBACK;
