use tryy1;
create table users (
userid int primary key,
name varchar(40),
per_hour_salary int default 0,
working_hour int default 0,
total_salary int default 0
);
insert into users
(userid,name,per_hour_salary,working_hour)
values
(101,'Shanu',500,4);

select * from users;

-- Create before_insert ........
delimiter //

create trigger before_insert
before insert
on users for each row
begin

set new.total_salary = new.per_hour_salary * new.working_hour;
end //
delimiter ;

insert into users
(userid,name,per_hour_salary,working_hour)
values
(102,'Nasrullah',1000,8),
(103,'Yadavv',398,19);

-- create before_update
delimiter $
create trigger before_upd
before update
on users for each row
begin

set new.total_salary = new.per_hour_salary * new.working_hour; 

end $
delimiter $

update users set working_hour = 4 where userid = 101;
select * from users;

-- create before_delete and work with before_update as well
create table accounts (
acc_no int primary key,
userid int,
balance int default 0
);
select * from accounts;

alter table users
add column acc_count int default 0;

select * from users;

delimiter /
create trigger beforre_ins
before insert
on accounts for each row
begin

update users set acc_count = acc_count + 1 where userid = new.userid;

end /
insert into accounts
(acc_no,userid,balance)
values
(201,101,238),
(202,103,1268),
(203,101,600);

select * from accounts;

select * from users;

-- delete
delimiter $$
create trigger before_del
before delete
on accounts for each row
begin

update users set acc_count = acc_count - 1 where userid = old.userid;

end $$
select * from users;

delete from accounts where acc_no = 201;
select * from accounts;
select * from users;





















