/* postgres version */

CREATE OR REPLACE FUNCTION raise_sal
(
    raise_percent IN NUMERIC(4, 1), --INTEGER,
    emp_or_deptno INTEGER DEFAULT NULL
)
RETURNS VOID AS $$
DECLARE
    old_salary integer;
    in_deptno integer;
    emp_name character varying(10);
    new_salary numeric(6, 1);
    manager_salary integer;
    lng integer;
BEGIN

    SELECT char_length(''||emp_or_deptno) INTO lng;
    -- deptno case
    CASE lng WHEN 2 THEN  
                SELECT sal INTO manager_salary FROM emp_copy WHERE job = 'MANAGER' AND deptno = emp_or_deptno;
                raise notice 'Manager salary is: %', manager_salary;
                FOR old_salary, emp_name IN SELECT sal, ename FROM emp_copy WHERE deptno = emp_or_deptno AND job != 'MANAGER' LOOP
                    new_salary := (raise_percent / 100) * old_salary + old_salary;
                    IF(manager_salary >= new_salary)  THEN
                        raise notice 'New salary of % is: %', emp_name, new_salary;
                    ELSE
                        raise notice 'New salary of % shouldn`t be risen - salary is %', emp_name, old_salary;
                    END IF;
                END LOOP;
            -- empno case
            WHEN 4 THEN
                SELECT ename, deptno, sal INTO emp_name,in_deptno, old_salary FROM emp_copy WHERE empno = emp_or_deptno;
                SELECT sal INTO manager_salary FROM emp_copy WHERE job = 'MANAGER' AND deptno = in_deptno;
                raise notice 'Manager salary is: %', manager_salary;   
                new_salary := (raise_percent / 100) * old_salary + old_salary;
                IF(manager_salary >= new_salary)  THEN
                    raise notice 'New salary of % is: %', emp_name, new_salary;
                ELSE
                    raise notice 'New salary of % shouldn`t be risen - salary is %', emp_name, old_salary;
                END IF;
            ELSE        
                raise notice 'Wrong param';
    END CASE;

END;
$$ LANGUAGE plpgsql;

--execute
--1) percent, employee
SELECT raise_sal(5.0, 7369);
--2) percent, department
SELECT raise_sal(3.0, 10);
