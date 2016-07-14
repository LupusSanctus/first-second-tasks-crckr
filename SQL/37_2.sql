/* There are no departments where num of employees is more than 20, test num is 10 */
SELECT p.depart_id AS dep, d.depart_id, d.parent_id, d.name, d.min_salary, d.max_salary, p.avg_salary, d.director_id
FROM depart d, 
(SELECT depart_id, SUM(salary), MIN(salary), MAX(salary), ROUND(AVG(salary)) AS avg_salary, COUNT(pers_id)
FROM pers GROUP BY depart_id
HAVING COUNT(pers_id) > 20) p 
WHERE d.depart_id = p.depart_id AND NOT
p.avg_salary BETWEEN d.min_salary AND d.max_salary