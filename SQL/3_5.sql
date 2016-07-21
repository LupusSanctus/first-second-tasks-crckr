SELECT * FROM contr c WHERE pers_id IN (SELECT pers_id FROM pers WHERE salary < 1000) AND
    EXISTS (SELECT pers_id FROM pers p, depart d WHERE p.depart_id = d.depart_id AND
            p.pers_id = c.pers_id AND 
            d.depart_id = 4);