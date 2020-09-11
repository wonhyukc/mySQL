use hr;

select *
from employees
;

-- 1 모든 직원의 연봉을 10% 증액
select * 
from employees
;

update employees
set salary = salary * 1.1
;
select * 
from employees
;


-- 2 1988년 이전 입사자 는 연봉을 추가로 10% 더 증액
select * from employees
where hire_date < '1988-01-01'
;
update employees
set salary = salary * 1.1
where hire_date < '1988-01-01'
;



-- 3 110번 부서에 근무한 모든 직원 근무 기록 삭제 
select * from job_history
where department_id = 110
;

delete from job_history
where department_id = 110
;




-- Limit TOP 5 Percent
select * 
from employees
order by salary desc
limit 11
;

select @r := round( count(*) * 0.1)  from employees;
select @r;

SELECT @rows := ROUND(COUNT(*) * 0.05) FROM employees;
PREPARE STMT FROM 'SELECT * FROM employees ORDER BY salary desc LIMIT ?';
EXECUTE STMT USING @rows;


