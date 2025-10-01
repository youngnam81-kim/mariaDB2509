select * from orders;

SELECT * FROM persons(id,lastname) values(1,'길동');

CREATE TABLE Employee (
    EmpNo INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(30) NOT NULL UNIQUE,
    Dept VARCHAR(20) NOT NULL,
    HireDate DATE NOT NULL,
    Salary INT CHECK(Salary >= 2000000)
);

use hrdtest;


CREATE TABLE Employee (
    EmpNo INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(30) NOT NULL UNIQUE,
    Dept VARCHAR(20) NOT NULL,
    HireDate DATE NOT NULL,
    Salary INT CHECK(Salary >= 2000000)
);




1. 테이블을 생성하시오. (제약조건 포함)

2. SQL 문을 작성하시오.
(1) 사원 등록: Employee 테이블에 다음 데이터를 삽입하시오.
(홍길동, 영업부, 2020-03-01, 2500000)
(이순신, 인사부, 2019-07-15, 3200000)
(강감찬, 개발부, 2021-01-10, 2800000);
INSERT INTO Employee (EmpName, Dept, HireDate, Salary) 
VALUES ('홍길동', '영업부', '2020-03-01', 2500000);

INSERT INTO Employee (EmpName, Dept, HireDate, Salary) 
VALUES ('이순신', '인사부', '2019-07-15', 3200000);

INSERT INTO Employee (EmpName, Dept, HireDate, Salary) 
VALUES ('강감찬', '개발부', '2021-01-10', 2800000);
(2) 조회:
- 부서가 '개발부'인 사원의 사번, 이름, 급여를 조회하시오.
- 급여가 3,000,000원 이상인 사원의 이름과 부서를 조회하시오.
;
select * from Employee
where dept = '개발부';

select * from Employee
where salary > 3000000;
(3) 수정:
- 이순신의 급여를 3,500,000원으로 수정하시오.
(4) 삭제:
사번이 1번인 사원의 정보를 삭제하시오.
;
update Employee
set salary = 3500000
where empName='이순신';

delete from Employee
where empno='7';



desc Employee;


-- ShopMember(회원관리) 테이블 생성
CREATE TABLE ShopMember (
    CustNo INT PRIMARY KEY AUTO_INCREMENT,
    CustName VARCHAR(30) NOT NULL,
    Phone VARCHAR(13) UNIQUE,
    Address VARCHAR(50),
    JoinDate DATE NOT NULL,
    Grade CHAR(1) CHECK(Grade IN ('A','B','C')),
    City CHAR(2)
);

-- Sale(판매) 테이블 생성
CREATE TABLE Sale (
    SaleNo INT PRIMARY KEY AUTO_INCREMENT,
    CustNo INT,
    PCost INT,
    Amount INT,
    Price INT,
    PCode CHAR(3),
    FOREIGN KEY (CustNo) REFERENCES ShopMember(CustNo)
);


1. 테이블을 생성하시오. (제약조건 포함)
2. SQL 문을 작성하시오.
(1) 회원 등록: ShopMember 테이블에 다음 데이터를 삽입하시오.
('홍길동', '010-1234-5678', '서울시 강남구', '2020-01-01', 'A', '01’)
('이순신', '010-2222-3333', '부산시 해운대구', '2021-03-15', 'B', '02’)
('강감찬', '010-7777-8888', '대구시 달서구', '2019-05-20', 'C', '03')
;

INSERT INTO ShopMember (CustName, Phone, Address, JoinDate, Grade, City) 
VALUES ('홍길동', '010-1234-5678', '서울시 강남구', '2020-01-01', 'A', '01');

INSERT INTO ShopMember (CustName, Phone, Address, JoinDate, Grade, City) 
VALUES ('이순신', '010-2222-3333', '부산시 해운대구', '2021-03-15', 'B', '02');

INSERT INTO ShopMember (CustName, Phone, Address, JoinDate, Grade, City) 
VALUES ('강감찬', '010-7777-8888', '대구시 달서구', '2019-05-20', 'C', '03');

(2) 회원 조회
- 고객등급이 A등급인 회원의 이름, 전화번호, 가입일자를 조회.;
select * from ShopMember
where grade='A';

- 가입일자가 2020년 이후인 회원을 조회하시오.;
select * from (
    select CustName, to_char(joindate,'yyyy') joinyear from ShopMember
) AS subquery where joinyear>2020;
;

(3) 판매 등록: Sale 테이블에 삽입하시오.
(1, 1000, 10, 10000, 'P01’)
(2, 2000, 5, 10000, 'P02’)
(3, 1500, 7, 10500, 'P03')
;
INSERT INTO Sale ( PCost, Amount, Price, PCode)
VALUES (1000, 10, 10000, 'P01');

INSERT INTO Sale ( PCost, Amount, Price, PCode)
VALUES (2000, 5, 10000, 'P02');

INSERT INTO Sale ( PCost, Amount, Price, PCode)
VALUES (1500, 7, 10500, 'P03');

(4) 판매 조회
- 회원별 총 구매금액을 구하시오.
(출력: 회원번호, 회원성명, 총금액)
;

select s.custname, (amount*price) totalprice
from shopmember s
join Sale ss on s.custNo = ss.custNo;

- 가장 구매금액이 높은 회원의 이름과 금액을 조회하시오.
select s.custname, max(amount*price) totalprice
from shopmember s
join Sale ss on s.custNo = ss.custNo;


(5) 데이터 수정 / 삭제
- '이순신' 회원의 등급을 A로 수정하시오.;
update ShopMember
set grade='A'
where custname='이순신'
;
select * from ShopMember;
select * from Sale;

- CustNo = 3 인 회원을 삭제하시오.
delete from ShopMember
where CustNo=3; //삭제가 안됨. 외래키

======================================================================

-- Artist(아티스트) 테이블 생성
CREATE TABLE Artist (
    ArtistNo INT PRIMARY KEY AUTO_INCREMENT,
    ArtistName VARCHAR(30) NOT NULL UNIQUE,
    DebutDate DATE NOT NULL,
    Genre VARCHAR(20) NOT NULL,
    Agency VARCHAR(30)
);

-- Album(앨범) 테이블 생성
CREATE TABLE Album (
    AlbumNo INT PRIMARY KEY AUTO_INCREMENT,
    ArtistNo INT,
    AlbumTitle VARCHAR(50) NOT NULL,
    ReleaseDate DATE NOT NULL,
    Sales INT CHECK(Sales >= 0),
    FOREIGN KEY (ArtistNo) REFERENCES Artist(ArtistNo)
);


2. SQL 문을 작성하시오.

-- (1) 아티스트 등록: Artist 테이블 데이터 삽입
INSERT INTO Artist (ArtistName, DebutDate, Genre, Agency) 
VALUES ('아이유', '2008-09-18', '발라드', 'EDAM엔터테인먼트');

INSERT INTO Artist (ArtistName, DebutDate, Genre, Agency) 
VALUES ('BTS', '2013-06-13', 'K-POP', '하이브');

INSERT INTO Artist (ArtistName, DebutDate, Genre, Agency) 
VALUES ('블랙핑크', '2016-08-08', 'K-POP', 'YG엔터테인먼트');

INSERT INTO Artist (ArtistName, DebutDate, Genre, Agency) 
VALUES ('있찌', '2016-08-08', 'K-POP', 'YG엔터테인먼트');


-- (2) 앨범 등록: Album 테이블 데이터 삽입
INSERT INTO Album (ArtistNo, AlbumTitle, ReleaseDate, Sales) 
VALUES (1, '좋은 날', '2010-12-09', 500000);

INSERT INTO Album (ArtistNo, AlbumTitle, ReleaseDate, Sales) 
VALUES (2, 'MAP OF THE SOUL: 7', '2020-02-21', 4300000);

INSERT INTO Album (ArtistNo, AlbumTitle, ReleaseDate, Sales) 
VALUES (3, 'THE ALBUM', '2020-10-02', 1300000);

INSERT INTO Album (ArtistNo, AlbumTitle, ReleaseDate, Sales) 
VALUES (4, '있지1', '2010-12-09', 50000);

(3) 조회:
- 장르가 'K-POP'인 아티스트의 이름과 소속사를 조회.;
select * from Artist where genre='K-POP';

- 판매량이 1,000,000 이상인 앨범의 제목과 판매량을 조회.;
select * from Album where sales>1000000;

- 아티스트별 총 판매량을 구하시오.
(출력: 아티스트명, 총 판매량);
select a.artistname, sales from Artist a join Album aa on a.artistno=aa.artistno;

(4) 수정:
- '아이유'의 소속사를 '카카오엔터테인먼트'로 수정하시오.;
update Artist
set agency='카카오엔터테인먼트'
where artistname='아이유';

(5) 삭제:
- AlbumNo = 1 인 앨범을 삭제하시오.
delete from Artist
where artistno=(select distinct artistno from Album where albumno='1' );


확장 문제 (심화)
- “소속사별 매출현황”
(소속사, 아티스트 수, 총 판매량)을 조회.;

select agency, count(a.artistname) as artistname_cnt, sum(sales) total_sales
from artist a 
join album aa on a.artistno = aa.artistno
group by a.agency
;




=============================================================================


-- GolfMember(회원) 테이블 생성
CREATE TABLE GolfMember (
    MNo INT PRIMARY KEY AUTO_INCREMENT,
    MName VARCHAR(30) NOT NULL,
    Phone VARCHAR(13) UNIQUE,
    JoinDate DATE NOT NULL,
    Grade CHAR(1) CHECK(Grade IN ('A','B','C'))
);

-- Lesson(강습) 테이블 생성
CREATE TABLE Lesson (
    LNo INT PRIMARY KEY AUTO_INCREMENT,
    MNo INT,
    Coach VARCHAR(30) NOT NULL,
    StartDate DATE NOT NULL,
    Fee INT CHECK(Fee >= 0),
    FOREIGN KEY (MNo) REFERENCES GolfMember(MNo)
);

-- Usage(연습장 이용내역) 테이블 생성
CREATE TABLE Usehistory (
    UNo INT PRIMARY KEY AUTO_INCREMENT,
    MNo INT,
    UDate DATE NOT NULL,
    Time INT CHECK(Time > 0),
    Cost INT CHECK(Cost >= 0),
    FOREIGN KEY (MNo) REFERENCES GolfMember(MNo)
);

-- (1) 회원 등록: GolfMember 테이블 데이터 삽입
INSERT INTO GolfMember (MName, Phone, JoinDate, Grade) 
VALUES ('홍길동', '010-1111-2222', '2020-01-01', 'A');

INSERT INTO GolfMember (MName, Phone, JoinDate, Grade) 
VALUES ('이순신', '010-3333-4444', '2021-05-10', 'B');

INSERT INTO GolfMember (MName, Phone, JoinDate, Grade) 
VALUES ('강감찬', '010-5555-6666', '2022-03-15', 'C');

-- (2) 강습 등록: Lesson 테이블 데이터 삽입
INSERT INTO Lesson (MNo, Coach, StartDate, Fee) 
VALUES (1, '김프로', '2020-02-01', 300000);

INSERT INTO Lesson (MNo, Coach, StartDate, Fee) 
VALUES (2, '박프로', '2021-06-01', 250000);

INSERT INTO Lesson (MNo, Coach, StartDate, Fee) 
VALUES (3, '이프로', '2022-04-01', 200000);

-- (3) 이용내역 등록: Usage 테이블 데이터 삽입
INSERT INTO `Usehistory` (MNo, UDate, Time, Cost) 
VALUES (1, '2020-02-10', 120, 24000);

INSERT INTO `Usehistory` (MNo, UDate, Time, Cost) 
VALUES (2, '2021-06-15', 90, 18000);

INSERT INTO `Usehistory` (MNo, UDate, Time, Cost) 
VALUES (3, '2022-04-20', 150, 30000);

(4) 조회:
- A등급 회원의 이름, 전화번호, 가입일자를 조회.;
select * from GolfMember
where grade='A';

- 강습비가 250000 이상인 강습 내역을 조회.
select * from Lesson
where fee>250000;

- 회원별 총 이용요금을 집계. (출력: 회원명, 총요금)
select g.mname,(u.time*u.cost) ,l.fee,(u.time*u.cost)+l.fee total_cost
from Usehistory u
join GolfMember g on u.mno = g.mno
join Lesson l on g.mno = l.mno;

(5) 수정:
- 이순신 회원의 등급을 'A'로 수정;
update GolfMember
set grade='A'
where mname='이순신';

(5) 삭제:
- MNo = 3 인 회원을 삭제;
delete from GolfMember
where mno = 3;
확장 문제 (심화)
- “등급별 통계”
(등급, 회원 수, 평균 강습비, 총 이용요금)을 조회;
select * from GolfMember;   //회원 등록: GolfMember 테이블
select * from Lesson;   //강습 등록: Lesson 테이블
select * from Usehistory; //Usage(연습장 이용내역) 테이블

select g.grade, count(g.mname) member_cnt, round(sum(l.fee)/count(g.mname)) avg_fee, sum((u.time*u.cost)+l.fee+(u.time*u.cost)+l.fee) total_cost
from Usehistory u
join GolfMember g on u.mno = g.mno
join Lesson l on g.mno = l.mno
 group by grade
;


