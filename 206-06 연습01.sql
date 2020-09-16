
USE HR;
select * from job_history
;
select * from employees
where employee_id = 176
;




select employee_id, count(*)
from job_history 
group by employee_id
	having count(*) >= 2
;
-- 부서 이동 경력이 있는 사람만 
select distinct e.*  from job_history jh
	join employees e on jh.employee_id = e.employee_id
;    
-- subquery
select * from employees
where employee_id in (select employee_id from job_history)
;    
    
-- 부서 이동 경력이 없는 사람만 
select e.*  
from job_history jh
	right join employees e on jh.employee_id = e.employee_id
where jh.employee_id is null
;




