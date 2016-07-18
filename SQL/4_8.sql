
/* 4_8 */
CREATE OR REPLACE VIEW contr_v AS
SELECT contr.end_date
FROM CONTR
WHERE contr.end_date IS NULL
