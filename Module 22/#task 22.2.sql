#add new columnt to table books
alter table books add bestseller boolean;

drop procedure if exists UpdateBestsellers;

delimiter $$

create procedure UpdateBestsellers()
begin
	
    declare b_id, numberofrents int;
    declare isBestseller boolean;
    
    declare finished int default 0;
    
    declare all_books cursor for select book_id from books;
    declare continue handler for not found set finished = 1;
    
    open all_books;
    
    while (finished = 0) do
		
        fetch all_books into b_id;
        
        if(finished = 0) then
			select count(*) from rents
				where book_id = b_id and datediff(curdate(), RENT_DATE) < 30 
			into numberofrents;
            
            if (numberofrents > 2) then
				set isBestseller = true;
			else
				set isBestseller = false;
			end if;
            
            update books set bestseller = isBestseller
					where book_id = b_id;
            
            commit;
		end if;
	end while;
    
    close all_books;
    
end$$

delimiter ;

call UpdateBestsellers();