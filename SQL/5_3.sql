SELECT * 
FROM contr c JOIN pers p ON c.pers_id = p.pers_id
WHERE c.depart_id <> p.depart_id
AND p.depart_id IN (SELECT depart_id FROM depart START WITH  depart_id = c.depart_id CONNECT BY PRIOR depart_id = parent_id) 
