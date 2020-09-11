use hr;

select *
from employees
;
-- 1 모든 직원의 평균 연봉

-- 2. 2000년 이후 입사자 평균 연봉

-- 3. 부서별 평균연봉 

-- 4. 부서별 평균 연봉 이 전체 평균연봉 보다 낮은 부서

-- 5. 2000년 이후 입사자 만 대상으로 
--     부서별 평균 연봉 이 전체 평균연봉 보다 낮은 부서





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




use hr;

select *
from employees
;
-- 1 모든 직원의 평균 연봉
select avg(salary)
from employees
;
-- 5839.40

-- 2. 2000년 이후 입사자 평균 연봉
select avg(salary) as 평균연봉
	from employees
	where hire_date >= "2000-01-01"
    ;
-- 3. 부서별 평균연봉 
select department_id, avg(salary) as 평균연봉
	from employees
	group by department_id
    ;

-- 4. 부서별 평균 연봉 이 전체 평균연봉 보다 낮은 부서
select department_id, avg(salary) as 평균연봉
	from employees
	group by department_id having avg(salary) < (select avg(salary) from employees)
    ;

-- 5. 2000년 이후 입사자 만 대상으로 
--     부서별 평균 연봉 이 전체 평균연봉 보다 낮은 부서
select department_id, sum(salary)/count(salary) as 평균연봉
	from employees 
    where hire_date >= "2000-01-01"
	group by department_id having sum(salary)/count(salary) < (select sum(salary)/count(salary) from employees)
    ;

