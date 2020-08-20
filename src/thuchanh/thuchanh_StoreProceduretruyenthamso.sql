use classicmodels;

delimiter //
create procedure getCusByID (in vl1 int(11))
begin
    select * from customers
        where customerNumber = vl1;
end //

call getCusByID(175);

delimiter //
create procedure getCusByCity
    (in cityIn varchar(50),out total int)
    begin
        select count(*)
        into total
        from customers
            where cityIn = cityIn;
    end //
    delimiter ;

    drop procedure getCusByCity;

call getCusByCity('lyon',@total);
select @total;

#tham so loai INOUT

delimiter //
create procedure setCounter(inout couter int,
                            in inc int)
begin
    set couter = couter + inc;
end //
delimiter ;

set @couter = 1;

call setCounter(@couter,1);
select @couter;