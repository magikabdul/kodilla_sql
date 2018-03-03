drop function if exists showReaders;

delimiter $$

create function showReaders(findid int) returns varchar(255) deterministic

begin
	declare result varchar(255) default 'Wrong id were used';
    
    if findid > 0 then
		#set result = (concat( (select firstname from readers where reader_id = findid), ' ', (select lastname from readers where reader_id = findid)));
        set result = (select concat(firstname, ' ', lastname) as name from readers where reader_id = findid);
    end if;
    
    
    return result;
end $$

delimiter ;

select showReaders(3) as reader;