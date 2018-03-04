USE kodilla_course;

create table STATS(
	STAT_ID int(11) not null auto_increment,
    STAT_DATE datetime not null,
    STAT varchar(20) not null,
    VALUE int(11) not null,
    primary key (STAT_ID)
);

create view BESTSELLERS_COUNT as
select count(*) BESTSELLERS from books
	where bestseller = true;
    
create event UPDATE_BESTSELLERS
	on schedule every 1 day
    do 
		call UpdateBestsellers();
		insert into stats (STAT_DATE, STAT, VALUE)
			select (curdate(), "BESTSELLERS", BESTSELLERS) from bestsellers_count;