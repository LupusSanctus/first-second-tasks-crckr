SELECT d.dname, e.ename, e.empno
FROM emp e, dept d
WHERE e.deptno = d.deptno
ORDER BY e.ename