with  emp_sq as(
SELECT d.dname, e.ename, null boss   FROM dept d, emp e where d.deptno = e.deptno AND e.sal NOT IN (select max(sal) from emp where emp.deptno = d.deptno )
UNION
SELECT d.dname, e.ename, 'boss' boss  FROM dept d, emp e where d.deptno = e.deptno AND e.sal IN (select max(sal) from emp where emp.deptno = d.deptno ))

select * from emp_sq;
