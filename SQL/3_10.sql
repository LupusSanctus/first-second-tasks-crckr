DECLARE
    SEQ_PERS_ID number;
BEGIN
  SELECT MAX(pers_id) INTO SEQ_PERS_ID FROM pers;

    UPDATE pers a SET (firstname, middlename) =
        (
         SELECT CONCAT(a.firstname, d.director_id), CONCAT(a.middlename, d.director_id) FROM depart d 
            WHERE a.depart_id = d.depart_id
        )
    WHERE a.pers_id > SEQ_PERS_ID AND
                      salary > 1000;
END;
/
