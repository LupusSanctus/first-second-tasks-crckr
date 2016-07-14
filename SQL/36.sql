SELECT * FROM contr ORDER BY depart_id, amount DESC

SELECT contr_id, contr_num, client_id, depart_id, pers_id, beg_date, end_date, amount, (end_date - beg_date) AS dif
FROM contr
ORDER BY dif