/*
	제 9장 연습3
	정원혁 / 99.5.1.
*/

-- 1.1
USE tempdb;
DROP TABLE IF EXISTS wages ;

CREATE TABLE wages
(
	emp_id	TINYINT	primary key AUTO_INCREMENT
,	hourly_wage	float	NULL
,	salary	float	NULL
,	commission	float	NULL
,	num_sales	int	NULL
)
;

-- 1.2
INSERT wages VALUES(NULL, 10.00, NULL, NULL, NULL);
INSERT wages VALUES(NULL, 20.00, NULL, NULL, NULL);
INSERT wages VALUES(NULL, 30.00, NULL, NULL, NULL);

INSERT wages VALUES(NULL, NULL, 10000.00, NULL, NULL);
INSERT wages VALUES(NULL, NULL, 20000.00, NULL, NULL);
INSERT wages VALUES(NULL, NULL, 30000.00, NULL, NULL);

INSERT wages VALUES(NULL, NULL, NULL, 15000, 3);
INSERT wages VALUES(NULL, NULL, NULL, 25000, 2);
INSERT wages VALUES(NULL, NULL, NULL, 20000, 6);


-- 1.3
SELECT * FROM wages;

-- 1.4
SELECT 
    emp_id,
    CASE
        WHEN hourly_wage IS NOT NULL THEN hourly_wage * 40 * 52
        WHEN salary IS NOT NULL THEN salary
        ELSE commission * num_sales
    END AS '연봉'
FROM
    wages;


-- 1.5
SELECT 
    emp_id,
    COALESCE( hourly_wage * 40 * 52, salary, commission * num_sales )     AS '연봉'
FROM
    wages;


-- 
SELECT	title_id AS '책번호'
	,	qty AS '수량'
	,	'등급' =  
	CASE 
		WHEN qty >= 50 THEN 'A'
		WHEN qty >= 30 THEN 'B'
		ELSE 'C'
	END
FROM pubs..sales


-- 
-- 

use pubs
select stor_id, year(ord_date) as yr, qty
from sales
order by 1, 2

/*
case when  조건 then 참 else 거짓 end 
case 조건 when 조건값  then 참 else 거짓 end 
*/

select stor_id, year(ord_date) as yr, qty
	, case 
			when qty>=50 then 'A' 
			when qty>=20 then 'B' 
			else 'C'
		end  as 등급
from sales
order by 1, 2


select stor_id, year(ord_date) as yr, qty
from sales
order by 1, 2

select stor_id 
	, case year(ord_date)	when 1992	then qty	else 0	end as y92
	, case year(ord_date)	when 1993	then qty	else 0	end as y93
	, case year(ord_date)	when 1994	then qty	else 0	end as y94
from sales

select stor_id 
	, sum( case year(ord_date)	when 1992	then qty	else 0	end ) as y92
	, sum( case year(ord_date)	when 1993	then qty	else 0	end ) as y93
	, sum( case year(ord_date)	when 1994	then qty	else 0	end ) as y94
from sales
group by stor_id

select stor_id, isnull([1992],0) as [1992],[1993],[1994]
from 
(
	select stor_id, year(ord_date) as yr, qty
	from sales
) src
PIVOT (
	sum(qty) for yr IN ([1992],[1993],[1994])
) pvt

