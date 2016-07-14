SELECT * 
FROM contr c, pers p 
WHERE p.pers_id = c.pers_id
AND (1 IN (SELECT depart.parent_id FROM contr, depart WHERE contr.depart_id = depart.depart_id) 
OR 1 IN (c.depart_id));
