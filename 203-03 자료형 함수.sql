use pubs;


SELECT title_id, title FROM titles
WHERE title LIKE 'computer%';

SELECT POSITION('Mi' IN 'James Mike');
-- SELECT REGEXP_INSTR('M%', 'McAthur');
-- SELECT REGEXP_INSTR('McAthur', 'M*' );
-- SELECT REGEXP_INSTR('McAthur', 'M[^c]*+' );
-- SELECT REGEXP_INSTR('Mike', 'M[^c].*' );
-- SELECT REGEXP_LIKE('Mike', 'M[^c]*' );
-- SELECT REGEXP_LIKE('M', 'M[^c]*' );


SELECT REGEXP_LIKE('aXbc', '[a-dXYZ]');
SELECT REGEXP_LIKE('aXbc', '^[a-dXYZ]');
SELECT REGEXP_LIKE('aXbc', '^[a-dXYZ]$');
SELECT REGEXP_LIKE('aXbc', '^[a-dXYZ]+$');
SELECT REGEXP_LIKE('aXbc', '^[^a-dXYZ]+$');
SELECT REGEXP_LIKE('gheis', '^[^a-dXYZ]+$');
SELECT REGEXP_LIKE('gheisa', '^[^a-dXYZ]+$');

-- 중복된 행;
SELECT title_id	FROM sales
ORDER BY title_id;

SELECT DISTINCT title_id	FROM sales
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

CREATE TEMPORARY TABLE t1( t	DATETIME);
INSERT t1 VALUES ('91.1.1');
SELECT * FROM t1;
INSERT t1 VALUES ('1/1/91');	-- Out of range value for column 't' at row 1

SELECT 10 / 4 + 10 % 3 * 5;

Set @i := 254;
SET @i = 254;
SELECT @i + 2;

SET @f = 	0.00001;
SELECT @f + 	0.99999;

SET @f = 	0.00000000000000000000001;
SELECT @f + 	0.99999999999999999999999;



-- SELECT *	FROM AUTHORS
-- ORDER BY au_lname ASC, au_fname ASC;

-- SELECT stor_id AS 서점번호, ord_date, qty, title_id
-- FROM sales
-- WHERE stor_id NOT BETWEEN  '7067' AND '7131';
