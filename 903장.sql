/*
	정원혁 2014.11. 
	전문가로 가는 지름길 1 / 개발자용 	제 3장 소스 스크립트 	정원혁 2000.1
*/


SELECT * FROM titles;

SELECT * 
FROM titles;

SHOW COLUMNS FROM titles;

SELECT title_id, title, price, pub_id 
FROM titles;

SELECT title_id, pub_id, price, title 
FROM titles;

SELECT '책 번호:', title_id, '출판사번호', pub_id, price, title 
FROM titles;

SELECT 	title_id AS Title_no
	, pub_id AS `출판사 번호`
	, price
	, title 
FROM titles;

SELECT 	title_id AS Title_no , pub_id AS `출판사 번호` , price, title 
FROM titles;

SELECT title_id AS Title_no, pub_id AS '출판사 번호', price, title 
FROM titles;

-- SELECT 	'Title_no' = title_id, '출판사 번호' = pub_id, price, title 
-- FROM titles;

SELECT  title_id, stor_id, ord_date, '수량:', qty
FROM  sales;




-- // set
SET @name = 'abcd';
SELECT @name;

SET @name = '윤석빈';
SELECT @name;

SET @name = "윤석빈";
SELECT @name;

SET @id = 0;
SET @name = "윤석빈";
SELECT @id, @name;

SET @id = 0,@name = "윤석빈";
SELECT @id, @name;

use test;
create table tt (
	a datetime
,	b date
,	c time
);
insert tt values ( now(), now(), now() );
select * from tt;


-- // date time

SELECT STR_TO_DATE('01,January,2013','%d,%M,%Y');	-- '2013-05-01'
SELECT STR_TO_DATE('01/5/2013','%d/%m/%Y');	-- '2013-05-01'
SELECT STR_TO_DATE('01-5-13','%d-%m-%y');	-- '2013-05-01'
SELECT STR_TO_DATE('01.5.2013','%d.%m.%Y');	-- '2013-05-01'
SELECT STR_TO_DATE('09/13/94', '%m/%d/%y');
SELECT STR_TO_DATE('20111202', '%Y%m%d');

SELECT NOW();
SELECT NOW(), DATE_ADD( NOW(), INTERVAL 3 DAY);
SELECT NOW(), DATE_ADD( NOW(), INTERVAL 3 MONTH);
SELECT NOW(), DATE_ADD( NOW(), INTERVAL -3 DAY);

SELECT DATE_FORMAT(NOW(), '%Y %m %d');
SELECT DATE_FORMAT(NOW(), '%Y%m%d');
SELECT DATE_FORMAT(NOW(), '%y-%m-%d');

SELECT ord_date  FROM sales;
SELECT ord_date, DATE_FORMAT(ord_date,'%Y%m%d')  FROM sales;
SELECT ord_date, DATE_FORMAT(ord_date,'%Y%m%d') AS '주문일자'  FROM sales;

SELECT ord_date FROM sales ORDER BY ord_date;
SELECT ord_date FROM sales WHERE ord_date = STR_TO_DATE('19940913', '%Y%m%d');
SELECT ord_date FROM sales WHERE DATE_FORMAT(ord_date,'%Y%m%d')  = '19940913';	-- 느리다!

SELECT ord_date FROM sales 
WHERE ord_date >= STR_TO_DATE('19940913', '%Y%m%d')
	AND ord_date < STR_TO_DATE('19940914', '%Y%m%d');

SELECT ord_date FROM sales 
WHERE ord_date >= '19940913'
	AND ord_date < '19940914';

SELECT DATE_FORMAT('11-12-02 23:23:18', '%y-%m-%d %h:%i:%s %p');
SELECT DATE_FORMAT('11-12-02 23:23:18', '%y-%m-%d %k:%i:%s');

-- //SELECT에서의 자료형 바꾸기
SELECT 1 + 3; 
SELECT 'a' + 'b';
SELECT CONCAT('a','b');
SELECT 1 + '4';
SELECT 'a' + 'b'  + 4;
SELECT CONVERT('abc' USING utf8);
SELECT 10 / 3;
SELECT CAST(10 AS DECIMAL(10, 8));
SELECT CAST('32.2' AS DECIMAL(10,5));
SELECT CAST('32.2' AS SIGNED);

SELECT title_id, price
, FLOOR(price) AS FLOOR, CEILING(price) AS CEILING, ROUND(price, 0) AS ROUND
FROM titles;


SELECT SUBSTRING('abcdef', 1, 2);  
SELECT SUBSTRING('한글abcd데이타', 1, 2);
SELECT SUBSTRING('한글abcd데이타', 3, 3);


SELECT REPEAT('반복', 10);
SELECT REVERSE('한ab글');

-- SELECT STUFF('123456', 3, 2, 'abcde');
SELECT REPLACE('123456', '34', 'abcde');

SELECT title_id, qty FROM sales;

SELECT title_id, qty FROM sales
WHERE qty >= 20;

SELECT title_id, qty FROM sales
WHERE title_id = 'BU1032';

SELECT title_id, price	FROM titles
WHERE price IS NULL;

SELECT title_id, price	FROM titles
WHERE price = NULL;

-- <> NOT NULL은 IS NOT NULL과 같지 않다.;
SELECT title_id, price	FROM titles
WHERE price <> NULL;

SELECT title_id, price	FROM titles
WHERE price IS NOT NULL;

-- //정렬;
SELECT title_id, qty FROM sales
ORDER BY qty ;

SELECT title_id, qty FROM sales
ORDER BY qty DESC;

SELECT title_id, qty FROM sales
ORDER BY title_id, qty;

SELECT title_id, qty FROM sales
ORDER BY title_id, qty DESC;

SELECT title_id, qty FROM sales
ORDER BY title_id DESC, qty DESC;

SELECT title_id, qty FROM sales
ORDER BY 1 DESC, 2 DESC;

SELECT title_id, qty FROM sales LIMIT 6;

SELECT title_id, qty FROM sales
ORDER BY qty DESC 
LIMIT 6;

SELECT title_id, qty FROM sales
ORDER BY qty DESC
LIMIT 6;

-- //범위;
SELECT title_id, qty FROM sales
WHERE qty BETWEEN 10 AND 20
ORDER BY qty;

SELECT title_id, qty FROM sales
WHERE qty >= 10 AND qty <= 20
ORDER BY qty;

-- //목록;
SELECT title_id, qty FROM sales
WHERE title_id IN ('BU1032', 'BU1111', 'MC3021');

SELECT title_id, qty FROM sales
WHERE title_id = 'BU1032'  OR  'BU1111'  OR  'MC3021';

-- 문자열;
SELECT title_id, title FROM titles
WHERE title LIKE '%computer%';

SELECT title_id, title FROM titles
WHERE title LIKE 'computer%';

SELECT POSITION('Mi' IN 'James Mike');
-- SELECT POSITION('M%' in 'McAthur');
-- SELECT POSITION('M[^c]%' IN 'Mike');
-- SELECT POSITION('M[^c]%' IN 'M');

-- 중복된 행;
SELECT title_id	FROM sales
ORDER BY title_id;

SELECT DISTINCT title_id	FROM sales;
ORDER BY title_id;

SELECT title_id, price 	FROM titles
WHERE price * 1.1 < 20.00
ORDER BY price;

SELECT title_id, price 	FROM titles
WHERE price < 20.00 / 1.1
ORDER BY price;

SELECT title_id, pubdate, YEAR(pubdate) AS '연도'
FROM titles
WHERE YEAR(pubdate) = 1991;

-- 1)
SELECT title_id, price, pub_id	FROM titles
WHERE title_id LIKE 'BU%' 
	OR ( pub_id = '1389'	AND price = 19.99 );

-- 2)
SELECT title_id, price, pub_id	FROM titles
WHERE (title_id LIKE 'BU%' OR 	pub_id = '1389' )
	AND price = 19.99;

-- 3)
SELECT title_id, price, pub_id	FROM titles
WHERE title_id LIKE 'BU%'  OR 	pub_id = '1389' 
	AND price = 19.99;

CREATE TABLE t1( t	DATETIME);
INSERT t1 VALUES ('91.1.1');
SELECT * FROM t1;
INSERT t1 VALUES ('1/1/91');	-- Out of range value for column 't' at row 1

SELECT 10 / 4 + 10 % 3 * 5;

SET @i = 254;
SELECT @i + 2;

SET @f = 	0.00001;
SELECT @f + 	0.99999;

SET @f = 	0.00000000000000000000001;
SELECT @f + 	0.99999999999999999999999;



SELECT *	FROM AUTHORS
ORDER BY au_lname ASC, au_fname ASC;

SELECT stor_id AS 서점번호, ord_date, qty, title_id
FROM sales
WHERE stor_id NOT BETWEEN  '7067' AND '7131';
