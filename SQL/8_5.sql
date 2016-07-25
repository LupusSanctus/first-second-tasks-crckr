SELECT d.dname,
       e.ename,
       LAG(e.sal, 1, 0) OVER (ORDER BY e.sal) AS sal_prev,
       e.sal - LAG(e.sal, 1, 0) OVER (ORDER BY e.sal) AS sal_diff
FROM emp e, dept d
WHERE d.deptno = e.deptno
