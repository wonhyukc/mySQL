SET @t1=1, @t2=2, @t3:=4;
SELECT @t1, @t2, @t3, @t4 := @t1+@t2+@t3;

SET @v1 = b'1000001';
SET @v2 = CAST(b'1000001' AS UNSIGNED), @v3 = b'1000001'+0;
SELECT @v1, @v2, @v3;

USE sakila;
SET @c = "first_name";
SET @s = CONCAT("SELECT ", @c, " FROM actor");
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT @@global.autocommit;
SELECT @@session.sort_buffer_size;
