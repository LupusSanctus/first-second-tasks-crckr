SELECT x.dname, x.ename, x.sal, 'boss', x.emp_salary_max
FROM (
SELECT dx.dname, ex.ename, ex.sal, MAX(ex.sal) OVER (PARTITION BY ex.deptno) emp_salary_max 
FROM emp ex, dept dx
WHERE ex.deptno = dx.deptno
ORDER BY ex.ename
) x
WHERE x.sal IN (x.emp_salary_max)