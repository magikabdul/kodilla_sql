set @rentsqty = 0;

delimiter $$

create trigger rentscounter before insert on rents
for each row
begin
	set @rentsqty = @rentsqty + 1;
end$$


delimiter ;