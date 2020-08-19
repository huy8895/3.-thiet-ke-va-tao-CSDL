use StudentTest;

delimiter //
create procedure allrecords()
begin
select * from StudentTest;
end;

call allrecords();

