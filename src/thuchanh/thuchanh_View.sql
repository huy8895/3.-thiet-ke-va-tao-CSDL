use classicmodels;

create view cus_view as
    select customerNumber,customerName,phone
    from customers;

select * from cus_view;

replace cus_view
    select customerNumber,customerName,phone
    from customers
where city = 'nantes';

alter view cus_view as
    select customerNumber,customerName,phone
    from customers
    where city = 'nantes';



