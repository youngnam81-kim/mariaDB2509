Customers;
Categories;
Employees;
OrderDetails;
Orders;
Products;
Shippers;
Suppliers;

drop table Customers;
drop table Categories;
drop table Employees;
drop table OrderDetails;
drop table Orders;
drop table Products;
drop table Shippers;
drop table Suppliers;

select count(*) from Customers;
select count(*) from Categories;
select count(*) from Employees;
select count(*) from OrderDetails;
select count(*) from Orders;
select count(*) from Products;
select count(*) from Shippers;
select count(*) from Suppliers;


SELECT * FROM Customers
OFFSET (SELECT COUNT(*) - 12 FROM Customers) ROWS
FETCH NEXT 12 ROWS ONLY;

select count(*) from Customers;

FETCH FIRST 10 ROWS ONLY; 

where rownum <10;


WHERE Country='Mexico';


SELECT NAME FROM v$database;
SELECT instance FROM v$thread;


select * from customers;

SELECT COUNT( distinct Country) FROM Customers;

describe customers;

desc customers;

SELECT MAX(Price), supplierid
FROM Products
group by price,supplierid;

select * FROM Products limit 4;

select max(customerid)+1 from customers;


select * from customers
where customername like '_r%';

SELECT * FROM table;

select * from PRODUCTS
where productname not between 'Carnarvon Tigers'  and 'Mozzarella di Giovanni'
order by productname;

desc orders;

SELECT concat_ws(',' ,customerid, employeeid, orderdate) FROM orders
where orderdate between '98/04/20' and '98/04/24';

desc customers;
desc orders;


SELECT 
    c.CUSTOMERID, 
    c.CUSTOMERNAME,
    o.ORDERID, 
    o.ORDERDATE,
    e.FirstName, -- 직원의 이름도 함께 조회하고 싶으시다면 추가할 수 있습니다.
    e.LastName   -- 직원의 성도 함께 조회하고 싶으시다면 추가할 수 있습니다.
FROM 
    orders o
JOIN 
    customers c ON o.CUSTOMERID = c.CUSTOMERID -- 첫 번째 조인
JOIN 
    Employees e ON o.EMPLOYEEID = e.EMPLOYEEID; -- 두 번째 조인