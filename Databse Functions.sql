select * from customers;
select * from employees;
select * from orders;
select * from payments;
select * from productlines;
select * from customers where customerName like 'A%';
select * from customers where customerName like '%d';
select * from customers where customerName like '%A%';
select customerNumber,count(orderNumber) Orders from orders group by customerNumber order by Orders desc limit 5;
select customers.customerNumber,customerName,count(amount) Amount from customers inner join payments on 
customers.customerNumber = payments.customerNumber group by customerNumber order by Amount desc;
select customers.customerNumber,customerName,country,amount as Amount from customers inner join payments on 
customers.customerNumber = payments.customerNumber where Amount between 6000 and 8000;