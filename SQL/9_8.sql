/* postgres version */

DROP TABLE IF EXISTS emp_log;
CREATE TABLE emp_log(
    operation CHAR(1) NOT NULL,
    change_date TIMESTAMP NOT NULL,
    userid TEXT NOT NULL,
    EMPNO INTEGER NOT NULL,
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR INTEGER,
    HIREDATE DATE,
    SAL INTEGER,
    COMM INTEGER,
    DEPTNO INTEGER
);

CREATE OR REPLACE FUNCTION emp_logging() RETURNS TRIGGER AS $$
    BEGIN

        IF (TG_OP = 'DELETE') THEN
            INSERT INTO emp_log SELECT 'Del', now(), user, OLD.*;
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO emp_log SELECT 'Updt', now(), user, NEW.*;
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO emp_log SELECT 'Insrt', now(), user, NEW.*;
            RETURN NEW;
        END IF;
        RETURN NULL;
        
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER emp_log
AFTER INSERT OR UPDATE OR DELETE ON emp_copy
    FOR EACH ROW EXECUTE PROCEDURE emp_logging();
    
-- insertation
INSERT INTO emp_copy VALUES(7269, 'SMITH',  'CLERK',     7902,
        TO_DATE('17-DEC-1980', 'DD-MON-YYYY'),  800, NULL, 20);
