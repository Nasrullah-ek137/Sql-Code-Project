use dailypractice;

-- to find 2nd highest salary from emp table
select * from sales
order by price desc
limit 1 offset 1;

select max(price) from sales
where price < (select max(price) from sales);

-- to find emp who have same manager
select e1.empname as Employee1,e2.empname as Employee2,m.empname as Manager from emp as e1
join emp as e2
on e1.manager_id = e2.manager_id and e1.emp_id < e2.emp_id
join emp as m
on e1.manager_id = m.emp_id;

-- to find first and last record for each emp based on hire_date column
select e.empid,e.empname,e.join_date from employee as e
where e.join_date = (select min(join_date) from employee where empid = e.empid) or
e.join_date = (select max(join_date) from employee where empid = e.empid)
order by e.empid,e.join_date;

-- write query to find most recent transaction for each customer
use employee;
select t.c_id,t.modee,t.payment_date from payment as t
where t.payment_date = (select max(payment_date) from payment where c_id = t.c_id);

-- 5) find total salary for each department and display department with a total salary greater than specified
 -- value like 500000
USE dailypractice;
SELECT department, SUM(salary) FROM manager
GROUP BY department
HAVING SUM(salary) > 5000;







