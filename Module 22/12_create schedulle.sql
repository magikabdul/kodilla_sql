use kodilla_course;

create event UPDATE_VIPS
	on schedule every 1 minute
    do call UpdateVipLevels();
    
show processlist;

update readers
	set vip_level = "not set"
    where READER_ID in (1,2,3,4,5);
commit;