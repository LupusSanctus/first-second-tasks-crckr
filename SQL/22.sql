SELECT * FROM pers
WHERE TO_NUMBER(SUBSTR(TO_CHAR(HIRE_DATE),1,2))<5;

SELECT TO_DATE(TO_CHAR(hire_date, 'fmDD-MON')||'-2010') as "Первое поле", 
REPLACE(TO_CHAR(TRUNC(hire_date, 'DD'), 'fmMM.YYYY'), '.', '-') as "Второе поле" 
FROM pers
WHERE TO_NUMBER(SUBSTR(TO_CHAR(HIRE_DATE),1,2))<5;
