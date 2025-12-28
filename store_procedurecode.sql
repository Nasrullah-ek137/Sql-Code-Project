
use tryy1;

delimiter $$
create procedure creating_newthing()
begin

create table demo(
idd int primary key auto_increment,
fname varchar(50),
lname varchar(90),
age int,
salary int,
city varchar(50)
);

insert into demo(fname,lname,age,salary,city) values ('shanu','bhai',21,10000,'Bangluru');
insert into demo(fname,lname,age,salary,city) values ('nassu','skks',25,26475,'Chennai');
insert into demo(fname,lname,age,salary,city) values ('hello','broo',27,98654,'Mumbai');
insert into demo(fname,lname,age,salary,city) values ('abcd','xyz',32,12745,'Delhi');

select * from demo;

end $$
delimiter ;

call creating_newthing;



delimiter //

create procedure demotryy()
begin
declare count int default 0;
select count(*) into count from demo;
select count;
end //

call demotryy;

delimiter ;

delimiter $
create procedure in_example(in namee varchar(200))
begin
select * from demo where fname = namee;

end $

call in_example('shanu');


delimiter ;

delimiter //
create procedure inout_eg(in namee varchar(200),out numbers int)
begin
select sum(salary) into numbers from demo where lname = namee;
end //
delimiter ;

call inout_eg('skks',@numbers);
select @numbers;


show procedure status where db='tryy1';

delimiter //

create procedure updprod(in id int)
begin

update demo
set lname = 'Siddiqui' where idd = id;

select * from demo;
end //

delimiter ; 

call updprod(3);




















