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




