SELECT d.dname, e.ename, e.sal
FROM emp e, dept d
WHERE d.deptno = e.deptno
UNION
SELECT 'NULL', 'TOTAL:', SUM(ex.sal) OVER (PARTITION BY ex.deptno ORDER BY ex.ename) sal_sum
FROM emp ex, dept dx
WHERE dx.deptno = ex.deptno
