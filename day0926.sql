select * from orderdetails;

select * 
from products
where productid in (
select productid from orderdetails
where quantity=10
)
;

select nvl(postalcode, 500) as "postalcode" , CUSTOMERS.* from CUSTOMERS
where postalcode is null;

select length(password) from app_users;

pjt_user (
id,
user_id	varchar2(20),
user_name varchar2(50),
email	varchar2(100),
phone	varchar2(20),
auth	varchar2(10),
password varchar2(100),
agreement boolean,
reg_date date,
update_date date,
end_date date
);

CREATE TABLE "ADMIN"."API_USERS" 
   (	"ID" NUMBER(10,0) DEFAULT "ADMIN"."SEQ_API_USERS_ID"."NEXTVAL", 
	"USER_ID" VARCHAR2(50 ) COLLATE "USING_NLS_COMP", 
	"USER_NAME" VARCHAR2(50 ) COLLATE "USING_NLS_COMP", 
	"AUTH" VARCHAR2(10 ) COLLATE "USING_NLS_COMP" DEFAULT USER, 
	"PASSWORD" VARCHAR2(100 ) COLLATE "USING_NLS_COMP"
   );
   
   
   
   
   

   
   select * from app_users;
   
create table admin.API_USERS (
    "ID" number(10,0) generated always as identity (start with 1 increment by 1) primary key, -- Oracle 12c 이상 권장
    "USER_ID" varchar2(20) not null,
    "USER_NAME" varchar2(50) not null,
    "EMAIL" varchar2(100),
    "PHONE" varchar2(20),
    "AUTH" varchar2(10) default 'USER' not null,
    "PASSWORD" varchar2(100) not null,
    "AGREEMENT" varchar2(1) default 'N' not null, 
    "REG_DATE" date default SYSDATE not null,
    "UPDATE_DATE" date default SYSDATE,
    "END_DATE" date
);

INSERT INTO ADMIN.APP_USERS (USER_ID,USER_NAME,AUTH,PASSWORD,REG_DATE,AGREEMENT)
SELECT USER_ID,USER_NAME,AUTH,PASSWORD,SYSDATE AS REG_DATE,'Y' FROM ADMIN.PJT_USERS;
