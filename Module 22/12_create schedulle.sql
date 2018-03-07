use kodilla_course; describe events;

create event UPDATE_VIPS
	on schedule every 1 minute
    do call UpdateVipLevels();
    
show processlist;
show events;
drop event if exists UPDATE_BESTSELLERS;
drop event if exists UPDATE_VIPS;

select event_definition from kodilla_course.events;
show create event UPDATE_BESTSELLERS;

update readers
	set vip_level = "not set"
    where READER_ID in (1,2,3,4,5);
commit;