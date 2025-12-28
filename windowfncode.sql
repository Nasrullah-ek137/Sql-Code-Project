# create database windows;
use windows;

-- Step 1: Create Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    sale_amount INT,
    sale_date DATE
);
select * from sales;
-- Step 2: Insert Sample Data
INSERT INTO sales (sale_id, employee_name, department, sale_amount, sale_date) VALUES
(1, 'Rahul', 'Electronics', 5000, '2025-09-01'),
(2, 'Aisha', 'Fashion', 7000, '2025-09-02'),
(3, 'Rahul', 'Electronics', 4000, '2025-09-03'),
(4, 'Priya', 'Fashion', 6500, '2025-09-03'),
(5, 'Arjun', 'Grocery', 2000, '2025-09-04'),
(6, 'Aisha', 'Fashion', 8000, '2025-09-05'),
(7, 'Priya', 'Fashion', 6200, '2025-09-05'),
(8, 'Rahul', 'Electronics', 4500, '2025-09-06'),
(9, 'Arjun', 'Grocery', 3000, '2025-09-06'),
(10, 'Aisha', 'Fashion', 7500, '2025-09-07');


# Aggregate window function
select employee_name,
count(department)over(order by employee_name) as Counts,
sum(sale_amount) over(partition by employee_name) as Total,
round(avg(sale_amount) over(partition by employee_name),2) as AVGS,
min(sale_amount) over(partition by department) as Minimum,
max(sale_amount) over(partition by department) as Maximum
from sales;

# Ranking function.
select
row_number() over(order by employee_name asc) as Row_numbers,
employee_name,
sale_amount,
rank() over(order by department) as Ranks,
dense_rank() over(order by sale_amount desc)
from sales;

# Analyzee functioon
select employee_name,department,
lag(sale_amount,3) over(order by sale_id) as Lagg,
lead(sale_amount,2) over(order by sale_id) as Leadd,
first_value(sale_date) over(order by employee_name asc) as Firstvaluee,
last_value(sale_date) over(order by employee_name asc) as Lastvaluee
from sales;

# Questionn
select sale_id,
lag(sale_amount,2) over(order by sale_id) as lagg,
lead(sale_amount,2) over(order by sale_id) as leadd
from sales;

-- Create Employee Table
CREATE TABLE Employee (
    EID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Salary INT,
    Location VARCHAR(50)
);

-- Insert Sample Data
INSERT INTO Employee (EID, FirstName, LastName, Age, Salary, Location) VALUES
(1, 'Priya', 'Bhatt', 27, 200000, 'Bengaluru'),
(2, 'Akhil', 'George', 26, 100000, 'Gurugram'),
(3, 'Kaneesha', 'Brownlee', 27, 300000, 'London'),
(4, 'Naga', 'Sai', 30, 150000, 'Bengaluru'),
(5, 'Prabhutva', 'Kalkdar', 35, 70000, 'Noida'),
(6, 'Yashswi', 'Gandhak', 29, 90000, 'Delhi');
select * from employee;

select location,
count(location) over(partition by location),
round(avg(salary) over(partition by location),1)
from employee;

select firstname,lastname,location,
count(location) over(partition by location),
round(avg(salary) over(partition by location),1)
from employee;

-- Sabhi students ke liye RANK() aur DENSE_RANK() lagao based on marks (descending).
select firstname,salary,
rank() over(order by salary desc) as Rankk,
dense_rank() over(order by salary desc) as dense_rankk
from employee;

-- Sabhi students ke liye ROW_NUMBER() lagao based on id.
select FirstName,LastName,Salary,
row_number() over(order by eid) as Row_numberss
from employee;

-- Sabhi students ka running total of marks nikalo (SUM(marks) OVER (ORDER BY id)).
select FirstName,
max(salary) over(order by eid)
from employee;

# Sabhi students ka average marks calculate karo window function se (AVG(marks) OVER ()).
select FirstName,Salary,
avg(salary) over(order by eid asc) as Avgg
from employee;


# Sabhi students ke liye LEAD() aur LAG() ka use karke next aur previous student ke marks dikhado.
select FirstName,LastName,Salary,
lag(Salary) over(),
lead(Salary) over()
from employee;

-- Partition by lagao: students ke marks ko “Passed/Failed” category me group karke unka rank dikhado.




















