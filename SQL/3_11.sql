DELETE FROM pers p WHERE p.pers_id = (SELECT MAX(pers_id) FROM pers)
