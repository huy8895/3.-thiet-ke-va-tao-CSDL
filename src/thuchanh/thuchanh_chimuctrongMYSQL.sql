use classicmodels;

select * from customers;

EXPLAIN select * from customers where customerNumber = 175;

alter table customers
add index index_cn (customerNumber);

alter table customers
drop index index_cn;

