CREATE OR REPLACE PROCEDURE NEW_EMP(
	   in_empno IN EMP.EMPNO%TYPE,
	   in_ename IN EMP.ENAME%TYPE,
	   in_job IN EMP.JOB%TYPE,
	   in_mgr IN EMP.MGR%TYPE,
	   in_hiredate IN EMP.HIREDATE%TYPE,
	   in_sal IN EMP.SAL%TYPE,
	   in_comm IN EMP.COMM%TYPE,
	   in_deptno IN EMP.DEPTNO%TYPE
)
IS
BEGIN

  INSERT INTO EMP ("EMPNO", "ENAME", "JOB", "MGR", "HIREDATE", "SAL", "COMM", "DEPTNO") 
  VALUES (in_empno, in_ename, in_job, pin_mgr, in_hiredate, in_sal, in_comm, in_deptno);

  COMMIT;

END;
/

/* call procedure */
BEGIN
   NEW_EMP(6543,'SOMEONE','SOMEBODY', 3452, TO_DATE('23-JAN-1481', 'DD-MON-YYYY'), 4353, 341, 10);
END;