-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS company_data;
USE company_data;

-- Step 2: Create Regions Table
CREATE TABLE regions (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(50)
);

-- Step 3: Create Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50),
    location VARCHAR(50),
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Step 4: Create Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    hire_date DATE,
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    job_title VARCHAR(50),
    manager_id INT,
    dept_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);



-- Step 5: Create Categories Table
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50)
);

-- Step 6: Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
-- Step 7: Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    region_id INT,
    join_date DATE,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Step 8: Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Step 9: Create Order_Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Step 10: Create Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    method VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- Step 11: Create Sales Table
CREATE TABLE sales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    sale_date DATE,
    sale_amount DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO regions (region_name) VALUES
('North'),
('South'),
('East'),
('West');

INSERT INTO departments (dept_name, location, region_id) VALUES
('HR', 'New York', 1),
('Finance', 'Chicago', 1),
('IT', 'Los Angeles', 4),
('Sales', 'Houston', 2),
('Marketing', 'Miami', 3);


INSERT INTO employees 
(first_name, last_name, age, hire_date, salary, bonus, job_title, manager_id, dept_id) 
VALUES
-- CEO (No Manager)
('John', 'King', 50, '2010-01-10', 20000, 2000, 'CEO', NULL, 1),

-- Managers (Report to CEO)
('Robert', 'Miller', 45, '2012-03-15', 15000, 1500, 'HR Manager', 1, 1),
('Linda', 'Scott', 43, '2013-06-20', 16000, 1800, 'Finance Manager', 1, 2),
('Michael', 'Davis', 40, '2014-08-05', 17000, 2000, 'IT Manager', 1, 3),
('Sarah', 'Wilson', 42, '2015-09-10', 15500, 1500, 'Sales Manager', 1, 4),
('James', 'Brown', 44, '2016-10-12', 15800, 1600, 'Marketing Manager', 1, 5),

-- HR Employees (Manager = 2)
('Emma', 'Taylor', 30, '2018-02-11', 8000, 500, 'HR Executive', 2, 1),
('Olivia', 'Moore', 29, '2019-04-17', 8200, 600, 'HR Assistant', 2, 1),

-- Finance Employees (Manager = 3)
('William', 'Anderson', 33, '2017-07-22', 9000, 700, 'Financial Analyst', 3, 2),
('Sophia', 'Thomas', 31, '2018-09-14', 8800, 650, 'Accountant', 3, 2),

-- IT Employees (Manager = 4)
('Daniel', 'Jackson', 28, '2019-11-01', 12000, 900, 'Software Engineer', 4, 3),
('Ava', 'White', 27, '2020-01-20', 11000, 800, 'System Admin', 4, 3),
('Lucas', 'Harris', 26, '2021-05-10', 10500, 750, 'Junior Developer', 4, 3),

-- Sales Employees (Manager = 5)
('Mason', 'Martin', 32, '2017-03-18', 9500, 700, 'Sales Executive', 5, 4),
('Isabella', 'Thompson', 30, '2018-06-09', 9700, 720, 'Sales Rep', 5, 4),

-- Marketing Employees (Manager = 6)
('Ethan', 'Garcia', 29, '2018-12-01', 9300, 650, 'Marketing Specialist', 6, 5),
('Mia', 'Martinez', 27, '2019-08-22', 9100, 600, 'SEO Analyst', 6, 5),
('Alexander', 'Robinson', 31, '2020-02-15', 9400, 620, 'Content Writer', 6, 5),

-- Few extra employees for complex queries
('Charlotte', 'Clark', 28, '2021-09-10', 8900, 550, 'HR Intern', 2, 1),
('Benjamin', 'Rodriguez', 34, '2016-11-05', 11500, 850, 'IT Consultant', 4, 3);


INSERT INTO categories (category_name) VALUES
('Electronics'),('Accessories'),('Furniture'),('Fashion'),('Home Appliances');

INSERT INTO customers (name, region_id, join_date) VALUES
('Alice Johnson',1,'2022-01-15'),
('Bob Smith',2,'2022-02-20'),
('Charlie Brown',3,'2022-03-12'),
('David Lee',4,'2022-04-25'),
('Eva Green',1,'2022-05-30'),
('Frank Harris',2,'2022-06-05'),
('Grace King',3,'2022-07-10'),
('Hannah Scott',4,'2022-08-15'),
('Ian White',1,'2022-09-20'),
('Julia Roberts',2,'2022-10-25'),
('Kevin Turner',3,'2022-11-12'),
('Laura Adams',4,'2022-12-05'),
('Michael Clark',1,'2023-01-18'),
('Nina Brooks',2,'2023-02-20'),
('Oliver Stone',3,'2023-03-22');

INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1,'2023-01-25','Completed',55000),
(2,'2023-02-10','Completed',25000),
(3,'2023-03-05','Completed',30000),
(4,'2023-04-18','Completed',1500),
(5,'2023-05-22','Completed',7000),
(6,'2023-06-15','Pending',1200),
(7,'2023-07-20','Completed',40000),
(8,'2023-08-05','Completed',3000),
(9,'2023-09-10','Completed',2000),
(10,'2023-10-12','Completed',12000),
(11,'2023-11-15','Completed',800),
(12,'2023-12-18','Completed',15000),
(13,'2023-01-05','Completed',55000),
(14,'2023-02-28','Completed',30000),
(15,'2023-03-15','Completed',25000);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1,1,1,55000),
(2,2,1,25000),
(3,3,1,30000),
(4,4,1,1500),
(5,6,1,7000),
(6,5,1,1200),
(7,7,1,40000),
(8,10,1,3000),
(9,9,1,2000),
(10,11,1,12000),
(11,12,1,800),
(12,8,1,15000),
(13,1,2,110000),
(14,3,1,30000),
(15,2,2,50000);

INSERT INTO payments (order_id, payment_date, amount, method) VALUES
(1,'2023-01-26',55000,'Credit Card'),
(2,'2023-02-11',25000,'Debit Card'),
(3,'2023-03-06',30000,'UPI'),
(4,'2023-04-19',1500,'Cash'),
(5,'2023-05-23',7000,'Credit Card'),
(6,'2023-06-16',1200,'Debit Card'),
(7,'2023-07-21',40000,'UPI'),
(8,'2023-08-06',3000,'Credit Card'),
(9,'2023-09-11',2000,'Cash'),
(10,'2023-10-13',12000,'Debit Card'),
(11,'2023-11-16',800,'UPI'),
(12,'2023-12-19',15000,'Credit Card'),
(13,'2023-01-06',110000,'Credit Card'),
(14,'2023-02-28',30000,'UPI'),
(15,'2023-03-16',50000,'Debit Card');

INSERT INTO sales (employee_id, sale_date, sale_amount) VALUES
(2,'2023-01-10',5000),
(3,'2023-02-15',7000),
(4,'2023-03-20',8000),
(5,'2023-04-10',6500),
(6,'2023-05-05',7200),
(7,'2023-06-12',3000),
(8,'2023-07-18',2800),
(9,'2023-08-22',4000),
(10,'2023-09-30',4500),
(11,'2023-10-05',6000),
(12,'2023-11-10',5000),
(13,'2023-12-15',4200),
(14,'2023-01-20',5500),
(15,'2023-02-28',4700),
(16,'2023-03-12',4900),
(17,'2023-04-18',5100),
(18,'2023-05-25',5300),
(19,'2023-06-30',4800),
(20,'2023-07-10',6200);

INSERT INTO products (product_name, category_id, price) VALUES
('iPhone 15', 1, 79999.00),
('Samsung TV 55 Inch', 1, 55999.00),
('Bluetooth Headphones', 1, 2999.00),
('Laptop Dell Inspiron', 1, 64999.00),

('Men T-Shirt', 2, 499.00),
('Women Jeans', 2, 1199.00),
('Winter Jacket', 2, 2499.00),
('Sports Shoes', 2, 1999.00),

('Microwave Oven', 3, 8999.00),
('Refrigerator 260L', 3, 21999.00),
('Washing Machine', 3, 18999.00),
('Air Conditioner', 3, 32999.00),

('Milk 1L', 4, 55.00),
('Bread', 4, 40.00),
('Basmati Rice 5kg', 4, 499.00),
('Olive Oil 1L', 4, 749.00),

('Cricket Bat', 5, 1599.00),
('Football', 5, 899.00),
('Yoga Mat', 5, 599.00),
('Dumbbell Set', 5, 2499.00);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 80000),     -- iPhone
(2, 2, 1, 55999),     -- Samsung
(3, 3, 2, 5998),      -- Men T-Shirt
(4, 4, 1, 64999),     -- Dell Laptop
(5, 5, 3, 1497),      -- Book
(6, 6, 1, 1199),      -- Earbuds
(7, 7, 1, 2499),      -- Makeup Kit
(8, 8, 2, 3998),      -- Chair
(9, 9, 1, 8999),      -- Tablet
(10, 10, 1, 21999),   -- TV
(11, 11, 1, 18999),   -- Smartwatch
(12, 12, 1, 32999),   -- Camera
(13, 13, 5, 275),     -- Pen
(14, 14, 1, 40),      -- Notebook
(15, 15, 1, 499);     -- Backpack

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
INSERT INTO payments (order_id, amount, payment_date, payment_method) VALUES
(1, 80000, '2024-01-15', 'Credit Card'),
(2, 55999, '2024-01-18', 'UPI'),
(3, 5998,  '2024-01-20', 'NetBanking'),
(4, 64999, '2024-02-01', 'Credit Card'),
(5, 1497,  '2024-02-03', 'Cash'),
(6, 1199,  '2024-02-05', 'Wallet'),
(7, 2499,  '2024-02-07', 'UPI'),
(8, 3998,  '2024-02-10', 'Credit Card'),
(9, 8999,  '2024-03-01', 'UPI'),
(10, 21999, '2024-03-02', 'NetBanking'),
(11, 18999, '2024-03-05', 'Credit Card'),
(12, 32999, '2024-03-06', 'UPI'),
(13, 275,   '2024-03-08', 'Cash'),
(14, 40,    '2024-03-10', 'Wallet'),
(15, 499,   '2024-03-12', 'Credit Card');



-- 1) Write query to find 2nd highest salary from emp table
select * from employees;

select employee_id,first_name,last_name,salary from employees
order by salary desc
limit 1 offset 1;

select first_name,last_name,salary
from(
select first_name,last_name,salary,
dense_rank() over(order by salary desc) as densee from employees
) as t
where densee = 2;

with ctee as (
select first_name,last_name,salary,
dense_rank() over(order by salary desc) as densee from employees
)
select first_name,last_name,salary from ctee
where densee = 2;


-- 2) write query to find employee who have same manager 
select e1.first_name as Empl1fname,e2.first_name as Empl2fname,m.first_name as Managername from employees as e1
join employees as e2
on e1.manager_id = e2.manager_id and e1.employee_id < e2.employee_id
join employees as m
on e1.manager_id = m.employee_id;

-- 3) write query to find the first and last record for each employee based on Hire_date column 
select e.employee_id,e.first_name,e.last_name,e.hire_date from employees as e
where e.hire_date = (select min(hire_date) from employees where employee_id = e.employee_id) or
e.hire_date = (select max(hire_date) from employees where employee_id = e.employee_id)
order by e.hire_date;

-- 4) write query to find most recent transaction for each customer
select c.customer_id,c.name,o.order_date from customers as c
join orders as o
on c.customer_id = o.customer_id
where o.order_date = (select max(order_date) from orders where order_date = o.order_date);

 -- 5) write query to find the total salary of each department and display department with a total salary 
 -- greater than a specified value (eg 5000)
select d.dept_name,sum(e.salary) from employees as e
join departments as d
on e.dept_id = d.dept_id
group by d.dept_name
having sum(e.salary) > 10000;

 -- 6) write query to find the running total of orders for each customer sorted by order_date 
select o.customer_id,o.order_id,o.order_date,o.total_amount,
(select sum(o1.total_amount) from orders as o1 where o.order_id = o1.order_id and o.order_date < o1.order_date)
from orders as o
order by o.order_date;


 -- 7) write query to get total number of employees hired per month and year
select year(hire_date) as Hire_year,
monthname(hire_date) as Hire_month,
count(*) as Total_emp from employees
group by year(hire_date),monthname(hire_date)
order by Hire_year,Hire_month;

 -- 8) write query to display all employee who earn more than average salary for their department 
select e.employee_id,d.dept_name,e.first_name,e.salary from employees as e
join departments as d
on e.dept_id = d.dept_id
where e.salary > (select avg(salary) from employees where dept_name = d.dept_name);
 
 -- 9) write query to get second lowest salary from emp table with or without using limit or offset
select employee_id,first_name,salary from employees
order by salary
limit 1 offset 1;

 -- write query to get second lowest salary from emp table without using limit or offset
select employee_id,first_name,salary
from(
select employee_id,first_name,salary,
dense_rank() over(order by salary) as densee from employees
) as t
where densee = 2;

with cteee as (
select employee_id,first_name,salary,
dense_rank() over(order by salary) as densee from employees
)
select employee_id,first_name,salary from cteee
where densee = 2;

 -- 10) write query to list all product that have never been ordered ( assuming order table and product table)
select p.product_id,o.product_id,p.product_name from products as p
join order_items as o
on p.product_id = o.product_id
where o.product_id is null;

-- 11) Write query to list all employee who are also manager.
select employee_id,first_name from employees
where employee_id in (select distinct manager_id from employees);

-- 12) Write query to find employee who have joined in same month and year
select * from employees;

select e1.employee_id as emp1,e1.first_name as emp1name,e2.employee_id as emp2,e2.first_name as emp2name,
year(e1.hire_date) as Joined_year,
monthname(e1.hire_date) as Joined_month from employees as e1
join employees as e2
on year(e1.hire_date) = year(e2.hire_date) and monthname(e1.hire_date) = monthname(e2.hire_date) and
e1.employee_id < e2.employee_id
order by Joined_year,Joined_month;


-- 13)write query to get  list of employee who are older than avg age of employee in their dept
select e.employee_id,d.dept_name,e.first_name,e.age from employees as e
join departments as d
on e.dept_id = d.dept_id
where e.age > (select avg(age) from employees where dept_name = d.dept_name);

-- 14) write query to display employee with longest tenture at company earliest joined.
select employee_id,first_name,last_name,hire_date from employees
where hire_date = (select min(hire_date) from employees);

select employee_id,first_name,last_name,hire_date from employees
order by hire_date
limit 1;

-- 15) write query to delete all records from table where column value is null.
delete from employees
where employee_id is null or first_name is null or salary is null;

-- 16) write query to find all pair of product that were ordered together at least once
select p1.product_id as prod1,p2.product_id as prod2,p1.product_name from products as p1
join products as p2
on p1.customer_id = p2.customer_id and p1.product_id < p2.product_id 
order by prod1,prod2;

-- 17) write query to find avg order value by customer for each month
select customer_id,
year(order_date) as order_year,
monthname(order_date) as order_month,
round(avg(total_amount),1) as avg_order from orders 
group by customer_id,year(order_date),monthname(order_date)
order by customer_id,order_year,order_month;

-- 18) write query to identify customers who made purchase every month for past year
select customer_id from customers
where year(join_date) = '2022'
group by customer_id
having count( month(join_date)) = 12;


-- 19) write query to find total revenue for each region in given quarter
select sales_id,sum(sale_amount) as revenue from sales
where year(sale_date) = 2023 and quarter(sale_date) = 2
group by sales_id;

select sales_id,sum(sale_amount) as revenue from sales
where sale_date > '2023-04-01' and sale_date < '2023-06-30'
group by sales_id;

-- 20) Write query to find the first purchase date of each customer
select customer_id,min(order_date) from orders
group by customer_id;

-- 21) Write query to calculate yaer-on-year growth of revenue
WITH yearly_revenue AS (
    SELECT 
        YEAR(hire_date) AS year,
        SUM(salary) AS total_revenue
    FROM employees
    GROUP BY YEAR(hire_date)
)
SELECT 
    year,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY year) AS prev_year_revenue,
    ((total_revenue - LAG(total_revenue) OVER (ORDER BY year)) 
        / LAG(total_revenue) OVER (ORDER BY year)) * 100 AS yoy_growth
FROM yearly_revenue
ORDER BY year;

-- 22)write query to find nth highest salary from emp table like 5
select salary from employees as e1
where 5-1 = (select count(salary) from employees as e2 where e1.salary < e2.salary);

select salary from employees
order by salary desc
limit 1 offset 4;

-- 23)write query to fetch record where name start with A
select employee_id,first_name,age,salary from employees
where first_name like 'A%';

-- 24) write query to get top 3 highest salaries in emp table
select * from employees
order by salary desc
limit 3;

-- 25)write query to fetch common records from 2 table
select t1.* from employees as t1
inner join employees as t2
on t1.employee_id = t2.employee_id;


-- 26)write query to find employee who not assigned dept
select employee_id,first_name from employees
where dept_id is null;

-- 27)write query to combine result of two table using union
select employee_id,first_name from employees
union
select employee_id,first_name from employees;

-- 28)write query to get top 3 department with highest number of employee
select d.dept_name,count(e.employee_id) from employees as e
join departments as d
on e.dept_id = d.dept_id
group by d.dept_name
order by count(e.employee_id) desc
limit 3;

-- 29) write query to fetch even and odd row from table
select * from employees
where mod(employee_id,2) = 0;

select * from employees
where mod(employee_id,2) = 1;


-- 30)how to delete duplicate record but keep once
delete e1 from employees as e1
join employees as e2
on e1.salary = e2.salary and e1.first_name = e2.first_name 
where e1.employee_id > e2.employee_id;



-- 31) how do you retreive only duplicate record from table
select first_name,last_name,salary,count(*) from employees
group by first_name,last_name,salary
having count(*) > 1;


-- 32) write query to calculate the running total of sales by date
select sale_date,
sum(sale_amount) over(order by sale_date) from sales;

-- 33) write query to find most frequently occuring value in col
select salary,count(*) as freq from employees
group by salary
order by freq desc
limit 1;

-- 34) fetch records where date is within last 7 days from todays
select * from employees
where hire_date between (curdate() - interval 9 day) and curdate();
# where hire_date between ('2021-09-15' - interval 9 day) and curdate();

-- 35)write query to count how many emp share same salary
select salary,count(*) from employees
group by salary
having count(*) > 1;


-- 36) how do you fetch top 3 records for each group in table
select * from(
select employees.*,
row_number() over(partition by dept_id order by salary desc) as rnk from employees
) as t
where rnk <= 3;

-- 37) retrive product that were never sold
select p.product_id,p.product_name from products as p
left join order_items as o
on p.product_id = o.product_id
where o.product_id is null;


-- 38) rank product by sales in desc order for each region
select product_id,region,sum(sale_amount),
row_number() over(partition by region order by sum(sale_amount) desc) as saless from sales
group by product_id,region,saless;

-- 39)fetch all emp whose salaries fall within top 10% of their dept
select first_name,salary,
percent_rank() over(partition by dept_id order by salary desc) as pnk from employees
where pnk < 0.1;

-- 40) identify order placed during business hours 9am to 6pm
select * from orders
where hour(order_date) between 9 and 18;

-- 41) write query to get count of users active on both weekday and weekend
select count(*) from (
select user_id,
sum(case when dayofweek(created_at) between 2 and 6 then 1 else 0 end) as Weekday_active,
sum(case when dayofweek(created_at) in (1,7) then 1 else 0 end) as Weekend_active
from users
group by user_id
having Weekday_active > 0 and Weekend_active > 0 
) as t;

-- 42) Retrive customers who made purchase across at least 3 different categories
select customer_id from customers
join categories
on customer_id = category_id
group by customer_id
having count(distinct category_id) >= 3;

-- 43) Retrive customers who made their first purchase in last 6 months
select customer_id,min(join_date) from customers
group by customer_id
having min(join_date) >= (curdate() - interval 6 month) and curdate();

-- 44) How do you pivot table to convert rows into col
select region_id,
sum(case when region_name = 'North' then 1 else 0 end) as North_sales,
sum(case when region_name = 'East' then 1 else 0 end) as East_sales,
sum(case when region_name = 'South' then 1 else 0 end) as South_sales,
sum(case when region_name = 'West' then 1 else 0 end) as West_sales
from regions
group by region_id;


-- 45) find median salary of emp in table
SELECT AVG(salary) AS median_salary
FROM (
    SELECT salary,
        ROW_NUMBER() OVER (ORDER BY salary) AS rn,
        COUNT(*) OVER () AS total_count FROM employees
) AS ranked
WHERE rn IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));

-- 46) fetch all users who logged in consecutively for 3 days or more
select user_id from users as u1
where exists (select 1 from users as u2 where u2.user_id = u1.user_id and u2.created_at = u1.created_at + interval 1 day) and
exists (select 2 from users as u3 where u3.user_id = u1.user_id and u3.created_at = u1.created_at + interval 2 day)
group by user_id;

-- 47) create query to calculte ratio of sales between 2 categories
select category_id,
sum(case when category_name = 'Electronics' then 1 end) /
sum(case when category_name = 'Fashion' then 1 end) from categories
group by category_id;

-- 48) how would you implement a recursive query to generate hierarchical structure
with recursive ctee_emp as (
select employee_id,manager_id,first_name,last_name from employees
where manager_id is null
union all
select e.employee_id,e.manager_id,e.first_name,e.last_name from employees as e
join employees as c
on e.manager_id = c.employee_id
)
select * from ctee_emp;

-- 49) write query to find gaps in sequential numbering within table
select t1.employee_id+1 from employees as t1
join employees as t2
on t1.employee_id+1 = t2.employee_id
where t2.employee_id is null;

-- 50)compute median salary for each department
select dept_id,avg(salary) from (
select dept_id,salary,
row_number() over(partition by dept_id order by salary desc) as rnk,
count(*) over(order by dept_id) as countt
from employees
) as t
where rnk in (floor(countt+1/2),floor(countt+2/2))
group by dept_id;

-- 51)count the no.of unique customer for each product
select product_id,count(distinct customer_id) from products
group by product_id;

-- 52) summarize monthly sales and rank them in desc
select date_format(hire_date,'%Y - %M') as month,
sum(salary) as saless,
rank() over(order by sum(salary) desc) from employees
group by month;

-- 53)identify top 5 region based on total sales
select c.region_id,sum(o.total_amount) as total from customers as c
join orders as o
on c.customer_id = o.customer_id
group by c.region_id
order by total desc
limit 5;

-- 54)calcualte the avg order value for every customer
select c.customer_id,avg(o.total_amount) as avg_value from customers as c
join orders as o
on c.customer_id = o.customer_id
group by c.customer_id;

-- 55)find customer whose total purchase value exceed the avg order value
select c.customer_id,sum(o.total_amount) as total_amounts from customers as c
join orders as o
on c.customer_id = o.customer_id
group by c.customer_id
having total_amounts > (select avg(total_amount) from orders);


-- 56) retrive emp with lowest salary in their respective dept
select employee_id,salary from employees
where salary = (select min(e.salary) from employees as e where dept_id = e.dept_id);

-- 57)identify product ordered more than 10 times using subquery
select product_id from products
where product_id in (select product_id from products group by product_id
having count(*) > 10);

-- 58) list region where highest sales value is below specified threshold
select c.region_id,sum(o.total_amount) as totall from customers as c
join orders as o
on c.customer_id = o.customer_id
group by c.region_id
having totall < 10000;

-- 59) list all cust highlighting who placed order and who did not
select c.customer_id,c.name,
case
when o.customer_id is null then 'Dont place order..' else 'Orders placed..'
end as order_status from customers as c
left join orders as o
on c.customer_id = o.customer_id
group by c.customer_id,c.name;

-- 60) identify employee assigned to more than one project using self join
select employee_id from employee_projects
group by employee_id
having count(distinct project_id) > 1;

-- 61) match order with customer and display unmatched ordered as well
select o.order_id,c.customer_id from orders as o
left join customers as c
on o.customer_id = c.customer_id;

-- 62)create unique product combiantion using cross join exclude identical product pair
select p1.product_id,p1.product_name,p2.product_id,p2.product_name from products as p1
cross join products as p2
where p1.product_id < p2.product_id;

-- 63)retrive employee along with their direct manager using self join
select e.employee_id as Empid,e.first_name as Employee_name,m.first_name as Manager_name from employees as e
join employees as m
on e.manager_id = m.employee_id
order by Empid;

-- 64)compute rolling avg of sales for last 3 months
select date_format(sale_date,'%Y - %M') as sales_month,
sum(sale_amount) as sale_amounts,
avg(sum(sale_amount)) over(order by date_format(sale_date,'%Y - %M') rows 2 preceding) as rolling_avg from sales
group by sales_month
order by sales_month;

-- 65) Rank employee uniquely based on their salary in desc
select employee_id,first_name,salary,
row_number() over(order by salary desc) as rnk from employees
group by employee_id;

-- 66)identify the earliest and latest purchase dates for each customer
select c.customer_id,min(o.order_date) as first_purchase,
max(o.order_date) as Lastest_purchase from customers as c
left join orders as o
on c.customer_id = o.customer_id
group by c.customer_id;

-- 67)find second highest salary in each department using window fn
select employee_id,first_name,dept_id,salary from (
select employee_id,first_name,dept_id,salary,
dense_rank() over(partition by dept_id order by salary desc) as densee from employees) as t
where densee = 2;

-- 68)calculate percentage contribution of each employee to company total revenue
select employee_id,sum(salary) as total_revenue,
round((sum(salary) * 100.0) / sum(sum(salary)) over(),2) as pct from employees
group by employee_id;

-- 69)use cte to separate full name into first and last name
with full_cte as (
select substring_index(first_name,' ',1) as first_nameeee,
substring_index(last_name,' ',-1) as last_name from employees
)
select * from full_cte;

-- 70)write cte to determine longest streak of consective sales by employee
with long_streak as (
select employee_id,sale_date,
row_number() over(partition by employee_id order by sale_date) as rnk from sales
)

select employee_id,max(cnt) as Longest_streak from (
select employee_id,date_sub(sale_date,interval rnk day)
grp,count(*) as cnt from long_streak
group by employee_id,grp
) as t
group by employee_id;

-- 71)fibonacci number upto specific value using recursive cte
with recursive fib(n1,n2) as (
select 0,1

union all

select n2,n1+n2 from fib where n1+n2 <= 100
)
select n2 from fib;

-- 72)use cte to detect and list duplicate entires in table
with duplicate_ent as (
select first_name,last_name,count(*) from employees
group by first_name,last_name
having count(*) > 1
)
select * from duplicate_ent;

-- 73) calculate total sales per category and filterout categories with sales below a specific threshold using cte
with cateee as (
select category_id,sum(price) as total_sales from products
group by category_id
)
select * from cateee where total_sales > 10000;

-- 74)write query to locate duplicate entries in a column with an index
select manager_id,count(*) from employees use index(manager_id)
group by manager_id
having count(*) > 1;

-- 75)identify high-cardinality column that could benefit from indexing
select count(distinct employee_id) as distinctt,
count(*) as total_rows from employees;

-- 76)write query that bypasses indexing to observe performance variation
select first_name from employees ignore index(first_name) 
group by first_name;

-- 77)identify all record in a table that appear more than once based on all col values
select employee_id,age,salary,count(*) from employees
group by employee_id,age,salary
having count(*) > 1;

-- 78) find employee without deptartment
select e.employee_id,e.first_name,d.dept_id from employees as e
left join departments as d
on e.dept_id = d.dept_id
where d.dept_id is null;

-- 79) retreive most recent order placed by every customers
select c.customer_id,max(o.order_date) as recent_order_date from customers as c
left join orders as o
on c.customer_id = o.customer_id
group by c.customer_id;

-- 80)find customer who made purchases but never returned any order
select c.customer_id from customers as c
left join orders as o
on c.customer_id = o.customer_id
where c.customer_id not in (select o.customer_id from orders);

-- 81)find avg order value for each customer based on their total spending and no.of orders
select c.customer_id,avg(o.total_amount) as total_spending,count(*) as no_of_orders from customers as c
left join orders as o
on c.customer_id = o.customer_id
group by c.customer_id;

-- 82)display how many orders each customers has placed
select customer_id,count(*) from orders
group by customer_id;

-- 83) list all product that have never been sold in any order
select p.product_id,p.product_name from products as p
left join order_items as o
on p.product_id = o.product_id
where o.product_id is null;

-- 84)count how many customer have placed more than 5 orders
select customer_id,count(*) as no_of_orders from orders
group by customer_id
having count(*) > 5;

-- 85)find product that has been sold the most(based on total qualtity)
select product_id,sum(quantity) as total_quantity from order_items
group by product_id
order by total_quantity desc
limit 1;

-- 86) calculate total revenue and count of orders for each region
select region_id,sum(total_amount) as total_revenue,count(*) from orders
group by region;


-- 87) Identify customers who placed at least one order every month in year 2024
select customer_id from orders
where year(order_date) = 2023
group by customer_id
having count(distinct month(order_date)) = 12;

-- 88) list all employee who were hired on saturday and sunday
select * from employees
where dayname(hire_date) = 'saturday' and dayname(hire_date) = 'sunday';

-- 89)assign salary-based rank to employee with each department
select employee_id,dept_id,salary,
dense_rank() over(partition by dept_id order by salary desc) as densee from employees;


-- 90) 2nd highest salary department-wise (without window fn)
select employee_id,first_name,salary from employees as e1
where e1.salary < (select max(salary) from employees as e2 where e2.dept_id = e1.dept_id);

-- 91) nth highest salary using cte
with ntth as (
select salary,
dense_rank() over(order by salary desc) as densee from employees
)
select salary from ntth where densee = 7;

-- 92) employee with salary > manager salary
select e.employee_id as Empid,e.first_name as Empname,m.manager_id as Mangername,m.first_name as Managername
from employees as e
join employees as m
on e.salary > m.salary;

-- 93)get employee with max salary per dept
select dept_id,max(salary) from employees
group by dept_id;


-- 94)identify gaps in dates (missing dates)
select t1.order_date + interval 1 day from orders as t1
join orders as t2
on t1.order_date = t2.order_date - interval 1 day
where t2.order_date is null;

-- 95)calculate no.of active days per user
select user_id,count(distinct login_date) from logins
group by user_id;

-- 96)users who placed 2 + orders with 10 minute
select o1.user_id from orders as o1
join orders as o2
on o1.user_id = o2.user_id and
o2.order_time between o1.order_time and o1.order_time + interval 10 minute
group by o1.user_id,o1.order_time
having count(*) >= 2;

-- 97)calculate week-over-week or month-over-month change
select year(sale_date)as yn,week(sale_date) as wn,sum(sale_amount),
lag(sum(sale_amount)) over(order by year(sale_date),week(sale_date)) as prev,
sum(sale_amount) - lag(sum(sale_amount)) over(order by year(sale_date),week(sale_date))/
lag(sum(sale_amount)) over(order by year(sale_date),week(sale_date))*100 as pct from sales
group by yn,wn;


-- 98)cumulative sum(partitioned by user/date)
select user_id,created_at,
sum(amount) over(partition by user_id order by created_at) as cumulative_sum from users;


-- 99)percentile salary per department
select dept_id,salary,
percent_rank() over(partition by dept_id order by salary) as pck from employees;

-- 100)rank/row_number/dense_rank by group
select dept_id,salary,
rank() over(partition by dept_id order by salary desc) as rnk,
row_number() over(partition by dept_id order by salary desc) as rn,
dense_rank() over(partition by dept_id order by salary desc) as dense from employees;

-- 101) Lead/Lag to compare useractions over time
select user_id,created_at,
lag(created_at) over(partition by user_id order by created_at) as prev_action,
lead(created_at) over(partition by user_id order by created_at) as naext_action from users
group by user_id,created_at;

-- 102) self join manager - employee hierarchy
select e.first_name,m.first_name from employees as e
join employees as m
on e.manager_id = m.employee_id;

-- 103) join across 3+ tables with alising like cust-payment-order
select c.customer_id,c.name,o.total_amount,o.order_date,p.payment_method,p.payment_date from customers as c
left join orders as o
on c.customer_id = o.customer_id
left join payments as p
on o.order_id = p.order_id;

-- 104)find customer who bought productA but not productB
select customer_id from orders
where product = 'A' and customer_id not in (select customer_id from orders where product = 'B');

-- 105)write query to retrive employee who joined in last 30 days
select* from employees
where hire_date >= curdate() - interval 30 day;

-- 106)write query to update salary of all employee by 10%
update employees
set salary = salary * 1.10;

select * from employees;

-- 107)find 2nd highest transaction per user without using limit
select user_id,max(amount) as sec_high from transactions as u1
where amount < (select max(amount) from transactions as u2 where u2.user_id = u1.user_id);

-- 108)fetch first purchase date per user and calculate days since then
select user_id,min(dates) as first_purchase,
datediff(min(dates),curdate()) from users
group by user_id;


-- 109)join product and transaction table and filter out null fk safely
select p.product_name,t.transaction_amount from products as p
left join transactions as t
on p.product_id = t.product_id
where t.product_id is not null;

-- 110)calculate cumulative distinct product purchase per cust
select customer_id,order_date,
count(distinct product_id) over(order by order_date) as cumulative from customers
group by customer_id;


-- 111)write query to calculate the cumulative sum of sales for each employee.the query should return empid,salesdate,
-- and cumulativesales column with final output ordered by empid
select employee_id,s.sale_date,
sum(sale_amount) over(partition by employee_id order by s.sale_date) as cumulativee from employees
order by employee_id;

-- 112)identify top-selling product in each category
select c.category_id,p.product_id,sum(p.price) as top_selling from products as p
join categories as c
on p.category_id = c.category_id
group by c.category_id,p.product_id
having sum(p.price) = (select max(sum(price)) from products as p1 where p1.category_id = c.category_id);


-- 113)find repeat customers in last 3 monts
select customer_id from orders
where order_date >= curdate() - interval 3 month
group by customer_id
having count(*) > 1;

-- 114)how do you pivot data in mysql
select customer_id,
sum(case when status = 'Completed' then order_date else 0 end) as pivot1,
sum(case when status = 'Pending' then order_date else 0 end) as pivot2 from orders
group by customer_id;

-- 115)how do you find nth highest salary without using rank()
select salary from employees
where 4-1 = (select count(distinct salary) from employees as e1 where employees.salary > e1.salary);

-- 116)how to select only even rows (row_number)
select * from (
select employees.*,
row_number() over() as rnk from employees
) as t
where rnk%2=0;

-- 117)how to get coomon record from two tables
select * from employees
union 
select * from employees;

-- 118)how to find youngest employees in organization
select * from employees
order by age asc
limit 1;

select * from(
select age,
row_number() over(order by age) as rnk from employees
) as t
where rnk = 1;

-- 119)write query to display emp name and hiredate in format "NAME - MM/DD/YYYY"
select concat(first_name,' ','-',' ',month(hire_date),'/',day(hire_date),'/',year(hire_date))as name_format FROM employees;

-- 120)write query to display emp grouped by salary range (0-20k , 20k-50k)
select first_name,
case
when salary between 0 and 20000 then '0 - 20k'
when salary between 20001 and 50000 then '20k - 50k'
else '50k +'
end as salary_range
from employees;

-- 121)how to list all emp who dont have a bonus
select * from employees
where bonus is null or bonus = 0;

-- 122)write query to find 2nd highest salary in each dept
select d.dept_name,max(salary) from employees as ee
left join departments as d
on ee.dept_id = d.dept_id
where salary < (select max(salary) from employees as e where ee.dept_id = e.dept_id)
group by d.dept_name;

-- 123)retrive all orders placed btn 9:00am to 5:00pm
select * from orders
where hour(order_date) between 9 and 17;

-- 124)write query to display the highest,lowest,and avg salary for each job role
select d.dept_name,
max(salary) as Highest_salary,
min(salary) as lowest_salary,
round(avg(salary),2) as average_salary
from employees
join departments as d
on employees.dept_id = d.dept_id
group by d.dept_name;

-- 125)calculate the cumulative sales by month
select month(sale_date) as monthh,
sum(sale_amount) over(order by month(sale_date)) from sales;

-- 126)write query to identify emp assigned to more than one dept
select employee_id,dept_id from employees
group by employee_id
having count(distinct dept_id) > 1;


-- 127)count no.of order with discount in each category
select category_id,count(order_id) from orders
where discount > 0
group by category_id;

-- 128)find most popular product in each category based on sales
select category_id,product_name,max(sale_amount) from sales
group by category_id,product_name
order by sale_amount desc;

-- 129) how to find emp whose salary is in top 10%
select * from (select first_name,salary,
percent_rank() over(order by salary desc) as pnk from employees ) as t
where pnk >= 0.1;


-- 130) write query to calculate rolling avg sales for each days over the past 7 days
select sale_date,sale_amount,
avg(sale_amount) over(order by sale_date rows between 6 preceding and current row) as rolling_avg7 from sales;

-- 131)identify dates where no sales were recorded for each product in sale table
select product_id,d.dates from products as p
cross join dates as d
left join sales as s
on p.product_id = s.product_id and d.dates = s.sale_date
where s.sale_date is null;



-- 132) write query to display the name for those employee who get more salary than emp whose id is 103
select first_name,last_name from employees
where salary > (select salary from employees where employee_id = 3);

-- 133) write query to display name,salary,dept_id,job_id for those employees who works in the same designation as
-- the employee works whose id is 169
select first_name,last_name,salary,dept_id,job_id from employees
where job_id in (select job_id from employees where employee_id = 169);

-- 134) write query to display the name,salary,department_id for those employees who earn such amount of
-- salary which is smallest salary of any department
select first_name,last_name,salary,dept_id from employees
where salary in (select min(salary) from employees
group by dept_id);


-- 135)write query to display emp_id,name for all employees who earn more thanaverage salary
select employee_id,first_name,last_name from employees
where salary > (select avg(salary) from employees);

-- 136)write query to display name,empid,salary of all emp who report to john
select first_name,last_name,employee_id,salary from employees
where manager_id = (select manager_id from employees where first_name = 'john');

-- 137)write query to display the dept_id,name,dept_name for all employees in Finance department
select e.dept_id,e.first_name,e.last_name,d.dept_name from employees as e,departments as d
where e.dept_id = d.dept_id and d.dept_name = 'Finance';

-- 138)write query to display all information of an emp whose salary and reporting personid is 300 and 121 respectively
select * from employees
where (salary,manager_id) = (select salary,manager_id from employees where manager_id in (300,121));

-- 139)display all information of an emp whose empid is any of number 1,3 and 2
select * from employees
where employee_id in (1,3,2);

-- 140)write query to display all information of emp whose salary is within range 1000 and 30000
select * from employees
where salary between 1000 and 30000;


-- 141)write query to display all information of emp whose salary is within range of smallest salary and 25000
select * from employees
where salary between (select min(salary) from employees) and 25000;

-- 142)write query to display all information of employees who doesnt work those department where some emp work whose
-- manager_id within range 1 and 13
select * from employees
where dept_id not in (select dept_id from employees where manager_id between 1 and 13);

-- 143)write query to display all information for those emp whose id is any id who earn second highest salary
select * from employees
where employee_id in (select employee_id from employees 
where salary = (select max(salary) from employees where salary < (select max(salary) from employees)));

-- 144)write query to display name and hiredate for all emp in same department as clara .exclude clara
select first_name,last_name,hire_date from employees
where dept_id in (select dept_id from employees where first_name = 'clara') and first_name <> 'clara';

-- 145)write query to display empid,name of all emp who work in department with any emp whose name contain t
select employee_id,first_name,last_name from employees
where dept_id in (select dept_id from employees where first_name like '%T%');

-- 146)write query to display empid,name,salary for all emp who earn more thna avg salary and who work in deptartment
-- with any employee with J name
select employee_id,first_name,last_name,salary from employees
where salary > (select avg(salary) from employees where dept_id in (
select dept_id from employees
where first_name like '%J%'));

-- 147)display name,empid,job_title from all emp whose department location is toronto
select first_name,employee_id,job_title from employees
where dept_id = (select dept_id from employees where location_id = (select location_id from location where
city = 'Toronto'));

-- 148)write query to display emid,name,job_title for all emp whose salary is smaller than any salary of those emp 
-- whose job_title is MK_MAN
select employee_id,first_name,last_name,job_title from employees
where salary < any (select salary from employees where job_title = 'MK_MAN');

-- 149)write query to display empid,name,job_title for all emp whose salary is smaller than any salary of those emp 
-- whose job_title is MK_MAN.exclude job_title MK_MAN
select employee_id,first_name,last_name,job_title from employees
where salary < any (select salary from employees where job_title = 'MK_MAN') and job_title <> 'MK_MAN';


-- 150)write query to display empid,name,and jobtitle for all emp whose salary is more than any salary of those
-- employee whose jotitle is pu_man . exclude jobtitle pu_man
select employee_id,first_name,last_name,jobtitle from employees
where salary > all (select salary from employees where jobtitle = 'pu_man') and jobtitle = 'pu_man';

-- 151)write query to display empid,name and jobtitle for all emp whose salary is more than any avg salary of any dept
select employee_id,first_name,last_name,jobtitle from employees
where salary > all (select avg(salary) from employees group by dept_id);

-- 152)write query to display name,department for all emp for any existence of those emp whose salary is more than 3700
select first_name,last_name,dept_id from employees
where exists (select * from employees where salary > 3700);

-- 153)write query to display dept_id and total salary of those dept which contain least one emp
select d.dept_id,result.total_amount from departments,
(select e.dept_id,sum(salary) from employees group by e.dept_id) as result
where result.dept_id = d.dept_id;

-- 154)write query to display empid,name,jobid column with modified title 'salesman' for those emp whose jobtitle
-- is st_man and developer for whose jobtitle is it_prog
select employee_id,first_name,last_name,
case
when jobtitle = 'st_man' then 'salesman'
when jobtitle = 'it_prog' then 'developers'
else jobid
end as dept_name,salary from employees;


-- 155)write query to display empid,name,salary and 'salarystatus' column with title high and low respectively for those
-- emp whose salary more than and less than avg salary from employees
select employee_id,first_name,last_name,salary,
case
when salary >= (select avg(salary) from employees) then 'high'
else 'low'
end as salarystatus from employees;

-- 156) write query to display empid,name,salary as salarydrawn,avgcompare (salary - the avg salary of all emp) and 
-- salarystatus column with title 'High' and 'low' respectively for those emp who salary is more than and less than
-- avg salary from emp
select employee_id,first_name,last_name,salary as salarydrawn,
round(salary - (select avg(salary) from employees),2) as avgcompare,
case
when salary >= (select avg(salary) from employees) then 'high'
else 'low'
end as salarystatus from employees;

-- 157)write query to find top 5 clients with highest project billing in last quarter
select client_id,sum(amount) as billing_amount from project
where project_date >= curdate() - interval 3 month
group by client_id
order by billing_amount desc
limit 5;

-- 158)identify emp who worked on both domestic and international project
select project_id from project
group by project_id
having count(distinct project_location) = 2;

-- 159)retrive project that exceeded their planned budget by more than 15%
select project_id from project
where actual_budget > planned_budget * 1.15;

-- 160)find average project duration(in days) by industry domain like healthcare,reatil
select domain,avg(datediff(end_date,start_date)) as avg_duration from project
group by domain;

-- 161)identify emp who have logged more than 180 hours in any month during current year
select employee_id from time_sheet
where extract(year from log_date) = extract(year from curdate())
group by employee_id,date_trunc('month',log_date)
having sum(total_hour) > 180;


-- 162)retrive top 3 country generting highest billin for tcs in last financial year
select country,sum(amount) as total_revenue from ptoject
where project_date >= date_trun(year,curdate) - interval 1 year
group by country
order by total_revenue desc
limit 3;



-- 163)find project that used mor then 3 different technology
select project_id from project
group by project_id
having count(distinct project_technology) > 3;

-- 164)write query to find clients who started new project in each of last 3 quarter
select clent_id from project
group by clent_id
having count(quarter(date)) = 3;


-- 165)identify project manager who handleed more than 5 active project at same time
select manager_id from project
where status = 'active'
group by manager_id
having count(distinct project_id) > 5;


-- 166)retrive eclient whose total billing contribution is above avg client billing
select client_id from billing
group by client_id
having sum(amount) > (select avg(total_amount) from (select sum(amount) as
 total_amount from employees group by client_id) as t
);



There are 166 questions are here.... 


