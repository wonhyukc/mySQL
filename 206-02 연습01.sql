/*
연습문제와 답
테이블: https://github.com/nomemory/hr-schema-mysql/blob/master/hr-schema-mysql.sql
*/
use hr;
-- 정렬
-- salary 순 정렬
select * 
from employees
order by salary;

-- 입사일자 순
select * 
from employees
order by hire_date;


-- job_id 순
select * 
from employees
order by job_id;

-- job_id순 이후 hire_date 순
select * 
from employees
order by job_id, hire_date;

-- 부서 dept_id 는 어떤 것들이 있을까?
select distinct department_id
from employees
;

-- commission 이 NULL인것만
select *
from employees
where commission_pct is null
;


-- commission 이 NULL 이면 ‘안받음’ 이라고 출력
select *, if( isnull(commission_pct), '안받음', commission_pct) as '커미션'
from employees
where commission_pct is null
;

-- first_name과 last_name을 합쳐서 “name” 컬럼으로 넣으시오
select first_name, last_name	, concat( first_name, ', ' , last_name) as name
from employees
where commission_pct is null
;

-- 2000년 이후 입사자만 출력
select *
from employees
where hire_date >= '2000-01-01'
;

-- manager_id가 null이면 0으로 입력 null 이 아니면 manager_id값으로 입력
select *, if( isnull(manager_id),  0, manager_id) as '매니저'
from employees
where commission_pct is null
;

-- salary나 commission 중 NULL이 아닌 값을 “급여액” 이라는 제목으로 출력하
select if( isnull(salary) , commission_pct , salary ) as 급여액, salary, commission_pct
from employees;


-- locations
-- 어떤 나라들이 있을까?
select distinct country_id
from locations
;

-- 나라 + 주 + 도시 를 합친 새 컬럼 “지역” 을 출력하자
-- select concat( 'a', 'b')
-- select concat( 'a', null)
select concat( 'a', if( isnull(null), '', null))
;

select country_id, if( isnull(state_province), '',state_province ), city
	from locations
;
select concat( country_id,', ',  if( isnull(state_province), '',state_province ), ', ' ,city )
	from locations
;




-- jobs
-- 최저임금 5000 이상 그리고, 최대임금 9000 이하 인 job 만 보고 싶다
select *
from jobs
where min_salary >=5000 and max_salary <=9000
;

-- job title이 manager 를 포함한 것들을 보고 싶다
select *
from jobs
where job_title like '%manager%'
-- where job_title like '%manager'
;

-- job title이 stock으로 시작하는 것들을 보고 싶다
select *
from jobs
where job_title like 'stock%'
;

-- job title이 stock으로 시작하는 것들의 최저임금을 NULL로 바꾸어 출력하고 싶다
select *, 
	nullif( nullif( min_salary, 2000) , 5500)  as '최저임금'
from jobs
where job_title like 'stock%'
;

select *, 
	NULL  as '최저임금'
from jobs
where job_title like 'stock%'
;

