SELECT * FROM (SELECT * FROM depart
WHERE 1000 IN (MIN_SALARY, MAX_SALARY))
WHERE NAME='Офис'
