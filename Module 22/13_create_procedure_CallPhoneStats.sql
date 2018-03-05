drop procedure if exists CalcPhoneStats;

delimiter $$

create procedure CalcPhoneStats()
begin
	declare K int(11) default 0;
    declare qty int(11);
    delete from phonestats;
    commit;
    
    while (K < 100000000) do
		select count(*) from phones where PHONENUM between K-99999 and K
			into qty;
            
		insert into phonestats (RANGE_FROM, RANGE_TO, QUANTITY)
			values(K-99999, K, qty);
            
		commit;
        set k = k + 100000;
	end while;
        
end $$

delimiter ;