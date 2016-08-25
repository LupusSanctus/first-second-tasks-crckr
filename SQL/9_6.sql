/* postgres version */

CREATE OR REPLACE FUNCTION update_region
(
    location IN VARCHAR(13),
    new_depno INTEGER    
)
RETURNS VOID AS $$
DECLARE
    department_num integer;
   -- error_flag ;
BEGIN
    
    SELECT deptno INTO STRICT department_num FROM dept WHERE loc = location;
    UPDATE emp_copy SET deptno = new_depno WHERE deptno = department_num;
    
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            raise exception 'Location % not found!', location;
        WHEN TOO_MANY_ROWS THEN
            raise exception 'Location % is not unique', location;
END;
$$ LANGUAGE plpgsql;

--execute
-- 1) without error
SELECT update_region('NEW YORK', 20);
-- 2) error
SELECT update_region('N', 20);
