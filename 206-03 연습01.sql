USE HR;
select * from employees;

-- 임시직원 테이블 만들기 (텅빈)
CREATE TABLE 임시직원
	SELECT * FROM employees
    WHERE 1=0;
    

-- 고액 연봉자 3명을 넣기
INSERT 임시직원
	SELECT * FROM employees
    ORDER BY salary desc
    LIMIT 3
;

select * from 임시직원;
