-- 테이블에 있는 모든 열을 표시 할 수 있다 --
select *
FROM y_dept;

-- 
select dept_id,dept_name, loc_id, mgr_id 
FROM y_dept;

select emp_id, emp_name, salary, salary+30
from y_emp;

select sysdate
from dual;

select sysdate + 10
from dual;

alter session set nls_date_format = 'yyyy/mm/dd hh24: mi :ss';
select sysdate from dual;

select sysdate, sysdate + 3/24, sysdate + 40/(24*60) , sysdate + 30 / ( 24 * 60 * 60)

from dual;

select emp_id, emp_name, comm
from y_emp;

select emp_id, salary ,comm, (salary * 12) + ( salary * comm)
from y_emp;

select emp_name as "Name" , comm as commission, salary * 12 as "Annual Salary"
from y_emp;

select emp_name || q'<'s salary >' || position as "Employees Position"
from y_emp; 

select emp_id , emp_name, position, dept_id
from y_emp
where dept_id = 100;

select emp_id, emp_name, position, dept_id
from y_emp
where position = '부사장';

select emp_id , emp_name , birthdate, hiredate
from y_emp;

alter session set nls_date_format = 'yy/mm/dd';
select sysdate from dual;

select emp_id, emp_name, salary
from y_emp
where salary <= 300;

select emp_name, salary * 12 annsal
from y_emp
where salary *12 > 8000;

select emp_name, salary * 12 annsal
from y_emp
where salary * 12  > 8000;

select emp_id , emp_name , position, hiredate
from y_emp
where hiredate > '17/01/01';

select emp_name, salary
from y_emp
where salary not between 600 and 700;

select emp_id , emp_name, salary, mgr_id
from y_emp
where mgr_id not in (1001, 1002, 1003, 1029);

select emp_id , emp_name
from y_emp
where emp_name like '김%';

select emp_id , emp_name
from y_emp
where emp_name like '_승%';

select *
from pay_grade
where pay_level like '%5_B' escape '5';

select emp_id, emp_name, salary, salary + 1
from y_emp;

select sysdate from dual;
alter session set NLS_DATE_FORMAT = 'yyyy/mm/dd';

select emp_id, salary, comm, comm + 1
from y_emp;

select emp_name || ' ' || position as "emplyee's position"
from y_emp;

select emp_name || q'['s salay: ]' || salary "employ salary"
from y_emp;

select emp_id , emp_name, position, dept_id
from y_emp
where dept_id = 100;

select emp_id, emp_name, position , dept_id
from y_emp
where dept_id is null;

select emp_id, emp_name, position, dept_id
from y_emp
where position = '사원'
and dept_id = 400;

select emp_id, position dept_id
from y_emp
where position not in('과장','대리','사원');

select emp_name, position, salary
from y_emp
where position = '차장'
or position = '부장'
and salary > 700;                                        

select rowid, dept_id
from y_dept;

select emp_name, position, dept_id , hiredate
from y_emp
order by hiredate;

select emp_name, position, dept_id, hiredate
from y_emp
order by hiredate DESC;

select emp_id, emp_name, dept_id, salary
from y_emp
order by  dept_id, salary DESC;

select emp_id, emp_name, salary * 12 annsal
from y_emp
order by annsal DESC;

select emp_id, emp_name, salary * 12 annsal
from y_emp
order by 3 DESC;

select upper(email), lower(email), initcap(email)
from y_emp
where emp_id < 1005;

select emp_id, emp_name, salary, dept_id
from y_emp
where emp_name = 'Mark Kim';

select emp_id, emp_name, salary, dept_id
from y_emp
where lower(emp_name) = 'mark kim';



select concat(emp_name, position)
from y_emp
where emp_id < 1005;

select substr('Computer Information', 10, 4) resuit1,
       substr('Computer Information', -4) resuit2
from dual;       

select emp_name, email, instr(email, 'a'), dept_id
from y_emp
where dept_id = 100;

col name for a25
select rpad(emp_name, 12, '*') as name , lpad(salary, 5, '*') as salary, dept_id
from y_emp
where dept_id = 400;

select emp_name, phone, replace(phone, '.', '-') phonel
from y_emp
where dept_id = 400;

select trim(trailing 'w' from 'window')
from dual;

select trim('0' from '000012121410000')
from dual;

select trunc(56.834 , 2)
from dual;                                                                               

select emp_id , hiredate,
    months_between(sysdate, hiredate) 근무기간,
    add_months(hiredate, 3) 수습종료일,
    next_day(hiredate, '금요일'), last_day(hiredate)
from y_emp
where position = '사원';

select emp_id, salary, comm,
    (salary * 12 ) + ( salary * comm)
from y_emp;

select emp_name "name", comm as commission, salary * 2 "annual salary"
from y_emp;

select emp_name || ' ' || position as "employee position"
from y_emp;

select emp_id , emp_name, comm
from y_emp
where comm is not NULL;

SELECT emp_id, emp_name , position, dept_id
FROM y_emp
WHERE position = '사원'
    OR dept_id = 400;
    
select UPPER(email), LOWER(email), INITCAP(email)
from y_emp
where emp_id < 1005;

SELECT emp_id, emp_name, birthdate
FROM y_emp
WHERE birthdate >= TO_DATE('01-01-1992','DD-MM-YYYY');

SELECT emp_id, emp_name, birthdate
FROM y_emp
WHERE birthdate >= TO_DATE('01-01-92','DD-MM-YY');

SELECT emp_id, emp_name, birthdate
FROM y_emp
WHERE birthdate >= TO_DATE('01-01-90','DD-MM-RR');

SELECT emp_id,  REPLACE(emp_name, SUBSTR(emp_name,2,4),'***') name,
                CONCAT(birthdate,CONCAT('[', CONCAT(gender,']'))) AS birth
FROM y_emp
WHERE SUBSTR(emp_name, -1,1) = '영';


SELECT emp_id, emp_name, TO_CHAR(hiredate,'YYYY-MM-DD'),
        TO_CHAR(NEXT_DAY(ADD_MONTHS(hiredate,6),'금요일'),'YYYY-MM-DD')
        AS "Review_Day"
FROM y_emp
WHERE TO_CHAR(hiredate,'YYYY')LIKE '2011%';

SELECT  emp_name, salary,comm,
        (salary*12)+(salary*12*comm) ANN_SAL
FROM y_emp;

SELECT  emp_name, salary,comm,
        (salary*12)+(salary*12*NVL(comm,0)) ANN_SAL
FROM y_emp;


SELECT emp_name,
    (salary*12)+(salary*12*NVL(comm,0)) ANN_SAL,
    NVL2(comm,'SAL+COMM','SAL')BIGO
FROM y_emp;

SELECT emp_id, emp_name, NULLIF(LENGTH(emp_name),3) RESULT
FROM y_emp;

SELECT emp_id, emp_name, COALESCE(comm,salary,0)
FROM y_emp;

SELECT emp_name, position, salary,
      DECODE(position,  '사원', 1.05*salary,
                        '대리', 1.07*salary,
                        '부장', 1.21*salary,
                        salary) AS INCREASED_SALARY
FROM y_emp;      
      
SELECT emp_id, emp_name, salary,
        DECODE(TRUNC(salary/300), 0,'C',
                                  1,'B',
                                    'A')AS SALARY_LEVEL
FROM y_emp;

SELECT emp_name,position,salary,
        CASE position WHEN '사원' THEN 1.05*salary
                      WHEN '대리' THEN 1.07*salary
                      WHEN '과장' THEN 1.10*salary
                      ELSE salary END AS INCREASED_SALARY
FROM y_emp;

SELECT emp_id, emp_name, salary,
        CASE  WHEN salary < 300 THEN 'C'
              WHEN salary >= 300 AND salary < 600 THEN 'B'
        ELSE 'A'
        END AS SELARY_LEVEL
FROM y_emp;

--  그룹함수

SELECT SUM(salary), AVG(salary), MAX(salary),MIN(SALARY)
FROM y_emp;

SELECT MIN(hiredate),MAX(hiredate)
FROM y_emp;

SELECT COUNT(*), COUNT(dept_id), COUNT(DISTINCT dept_id)
FROM y_emp;

SELECT AVG(NVL(comm,0))
FROM y_emp;

SELECT SUM(salary), AVG(salary), MAX(salary), MIN(SALARY)
FROM y_emp
WHERE dept_id = 400;

SELECT dept_id, SUM(salary),AVG(salary)
FROM y_emp
GROUP BY dept_id;

SELECT dept_id,position,SUM(salary)
FROM y_emp
GROUP BY dept_id,position;

-- 4월 28일 다중열 서브쿼리 --

SELECT emp_id, emp_name, position, dept_id
FROM y_emp
WHERE (position, dept_id)IN(SELECT position, dept_id FROM y_emp
                            WHERE emp_name LIKE '차%')
AND emp_name NOT LIKE '차%';                            
                
SELECT emp_id, emp_name, position, dept_id
FROM y_emp
WHERE position IN(SELECT position FROM y_emp
                          WHERE emp_name LIKE '차%')
AND dept_id IN(SELECT dept_id FROM y_emp
                          WHERE emp_name LIKE '차%')
                          
AND emp_name NOT LIKE '차%';                            

SELECT emp_name, salary, dept_id
FROM y_emp outer
WHERE salary>(SELECT AVG(salary)FROM y_emp
                    WHERE dept_id = outer.dept_id);

SELECT emp_id, emp_name, position, dept_id
FROM y_emp o
WHERE EXISTS (SELECT 'x'
                  FROM y_emp
                  WHERE mgr_id = o.emp_id
    );

SELECT emp_id, emp_name, position, dept_id
FROM y_emp
WHERE emp_id IN (SELECT mgr_id FROM y_emp);

SELECT emp_id,emp_name, position, dept_id
FROM y_emp o
WHERE NOT EXISTS (SELECT 'x'
                        FROM y_emp
                        WHERE mgr_id = o.emp_id);
                        
SELECT  a.emp_name, a.salary,
        a.dept_id, b.salavg
FROM    y_emp a JOIN (SELECT dept_id, AVG(salary) salavg
                      FROM y_emp
                      GROUP BY dept_id) b
ON ( a.dept_id = b.dept_id )
AND a.dept_id < 400
AND       a.salary > b.salavg;

select emp_name from y_emp where rownum <= 11;

SELECT ROWNUM as RANK, emp_id, emp_name, salary
FROM (SELECT emp_id, emp_name, salary FROM y_emp
      WHERE salary IS NOT NULL
      ORDER BY salary DESC)
WHERE ROWNUM <= 5;

SELECT ROWNUM as RANK, E.emp_name, E.hiredate
FROM (SELECT emp_name,hiredate FROM y_emp
      ORDER BY hiredate)E
WHERE rownum <= 3;

SELECT emp_id, emp_name, salary,
          RANK()OVER(ORDER BY salary DESC) AS sal_rank,
          DENSE_RANK()OVER(ORDER BY salary DESC) AS sal_dense_rank
FROM y_emp;

SELECT emp_id, emp_name,
        (CASE WHEN dept_id =
              (SELECT dept_id FROM y_dept
               WHERE loc_id = 4)
         THEN '대구' ELSE '기타' END) loc_name
FROM y_emp;       

SELECT emp_id, emp_name
FROM y_emp e
ORDER BY (SELECT dept_name FROM y_dept d
          WHERE e.dept_id = d.dept_id);
          
WITH
dept_total_sal AS (
      SELECT d.dept_name, SUM(e.salary) AS dept_total
      FROM y_emp e JOIN y_dept d
      ON (e.dept_id = d.dept_id)
      GROUP BY d.dept_name),
total_avg_sal AS (
      SELECT SUM(dept_total)/COUNT(*) AS dept_avg
      FROM dept_total_sal)
      
SELECT *
FROM dept_total_sal
WHERE dept_total >
    (SELECT dept_avg
     FROM total_avg_sal);




--기타 쿼리--

SELECT * FROM y_award;

SELECT emp_id
FROM y_emp
UNION
SELECT emp_id
FROM y_award;

SELECT emp_id, position
FROM y_emp
UNION
SELECT emp_id, position
FROM y_award;

SELECT emp_id, position
FROM y_emp
UNION ALL
SELECT emp_id, position
FROM y_award;

SELECT emp_id,emp_name, dept_id
FROM y_emp
INTERSECT
SELECT emp_id, awardee, dept_id
FROM y_award;

SELECT emp_id,emp_name, position
FROM y_emp
INTERSECT
SELECT emp_id, awardee, position
FROM y_award;

SELECT emp_id,awardee
FROM y_award
MINUS
SELECT emp_id, emp_name
FROM y_emp;

SELECT emp_id, emp_name FROM y_emp
MINUS
SELECT emp_id, awardee FROM y_award;


--5월 12일

SELECT emp_id, emp_name, position, mgr_id
FROM y_emp
START WITH emp_id = 1001 
CONNECT BY PRIOR emp_id = mgr_id;

SELECT emp_id, emp_name, position, mgr_id
FROM y_emp
START WITH emp_id = 1019
CONNECT BY PRIOR emp_id = mgr_id;

col path for a40
SELECT emp_id,emp_name,SYS_CONNECT_BY_PATH(emp_id,'/')path
FROM y_emp
START WITH emp_id=1001
CONNECT BY PRIOR emp_id= mgr_id;

SELECT emp_id, emp_name,mgr_id ,level
FROM y_emp
START WITH emp_id = 1001
CONNECT BY PRIOR emp_id = mgr_id;

SELECT emp_id, emp_name, mgr_id ,level
FROM y_emp
START WITH emp_id = 1035
CONNECT BY PRIOR emp_id = mgr_id;

col chart format a50
SELECT LPAD(emp_id,LENGTH(emp_id)+(LEVEL*2)-2,'-')AS CAHRT
FROM y_emp
START WITH emp_id = 1001
CONNECT BY PRIOR emp_id = mgr_id;

SELECT LPAD(emp_id,LENGTH(emp_id)+(LEVEL*2)-2,'-')AS CAHRT
FROM y_emp
WHERE emp_id<>1002
START WITH emp_id = 1001
CONNECT BY PRIOR emp_id = mgr_id;

SELECT LPAD(emp_id,LENGTH(emp_id)+(LEVEL*2)-2,'-')AS CAHRT
FROM y_emp
START WITH emp_id = 1001
CONNECT BY PRIOR emp_id = mgr_id
AND emp_id <>1002;

INSERT INTO y_dept(dept_id, dept_name,mgr_id, loc_id)
VALUES (600,'생산관리',1038,6);

INSERT INTO y_dept
VALUES (600,'생산관리',1038,6);

SELECT * FROM y_dept;

INSERT INTO y_dept(dept_id, dept_name)
VALUES(700,'회계부');

INSERT INTO y_dept
VALUES(800,'시스템관리', NULL,NULL);

SELECT * FROM y_dept;

INSERT INTO y_emp(emp_id,emp_name,hiredate,dept_id)
VALUES(2007,'박민영',SYSDATE,700);

SELECT emp_id, emp_name,hiredate,dept_id
FROM y_emp
WHERE emp_id=2007;

INSERT INTO y_emp(emp_id,emp_name,hiredate)
VALUES(2008,'윤현민',TO_DATE('99/02/03','YY/MM/DD'));

INSERT INTO y_emp(emp_id,emp_name,hiredate)
VALUES(2009,'Jason Lee',TO_DATE('99/02/03','RR/MM/DD'));

SELECT emp_id, emp_name, TO_CHAR(hiredate,'yyyy/mm/dd')
FROM y_emp
WHERE emp_id IN (2008,2009);

COMMIT;

desc EMP300;
SELECT COUNT(*) FROM emp300;

INSERT INTO emp300
SELECT emp_id, emp_name, salary,dept_id
FROM y_emp
WHERE dept_id = 300;

SELECT * FROM emp300;
COMMIT;

CREATE TABLE test300
as
SELECT emp_id,emp_name,salary,dept_id
from y_emp
WHERE dept_id= 300;


desc test300;
SELECT COUNT(*) FROM test300_01;


CREATE TABLE test300_01
as
SELECT emp_id,emp_name,salary,dept_id
from y_emp
WHERE 1=2; 
-- 구조만 가져오고 정보는 가져오지않음

SELECT COUNT(*) FROM test300_01;




-- 5월 26일

INSERT ALL
INTO sal_list VALUES(emp_id,salary,position)
INTO mgr_list VALUES(emp_id,mgr_id,hiredate)
SELECT emp_id, hiredate, salary,position, mgr_id
FROM y_emp
WHERE emp_id>2000;

SELECT * FROM sal_list;
SELECT * FROM mgr_list;

ROLLBACK;

INSERT ALL
WHEN salary>300 THEN
INTO sal_list VALUES(emp_id,salary,position)
WHEN position <> '대리' THEN
INTO mgr_list VALUES(emp_id, mgr_id, hiredate)
SELECT emp_id, hiredate, salary, position, mgr_id
FROM y_emp
WHERE emp_id > 1080;

SELECT * FROM sal_list;

SELECT * FROM mgr_list;

INSERT FIRST
WHEN SAL > 5000 THEN
INTO high_income VALUES (DEPTID, SAL)
WHEN HIREDATE like('17%') THEN
INTO hired_list17 VALUES(DEPTID,HIREDATE)
WHEN HIREDATE like ('18%') THEN
INTO hired_list18 VALUES(DEPTID, HIREDATE)
ELSE
INTO hired_list VALUES (DEPTID, HIREDATE)
SELECT dept_id DEPTID, SUM(salary) SAL, MAX(hiredate) HIREDATE
FROM  y_emp
GROUP BY dept_id;

SELECT * FROM high_income;
SELECT * FROM hired_list17;
ROLLBACK; 

DESC sales_data;
SELECT * FROM sales_data;

DESC sales_report

INSERT ALL
INTO sales_report VALUES(emp_id, week_id, mon_sales)
INTO sales_report VALUES(emp_id, week_id, tue_sales)
INTO sales_report VALUES(emp_id, week_id, wed_sales)
INTO sales_report VALUES(emp_id, week_id, thur_sales)
INTO sales_report VALUES(emp_id, week_id, fri_sales)
SELECT emp_id, week_id,mon_sales,tue_sales,wed_sales,thur_sales,fri_sales
FROM sales_data;

SELECT * FROM sales_report;

UPDATE emp300
SET dept_id=400
WHERE emp_id = 1037;
select * from emp300;

UPDATE emp300
SET dept_id=80;

ROLLBACK;

UPDATE emp300
SET salary = (SELECT salary FROM y_emp
              WHERE emp_id = 1038),
        dept_id = (SELECT dept_id FROM y_emp
              WHERE emp_id = 1038)
WHERE emp_id=1087;

SELECT * FROM emp300;
            
COMMIT;

DELETE FROM emp300
WHERE emp_id = 1087;


DELETE FROM emp300
WHERE emp_id = 1109;


DELETE FROM emp300;

COMMIT;

DELETE from y_emp
WHERE dept_id= (SELECT dept_id FROM y_dept WHERE dept_name LIKE '%회계%');

select * from old_emp;

select emp_id, emp_name, dept_id
from y_emp;
 
update y_emp
set dept_id =null
where emp_id in (1029, 1067);
    
commit;
    
select emp_id, emp_name, dept_id
from y_emp;
    
    
MERGE INTO old_emp o
    USING y_emp e
      ON (o.emp_id = e.emp_id)
    WHEN MATCHED THEN
      UPDATE SET
        o.emp_name      = e.emp_name,
        o.position         = e.position,
        o.salary         = e.salary,
        o.dept_id  = e.dept_id
  DELETE WHERE (e.dept_id is null)
  WHEN NOT MATCHED THEN
    INSERT VALUES(e.emp_id, e.emp_name,e.position,
        e.salary, e.dept_id);
            
SELECT * FROM old_emp;
            
COMMIT;

-- 트랜잭션 

create table test (id number, sal number);

insert into test values (10, 1000);

insert into test values (20, 2000);

insert into test values (30, 3000);

commit;
select * from test ;
update test set sal = 7000 where id = 20;
commit;
update test set sal = 8000 where id = 20;
select * from test ;
commit;
update test set sal = 9999 where id = 30;
select * from test ;
commit;
select * from test ;
lock table test in exclusive mode;
commit;
select * from test;
insert into test values (40,8888);
delete from test where id = 20;
insert into test values (50,5555);
select * from test;
rollback;
select * from test;
insert into test values (70,7777); 
savepoint a1;
delete from test where id = 20;
savepoint a2;
select * from test;
rollback to a1;
commit;
select * from test;

--10장 --

desc user_tables;

select table_name, tablespace_name , status, blocks 
from user_tables
where table_name = 'Y_EMP';

desc user_tables;


--제약조건을 이용한 테이블 생성

drop table test purge;

create table test (id number primary key,
name varchar2(20)constraint test_name_nn not null);

select table_name , constraint_name, status from user_constraints
where table_name = 'TEST';



-- (Column Level 방식)

-- 1. 부모 테이블을 먼저 생성한다.
create table location 
(lo_id number(3) constraint location_lo_id_pk primary key,
state varchar2(20) constraint location_state_nn not null,
account number(7) constraint location_account_uk unique);

-- 2. 자식 테이블을 생성한다.
create table dept
(deptno number(4) constraint dept_deptno_pk primary key,
dname varchar2(20) constraint dept_dname_nn not null,
time number(3) constraint dept_time_ck check (time between 50 and 70),
lo_id number(3) constraint dept_lo_id_fk references location(lo_id));

desc location ;

drop table dept purge;
drop table location purge;


-- (Table Level 방식)

-- 1. 부모테이블을 먼저 생성한다
create table location
(lo_id number(3),
state varchar2(20) constraint location_state_nn not null,
account number(7),
constraint location_lo_id_pk primary key(lo_id),
constraint location_account_uk unique(account));

-- 2. 자식 테이블을 생성한다
create table dept
(deptno number(4),
dname varchar2(20) constraint dept_dname_nn not null,
time number(3),
lo_id number(3),
constraint dept_deptno_pk primary key(deptno),
constraint dept_time_ck check (time between 50 and 70),
constraint dept_lo_id_fk foreign key(lo_id) references location(lo_id));

desc location ;

-- 6월 1일 

create table dept200
as select emp_id, emp_name, salary*12 annsal, hiredate
from y_emp
where dept_id = 200;

desc dept200

alter table dept200
add (position varchar2(10));

desc dept200

select * from dept200;


alter table dept200
modify hiredate timestamp;

desc dept200

alter table dept200
modify position varchar2(20);

desc dept200

- default값을 이용하여 값 수정
alter table dept200
modify position default '사원';

select * from dept200;

select * from dept200;

update dept200
set position = default;

commit;

select * from dept200;

create table test
(id number, name varchar2(10) default '김');

insert into test
values (10,default);

select * from test;

desc dept200

alter table dept200
rename column emp_name to ename

desc dept200

alter table dept200 drop column hiredate;

desc dept200

unused column
desc dept200

alter table dept200
set unused (annsal, position);
desc dept200

select * from dept200;

alter table dept200
drop unused columns;

alter table emp300 read only;

update emp300
set salary = salary * 1.1;  -- 에러 발생

drop table test;
select * from test;
   
flashback table test to before drop;
select * from test;

drop table test;
select * from test;

select * from tab;

select object_name, type, createtime, droptime
from recyclebin;

flashback table "BIN$axM/ume9QS2TXSrUql8duw==$0" to before drop;
drop table test purge;
select * from tab;

purge recyclebin;

-- 부모가 죽고   자식이 죽을수도있고
-- 부모가 죽어도 자식이 남을 수도있다
-- 자식테이블은 언제라도 죽어도 된다 부모테이블은 안됨

-- 부모테이블 생성
create table test_pt
(d_id number(3) constraint test_pt_d_id_pk primary key,
dname varchar2(10));

-- 자식테이블 생성
create table test_ct
(id number(3) constraint test_ct_id_pk primary key,
name varchar2(10) constraint test_ct_name_nn not null);

-- user_constraints 뷰를 통해 제약조건 검사
select table_name, constraint_name, status
from user_constraints
where table_name in ('TEST_PT','TEST_CT'); -- cons01로 저장

-- 부모/자식 테이블 구성 조사
desc test_ct;
desc test_pt;

--제약조건을 추가하기 위해서 자식테이블에 3개컬럼(hp,sal, d_id)를 추가
alter table TEST_CT
add (hp varchar2(11));

alter table test_ct
add (sal number(9));

alter table test_ct
add (d_id number(3));

-- 추가된 컬럼을 확인 하기 위해 자식테이블 구성조사
desc test_ct

-- unique key 제약조건을 생성
alter table test_ct
add constraint test_ct_hp_uk unique(hp);

-- check 제약조건을 생성
alter table test_ct
add constraint test_ct_sal_ck check (sal between 10000 and 90000);

-- foreign key 제약조건을 옵션 없이 생성
alter table test_ct
add constraint test_ct_d_id_fk foreign key(d_id)
references test_pt(d_id);

-- 부모 테이블에 row 입력 후 확인
insert into test_pt
values (10,'admin');
insert into test_pt
values (20, 'sales');
insert into test_pt
values (30, 'marketing');
commit;

select * from test_pt;

insert into test_ct
values (111,'mapia', '01077779999',17000,10);

insert into test_ct
values (112,'solomon', '01012345678',57000,10);

insert into test_ct
values (117,'kkk', '01012331111',77000,20);

insert into test_ct
values (118,'simson', '01087654321',89000,30);

insert into test_ct
values (127,'scott', '01027277979',89000,30);

commit;
select * from test_ct;


-- 12. 행 삽입 및 삭제, 컬럼값 변경 등을 통해 여러 가지 제약조건 테스팅
-- ※ foreign key를 on delete cascade/on delete set null 옵션 테스팅(p308)

-- 먼저 foreign key 제약조건을 삭제
alter table test_ct
drop constraint test_ct_d_id_fk;

--롤백
rollback

-- user_constraints 뷰를 통해 추가 제약조건 검사(cons01로 조회)
select table_name, constraint_name, status
from user_constraints
where table_name in ('TEST_PT', 'TEST_CT');

-- foreign key를 on delete cascade 옵션으로 생성(p308)
alter table test_ct
add constraint test_ct_d_id_fk foreign key(d_id)
references test_pt(d_id) on delete cascade;

-- user_constraints 뷰를 통해 추가 제약조건 검사(cons01로 조회)
select table_name,constraint_name,status
from user_constraints
where table_name in ('TEST_PT','TEST_CT');

-- 부모 테이블 특정 row 삭제
delete from test_pt where d_id=10 ;

-- on delete cascade 옵션이 적용되었는지를 확인 후 rollback
select *from test_ct;
select * from test_pt;
select * from test_ct;
rollback;

-- 다시 foreign key 제약조건을 삭제
alter table test_ct
drop constraint test_ct_d_id_fk; 

-- user_constraints 뷰를 통해 추가 제약조건 검사(cons01로 조회)
select table_name, constraint_name, status
from user_constraints
where table_name in ('TEST_PT', 'TEST_CT');

-- foreign key를 on delete null 옵션으로 생성(p308)
alter table test_ct
add constraint test_ct_d_id_fk foreign key(d_id)
references test_pt(d_id)
on delete set null; 

-- user_constraints 뷰를 통해 추가 제약조건 검사(cons01로 조회)
select table_name, constraint_name, status
from user_constraints
where table_name in ('TEST_PT', 'TEST_CT');

-- 부모 테이블 특정 row 삭제
delete from test_pt where d_id = 10;

-- on delete set null 옵션이 적용되었는지를 확인 후 테이블 삭제
select * from test_pt;
select * from test_ct;
rollback;

-- 부모 테이블 삭제 
-- 자식 테이블이 있어 삭제가 안 됨 
drop table test_pt purge;

--cascade constraint 옵션으로 부모 테이블 삭제
drop table test_pt cascade constraints purge;

-- 추후에 자식 테이블 삭제
drop table test_ct purge;

-- 제약조건 활성화 및 비활성화(p311 ~ p315)

-- 부모테이블생성
create table test_pt
(d_id number(3) constraint test_pt_d_id_pk primary key,
dname varchar2(10));

-- 자식테이블생성
create table test_ct
(id number(3) constraint test_ct_id_pk primary key,
name varchar2(10) constraint test_ct_name_nn not null,
d_id number(3) constraint test_ct_d_id_fk references test_pt(d_id));

-- user_constraints 뷰를 통해 제약조건 검사(cons01로 조회)
select table_name, constraint_name, status
from user_constraints
where table_name in ('TEST_PT', 'TEST_CT');

-- 부모 테이블에 row 입력 후 확인
insert into test_pt 
values (10, 'admin');
insert into test_pt 
values (20, 'sales');
insert into test_pt 
values (30, 'marketing');
commit;

select * from test_pt;

--자식테이블에 row 입력후 확인
insert into test_ct
values (111,'mapia',10);
insert into test_ct
values (112,'solomon',10);
insert into test_ct
values (113,'kkk',20);
insert into test_ct
values (118, 'simson', 30);
commit;

select * from test_ct;

-- 부모 테이블에서 cascade 옵션으로 constraint disable
alter table test_pt
disable constraint test_pt_d_id_pk cascade;

-- user_constraints 뷰를 통해 제약조건의 status 검사(cons01로 조회) 
select table_name,constraint_name, status
from user_constraints
where table_name in('TEST_PT','TEST_CT');

-- 중복된 부서 코드를 입력
insert into test_pt
values (20,'affairs');
commit;

-- 부모 테이블 제약조건은 enamble
alter table test_pt
enable constraint test_pt_d_id_pk; -- 중복된 부서 코드 입력으로 인한 오류발생

-- rowid를 이용하여 오류수정
select d_id,dname,rowid
from test_pt;


delete from test_pt
where rowid = 'AAAE52AAEAAAAH2AAD';
commit;

select * from test_pt;

-- 다시 부모 테이블의 제약조건을 enable
alter table test_pt
enable constraint test_pt_d_id_pk;

-- user_constraints 뷰를 통해 제약조건의 status 검사(cons01로 조회) 
select table_name, constraint_name, status
from user_constraints
where table_name in ('TEST_PT', 'TEST_CT');

-- 자식 테이블의 제약조건을 enable 
alter table test_ct
enable constraint test_ct_d_id_fk;

-- user_constraints 뷰를 통해 제약조건의 status 검사(cons01로 조회) 
select table_name, constraint_name, status
from user_constraints
where table_name in ('TEST_PT', 'TEST_CT');

-- pk가 ck를 참조하는중

-- 제약조건의 삭제 (p315~p316)
select table_name, constraint_name, r_constraint_name, status
from user_constraints
where table_name in ('TEST_PT', 'TEST_CT');

-- 앞 페이지에서 삭제한 제약조건 추가
alter table test_pt
add constraint test_pt_d_id_pk;

alter table test_pt
drop constraint test_pt_d_id_pk cascade;

-- 제약조건이 정의된 열 삭제(p316 ~ p318)

-- 앞 페이지에서 삭제한 제약조건 추가
alter table test_pt
add constraint test_pt_d_id_pk primary key(d_id);

alter table test_ct
add constraint test_ct_d_id_fk foreign key(d_id)
references test_pt(d_id);
   
-- user_constraints 뷰를 통해 제약조건의 종속관계를 검사
select table_name, constraint_name, r_constraint_name, 
status, search_condition
from user_constraints
where table_name in ('TEST_PT', 'TEST_CT'); --> cons03로 저장

-- user_constraints 뷰를 통해 제약조건의 이름 확인
select table_name, constraint_name, constraint_type
from user_constraints
where table_name = 'DEPT400'; --> cons04로 저장
-- 제약조건이름 줘야한다

-- 제약조건의 이름 변경 
alter table dept400
rename constraint SYS_C007002 to dept400_name_nn;

-- user_constraints 뷰를 통해 제약조건의 이름 확인(cons04로 조회)
select table_name, constraint_name, constraint_type
from user_constraints
where table_name = 'DEPT400';

-- 
select * from test_pt;
insert into test_pt values (10,'aaa');

-- 지연 가능한 제약조건(p319 ~ p321)

-- ※ NOT DEFERRABLE IMMEDIATE 경우

-- Y_DEPT의 제약조건을 살펴보고 PRIMARY KEY를 추가
SELECT constraint_name, status, constraint_type, deferrable, deferred
FROM user_constraints
WHERE table_name = 'Y_DEPT'; ==> con1로 저장

ALTER TABLE y_dept
ADD constraint y_dept_dept_id_pk PRIMARY KEY(dept_id); ==> con2로 저장


SELECT * FROM y_dept;
-- Y_DEPT를 먼저 조회 후에 자료 입력

INSERT INTO y_dept(dept_id, dept_name)
VALUES(700,'배송부');
INSERT INTO y_dept(dept_id, dept_name)
VALUES(700,'판매부');
SELECT * FROM y_dept; -- 판매부는 살아있음

rollback;

-- 제약조건을 지연으로변경 하면 ? 에라남
set constraint y_dept_dept_id_pk deferred;

set constraint y_dept_dept_id_pk deferred;

ALTER TABLE y_dept
DROP constraint y_dept_dept_id_pk; ==> con3로 저장

ALTER TABLE y_dept
ADD constraint y_dept_dept_id_pk PRIMARY KEY(dept_id) 
DEFERRABLE INITIALLY IMMEDIATE; ==> con4로 저장

ALTER TABLE y_dept
ADD constraint y_dept_dept_id_pk PRIMARY KEY(dept_id) 
DEFERRABLE; ==> con4-1로 저장

rollback;

-- Y_DEPT의 PRIMARY KEY 속성을 조회(con1로 조회)
SELECT constraint_name, status, constraint_type, deferrable, deferred
FROM user_constraints
WHERE table_name = 'Y_DEPT';
-- "DEFERRABLE IMMEDIATE"로 조회됨

-- 4) Y_DEPT를 먼저 조회한 후에 자료 입력
SELECT * FROM y_dept;

INSERT INTO y_dept(dept_id, dept_name)
VALUES(700,'배송부');
INSERT INTO y_dept(dept_id, dept_name)
VALUES(700,'판매부');

-- 5) Y_DEPT를 조회
SELECT * FROM y_dept;
-- > “700 배송부” 데이터는 트랜잭션 진행중으로 계속 조회가 되며, 
--    기본값인 즉시적(IMMEDIATE)으로 인해서 문장레벨에서 오류가 발생한 문장만       취소되고 트랜잭션은 계속 유지됨

rollback;

set constraint y_dept_dept_id_pk deferred;

--8) 먼저 Y_DEPT를 조회한 후에 다음과 같이 삽입  
SELECT * FROM y_dept;

INSERT INTO y_dept(dept_id, dept_name)
VALUES(700,'배송부');
INSERT INTO y_dept(dept_id, dept_name)
VALUES(700,'판매부');

SELECT * FROM y_dept; 

commit;
--오류 발생 -
--SQL 오류: ORA-02091: transaction rolled back

9) Y_DEPT를 조회
SELECT * FROM y_dept;
--> 트랜잭션 단위(레벨)로 롤백이 진행됨. 
--    지연적(DEFERRED)으로 인해 이 작업은 커밋 시 한꺼번에 제약조건을 검사한        후에 단 한건이라도 제약조건을 위배하면 전체 롤백이 됨

--1) DEFERRABLE DEFERRED를 설정하기 위해 제약조건을 삭제(con3로 수행)
ALTER TABLE y_dept
DROP constraint y_dept_dept_id_pk;

--2) DEFERRABLE DEFERRED 제약조건으로 추가
ALTER TABLE y_dept
ADD constraint y_dept_dept_id_pk PRIMARY KEY(dept_id) 
DEFERRABLE INITIALLY DEFERRED; ==> con5로 저장

3) Y_DEPT의 PRIMARY KEY 속성을 조회(con1로 조회)
SELECT constraint_name, status, constraint_type, deferrable, deferred
FROM user_constraints
WHERE table_name = 'Y_DEPT';
--> "DEFERRABLE DEFERRED"로 조회됨

--4) 먼저 Y_DEPT를 조회한 후에 다음과 같이 삽입  
SELECT * FROM y_dept;

INSERT INTO y_dept(dept_id, dept_name)
VALUES(700,'배송부');
INSERT INTO y_dept(dept_id, dept_name)
VALUES(700,'판매부');

SELECT * FROM y_dept;

rollback;

select * from y_dept;

commit;

--5) Y_DEPT를 조회
SELECT * FROM y_dept;
--> 트랜잭션 단위(레벨)로 롤백이 진행됨. 
--    기본값인 지연적(DEFERRED)으로 인해 이 작업은 커밋 시 한꺼번에 제약조건을      검사한 후에 단 한건이라도 제약조건을 위배하면 전체 롤백이 됨

--6) 제약조건을 즉시적(IMMEDIATE)으로 변경.
set constraint y_dept_dept_id_pk immediate;

7) Y_DEPT를 먼저 조회 후에 자료 입력
SELECT * FROM y_dept;
delete from y_dept where dept_id=700;
commit;
