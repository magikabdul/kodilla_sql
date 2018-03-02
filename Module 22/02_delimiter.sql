//Aby napisać własną procedurę, musisz najpierw poznać polecenie DELIMITER - pozwala ono na ustawienie, innego niż średnik, znacznika końca polecenia.

delimiter $$

create procedure ListBooks()
begin
	select * from BOOKS;
end $$

delimiter ;