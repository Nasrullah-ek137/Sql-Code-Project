-- Select all columns from Employees.
use dailypractice;
select * from employee;

-- Select only emp_name and salary from Employees.
select empid,empname,salary from employee;

-- Select product_name and price from Products.
select prodname,price from products;

-- Select all records from Customers where country = 'India'
select * from customers
where country = 'India';

-- Get all employees who live in 'Mumbai'.
select * from employee
where city = 'Mumbai';

-- Select all customers whose age > 30.
select * from customers 
where age > 30;

-- Get employees with salary less than 50,000.
select * from employee
where salary < 50000;

-- Get products with price >= 1000.
select prodname,price from products
where price >= 1000;

-- Get customers who live in 'Delhi' and are older than 25.
select * from customers
where city = 'Delhi' and age > 25;

-- Get employees from ‘Sales’ department.
select * from employee
where department = 'Sales';

-- Get all products where stock is not zero.
select * from products
where stock is not null;

-- Find employees who joined after '2022-01-01'.
select * from employee
where join_date > '2022-01-01';

-- Get orders placed on '2023-04-15'.
select * from orders
where order_date = '2023-04-15';

-- Select customers not from 'India'.
select * from customers
where country <> 'India';

-- Get employees whose age is not 30.
select * from employee
where age <> 30;

-- Get products that are in 'Electronics' category.
select * from products
where category in('Electronics');

-- Find customers aged between 20 and 40.
select * from customers
where age > 20 and age < 40;

-- Get products priced between 500 and 1500.
select * from products
where price between 500 and 1500;

-- Get all employees from 'IT' or 'Finance' department.
select * from employee
where department in('IT','Finance');

-- Get customers from 'Mumbai' or 'Delhi'.
select * from customers
where city = 'Mumbai' or city = 'Delhi';

-- Select employees not from ‘HR’ department.
select * from employee
where department != 'HR';

-- Select all products that are not in ‘Grocery’.
select * from products
where category <> 'Grocery';

-- Get orders placed before '2024-01-01'.
select * from orders
where order_date < '2024-01-01';

-- Find all customers whose age is not null.
select * from customers
where age is not null;

-- Find all products where price is not null.
select * from products
where price is not null;

-- Get all employees ordered by salary ascending.
select * from employee
order by salary asc;

-- Get all products ordered by price descending.
select * from products
order by price desc;

-- Get employees ordered by age descending.
select * from employee
order by age desc;

-- Get top 5 highest-paid employees.
select * from employee
order by salary desc
limit 5;

-- Get 10 most recent customers by created_at.
select * from customers
order by created_at desc
limit 10;

-- Get 3 cheapest products by price.
select * from products
order by price asc
limit 3;

-- Get top 10 most expensive products.
select * from products
order by price desc
limit 10;

-- Get 2 youngest employees.
select * from employee
where age is not null
order by age asc
limit 2;

-- Get 5 oldest customers.
select * from customers
where age is not null
order by age desc
limit 5;

-- Get top 7 employees by joining date (latest first).
select * from employee
where join_date is not null
order by join_date desc
limit 7;

-- Get products ordered by category and then by price.
select * from products
order by category,price;

-- Get customers ordered by country, then by age.
select * from customers
order by country,age;

-- Get top 1 customer with the highest age.
select * from customers
order by age desc
limit 1;

-- Get bottom 5 employees by salary.
select * from employee
order by salary asc
limit 5;

-- Get top 5 orders placed most recently.
select * from orders
order by order_date desc
limit 5;

-- List employees alphabetically by name.
select * from employee
order by empname asc;

-- Get products sorted alphabetically by product name.
select * from products
order by prodname asc;

-- Get all customers ordered by city name A-Z.
select * from customers
order by city asc;

-- Get products ordered by price, then stock.
select * from products
order by price,stock asc;


-- Get 3 employees with least experience (by join_date).
select * from employee
order by join_date asc
limit 3;

-- Get 4 highest quantity orders.
select * from orders
order by quantity desc
limit 4;

-- Get 6 oldest employees.
select * from employee
order by join_date asc
limit 6;

-- Get 10 most recently joined employees.
select empid,empname,join_date from employee
order by join_date desc
limit 10;

-- Get 8 most recently created customers.
select custid,custname,created_at from customers
order by created_at desc
limit 8;

-- Get 5 employees with lowest salary.
select empname,salary from employee
order by salary asc
limit 5;

-- Select distinct departments from Employees.
select distinct department from employee;

-- Get unique cities from Customers.
select distinct city from customers
where city is not null;

-- Select distinct product categories.
select distinct category from products;

-- Get all customers where city is NULL.
select * from customers
where city is NULL;

-- Get products where category is NULL.
select * from products
where category is null;

-- Get employees whose salary is NOT NULL.
select * from employee
where salary is not null;

-- Find orders where product_id is NULL.
select * from orders
where prodid is null;

-- Get employees with a NULL department.
select * from employee
where department is null;

-- Get customers with NULL country.
select * from customers
where country is null;

-- Get distinct age values from Customers.
select distinct age from customers;

-- Get all products with non-null stock values.
select * from products
where stock is not null;

-- Find all orders with both cust_id and product_id NOT NULL.
select * from orders
where custid is not null and prodid is not null;

-- Find customers where any data is NULL.
select * from customers as find
where custid is null or custname is null or country is null or city is null or age is null or created_at is null;

-- Find employees with any missing info (NULL field).
select * from employee
where empid is null or empname is null or department is null or salary is null or age is null or city is null or join_date is null;

-- Select all distinct countries from Customers.
select distinct country from customers;


-- Get top 5 products in ‘Electronics’ by price.
select * from products
where category = 'Electronics'
order by price asc
limit 5;

-- Get 10 customers from 'India' ordered by age descending.
select * from customers
where country = 'India'
order by age desc
limit 10;

-- Get 3 employees from 'IT' department with highest salary.
select * from employee
where department = 'IT'
order by salary desc
limit 3;

-- Get all employees from 'HR' ordered by join_date.
select * from employee
where department = 'HR'
order by join_date;

-- Get 5 most expensive ‘Grocery’ items.
select prodname,category,price from products
where category = 'Grocery'
order by price desc
limit 5;

-- Get all customers older than 35 and from ‘Delhi’.
select * from customers
where age > 35 and city = 'Delhi';

-- Get products with price between 100 and 500, sorted by price.
select * from products
where price between 1000 and 5000
order by price;

-- Get employees under age 25, ordered by salary.
select empname,age,salary from employee
where age < 25
order by salary;

-- Get customers from ‘Mumbai’ with age between 20 and 30.
select * from customers
where city = 'Mumbai' and age between 20 and 30;

-- Get top 3 oldest customers in ‘India’.
select * from customers
where country = 'India'
order by age desc
limit 3;

-- Get all ‘Electronics’ products where stock is above 100.
select * from products
where category = 'Electronics' and stock >= 100;

-- Get 10 orders with highest quantity.
select * from orders
order by quantity desc
limit 10;


-- Get products with NULL category or price.
select * from products
where category is null or price is null;

-- Get 5 employees whose department is NULL.
select * from employee
where department is null
limit 5;

-- Get customers created after '2023-01-01', sorted by name.
select * from customers
where created_at > '2023-01-01'
order by custname;

-- Get top 3 cities with most customers (use COUNT + GROUP BY).
select city,count(*) from customers
group by city
limit 3;

-- Get customers with duplicate names (use COUNT > 1).
select custname,count(*) from customers
group by custname
having count(*) > 1;

-- Get employees joined in 2023 only.
select join_date from employee
where join_date between'2023-01-01' and '2023-12-31';

-- Get products with stock between 1 and 10.
select * from products
where stock between 1 and 10;

-- Get employees with salary more than 1 lakh.
select * from employee
where salary > 100000;

-- Get products not in ‘Grocery’ or ‘Electronics’.
select * from products
where category <> 'Grocery' and category <> 'Electronics';

-- Get customers with name starting with ‘S’.
select * from customers
where custname like 'S%';

-- Get all orders made in January 2024.
select * from orders
where order_date between '2024-01-01' and '2024-01-31';

-- Get top 5 oldest employees whose department is not NULL.
select * from employee
where department is not null
order by age desc
limit 5;

-- Get the most recently added product (based on ID or date).





























































































































































