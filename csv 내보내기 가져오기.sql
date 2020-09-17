use hrdb;
SELECT     *
FROM    employee
INTO OUTFILE 'C:/temp/emp.csv' 
FIELDS TERMINATED BY ','  	-- default = '\t'
LINES TERMINATED BY '\r\n' 	-- default = '\n'
;


CREATE TEMPORARY TABLE emp
SELECT * FROM employee
WHERE 1=0;

LOAD DATA INFILE 'C:/temp/emp.csv' 
INTO TABLE emp
FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


SELECT * FROM emp;