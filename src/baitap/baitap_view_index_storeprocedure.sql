create database demo;
use demo;
create table products(
    id int ,
    Code varchar(15),
    Name varchar(15),
    Price float,
    amount int,
    description nvarchar(50),
    status bit
);

truncate table products;

insert into products values
    (1,'A1','phone1',1000,100,null,1),
    (2,'A2','phone2',2000,100,null,0),
    (3,'A3','phone3',4000,100,null,1),
    (4,'A4','phone4',5000,100,null,0),
    (5,'A5','phone5',3000,100,null,1);

alter table products
add constraint unique unique_index_code (Code);

alter table products
add constraint unique composite_index (Name,Price);

drop index composite_index on products;
drop index unique_index_code on products;

create index unique_index_code on products (Code);
create index composite_index on products (Name,Price);

alter table products add index composite_index (Name,Price);
alter table products add index unique_index_code (Code);

explain select * from products where Code = 'A1';

select * from products;

delete from products
where Code = 'A2';

commit ;
rollback ;
savepoint sv1;

rollback to sv1;
release savepoint sv1;

create view view_products as
    select Code,Name,Price
from products;

select * from view_products;

alter view view_products as
    select * from products;

drop view view_products;

insert into products (description) values ('phone 1');
insert into products (description) values ('phone 2');
insert into products (description) values ('phone 3');

delete from products
    where description = 'phone 1' or
          description = 'phone 2' or
          description = 'phone 3';

delimiter //
create procedure get_infoProduct ()
begin
    select description from products;
end //

call get_infoProduct();

update products
set description = 'this is phone 3'
where Code = 'A3';

delimiter //
create procedure edit_byID(in id_in int,in name_in varchar(15))
begin
    update products set Name = name_in
    where id = id_in;
end //
delimiter ;

select * from products;

call edit_byID(3,'phone 3 edited');

delimiter //
create procedure remove_byID(in id_in int)
begin
    delete from products
        where id = id_in;
end //
delimiter ;

call remove_byID(4);
