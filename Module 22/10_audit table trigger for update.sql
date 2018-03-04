delimiter $$

create trigger RENTS_UPDATE after update on RENTS
for each row
begin
	insert into rents_aud (EVENT_DATA, EVENT_TYPE, RENT_ID, NEW_BOOK_ID, NEW_READER_ID, NEW_RENT_DATE, NEW_RETURN_DATE, 
							OLD_BOOK_ID, OLD_READER_ID, OLD_RENT_DATE, OLD_RETURN_DATE)
		values(curtime(), "UPDATE", OLD.RENT_ID, NEW.BOOK_ID, NEW.READER_ID, NEW.RENT_DATE, NEW.RETURN_DATE,
					OLD.BOOK_ID, OLD.READER_ID, OLD.RENT_DATE, OLD.RETURN_DATE);
end$$

delimiter ;

update rents set RETURN_DATE = curdate()
	where RENT_ID = 6;

commit;