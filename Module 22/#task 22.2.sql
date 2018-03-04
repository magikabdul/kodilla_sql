#add new columnt to table books
alter table books add bestseller boolean;

drop procedure if exists UpdateBestsellers;

delimiter $$

create procedure UpdateBestsellers()
begin
	
    declare b_id, numberofrents int;
    
    declare finished int default 0;
    
    declare all_books cursor for select book_id from books;
    declare continue handler for not found set finished = 1;
    
    open all_books;
    
    while (finished = 0) do
		
        fetch all_books into b_id;
        
        if(finished = 0) then
			select count(*) from rents
				where book_id = b_id
			into numberofrents;
            
            if (numberofrents > 2) then
				update books set bestseller = true
					where book_id = b_id;
			else
				update books set bestseller = false
					where book_id = b_id;
			end if;
            
            commit;
		end if;
	end while;
    
    close all_books;
    
end$$

delimiter ;

call UpdateBestsellers();