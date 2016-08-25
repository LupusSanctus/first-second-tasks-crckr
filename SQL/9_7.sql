/* postgres version */

-- 1) create table 
DROP TABLE IF EXISTS top_emp;
CREATE TABLE top_emp
AS (SELECT empno, ename, sal FROM emp);

-- 2) procedure with param
CREATE OR REPLACE FUNCTION top_emp
(
    emp_count IN integer
)
RETURNS setof top_emp AS $$
DECLARE 
    rec top_emp%rowtype;
    num_rec integer;
    emp_cur CURSOR FOR SELECT * FROM top_emp ORDER BY sal DESC LIMIT emp_count;
BEGIN
    
    SELECT COUNT(empno) INTO num_rec FROM top_emp;
    
    IF(emp_count <> 0 AND emp_count <= num_rec) THEN
        FOR rec IN emp_cur LOOP
            RETURN NEXT rec;
        END LOOP;
    ELSIF(emp_count = 0) THEN      
       RAISE EXCEPTION 'You have queried % records!', emp_count;
    ELSE
        RAISE EXCEPTION 'Nonexistent number of records: %!', emp_count;
    END IF;

END;
$$ LANGUAGE plpgsql;

-- execute
SELECT top_emp(5);
-- errors
SELECT top_emp(500);
SELECT top_emp(0);
