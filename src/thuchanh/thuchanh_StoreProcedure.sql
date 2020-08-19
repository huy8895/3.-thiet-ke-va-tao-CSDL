use classicmodels;

delimiter //
create procedure findAllCustomers()
begin
    select * from customers;
end //

call findAllCustomers();

drop procedure findAllCustomers;

delimiter //
create procedure findAllCustomers()
begin
    select * from customers
        where customerNumber = 175;
end //

call findAllCustomers();