-- 자료형 
DROP TABLE IF EXISTS t1;
CREATE TEMPORARY TABLE t1( t	DATETIME);
INSERT t1 VALUES ('91.1.1');
SELECT * FROM t1;
INSERT t1 VALUES ('1/1/91');	-- Out of range value for column 't' at row 1


DROP TABLE IF EXISTS t1;
CREATE TEMPORARY TABLE t1( c	tinyint);		-- -128~127
INSERT t1 VALUES ('127');
SELECT * FROM t1;
update t1 set c = c+1;		-- 128
