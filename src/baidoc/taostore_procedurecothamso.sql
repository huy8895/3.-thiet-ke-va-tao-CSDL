show databases ;
use 4_baitapluyentap;

create table sumOfAll(
    amount int
);

insert into sumOfAll values
(100),
(300),
(200),
(450),
(500);

select * from sumOfAll;

delimiter //
create procedure sp_checkvl(in vl1 int , out vl2 int)
begin
    set vl2 = (select amount from sumOfAll where amount = vl1);
end //
delimiter ;

call sp_checkvl(50,@haha);

select @haha;