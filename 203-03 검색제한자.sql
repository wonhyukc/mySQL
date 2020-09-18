use pubs;

-- 검색제한자 
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

