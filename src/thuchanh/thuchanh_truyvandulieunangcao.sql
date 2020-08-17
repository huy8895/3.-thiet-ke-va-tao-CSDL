show databases ;
use classicmodels;
show tables ;
select productCode,productName,buyPrice,quantityInStock
from products
where buyPrice > 56.76 and quantityInStock > 10;

select productCode,productName,buyPrice,textDescription
from products
inner join productlines p
    on products.productLine = p.productLine
where buyPrice> 56.76 and buyPrice < 95.59;

select productCode,productName,buyPrice,quantityInStock,productVendor
from products
where productLine = 'classic Cars' or productVendor = 'Min Lin Diecast';