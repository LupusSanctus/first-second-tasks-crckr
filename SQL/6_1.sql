SELECT dname, ename, ROUND(sal/ (SELECT sum(sal) FROM emp WHERE d.deptno = emp.deptno GROUP BY deptno), 2) 
FROM emp e, dept d
WHERE d.deptno = e.deptno (+)