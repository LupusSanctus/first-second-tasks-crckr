/*
    year_sal = 550000
    award = 10% (= 55 000)

    common_sum = 605 000
*/

/*  *** CAST-draft *** 
create or replace
FUNCTION year_award
(year_sal IN NUMBER, award IN NUMBER )
RETURN DECIMAL
IS
res DECIMAL;

BEGIN

IF (year_sal = NULL) THEN 
RETURN res;

ELSIF (award = NULL) THEN 
RETURN year_sal;

ELSE
res := CAST((CAST((award / 100) AS DECIMAL) * year_sal + year_sal) AS DECIMAL);
RETURN res;

END IF;

END year_award;
*/

/* ******** WORKS ******** */
create or replace
FUNCTION year_award
(year_sal IN NUMBER, award IN NUMBER )
RETURN NUMBER
IS
res NUMBER;

BEGIN

IF (year_sal = NULL) THEN 
RETURN res;

ELSIF (award = NULL) THEN 
RETURN year_sal;

ELSE
res := (award / 100) * year_sal + year_sal;
RETURN res;

END IF;

-- call func
select YEAR_AWARD(550000,10) from dual;
