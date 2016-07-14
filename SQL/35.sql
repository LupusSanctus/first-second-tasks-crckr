SELECT * FROM contr WHERE pers_id IN (SELECT pers_id FROM pers WHERE salary < 1000) AND 
EXISTS (SELECT pers_id FROM pers, depart WHERE depart.name = 'Отдел логистики');