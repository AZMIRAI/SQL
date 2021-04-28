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
