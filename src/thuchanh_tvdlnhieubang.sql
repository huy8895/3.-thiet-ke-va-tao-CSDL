show databases ;
use classicmodels;

select customers.customerNumber,customerName,phone,paymentDate,amount
from customers
inner join payments p on customers.customerNumber = p.customerNumber
where city = 'Las Vegas';

