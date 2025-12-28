#                                     CAR Rental System.
-- -------------------------------------------------------------------------------------------------------------------------

-- Steps

-- 1) Sabse pehle mujhe ek db create karna padega.
create database Car_rent_system;

-- 2) Fir vo db ko use karna.
use Car_rent_system;

-- 3) Aab important 4 table create karna.  Fir eusme 4 ya 5 data insert karna bass.

-- a) Customer table
create table Customer(
customer_id int primary key auto_increment,
firstname varchar(40) not null,
lastname varchar(35) not null,
age int not null check(age >= 18),
phone_num bigint unique,      -- q maine unique liya ke mako number aur mail repeat nhi chahiye isliye.
email varchar(60) unique,
city varchar(30) not null
);
insert into customer
(firstname,lastname,age,phone_num,email,city)
values
('Mohd Nasrullah','Siddiqui',21,9967178044,'Siddnassu1137@gmail.com','Bangluru'),
('Shanuu','Khan',25,8879103524,'shanuukha29@gmail.com','Mumbai'),
('Rohitttt','Dhanshetyy',22,9987336625,'rohitrd03@gmail.com','Omega'),
('Rohit','Yadavv',23,9876543210,'rohitrp23@gmail.com','Aroli'),
('Babyyy','Bewafa',20,8760120954,'vbabyy1985@gmail.com','Navi Mumbai');
select * from customer;

-- extra thing...
alter table customer
modify column phone_num bigint;


-- b) Car table
create table car(
car_id int primary key auto_increment,
car_name varchar(40) not null,
car_brand varchar(30) not null,
registration_num varchar(40) not null,
rent_per_day_price bigint not null,
car_condition varchar(25)
);
select * from car;
insert into car
(car_name,car_brand,registration_num,rent_per_day_price,car_condition)
values
('Tharr','Mahindra','BN03NS1137',1500,'Excellent'),
('Swift','Maruti','MH01XP9867',5000,'Good'),
('Creta','Hyundai','MH02AZ0005',1200,'Good'),
('Innova','Toyota','MH07BP3267',1000,'Average'),
('XUV700','Mahindra','MH02ZE0987',1300,'Good');


-- C) Rent table ..
create table rents
(
rent_id int primary key auto_increment,
customer_id int,
car_id int,
start_date date not null,
end_date date not null,
total_rent_amount bigint,
Customer_review varchar(30),
foreign key (customer_id) references customer(customer_id),
foreign key (car_id) references car(car_id)
);
insert into rents
(customer_id,car_id,start_date,end_date,total_rent_amount,Customer_review)
values
(2,1,'2025-09-25','2025-09-29',7500,'4 Star'),
(1,5,'2025-09-23','2025-09-30',10400,'3.8 Star'),
(5,2,'2025-09-15','2025-09-18',20000,'4.5 star'),
(4,3,'2025-10-01','2025-10-05',6000,'3 Star'),
(3,4,'2025-10-06','2025-10-25',20000,'5 Star');
select * from rents;


-- C) Rent_payment table.
create table Rent_payment
(
payment_id int primary key auto_increment,
rent_id int,
payment_date date not null,
total_amount bigint not null,
payment_mode varchar(40),
foreign key (rent_id) references rents(rent_id)
);
select * from Rent_payment;
insert into Rent_payment
(rent_id,payment_date,total_amount,payment_mode)
values
(1,'2025-09-29',7500,'Upi'),
(3,'2025-09-18',20000,'Cash'),
(2,'2025-09-30',10400,'Debit Card'),
(4,'2025-10-05',6000,'Cash'),
(5,'2025-10-25',20000,'Credit Card');






