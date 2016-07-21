SELECT d.dname, e.ename, ROUND(sal/ SUM(e.sal) OVER (PARTITION BY e.deptno), 2) rounded_salary_sum
FROM emp e, dept d
WHERE d.deptno = e.deptno (+)