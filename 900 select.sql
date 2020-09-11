/*
	이 안에 있는 문장은 주석이다.
*/
-- 하이픈 두개와 빈칸 뒤에 있는 것도 주석이다
/*
	https://github.com/wonhyukc/mySQL

	정원혁 2011.10. mySQL 초보를 위한 스크립트
	데이터베이스(스키마) 만들기, 지우기, 사용하기
	테이블 만들기, 보이기, 지우기
	데이터 INSERT, SELECT, UPDATE, DELETE
*/
DROP DATABASE `test`;			-- DROP DATABASE IF EXISTS test;
CREATE DATABASE `test`;		-- CREATE DATABASE IF NOT EXISTS test;
use test;
show tables;
create table 사원(
    이름	varchar(15),
    mail	varchar(20),
    id int not null auto_increment,
    primary key (id)
);

insert 사원 values ('정원혁', 'hyuk@mail.com', null), ('이현주', 'hj@smail.com', null);
select * from 사원;

delete from 사원 where id = 1;
-- from 없으면 오류.
select * from 사원;

delete from 사원;	-- 대형 사고를 일으키기 때문에 기본적으로 허용 안된다
/*
Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column To disable safe mode, toggle the option in Preferences -> SQL Queries and reconnect.	0.000 sec
*/
truncate table 사원;

insert 사원 values ('정원혁', 'hyuk@mail.com', null), ('이지윤', 'hj@smail.com', null);
select * from 사원;
select id, 이름 from 사원;

insert 사원 values ('정원혁', 'hyuk@mail.com', null);	
select * from 사원;
update 사원 set mail = 'js@mail.com' where id = 3;
select * from 사원;
update 사원 set mail = 'js@mail.com' , 이름 = '김정선' where id = 3;
select * from 사원;

select * from 사원 where 이름 = '이지윤';
select * from 사원 where 이름 = "이지윤";


-- logical operators;
select * from 사원 where mail like '%com' and 이름 = '정원혁';
select * from 사원 where mail like '%com' or 이름 = '이지윤';

select * from 사원 where mail like '%com' && 이름 = '이지윤';
select * from 사원 where mail like '%com' || 이름 = '이지윤';

select * from 사원 where 이름 != '이지윤';

select * from 사원 order by 이름;
select * from 사원 order by 이름 desc;
select * from 사원 order by 3;

--
alter table 사원 rename 직원;
show tables;
alter table 직원 rename 사원;
show tables;

alter table 사원 add 생일 date;
show columns from 사원;

show columns from 사원;
alter table 사원 change mail email varchar(40);
show columns from 사원;
