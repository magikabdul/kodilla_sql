create table RENTS_AUD (
	EVENT_ID int(11) not null auto_increment,
    EVENT_DATA datetime not null,
    EVENT_TYPE varchar(10) default null,
    RENT_ID int(11) not null,
    OLD_BOOK_ID int(11),
    NEW_BOOK_ID int(11),
    OLD_READER_ID int(11),
    NEW_READER_ID int(11),
    OLD_RENT_DATE datetime,
    NEW_RENT_DATE datetime,
    OLD_RETURN_DATE datetime,
    NEW_RETURN_DATE datetime,
    primary key (EVENT_ID)
);