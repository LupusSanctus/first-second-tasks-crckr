SELECT * FROM
  CONTR LEFT OUTER JOIN PERS ON (CONTR.PERS_ID = PERS.PERS_ID)
  INNER JOIN (SELECT depart.depart_id AS deprt, depart.parent_id, depart.name, depart.min_salary, depart.max_salary, depart.director_id FROM DEPART WHERE 1500 BETWEEN 
  DEPART.MIN_SALARY AND DEPART.MAX_SALARY)
    ON (deprt = contr.depart_id);

SELECT * FROM
  CONTR LEFT OUTER JOIN PERS ON (CONTR.PERS_ID = PERS.PERS_ID),
    (SELECT depart.depart_id AS deprt, depart.parent_id, depart.name, depart.min_salary, depart.max_salary, depart.director_id FROM DEPART
    WHERE 1500 BETWEEN DEPART.MIN_SALARY AND DEPART.MAX_SALARY)
    WHERE CONTR.DEPART_ID = deprt;
