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


delimiter $$    
create event UPDATE_BESTSELLERS
	on schedule every 1 minute
    do 
		begin
        declare qty int default 0;
        
        select BESTSELLERS from bestsellers_count
			into qty;
        
		call UpdateBestsellers();
		insert into stats (STAT_DATE, STAT, VALUE)
			values (curdate(), "BESTSELLERS", qty);
		end$$
delimiter ;