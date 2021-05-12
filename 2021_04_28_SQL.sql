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

