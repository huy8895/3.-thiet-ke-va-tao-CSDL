show databases ;
use classicmodels;

select customers.customerNumber,customerName,phone,paymentDate,amount
from customers
inner join payments p on customers.customerNumber = p.customerNumber
where city = 'Las Vegas';

select customers.customerName,customers.customerNumber,orders.orderNumber,status
from customers
left join orders
on customers.customerNumber = orders.customerNumber;

select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers
    LEFT JOIN orders
        on customers.customerNumber = orders.customerNumber
where orderNumber is null;