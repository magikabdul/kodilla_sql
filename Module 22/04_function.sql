drop function if exists VipLevel;

delimiter $$

create function VipLevel() returns varchar(20) deterministic
begin
	return 'Standard customer';
end $$

delimiter ;

select VipLevel() as level;