use classicmodels;
show tables ;

select status from classicmodels.orders
group by status
order by status;

select orders.status, sum(orderdetails.quantityOrdered * orderdetails.priceEach) as amount
from classicmodels.orders
         inner join classicmodels.orderdetails on orders.ordernumber = orderdetails.ordernumber
group by status
order by status;