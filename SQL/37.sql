/* There are no departments where num of employees is more than 20, test num is 10 */
SELECT DEPART_ID, SUM(SALARY), MIN(SALARY), MAX(SALARY), ROUND(AVG(SALARY)), COUNT(PERS_ID)
FROM PERS GROUP BY(DEPART_ID) HAVING COUNT(PERS_ID) > 20