use dailypractice;

-- Get the count of employees in each department.
select department,count(*) from employee
group by department;

-- Show average salary in each department.
select department,avg(salary) from employee
where department is not null and salary is not null
group by department;

-- Find total salary by department.
select department,sum(salary) from employee
where department is not null and salary is not null
group by department;

-- Find max salary in each department.
select department,max(salary) from employee
where department is not null and salary is not null
group by department;

-- Show min age of employees by department.
select department,min(age) from employee
where department is not null and age is not null
group by department;

-- Count number of employees in each city.
select city,count(*) from employee
group by city;

-- Count total orders placed by each customer.
select custid,count(*) from orders
group by custid;

-- Get average order amount per customer.
select custid,avg(quantity) from orders
group by custid;

-- Find total quantity of products ordered by each customer.
select custid,sum(quantity) from orders
group by custid;

-- Show product-wise total quantity sold.
select prodid,sum(quantity) from orders
group by prodid;

-- Show product-wise total sales value.
select prodid,sum(quantity) from orders
group by prodid;

-- Calculate average order value for each product.
select prodid,avg(price) from products
group by prodid;


-- Count total orders placed in each month.
select order_date,count(*) from orders
group by order_date;

-- Total revenue by region (from Sales table).
-- Show total quantity sold per product.
select product,sum(quantity) from sales
group by product;

-- Show total quantity sold per region.
select region,sum(quantity) from sales
group by region;

-- Show total quantity sold per category.
select category,sum(quantity) from sales
group by category;

-- Find number of times each product was sold.
select product,count(*) from sales
group by product;

-- Show average price per product.
select product,avg(price) from sales
group by product;

-- Show maximum price per product.
select product,max(price) from sales
group by product;

-- Show minimum price per product.
select product,min(price) from sales
group by product;

-- Count how many products exist in each category.
select product,category,count(*) from sales
group by product,category;

-- Find average quantity sold per region.
select region,avg(quantity) from sales
group by region;

-- Find total revenue per product.
select product,sum(price) from sales
group by product;

-- Find total revenue per category.
select category,sum(price) from sales
group by category;

-- Show product-wise total revenue, sorted by revenue descending.
select product,sum(price) from sales
group by product
order by sum(price) desc;

-- Find category-wise minimum selling price.
select category,min(price) from sales
group by category;

-- Show region-wise number of products sold.
select region,count(product) from sales
group by region;

-- Find region-wise average revenue.
select region,avg(price) from sales
group by region;

-- Show each product with total quantity > 5.
select product,sum(quantity) from sales
group by product
having sum(quantity) > 5;

-- Show each category with total sales > ₹10000.
select category,sum(price) from sales
group by category
having sum(price) > 50000;

-- List categories having more than 3 products sold.
select category,count(product) from sales
group by category
having count(product) > 3;

-- Display products having average price > ₹15000.
select product,avg(price) from sales
group by product
having avg(price) > 15000;

-- Find region and category pairs with total revenue.
select region,category,sum(price) from sales
group by region,category;

-- Products sold more than 2 times.
select product,count(*) from sales
group by product
having count(*) > 2;

-- Products with total quantity > 10.
select product,sum(quantity) from sales
group by product
having sum(quantity) > 10;

-- Regions where total quantity sold > 15.
select region,sum(quantity) from sales
group by region
having sum(quantity) > 15;

-- Categories with average price > ₹20000.
select category,avg(price) from sales
group by category
having avg(price) > 20000;

-- Show only those products whose revenue > ₹50000.
select product,sum(price*quantity) from sales
group by product
having sum(price*quantity) > 50000;


-- List categories with total sale value < ₹20000.
select category,sum(price) from sales
group by category
having sum(price) < 20000;

-- Show regions with average quantity sold > 2.
select region,avg(quantity) from sales
group by region
having avg(quantity) > 2;

-- Show products having price range (MAX-MIN) > ₹10000.
select product,sum(price) from sales
group by product
having sum(price) > 10000
order by sum(price) desc;

-- Show region-wise product count > 2.
select region,count(product) from sales
group by region
having count(product) > 2;

-- List categories where min price > ₹10000.
select category,min(price) from sales
group by category
having min(price) > 10000;

-- Show products sold in more than one region.
select region,count(product) from sales
group by region
having count(product) > 1;

-- Find products whose average price ≠ max price.
select product,avg(price),max(price) from sales
group by product
having avg(price) != max(price);

-- List categories with max price > ₹50000.
select category,max(price) from sales
group by category
having max(price) > 50000;

-- Find all products where min price < ₹5000.
select product,min(price) from sales
group by product
having min(price) < 5000;

-- Region-category pairs where total quantity > 20.
select region,category,sum(quantity) from sales
group by region,category
having sum(quantity) > 20;

-- Product-wise count and total revenue.
select product,count(product),sum(price*quantity) from sales
group by product;

-- Region-wise product sales where count > 3.
select region,count(product) from sales
group by region
having count(product) > 3;

-- show category-wise products with average price > ₹25000.
select category,avg(price) from sales
group by category
having avg(price) > 25000;

-- Show product count and revenue where product sold > 3 times.
select product,count(*),sum(price*quantity) from sales
group by product
having count(*) > 3;

-- Products whose total quantity sold is even (hint: HAVING SUM(quantity) % 2 = 0)
select product,sum(quantity) from sales
group by product
having sum(quantity) %2 = 0;

-- Region-wise revenue of each category.
select category,region,sum(price*quantity) from sales
group by category,region;

-- Product-wise revenue per month.
select month(saledate),product,sum(price*quantity) from sales
group by month(saledate),product;

-- Monthly sales quantity per region.
select region,month(saledate),count(quantity) from sales
group by region,month(saledate);

-- Yearly revenue per category.
select year(saledate),category,sum(price*quantity) from sales
group by year(saledate),category;


-- Total sale per product and region combination.
select product,region,sum(price) from sales
group by product,region;

-- Region-category pairs with average price > ₹18000.
select region,category,avg(price) from sales
group by region,category
having avg(price) > 18000;

-- List categories where revenue per product > ₹30000.
select product,category,sum(price*quantity) from sales
group by product,category
having sum(price*quantity) > 30000;

-- Products with highest revenue in each region.
select region,product,max(price*quantity) from sales
group by region,product;


-- Most frequently sold product in each region.
select region,count(product) from sales
group by region;


-- Category-wise min and max prices.
select category,min(price),max(price) from sales
group by category;

-- Category-wise products with lowest revenue.
select category,min(price*quantity) from sales
group by category;

-- Top 3 products by revenue.
select product,sum(price*quantity) from sales
group by product
limit 3;

-- Top 3 regions by sales price.
select region,sum(price) from sales
group by region
limit 3;

-- Show region-product pairs with total revenue > ₹50000.
select region,product,sum(price*quantity) from sales
group by region,product
having sum(price*quantity) > 50000;

-- Count of distinct products per region.
select region,count(distinct product) from sales
group by region;

-- Products sold in exactly 3 different regions.
SELECT product FROM sales
GROUP BY product
HAVING COUNT(DISTINCT region) = 2;

-- Average monthly sales per category.
select category,month(saledate),avg(price*quantity) from sales
group by category,month(saledate);


-- Products where revenue is more than average revenue.
select product,sum(price*quantity) from sales
group by product
having sum(price*quantity) > avg(price*quantity);

-- Region with most categories sold.
SELECT region, COUNT(DISTINCT category) AS category_count
FROM sales
GROUP BY region
ORDER BY category_count DESC
LIMIT 1;















































































