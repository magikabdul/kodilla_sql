explain select count(*)
	from books;
    
create index bookTitle on books (title);

explain select count(*)
	from readers
    where FIRSTNAME = "John";
    
create index readerJohn on readers (FIRSTNAME, LASTNAME);