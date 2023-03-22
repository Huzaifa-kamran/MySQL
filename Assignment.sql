create database company;
use company;
create table sailors(sailorID int Primary key auto_increment, sailorName varchar(50), rating int, age int);
insert into sailors values (1,"Raffay",4,24);
insert into sailors values (2,"Ali",3,19),(3,"Bilal",4,21),(4,"Baber",5,22),(5,"Hashmi",3,27);
insert into sailors values (6,"Uzair",5,18),(7,"Imran",2,26),(8,"Zardari",3,25);
select * from sailors;
create table  boats(boatID int primary key auto_increment,boatName varchar(50), color varchar(50));
insert into boats values (5,"Ferry","Red"),(8,"Cabin Cruiser","Black"),(9,"Hydro Plane","White"),(11,"Cruise Ship","red");
insert into boats values (13,"Drift Boat","Green");
update boats set color = "Red" where color = "red";
SET SQL_SAFE_UPDATES = 0;
select * from boats;
create table  reserves (sailorID int,boatID int, bookingDate date , foreign key(sailorID) references sailors(sailorID),
foreign key(boatID) references boats(boatID));
select * from reserves;
insert into reserves values (3,11,"2023-10-01"),(1,8,"2022-04-19"),(4,9,"2023-09-01"),(2,5,"2022-12-31"),(1,11,"2023-03-21"),(5,13,"2022-10-02"),
(4,5,"2022-10-02"),(3,8,"2023-09-23");
insert into reserves values (8,9,"2022-08-13"),(6,11,"2022-08-20"),(7,5,"2023-02-28");
insert into reserves values (3,5,"2023-10-01");

-- sailors who have reserved boat number 5.
select * from sailors inner join reserves on sailors.sailorID = reserves.sailorID where boatID = 5;

-- Find the name of boat reserved by Ali.
select sailors.sailorID,sailorName,boats.boatID,boatName from sailors inner join reserves on sailors.sailorID = reserves.sailorID inner join 
boats on boats.boatID = reserves.boatID where sailorName = "Ali";

-- Find the names of sailors who have reserved a red boat, and list in the order of age. 
select sailors.sailorID,sailorName,age,boatName,color from sailors inner join reserves on sailors.sailorID = reserves.sailorID 
inner join boats on boats.boatID = reserves.boatID where color = "red" order by age;

-- Find the names of sailors who have reserved at least one boat.
select distinct sailors.sailorID,sailorName, count( reserves.sailorID) as TotalBookings from sailors inner join reserves on sailors.sailorID = reserves.sailorID group by reserves.sailorID;

-- Find the ids of sailors who have reserved a red boat or a green boat.
select sailorID,boats.boatID,boatName,color from boats inner join reserves on boats.boatID = reserves.boatID where color in ("red","green");

-- Find the name and the age of the youngest sailor. 
select sailorID,sailorName,min(age) as YoungestSailor  from sailors;

-- Count the number of different sailor names. 
select count(sailorName) as TotalSailors from sailors;

-- Find the average age of sailors for each rating level.
select rating,avg(age) from sailors group by rating;

-- Find the ids and names of sailors who have reserved two different boats on the same day. 
select distinct sailors.sailorID,sailorName,r1.boatID,r1.bookingDate from sailors inner join reserves r1 on sailors.sailorID = r1.sailorID inner join
 reserves r2 on sailors.sailorID = r2.sailorID where r1.bookingDate = r2.bookingDate AND r1.boatID <> r2.boatID;
 

