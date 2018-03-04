create table BOOKS_AUD (
	EVENT_ID int(11) not null auto_increment,
    EVENT_DATA datetime not null,
    EVENT_TYPE varchar(20) not null,
    BOOK_ID int(11) not null,
    NEW_TITLE varchar(255),
    OLD_TITLE varchar(255),
    NEW_PUBYEAR int(4),
    OLD_PUBYEAR int(4),
    NEW_BESTSELLER boolean,
    OLD_BESTSELLER boolean,
    primary key(EVENT_ID)
);

create table READERS_AUD (
	EVENT_ID int(11) not null auto_increment,
    EVENT_DATA datetime not null,
    EVENT_TYPE varchar(20) not null,
    READER_ID int(11) not null,
    NEW_FIRSTNAME varchar(255),
    OLD_FIRSTNAME varchar(255),
    NEW_LASTNAME varchar(255),
    OLD_LASTNAME varchar(255),
    NEW_PESELID varchar(11),
    OLD_PESELID varchar(11),
    NEW_VIP_LEVEL varchar(20),
    OLD_VIP_LEVEL varchar(20),
    primary key(EVENT_ID)
);

delimiter $$
create trigger BOOKS_INSERT after insert on BOOKS
for each row
begin
	insert into books_aud (EVENT_DATA, EVENT_TYPE, BOOK_ID, NEW_TITLE, NEW_PUBYEAR, NEW_BESTSELLER)
		values(curdate(), "INSERT", NEW.RENT.ID, NEW.title, NEW.pubyear, NEW.bestseller);

end$$
delimiter ;

delimiter $$
create trigger BOOKS_DELETE after delete on BOOKS
for each row
begin
	insert into books_aud (EVENT_DATA, EVENT_TYPE, BOOK_ID, OLD_TITLE, OLD_PUBYEAR, OLD_BESTSELLER)
		values(curdate(), "DELETE", OLD.book_id, OLD.title, OLD.pubyear, OLD.bestseller);

end$$
delimiter ;

delimiter $$
create trigger BOOKS_UPDATE after update on BOOKS
for each row
begin
	insert into books_aud (EVENT_DATA, EVENT_TYPE, BOOK_ID, NEW_TITLE, NEW_PUBYEAR, NEW_BESTSELLER,
							OLD_TITLE, OLD_PUBYEAR, OLD_BESTSELLER)
		values (curdate(), "UPDATE", NEW.book_id, NEW.title, NEW.pubyear, NEW.bestseller,
									OLD.title, OLD.pubyear, OLD.bestseller);

end$$
delimiter ;




delimiter $$
create trigger READERS_INSERT after insert on READERS
for each row
begin
	insert into rents_aud (EVENT_DATA, EVENT_TYPE, READER_ID, NEW_FIRSTNAME, NEW_LASTNAME, NEW_PESELID, NEW_VIP_LEVEL)
		values (curdate(), "INSERT", NEW.READER_ID, NEW.FIRSTNAME, NEW.LASTNAME, NEW.PESELID, NEW.vip_level);

end$$
delimiter ;

delimiter $$
create trigger READERS_DELETE after delete on READERS
for each row
begin
	insert into readers_aud (EVENT_DATA, EVENT_TYPE, OLD_READER_ID, OLD_FIRSTNAME, OLD_LASTNAME, OLD_PESELID, OLD_vip_level)
		values(curdate(), "DELETE", OLD.READER_ID, OLD.FIRSTNAME, OLD.LASTNAME, OLD.PESELID, OLD.vip_level);
end$$
delimiter ;

delimiter $$
create trigger READERS_UPDATE after update on READERS
for each row
begin
	insert into readers_aud (EVENT_DATA, EVENT_TYPE, READER_ID, NEW_FIRSTNAME, NEW_LASTNAME, NEW_PESELID, NEW_VIP_LEVEL, 
																OLD_FIRSTNAME, OLD_LASTNAME, OLD_PESELID, OLD_VIP_LEVEL)
		values (curdate(), "UPDATE", NEW.READER_ID, NEW.FIRSTNAME, NEW.LASTNAME, NEW.PESELID, NEW.vip_level,
			OLD.FIRSTNAME, OLD.LASTNAME, OLD.PESELID, OLD.vip_level);

end$$
delimiter ;