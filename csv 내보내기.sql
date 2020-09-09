use hrdb;
SELECT     *
FROM    employee
INTO OUTFILE 'C:/temp/emp.csv' 
FIELDS TERMINATED BY ','  	-- default = '\t'
LINES TERMINATED BY '\r\n' 	-- default = '\n'
;
