create table books (
	book_id int(11) not null auto_increment,
    title varchar(255) not null,
    pubyear int(4) not null,
    primary key (book_id)
);

create table `readers` (
	`READER_ID` int(11) not null auto_increment,
    `FIRSTNAME` varchar(255) not null,
    `LASTNAME` varchar(255) not null,
    `PESELID` varchar(11) not null,
    primary key (`READER_ID`)
);

create table RENTS (
	RENT_ID int(11) not null auto_increment,
    BOOK_ID int(11) not null,
    READER_ID int(11) not null,
    RENT_DATE datetime not null,
    RETURN_DATE datetime,
    primary key (RENT_ID),
    foreign key (BOOK_ID) references books(book_id),
    foreign key (READER_ID) references readers(reader_id)
);