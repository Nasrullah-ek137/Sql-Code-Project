use joins;

-- Table: Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Amit', 'Mumbai'),
(2, 'Rahul', 'Delhi'),
(3, 'Sneha', 'Pune'),
(4, 'Priya', 'Bangalore'),
(5, 'Arjun', 'Hyderabad');

-- Table: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO Orders VALUES
(101, 1, '2023-08-01', 1500),
(102, 2, '2023-08-02', 2500),
(103, 1, '2023-08-05', 1800),
(104, 4, '2023-08-10', 2200),
(105, 6, '2023-08-12', 3000); -- Note: customer_id = 6 does not exist in Customers

-- Table: Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1, 'Laptop', 50000),
(2, 'Mouse', 500),
(3, 'Keyboard', 1000),
(4, 'Monitor', 7000);

-- Table: OrderDetails
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO OrderDetails VALUES
(101, 1, 1),
(101, 2, 2),
(102, 2, 1),
(102, 3, 1),
(103, 4, 1),
(104, 1, 1),
(106, 3, 2); -- Order ID 106 does not exist in Orders



-- Show all customers who have placed orders.
select c.customer_name,o.order_id from customers as c
inner join orders as o
on c.customer_id = o.customer_id;


-- List all order IDs along with customer names and order amounts.
select o.order_id,c.customer_name,o.amount from orders as o
inner join customers as c
on o.customer_id = c.customer_id;

-- Show all order details with product names and quantity.
select p.product_name,o.quantity from products as p
inner join orderdetails as o
on p.product_id = o.product_id;

-- Display order IDs with total price (price × quantity) using Products and OrderDetails.
select o.order_id,sum(p.price*o.quantity) as Total_price
from orderdetails as o
inner join products as p
on o.product_id = p.product_id
group by o.order_id;


-- Get all orders along with customer name and city, only if the customer exists.
select o.order_id,c.customer_name,c.city from customers as c
inner join orders as o
on c.customer_id = o.customer_id;

-- List all customers and their orders (if any).
select c.customer_name,o.order_id from customers as c
left join orders as o
on c.customer_id = o.customer_id;

-- Show all orders and their order details, even if some details are missing.
select * from orders
left join orderdetails
on orders.order_id = orderdetails.order_id;

-- Display all customers along with their total order amount (if any), show NULL if no orders.
select c.customer_id,c.customer_name,sum(o.amount) from customers as c
left join orders as o
on c.customer_id = o.customer_id
group by c.customer_id;

-- Find customers who haven’t placed any orders.
SELECT c.customer_id, c.customer_name
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- List all products and how many times they were ordered, including products never ordered.
select p.product_name,count(o.product_id) from products as p
right join orderdetails as o
on p.product_id = o.product_id
group by p.product_name;

-- Display all order details with product name and price, even if product details are missing.
select o.order_id,p.product_name,p.price from orderdetails as o
right join products as p
on o.product_id = p.product_id;

-- List all orders with or without matching customers.
SELECT * FROM Customers AS c
RIGHT JOIN Orders AS o
ON c.customer_id = o.customer_id;

-- Find orders which have no matching customers.
SELECT o.order_id, o.customer_id
FROM Orders AS o
LEFT JOIN Customers AS c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Find products that were never ordered.
SELECT p.product_id, p.product_name FROM Products AS p
LEFT JOIN OrderDetails AS od
ON p.product_id = od.product_id
WHERE od.product_id IS NULL;

-- Get customers who placed more than 1 order
select c.customer_name,count(o.order_id) from customers as c
left join orders as o
on c.customer_id = o.customer_id
group by c.customer_name
having count(o.order_id) > 1;

-- For each customer, list total number of orders and total amount.
select c.customer_name,count(o.order_id),sum(o.amount) from customers as c
inner join orders as o
on c.customer_id = o.customer_id
group by c.customer_name;

-- For each product, show total quantity sold and total revenue.
select p.product_name,sum(oo.quantity),sum(o.amount*oo.quantity) from products as p
right join orderdetails as oo
on p.product_id = oo.product_id
right join orders as o
on oo.order_id = o.order_id
group by p.product_name;

-- List top 3 customers by total spending.
select c.customer_name,sum(o.amount) from orders as o
inner join customers as c
on o.customer_id = c.customer_id
group by c.customer_name
order by sum(o.amount) desc
limit 3;

-- List top 2 products by quantity sold.
select p.product_name,sum(o.quantity) from orderdetails as o
inner join products as p
on o.product_id = p.product_id
group by p.product_name
order by sum(o.quantity) asc
limit 2;

-- Find the order with the highest total value.
select oo.order_id,sum(o.amount) from  orderdetails as oo
right join orders as o
on oo.order_id = o.order_id
group by oo.order_id;

-- Find the top 3 products with the highest total revenue.
select p.product_name,sum(p.price*o.quantity) as Total_Revenue
from products as p
right join orderdetails as o
on p.product_id = o.product_id
group by p.product_name
order by sum(p.price*o.quantity) desc
limit 3;

-- List all customers who have spent more than ₹3,000 in total.
select c.customer_name,sum(o.amount) from customers as c
right join orders as o
on c.customer_id = o.customer_id
group by c.customer_name
having sum(o.amount) > 3000;

-- Show product names that were ordered more than 1 times in total.
SELECT p.product_name, SUM(o.quantity) AS total_quantity FROM orderdetails as o
left join products as p
on o.product_id = p.product_id
GROUP BY product_name
HAVING SUM(quantity) > 1;

-- List customers who ordered more than 3 different products.
SELECT o.customer_id FROM orders o
JOIN orderdetails od ON
o.order_id = od.order_id
GROUP BY o.customer_id
HAVING COUNT(DISTINCT od.product_id) > 3;

-- Find the average order amount per customer.
select c.customer_name,avg(o.amount) from orders as o
inner join customers as c
on o.customer_id = c.customer_id
group by c.customer_name;

-- Show the product with the lowest total quantity sold.
select p.product_name,sum(o.quantity) from orderdetails as o
inner join products as p
on o.product_id = p.product_id
group by p.product_name
order by sum(o.quantity) asc
limit 1;

-- Get the customer who placed the most orders.
select c.customer_id,count(o.customer_id) from orders as o
inner join customers as c
on o.customer_id = c.customer_id
group by c.customer_id;

-- List customers who never ordered the same product twice.
select c.customer_name,count(o.order_id) from orders as o
inner join customers as c
on o.customer_id = c.customer_id
group by c.customer_name
having count(o.order_id) < 2;

-- Find products that were only ordered once.
select p.product_id,count(o.product_id) from orderdetails as o
left join products as p
on o.product_id = p.product_id
group by p.product_id
having count(o.product_id) =1;

create database join2;

use join2;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    unit_price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Customers
INSERT INTO Customers VALUES 
(1, 'Ayaan Khan', 'Mumbai'),
(2, 'Riya Sharma', 'Delhi'),
(3, 'Mohit Verma', 'Bangalore'),
(4, 'Sana Sheikh', 'Hyderabad'),
(5, 'Vikram Joshi', 'Chennai');

-- Products
INSERT INTO Products VALUES 
(1, 'Laptop', 55000.00),
(2, 'Smartphone', 30000.00),
(3, 'Tablet', 20000.00),
(4, 'Headphones', 5000.00),
(5, 'Monitor', 15000.00);

-- Orders
INSERT INTO Orders VALUES 
(101, 1, '2025-06-01'),
(102, 2, '2025-06-02'),
(103, 1, '2025-06-10'),
(104, 3, '2025-06-15'),
(105, 5, '2025-06-20');

-- OrderDetails
INSERT INTO OrderDetails VALUES 
(1001, 101, 1, 1),
(1002, 101, 2, 2),
(1003, 102, 2, 1),
(1004, 103, 3, 1),
(1005, 104, 4, 3),
(1006, 105, 1, 1),
(1007, 105, 5, 2);

-- Find total revenue per customer (revenue = quantity × unit_price).
SELECT c.customer_name, SUM(od.quantity * p.unit_price) AS total_revenue
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN orderdetails AS od ON o.order_id = od.order_id
JOIN products AS p ON od.product_id = p.product_id
GROUP BY c.customer_name;

-- List top 2 customers by total spending.
SELECT c.customer_name, SUM(od.quantity * p.unit_price) AS total_spending
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN orderdetails AS od ON o.order_id = od.order_id
JOIN products AS p ON od.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spending DESC
LIMIT 2;

-- Show products that were ordered in more than 2 different orders.
SELECT p.product_name, COUNT(DISTINCT o.order_id) AS num_orders
FROM products AS p
JOIN orderdetails AS o ON p.product_id = o.product_id
GROUP BY p.product_name
HAVING COUNT(DISTINCT o.order_id) > 2;

-- List customers who ordered both Laptop and Smartphone.
select c.customer_name,






