use school_db1 ;

create table students (
id int primary key auto_increment,
name varchar(30),
marks int
);
insert into students (name,marks)
values('shanu',70),
('Rohit',80),
('yadav',67),
('hello',65),
('abc',56);

-- Ek stored procedure getAllStudents banao jo saare students ko return kare.
delimiter $
create procedure getAllStudents()
begin
select * from students;
end $
delimiter ;
call getAllStudents();

-- Ek procedure getStudentById banao jo ek student ka record id ke basis par de
delimiter /
create procedure getStudentById(in c_id int)
begin
select * from students where id = c_id;
end /
call getStudentById(1);

-- Ek procedure getStudentMarks banao jo student ka marks return kare OUT parameter me.
delimiter //
create procedure getStudentMarks(out markss int,in idd int)
begin
select marks into markss from students where id = idd;
end //
call getStudentMarks(@markss,2);
select @markss;

-- Agar procedure delete karna ho to kaise karoge?
drop procedure getStudentMarks;

-- Ek procedure addStudent banao jo student ka naam aur marks input le aur table me insert kare.
delimiter //
create procedure addStudent(in names varchar(30),in markss int)
begin
insert into students(name,marks)
values(names,markss);
end //
call addStudent('Nasrullah',83);
select * from students;

-- Ek procedure updateMarks banao jo student id aur naye marks input me le aur update kare.
delimiter $$
create procedure updateMarks(in stud_id int,in markss int)
begin
update students set marks = markss where id = stud_id;
end $$
call updateMarks(1,75); -- pehle 70 marks tha euska
select * from students;

-- Ek procedure deleteStudent banao jo student id input le aur uska record delete kare.
delimiter //
create procedure deleteStudent(in stud_id int)
begin
delete from students where id = stud_id;
end //
call deleteStudent(7);
select * from students;

-- Ek procedure countStudents banao jo total students ka count OUT parameter me return kare.
delimiter $
create procedure countStudents(out total_count_stud int)
begin
select count(*) into total_count_stud from students;
end $
call countStudents(@total_count_stud);
select @total_count_stud;

-- Ek procedure topperStudent banao jo sabse zyada marks wale student ka naam aur marks de.
DELIMITER //
CREATE PROCEDURE topperStudent()
BEGIN
SELECT name, marks FROM students
WHERE marks = (SELECT MAX(marks) FROM students);
END //
DELIMITER ;
CALL topperStudent();


-- Ek stored procedure getAllStudents banao jo saare students ko return kare.
delimiter /
create procedure getAllStudents()
begin
select * from students;
end /
call getAllStudents();
-- Ek procedure getStudentById banao jo ek student ka record id ke basis par de
delimiter //
create procedure getStudentById(in ids int)
begin
select * from students where id = ids;
end //
call getStudentById(1);
-- Ek procedure getStudentMarks banao jo student ka marks return kare OUT parameter me.
delimiter /
create procedure getStudentMarks(out markss int,in ids int)
begin
select marks into markss from students where id = ids;
end /
call getStudentMarks(@markss,2);
select @markss;
-- Ek procedure addStudent banao jo student ka naam aur marks input le aur table me insert kare.
delimiter //
create procedure addStudent(in naam varchar(30),in markks int)
begin
insert into students(name,marks)
value(naam,markks);
select * from students;
end //
call addStudent('WWE',34);
-- Ek procedure updateMarks banao jo student id aur naye marks input me le aur update kare.
delimiter $
create procedure updateMarks(in ids int,in markks int)
begin
update students set marks = markks where id = ids;
select * from students;
end $
call updateMarks(2,20);
-- Ek procedure deleteStudent banao jo student id input le aur uska record delete kare.
delimiter $$
create procedure deleteStudent(in ids int)
begin
delete from students where id = ids;
select * from students;
end $$
call deleteStudent(5);

-- Ek procedure countStudents banao jo total students ka count OUT parameter me return kare.
delimiter /
create procedure countStudents(out countt int)
begin
select count(*) into countt from students;
end /
call countStudents(@countt);
select @countt;
-- Ek procedure topperStudent banao jo sabse zyada marks wale student ka naam aur marks de.
delimiter //
create procedure topperStudent()
begin
select * from students
where marks >= (select max(marks) from students);
end //
call topperStudent();

-- Create a stored procedure that returns the average marks of all students as an OUT parameter.
delimiter //
create procedure avg_markss(out markss int)
begin
select avg(marks) into markss from students;
end //
call avg_markss(@markss);
select @markss;


# Cursor ka use karke students ke sabhi names print karo ek-ek row read karke.
delimiter //
create procedure cur_name()
begin
declare all_name varchar(30);
declare done int default 0;

declare demo_cursor cursor for select name from students;
declare continue handler for not found set done = 1;
open demo_cursor;

get_emp:loop
fetch demo_cursor into all_name;
if done = 1 then
leave get_emp;
end if;
select concat(all_name);
end loop get_emp;
close demo_cursor;
end // 
call cur_name();














