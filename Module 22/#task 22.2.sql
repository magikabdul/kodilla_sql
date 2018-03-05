#add new columnt to table books
alter table books add bestseller boolean;

drop procedure if exists UpdateBestsellers;

delimiter $$

create procedure UpdateBestsellers()
begin
	
    declare b_id int;
    
    declare rentTimeInDays int;
    declare rentTimeInMonths decimal(5, 2);
    declare totalNumberOfRents int;
    declare monthlyNumberOfRents decimal(5, 2);
    
    declare isBestseller boolean;
    
    declare finished int default 0;
    
    declare all_books cursor for select book_id from books;
    declare continue handler for not found set finished = 1;
    
    open all_books;
    
    while (finished = 0) do
		
        fetch all_books into b_id;
        
        if(finished = 0) then
			select datediff(max(RENT_DATE), min(RENT_DATE))
				from rents
                where book_id = b_id
					into rentTimeInDays;
                    
			set rentTimeInMonths = rentTimeInDays / 30;
            
            select count(*)
				from rents
                where book_id = b_id 
			into totalNumberOfRents;
            
            set monthlyNumberOfRents = totalNumberOfRents /rentTimeInMonths;
            
            set isBestseller = (monthlyNumberOfRents > 2);
            
            update books set bestseller = isBestseller
					where book_id = b_id;
            
            commit;
		end if;
        
	end while;
    
    close all_books;
    
end$$

delimiter ;

call UpdateBestsellers();