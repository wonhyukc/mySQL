
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



-- 하나 이상의  부서를 할당받은 UNIT
select * from unit;

select * from department;

select * from unit
where unitid in (select unitid from department);

select DISTINCT u.* from unit u
	join department d on u.UnitID = d.unitid


