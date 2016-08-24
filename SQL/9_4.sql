/* postgres version */

CREATE OR REPLACE FUNCTION emp_message
(
   in_empno IN EMP.EMPNO%TYPE
)
RETURNS VOID AS $$

DECLARE

    in_ename EMP.ENAME%TYPE;
    in_hiredate EMP.HIREDATE%TYPE;
    in_sal EMP.SAL%TYPE;
    
BEGIN 

    SELECT ename, hiredate, sal INTO in_ename, in_hiredate, in_sal FROM EMP_COPY WHERE empno = in_empno;
    IF(in_sal > 1200) THEN
        raise notice 'Salary > 1200';
        IF(SELECT in_ename ~ 'R') THEN
            raise notice 'Name contains R';
            IF(SELECT in_hiredate::text LIKE '%-03-%') THEN
                raise notice 'March start date';
            END IF;
        END IF;
    ELSE
        raise notice '**None**';
    END IF;
    
END;
$$ LANGUAGE plpgsql;

--execute
SELECT emp_message(7934);
