create view BOOKS_AND_READERS AS
select RD.READER_ID, RD.FIRSTNAME, RD.LASTNAME, BK.title, RT.RENT_DATE, RT.RETURN_DATE
from readers RD, books BK, rents RT
where RT.book_id = BK.BOOK_ID
and RT.READER_ID = RD.READER_ID
order by RT.RENT_DATE;

select * from books_and_readers
	where RENT_DATE >= curdate() - 5;
    
show processlist;

set global event_scheduler=on;