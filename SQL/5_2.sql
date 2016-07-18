--1
SELECT * 
FROM pers 
WHERE depart_id IN (SELECT depart_id FROM depart START WITH  depart_id = (select depart_id FROM depart WHERE name like 'Отдел логистики') CONNECT BY PRIOR depart_id = parent_id );

--2
SELECT * 
FROM pers p 
WHERE EXISTS (SELECT depart_id FROM (SELECT depart_id FROM depart  START WITH  depart_id = (select depart_id FROM depart WHERE name like 'Отдел логистики')
CONNECT BY PRIOR depart_id = parent_id )a WHERE a.depart_id = p.depart_id);
