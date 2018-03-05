drop procedure if exists FillTestData;

delimiter $$

create procedure FillTestData()

begin
	declare K int default 0;
    while (K < 100000) do
		insert into phones (PHONENUM, FIRSTNAME, LASTNAME)
			values(round(rand()*1000000000), concat('Firstname number ', K), concat('Lastname number ', K));
            
		if (mod(K, 5000) = 0) then
			commit;
		end if;
        
        set K = K + 1;
	end while;
    commit;
end $$

delimiter ;