explain select count(*)
	from phones
    where PHONENUM between 1 and 100000;
    
create index phoneno on phones(phonenum);