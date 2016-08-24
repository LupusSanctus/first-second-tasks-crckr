/* postgres version */

CREATE OR REPLACE FUNCTION raise_sal
(
    raise_percent IN NUMERIC(4, 1),
    emp_or_deptno INTEGER DEFAULT NULL
)
RETURNS VOID AS $$
DECLARE
    old_salary integer;
    in_deptno integer;
    new_salary numeric(6, 1);
    lng integer;
    emp_name character varying(10);
    
    manager_num integer;
    manager_salary integer;
    manager_name character varying(10);
    
BEGIN

    SELECT char_length(''||emp_or_deptno) INTO lng;
    -- deptno case
    CASE lng WHEN 2 THEN  
                FOR old_salary, emp_name, manager_num IN SELECT sal, ename, mgr FROM emp_copy WHERE deptno = emp_or_deptno LOOP --AND job != 'PRESIDENT' LOOP
                SELECT sal, ename INTO manager_salary, manager_name FROM emp_copy WHERE empno = manager_num;
                raise notice 'Manager of % is % . Manager salary is: %', emp_name, manager_name, manager_salary;
                    new_salary := (raise_percent / 100) * old_salary + old_salary;
                    IF(manager_salary >= new_salary OR manager_name IS NULL)  THEN
                        raise notice 'New salary of % is: %', emp_name, new_salary;
                    ELSE
                        raise notice 'New salary of % shouldn`t be risen - current salary is %', emp_name, old_salary;
                    END IF;
                END LOOP;
            WHEN 4 THEN
                SELECT ename, deptno, sal, mgr INTO emp_name,in_deptno, old_salary, manager_num FROM emp_copy WHERE empno = emp_or_deptno;
                SELECT sal, ename INTO manager_salary, manager_name FROM emp_copy WHERE empno = manager_num;
                raise notice 'Manager of % is % . Manager salary is: %', emp_name, manager_name, manager_salary;
                new_salary := (raise_percent / 100) * old_salary + old_salary;
                IF(manager_salary >= new_salary OR manager_name IS NULL) THEN
                    raise notice 'New salary of % is: %', emp_name, new_salary;
                ELSE
                    raise notice 'New salary of % shouldn`t be risen - current salary is %', emp_name, old_salary;
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
