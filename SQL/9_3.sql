/* postgres version */

-- create emp_copy
DROP TABLE IF EXISTS emp_copy;
CREATE TABLE emp_copy
AS (SELECT * FROM emp);

-- 1) line insertation
CREATE OR REPLACE FUNCTION insert_line
(
   in_empno IN EMP.EMPNO%TYPE,
   in_ename IN EMP.ENAME%TYPE,
   in_job IN EMP.JOB%TYPE,
   in_mgr IN EMP.MGR%TYPE,
   in_hiredate IN EMP.HIREDATE%TYPE,
   in_sal IN EMP.SAL%TYPE,
   in_comm IN EMP.COMM%TYPE,
   in_deptno EMP.DEPTNO%TYPE DEFAULT NULL
)
RETURNS VOID AS $$
DECLARE
    min_department integer;
    min_department_num EMP.DEPTNO%TYPE;
BEGIN

    SELECT MIN(count) INTO min_department FROM (SELECT deptno, COUNT(deptno) FROM EMP_COPY GROUP BY deptno)tab;
    SELECT tab2.deptno INTO min_department_num FROM (SELECT deptno, COUNT(deptno) FROM EMP_COPY GROUP BY deptno)tab2 WHERE tab2.count = min_department;

    --raise notice 'Value: %', min_department;
    --raise notice 'Value: %', min_department_num;
   
    CASE WHEN in_deptno IS NULL THEN 
            INSERT INTO EMP_COPY ("empno", "ename", "job", "mgr", "hiredate", "sal", "comm", "deptno") 
            VALUES (in_empno, in_ename, in_job, in_mgr, in_hiredate, in_sal, in_comm, min_department_num);     
         ELSE
            INSERT INTO EMP_COPY ("empno", "ename", "job", "mgr", "hiredate", "sal", "comm", "deptno") 
            VALUES (in_empno, in_ename, in_job, in_mgr, in_hiredate, in_sal, in_comm, in_deptno);
    END CASE;
    
END;
$$ LANGUAGE plpgsql;

-- execute
SELECT insert_line(6543,'SOMEONE','SOMEBODY', 3452, TO_DATE('23-JAN-1481', 'DD-MON-YYYY'), 4353, 341, 20);
SELECT insert_line(6559,'P','SOMEBODY', 3452, TO_DATE('23-JAN-1481', 'DD-MON-YYYY'), 4353, 341);

-- 2) line choice
CREATE OR REPLACE FUNCTION choose_line
(
   in_ename IN EMP.ENAME%TYPE,
   in_hiredate IN EMP.HIREDATE%TYPE,
   in_sal IN EMP.SAL%TYPE,
   in_deptno IN EMP.DEPTNO%TYPE,
   in_empno EMP.EMPNO%TYPE DEFAULT NULL
)
RETURNS TABLE (EMPN INTEGER,
        ENAM VARCHAR(10),
        JO VARCHAR(9),
        MG INTEGER,
        HIREDAT DATE,
        SA INTEGER,
        COM INTEGER,
        DEPTN INTEGER)
AS $$
BEGIN
    --raise notice 'Value: %', in_empno;
    CASE WHEN in_empno IS NULL THEN 
            RETURN QUERY SELECT * FROM EMP_COPY WHERE 
                     ename = in_ename AND
                     hiredate = in_hiredate AND
                     sal = in_sal AND
                     deptno = in_deptno;                     
         ELSE
            RETURN QUERY SELECT * FROM EMP_COPY WHERE empno = in_empno;
    END CASE;
    
END;
$$ LANGUAGE plpgsql;

-- execute
SELECT * FROM choose_line('SOMEONE', TO_DATE('23-JAN-1481', 'DD-MON-YYYY'), 4353, 20, 6543);
SELECT * FROM  choose_line('P', TO_DATE('23-JAN-1481', 'DD-MON-YYYY'), 4353, 10);

-- 3) delete line
CREATE OR REPLACE FUNCTION delete_line
(
   in_ename IN EMP.ENAME%TYPE,
   in_hiredate IN EMP.HIREDATE%TYPE,
   in_sal IN EMP.SAL%TYPE,
   in_deptno IN EMP.DEPTNO%TYPE,
   in_empno EMP.EMPNO%TYPE DEFAULT NULL
)
RETURNS VOID AS $$
BEGIN

    CASE WHEN in_empno IS NULL THEN 
            DELETE FROM EMP_COPY WHERE 
                     ename = in_ename AND
                     hiredate = in_hiredate AND
                     sal = in_sal AND
                     deptno = in_deptno;                     
         ELSE
            DELETE FROM EMP_COPY WHERE empno = in_empno;
    END CASE;
    
END;
$$ LANGUAGE plpgsql;

-- execute
SELECT delete_line('SOMEONE', TO_DATE('23-JAN-1481', 'DD-MON-YYYY'), 4353, 20, 6543);
SELECT delete_line('P', TO_DATE('23-JAN-1481', 'DD-MON-YYYY'), 4353, 10);
