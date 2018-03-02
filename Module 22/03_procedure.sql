drop procedure if exists ListBooks;

delimiter $$
create procedure ListBooks()
begin
	select book_id, title, pubyear from books;
end $$
delimiter ;

call ListBooks();