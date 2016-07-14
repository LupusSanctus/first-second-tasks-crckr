/* The first variant */
declare
   beginWith number;
begin
  select MAX(pers_id) + 1 into beginWith from pers;
  IF beginWith > 0 THEN
     BEGIN
        execute immediate 'DROP SEQUENCE pers_seq$pers_id';
        exception when others then
        null;
     end;
    execute immediate 'CREATE SEQUENCE pers_seq$pers_id INCREMENT BY 1 START WITH ' || beginWith || '';
  end if;
end;

/* The second variant */
SELECT MAX(pers_id) FROM pers;

CREATE SEQUENCE pers_seq$pers_id 
START WITH 107
INCREMENT BY 1;
