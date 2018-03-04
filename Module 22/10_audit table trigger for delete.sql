delimiter $$

create trigger RENTS_DELETE after delete on RENTS
for each row
begin
	insert into rents_aud (EVENT_DATA, EVENT_TYPE, RENT_ID)
		values(curtime(), "DELETE", OLD.RENT_ID);
end$$

delimiter ;

delete from rents where RENT_ID = 8;
commit;