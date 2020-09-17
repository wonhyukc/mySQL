create database 블루베리 ;
use 블루베리;
drop table 주문현황;
CREATE TABLE 주문현황 (
	고객번호 char(5) PRIMARY KEY NOT NULL,
	주문자 char(5) CHARACTER SET UTF8MB4 NOT NULL,
    주소 char(40) NOT NULL,
    `구분(크기)` char(5) NOT NULL,
	`수량(kg)` char(3) NOT NULL,
    전화번호 varchar(20) NOT NULL,
    주문일 date NOT NULL,
    발송일 date NULL
) 
;
insert 주문현황 values ('a0001', '정원혁', '용인수지구 ', '대', '30', '010-4000-2700', '2020-09-17', '2020-09-17');
insert 주문현황 values ('a0001', '정원혁', '용인수지구 ', '대', '40', '010-4000-2700', '2020-09-17', '2020-09-17');
select * from 주문현황;

Error Code: 1062. Duplicate entry 'a0001' for key '주문현황.PRIMARY'


check contraint

where 전화번호 = '010-4000-2700'
or 전화번호 = '010 4000 2700'
or 전화번호 = '4000 2700'

CREATE DATABASE 윤광이 ;
USE 윤광이 ;
show tables;

SELECT database();

-- 주속 테이블 만들기
CREATE TABLE 주소록 (
	이름 char(4) NOT NULL,
	-- 이름 nchar(4) NOT NULL,
	전화번호 varchar(20) PRIMARY KEY, 
	전자메일 varchar(60) NULL,
	생일 varchar(20) NULL,
	메모 char(10) NULL
    관계
    회사
    직업
) 
;
직업

INSERT INTO 주소록 VALUES('윤광이', '01040001000', 'y@sk.com', '1980-01-01', ' ');
INSERT INTO 주소록 VALUES('정원혁', '01040002000', ' ', ' ', '강사님');

select * from 주소록;




CREATE DATABASE bora;
use bora
;
CREATE TABLE 내주소록 (
	그룹 char(5) CHARACTER SET UTF8MB4 NOT NULL,
	이름 char(4) CHARACTER SET UTF8MB4 NOT NULL,
	성별 char(1) NULL,
    전화번호 varchar(13) NOT NULL,
	전자메일 varchar(30) NULL,
	관계 char(5) NULL,
    기념일 date NULL,
    업데이트시간 datetime NOT NULL
) 


create database if not exists 도서목록;
use 도서목록;
create table 아동
(
	번호 char(3) primary key not null,
    제목 varchar(60) not null,
    입고일 date not null,
    출판사 varchar(60) null,
    작가 varchar(10) null,
    분류코드 char(3) not null
    )
    ;
제약 조건
contraint




CREATE DATABASE if not exists 맛지도
;

USE 맛지도
;
show tables;

CREATE TABLE 맛집 (
	상호 char(8) PRIMARY KEY NOT NULL,
	방문자 char(8) CHARACTER SET UTF8MB4 NOT NULL,
	성별 char(1) NOT NULL,
	방문일자 date NOT NULL,
	주소 varchar(60) NOT NULL,
	전화번호 varchar(20) NULL
) 
;

INSERT INTO 맛집 VALUES('거인통닭', '이**', 'F', '2020-09-01', '부평동', '');
INSERT INTO 맛집 VALUES('삼진어묵', '김**', 'F', '2020-09-01', '영도', '');
INSERT INTO 맛집 VALUES('장씨해녀집', '박**', 'F', '2020-09-01', '기장', '');
INSERT INTO 맛집 VALUES('초량밀면', '정**', 'F', '2020-09-01', '초량', '');
INSERT INTO 맛집 VALUES('신창돼지국밥', '양**', 'F', '2020-09-01', '부산역', '');
INSERT INTO 맛집 VALUES('이대감떡복이', '최**', 'F', '2020-09-01', '부평동', '');
INSERT INTO 맛집 VALUES('당면잡채', '황**', 'F', '2020-09-01', '남포동먹자골목', '');
INSERT INTO 맛집 VALUES('씨앗호떡', '남**', 'F', '2020-09-01', '남포동먹자골목', '');
select * from 맛집;




USE 자전거 ;
판매 : 시리얼 브랜드 대수 고객 판매일자
고객 고객명 전화번
입고: 시리얼 브랜드 대수 입고일자

CREATE TEMPORARY TABLE emp
SELECT * FROM employee
WHERE 1=0;


drop table 자전거재고현황;
CREATE TABLE 자전거재고현황 (
	시리얼 varchar(30) primary key not null,
	브랜드 varchar(20) character set utf8mb4 not null,
    품명 varchar(30) null,
    무게 varchar(60) null,
    무게단위 varchar(60) null,
    등급 varchar(15) not null
    )
    ;
select * from 자전거재고현황;

LOAD DATA INFILE 'C:/temp/bike.tsv' 
INTO TABLE 자전거재고현황
FIELDS TERMINATED BY '\t' 
-- ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
-- LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


INSERT INTO 자전거재고현황  VALUES('123456', 'Merida', '스컬트라5000', '6kg', 'Ultegra');
INSERT INTO 자전거재고현황  VALUES('123457', 'Merida', '스컬트라4000', '7kg', 'simano');
INSERT INTO 자전거재고현황  VALUES('123458', 'Merida', '스컬트라100', '8kg', 'sora');
INSERT INTO 자전거재고현황  VALUES('123459', 'giant','TCR', '6kg', 'Ultegra');
INSERT INTO 자전거재고현황  VALUES('123460', 'giant','adv', '7kg', 'simano');
INSERT INTO 자전거재고현황  VALUES('123461', 'specailize','s-works', '5kg', 'Durace');
select * from 자전거재고현황;
판매 


SHOW TABLES;



create table test(
	전화번호  varchar(30) CHECK (전화번호  LIKE '[0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
);
insert test values ('0-1');

-- where name like '%[0-9]%'
CHECK (REGEXP_LIKE(p_number, '^0\d{9}|\d{10}$'))
ONSTRAINT chk_phone CHECK (phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]') -- check that no number is not a digit 
;
select '010' like '[0-9]%', 010 like  '[0-9][0-9][0-9]';
select '김철수' like '김%', '박철수' like '김%';
select 'abc' like '[a-z]%'

LTER TABLE authors
ADD CONSTRAINT cc_ValidPhone
CHECK (Phone LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
