drop procedure if exists UpdateVipLevels;

delimiter $$

create procedure UpdateVipLevels()
begin

	declare booksread, days, rdr_id int;
    declare bookpermonth decimal(5, 2); #wartosc piecio liczbowa z czego 2 liczby sa po przecinku
    declare finished int default 0;
    
    declare all_readers cursor for select READER_ID from readers;
    declare continue handler for not found set finished = 1;
    
    open all_readers;
    
    while(finished = 0) do
		fetch all_readers into rdr_id;
        
        if(finished = 0) then
			#ilosc ksiazek przeczytanych przez czytelnika
			select count(*) from rents
				where READER_ID = rdr_id
			into booksread;
            
			#okres od ilu dni czytelnik wypozycza ksiazki
			select datediff(max(RENT_DATE), min(RENT_DATE)) + 1 from rents
				where READER_ID = rdr_id
			into days;
			
            #srednia miesieczna ilosc wypozyczen czytlnika z id 3
            set bookpermonth = booksread / days * 30;
            update readers set vip_level = VipLevel(bookpermonth)
				where READER_ID = rdr_id;
                
			commit;
		end if;
	end while;
    
    close all_readers;
        
	#select booksread, days, bookpermonth;
end$$

delimiter ;

call UpdateVipLevels();