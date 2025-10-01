
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

SELECT count(*) FROM orders;
SELECT * FROM orders
where customerid='14';

SELECT count(*) FROM customers;
SELECT * FROM customers;

--select count(*) from (
SELECT 
    O.orderid, 
    OD.orderdetailid,
    P.productid,
    p.PRODUCTNAME,
    C.customerid, 
    C.customername,
    O.orderdate,
    E.EMPLOYEEID,
    E.firstname, -- 직원의 이름도 함께 조회하고 싶으시다면 추가할 수 있습니다.
    E.lastname   -- 직원의 성도 함께 조회하고 싶으시다면 추가할 수 있습니다.
FROM 
    orders O
LEFT JOIN 
    customers C ON O.customerid = C.customerid -- 첫 번째 조인
LEFT JOIN 
    employees E ON O.employeeid = E.employeeid -- 두 번째 조인
LEFT JOIN 
    orderdetails od ON O.orderid = od.orderid
LEFT JOIN
    products P ON od.productid = P.productid
WHERE C.customername='Chop-suey Chinese'
    ;
--);    


select * from orders;
where customerid not in ( select customerid from customers );

select * from customers
where customerid not in ( select customerid from orders );

SELECT distinct 
    O.orderid, 
    C.customerid, 
    C.customername,
    O.orderdate,
    E.EMPLOYEEID,
    E.firstname, 
    E.lastname   
FROM 
    orders O
LEFT JOIN 
    customers C ON O.customerid = C.customerid -- 첫 번째 조인
LEFT JOIN 
    employees E ON O.employeeid = E.employeeid -- 두 번째 조인
LEFT JOIN 
    orderdetails od ON O.orderid = od.orderid
LEFT JOIN
    products P ON od.productid = P.productid
WHERE C.customername='Chop-suey Chinese'
    ;


--select count(*) 
select *
from orders o
full outer join customers e on o.customerid = e.customerid
--where e.customerid=22
where o.orderid is null
;



select * from customers
where customerid not in ( select customerid from orders );


select count (*) from (
select customerid from customers
union
select customerid from orders
);

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;


SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

select * from (
SELECT A.CustomerName AS CustomerName1, nvl(B.CustomerName,'NULL') AS CustomerName2, A.City
from Customers A
left join Customers B on  A.CustomerID <> B.CustomerID AND A.City = B.City
ORDER BY A.City
);

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;



select customerid from customers
minus
select customerid from orders;

select count (*) from (
select customerid from customers
union
select customerid from orders
);

SELECT e1.emp_no 
FROM employees e1
LEFT JOIN (SELECT emp_no FROM employees WHERE emp_no=10001) e2 
ON e1.emp_no = e2.emp_no
WHERE e2.emp_no IS NULL;

select customerid from customers
minus
select customerid from orders;

SELECT e1.customerid ,e2.customerid 
FROM customers e1
LEFT outer JOIN (select customerid from orders) e2 
ON e1.customerid = e2.customerid
--WHERE e2.customerid IS NULL
;


