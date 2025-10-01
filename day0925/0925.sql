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
    
    
select shipperid, COUNT(employeeid)
from ORDERS    
group by shipperid
having count(employeeid)>0;


delete "ADMIN"."ISEQ$$_115312".nextval;


ID	NUMBER(10,0)	No	"ADMIN"."ISEQ$$_115312".nextval	1	
AUTH	VARCHAR2(255 CHAR)	No		2	
PASSWORD	VARCHAR2(255 CHAR)	No		3	
USER_ID	VARCHAR2(255 CHAR)	No		4	
USER_NAME	VARCHAR2(255 CHAR)	No		5	

CREATE TABLE api_users (
    id NUMBER(10,0),          -- 숫자 타입, 총 10자리, 소수점 이하 0자리
    user_id VARCHAR2(50),     -- 가변 문자열, 최대 50바이트
    user_name VARCHAR2(50),   -- 가변 문자열, 최대 50바이트 (여기 쉼표 추가!)
    auth VARCHAR2(10),        -- 가변 문자열, 최대 10바이트 (예: 'ROLE_USER', 'ROLE_ADMIN' 등)
    password VARCHAR2(255)    -- 가변 문자열, 최대 255바이트 (보통 암호화된 비밀번호 저장)
);

CREATE TABLE app_users (
    id NUMBER(10,0),          -- 숫자 타입, 총 10자리, 소수점 이하 0자리
    user_id VARCHAR2(50),     -- 가변 문자열, 최대 50바이트
    user_name VARCHAR2(50),   -- 가변 문자열, 최대 50바이트 (여기 쉼표 추가!)
    auth VARCHAR2(10),        -- 가변 문자열, 최대 10바이트 (예: 'ROLE_USER', 'ROLE_ADMIN' 등)
    password VARCHAR2(255)    -- 가변 문자열, 최대 255바이트 (보통 암호화된 비밀번호 저장)
);

drop table tb_user;
drop table users;

drop table api_user;

commit;

delete from app_users;

select * from api_users;

select * from app_users;



CREATE SEQUENCE seq_api_users_id
    START WITH 1       -- 시작값
    INCREMENT BY 1     -- 증가값
    MINVALUE 1         -- 최소값
    MAXVALUE 9999999999   -- 최대값
    NOCYCLE            -- 최대값 도달 시 다시 시작할지 여부
    NOCACHE            -- 캐시 사용 여부
    NOORDER;           -- 요청 순서대로 값 생성 여부