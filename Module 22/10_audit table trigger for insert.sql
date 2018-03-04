delimiter $$

create trigger RENTS_INSERT after insert on RENTS
for each row
begin
	insert into rents_aud (EVENT_DATA, EVENT_TYPE, RENT_ID, NEW_BOOK_ID, NEW_READER_ID, NEW_RENT_DATE, NEW_RETURN_DATE)
		values(curtime(), "INSERT", NEW.RENT_ID, NEW.BOOK_ID, NEW.READER_ID, NEW.RENT_DATE, NEW.RETURN_DATE);
end$$

delimiter ;

insert into rents (BOOK_ID, READER_ID, RENT_DATE, RETURN_DATE)
	values (2, 4, curdate() - 3, null);